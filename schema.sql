DROP TABLE insults CASCADE;

CREATE TABLE insults(
  id SERIAL PRIMARY KEY,
  insult TEXT,
  play VARCHAR(255)
);
