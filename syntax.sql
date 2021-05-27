CREATE DATABASE JIS6
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

DROP DATABASE JIS6;

CREATE USER jis6@localhost IDETIFIED BY '1234';
GRANT ALL PRIVILEGES ON JIS6.* TO olga@localhost;
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

-- BUTCH UPDATE
INSERT INTO abuser VALUES
(NULL, 'vadin', 'Vladimir Yakovlevitch', ' ', NULL, '2020-05-29', '2020-05-20 23:32:32', NULL, 'M', 150, 150.00, TRUE),
(NULL, 'mikas', ' ', ' ', NULL, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'M', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'vikas', ' ', ' ', NULL, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'F', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'bikas', ' ', '', NULL, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'M', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'userr', '', 'Java Developer', NULL, NOW()-INTERVAL RAND()* (1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'F', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'myname', '', 'Java Developer', NULL, NOW()-INTERVAL RAND()* (1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'M', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'login', ' ', '', NULL, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'F', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'passw', ' ', ' ', NULL, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'M', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'noname', ' ', ' ', NULL, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'F', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'anon', ' ', 'Student', NULL, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'M', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'joker', ' ', 'Mentor', NULL, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'F', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'focker', ' ', 'Mentor', NULL, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'M', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'mause', ' ', 'Java Developer', NULL, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'F', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'mice', ' ', 'Java Developer', NULL, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'M', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'nice', '2', 'Student', NULL, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'F', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'goblin', ' ', 'Mentor', NULL, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'M', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'bobin', ' ', 'Student', NULL, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'F', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'bob', ' ', 'Mentor', NULL, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'M', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'steave', ' ', 'Java Developer', NULL, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'F', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'jobs', ' ', 'Student', NULL, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'M', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'rocket', ' ', 'Mentor', NULL, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'F', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND()),
(NULL, 'virus', ' ', 'Mentor', NULL, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NOW()-INTERVAL RAND()*(1000-5)+5 DAY, NULL, 'M', RAND()*(1000-5)+5, RAND()*(1000-5)+5, RAND())
;
--id (7 -28)

SELECT id, login, active FROM abuser;
SELECT id, login, active FROM abuser LIMIT 3;
SELECT id, login, active FROM abuser LIMIT 2, 3;
SELECT id, login, active FROM abuser WHERE id=20;
SELECT id, login, active FROM abuser WHERE id<20;
SELECT id, login, active FROM abuser WHERE id<=20;
SELECT id, login, active, birth FROM abuser WHERE birth BETWEEN '2019-01-01' AND '2020-05-01';
SELECT id, login, active, birth FROM abuser WHERE birth > '2020-05-01';
SELECT id, login, active FROM abuser WHERE id IN (20, 15, 10, 5);
SELECT id, login, active FROM abuser WHERE id NOT IN (20, 15, 10, 5);
SELECT id, login, active, bio FROM abuser WHERE bio LIKE '%dev%';

SELECT id, login, active, birth, bio FROM abuser WHERE birth > '2020-05-01'
UNION
SELECT id, login, active, birth, bio FROM abuser WHERE bio LIKE '%dev%';

SELECT id, login, active, birth, bio FROM abuser WHERE birth > '2020-05-01'
UNION ALL
SELECT id, login, active, birth, bio FROM abuser WHERE bio LIKE '%dev%';

SELECT id, login, active, birth, bio FROM abuser WHERE image IS NULL;
SELECT id, login, active, birth, bio FROM abuser WHERE image IS NOT NULL;

-- SELECT id, login, active, birth, bio FROM abuser WHERE name=0; DON'T USE IT

SELECT id, login, active, gender, likes FROM  abuser WHERE id=20;
UPDATE abuser SET
        gender = 'F',
        likes = 0
WHERE id>20;

-- mysqldump JIS6 > jis6_2021-05-27T23.00.00.sql // root admin
mysqldump -h 127.0.0.1 -u olga JIS6 > jis6.sql -p
mysqldump -h 127.0.0.1 -u olga JIS6 JIS7 > severaljisdatabases.sql -p
mysqldump -h 127.0.0.1 -u olga --all-databases > allDatabases.sql -p

mysql -h 127.0.0.1 -u olga JIS6 < jis6.sql -p

mysqldump -u username -ppassword database_name table_name >single_table_dump.sql
mysqldump -u username -ppassword database_name table_name --where="date_created='2013-06-25'">few_rows_dump.sql

GRANT ALL PRIVILEGES ON JIS6.* TO olga@localhost;
GRANT CREATE, INSERT, DROP, ALTER ON JIS6.* TO olga@localhost;
GRANT TRIGGER, LOCK TABLES, SELECT, SHOW VIEW ON JIS6.* TO olga@localhost;
-- when trying to dump tablespaces
-- GRANT PROCESS ON *.* TO olga@localhost;

SELECT id, login, active, gender, likes FROM  abuser WHERE id=20;
START TRANSACTION;
UPDATE abuser SET
                  gender = 'M',
                  likes = 500
WHERE id<20;
ROLLBACK;

SELECT id, login, active, gender, likes FROM  abuser WHERE id=20;
START TRANSACTION;
UPDATE abuser SET
                  gender = 'M',
                  likes = 500
WHERE id=20;
COMMIT;

SET autocommit=0;

SELECT RIGHT(bio, 2) FROM abuser;
SELECT login, SUBSTRING_INDEX(credit, '.', 1) FROM abuser;
SELECT UPPER(login), LOWER(name), REVERSE(bio) FROM abuser;
SELECT LENGTH(login) FROM abuser;
SELECT LENGTH(login), login FROM abuser WHERE LENGTH(login) >=5;
SELECT LTRIM(' dogfood ');
SELECT RTRIM(' catfood ');

ALTER TABLE abuser ADD login_policy VARCHAR (32);
UPDATE abuser SET login_policy =
                    CASE
                        WHEN LENGTH(login)<4
                            THEN 'too short'
                        WHEN LENGTH(login)>=4 AND LENGTH(login)<=5
                            THEN 'OK'
                        ELSE 'to long'
                        END;
SELECT LENGTH(login), login, login_policy FROM abuser;

SELECT id, login, name, bio FROM abuser ORDER BY login ASC;
SELECT id, login, name, bio FROM abuser ORDER BY bio ASC, name DESC;
SELECT id, login, name, bio FROM abuser ORDER BY LENGTH(bio) ASC, name DESC;

SELECT DISTINCT bio FROM abuser;
SELECT DISTINCT LENGTH(login) FROM abuser;

SELECT SUM(credit) FROM abuser WHERE gender = 'M';
SELECT AVG(credit) FROM abuser WHERE gender = 'M';

SELECT MAX(credit) AS maxLikes, name FROM abuser GROUP BY name;

SELECT * FROM abuser WHERE likes IN (SELECT MAX(likes) AS likes FROM abuser GROUP BY gender);

SELECT likes, name FROM abuser WHERE likes = (SELECT MAX(likes) FROM abuser);
SELECT likes, name FROM abuser ORDER BY likes DESC LIMIT 1;

SELECT bio, COUNT(bio) as total FROM abuser GROUP BY bio;
SELECT bio, COUNT(bio) as total FROM abuser WHERE bio LIKE '%Dev%' GROUP BY bio;
SELECT bio, COUNT(bio) as total FROM abuser GROUP BY bio ORDER BY total DESC;
SELECT bio, COUNT(bio) as total FROM abuser GROUP BY bio ORDER BY total DESC LIMIT 1,1;
SELECT bio, COUNT(bio) as total FROM abuser GROUP BY bio HAVING total > 3;
SELECT SUM(likes) AS total_likes, AVG(likes), COUNT(bio), bio FROM abuser GROUP BY bio;
SELECT MIN(likes), bio from abuser GROUP BY bio;

SELECT MIN(likes) from abuser;
SELECT login, name, bio, likes FROM abuser WHERE likes = (SELECT MIN(likes) FROM abuser);
SELECT id, name, likes FROM abuser WHERE likes in (SELECT likes FROM abuser WHERE id > 20);
SELECT id, name, likes from abuser where likes in (SELECT MIN(likes) from abuser);
SELECT MIN(likes), bio from abuser GROUP BY bio;
SELECT id, name, bio, likes from abuser where likes in (SELECT MIN(likes) from abuser GROUP BY bio);