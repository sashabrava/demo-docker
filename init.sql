CREATE TABLE tag (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO tag (id, name) VALUES 
(1, 'Tag 1'),
(2, 'Tag 2');