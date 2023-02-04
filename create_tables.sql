create table teams
(
    id          serial not null
        constraint teams_pkey
            primary key,
    team_abbrev varchar(3),
    city        varchar(25),
    name        varchar(50)
);

create table players
(
    id           varchar(8) not null
        constraint players_pkey
            primary key,
    team_id      integer
        constraint players_team_id_fkey
            references teams,
    player       varchar(60),
    games        integer,
    pass_cmp     integer,
    pass_att     integer,
    pass_tds     integer,
    pass_ints    integer,
    rush_att     integer,
    rush_yds     integer,
    rush_tds     integer,
    recs         integer,
    rec_yds      integer,
    rec_tds      integer,
    tackles      integer,
    def_ints     integer,
    sacks        integer,
    position     varchar(3),
    pass_yds     integer,
    age          varchar(3),
    last_active  integer,
    college      varchar(50),
    hof          boolean default false,
    comp_pct     real    default 0,
    yds_per_rush real    default 0,
    yds_per_rec  real    default 0,
    yds_per_att  real    default 0
);

create table combine_stats
(
    player_id   varchar(8) not null
        constraint combine_stats_player_id_fkey
            references players,
    height      double precision,
    weight      double precision,
    wonderlic   integer,
    forty_time  double precision,
    bench_press integer,
    vert_leap   double precision,
    broad_jump  integer,
    shuttle     double precision,
    three_cone  double precision
);

create table draft_picks
(
    player_id varchar(8) not null
        constraint draft_picks_player_id_fkey
            references players,
    team_id   integer    not null
        constraint draft_picks_team_id_fkey
            references teams,
    pick      integer    not null,
    round     integer    not null,
    year      integer    not null
);

INSERT INTO teams (team_abbrev, city, name) VALUES ('ARI', 'Arizona', 'Cardinals');
INSERT INTO teams (team_abbrev, city, name) VALUES ('ATL', 'Atlanta', 'Falcons');
INSERT INTO teams (team_abbrev, city, name) VALUES ('BAL', 'Baltimore', 'Ravens');
INSERT INTO teams (team_abbrev, city, name) VALUES ('BUF', 'Buffalo', 'Bills');
INSERT INTO teams (team_abbrev, city, name) VALUES ('CAR', 'Carolina', 'Panthers');
INSERT INTO teams (team_abbrev, city, name) VALUES ('CHI', 'Chicago', 'Bears');
INSERT INTO teams (team_abbrev, city, name) VALUES ('CIN', 'Cincinnati', 'Bengals');
INSERT INTO teams (team_abbrev, city, name) VALUES ('CLE', 'Cleveland', 'Browns');
INSERT INTO teams (team_abbrev, city, name) VALUES ('DAL', 'Dallas', 'Cowboys');
INSERT INTO teams (team_abbrev, city, name) VALUES ('DEN', 'Denver', 'Broncos');
INSERT INTO teams (team_abbrev, city, name) VALUES ('DET', 'Detroit', 'Lions');
INSERT INTO teams (team_abbrev, city, name) VALUES ('GB', 'Green Bay', 'Packers');
INSERT INTO teams (team_abbrev, city, name) VALUES ('HOU', 'Houston', 'Texans');
INSERT INTO teams (team_abbrev, city, name) VALUES ('IND', 'Indianapolis', 'Colts');
INSERT INTO teams (team_abbrev, city, name) VALUES ('JAX', 'Jacksonville', 'Jaguars');
INSERT INTO teams (team_abbrev, city, name) VALUES ('KC', 'Kansas City', 'Chiefs');
INSERT INTO teams (team_abbrev, city, name) VALUES ('LV', 'Las Vegas', 'Raiders');
INSERT INTO teams (team_abbrev, city, name) VALUES ('LAC', 'Los Angeles', 'Chargers');
INSERT INTO teams (team_abbrev, city, name) VALUES ('LAR', 'Los Angeles', 'Rams');
INSERT INTO teams (team_abbrev, city, name) VALUES ('MIA', 'Miami', 'Dolphins');
INSERT INTO teams (team_abbrev, city, name) VALUES ('MIN', 'Minnesota', 'Vikings');
INSERT INTO teams (team_abbrev, city, name) VALUES ('NE', 'New England', 'Patriots');
INSERT INTO teams (team_abbrev, city, name) VALUES ('NO', 'New Orleans', 'Saints');
INSERT INTO teams (team_abbrev, city, name) VALUES ('NYJ', 'New York', 'Jets');
INSERT INTO teams (team_abbrev, city, name) VALUES ('NYG', 'New York', 'Giants');
INSERT INTO teams (team_abbrev, city, name) VALUES ('PHI', 'Philadelphia', 'Eagles');
INSERT INTO teams (team_abbrev, city, name) VALUES ('PIT', 'Pittsburgh', 'Steelers');
INSERT INTO teams (team_abbrev, city, name) VALUES ('SF', 'San Francisco', '49ers');
INSERT INTO teams (team_abbrev, city, name) VALUES ('SEA', 'Seattle', 'Seahawks');
INSERT INTO teams (team_abbrev, city, name) VALUES ('TB', 'Tampa Bay', 'Buccaneers');
INSERT INTO teams (team_abbrev, city, name) VALUES ('TEN', 'Tennessee', 'Titans');
INSERT INTO teams (team_abbrev, city, name) VALUES ('WAS', 'Washington', 'Commanders');

UPDATE players SET position = 'S' WHERE position = 'SAF';
UPDATE players SET position = 'OG' WHERE position = 'G';
UPDATE players SET position = 'OC' WHERE position = 'C';
UPDATE players SET position = 'OT' WHERE position = 'T';
UPDATE players SET position = 'RB' WHERE position = 'HB';
UPDATE players SET position = 'LB' WHERE position = 'ILB';
UPDATE players SET position = 'DT' WHERE position = 'NT';
UPDATE players SET position = 'OC' WHERE position = 'LS';
