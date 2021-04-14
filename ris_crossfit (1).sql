-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 13 avr. 2021 à 13:17
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ris_crossfit`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE `activite` (
  `id` int(11) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE `adresse` (
  `id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `rue` varchar(50) NOT NULL,
  `code_postal` int(11) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `pays` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `num`, `rue`, `code_postal`, `ville`, `pays`) VALUES
(1, 2, 'vfvgrb', 91000, 'EvRY', 'FRANCE'),
(2, 2, 'vfvgrb', 91000, 'EvRY', 'FRANCE'),
(3, 43, '43 RUE DE MORTRY', 77390, 'GUIGNES', 'FRANCE'),
(4, 43, '43 RUE DE MORTRY', 77390, 'GUIGNES', 'FRANCE'),
(5, 43, '43 RUE DE MORTRY', 77390, 'GUIGNES', 'FRANCE'),
(6, 43, '43 RUE DE MORTRY', 77390, 'GUIGNES', 'FRANCE'),
(7, 43, '43 RUE DE MORTRY', 77390, 'GUIGNES', 'FRANCE'),
(8, 43, '43 RUE DE MORTRY', 77390, 'GUIGNES', 'FRANCE'),
(9, 43, '43 RUE DE MORTRY', 77390, 'GUIGNES', 'FRANCE'),
(10, 43, '43 RUE DE MORTRY', 77390, 'GUIGNES', 'FRANCE'),
(11, 43, '43 RUE DE MORTRY', 77390, 'GUIGNES', 'FRANCE'),
(12, 43, '43 RUE DE MORTRY', 77390, 'GUIGNES', 'FRANCE'),
(13, 43, '43 RUE DE MORTRY', 77390, 'GUIGNES', 'France');

-- --------------------------------------------------------

--
-- Structure de la table `assister`
--

CREATE TABLE `assister` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seance_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `id` int(11) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `date_inscription` datetime NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL,
  `id_adresse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`id`, `titre`, `date_debut`, `date_fin`, `date_inscription`, `image`, `description`, `id_adresse`) VALUES
(1, 'Reebok crossfit', '2015-01-01 12:16:00', '2015-01-03 12:16:00', '2015-12-01 12:00:00', 'crossfit-games-5fc60ad9036ba.jpeg', 'competition reebok', 1);

-- --------------------------------------------------------

--
-- Structure de la table `galerie`
--

CREATE TABLE `galerie` (
  `id` int(11) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `video` varchar(50) DEFAULT NULL,
  `seance_id` int(11) DEFAULT NULL,
  `evenement_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

CREATE TABLE `participer` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `evenement_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `participer`
--

INSERT INTO `participer` (`id`, `user_id`, `evenement_id`) VALUES
(0, 13, 1);

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

CREATE TABLE `seance` (
  `id` int(11) NOT NULL,
  `date_seance` datetime NOT NULL,
  `duree` time NOT NULL,
  `nombres_exercices` int(11) NOT NULL,
  `activite_id` int(11) NOT NULL,
  `nbMax` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date_inscription` date DEFAULT NULL,
  `date_naissance` datetime NOT NULL,
  `password` varchar(250) NOT NULL,
  `numero_de_telephone` varchar(50) NOT NULL,
  `adresse_id` int(11) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `email`, `date_inscription`, `date_naissance`, `password`, `numero_de_telephone`, `adresse_id`, `is_verified`, `roles`) VALUES
(13, 'kola', 'landry', 'landrykola77@gmail.com', NULL, '2016-01-01 00:00:00', '$argon2id$v=19$m=65536,t=4,p=1$NU1ZSmpMS3hBY2p3SnI4aw$O5Pwh9z7JD159V71wukYx7hvMUwejkxV+TRcfOAL1vg', '0652636895', 11, 1, '[\"ROLE_USER\"]'),
(14, 'kola', 'landry', 'landry77390@gmail.com', NULL, '2016-01-01 10:08:00', '$argon2id$v=19$m=65536,t=4,p=1$Q1QuM01DNEtXRXR5SVBzQg$MSSTgOxMmJI30TuT1/5APNTLsbrgTqPJfQURuD91vMI', '0652636895', 12, 1, '[\"ROLE_USER\"]'),
(15, 'kola', 'landry', 'gwatham@gmail.com', NULL, '2016-01-01 00:00:00', '$argon2id$v=19$m=65536,t=4,p=1$aWNpM0hRNEhwZkcyUkVsbg$awBotupI8lxiJUuPxQLh1olVtGl4M1+NXAlvKFUR2/k', '0652636895', 13, 1, '[\"ROLE_USER\"]');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `assister`
--
ALTER TABLE `assister`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `seance_id` (`seance_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evenement_adresse_FK` (`id_adresse`);

--
-- Index pour la table `galerie`
--
ALTER TABLE `galerie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evenement_id` (`evenement_id`),
  ADD KEY `seance_id` (`seance_id`);

--
-- Index pour la table `participer`
--
ALTER TABLE `participer`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `evenement_id` (`evenement_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activite_id` (`activite_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `adresse_id` (`adresse_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activite`
--
ALTER TABLE `activite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `galerie`
--
ALTER TABLE `galerie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `seance`
--
ALTER TABLE `seance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `assister`
--
ALTER TABLE `assister`
  ADD CONSTRAINT `assister_ibfk_1` FOREIGN KEY (`seance_id`) REFERENCES `seance` (`id`),
  ADD CONSTRAINT `assister_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `evenement_adresse_FK` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id`);

--
-- Contraintes pour la table `galerie`
--
ALTER TABLE `galerie`
  ADD CONSTRAINT `galerie_ibfk_1` FOREIGN KEY (`evenement_id`) REFERENCES `evenement` (`id`),
  ADD CONSTRAINT `galerie_ibfk_2` FOREIGN KEY (`seance_id`) REFERENCES `seance` (`id`);

--
-- Contraintes pour la table `participer`
--
ALTER TABLE `participer`
  ADD CONSTRAINT `participer_ibfk_1` FOREIGN KEY (`evenement_id`) REFERENCES `evenement` (`id`),
  ADD CONSTRAINT `participer_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `seance_ibfk_1` FOREIGN KEY (`activite_id`) REFERENCES `activite` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
