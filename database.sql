CREATE TABLE IF NOT EXISTS muscle_legends (
    identifier VARCHAR(60) PRIMARY KEY,
    muscle_level INT DEFAULT 0,
    last_workout TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO muscle_legends (identifier, muscle_level, last_workout) SELECT identifier, 0, CURRENT_TIMESTAMP FROM users WHERE identifier NOT IN (SELECT identifier FROM muscle_legends);