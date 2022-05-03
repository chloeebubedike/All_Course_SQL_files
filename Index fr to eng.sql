CREATE DATABASE words_practice;
USE words_practice;

CREATE TABLE words_list(
	word_en VARCHAR(20) NOT NULL,
    word_fr VARCHAR(20) NOT NULL
);

INSERT INTO words_list
(word_en, word_fr)
VALUES
('Apple', 'Pomme'),
('Banana', 'Banane'),
('Pineapple', 'Ananas'),
('Grapefruit', 'Pamplemousse'),
('Potato', 'Pomme de terre'),
('Apricot', 'Abricot');

SELECT * FROM words_list;

CREATE INDEX en_fr_idx
ON words_list(word_en);

CREATE INDEX fr_en_idx
ON words_list(word_fr);

SELECT word_fr 
FROM words_list
WHERE word_fr = 'Abricot';