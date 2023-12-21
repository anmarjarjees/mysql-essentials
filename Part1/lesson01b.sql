-- CREATING table for stories
CREATE TABLE stories (
    story_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    -- adding the FOREIGN KEY
    author_id INT, 
    title VARCHAR(70),
    content TEXT,
    genre VARCHAR(50),
    -- CURRENT_TIMESTAMP Current Date/time value
    published_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    -- Specify the foreign key
    FOREIGN KEY(author_id) REFERENCES authors(author_id)
);

-- Link: https://en.wikipedia.org/wiki/List_of_writing_genres
/*  
List of writing genres:
- Action and adventure
- Comedy
- Crime and mystery
- Speculative fiction
- Fantasy
- Horror
- Science fiction
- Romance
*/

-- INSERT DATA into the table "stories"
INSERT INTO stories
(author_id,title,content,genre)
VALUES 
(1, 'How did do you that','Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.','Comedy'),
(2, 'Learn More','Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.','Fantasy'),
(3, 'Do your best','Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.','Horror'),
(3, 'Where to go','Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.','Science fiction'),
(4, 'Time to escape','Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.','Romance'),
(4, 'It is ok to speak','Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.','Romance'),
(5, 'Time to study','Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.','Horror');

-- SELECT
SELECT * FROM stories;


-- JOIN => Join two tables to select data
-- Refer to my PDF file
/* 
A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

Types of JOIN:
- (INNER) JOIN:
    > is the default join statement:
    > most commonly used and it's the one that we do need to understand as PHP/Python/C#/Java developers
    > because this is the default one, so we have the choice as developers to write it using either way:
        > just by typing "join"
        > or by typing "inner join"
    > Returns records that have matching values  inside the matching fields/columns in both tables

- LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
- RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
- FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table

if we don't specify the type, MySQL will use the "inner" type
*/

-- SELECT author's first name, last name, with their story, and published date
/*
Analyze the question:
Table "authors"
first name => column: first_name
last name => column: last_name

Table "stories"
story => the story content => column: content
published date => column: published_date
*/

SELECT authors.first_name, authors.last_name, stories.published_date FROM authors
INNER JOIN stories
ON authors.author_id = stories.author_id;

-- Or:
SELECT first_name, last_name, stories.published_date FROM authors
JOIN stories
ON authors.author_id = stories.author_id;



