
-- Create a Role Table, to hold the roles we'll play
-- while having fun interviewing Liza's class
CREATE TABLE `role` (
  -- `id` INT PRIMARY KEY AUTO_INCREMENT,
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `type` VARCHAR(32),
  `title` VARCHAR(64) NOT NULL,
  `description` TEXT
);

-- Create a Person Table, to hold all us people
CREATE TABLE `person` (
  -- `id` INT PRIMARY KEY AUTO_INCREMENT,
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `first_name` VARCHAR(64) NOT NULL,
  `last_name` VARCHAR(64) NOT NULL,
  `slack` VARCHAR(64) NOT NULL,
  `image` VARCHAR(256) DEFAULT NULL,
  -- `role_id` INT
  `role_id` INTEGER
);

-- Insert Basic Role Data

INSERT INTO `role` ( `title`, `type` ) VALUES 
('Premature Exit', 'attitute'),
('Quiet Writer', 'attitute'),
('Snooty Know It All', 'attitute'),
('Gets very excited', 'attitute'),
('Distracted Interviewer', 'attitute'),
('Overtalker', 'attitute'),
('Friendly', 'attitute'),
('Broad Question Master', 'attitute'),
('Dead Fish', 'handshake'),
('Thumb In', 'handshake'),
('Too Long', 'handshake'),
('Double Grip', 'handshake'),
('Hugger', 'handshake'),
('Fist Bumper', 'handshake');

INSERT INTO `person` (`first_name`, `last_name`, `slack`, `image` ) VALUES
('Ber', 'Cohen', 'bercohen', 'https://ca.slack-edge.com/T03JJLPSP-U3HF7N9HT-6d319e48abd6-512' ),
('Robert', 'Rappole', 'rappole4', 'https://ca.slack-edge.com/T03JJLPSP-U2X8JUNKV-4a6a1f3ba25b-512' ),
('James', 'Sullivan', 'jamessullivan77', 'https://ca.slack-edge.com/T03JJLPSP-U3D8VHD47-4292f61e0c1e-512' ),
('Nick', 'Vaden', 'nickvaden', 'https://ca.slack-edge.com/T03JJLPSP-U3CENEZV0-b1bb1a03cd6d-1024' ),
('Steven', 'DeLeon', 'steviedeee', 'https://ca.slack-edge.com/T03JJLPSP-U218Q8VT9-25ba9d9576d5-512' ),
('Angelina', 'Hill', 'angieh', 'https://ca.slack-edge.com/T03JJLPSP-U3FU6EBFX-ec5c252cfd78-512' ),
('Selcuk', 'Erol', 'selcukerol', 'https://ca.slack-edge.com/T03JJLPSP-U3LP0D01G-09c5654afa5a-512' ),
('Kyle', 'Harmon', 'kyleharmon', 'https://ca.slack-edge.com/T03JJLPSP-U3GLLSY3D-748164cbfcab-1024' ),
('Eric', 'Sui', 'erics', 'https://ca.slack-edge.com/T03JJLPSP-U3LN9RZRR-ed66a04997e5-1024' ),
('Alfe', 'Corona', 'alfecorona', 'https://ca.slack-edge.com/T03JJLPSP-U2JAH1V6E-11ac6f1e6524-512' ),
('Jarvis', 'Potter', 'jarviskpotter', 'https://ca.slack-edge.com/T03JJLPSP-U38R6AHNU-gf1d4623b78a-48' ),
('Joel', 'Jester', 'joel.jester', 'https://ca.slack-edge.com/T03JJLPSP-U3KHZ6GH5-2bb0068bcc3d-1024' ),
('Hak', 'Lim', 'hcl510', 'https://ca.slack-edge.com/T03JJLPSP-U3L2Z36TA-aa8fa8c3944d-512' ),
('Mauricio', 'Garcia', 'garmauricio89', 'https://ca.slack-edge.com/T03JJLPSP-U3EGF95DL-b63d727d981e-512' );



