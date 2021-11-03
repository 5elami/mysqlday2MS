-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 03. Nov 2021 um 14:44
-- Server-Version: 10.4.21-MariaDB
-- PHP-Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `BusCompany`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Busses`
--

CREATE TABLE `Busses` (
  `bus_ID` int(3) NOT NULL,
  `license` varchar(15) DEFAULT NULL,
  `Model` varchar(15) DEFAULT NULL,
  `capacity` int(2) DEFAULT NULL,
  `driver` varchar(20) DEFAULT NULL,
  `route_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Bus_stations`
--

CREATE TABLE `Bus_stations` (
  `station_ID` int(4) NOT NULL,
  `tel_number` varchar(30) DEFAULT NULL,
  `adress` varchar(50) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Routes`
--

CREATE TABLE `Routes` (
  `route_ID` int(3) NOT NULL,
  `departure` varchar(30) DEFAULT NULL,
  `destination` varchar(30) DEFAULT NULL,
  `distance` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Stop_Number`
--

CREATE TABLE `Stop_Number` (
  `stop_ID` int(4) NOT NULL,
  `fk_route_ID` int(3) DEFAULT NULL,
  `fk_station_ID` int(4) DEFAULT NULL,
  `route_number` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Busses`
--
ALTER TABLE `Busses`
  ADD PRIMARY KEY (`bus_ID`),
  ADD KEY `route_code` (`route_code`);

--
-- Indizes für die Tabelle `Bus_stations`
--
ALTER TABLE `Bus_stations`
  ADD PRIMARY KEY (`station_ID`);

--
-- Indizes für die Tabelle `Routes`
--
ALTER TABLE `Routes`
  ADD PRIMARY KEY (`route_ID`);

--
-- Indizes für die Tabelle `Stop_Number`
--
ALTER TABLE `Stop_Number`
  ADD PRIMARY KEY (`stop_ID`),
  ADD KEY `fk_route_ID` (`fk_route_ID`),
  ADD KEY `fk_station_ID` (`fk_station_ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Busses`
--
ALTER TABLE `Busses`
  MODIFY `bus_ID` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Bus_stations`
--
ALTER TABLE `Bus_stations`
  MODIFY `station_ID` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Routes`
--
ALTER TABLE `Routes`
  MODIFY `route_ID` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Stop_Number`
--
ALTER TABLE `Stop_Number`
  MODIFY `stop_ID` int(4) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Busses`
--
ALTER TABLE `Busses`
  ADD CONSTRAINT `busses_ibfk_1` FOREIGN KEY (`route_code`) REFERENCES `Routes` (`route_ID`);

--
-- Constraints der Tabelle `Stop_Number`
--
ALTER TABLE `Stop_Number`
  ADD CONSTRAINT `stop_number_ibfk_1` FOREIGN KEY (`fk_route_ID`) REFERENCES `Routes` (`route_ID`),
  ADD CONSTRAINT `stop_number_ibfk_2` FOREIGN KEY (`fk_station_ID`) REFERENCES `Bus_stations` (`station_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
