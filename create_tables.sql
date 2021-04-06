CREATE TABLE teams (
   ID serial primary key,
   TEAM_ABBREV varchar(3),
   CITY varchar(25),
   NAME varchar(50)
);

INSERT INTO teams (TEAM_ABBREV, CITY, NAME)
VALUES
('ARI', 'Arizona', 'Cardinals'),
('ATL', 'Atlanta', 'Falcons'),
('BAL', 'Baltimore', 'Ravens'),
('BUF', 'Buffalo', 'Bills'),
('CAR', 'Carolina', 'Panthers'),
('CHI', 'Chicago', 'Bears'),
('CIN', 'Cincinnati', 'Bengals'),
('CLE', 'Cleveland', 'Browns'),
('DAL', 'Dallas', 'Cowboys'),
('DEN', 'Denver', 'Broncos'),
('DET', 'Detroit', 'Lions'),
('GNB', 'Green Bay', 'Packers'),
('HOU', 'Houston', 'Texans'),
('IND', 'Indianapolis', 'Colts'),
('JAX', 'Jacksonville', 'Jaguars'),
('KAN', 'Kansas City', 'Chiefs'),
('LAC', 'Los Angeles', 'Chargers'),
('LAR', 'Los Angeles', 'Rams'),
('LVR', 'Las Vegas', 'Raiders'),
('MIA', 'Miami', 'Dolphins'),
('MIN', 'Minnesota', 'Vikings'),
('NOR', 'New Orleans', 'Saints'),
('NWE', 'New England', 'Patriots'),
('NYG', 'New York', 'Giants'),
('NYJ', 'New York', 'Jets'),
('PHI', 'Philadelphia', 'Eagles'),
('PIT', 'Pittsburgh', 'Steelers'),
('SEA', 'Seattle', 'Seahawks'),
('SFO', 'San Francisco', '49ers'),
('TEN', 'Tennessee', 'Titans'),
('TAM', 'Tampa Bay', 'Buccaneers'),
('WAS', 'Washington', 'Football Team');



CREATE TABLE players (
    ID varchar(8) PRIMARY KEY,
    TEAM_ID int REFERENCES teams(ID),
    PLAYER varchar(60),
    POSITION VARCHAR(3),
    AGE VARCHAR(3),
    GAMES integer,
    PASS_CMP integer,
    PASS_ATT integer,
    PASS_YDS integer,
    PASS_TDS integer,
    PASS_INTS integer,
    RUSH_ATT integer,
    RUSH_YDS integer,
    RUSH_TDS integer,
    RECS integer,
    REC_YDS integer,
    REC_TDS integer,
    TACKLES integer,
    DEF_INTS integer,
    SACKS integer
);

CREATE TABLE draft_picks (
    PLAYER_ID varchar(8) NOT NULL REFERENCES players(ID),
    TEAM_ID   int NOT NULL REFERENCES teams(ID),
    PICK int NOT NULL,
    ROUND int NOT NULL,
    YEAR int NOT NULL
);
