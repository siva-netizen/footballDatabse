-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2024 at 02:29 PM
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
-- Database: `isl`
--

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `attempt_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `login_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `login_successful` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `login_attempts`:
--   `user_id`
--       `users` -> `user_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `managers`
--

CREATE TABLE `managers` (
  `ManagerID` int(11) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Nationality` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `managers`:
--

--
-- Dumping data for table `managers`
--

INSERT INTO `managers` (`ManagerID`, `FirstName`, `LastName`, `DateOfBirth`, `Nationality`) VALUES
(101, 'Sergioo', 'Lobera', '1977-05-16', 'Spain'),
(102, 'Antonio', 'Habas', '1957-12-28', 'Spain'),
(103, 'Juan', 'Ferrando', '1980-05-18', 'Spain'),
(104, 'Marco', 'Pezzaiuoli', '1972-06-01', 'Germany'),
(105, 'Ivan', 'Vukomanovic', '1977-03-15', 'Serbia'),
(106, 'Owen', 'Coyle', '1966-07-14', 'Scotland'),
(107, 'Khalid', 'Jamil', '1977-06-27', 'India'),
(108, 'Manuel', 'Marquez', '1968-09-05', 'Spain'),
(109, 'Csaba', 'Laszlo', '1964-09-16', 'Hungary'),
(110, 'Kiko', 'Ramirez', '1970-01-10', 'Spain'),
(111, 'John', 'Doy', '1991-05-14', 'English'),
(114, 'Siva', 'Sabarivel', '1993-08-02', 'India'),
(115, 'snegith', 'mecllengn', '1985-12-12', 'Newzeland'),
(116, 'sanjeev', 'kumar', '1992-01-06', 'India'),
(117, 'siva', 'sakthi', '1995-01-02', 'india');

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `MatchID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Venue` varchar(255) DEFAULT NULL,
  `HomeTeamID` int(11) DEFAULT NULL,
  `AwayTeamID` int(11) DEFAULT NULL,
  `Result` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `matches`:
--   `HomeTeamID`
--       `teams` -> `TeamID`
--   `AwayTeamID`
--       `teams` -> `TeamID`
--

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`MatchID`, `Date`, `Venue`, `HomeTeamID`, `AwayTeamID`, `Result`) VALUES
(11, '2023-02-16', 'Mumbai Football Arena', 1, 2, '3-1'),
(12, '2023-02-19', 'Mumbai Football Arena', 1, 3, '2-0'),
(13, '2023-02-22', 'Mumbai Football Arena', 1, 4, '1-1'),
(14, '2023-02-25', 'Mumbai Football Arena', 1, 5, '2-1'),
(15, '2023-02-28', 'Mumbai Football Arena', 1, 6, '0-0'),
(16, '2023-03-05', 'Fatorda Stadium', 2, 1, '1-2'),
(17, '2023-03-08', 'Fatorda Stadium', 2, 3, '3-0'),
(18, '2023-03-11', 'Fatorda Stadium', 2, 4, '2-2'),
(19, '2023-03-14', 'Fatorda Stadium', 2, 5, '1-0'),
(20, '2023-03-17', 'Fatorda Stadium', 2, 6, '2-1'),
(21, '2023-03-20', 'Sree Kanteerava Stadium', 3, 1, '0-1'),
(22, '2023-03-23', 'Sree Kanteerava Stadium', 3, 2, '1-1'),
(23, '2023-03-26', 'Sree Kanteerava Stadium', 3, 4, '2-2'),
(24, '2023-03-29', 'Sree Kanteerava Stadium', 3, 5, '1-0'),
(25, '2023-04-01', 'Sree Kanteerava Stadium', 3, 6, '2-1'),
(26, '2023-04-04', 'Jawaharlal Nehru Stadium', 4, 1, '1-0'),
(27, '2023-04-07', 'Jawaharlal Nehru Stadium', 4, 2, '0-2'),
(28, '2023-04-10', 'Jawaharlal Nehru Stadium', 4, 3, '1-1'),
(29, '2023-04-13', 'Jawaharlal Nehru Stadium', 4, 5, '2-0'),
(30, '2023-04-16', 'Jawaharlal Nehru Stadium', 4, 6, '3-1'),
(31, '2023-04-19', 'Tilak Maidan Stadium', 5, 1, '2-2'),
(32, '2023-04-22', 'Tilak Maidan Stadium', 5, 2, '1-0'),
(33, '2023-04-25', 'Tilak Maidan Stadium', 5, 3, '0-1'),
(34, '2023-04-28', 'Tilak Maidan Stadium', 5, 4, '1-2'),
(35, '2023-05-01', 'Tilak Maidan Stadium', 5, 6, '2-1'),
(36, '2023-05-04', 'JRD Tata Sports Complex', 6, 1, '0-0'),
(37, '2023-05-07', 'JRD Tata Sports Complex', 6, 2, '1-2'),
(38, '2023-05-10', 'JRD Tata Sports Complex', 6, 3, '1-0'),
(39, '2023-05-13', 'JRD Tata Sports Complex', 6, 4, '2-2'),
(40, '2023-05-16', 'JRD Tata Sports Complex', 6, 5, '0-1'),
(41, '2023-05-19', 'Indira Gandhi Athletic Stadium', 7, 8, '1-0'),
(42, '2023-05-22', 'Indira Gandhi Athletic Stadium', 7, 9, '2-2'),
(43, '2023-05-25', 'Indira Gandhi Athletic Stadium', 7, 10, '0-1'),
(44, '2023-05-28', 'Indira Gandhi Athletic Stadium', 7, 1, '1-1'),
(45, '2023-06-01', 'Indira Gandhi Athletic Stadium', 7, 2, '0-1'),
(46, '2023-06-04', 'GMC Stadium', 8, 9, '3-2'),
(47, '2023-06-07', 'GMC Stadium', 8, 10, '2-1'),
(48, '2023-06-10', 'GMC Stadium', 8, 1, '1-0'),
(49, '2023-06-13', 'GMC Stadium', 8, 2, '2-2'),
(50, '2023-06-16', 'GMC Stadium', 8, 3, '1-1'),
(51, '2023-06-19', 'Jawaharlal Nehru Stadium', 9, 10, '0-2'),
(52, '2023-06-22', 'Jawaharlal Nehru Stadium', 9, 1, '2-1'),
(53, '2023-06-25', 'Jawaharlal Nehru Stadium', 9, 2, '1-0'),
(54, '2023-06-28', 'Jawaharlal Nehru Stadium', 9, 3, '2-2'),
(55, '2023-07-01', 'Jawaharlal Nehru Stadium', 9, 4, '1-1'),
(56, '2023-07-04', 'Kalinga Stadium', 10, 1, '2-0'),
(57, '2023-07-07', 'Kalinga Stadium', 10, 2, '1-3'),
(58, '2023-07-10', 'Kalinga Stadium', 10, 3, '0-1'),
(59, '2023-07-13', 'Kalinga Stadium', 10, 4, '1-2'),
(60, '2023-07-16', 'Kalinga Stadium', 10, 5, '0-1');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `PlayerID` int(11) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Nationality` varchar(255) DEFAULT NULL,
  `Position` varchar(50) DEFAULT NULL,
  `TeamID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `players`:
--   `TeamID`
--       `teams` -> `TeamID`
--   `TeamID`
--       `teams` -> `TeamID`
--

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`PlayerID`, `FirstName`, `LastName`, `DateOfBirth`, `Nationality`, `Position`, `TeamID`) VALUES
(1, 'Vikram Partap', 'Singh Sandhu', '2002-01-16', 'India', 'Forward', 1),
(2, 'Amrinder', 'Singh', '1993-05-27', 'India', 'Goalkeeper', 1),
(3, 'Hugo', 'Boumous', '1995-08-27', 'France', 'Midfielder', 1),
(4, 'Rowllin', 'Borges', '1992-08-05', 'India', 'Midfielder', 1),
(5, 'Mourtada', 'Fall', '1988-12-01', 'Senegal', 'Defender', 1),
(6, 'Bartholomew', 'Ogbeche', '1984-10-01', 'Nigeria', 'Forward', 1),
(7, 'Roy', 'Krishna', '1987-08-30', 'Fiji', 'Forward', 2),
(8, 'Arindam', 'Bhattacharya', '1989-05-25', 'India', 'Goalkeeper', 2),
(9, 'David', 'Williams', '1988-06-24', 'Australia', 'Forward', 2),
(10, 'Pritam', 'Kotal', '1993-08-05', 'India', 'Defender', 2),
(11, 'Carl', 'McHugh', '1993-08-23', 'Ireland', 'Midfielder', 2),
(12, 'Manvir', 'Singh', '1995-06-25', 'India', 'Forward', 2),
(13, 'Edu', 'Bedia', '1989-05-23', 'Spain', 'Midfielder', 3),
(14, 'Igor', 'Angulo', '1983-10-04', 'Spain', 'Forward', 3),
(15, 'Jorge', 'Ortiz', '1991-05-30', 'Spain', 'Midfielder', 3),
(16, 'Ivan', 'Gonzalez', '1991-01-09', 'Spain', 'Defender', 3),
(17, 'Seriton', 'Fernandes', '1993-06-07', 'India', 'Defender', 3),
(18, 'Lenny', 'Rodrigues', '1987-05-10', 'India', 'Midfielder', 3),
(19, 'Gurpreet', 'Singh Sandhu', '1992-02-03', 'India', 'Goalkeeper', 4),
(20, 'Sunil', 'Chhetri', '1984-08-03', 'India', 'Forward', 4),
(21, 'Erik', 'Paartalu', '1986-05-03', 'Australia', 'Midfielder', 4),
(22, 'Juanan', 'Gonzalez', '1987-11-21', 'Spain', 'Defender', 4),
(23, 'Ashique', 'Kuruniyan', '1997-06-17', 'India', 'Forward', 4),
(24, 'Dimas', 'Delgado', '1982-10-31', 'Spain', 'Midfielder', 4),
(25, 'Sergio', 'Cidoncha', '1985-02-17', 'Spain', 'Midfielder', 5),
(26, 'Gary', 'Hooper', '1988-01-26', 'England', 'Forward', 5),
(27, 'Vicente', 'Gomez', '1988-06-25', 'Spain', 'Midfielder', 5),
(28, 'Costa', 'Nhamoinesu', '1986-01-06', 'Zimbabwe', 'Defender', 5),
(29, 'Rahul', 'KP', '1998-03-24', 'India', 'Midfielder', 5),
(30, 'Jordan', 'Murray', '1994-05-17', 'Australia', 'Forward', 5),
(31, 'Peter', 'Hartley', '1988-06-27', 'England', 'Defender', 6),
(32, 'Nerijus', 'Valskis', '1987-07-26', 'Lithuania', 'Forward', 6),
(33, 'Stephen', 'Eze', '1994-03-28', 'Nigeria', 'Defender', 6),
(34, 'Aitor', 'Monroy', '1988-08-20', 'Spain', 'Midfielder', 6),
(35, 'Alex', 'Lima', '1995-03-08', 'Brazil', 'Midfielder', 6),
(36, 'Ricky', 'Lallawmawma', '1994-02-20', 'India', 'Defender', 6),
(37, 'Federico', 'Galan', '1993-06-14', 'Argentina', 'Midfielder', 7),
(38, 'Dylan', 'Fox', '1994-05-15', 'Australia', 'Defender', 7),
(39, 'Kwesi', 'Appiah', '1990-08-12', 'Ghana', 'Forward', 7),
(40, 'Luis', 'Machado', '1992-11-15', 'Portugal', 'Midfielder', 7),
(41, 'Benjamin', 'Lambot', '1987-09-01', 'Belgium', 'Defender', 7),
(42, 'VP', 'Suhair', '1995-02-26', 'India', 'Forward', 7),
(43, 'Aridane', 'Santana', '1987-01-23', 'Spain', 'Forward', 8),
(44, 'Lluis', 'Sastre', '1986-08-02', 'Spain', 'Midfielder', 8),
(45, 'Joao', 'Victor', '1989-11-14', 'Brazil', 'Midfielder', 8),
(46, 'Akash', 'Mishra', '2000-06-06', 'India', 'Defender', 8),
(47, 'Halicharan', 'Narzary', '1994-05-10', 'India', 'Midfielder', 8),
(48, 'Fran', 'Sandaza', '1984-01-23', 'Spain', 'Forward', 8),
(49, 'Rafael', 'Crivellaro', '1988-01-29', 'Brazil', 'Midfielder', 9),
(50, 'Esmael', 'Goncalves', '1986-05-12', 'Brazil', 'Forward', 9),
(51, 'Anirudh', 'Thapa', '1998-01-15', 'India', 'Midfielder', 9),
(52, 'Lallianzuala', 'Chhangte', '1997-08-06', 'India', 'Forward', 9),
(53, 'Eli', 'Sabia', '1988-06-25', 'Brazil', 'Defender', 9),
(54, 'Reagan', 'Singh', '1996-05-14', 'India', 'Defender', 9),
(55, 'Marcelinho', 'Pereira', '1987-05-20', 'Brazil', 'Forward', 10),
(56, 'Jerry', 'Mawihmingthanga', '1997-08-15', 'India', 'Midfielder', 10),
(57, 'Cole', 'Alexander', '1989-10-01', 'South Africa', 'Midfielder', 10),
(58, 'Arshdeep', 'Singh', '1998-05-05', 'India', 'Goalkeeper', 10),
(59, 'Paul', 'Ramfangzauva', '1996-08-20', 'India', 'Midfielder', 10),
(60, 'Manuel', 'Onwu', '1988-01-22', 'Spain', 'Forward', 10),
(61, 'siva', 'sakthi', '2002-01-09', 'India', 'Forward', 2),
(62, 'owe', 'Mck', '2002-12-12', 'soctland', 'defender', 14),
(63, 'Sergio', 'gomaz', '2003-12-31', 'spain', 'midfield', 14),
(64, 'sanjeev', 'kumar', '1999-09-09', 'India', 'goalkeeper', 14),
(65, 'vinoth', 'kumar', '2004-02-16', 'India', 'defender', 21);

-- --------------------------------------------------------

--
-- Table structure for table `teammanagers`
--

CREATE TABLE `teammanagers` (
  `TeamManagerID` int(11) NOT NULL,
  `TeamID` int(11) DEFAULT NULL,
  `ManagerID` int(11) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Status` varchar(50) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `teammanagers`:
--   `ManagerID`
--       `managers` -> `ManagerID`
--   `TeamID`
--       `teams` -> `TeamID`
--

--
-- Dumping data for table `teammanagers`
--

INSERT INTO `teammanagers` (`TeamManagerID`, `TeamID`, `ManagerID`, `StartDate`, `EndDate`, `Status`) VALUES
(201, 1, 101, '2022-06-01', '2023-12-31', 'Active'),
(202, 2, 102, '2022-06-01', '2023-12-31', 'Active'),
(203, 3, 103, '2022-06-01', '2023-12-31', 'Active'),
(204, 4, 104, '2022-06-01', '2023-12-31', 'Active'),
(205, 5, 105, '2022-06-01', '2023-12-31', 'Active'),
(206, 6, 106, '2022-06-01', '2023-12-31', 'Active'),
(207, 7, 107, '2022-06-01', '2023-12-31', 'Active'),
(208, 8, 108, '2022-06-01', '2023-12-31', 'Active'),
(209, 9, 109, '2022-06-01', '2023-12-31', 'Active'),
(210, 10, 110, '2022-06-01', '2023-12-31', 'Active'),
(211, 14, 114, '2023-01-01', '2023-12-31', 'Active'),
(217, 18, 111, '2023-12-03', '2024-12-04', 'Active'),
(223, 20, 115, '2023-12-02', '2024-12-01', 'Active'),
(226, 21, 115, '2023-12-05', '2023-12-05', 'Former'),
(227, 22, 117, '2023-12-05', '2024-12-01', 'Active');

--
-- Triggers `teammanagers`
--
DELIMITER $$
CREATE TRIGGER `after_update_TeamManagers` AFTER UPDATE ON `teammanagers` FOR EACH ROW BEGIN
    IF NEW.EndDate IS NOT NULL THEN
        UPDATE TeamManagers
        SET Status = 'Former'
        WHERE ManagerID = NEW.ManagerID
          AND TeamID = NEW.TeamID
          AND Status = 'Active';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_insert_TeamManagers` BEFORE INSERT ON `teammanagers` FOR EACH ROW BEGIN
    -- Find the existing record for the manager's current assignment
    DECLARE existingEndDate DATE;

    SELECT EndDate INTO existingEndDate
    FROM TeamManagers
    WHERE ManagerID = NEW.ManagerID AND Status = 'Active'
    ORDER BY StartDate DESC
    LIMIT 1;

    -- If there is an existing record, set the EndDate and Status for the new row
    IF existingEndDate IS NOT NULL THEN
        SET NEW.EndDate = NEW.StartDate, NEW.Status = 'Former';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_TeamManagers` BEFORE UPDATE ON `teammanagers` FOR EACH ROW BEGIN
    IF NEW.EndDate IS NOT NULL AND NEW.Status = 'Active' THEN
        UPDATE TeamManagers
        SET Status = 'Former'
        WHERE ManagerID = NEW.ManagerID
          AND TeamID = NEW.TeamID
          AND Status = 'Active';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `TeamID` int(11) NOT NULL,
  `TeamName` varchar(255) DEFAULT NULL,
  `EstablishedYear` int(11) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `teams`:
--

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`TeamID`, `TeamName`, `EstablishedYear`, `City`) VALUES
(1, 'Mumbai City FC', 2014, 'Mumbai'),
(2, 'ATK Mohun Bagan FC', 2014, 'Kolkata'),
(3, 'FC Goa', 2014, 'Goa'),
(4, 'Bengaluru FC', 2013, 'Bengaluru'),
(5, 'Kerala Blasters FC', 2014, 'Kochi'),
(6, 'Jamshedpur FC', 2017, 'Jamshedpur'),
(7, 'NorthEast United FC', 2014, 'Guwahati'),
(8, 'Hyderabad FC', 2019, 'Hyderabad'),
(9, 'Chennaiyin FC', 2014, 'Chennai'),
(10, 'Odisha FC', 2019, 'Bhubaneswar'),
(14, 'Punjab FC', 2019, 'Punjab'),
(18, 'Kashmir Rangers', 1998, 'Kashmir'),
(20, 'Rangers', 2023, 'bengaluru'),
(21, 'Deccan ', 1999, 'Hyderabad'),
(22, 'teqm2', 1999, 'covai'),
(23, 'kkl', 1995, 'kullakaplayam');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_role` enum('user','admin') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `users`:
--

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `email`, `registration_date`, `user_role`) VALUES
(1, 'siva', '$2y$10$66gO2xoTosYj/wbtSgS7Wu4/pMTc2vt4OGQz1yMsA0lUmwyhkbkTe', 'sivasabarivel008@gmail.com', '2023-12-02 20:02:45', 'user'),
(3, 'karan', '$2y$10$e7UFHxxu5V618P428tWRjOxrNhSuW16AGSEpR2Hjt2CmalemrXvC.', 'karan67@gmail.com', '2023-12-03 06:24:54', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`attempt_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `managers`
--
ALTER TABLE `managers`
  ADD PRIMARY KEY (`ManagerID`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`MatchID`),
  ADD KEY `HomeTeamID` (`HomeTeamID`),
  ADD KEY `AwayTeamID` (`AwayTeamID`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`PlayerID`),
  ADD KEY `TeamID` (`TeamID`);

--
-- Indexes for table `teammanagers`
--
ALTER TABLE `teammanagers`
  ADD PRIMARY KEY (`TeamManagerID`),
  ADD KEY `ManagerID` (`ManagerID`),
  ADD KEY `TeamID` (`TeamID`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`TeamID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `attempt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `managers`
--
ALTER TABLE `managers`
  MODIFY `ManagerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `MatchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `PlayerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `teammanagers`
--
ALTER TABLE `teammanagers`
  MODIFY `TeamManagerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `TeamID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD CONSTRAINT `login_attempts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`HomeTeamID`) REFERENCES `teams` (`TeamID`),
  ADD CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`AwayTeamID`) REFERENCES `teams` (`TeamID`);

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `FK_Players_Teams` FOREIGN KEY (`TeamID`) REFERENCES `teams` (`TeamID`),
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `teams` (`TeamID`);

--
-- Constraints for table `teammanagers`
--
ALTER TABLE `teammanagers`
  ADD CONSTRAINT `teammanagers_ibfk_2` FOREIGN KEY (`ManagerID`) REFERENCES `managers` (`ManagerID`),
  ADD CONSTRAINT `teammanagers_ibfk_3` FOREIGN KEY (`TeamID`) REFERENCES `teams` (`TeamID`) ON DELETE CASCADE;


--
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata for table login_attempts
--

--
-- Metadata for table managers
--

--
-- Metadata for table matches
--

--
-- Metadata for table players
--

--
-- Metadata for table teammanagers
--

--
-- Metadata for table teams
--

--
-- Metadata for table users
--

--
-- Metadata for database isl
--
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
