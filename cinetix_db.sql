-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2026 at 04:41 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cinetix_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `booked_seats`
--

CREATE TABLE `booked_seats` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `showtime` varchar(20) NOT NULL,
  `seat_code` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booked_seats`
--

INSERT INTO `booked_seats` (`id`, `movie_id`, `booking_date`, `showtime`, `seat_code`) VALUES
(14, 1, '2026-04-27', '01:00 PM', 'B10'),
(17, 1, '2026-04-27', '01:00 PM', 'C2'),
(13, 1, '2026-04-27', '01:00 PM', 'D6'),
(15, 1, '2026-04-27', '01:00 PM', 'E2'),
(18, 1, '2026-04-27', '01:00 PM', 'F10'),
(16, 1, '2026-04-27', '01:00 PM', 'F2'),
(12, 1, '2026-04-27', '01:00 PM', 'F6'),
(11, 1, '2026-04-27', '01:00 PM', 'G8'),
(2, 3, '2026-04-24', '06:30 PM', 'C8'),
(10, 3, '2026-04-24', '06:30 PM', 'D7'),
(4, 3, '2026-04-24', '06:30 PM', 'D8'),
(9, 3, '2026-04-24', '06:30 PM', 'E7'),
(5, 3, '2026-04-24', '06:30 PM', 'E8'),
(8, 3, '2026-04-24', '06:30 PM', 'F7'),
(3, 3, '2026-04-24', '06:30 PM', 'F8'),
(7, 3, '2026-04-24', '06:30 PM', 'G7'),
(6, 3, '2026-04-24', '06:30 PM', 'G8'),
(1, 5, '2026-04-24', '07:00 PM', 'D8');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `ticket_id` varchar(50) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `movie_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `showtime` varchar(20) DEFAULT NULL,
  `cinema` varchar(50) DEFAULT 'Cinema 2',
  `seats` text NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `card_last4` varchar(4) DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT 'card',
  `status` varchar(20) DEFAULT 'confirmed',
  `booked_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `ticket_id`, `user_name`, `movie_id`, `booking_date`, `showtime`, `cinema`, `seats`, `amount`, `card_last4`, `payment_method`, `status`, `booked_at`) VALUES
(1, 'TIX-1776997918668', '424', 5, '2026-04-24', '07:00 PM', 'Cinema 2', 'D8', 270.00, '3323', 'card', 'confirmed', '2026-04-24 02:31:58'),
(2, 'TIX-1776998019529', 'dfsdfs ', 3, '2026-04-24', '06:30 PM', 'Cinema 2', 'C8', 270.00, '6789', 'gcash', 'confirmed', '2026-04-24 02:33:39'),
(3, 'TIX-1776998183193', 'dsdf', 3, '2026-04-24', '06:30 PM', 'Cinema 2', 'F8,D8,E8,G8,G7,F7,E7,D7', 2020.00, '4234', 'maya', 'confirmed', '2026-04-24 02:36:23'),
(4, 'TIX-1776998247691', 'sample test', 1, '2026-04-27', '01:00 PM', 'Cinema 2', 'G8,F6,D6,B10,E2,F2,C2,F10', 2020.00, '6789', 'gcash', 'confirmed', '2026-04-24 02:37:27');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `rating` varchar(10) DEFAULT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `poster` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('now','coming') DEFAULT 'now',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `genre`, `rating`, `duration`, `poster`, `description`, `status`, `created_at`) VALUES
(1, 'Avengers: Endgame', 'Action, Adventure', 'PG-13', '3h 1m', 'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg', 'After the devastating events of Infinity War, the universe is in ruins. The remaining Avengers assemble once more to reverse Thanos\' actions and restore balance.', 'now', '2026-04-24 02:11:08'),
(2, 'The Batman', 'Action, Crime', 'PG-13', '2h 56m', 'https://m.media-amazon.com/images/M/MV5BMDdmMTBiNTYtMDIzNi00NGVlLWIzMDYtZTk3MTQ3NGQxZGEwXkEyXkFqcGdeQXVyMzMwOTU5MDk@._V1_SX300.jpg', 'When a sadistic killer leaves behind a trail of cryptic clues, the Dark Knight begins an investigation, uncovering corruption that runs deep in Gotham City.', 'now', '2026-04-24 02:11:08'),
(3, 'Interstellar', 'Sci-Fi, Adventure', 'PG-13', '2h 49m', 'https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.', 'now', '2026-04-24 02:11:08'),
(4, 'Spider-Man: No Way Home', 'Action, Adventure', 'PG-13', '2h 28m', 'https://m.media-amazon.com/images/M/MV5BZWMyYzFjYTYtNTRjYi00OGExLWE2YzgtOGRmYjAxZTU3NzBiXkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_SX300.jpg', 'Peter Parker seeks help from Doctor Strange to make the world forget he is Spider-Man, but the spell goes wrong, pulling in villains from other universes.', 'now', '2026-04-24 02:11:08'),
(5, 'The Conjuring 3', 'Horror, Thriller', 'R', '1h 52m', 'https://placehold.co/200x300/13131a/e8003d?text=Conjuring+3', 'Ed and Lorraine Warren investigate a murder suspect who claims demonic possession as a defense, taking them beyond anything they\'ve ever seen before.', 'now', '2026-04-24 02:11:08'),
(6, 'Dune: Part Two', 'Sci-Fi, Drama', 'PG-13', '2h 46m', 'https://m.media-amazon.com/images/M/MV5BN2QyZGU4ZDctOWMzMy00NTc5LThlOGQtODhmNDI1NmY5YzAwXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_SX300.jpg', 'Paul Atreides unites with Chani and the Fremen while on a warpath of revenge against the conspirators who destroyed his family.', 'coming', '2026-04-24 02:11:08'),
(7, 'Furiosa', 'Action, Adventure', 'R', '2h 28m', 'https://placehold.co/200x300/13131a/e8003d?text=Furiosa', 'The origin story of renegade warrior Furiosa before she teamed up with Mad Max.', 'coming', '2026-04-24 02:11:08'),
(8, 'Inside Out 2', 'Animation, Comedy', 'PG', '1h 40m', 'https://placehold.co/200x300/13131a/e8003d?text=Inside+Out+2', 'Joy, Sadness, Anger, Fear and Disgust must handle a new emotion — Anxiety — as Riley enters the complicated world of being a teenager.', 'coming', '2026-04-24 02:11:08');

-- --------------------------------------------------------

--
-- Table structure for table `showtimes`
--

CREATE TABLE `showtimes` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `show_time` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `showtimes`
--

INSERT INTO `showtimes` (`id`, `movie_id`, `show_time`) VALUES
(1, 1, '10:00 AM'),
(2, 1, '01:00 PM'),
(3, 1, '04:30 PM'),
(4, 1, '08:00 PM'),
(5, 2, '11:00 AM'),
(6, 2, '02:30 PM'),
(7, 2, '06:00 PM'),
(8, 2, '09:30 PM'),
(9, 3, '11:00 AM'),
(10, 3, '02:30 PM'),
(11, 3, '06:30 PM'),
(12, 3, '09:30 PM'),
(13, 4, '10:30 AM'),
(14, 4, '01:30 PM'),
(15, 4, '05:00 PM'),
(16, 4, '08:30 PM'),
(17, 5, '12:00 PM'),
(18, 5, '03:00 PM'),
(19, 5, '07:00 PM'),
(20, 5, '10:00 PM'),
(21, 6, '11:30 AM'),
(22, 6, '02:45 PM'),
(23, 6, '06:15 PM'),
(24, 6, '09:45 PM'),
(25, 7, '10:15 AM'),
(26, 7, '01:45 PM'),
(27, 7, '05:30 PM'),
(28, 7, '09:00 PM'),
(29, 8, '10:00 AM'),
(30, 8, '12:30 PM'),
(31, 8, '03:00 PM'),
(32, 8, '06:00 PM');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booked_seats`
--
ALTER TABLE `booked_seats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_seat` (`movie_id`,`booking_date`,`showtime`,`seat_code`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_id` (`ticket_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `showtimes`
--
ALTER TABLE `showtimes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booked_seats`
--
ALTER TABLE `booked_seats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `showtimes`
--
ALTER TABLE `showtimes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booked_seats`
--
ALTER TABLE `booked_seats`
  ADD CONSTRAINT `booked_seats_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);

--
-- Constraints for table `showtimes`
--
ALTER TABLE `showtimes`
  ADD CONSTRAINT `showtimes_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
