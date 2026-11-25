-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Nov 25. 20:28
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
-- Tábla szerkezet ehhez a táblához `regisztracio`
--

CREATE TABLE `regisztracio` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `emailcim` varchar(150) NOT NULL,
  `telszam` varchar(30) NOT NULL,
  `szuletesi_datum` date NOT NULL,
  `jelszo` varchar(255) NOT NULL,
  `regisztralt_datum` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `regisztracio`
--

INSERT INTO `regisztracio` (`id`, `nev`, `emailcim`, `telszam`, `szuletesi_datum`, `jelszo`, `regisztralt_datum`) VALUES
(1, 'Teszt', 'teszt@gmail.com', '06204588854', '0000-00-00', 'Teszt123', '2026-11-24 20:37:51');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `regisztracio`
--
ALTER TABLE `regisztracio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emailcim` (`emailcim`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `regisztracio`
--
ALTER TABLE `regisztracio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
