-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2023 at 07:27 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `geet`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeletePlaylist` (IN `playlistId` INT)   BEGIN
     DELETE FROM playlistssongs WHERE playlistssongs.playlistId= playlistId;
     DELETE FROM playlists WHERE id = playlistId;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `artist` int(11) NOT NULL,
  `artworkPath` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `title`, `artist`, `artworkPath`) VALUES
(1, '8D song', 2, 'assets/images/artwork/img13.jpg'),
(2, 'Party', 5, 'assets/images/artwork/img5n.jpg'),
(3, 'Punjabi', 3, 'assets/images/artwork/img6.jpg'),
(4, 'Romantic', 2, 'assets/images/artwork/img1.jpg'),
(5, 'Hip Hop', 1, 'assets/images/artwork/blog4n.jpg'),
(6, 'Instrumental', 3, 'assets/images/artwork/img9.jpg'),
(7, 'Devotional', 4, 'assets/images/artwork/img10.jpg'),
(8, 'Gaming', 6, 'assets/images/artwork/gam.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`id`, `name`) VALUES
(1, 'Mickey Mouse'),
(2, 'Porus'),
(3, 'Bart Simpson'),
(4, 'Homer'),
(5, 'Bruce Lee'),
(6, 'Leon');

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `owner` varchar(25) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `No_of_songs` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`id`, `name`, `owner`, `dateCreated`, `No_of_songs`) VALUES
(20, 'dem1', 'sushant', '2023-11-17 00:00:00', 2),
(21, 'dem2', 'sushant', '2023-11-17 00:00:00', 2),
(22, 'mymusic', 'shrinandan', '2023-11-17 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `playlistssongs`
--

CREATE TABLE `playlistssongs` (
  `id` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  `playlistId` int(11) NOT NULL,
  `playlistOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `playlistssongs`
--

INSERT INTO `playlistssongs` (`id`, `songId`, `playlistId`, `playlistOrder`) VALUES
(40, 34, 20, 1),
(41, 35, 21, 1),
(42, 36, 21, 2),
(43, 37, 20, 2),
(44, 2, 22, 1),
(45, 5, 22, 2),
(47, 15, 22, 3);

--
-- Triggers `playlistssongs`
--
DELIMITER $$
CREATE TRIGGER `AfterDeletePlaylistSong` AFTER DELETE ON `playlistssongs` FOR EACH ROW BEGIN
    UPDATE playlists
    SET No_of_songs = No_of_songs - 1
    WHERE id = OLD.playlistId;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AfterInsertPlaylistSong` AFTER INSERT ON `playlistssongs` FOR EACH ROW BEGIN
    UPDATE playlists
    SET No_of_songs = No_of_songs + 1
    WHERE id = NEW.playlistId;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `artist` int(11) NOT NULL,
  `album` int(11) NOT NULL,
  `duration` varchar(8) NOT NULL,
  `path` varchar(500) NOT NULL,
  `albumOrder` int(11) NOT NULL,
  `plays` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `title`, `artist`, `album`, `duration`, `path`, `albumOrder`, `plays`) VALUES
(1, 'Dilbar', 1, 5, '3:18', 'assets/music/Dilbar.mpeg', 1, 2),
(2, 'Apna time aayega', 1, 5, '2:10', 'assets/music/apna time aayega.mpeg', 2, 5),
(3, 'Aankh Marey', 1, 5, '3:22', 'assets/music/aankh marey.mpeg', 3, 6),
(4, 'Bom Diggy Diggy', 1, 5, '3:22', 'assets/music/Bom Diggy Diggy.mpeg', 4, 2),
(5, 'Brown Munde', 1, 5, '4:14', 'assets/music/Brown Munde.mp3', 5, 3),
(6, 'Porus', 2, 1, '3:00', 'assets/music/Jay.mp3', 1, 2),
(7, 'Hamari Adhuri Kahani', 2, 4, '5:45', 'assets/music/hamari adhuri kahani.mpeg', 2, 4),
(8, 'Joker', 2, 1, '3:07', 'assets/music/Joker.mp3', 2, 4),
(9, 'Amplifier', 2, 1, '4:02', 'assets/music/Amplifier.mp3', 3, 5),
(10, 'Tujhe Kitna Chane Lage', 2, 4, '3:38', 'assets/music/tujhe kitna chane lage.mpeg', 3, 3),
(11, 'Burjkhalifa', 2, 1, '4:03', 'assets/music/Burjkhalifa.mp3', 4, 4),
(12, 'Say_Goodbye', 2, 1, '4:15', 'assets/music/Say_Goodbye.mp3', 5, 4),
(13, 'Instrumental-2', 3, 6, '4:07', 'assets/music/Instrumental-2.mpeg', 5, 5),
(14, 'Instrumental-1', 3, 6, '5:52', 'assets/music/Instrumental-1.mpeg', 4, 1),
(15, 'Unity', 3, 6, '4:09', 'assets/music/Unity.mp3', 3, 2),
(16, 'Astronomia', 3, 6, '3:18', 'assets/music/Astronomia.mp3', 2, 1),
(17, 'Monody', 3, 6, '4:59', 'assets/music/Monody.mp3', 1, 4),
(18, 'Shiva', 4, 7, '3:17', 'assets/music/Shiva.mp3', 5, 1),
(19, 'Vaishnav Jan To', 4, 7, '5:17', 'assets/music/Vaishnav Jan To.mp3', 4, 3),
(20, 'Gopal Maro Paraniye Jule Re', 4, 7, '5:11', 'assets/music/Gopal Maro Paraniye Jule Re.mp3', 3, 4),
(21, 'Hanuman Chalisa', 4, 7, '4:05', 'assets/music/Hanuman Chalisa.mp3', 2, 7),
(22, 'Deva Shree Ganesha', 4, 7, '5:24', 'assets/music/Deva Shree Ganesha.mp3', 1, 3),
(23, 'Apologize', 5, 2, '5:07', 'assets/music/Apologize.mp3', 1, 3),
(24, 'Locked out of heaven', 5, 2, '5:29', 'assets/music/Locked out of heaven.mp3', 2, 3),
(25, 'Odhani', 5, 2, '2:21', 'assets/music/Odhani.mp3', 3, 2),
(26, 'Makhna', 5, 2, '3:03', 'assets/music/Makhna.mp3', 4, 2),
(27, 'Party All Night', 5, 2, '4:00', 'assets/music/Party All Night.mp3', 5, 5),
(28, 'Baarish Ki Jayee', 3, 3, '3:41', 'assets/music/Baarish Ki Jayee.mp3', 4, 2),
(29, 'Tu Laung Me Elaachi', 3, 3, '2:48', 'assets/music/Tu Laung Me Elaachi.mp3 ', 3, 1),
(30, 'Baby Girl', 3, 3, '3:27', 'assets/music/Baby Girl.mp3 ', 2, 1),
(31, 'garmi', 3, 3, '4:37', 'assets/music/garmi.mpeg', 1, 2),
(32, 'Filhall ', 2, 4, '5:30', 'assets/music/filhall.mpeg', 3, 5),
(33, 'Pal Pal Dil Ke Paas', 2, 4, '4:14', 'assets/music/Pal Pal Dil Ke Paas.mp3', 3, 2),
(34, 'Say Goodbye', 6, 8, '3:50', 'assets/music/Say Goodbye.mp3', 3, 12),
(35, 'symbolism', 6, 8, '4:51', 'assets/music/symbolism.mp3', 3, 5),
(36, 'Feel Good', 6, 8, '3:02', 'assets/music/Feel Good.mp3', 3, 2),
(37, 'ark', 6, 8, '0:29', 'assets/music/ark.mp3', 3, 4),
(38, 'See You Again', 6, 8, '3:57', 'assets/music/See You Again.mp3', 3, 5),
(39, 'Namo Namo', 4, 7, '5:28', 'assets/music/Namo Namo.mp3', 5, 2),
(40, 'Sanam Re', 2, 4, '4:29', 'assets/music/sanam re.mpeg', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(32) NOT NULL,
  `signUpDate` datetime NOT NULL,
  `profilePic` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `password`, `signUpDate`, `profilePic`) VALUES
(3, 'shrinandan', 'Shrinandan', 'Bhat', 'Shri@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2023-11-16 00:00:00', 'assets/images/profile-pics/head_emerald.png'),
(6, 'tushar', 'Tushar', 'Ac', 'Tushar@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2023-11-16 00:00:00', 'assets/images/profile-pics/head_emerald.png'),
(7, 'sushant', 'Sushant', 'Hegde', 'Sus@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2023-11-17 00:00:00', 'assets/images/profile-pics/head_emerald.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artist` (`artist`);

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`);

--
-- Indexes for table `playlistssongs`
--
ALTER TABLE `playlistssongs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `songId` (`songId`),
  ADD KEY `playlistId` (`playlistId`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artist` (`artist`),
  ADD KEY `album` (`album`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `playlistssongs`
--
ALTER TABLE `playlistssongs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`artist`) REFERENCES `artists` (`id`);

--
-- Constraints for table `playlists`
--
ALTER TABLE `playlists`
  ADD CONSTRAINT `fk_playlists_owner` FOREIGN KEY (`owner`) REFERENCES `users` (`username`);

--
-- Constraints for table `playlistssongs`
--
ALTER TABLE `playlistssongs`
  ADD CONSTRAINT `playlistssongs_ibfk_1` FOREIGN KEY (`songId`) REFERENCES `songs` (`id`),
  ADD CONSTRAINT `playlistssongs_ibfk_2` FOREIGN KEY (`playlistId`) REFERENCES `playlists` (`id`);

--
-- Constraints for table `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`artist`) REFERENCES `artists` (`id`),
  ADD CONSTRAINT `songs_ibfk_2` FOREIGN KEY (`album`) REFERENCES `albums` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
