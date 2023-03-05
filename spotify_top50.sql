/* For this project, I downloaded Spotify data from Kaggle.
Next, I created a table to insert the data. 
Lastly, I performed analytics on the data using SQL. */

/* Creating the table */
CREATE TABLE BIT_DB.Spotifydata (
id integer PRIMARY KEY,
artist_name varchar NOT NULL,
track_name varchar NOT NULL,
track_id varchar NOT NULL,
popularity integer NOT NULL,
danceability decimal(4,3) NOT NULL,
energy decimal(4,3) NOT NULL,
song_key integer NOT NULL,
loudness decimal(5,3) NOT NULL,
song_mode integer NOT NULL,
speechiness decimal(5,4) NOT NULL,
acousticness decimal(6,5) NOT NULL,
instrumentalness text NOT NULL,
liveness decimal(5,4) NOT NULL,
valence decimal(4,3) NOT NULL,
tempo decimal(6,3) NOT NULL,
duration_ms integer NOT NULL,
time_signature integer NOT NULL );

/* Then I inserted the Spotify Data .csv into the table. */

/* Next, I explored the data using the following queries. */

/* I ran this query to get a general feel for data within the table. */
SELECT * FROM BIT_DB.Spotifydata
    LIMIT 5;
    
/* What is the average danceability by artist and track? */
SELECT AVG(danceability), artist_name, track_name
    FROM BIT_DB.Spotifydata
    GROUP BY artist_name, track_name;
    
/* What is the average popularity by artist and track? */
SELECT AVG(popularity), artist_name, track_name
    FROM BIT_DB.Spotifydata
    GROUP BY artist_name, track_name;
    
/* What is the average energy by artist and track? */
SELECT AVG(energy), artist_name, track_name
    FROM BIT_DB.spotifydata
    GROUP BY artist_name, track_name;

/* Who are the top 10 artists based on popularity? */
SELECT artist_name, popularity
    FROM BIT_DB.Spotifydata
    ORDER BY popularity DESC
    LIMIT 10; 

/* What's the average danceability for the 10 most popular songs? */
SELECT track_name, AVG(danceability)
    FROM BIT_DB.spotifydata
    GROUP BY track_name
    ORDER BY popularity DESC
    LIMIT 10; 
    
/* What's the average tempo of the 10 least popular songs? */
SELECT track_name, AVG(tempo)
    FROM BIT_DB.spotifydata
    GROUP BY track_name
    ORDER BY popularity ASC
    LIMIT 10; 

/* How many songs does Olivia Rodrigo have in the top 50? */
SELECT COUNT(track_name)
    FROM BIT_DB.spotifydata 
    WHERE artist_name = 'Olivia Rodrigo'
    GROUP BY artist_name;

/* Which artists have songs with a popularity of 80 or above? */
SELECT DISTINCT artist_name, track_name, popularity
    FROM BIT_DB.spotifydata
    WHERE popularity >= 80; 
    
/* Which song is the loudest? */
SELECT track_name, loudness
    FROM BIT_DB.Spotifydata
    ORDER BY loudness DESC
    LIMIT 1;
    
/* Which song is the least acoustic? */
SELECT track_name, acousticness
    FROM BIT_DB.spotifydata
    ORDER BY acousticness ASC
    LIMIT 1;
    
/* List the different time signatures and their popularity. */
SELECT time_signature, COUNT(time_signature) AS time_sig_popularity
    FROM BIT_DB.spotifydata
    GROUP BY time_signature
    ORDER BY time_sig_popularity DESC;
    
/* Are there any artists that use the same song key? */
SELECT DISTINCT A.artist_name, B.artist_name, A.song_key
    FROM BIT_DB.Spotifydata A
    JOIN BIT_DB.Spotifydata B
    ON A.id <> B.id
    AND A.song_key = B.song_key
    ORDER BY A.song_key;
