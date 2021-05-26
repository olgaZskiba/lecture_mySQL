CREATE DATABASE JIS6
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

DROP DATABASE JIS6;

CREATE USER jis6@localhost IDETIFIED BY '1234';
GRANT ALL ON JIS6.* TO jis6@localhost;
DROP USER jis6@localhost;

SELECT user FROM mysql.user;

-- root@olgaz-Notebook-PC:~# mysql -u olga -p connect to local server
-- root@olgaz-Notebook-PC:~# mysql -h 127.0.0.1 -P 3306 -u jis6 -p 1234  connect to remote server

USE JIS6;
SHOW CREATE DATABASE JIS6;

-- CREATE TABLE name;
SHOW TABLES;
DESCRIBE user;
SHOW CREATE TABLE user;

CREATE TABLE user (
    id INT AUTO_INCREMENT,
    login VARCHAR (32) NOT NULL UNIQUE,
    name VARCHAR (255),
    bio TEXT,
    image BLOB,
    birth DATE,
    registered DATETIME,
    updated TIMESTAMP,
    gender CHAR,
    likes INT,
    credit DEC(19,2),
    active BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id)
);

INSERT INTO user (`login`) VALUES ('maksim');
INSERT INTO `user` (login) VALUES ('vasim');

INSERT INTO user (`login`) VALUES ("It's an apple");
INSERT INTO `user` (login) VALUES ('vasim');

INSERT INTO `user` (login) VALUES ('He sad "I am ok" he sad');
INSERT INTO `user` (login) VALUES ('He sad "I\'m ok" he sad');

SELECT * FROM user;

ALTER TABLE user ADD email VARCHAR(32);
ALTER TABLE user MODIFY email TEXT;
ALTER TABLE user CHANGE COLUMN email e_mail VARCHAR(32);

ALTER TABLE user DROP e_mail;
ALTER TABLE user RENAME abuser;

CREATE TABLE user
(
    login VARCHAR(32) NOT NULL UNIQUE,
    name  VARCHAR(255)
);

INSERT INTO user (login, name) VALUES ('maxBax', 'maksim');
INSERT INTO user (name, login) VALUES ('vladimir', 'vav4ig');
-- INSERT INTO user VALUES ('eug'); // error
INSERT INTO user VALUES ('eug', 'eugenij');

--  DATE AND TIME
ALTER TABLE user ADD birth DATE;
ALTER TABLE user ADD registered DATETIME;

INSERT INTO user (login, birth) VALUES ('v1', '2020-05-29');
INSERT INTO user (login, registered) VALUES ('v2', '2020-05-29');
INSERT INTO user (login, registered) VALUES ('v3', '2020-05-20T23:27:38');
INSERT INTO user (login, registered) VALUES ('v4', '2020-05-20 23:27:38');

INSERT INTO user (login, birth) VALUES ('f', '06.06.20');
INSERT INTO user (login, birth) VALUES ('v', '06.06.2020');
-- INSERT INTO user (login, birth) VALUES ('v1', 2020.05.29); ERROR
INSERT INTO user (login, birth) VALUES ('v0', '2020.05.29');

-- SELECT NOW(); time now

INSERT INTO user (login, registered) VALUES ('v5', NOW());
INSERT INTO user (login, registered) VALUES ('v6', NOW() - INTERVAL 1 HOUR);

-- SELECT RAND()*(b-a)+a;