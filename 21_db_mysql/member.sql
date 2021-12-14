-- alt + x , alt + c
show tables;
-- INSERT SELECT UPDATE DELETE
-- CREATE READ   UPDATE DELETE
DROP TABLE IF EXISTS member;
CREATE TABLE IF NOT EXISTS member(
	num int PRIMARY KEY auto_increment,
	name VARCHAR(50),
	addr VARCHAR(300)
);
SELECT * FROM member;

INSERT INTO member(name,addr) VALUE('홍길동','한양');

SELECT * FROM member;
