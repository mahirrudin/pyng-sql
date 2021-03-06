#!/usr/bin/env python
# traceroute a list of host with threads for increase speed
# use standard linux /usr/bin/traceroute | /bin/traceroute utility

from threading import Thread
import os
import subprocess
import Queue
import re
import pymysql.cursors

# some global vars
num_threads = 30
ips_q = Queue.Queue()
out_q = Queue.Queue()

# connection to the database
# change your credential access for database
connection = pymysql.connect(
        host = 'localhost',
        user = 'usrping',
        password = 'usrping',
        db = 'dbping',
        cursorclass = pymysql.cursors.DictCursor)

# build IP array
ips = []

with connection.cursor() as cursor:
    sql = "SELECT ipv4 FROM destination"
    cursor.execute(sql)
    result = cursor.fetchall()

for i in result:
    ips.append((i['ipv4']))

# thread code : wraps system traceroute command
def thread_pinger(i, q):
  """Pings hosts in queue"""
  while True:
    # get an IP item form queue
    ip = q.get()
    # traceroute it
    if os.path.isfile ('/etc/solus-release'):
        args=['/usr/bin/traceroute', '-q', '1', '--resolve-hostnames', str(ip)]
	sqlcmd = "INSERT INTO `trace_result_ipv4` (`trace_destination`,`trace_hop`, `trace_ip`, `trace_hostname`, `trace_time`) VALUES "
    else:
        args=['/usr/bin/traceroute', '-q', '-1', str(ip)]
	sqlcmd = "INSERT INTO `trace_result_ipv4` (`trace_destination`,`trace_hop`, `trace_hostname`, `trace_ip`, `trace_time`) VALUES "

    p_trace = subprocess.Popen(args,
                              shell=False,
                              stdout=subprocess.PIPE)
    # save ping stdout
    p_trace_out = p_trace.communicate()[0]

    # put output msg
    out_q.put(p_trace_out)
    msg = out_q.get_nowait()
    tracedata = re.findall(r'([0-9].*?) (.+) \((.+)\) (.*)ms', msg, re.M)
    # looping output perline
    for item in tracedata:
        items = tuple([ip]) + item
        #print(items)

        with connection.cursor() as cursor:
            # sql insert data from collected item
            sql = sqlcmd + str(items)
            cursor.execute(sql)
            connection.commit()

    # print raw stdout
    print(msg)

    # update queue : this ip is processed
    q.task_done()

# start the thread pool
for i in range(num_threads):
  worker = Thread(target=thread_pinger, args=(i, ips_q))
  worker.setDaemon(True)
  worker.start()

# fill queue
for ip in ips:
  ips_q.put(ip)

  # wait until worker threads are done to exit
  ips_q.join()

# end of program
