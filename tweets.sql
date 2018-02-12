BEGIN;
CREATE TABLE tweets (
  id INTEGER  PRIMARY KEY,
  tdate DATETIME,
  tweet TEXT
);
COMMIT;

BEGIN;
INSERT INTO tweets values(date('now','-2 day'), "test 1 day older");
COMMIT;

INSERT INTO tweets(tdate,tweet) VALUES('2018-01-28','"Computers in the future may weigh no more than 1.5 tons."
  — @PopMech, 1949');
INSERT INTO tweets(tdate,tweet) VALUES('2018-01-27',"There are 10 types of people in the world.
  Those that understand binary and those that don't");
INSERT INTO tweets(tdate,tweet) VALUES('2018-02-03',"Why do Python Devs need glasses? Because they don't C#.");
INSERT INTO tweets(tdate,tweet) VALUES('2018-02-04',"I love pressing F5. It's so refreshing.");
INSERT INTO tweets(tdate,tweet) VALUES('2018-02-11','The code that is the hardest to debug is the code that you know cannot possibly be wrong.');
INSERT INTO tweets(tdate,tweet) VALUES('2018-02-10','Programming today is a race between software engineers striving to build bigger and better idiot-proof programs, and the Universe trying to produce bigger and better idiots. So far, the Universe is winning.');
INSERT INTO tweets(tdate,tweet) VALUES('2018-02-09','If brute force doesn’t solve your problems, then you aren’t using enough.');
INSERT INTO tweets(tdate,tweet) VALUES('2018-02-08','Real men don’t use backups, they post their stuff on a public ftp server and let the rest of the world make copies.');
INSERT INTO tweets(tdate,tweet) VALUES('2018-02-07','Latest survey shows that 3 out of 4 people make up 75% of the world’s population.');
INSERT INTO tweets(tdate,tweet) VALUES('2018-02-05','I was once in a band named 1023MB… we never got to have a gig.');
INSERT INTO tweets(tdate,tweet) VALUES('2018-02-02','In order to understand recursion you must first understand recursion.');
INSERT INTO tweets(tdate,tweet) VALUES('2018-02-01','There are two types of people in the world, those who can extrapolate from incomplete data.');
INSERT INTO tweets(tdate,tweet) VALUES('2018-01-31','A content marketer walks into a bar, bars, pub, tavern, public house, Irish pub, drinks, beer, alcohol');
INSERT INTO tweets(tdate,tweet) VALUES('2018-01-30',"If you put a million monkeys on a million keyboards, one of them will eventually write a #Java program. The rest of them will write #Perl");
INSERT INTO tweets(tdate,tweet) VALUES('2018-01-29','There are only two hard things in computer science: cache invalidation, naming things, and off-by-one errors.');
COMMIT;

SELECT id, min(tdate) AS tdate, tweet FROM tweets;
SELECT id, max(tdate) AS tdate, tweet FROM tweets;
