-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Nov 25. 20:38
-- Kiszolgáló verziója: 10.11.19-MariaDB
-- PHP verzió: 8.5.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `mozi`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bufe_termek`
--

CREATE TABLE `bufe_termek` (
  `id` int(11) NOT NULL,
  `nev` varchar(50) NOT NULL,
  `fajta` varchar(50) NOT NULL,
  `meret` varchar(20) NOT NULL,
  `ar` int(10) NOT NULL,
  `kategoria` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `bufe_termek`
--

INSERT INTO `bufe_termek` (`id`, `nev`, `fajta`, `meret`, `ar`, `kategoria`) VALUES
(1, 'Popcorn', 'sos', 'kicsi', 700, 'sos'),
(2, 'Popcorn', 'sos', 'kozepes', 1000, 'sos'),
(3, 'Popcorn', 'sos', 'nagy', 1300, 'sos'),
(4, 'Popcorn', 'baconos', 'kicsi', 800, 'sos'),
(5, 'Popcorn', 'baconos', 'kozepes', 1100, 'sos'),
(6, 'Popcorn', 'baconos', 'nagy', 1400, 'sos'),
(7, 'Popcorn', 'sajtos', 'kicsi', 800, 'sos'),
(8, 'Popcorn', 'sajtos', 'kozepes', 1100, 'sos'),
(9, 'Popcorn', 'sajtos', 'nagy', 1400, 'sos'),
(10, 'Nachos', 'sos', 'kicsi', 900, 'sos'),
(11, 'Nachos', 'sos', 'kozepes', 1200, 'sos'),
(12, 'Nachos', 'sos', 'nagy', 1500, 'sos'),
(13, 'Nachos', 'baconos', 'kicsi', 1000, 'sos'),
(14, 'Nachos', 'baconos', 'kozepes', 1300, 'sos'),
(15, 'Nachos', 'baconos', 'nagy', 1600, 'sos'),
(16, 'Nachos', 'sajtos', 'kicsi', 1000, 'sos'),
(17, 'Nachos', 'sajtos', 'kozepes', 1300, 'sos'),
(18, 'Nachos', 'sajtos', 'nagy', 1600, 'sos'),
(19, 'Ital', 'Buborék Kóla', 'kicsi', 500, 'ital'),
(20, 'Ital', 'Buborék Kóla', 'kozepes', 700, 'ital'),
(21, 'Ital', 'Buborék Kóla', 'nagy', 900, 'ital'),
(22, 'Ital', 'Citrom Limonádé', 'kicsi', 500, 'ital'),
(23, 'Ital', 'Citrom Limonádé', 'kozepes', 700, 'ital'),
(24, 'Ital', 'Citrom Limonádé', 'nagy', 900, 'ital'),
(25, 'Ital', 'Narancs Szóda', 'kicsi', 500, 'ital'),
(26, 'Ital', 'Narancs Szóda', 'kozepes', 700, 'ital'),
(27, 'Ital', 'Narancs Szóda', 'nagy', 900, 'ital'),
(28, 'Ital', 'Alma Friss', 'kicsi', 500, 'ital'),
(29, 'Ital', 'Alma Friss', 'kozepes', 700, 'ital'),
(30, 'Ital', 'Alma Friss', 'nagy', 900, 'ital'),
(31, 'Ital', 'Szölő Buborék', 'kicsi', 500, 'ital'),
(32, 'Ital', 'Szölő Buborék', 'kozepes', 700, 'ital'),
(33, 'Ital', 'Szölő Buborék', 'nagy', 900, 'ital'),
(34, 'Ital', 'Tropi Mix', 'kicsi', 500, 'ital'),
(35, 'Ital', 'Tropi Mix', 'kozepes', 700, 'ital'),
(36, 'Ital', 'Tropi Mix', 'nagy', 900, 'ital'),
(37, 'Szósz', 'sajtos', 'kicsi', 300, 'szosz'),
(38, 'Szósz', 'sajtos', 'nagy', 500, 'szosz'),
(39, 'Szósz', 'salsa', 'kicsi', 300, 'szosz'),
(40, 'Szósz', 'salsa', 'nagy', 500, 'szosz'),
(41, 'Szósz', 'sajtos', 'kicsi', 300, 'szosz'),
(42, 'Szósz', 'sajtos', 'nagy', 500, 'szosz'),
(43, 'Szósz', 'salsa', 'kicsi', 300, 'szosz'),
(44, 'Szósz', 'salsa', 'nagy', 500, 'szosz'),
(45, 'Jégkása', 'cseresznyés', 'kicsi', 500, 'ital'),
(46, 'Jégkása', 'cseresznyés', 'nagy', 700, 'ital'),
(47, 'Jégkása', 'szőlős', 'kicsi', 500, 'ital'),
(48, 'Jégkása', 'szőlős', 'nagy', 700, 'ital'),
(49, 'Film Falat', 'cseresznyés', 'kicsi', 400, 'edes'),
(50, 'Film Falat', 'cseresznyés', 'nagy', 600, 'edes'),
(51, 'Film Falat', 'kekszes', 'kicsi', 400, 'edes'),
(52, 'Film Falat', 'kekszes', 'nagy', 600, 'edes'),
(53, 'Film Falat', 'csokis', 'kicsi', 400, 'edes'),
(54, 'Film Falat', 'csokis', 'nagy', 600, 'edes'),
(55, 'Film Falat', 'vaníliás', 'kicsi', 400, 'edes'),
(56, 'Film Falat', 'vaníliás', 'nagy', 600, 'edes');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `leiras` varchar(255) DEFAULT NULL,
  `ar` int(11) NOT NULL,
  `kategoria` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `menu`
--

INSERT INTO `menu` (`id`, `nev`, `leiras`, `ar`, `kategoria`) VALUES
(1, 'Popcorn menü kicsi', 'Kicsi popcorn + kicsi üdítő (ital)', 1150, 'menu'),
(2, 'Popcorn menü közepes', 'Közepes popcorn + közepes üdítő (ital)', 1600, 'menu'),
(3, 'Popcorn menü nagy', 'Nagy popcorn + nagy üdítő (ital)', 2050, 'menu'),
(4, 'Nachos menü kicsi', 'Kicsi nachos + kicsi üdítő (ital)', 1350, 'menu'),
(5, 'Nachos menü közepes', 'Közepes nachos + közepes üdítő (ital)', 1800, 'menu'),
(6, 'Nachos menü nagy', 'Nagy nachos + nagy üdítő (ital)', 2250, 'menu'),
(7, 'Családi menü 1', '2 nagy popcorn + 4 nagy üdítő (ital)', 5900, 'csaladi'),
(8, 'Családi menü 2', '4 nagy nachos + 4 nagy üdítő (ital)', 9200, 'csaladi'),
(9, 'Páros menü', '2 közepes popcorn + 2 nagy üdítő (ital)', 3650, 'paros'),
(10, 'Jégkása menü', '1 jégkása (cseresznyés vagy szőlő) + 1 közepes üdítő (ital)', 1100, 'jegkas'),
(11, 'Dupla jégkása menü', '2 jégkása (cseresznyés vagy szőlő), kedvezményes áron', 1300, 'jegkas'),
(12, 'Film Falat menü', '1 Film Falat (cseresznyés, kekszes, csokis vagy vaníliás) + 1 közepes üdítő (ital)', 1000, 'edes'),
(13, 'Páros menü 2', '2 közepes nachos + 2 nagy üdítő (ital)', 4000, 'paros');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `regisztracio`
--

CREATE TABLE `regisztracio` (
  `id` int(11) NOT NULL,
  `nev` varchar(150) NOT NULL,
  `emailcim` varchar(30) NOT NULL,
  `telszam` varchar(30) NOT NULL,
  `szuletesi_datum` date NOT NULL,
  `jelszo` varchar(255) NOT NULL,
  `regisztralt_datum` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `bufe_termek`
--
ALTER TABLE `bufe_termek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `regisztracio`
--
ALTER TABLE `regisztracio`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `bufe_termek`
--
ALTER TABLE `bufe_termek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT a táblához `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `regisztracio`
--
ALTER TABLE `regisztracio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
