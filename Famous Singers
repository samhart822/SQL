/* Create table about the people and what they do here */
CREATE TABLE singers (id INTEGER PRIMARY KEY,
    full_name TEXT,
    title TEXT,
    home_state TEXT,
    albums INTEGER);
    
INSERT INTO singers (full_name, title, home_state, albums)
    VALUES ("Dallas Green", "The Hurry and the Harm", "Vancouver", 7);
 INSERT INTO singers (full_name, title, home_state, albums)   
    VALUES ("Brand New", "The Devil and God are Raging Inside of Me", "Texas", 5);
INSERT INTO singers (full_name, title, home_state, albums)
    VALUES ("Rainbow Kitten Surprise", "Freefall", "Oregon", 10);
INSERT INTO singers (full_name, title, home_state, albums)
    VALUES ("Lizzy McAlpine", "Ceilings", "Ohio", 2);
    
CREATE TABLE hobbies (id INTEGER PRIMARY KEY,
    singer_id INTEGER,
    title TEXT);
    
INSERT INTO hobbies (singer_id, title)
    VALUES (1, "journaling");
INSERT INTO hobbies (singer_id, title)
    VALUES (2, "axe throwing");
INSERT INTO hobbies (singer_id, title)
    VALUES (3, "hiking");
INSERT INTO hobbies (singer_id, title)
    VALUES (4, "photography");
INSERT INTO hobbies (singer_id, title)
    VALUES (1, "playing guitar");
INSERT INTO hobbies (singer_id, title)
    VALUES (2, "reading");
INSERT INTO hobbies (singer_id, title)
    VALUES (3, "skateboarding");
INSERT INTO hobbies (singer_id, title)
    VALUES (4, "biking");
INSERT INTO hobbies (singer_id, title)
    VALUES (1, "crocheting");
INSERT INTO hobbies (singer_id, title)
    VALUES (2, "knitting");

/* Create relational table that shows what singers have collaborated. */
CREATE TABLE collaborations (id INTEGER PRIMARY KEY,
    collab1_id INTEGER,
    collab2_id INTEGER);
    
INSERT INTO collaborations (collab1_id, collab2_id)
    VALUES (1, 2);
INSERT INTO collaborations (collab1_id, collab2_id)
    VALUES (3, 4); 
    

/* What songs did each singer write? */
SELECT singers.full_name, singers.title
    FROM singers 
    LEFT OUTER JOIN singers title
    ON singers.id = title.id;
    
/* What is each singer's hobby? */
SELECT singers.full_name, hobbies.title
    FROM singers
    LEFT OUTER JOIN hobbies
    ON singers.id = hobbies.singer_id;
    
 /* Where is each singer from? */
 SELECT singers.full_name, singers.home_state
    FROM singers
    LEFT OUTER JOIN singers states
    ON singers.id = states.id;
    
/* Who did each singer collaborate with? */
SELECT a.full_name, b.full_name 
    FROM collaborations
    JOIN singers a
    ON collaborations.collab1_id = a.id
    JOIN singers b
    ON collaborations.collab2_id = b.id;
    

