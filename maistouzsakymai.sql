-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2023 at 10:46 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `maistouzsakymai`
--

-- --------------------------------------------------------

--
-- Table structure for table `istaigos`
--

CREATE TABLE `istaigos` (
  `id` int(11) NOT NULL,
  `pavadinimas` varchar(255) NOT NULL,
  `kodas` int(11) NOT NULL,
  `adresas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `istaigos`
--

INSERT INTO `istaigos` (`id`, `pavadinimas`, `kodas`, `adresas`) VALUES
(1, 'Šventas dūmas', 999999999, 'Šv. Gertrūdos g. 10, 44260 Kaunas'),
(2, 'Raudondvario dvaro oranžerija', 666666666, 'Pilies takas 1, Raudondvaris'),
(3, 'Boheme house', 333333333, 'Muitinės g. 9, KAUNAS');

-- --------------------------------------------------------

--
-- Table structure for table `patiekalai`
--

CREATE TABLE `patiekalai` (
  `id` int(11) NOT NULL,
  `valgiarastis` int(11) DEFAULT NULL,
  `pavadinimas` varchar(255) DEFAULT NULL,
  `aprasas` text DEFAULT NULL,
  `kaina` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patiekalai`
--

INSERT INTO `patiekalai` (`id`, `valgiarastis`, `pavadinimas`, `aprasas`, `kaina`) VALUES
(1, 1, 'Žaliasis omletas', 'Špinatai, kiaušiniai, varškės sūris, edamame', '7.80'),
(2, 1, 'Boheme varškėčiai', 'Purūs varškėčiai su citrusiniu jogurtu, karamelės padažu, uogiene', '6.00'),
(3, 1, 'Tuno kremo skrebutis', 'Naminis tuno kremas, marinuotos daržovės, alyvuogės, džiovinti pomidorai', '8.00'),
(4, 2, 'Kambarinės Felicijos svajonė', 'Riebiosios ančių kepenėlės su mėlynuoju sūriu įdaryta kriaušė', '14.90'),
(5, 2, 'Grafo Henriko kelionių prisiminimai', 'Salotos su anties krūtinėle, datulėmis, graikiniais riešutais, apelsinais', '9.00'),
(6, 2, 'Grafienės Rozalijos užgaida', 'Veršienos nugarinė, marinuoti vynuogių lapai, įdarytos mažosios paprikos, kepti grybai', '22.00'),
(7, 3, 'Dark forest burger\r\n', 'Black Angus beef, butter-fried enoki mushrooms, Gongonzola cheese,\r\nseed bread, smoked Kurobuta bacon, homemade honey BBQ sauce', '10.90'),
(8, 3, 'Kalafijorų sriuba', 'Kreminė kalafijorų sriuba su česnakiniu skrebučiu', '4.00'),
(9, 3, 'Tacos su mėsa ir salotomis', 'Galimybė pasirinkti: Tacos su vištiena arba su jautiena + meksikietiškos salotos', '5.00'),
(10, 3, 'Grilintos vištienos burgeris', 'Ant griliaus keptos BBQ vištienos burgeria su bulvių skiltelėmis ', '5.00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'Administratorius'),
(2, 'Klientas');

-- --------------------------------------------------------

--
-- Table structure for table `uzsakymai`
--

CREATE TABLE `uzsakymai` (
  `id` int(11) NOT NULL,
  `vartotojas` int(11) DEFAULT NULL,
  `uzsakymas` int(11) DEFAULT NULL,
  `patiekalas` int(11) DEFAULT NULL,
  `kiekis` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `uzsakymai`
--

INSERT INTO `uzsakymai` (`id`, `vartotojas`, `uzsakymas`, `patiekalas`, `kiekis`) VALUES
(1, 1, 111111, 1, 2),
(2, 2, 222222, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `valgiarasciai`
--

CREATE TABLE `valgiarasciai` (
  `id` int(11) NOT NULL,
  `pavadinimas` varchar(255) DEFAULT NULL,
  `istaiga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `valgiarasciai`
--

INSERT INTO `valgiarasciai` (`id`, `pavadinimas`, `istaiga`) VALUES
(1, 'Vėlyvieji pusryčiai', 3),
(2, 'Dvariškas meniu', 2),
(3, 'Magiškas dūmo skonis', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vartotojai`
--

CREATE TABLE `vartotojai` (
  `id` int(11) NOT NULL,
  `vardas` varchar(255) DEFAULT NULL,
  `pavarde` varchar(255) DEFAULT NULL,
  `elpastas` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `pseudonimas` varchar(255) DEFAULT NULL,
  `slaptazodis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vartotojai`
--

INSERT INTO `vartotojai` (`id`, `vardas`, `pavarde`, `elpastas`, `role`, `pseudonimas`, `slaptazodis`) VALUES
(1, 'Eglė', 'Valušytė', 'egle.valusyte@stud.kitm.lt', 1, 'eglevalu', 'abc'),
(2, 'Indrė', 'Indriūtė', 'indre@pastas.lt', 2, 'indreindriute', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `istaigos`
--
ALTER TABLE `istaigos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patiekalai`
--
ALTER TABLE `patiekalai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `valgiarastis` (`valgiarastis`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uzsakymai`
--
ALTER TABLE `uzsakymai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vartotojas` (`vartotojas`),
  ADD KEY `patiekalas` (`patiekalas`);

--
-- Indexes for table `valgiarasciai`
--
ALTER TABLE `valgiarasciai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `istaiga` (`istaiga`);

--
-- Indexes for table `vartotojai`
--
ALTER TABLE `vartotojai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `istaigos`
--
ALTER TABLE `istaigos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `patiekalai`
--
ALTER TABLE `patiekalai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `uzsakymai`
--
ALTER TABLE `uzsakymai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `valgiarasciai`
--
ALTER TABLE `valgiarasciai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vartotojai`
--
ALTER TABLE `vartotojai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `patiekalai`
--
ALTER TABLE `patiekalai`
  ADD CONSTRAINT `patiekalai_ibfk_1` FOREIGN KEY (`valgiarastis`) REFERENCES `valgiarasciai` (`id`);

--
-- Constraints for table `uzsakymai`
--
ALTER TABLE `uzsakymai`
  ADD CONSTRAINT `uzsakymai_ibfk_1` FOREIGN KEY (`vartotojas`) REFERENCES `vartotojai` (`id`),
  ADD CONSTRAINT `uzsakymai_ibfk_2` FOREIGN KEY (`patiekalas`) REFERENCES `patiekalai` (`id`);

--
-- Constraints for table `valgiarasciai`
--
ALTER TABLE `valgiarasciai`
  ADD CONSTRAINT `valgiarasciai_ibfk_1` FOREIGN KEY (`istaiga`) REFERENCES `istaigos` (`id`);

--
-- Constraints for table `vartotojai`
--
ALTER TABLE `vartotojai`
  ADD CONSTRAINT `vartotojai_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
