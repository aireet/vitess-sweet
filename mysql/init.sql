update mysql.user set authentication_string=password('echo2022!~Aa') where user='root';
flush privileges;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'echo2022!~Aa';