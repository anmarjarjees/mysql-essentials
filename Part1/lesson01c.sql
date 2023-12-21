-- CREATE another table for comments:
/* 
The comments has two FOREIGN KEYS:
- author_id => to refer to the author that received this comments
- story_id => to refer to its related story
 */
CREATE TABLE comments (
   comment_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   story_id INT,
   comment TEXT,
   rate TINYINT,
   published_date DATETIME DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY(story_id) REFERENCES stories(story_id)
);


INSERT INTO comments
(story_id,comment,rate)
VALUES 
(1,'Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.',5),
(2, 'Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.',5),
(3, 'Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.',3),
(3, 'Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.',4),
(4, 'Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.',3);

SELECT * FROM comments;

-- Showing all the stories with their corresponding comments
-- the story title/name and its comments and rate:
SELECT stories.title, comments.comment, comments.rate
FROM  comments JOIN stories
-- ON table1.PK=table2.FK 
-- OR:
-- ON table1.FK=table2.PK
ON stories.story_id = comments.story_id;
ORDER BY stories.title;

-- Notice in the example above, trying RIGHT JOIN will not work fine in this case
-- It will show all the stories even if they don't have comments


/*
Task: the story "title", "comment", "rate", Author "first name" and "last Name"
title => stories table
comments, rate => comments table
first_name, last_name => stories
Connection => authors, stories, and comments tables
*/

-- JOIN Multiple Tables (3 tables):
SELECT comments.comment, stories.title, authors.first_name, authors.last_name
FROM comments INNER JOIN stories 
ON comments.story_id = stories.story_id
-- adding a third table "authors"
INNER JOIN authors
ON authors.author_id = stories.author_id
ORDER BY stories.title;


/* 
Error Code: 1052. Column 'story_id' in on clause is ambiguous
*/


ALTER TABLE stories DROP author_id;
/* 
 Error Code: 1828. Cannot drop column 'author_id': 
 needed in a foreign key constraint 'stories_ibfk_1'
*/