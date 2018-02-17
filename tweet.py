# A simple tweet bot to grab my oldest tweet from a sqlite database,
# Tweet it, update the date to today, and exit

# Uses the Tweepy library to simplify things and make it maintainable by others

# Author: Jet Anderson (janderson@miletwo.net)
# Created date: 2018-02-11
# Last Updated: 2018-02-11
# Version 0.1a

import sqlite3, tweepy, yaml, unittest
from sqlite3 import Error

# Setting to True will still get tweets but won't tweet it or update DB
debug = False

# define the main tweeting function
def tweetit (tweet,file):
    # make connection to the twitter API
    print tweet,"\n"
    success = False;
    # close connection to twitter
    return success;

def create_connection(db_file):
    """ create a database connection to the SQLite database
        specified by the db_file
    :param db_file: database file
    :return: Connection object or None
    """
    try:
        conn = sqlite3.connect(db_file)
        return conn
    except Error as e:
        print(e)

    return None

def get_oldest_tweet(conn):
    """
    get the oldest tweet
    :param conn: the Connection object
    :return:
    """
    cur = conn.cursor()
    cur.execute('SELECT id, tweet, min(tdate) AS tdate FROM tweets')
    row = cur.fetchone()
    tweet = (row[0],row[1],row[2])
    return tweet

def tweet_that_shit(tweet):
    keys = yaml.load(open('config.yml'))
    auth = tweepy.OAuthHandler(keys["consumer_key"], keys["consumer_secret"])
    auth.set_access_token(keys["access_token"],keys["access_token_secret"])
    api = tweepy.API(auth)
    if not debug: api.update_status(tweet+" | #FridayFunny #AppSec #DevSecOps")
    return

def update_tweet_date(conn,id):
    if debug: print "Updating tweetid: ",id

    """
    update the date of that old crusty ass tweet to today's date
    :param conn: the Connection object
    :return:
    """
    cur = conn.cursor()
    if not debug: cur.execute("UPDATE tweets SET tdate=date('now','-1 day') WHERE id=?", [id])
    if not debug: conn.commit()

    return

def main():
    # create a database connection
    database = "tweets.db"
    conn = create_connection(database)

    with conn:
        oldtweet = get_oldest_tweet(conn)
        tweetid = oldtweet[0]
        tweetit = oldtweet[1]
        if not debug: print tweetid,tweetit
        tweet_that_shit(tweetit)
        update_tweet_date(conn,tweetid)

if __name__ == '__main__':
    main()

exit
