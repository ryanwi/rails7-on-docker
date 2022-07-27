CREATE USER IF NOT EXISTS 'railsondocker'@'172.%.%.%' IDENTIFIED BY 'change_me_right_now';
GRANT ALL ON *.* to 'railsondocker'@'172.%.%.%';
FLUSH HOSTS;
