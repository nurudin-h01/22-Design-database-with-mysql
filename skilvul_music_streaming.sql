-- Melihat Database
SHOW DATABASE;

-- Membuat Database
CREATE DATABASE skilvul_music_streaming;


-- Membuat Tabel User
CREATE TABLE User (
    user_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL
);

-- Membuat Tabel Singer
CREATE TABLE Singer (
    singer_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NUll
);


-- Membuat Tabel Album
CREATE TABLE Album (
    album_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    singer_id int NOT NULL,
    CONSTRAINT fk_singer_album FOREIGN KEY (singer_id) REFERENCES Singer(singer_id)
);



-- Membuat Tabel Track
CREATE TABLE Track (
    track_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title varchar(255) NOT NULL,
    singer_id int NOT NULL,
    album_id int NOT NULL,
    CONSTRAINT fk_singer_track FOREIGN KEY (singer_id) REFERENCES Singer(singer_id),
    CONSTRAINT fk_album_track FOREIGN KEY (album_id) REFERENCES Album(album_id)
);

-- Membuat Tabel Playlist
CREATE TABLE Playlist (
    playlist_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id int NOT NULL,
    tracks int NOT NULL,
    CONSTRAINT fk_user_playlist FOREIGN KEY (user_id) REFERENCES User(user_id) 
);


-- Membuat Tabel Track_Playlist
CREATE TABLE Track_Playlist (
    track_id int NOT NULL,
    playlist_id int NOT NULL,
    CONSTRAINT fk_track_trackplaylist FOREIGN KEY (track_id) REFERENCES Track(track_id),
    CONSTRAINT fk_playlist_trackplaylist FOREIGN KEY (playlist_id) REFERENCES Playlist(playlist_id)
);