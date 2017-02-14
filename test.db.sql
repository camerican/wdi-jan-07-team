
-- Users Table
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id integer PRIMARY KEY AUTOINCREMENT,
	email VARCHAR(64),
	name_first VARCHAR(64), 
	name_last VARCHAR(64) 
);

-- Profiles Table
-- To do: Write profiles table
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	id integer PRIMARY KEY AUTOINCREMENT,
	user_id integer,
	headline VARCHAR(128),
	bio TEXT,
	location VARCHAR(128),
	gender boolean,
	picture VARCHAR(255),
	created_at datetime DEFAULT current_timestamp
--	updated_at datetime ON UPDATE current_timestamp
);

INSERT INTO users (email,name_first,name_last) VALUES
('alfe@nyc.net','Alfe','Corona'),
('cam@nycda.com','Cam','Cam');






