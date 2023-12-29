-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 17 déc. 2023 à 13:49
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT current_timestamp(),
  `icone` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `libelle`, `description`, `date_creation`, `icone`) VALUES
(1, 'Mobile phone', 'Mobile Phone category', '2022-10-31 20:51:03', 'fas fa-mobile-alt'),
(3, 'Fashion', 'Fashion products', '2022-11-02 19:41:49', 'fas fa-tshirt'),
(6, 'TV', 'TV categories', '2022-11-11 20:08:52', 'fa-thin fa-tv'),
(7, 'Shoes', 'Shoes Categories', '2022-11-14 21:00:51', 'fas fa-shoe-prints'),
(8, 'Cosmetic', 'Make UP', '2022-11-17 16:33:29', 'fas fa-paint-brush'),
(9, 'Accessoires', 'Categories for accessoires', '2022-11-18 18:47:26', 'fas fa-shopping-bag');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `valide` int(11) NOT NULL DEFAULT 0,
  `date_creation` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `id_client`, `total`, `valide`, `date_creation`) VALUES
(1, 3, 7500, 0, '2022-12-03 16:34:00'),
(2, 3, 7500, 0, '2022-12-03 16:34:03'),
(3, 3, 7500, 0, '2022-12-03 16:34:06'),
(4, 3, 7500, 0, '2022-12-03 16:43:09'),
(5, 3, 32700, 0, '2022-12-03 16:43:34'),
(6, 3, 6300, 0, '2022-12-03 16:44:04'),
(7, 3, 6300, 0, '2022-12-03 17:02:19'),
(8, 3, 6300, 0, '2022-12-03 17:03:15'),
(9, 3, 6300, 0, '2022-12-03 17:04:57'),
(10, 3, 6300, 0, '2022-12-03 17:05:06'),
(11, 3, 6300, 0, '2022-12-03 17:29:10'),
(12, 3, 18900, 0, '2022-12-03 17:31:32'),
(13, 3, 25200, 0, '2022-12-03 17:31:43'),
(14, 3, 25200, 0, '2022-12-03 17:33:06'),
(15, 3, 25200, 0, '2022-12-03 17:33:15'),
(16, 3, 25200, 0, '2022-12-03 17:33:30'),
(17, 3, 25200, 0, '2022-12-03 17:34:09'),
(18, 3, 25200, 0, '2022-12-03 17:34:37'),
(19, 3, 25200, 0, '2022-12-03 17:34:52'),
(20, 3, 25200, 0, '2022-12-03 17:35:28'),
(21, 3, 25200, 0, '2022-12-03 17:35:50'),
(22, 3, 25200, 0, '2022-12-03 17:35:57'),
(23, 3, 25200, 0, '2022-12-03 17:36:21'),
(24, 3, 25200, 0, '2022-12-03 17:36:29'),
(25, 3, 75, 0, '2022-12-03 20:20:42'),
(26, 3, 75, 0, '2022-12-03 20:22:00'),
(27, 3, 75, 0, '2022-12-03 20:27:57'),
(28, 3, 75, 0, '2022-12-03 20:28:24'),
(29, 3, 99450, 0, '2022-12-04 13:51:39');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `id` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `quantite` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`id`, `id_produit`, `id_commande`, `prix`, `quantite`, `total`) VALUES
(1, 6, 4, 6000, 1, 6000),
(2, 7, 4, 300, 5, 1500),
(3, 6, 5, 6000, 5, 30000),
(4, 7, 5, 300, 9, 2700),
(5, 6, 6, 6000, 1, 6000),
(6, 7, 6, 300, 1, 300),
(7, 6, 23, 6000, 4, 24000),
(8, 7, 23, 300, 4, 1200),
(9, 6, 24, 6000, 4, 24000),
(10, 7, 24, 300, 4, 1200),
(11, 13, 25, 75, 1, 75),
(12, 13, 26, 75, 1, 75),
(13, 13, 27, 75, 1, 75),
(14, 13, 28, 75, 1, 75),
(15, 6, 29, 6000, 5, 30000),
(16, 11, 29, 7000, 3, 21000),
(17, 12, 29, 12000, 4, 48000),
(18, 13, 29, 75, 6, 450);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `discount` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `date_creation` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `libelle`, `prix`, `discount`, `id_categorie`, `date_creation`, `description`, `image`) VALUES
(5, 'SAMSUNG SERIE 9', 7500, 0, 6, '2022-11-14 00:00:00', '', '637659041d180produit.png'),
(6, 'SAMSUNG S8', 6000, 0, 6, '2022-11-17 00:00:00', 'Samsung TV', '6376527e74813Television-43″-SAMSUNG-43AU9075-Smart-4K-Crystal-UHD-–-Serie-9-–-Bluetooth-–-Recepteur-Integre.jpg'),
(7, 'Coconut', 300, 0, 8, '2022-11-17 00:00:00', 'Make UP', '6376546d32bd5images.jfif'),
(8, 'Make UP', 200, 0, 8, '2022-11-17 00:00:00', 'Make UP', '63765918499b1produit.png'),
(10, 'Danone', 2, 24, 3, '2022-11-17 00:00:00', 'Danone ', '637658729b712Danone-Logo.png'),
(11, 'LG OLED evo C2 Smart TV Resolution 4K 42 pouces', 7000, 0, 6, '2022-11-18 00:00:00', 'Perfect brightness (infinite contrast), 100% color accuracy', '6377c736816d6medium01.webp'),
(12, 'LG NANO79 Smart TV Resolution 4K 86 pouces', 12000, 6, 6, '2022-11-18 00:00:00', '4K NanoCell IPS TV with Local Dimming for pure colors and wide viewing angles.\r\n\r\n α7 Gen4 4K processor with two-stage noise reduction and AI Sound, AI Picture\r\n', '6377c776dfe8f350-1.webp'),
(13, 'Semillas Graines de fraises', 75, 0, 1, '2022-11-18 00:00:00', 'Brand: Semillas | Similar Products by Semillas', '6377cb360a23f1.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(150) NOT NULL,
  `date_creation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `login`, `password`, `date_creation`) VALUES
(1, 'mjamaoui', '123456', '2022-10-30'),
(2, 'admin', '123456789', '2022-10-30'),
(3, 'mjamaoui', 'mjamaoui', '2022-11-02'),
(4, 'mjamaoui', 'mjamaoui', '2022-11-04'),
(5, 'mjamaoui', '123456', '2022-11-11'),
(6, 'mjamaoui', '123456', '2022-11-14');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_produit` (`id_produit`),
  ADD KEY `id_commande` (`id_commande`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `ligne_commande_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ligne_commande_ibfk_2` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
