DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(128),
	password VARCHAR(32),
	email VARCHAR(255),
	bio TEXT,
	status VARCHAR(32)
);
DROP TABLE IF EXISTS friendship;
CREATE TABLE friendship (
	requestor_id INTEGER,
	recipient_id INTEGER
);

DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	author_id INTEGER,
	message TEXT,
	like_count INTEGER
);

DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	post_id INTEGER,
	author_id INTEGER,
	message TEXT,
	FOREIGN KEY ( post_id ) REFERENCES posts (id),
	FOREIGN KEY ( author_id ) REFERENCES users (id)
);

INSERT INTO users (name,bio) VALUES 
('Cam','Is happy it''s monday'),
('Sel','Um, not really happy about Monday'),
('James','Yeah, I guess.  F*** it'),
('Nick','I didn''t say bingo');

INSERT INTO posts (author_id, message) VALUES 
(3,'Um, is it differnet? Message'),
(2,'What''s going on?');

INSERT INTO comments (post_id,author_id,message) VALUES
(1,4,'Bingo'),
(2,3,'Where''s the party?'),
(2,1,'It''s in Prospect at 10am Tuesday morning');




