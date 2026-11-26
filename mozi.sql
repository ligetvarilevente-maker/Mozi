-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Nov 26. 17:19
-- Kiszolgáló verziója: 10.11.16-MariaDB
-- PHP verzió: 8.3.36

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
-- Tábla szerkezet ehhez a táblához `filmek`
--

CREATE TABLE `filmek` (
  `film_id` int(11) NOT NULL,
  `cim` varchar(100) NOT NULL,
  `mufaj` varchar(50) NOT NULL,
  `hossz_perc` int(11) NOT NULL,
  `korhatar` int(11) NOT NULL,
  `leiras` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `filmek`
--

INSERT INTO `filmek` (`film_id`, `cim`, `mufaj`, `hossz_perc`, `korhatar`, `leiras`) VALUES
(1, 'A jöttment bohóc Attila', 'Vígjáték', 95, 12, 'Attila, a különös bohóc váratlanul egy kisvárosba érkezik, ahol felforgatja a lakók mindennapjait. Furcsa kalandjai és humoros helyzetei során mindenki életét megváltoztatja.'),
(2, 'Orrbajnok kalandjai', 'Kaland-vígjáték', 105, 6, 'Egy különleges képességekkel rendelkező hős izgalmas és humoros kalandokba keveredik. Hatalmas orra segítségével olyan nyomokat szagol ki, amelyek mások képtelenek lettek volna.'),
(3, 'Pancser Botond és társai', 'Vígjáték', 110, 12, 'Botond és barátai mindig jó szándékkal vágnak bele a dolgokba, de valahogy minden tervük katasztrófába fullad. Vajon sikerül egyszer végre valamit elrontás nélkül megoldaniuk?'),
(4, 'Sárga lapos', 'Animációs családi film', 85, 6, 'Egy különleges sárga focilap kalandos útra indul, miután megelégeli, hogy egész életében csak szabálytalanságok büntetésére használják. Új barátaival együtt megtanulja, hogy mindenkinek jár egy második esély.'),
(5, 'Kéményseprő, füstjeles sánta Sántha mindennapjai', 'Horror', 130, 18, 'Sántha, a különösen kétbalkezes kéményseprő egy elhagyatott házba kap megbízást. Hamarosan hátborzongató hangokat hall a kéményből, és rájön, hogy valami sötét és természetfeletti dolog rejtőzik a falak között.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `mozitermek`
--

CREATE TABLE `mozitermek` (
  `terem_id` int(11) NOT NULL,
  `terem_nev` varchar(50) NOT NULL,
  `terem_tipus` varchar(30) NOT NULL,
  `sorok_szama` int(11) NOT NULL,
  `ferohely` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `mozitermek`
--

INSERT INTO `mozitermek` (`terem_id`, `terem_nev`, `terem_tipus`, `sorok_szama`, `ferohely`) VALUES
(1, '1-es terem', 'Normál terem', 10, 160),
(2, '2-es terem', 'Normál terem', 10, 160),
(3, '3-as terem', 'Normál terem', 10, 160),
(4, 'MADMINI terem', 'Kisterem', 6, 60),
(5, 'MADMAX terem', 'Nagyterem', 14, 252);

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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sorok`
--

CREATE TABLE `sorok` (
  `sor_id` int(11) NOT NULL,
  `terem_id` int(11) NOT NULL,
  `sor_szam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `sorok`
--

INSERT INTO `sorok` (`sor_id`, `terem_id`, `sor_szam`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 2, 1),
(12, 2, 2),
(13, 2, 3),
(14, 2, 4),
(15, 2, 5),
(16, 2, 6),
(17, 2, 7),
(18, 2, 8),
(19, 2, 9),
(20, 2, 10),
(21, 3, 1),
(22, 3, 2),
(23, 3, 3),
(24, 3, 4),
(25, 3, 5),
(26, 3, 6),
(27, 3, 7),
(28, 3, 8),
(29, 3, 9),
(30, 3, 10),
(31, 4, 1),
(32, 4, 2),
(33, 4, 3),
(34, 4, 4),
(35, 4, 5),
(36, 4, 6),
(37, 5, 1),
(38, 5, 2),
(39, 5, 3),
(40, 5, 4),
(41, 5, 5),
(42, 5, 6),
(43, 5, 7),
(44, 5, 8),
(45, 5, 9),
(46, 5, 10),
(47, 5, 11),
(48, 5, 12),
(49, 5, 13),
(50, 5, 14);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ulesek`
--

CREATE TABLE `ulesek` (
  `ules_id` int(11) NOT NULL,
  `sor_id` int(11) NOT NULL,
  `ules_szam` int(11) NOT NULL,
  `ules_tipus` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `ulesek`
--

INSERT INTO `ulesek` (`ules_id`, `sor_id`, `ules_szam`, `ules_tipus`) VALUES
(1, 1, 1, 'Normál'),
(2, 1, 2, 'Normál'),
(3, 1, 3, 'Normál'),
(4, 1, 4, 'Normál'),
(5, 1, 5, 'Normál'),
(6, 1, 6, 'Normál'),
(7, 1, 7, 'Normál'),
(8, 1, 8, 'Normál'),
(9, 1, 9, 'Normál'),
(10, 1, 10, 'Normál'),
(11, 1, 11, 'Normál'),
(12, 1, 12, 'Normál'),
(13, 1, 13, 'Normál'),
(14, 1, 14, 'Normál'),
(15, 2, 1, 'Normál'),
(16, 2, 2, 'Normál'),
(17, 2, 3, 'Normál'),
(18, 2, 4, 'Normál'),
(19, 2, 5, 'Normál'),
(20, 2, 6, 'Normál'),
(21, 2, 7, 'Normál'),
(22, 2, 8, 'Normál'),
(23, 2, 9, 'Normál'),
(24, 2, 10, 'Normál'),
(25, 2, 11, 'Normál'),
(26, 2, 12, 'Normál'),
(27, 2, 13, 'Normál'),
(28, 2, 14, 'Normál'),
(29, 2, 15, 'Normál'),
(30, 2, 16, 'Normál'),
(31, 3, 1, 'Normál'),
(32, 3, 2, 'Normál'),
(33, 3, 3, 'Normál'),
(34, 3, 4, 'Normál'),
(35, 3, 5, 'Normál'),
(36, 3, 6, 'Normál'),
(37, 3, 7, 'Normál'),
(38, 3, 8, 'Normál'),
(39, 3, 9, 'Normál'),
(40, 3, 10, 'Normál'),
(41, 3, 11, 'Normál'),
(42, 3, 12, 'Normál'),
(43, 3, 13, 'Normál'),
(44, 3, 14, 'Normál'),
(45, 3, 15, 'Normál'),
(46, 3, 16, 'Normál'),
(47, 4, 1, 'Normál'),
(48, 4, 2, 'Normál'),
(49, 4, 3, 'Normál'),
(50, 4, 4, 'Normál'),
(51, 4, 5, 'Normál'),
(52, 4, 6, 'Normál'),
(53, 4, 7, 'Normál'),
(54, 4, 8, 'Normál'),
(55, 4, 9, 'Normál'),
(56, 4, 10, 'Normál'),
(57, 4, 11, 'Normál'),
(58, 4, 12, 'Normál'),
(59, 4, 13, 'Normál'),
(60, 4, 14, 'Normál'),
(61, 4, 15, 'Normál'),
(62, 4, 16, 'Normál'),
(63, 5, 1, 'Normál'),
(64, 5, 2, 'Normál'),
(65, 5, 3, 'Normál'),
(66, 5, 4, 'Normál'),
(67, 5, 5, 'Normál'),
(68, 5, 6, 'Normál'),
(69, 5, 7, 'Normál'),
(70, 5, 8, 'Normál'),
(71, 5, 9, 'Normál'),
(72, 5, 10, 'Normál'),
(73, 5, 11, 'Normál'),
(74, 5, 12, 'Normál'),
(75, 5, 13, 'Normál'),
(76, 5, 14, 'Normál'),
(77, 5, 15, 'Normál'),
(78, 5, 16, 'Normál'),
(79, 6, 1, 'Normál'),
(80, 6, 2, 'Normál'),
(81, 6, 3, 'Normál'),
(82, 6, 4, 'Normál'),
(83, 6, 5, 'Normál'),
(84, 6, 6, 'Normál'),
(85, 6, 7, 'Normál'),
(86, 6, 8, 'Normál'),
(87, 6, 9, 'Normál'),
(88, 6, 10, 'Normál'),
(89, 6, 11, 'Normál'),
(90, 6, 12, 'Normál'),
(91, 6, 13, 'Normál'),
(92, 6, 14, 'Normál'),
(93, 6, 15, 'Normál'),
(94, 6, 16, 'Normál'),
(95, 7, 1, 'Normál'),
(96, 7, 2, 'Normál'),
(97, 7, 3, 'Normál'),
(98, 7, 4, 'Normál'),
(99, 7, 5, 'Normál'),
(100, 7, 6, 'Normál'),
(101, 7, 7, 'Normál'),
(102, 7, 8, 'Normál'),
(103, 7, 9, 'Normál'),
(104, 7, 10, 'Normál'),
(105, 7, 11, 'Normál'),
(106, 7, 12, 'Normál'),
(107, 7, 13, 'Normál'),
(108, 7, 14, 'Normál'),
(109, 7, 15, 'Normál'),
(110, 7, 16, 'Normál'),
(111, 8, 1, 'Normál'),
(112, 8, 2, 'Normál'),
(113, 8, 3, 'Normál'),
(114, 8, 4, 'Normál'),
(115, 8, 5, 'Normál'),
(116, 8, 6, 'Normál'),
(117, 8, 7, 'Normál'),
(118, 8, 8, 'Normál'),
(119, 8, 9, 'Normál'),
(120, 8, 10, 'Normál'),
(121, 8, 11, 'Normál'),
(122, 8, 12, 'Normál'),
(123, 8, 13, 'Normál'),
(124, 8, 14, 'Normál'),
(125, 8, 15, 'Normál'),
(126, 8, 16, 'Normál'),
(127, 9, 1, 'Normál'),
(128, 9, 2, 'Normál'),
(129, 9, 3, 'Normál'),
(130, 9, 4, 'Normál'),
(131, 9, 5, 'Normál'),
(132, 9, 6, 'Normál'),
(133, 9, 7, 'Normál'),
(134, 9, 8, 'Normál'),
(135, 9, 9, 'Normál'),
(136, 9, 10, 'Normál'),
(137, 9, 11, 'Normál'),
(138, 9, 12, 'Normál'),
(139, 9, 13, 'Normál'),
(140, 9, 14, 'Normál'),
(141, 10, 1, 'Normál'),
(142, 10, 2, 'Normál'),
(143, 10, 3, 'Normál'),
(144, 10, 4, 'Normál'),
(145, 10, 5, 'Normál'),
(146, 10, 6, 'Normál'),
(147, 10, 7, 'Normál'),
(148, 10, 8, 'Normál'),
(149, 10, 9, 'Normál'),
(150, 10, 10, 'Normál'),
(151, 10, 11, 'Normál'),
(152, 10, 12, 'Normál'),
(153, 10, 13, 'Normál'),
(154, 10, 14, 'Normál'),
(155, 11, 1, 'Normál'),
(156, 11, 2, 'Normál'),
(157, 11, 3, 'Normál'),
(158, 11, 4, 'Normál'),
(159, 11, 5, 'Normál'),
(160, 11, 6, 'Normál'),
(161, 11, 7, 'Normál'),
(162, 11, 8, 'Normál'),
(163, 11, 9, 'Normál'),
(164, 11, 10, 'Normál'),
(165, 11, 11, 'Normál'),
(166, 11, 12, 'Normál'),
(167, 11, 13, 'Normál'),
(168, 11, 14, 'Normál'),
(169, 12, 1, 'Normál'),
(170, 12, 2, 'Normál'),
(171, 12, 3, 'Normál'),
(172, 12, 4, 'Normál'),
(173, 12, 5, 'Normál'),
(174, 12, 6, 'Normál'),
(175, 12, 7, 'Normál'),
(176, 12, 8, 'Normál'),
(177, 12, 9, 'Normál'),
(178, 12, 10, 'Normál'),
(179, 12, 11, 'Normál'),
(180, 12, 12, 'Normál'),
(181, 12, 13, 'Normál'),
(182, 12, 14, 'Normál'),
(183, 12, 15, 'Normál'),
(184, 12, 16, 'Normál'),
(185, 13, 1, 'Normál'),
(186, 13, 2, 'Normál'),
(187, 13, 3, 'Normál'),
(188, 13, 4, 'Normál'),
(189, 13, 5, 'Normál'),
(190, 13, 6, 'Normál'),
(191, 13, 7, 'Normál'),
(192, 13, 8, 'Normál'),
(193, 13, 9, 'Normál'),
(194, 13, 10, 'Normál'),
(195, 13, 11, 'Normál'),
(196, 13, 12, 'Normál'),
(197, 13, 13, 'Normál'),
(198, 13, 14, 'Normál'),
(199, 13, 15, 'Normál'),
(200, 13, 16, 'Normál'),
(201, 14, 1, 'Normál'),
(202, 14, 2, 'Normál'),
(203, 14, 3, 'Normál'),
(204, 14, 4, 'Normál'),
(205, 14, 5, 'Normál'),
(206, 14, 6, 'Normál'),
(207, 14, 7, 'Normál'),
(208, 14, 8, 'Normál'),
(209, 14, 9, 'Normál'),
(210, 14, 10, 'Normál'),
(211, 14, 11, 'Normál'),
(212, 14, 12, 'Normál'),
(213, 14, 13, 'Normál'),
(214, 14, 14, 'Normál'),
(215, 14, 15, 'Normál'),
(216, 14, 16, 'Normál'),
(217, 15, 1, 'Normál'),
(218, 15, 2, 'Normál'),
(219, 15, 3, 'Normál'),
(220, 15, 4, 'Normál'),
(221, 15, 5, 'Normál'),
(222, 15, 6, 'Normál'),
(223, 15, 7, 'Normál'),
(224, 15, 8, 'Normál'),
(225, 15, 9, 'Normál'),
(226, 15, 10, 'Normál'),
(227, 15, 11, 'Normál'),
(228, 15, 12, 'Normál'),
(229, 15, 13, 'Normál'),
(230, 15, 14, 'Normál'),
(231, 15, 15, 'Normál'),
(232, 15, 16, 'Normál'),
(233, 16, 1, 'Normál'),
(234, 16, 2, 'Normál'),
(235, 16, 3, 'Normál'),
(236, 16, 4, 'Normál'),
(237, 16, 5, 'Normál'),
(238, 16, 6, 'Normál'),
(239, 16, 7, 'Normál'),
(240, 16, 8, 'Normál'),
(241, 16, 9, 'Normál'),
(242, 16, 10, 'Normál'),
(243, 16, 11, 'Normál'),
(244, 16, 12, 'Normál'),
(245, 16, 13, 'Normál'),
(246, 16, 14, 'Normál'),
(247, 16, 15, 'Normál'),
(248, 16, 16, 'Normál'),
(249, 17, 1, 'Normál'),
(250, 17, 2, 'Normál'),
(251, 17, 3, 'Normál'),
(252, 17, 4, 'Normál'),
(253, 17, 5, 'Normál'),
(254, 17, 6, 'Normál'),
(255, 17, 7, 'Normál'),
(256, 17, 8, 'Normál'),
(257, 17, 9, 'Normál'),
(258, 17, 10, 'Normál'),
(259, 17, 11, 'Normál'),
(260, 17, 12, 'Normál'),
(261, 17, 13, 'Normál'),
(262, 17, 14, 'Normál'),
(263, 17, 15, 'Normál'),
(264, 17, 16, 'Normál'),
(265, 18, 1, 'Normál'),
(266, 18, 2, 'Normál'),
(267, 18, 3, 'Normál'),
(268, 18, 4, 'Normál'),
(269, 18, 5, 'Normál'),
(270, 18, 6, 'Normál'),
(271, 18, 7, 'Normál'),
(272, 18, 8, 'Normál'),
(273, 18, 9, 'Normál'),
(274, 18, 10, 'Normál'),
(275, 18, 11, 'Normál'),
(276, 18, 12, 'Normál'),
(277, 18, 13, 'Normál'),
(278, 18, 14, 'Normál'),
(279, 18, 15, 'Normál'),
(280, 18, 16, 'Normál'),
(281, 19, 1, 'Normál'),
(282, 19, 2, 'Normál'),
(283, 19, 3, 'Normál'),
(284, 19, 4, 'Normál'),
(285, 19, 5, 'Normál'),
(286, 19, 6, 'Normál'),
(287, 19, 7, 'Normál'),
(288, 19, 8, 'Normál'),
(289, 19, 9, 'Normál'),
(290, 19, 10, 'Normál'),
(291, 19, 11, 'Normál'),
(292, 19, 12, 'Normál'),
(293, 19, 13, 'Normál'),
(294, 19, 14, 'Normál'),
(295, 20, 1, 'Normál'),
(296, 20, 2, 'Normál'),
(297, 20, 3, 'Normál'),
(298, 20, 4, 'Normál'),
(299, 20, 5, 'Normál'),
(300, 20, 6, 'Normál'),
(301, 20, 7, 'Normál'),
(302, 20, 8, 'Normál'),
(303, 20, 9, 'Normál'),
(304, 20, 10, 'Normál'),
(305, 20, 11, 'Normál'),
(306, 20, 12, 'Normál'),
(307, 20, 13, 'Normál'),
(308, 20, 14, 'Normál'),
(309, 21, 1, 'Normál'),
(310, 21, 2, 'Normál'),
(311, 21, 3, 'Normál'),
(312, 21, 4, 'Normál'),
(313, 21, 5, 'Normál'),
(314, 21, 6, 'Normál'),
(315, 21, 7, 'Normál'),
(316, 21, 8, 'Normál'),
(317, 21, 9, 'Normál'),
(318, 21, 10, 'Normál'),
(319, 21, 11, 'Normál'),
(320, 21, 12, 'Normál'),
(321, 21, 13, 'Normál'),
(322, 21, 14, 'Normál'),
(323, 22, 1, 'Normál'),
(324, 22, 2, 'Normál'),
(325, 22, 3, 'Normál'),
(326, 22, 4, 'Normál'),
(327, 22, 5, 'Normál'),
(328, 22, 6, 'Normál'),
(329, 22, 7, 'Normál'),
(330, 22, 8, 'Normál'),
(331, 22, 9, 'Normál'),
(332, 22, 10, 'Normál'),
(333, 22, 11, 'Normál'),
(334, 22, 12, 'Normál'),
(335, 22, 13, 'Normál'),
(336, 22, 14, 'Normál'),
(337, 22, 15, 'Normál'),
(338, 22, 16, 'Normál'),
(339, 23, 1, 'Normál'),
(340, 23, 2, 'Normál'),
(341, 23, 3, 'Normál'),
(342, 23, 4, 'Normál'),
(343, 23, 5, 'Normál'),
(344, 23, 6, 'Normál'),
(345, 23, 7, 'Normál'),
(346, 23, 8, 'Normál'),
(347, 23, 9, 'Normál'),
(348, 23, 10, 'Normál'),
(349, 23, 11, 'Normál'),
(350, 23, 12, 'Normál'),
(351, 23, 13, 'Normál'),
(352, 23, 14, 'Normál'),
(353, 23, 15, 'Normál'),
(354, 23, 16, 'Normál'),
(355, 24, 1, 'Normál'),
(356, 24, 2, 'Normál'),
(357, 24, 3, 'Normál'),
(358, 24, 4, 'Normál'),
(359, 24, 5, 'Normál'),
(360, 24, 6, 'Normál'),
(361, 24, 7, 'Normál'),
(362, 24, 8, 'Normál'),
(363, 24, 9, 'Normál'),
(364, 24, 10, 'Normál'),
(365, 24, 11, 'Normál'),
(366, 24, 12, 'Normál'),
(367, 24, 13, 'Normál'),
(368, 24, 14, 'Normál'),
(369, 24, 15, 'Normál'),
(370, 24, 16, 'Normál'),
(371, 25, 1, 'Normál'),
(372, 25, 2, 'Normál'),
(373, 25, 3, 'Normál'),
(374, 25, 4, 'Normál'),
(375, 25, 5, 'Normál'),
(376, 25, 6, 'Normál'),
(377, 25, 7, 'Normál'),
(378, 25, 8, 'Normál'),
(379, 25, 9, 'Normál'),
(380, 25, 10, 'Normál'),
(381, 25, 11, 'Normál'),
(382, 25, 12, 'Normál'),
(383, 25, 13, 'Normál'),
(384, 25, 14, 'Normál'),
(385, 25, 15, 'Normál'),
(386, 25, 16, 'Normál'),
(387, 26, 1, 'Normál'),
(388, 26, 2, 'Normál'),
(389, 26, 3, 'Normál'),
(390, 26, 4, 'Normál'),
(391, 26, 5, 'Normál'),
(392, 26, 6, 'Normál'),
(393, 26, 7, 'Normál'),
(394, 26, 8, 'Normál'),
(395, 26, 9, 'Normál'),
(396, 26, 10, 'Normál'),
(397, 26, 11, 'Normál'),
(398, 26, 12, 'Normál'),
(399, 26, 13, 'Normál'),
(400, 26, 14, 'Normál'),
(401, 26, 15, 'Normál'),
(402, 26, 16, 'Normál'),
(403, 27, 1, 'Normál'),
(404, 27, 2, 'Normál'),
(405, 27, 3, 'Normál'),
(406, 27, 4, 'Normál'),
(407, 27, 5, 'Normál'),
(408, 27, 6, 'Normál'),
(409, 27, 7, 'Normál'),
(410, 27, 8, 'Normál'),
(411, 27, 9, 'Normál'),
(412, 27, 10, 'Normál'),
(413, 27, 11, 'Normál'),
(414, 27, 12, 'Normál'),
(415, 27, 13, 'Normál'),
(416, 27, 14, 'Normál'),
(417, 27, 15, 'Normál'),
(418, 27, 16, 'Normál'),
(419, 28, 1, 'Normál'),
(420, 28, 2, 'Normál'),
(421, 28, 3, 'Normál'),
(422, 28, 4, 'Normál'),
(423, 28, 5, 'Normál'),
(424, 28, 6, 'Normál'),
(425, 28, 7, 'Normál'),
(426, 28, 8, 'Normál'),
(427, 28, 9, 'Normál'),
(428, 28, 10, 'Normál'),
(429, 28, 11, 'Normál'),
(430, 28, 12, 'Normál'),
(431, 28, 13, 'Normál'),
(432, 28, 14, 'Normál'),
(433, 28, 15, 'Normál'),
(434, 28, 16, 'Normál'),
(435, 29, 1, 'Normál'),
(436, 29, 2, 'Normál'),
(437, 29, 3, 'Normál'),
(438, 29, 4, 'Normál'),
(439, 29, 5, 'Normál'),
(440, 29, 6, 'Normál'),
(441, 29, 7, 'Normál'),
(442, 29, 8, 'Normál'),
(443, 29, 9, 'Normál'),
(444, 29, 10, 'Normál'),
(445, 29, 11, 'Normál'),
(446, 29, 12, 'Normál'),
(447, 29, 13, 'Normál'),
(448, 29, 14, 'Normál'),
(449, 30, 1, 'Normál'),
(450, 30, 2, 'Normál'),
(451, 30, 3, 'Normál'),
(452, 30, 4, 'Normál'),
(453, 30, 5, 'Normál'),
(454, 30, 6, 'Normál'),
(455, 30, 7, 'Normál'),
(456, 30, 8, 'Normál'),
(457, 30, 9, 'Normál'),
(458, 30, 10, 'Normál'),
(459, 30, 11, 'Normál'),
(460, 30, 12, 'Normál'),
(461, 30, 13, 'Normál'),
(462, 30, 14, 'Normál'),
(463, 31, 1, 'Normál'),
(464, 31, 2, 'Normál'),
(465, 31, 3, 'Normál'),
(466, 31, 4, 'Normál'),
(467, 31, 5, 'Normál'),
(468, 31, 6, 'Normál'),
(469, 31, 7, 'Normál'),
(470, 31, 8, 'Normál'),
(471, 32, 1, 'Normál'),
(472, 32, 2, 'Normál'),
(473, 32, 3, 'Normál'),
(474, 32, 4, 'Normál'),
(475, 32, 5, 'Normál'),
(476, 32, 6, 'Normál'),
(477, 32, 7, 'Normál'),
(478, 32, 8, 'Normál'),
(479, 32, 9, 'Normál'),
(480, 32, 10, 'Normál'),
(481, 33, 1, 'Normál'),
(482, 33, 2, 'Normál'),
(483, 33, 3, 'Normál'),
(484, 33, 4, 'Normál'),
(485, 33, 5, 'Normál'),
(486, 33, 6, 'Normál'),
(487, 33, 7, 'Normál'),
(488, 33, 8, 'Normál'),
(489, 33, 9, 'Normál'),
(490, 33, 10, 'Normál'),
(491, 34, 1, 'Normál'),
(492, 34, 2, 'Normál'),
(493, 34, 3, 'Normál'),
(494, 34, 4, 'Normál'),
(495, 34, 5, 'Normál'),
(496, 34, 6, 'Normál'),
(497, 34, 7, 'Normál'),
(498, 34, 8, 'Normál'),
(499, 34, 9, 'Normál'),
(500, 34, 10, 'Normál'),
(501, 35, 1, 'Normál'),
(502, 35, 2, 'Normál'),
(503, 35, 3, 'Normál'),
(504, 35, 4, 'Normál'),
(505, 35, 5, 'Normál'),
(506, 35, 6, 'Normál'),
(507, 35, 7, 'Normál'),
(508, 35, 8, 'Normál'),
(509, 35, 9, 'Normál'),
(510, 35, 10, 'Normál'),
(511, 36, 1, 'Normál'),
(512, 36, 2, 'Normál'),
(513, 36, 3, 'Normál'),
(514, 36, 4, 'Normál'),
(515, 36, 5, 'Normál'),
(516, 36, 6, 'Normál'),
(517, 36, 7, 'Normál'),
(518, 36, 8, 'Normál'),
(519, 37, 1, 'Normál'),
(520, 37, 2, 'Normál'),
(521, 37, 3, 'Normál'),
(522, 37, 4, 'Normál'),
(523, 37, 5, 'Normál'),
(524, 37, 6, 'Normál'),
(525, 37, 7, 'Normál'),
(526, 37, 8, 'Normál'),
(527, 37, 9, 'Normál'),
(528, 37, 10, 'Normál'),
(529, 37, 11, 'Normál'),
(530, 37, 12, 'Normál'),
(531, 37, 13, 'Normál'),
(532, 37, 14, 'Normál'),
(533, 37, 15, 'Normál'),
(534, 37, 16, 'Normál'),
(535, 37, 17, 'Normál'),
(536, 38, 1, 'Normál'),
(537, 38, 2, 'Normál'),
(538, 38, 3, 'Normál'),
(539, 38, 4, 'Normál'),
(540, 38, 5, 'Normál'),
(541, 38, 6, 'Normál'),
(542, 38, 7, 'Normál'),
(543, 38, 8, 'Normál'),
(544, 38, 9, 'Normál'),
(545, 38, 10, 'Normál'),
(546, 38, 11, 'Normál'),
(547, 38, 12, 'Normál'),
(548, 38, 13, 'Normál'),
(549, 38, 14, 'Normál'),
(550, 38, 15, 'Normál'),
(551, 38, 16, 'Normál'),
(552, 38, 17, 'Normál'),
(553, 39, 1, 'Normál'),
(554, 39, 2, 'Normál'),
(555, 39, 3, 'Normál'),
(556, 39, 4, 'Normál'),
(557, 39, 5, 'Normál'),
(558, 39, 6, 'Normál'),
(559, 39, 7, 'Normál'),
(560, 39, 8, 'Normál'),
(561, 39, 9, 'Normál'),
(562, 39, 10, 'Normál'),
(563, 39, 11, 'Normál'),
(564, 39, 12, 'Normál'),
(565, 39, 13, 'Normál'),
(566, 39, 14, 'Normál'),
(567, 39, 15, 'Normál'),
(568, 39, 16, 'Normál'),
(569, 39, 17, 'Normál'),
(570, 39, 18, 'Normál'),
(571, 39, 19, 'Normál'),
(572, 40, 1, 'Normál'),
(573, 40, 2, 'Normál'),
(574, 40, 3, 'Normál'),
(575, 40, 4, 'Normál'),
(576, 40, 5, 'Normál'),
(577, 40, 6, 'Normál'),
(578, 40, 7, 'Normál'),
(579, 40, 8, 'Normál'),
(580, 40, 9, 'Normál'),
(581, 40, 10, 'Normál'),
(582, 40, 11, 'Normál'),
(583, 40, 12, 'Normál'),
(584, 40, 13, 'Normál'),
(585, 40, 14, 'Normál'),
(586, 40, 15, 'Normál'),
(587, 40, 16, 'Normál'),
(588, 40, 17, 'Normál'),
(589, 40, 18, 'Normál'),
(590, 40, 19, 'Normál'),
(591, 41, 1, 'Normál'),
(592, 41, 2, 'Normál'),
(593, 41, 3, 'Normál'),
(594, 41, 4, 'Normál'),
(595, 41, 5, 'Normál'),
(596, 41, 6, 'Normál'),
(597, 41, 7, 'Normál'),
(598, 41, 8, 'Normál'),
(599, 41, 9, 'Normál'),
(600, 41, 10, 'Normál'),
(601, 41, 11, 'Normál'),
(602, 41, 12, 'Normál'),
(603, 41, 13, 'Normál'),
(604, 41, 14, 'Normál'),
(605, 41, 15, 'Normál'),
(606, 41, 16, 'Normál'),
(607, 41, 17, 'Normál'),
(608, 41, 18, 'Normál'),
(609, 41, 19, 'Normál'),
(610, 42, 1, 'Normál'),
(611, 42, 2, 'Normál'),
(612, 42, 3, 'Normál'),
(613, 42, 4, 'Normál'),
(614, 42, 5, 'Normál'),
(615, 42, 6, 'Normál'),
(616, 42, 7, 'Normál'),
(617, 42, 8, 'Normál'),
(618, 42, 9, 'Normál'),
(619, 42, 10, 'Normál'),
(620, 42, 11, 'Normál'),
(621, 42, 12, 'Normál'),
(622, 42, 13, 'Normál'),
(623, 42, 14, 'Normál'),
(624, 42, 15, 'Normál'),
(625, 42, 16, 'Normál'),
(626, 42, 17, 'Normál'),
(627, 42, 18, 'Normál'),
(628, 42, 19, 'Normál'),
(629, 43, 1, 'Normál'),
(630, 43, 2, 'Normál'),
(631, 43, 3, 'Normál'),
(632, 43, 4, 'Normál'),
(633, 43, 5, 'Normál'),
(634, 43, 6, 'Normál'),
(635, 43, 7, 'Normál'),
(636, 43, 8, 'Normál'),
(637, 43, 9, 'Normál'),
(638, 43, 10, 'Normál'),
(639, 43, 11, 'Normál'),
(640, 43, 12, 'Normál'),
(641, 43, 13, 'Normál'),
(642, 43, 14, 'Normál'),
(643, 43, 15, 'Normál'),
(644, 43, 16, 'Normál'),
(645, 43, 17, 'Normál'),
(646, 43, 18, 'Normál'),
(647, 43, 19, 'Normál'),
(648, 44, 1, 'Normál'),
(649, 44, 2, 'Normál'),
(650, 44, 3, 'Normál'),
(651, 44, 4, 'Normál'),
(652, 44, 5, 'Normál'),
(653, 44, 6, 'Normál'),
(654, 44, 7, 'Normál'),
(655, 44, 8, 'Normál'),
(656, 44, 9, 'Normál'),
(657, 44, 10, 'Normál'),
(658, 44, 11, 'Normál'),
(659, 44, 12, 'Normál'),
(660, 44, 13, 'Normál'),
(661, 44, 14, 'Normál'),
(662, 44, 15, 'Normál'),
(663, 44, 16, 'Normál'),
(664, 44, 17, 'Normál'),
(665, 44, 18, 'Normál'),
(666, 44, 19, 'Normál'),
(667, 45, 1, 'Normál'),
(668, 45, 2, 'Normál'),
(669, 45, 3, 'Normál'),
(670, 45, 4, 'Normál'),
(671, 45, 5, 'Normál'),
(672, 45, 6, 'Normál'),
(673, 45, 7, 'Normál'),
(674, 45, 8, 'Normál'),
(675, 45, 9, 'Normál'),
(676, 45, 10, 'Normál'),
(677, 45, 11, 'Normál'),
(678, 45, 12, 'Normál'),
(679, 45, 13, 'Normál'),
(680, 45, 14, 'Normál'),
(681, 45, 15, 'Normál'),
(682, 45, 16, 'Normál'),
(683, 45, 17, 'Normál'),
(684, 45, 18, 'Normál'),
(685, 45, 19, 'Normál'),
(686, 46, 1, 'Normál'),
(687, 46, 2, 'Normál'),
(688, 46, 3, 'Normál'),
(689, 46, 4, 'Normál'),
(690, 46, 5, 'Normál'),
(691, 46, 6, 'Normál'),
(692, 46, 7, 'Normál'),
(693, 46, 8, 'Normál'),
(694, 46, 9, 'Normál'),
(695, 46, 10, 'Normál'),
(696, 46, 11, 'Normál'),
(697, 46, 12, 'Normál'),
(698, 46, 13, 'Normál'),
(699, 46, 14, 'Normál'),
(700, 46, 15, 'Normál'),
(701, 46, 16, 'Normál'),
(702, 46, 17, 'Normál'),
(703, 46, 18, 'Normál'),
(704, 46, 19, 'Normál'),
(705, 47, 1, 'Normál'),
(706, 47, 2, 'Normál'),
(707, 47, 3, 'Normál'),
(708, 47, 4, 'Normál'),
(709, 47, 5, 'Normál'),
(710, 47, 6, 'Normál'),
(711, 47, 7, 'Normál'),
(712, 47, 8, 'Normál'),
(713, 47, 9, 'Normál'),
(714, 47, 10, 'Normál'),
(715, 47, 11, 'Normál'),
(716, 47, 12, 'Normál'),
(717, 47, 13, 'Normál'),
(718, 47, 14, 'Normál'),
(719, 47, 15, 'Normál'),
(720, 47, 16, 'Normál'),
(721, 47, 17, 'Normál'),
(722, 47, 18, 'Normál'),
(723, 47, 19, 'Normál'),
(724, 48, 1, 'Normál'),
(725, 48, 2, 'Normál'),
(726, 48, 3, 'Normál'),
(727, 48, 4, 'Normál'),
(728, 48, 5, 'Normál'),
(729, 48, 6, 'Normál'),
(730, 48, 7, 'Normál'),
(731, 48, 8, 'Normál'),
(732, 48, 9, 'Normál'),
(733, 48, 10, 'Normál'),
(734, 48, 11, 'Normál'),
(735, 48, 12, 'Normál'),
(736, 48, 13, 'Normál'),
(737, 48, 14, 'Normál'),
(738, 48, 15, 'Normál'),
(739, 48, 16, 'Normál'),
(740, 48, 17, 'Normál'),
(741, 48, 18, 'Normál'),
(742, 48, 19, 'Normál'),
(743, 49, 1, 'Normál'),
(744, 49, 2, 'Normál'),
(745, 49, 3, 'Normál'),
(746, 49, 4, 'Normál'),
(747, 49, 5, 'Normál'),
(748, 49, 6, 'Normál'),
(749, 49, 7, 'Normál'),
(750, 49, 8, 'Normál'),
(751, 49, 9, 'Normál'),
(752, 49, 10, 'Normál'),
(753, 49, 11, 'Normál'),
(754, 49, 12, 'Normál'),
(755, 49, 13, 'Normál'),
(756, 49, 14, 'Normál'),
(757, 49, 15, 'Normál'),
(758, 49, 16, 'Normál'),
(759, 49, 17, 'Normál'),
(760, 49, 18, 'Normál'),
(761, 49, 19, 'Normál'),
(762, 50, 1, 'Normál'),
(763, 50, 2, 'Normál'),
(764, 50, 3, 'Normál'),
(765, 50, 4, 'Normál'),
(766, 50, 5, 'Normál'),
(767, 50, 6, 'Normál'),
(768, 50, 7, 'Normál'),
(769, 50, 8, 'Normál'),
(770, 50, 9, 'Normál'),
(771, 50, 10, 'Normál'),
(772, 50, 11, 'Normál'),
(773, 50, 12, 'Normál'),
(774, 50, 13, 'Normál'),
(775, 50, 14, 'Normál'),
(776, 50, 15, 'Normál'),
(777, 50, 16, 'Normál'),
(778, 50, 17, 'Normál'),
(779, 50, 18, 'Normál'),
(780, 50, 19, 'Normál');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vetitesek`
--

CREATE TABLE `vetitesek` (
  `vetites_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `terem_id` int(11) NOT NULL,
  `kezdes` datetime NOT NULL,
  `befejezes` datetime NOT NULL,
  `jegyar` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `vetitesek`
--

INSERT INTO `vetitesek` (`vetites_id`, `film_id`, `terem_id`, `kezdes`, `befejezes`, `jegyar`) VALUES
(6, 1, 1, '2027-06-12 14:00:00', '2026-11-27 15:35:00', 3375.00),
(7, 2, 2, '2027-06-15 14:00:00', '2026-11-27 15:45:00', 3600.00),
(8, 3, 3, '2027-06-16 14:00:00', '2026-11-27 15:50:00', 3150.00),
(9, 4, 4, '2027-06-20 14:00:00', '2026-11-27 15:25:00', 2000.00),
(10, 5, 5, '2027-06-22 14:00:00', '2026-11-27 15:40:00', 4500.00),
(11, 1, 1, '2027-06-12 15:00:00', '2026-11-27 16:35:00', 3375.00),
(12, 2, 2, '2027-06-15 08:00:00', '2026-11-27 09:50:00', 3600.00),
(13, 3, 3, '2027-06-16 12:00:00', '2026-11-27 13:45:00', 3150.00),
(14, 4, 4, '2027-06-20 19:00:00', '2026-11-27 20:25:00', 2000.00),
(15, 5, 5, '2027-06-22 22:00:00', '2026-11-27 00:10:00', 4500.00);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `filmek`
--
ALTER TABLE `filmek`
  ADD PRIMARY KEY (`film_id`);

--
-- A tábla indexei `mozitermek`
--
ALTER TABLE `mozitermek`
  ADD PRIMARY KEY (`terem_id`);

--
-- A tábla indexei `regisztracio`
--
ALTER TABLE `regisztracio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emailcim` (`emailcim`);

--
-- A tábla indexei `sorok`
--
ALTER TABLE `sorok`
  ADD PRIMARY KEY (`sor_id`),
  ADD KEY `terem_id` (`terem_id`);

--
-- A tábla indexei `ulesek`
--
ALTER TABLE `ulesek`
  ADD PRIMARY KEY (`ules_id`),
  ADD KEY `sor_id` (`sor_id`);

--
-- A tábla indexei `vetitesek`
--
ALTER TABLE `vetitesek`
  ADD PRIMARY KEY (`vetites_id`),
  ADD KEY `film_id` (`film_id`),
  ADD KEY `terem_id` (`terem_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `filmek`
--
ALTER TABLE `filmek`
  MODIFY `film_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `mozitermek`
--
ALTER TABLE `mozitermek`
  MODIFY `terem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `regisztracio`
--
ALTER TABLE `regisztracio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `sorok`
--
ALTER TABLE `sorok`
  MODIFY `sor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT a táblához `ulesek`
--
ALTER TABLE `ulesek`
  MODIFY `ules_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=781;

--
-- AUTO_INCREMENT a táblához `vetitesek`
--
ALTER TABLE `vetitesek`
  MODIFY `vetites_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `sorok`
--
ALTER TABLE `sorok`
  ADD CONSTRAINT `sorok_ibfk_1` FOREIGN KEY (`terem_id`) REFERENCES `mozitermek` (`terem_id`);

--
-- Megkötések a táblához `ulesek`
--
ALTER TABLE `ulesek`
  ADD CONSTRAINT `ulesek_ibfk_1` FOREIGN KEY (`sor_id`) REFERENCES `sorok` (`sor_id`);

--
-- Megkötések a táblához `vetitesek`
--
ALTER TABLE `vetitesek`
  ADD CONSTRAINT `vetitesek_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `filmek` (`film_id`),
  ADD CONSTRAINT `vetitesek_ibfk_2` FOREIGN KEY (`terem_id`) REFERENCES `mozitermek` (`terem_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
