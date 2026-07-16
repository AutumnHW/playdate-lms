DROP TABLE IF EXISTS discs CASCADE;
DROP TABLE IF EXISTS disc_files CASCADE;
DROP TABLE IF EXISTS disc_art CASCADE;
DROP TABLE IF EXISTS software CASCADE;
DROP TABLE IF EXISTS softondisc CASCADE;
DROP TABLE IF EXISTS cases CASCADE;
DROP TABLE IF EXISTS case_files CASCADE;
DROP TABLE IF EXISTS case_art CASCADE;


CREATE TABLE IF NOT EXISTS discs (
	id SERIAL PRIMARY KEY,
	disc_title VARCHAR(255),
	volume_label TEXT,
	raw bool
	
);

TRUNCATE TABLE discs CASCADE;

CREATE TABLE IF NOT EXISTS disc_files(
	id SERIAL PRIMARY KEY,
	case_id INT REFERENCES discs(id),
	path TEXT,
	size BIGINT
);

TRUNCATE TABLE disc_files CASCADE;

CREATE TABLE IF NOT EXISTS disc_art(
	id SERIAL PRIMARY KEY REFERENCES discs(id),
	front INT REFERENCES disc_files(id),
	back INT REFERENCES disc_files(id)
);

TRUNCATE TABLE disc_art CASCADE;

CREATE TABLE IF NOT EXISTS software (
	id SERIAL PRIMARY KEY,
	software_title TEXT
);

TRUNCATE TABLE software CASCADE;

CREATE TABLE IF NOT EXISTS softondisc (
	disc_id INT REFERENCES discs(id),
	software_id INT REFERENCES software(id),
	PRIMARY KEY (disc_id, software_id)
);

TRUNCATE TABLE softondisc CASCADE;

CREATE TABLE IF NOT EXISTS cases (
	id SERIAL PRIMARY KEY
);
TRUNCATE TABLE cases CASCADE;

CREATE TABLE IF NOT EXISTS case_files(
	id SERIAL PRIMARY KEY,
	case_id INT REFERENCES cases(id),
	path TEXT,
	size BIGINT
);

TRUNCATE TABLE case_files CASCADE;

CREATE TABLE IF NOT EXISTS case_art(
	id SERIAL PRIMARY KEY REFERENCES discs(id),
	front INT REFERENCES disc_files(id),
	back INT REFERENCES disc_files(id),
	coa INT REFERENCES disc_files(id)
);

TRUNCATE TABLE case_art CASCADE;

INSERT INTO discs (disc_title, volume_label, raw) VALUES
('MSDN Disc 2432.2','EN_US_FRE_CCOMXA', FALSE),
('MSDN Disc 8293.2','EN_US_FRE_CCOMXAaa', TRUE),
('MSDN Disc 6969.69','EN_US_FRE_CCOMXAaapemnis', TRUE),
('totally real disc','totally real volume label', TRUE);
INSERT INTO software (software_title) VALUES
('Windows XP'),
('Windows Vista');
INSERT INTO softondisc (disc_id, software_id) VALUES
(4, 1),
(3, 2);

SELECT * FROM discs JOIN softondisc ON discs.id = softondisc.disc_id;

SELECT * FROM disc_art;

