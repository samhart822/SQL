/* What does the app's SQL look like? */
CREATE TABLE twitter (id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT, 
    date TEXT,
    content TEXT);
    
INSERT INTO twitter (name, date, content) 
    VALUES ("Dilly", "01/20/22", "So much for my New Year Resolutions");

INSERT INTO twitter (name, date, content)
    VALUES ("Valerie", "02/10/23", "Why is it snowing in February???");
    
INSERT INTO twitter (name, date, content)
    VALUES ("Thomas", "06/22/20", "Another day of quarantine...");
    
SELECT * FROM twitter;

/* Emulate what happens when you edit data in the app. */
UPDATE twitter SET content = "So much for my New Year Resolutions. I guess there's always next year." WHERE id = 1;

SELECT * FROM twitter;

/* Emulate what happens when you delete data in the app. */
DELETE FROM twitter WHERE id = 2;

SELECT * FROM twitter;

/* Add another column to the table. */
ALTER TABLE twitter 
    ADD character_count INTEGER
    default "unknown";
    
INSERT INTO twitter (name, date, content, character_count) 
    VALUES ("Dilly", "01/20/22", "So much for my New Year Resolutions", 29);
INSERT INTO twitter (name, date, content, character_count)
    VALUES ("Valerie", "02/10/23", "Why is it snowing in February???", 23);
INSERT INTO twitter (name, date, content, character_count)
    VALUES ("Thomas", "06/22/20", "Another day of quarantine...", 22);

SELECT * FROM twitter;

