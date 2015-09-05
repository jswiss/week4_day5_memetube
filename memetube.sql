drop database memetube;

create database memetube;

\connect memetube

drop table memetubes;

create table memetubes (
  id serial8 primary key,
  title varchar(200) UNIQUE NOT NULL,
  url varchar(200) UNIQUE NOT NULL,
  genre varchar(50) NOT NULL,
  description text,
  views int
);

create table tags (
  id serial8 primary key,
  tags varchar(50)
);

--join table
create table meme_tags (
  id serial8 primary key,
  video_id int4 references memetubes(id),
  tag_id int4 references tags(id)
);

INSERT INTO memetubes (title, url, genre, description) VALUES ('Best Andy Dwyer Scenes', 'https://www.youtube.com/watch?v=YF6jADQ4ozY', 'comedy', 'Hilarious scenes featuring Andy Dwyer (Chris Pratt) of Parks and Rec');
INSERT INTO memetubes (title, url, genre, description) VALUES ('Pittsburgh Steelers 2008 Defense Ultra Highlights', 'https://www.youtube.com/watch?v=iqWZ74BLATI', 'sports', 'Defensive highlights of the Pittsburgh Steelers 2008 season');
INSERT INTO memetubes (title, url, genre, description) VALUES ('Grannies Smoking Weed for the First Time', 'https://www.youtube.com/watch?v=IRBAZJ4lF0U', 'comedy', 'Now that pot is becoming legal in the US, three grannies get high and play Cards Against Humanity together');