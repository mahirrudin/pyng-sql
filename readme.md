## pyng-sql

**pyng-sql** adalah python script yang dapat menyimpan hasi dari ping/traceroute ke database mysql. **pyng-sql** memanfaatkan program lain untuk dapat bekerja yaitu *ping, ping6, traceroute, traceroute6*.

### kebutuhan program
1. Sistem operasi linux dengan **ping, ping6, traceroute, traceroute6**
2. Python 2.7
3. [PyMySQL](https://github.com/PyMySQL/PyMySQL)
4. MySQL/MariaDB Server

### instalasi dan penggunaan

1. clone repositori ini.
2. import file database.sql ke mysql/mariadb server.
3. edit script dan ubah koneksi database.

```
connection = pymysql.connect(
        host = 'localhost',
        user = 'usrping',
        password = 'usrping',
        db = 'dbping',
        cursorclass = pymysql.cursors.DictCursor)
```

4. Jalankan scriptnya.
