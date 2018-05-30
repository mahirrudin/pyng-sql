## pyng-sql

**pyng-sql** adalah python script yang dapat menyimpan hasil dari ping/traceroute ke database mysql. **pyng-sql** memanfaatkan program lain untuk dapat bekerja yaitu *ping, ping6, traceroute, traceroute6*.

### kebutuhan program
1. Sistem operasi linux dengan **ping, ping6, traceroute, traceroute6**
2. Python 2.7
3. Python [PyMySQL](https://github.com/PyMySQL/PyMySQL)
4. Python Regex
5. MySQL/MariaDB Server

### instalasi dan penggunaan

1. clone atau download repositori ini.
```bash
git clone https://github.com/mahirrudin/pyng-sql.git
```

2. import file database.sql ke mysql/mariadb server.
```sql
mysql -u root -p < database.sql
```
3. edit script dan ubah koneksi database.
```python
connection = pymysql.connect(
        host = 'localhost',
        user = 'usrping',
        password = 'usrping',
        db = 'dbping',
        cursorclass = pymysql.cursors.DictCursor)
```
4. insert data ip ke tabel destination. Contoh domain www.google.co.id.
```sql
INSERT INTO `destination` (domain,ipv4,ipv6)
VALUES ('www.google.co.id',''172.217.16.35,'2a00:1450:401b:802::2003');
```
5. Jalankan scriptnya.
```bash
python ipv4.ping.py
```

### demo

Penggunaan mycli pada demo dibawah hanya untuk melihat record database melalui cli. Anda bisa menggunakan software mysql client yang lain.

[![asciicast](https://asciinema.org/a/fmOH0cVpf60Q8IuTxnAeP9Zqa.png)](https://asciinema.org/a/fmOH0cVpf60Q8IuTxnAeP9Zqa)
