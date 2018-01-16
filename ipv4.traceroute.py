#!/usr/bin/env python
# traceroute a list of host with threads for increase speed
# use standard linux /usr/bin/traceroute | /bin/traceroute utility

from threading import Thread
import subprocess
import Queue
import re
import pymysql.cursors

# some global vars
num_threads = 30
ips_q = Queue.Queue()
out_q = Queue.Queue()

# connection to the database
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

# thread code : wraps system ping command
def thread_pinger(i, q):
  """Pings hosts in queue"""
  while True:
    # get an IP item form queue
    ip = q.get()
    # traceroute it
    # uncomment this if your distro debian,ubuntu,centos, or fedora
    #args=['/bin/traceroute', '-q', '1', str(ip)]

    # uncomment this if your distro solus
    args=['/usr/bin/traceroute', '-q', '1', '--resolve-hostnames', str(ip)]

    p_trace = subprocess.Popen(args,
                              shell=False,
                              stdout=subprocess.PIPE)
    # save ping stdout
    p_trace_out = p_trace.communicate()[0]

    # put output msg
    out_q.put(p_trace_out)

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

# print result and process to database
while True:
  try:
    msg = out_q.get_nowait()
  except Queue.Empty:
    break

  # print raw messages
  print(msg)

  # process raw messages for mysql
  # uncomment this if your distro using debian,ubuntu,centos or fedora
  #tracedata = re.findall(r'([0-9].*?) (.+) \((.*)\)  (.*?) ms', msg, re.M)

  # uncommend this if your distro solus
  tracedata = re.findall(r'([0-9].*?) (.+) \((.+)\) (.*)ms', msg, re.M)

  # looping output perline
  for item in tracedata:
      print(item)

      with connection.cursor() as cursor:
          #sql insert data from collected item
          sql = "INSERT INTO `trace_result_ipv4` (`trace_hop`, `trace_hostname`, `trace_ip`, `trace_time`) VALUES " + str(item)
          cursor.execute(sql)
          connection.commit()

# end of program
