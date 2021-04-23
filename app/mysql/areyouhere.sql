-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 16 avr. 2021 à 09:20
-- Version du serveur :  8.0.23-0ubuntu0.20.04.1
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `areyouhere`
--
CREATE DATABASE IF NOT EXISTS `areyouhere` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `areyouhere`;

CREATE USER 'areyouhere'@'%' IDENTIFIED BY 'aka47-areyouhere';
GRANT SELECT, INSERT, UPDATE, DELETE, FILE ON *.* TO 'areyouhere'@'%' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
GRANT ALL PRIVILEGES ON `areyouhere`.* TO 'areyouhere'@'%';

-- --------------------------------------------------------

--
-- Structure de la table `ECOLE`
--

CREATE TABLE `ECOLE` (
  `Id_Ecole` int NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `Adresse1` varchar(200) NOT NULL,
  `Adresse2` varchar(200) NOT NULL,
  `CP` int NOT NULL,
  `Ville` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ECOLE`
--

INSERT INTO `ECOLE` (`Id_Ecole`, `Nom`, `Adresse1`, `Adresse2`, `CP`, `Ville`) VALUES
(1, 'ASTON', '163 AVENUE DE BRETAGNE', '', 59000, ''),
(2, 'test', 'test adresse', '', 59000, '');

-- --------------------------------------------------------

--
-- Structure de la table `ELEVE`
--

CREATE TABLE `ELEVE` (
  `Id_Eleve` int NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `Prenom` varchar(100) NOT NULL,
  `Mobile` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ELEVE`
--

INSERT INTO `ELEVE` (`Id_Eleve`, `Email`, `Nom`, `Prenom`, `Mobile`) VALUES
(1, 'alex@school.com', 'DERESNES', 'Alexandre', '627354533'),
(2, 'aaa@aaa.aaa', 'aaa', 'aaa', '9876543210'),
(3, 'bbb@bbb.com', 'bbb', 'bbb', '9876543210'),
(4, 'sylvain@school.com', 'NAUERT', 'Sylvain', '627354533'),
(5, 'vincent@aston.com', 'DUBREU', 'Vincent', '0745127895'),
(6, 'melanie@aston.com', 'VASSEUR', 'Mélanie', '0712178895');

-- --------------------------------------------------------

--
-- Structure de la table `FORMATEUR`
--

CREATE TABLE `FORMATEUR` (
  `Id_Formateur` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `FORMATEUR`
--

INSERT INTO `FORMATEUR` (`Id_Formateur`, `email`, `password`, `prenom`, `nom`) VALUES
(2, 'sylvain@formation.fr', '*F616A141E8BCDB460AD56D5C579E7883505F73BA', 'Sylvain', 'Formateur_Agile'),
(3, 'herve@formation.fr', '*976143CD943328898C9241874909A4F42E8F3FBF', 'Hervé', 'Formateur_Devops'),
(4, 'olivier@formation.fr', '*55BE2C0FFB9A208C8AFFE2BCF90D5947714F5F30', 'Olivier', 'Formateur_Java'),
(6, 'valentin@formation.fr', '*82722699D2F4113879BBA41665F32AD4899A3DA1', 'Valentin', 'Formateur_Linux'),
(7, 'master@formation.fr', '*E94DD0E51992840CCEF78FB51A33ED066EB12412', 'Sam', 'Ter'),
(8, 'test@test.com', '*94BDCEBE19083CE2A1F959FD02F964C7AF4CFC29', 'testprenom', 'testnom'),
(9, 'alex@formation.fr', '*1EE2F79163A81C04C646F19677EB849824A49AB3', 'Alexandre', 'DERESNES');

-- --------------------------------------------------------

--
-- Structure de la table `FORMATION`
--

CREATE TABLE `FORMATION` (
  `Id_Formation` int NOT NULL,
  `Intitule` varchar(200) NOT NULL,
  `Id_Formateur` int NOT NULL,
  `Date_debut` date NOT NULL,
  `Date_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `FORMATION`
--

INSERT INTO `FORMATION` (`Id_Formation`, `Intitule`, `Id_Formateur`, `Date_debut`, `Date_fin`) VALUES
(1, 'Linux', 8, '2021-03-15', '2021-03-19'),
(2, 'Formation DevOps', 8, '2021-02-22', '2021-05-12');

-- --------------------------------------------------------

--
-- Structure de la table `GROUPE`
--

CREATE TABLE `GROUPE` (
  `Id_Groupe` int NOT NULL,
  `Id_Eleve` int NOT NULL,
  `Libelle` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `GROUPE`
--

INSERT INTO `GROUPE` (`Id_Groupe`, `Id_Eleve`, `Libelle`) VALUES
(1, 1, 'GRP1'),
(2, 4, 'GRP2'),
(3, 2, 'GRP3');

-- --------------------------------------------------------

--
-- Structure de la table `PLANNING`
--

CREATE TABLE `PLANNING` (
  `Id_Planning` int NOT NULL,
  `Id_Formation` int NOT NULL,
  `Id_Formateur` int NOT NULL,
  `Id_Groupe` int NOT NULL,
  `Date_debut` date NOT NULL,
  `Date_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `PRESENCE`
--

CREATE TABLE `PRESENCE` (
  `Id_Formation` int NOT NULL,
  `Id_Eleve` int NOT NULL,
  `Date_Formation` date NOT NULL,
  `Id_Statut` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `PRESENCE`
--

INSERT INTO `PRESENCE` (`Id_Formation`, `Id_Eleve`, `Date_Formation`, `Id_Statut`) VALUES
(2, 1, '2021-04-12', 0),
(2, 4, '2021-04-12', 0),
(2, 6, '2021-04-12', 0),
(1, 2, '2021-04-20', 1),
(1, 3, '2021-04-20', 1);

-- --------------------------------------------------------

--
-- Structure de la table `RESPONSABLE`
--

CREATE TABLE `RESPONSABLE` (
  `Id_Responsable` int NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` text NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `Prenom` varchar(100) NOT NULL,
  `Fonction` varchar(100) NOT NULL,
  `Fixe` int NOT NULL,
  `Mobile` int NOT NULL,
  `Id_Ecole` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `STATUT_ELEVE`
--

CREATE TABLE `STATUT_ELEVE` (
  `Id_Statut` int NOT NULL,
  `Libelle_Statut` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ECOLE`
--
ALTER TABLE `ECOLE`
  ADD PRIMARY KEY (`Id_Ecole`),
  ADD KEY `Nom_Ecole` (`Nom`);

--
-- Index pour la table `ELEVE`
--
ALTER TABLE `ELEVE`
  ADD PRIMARY KEY (`Id_Eleve`),
  ADD KEY `Email_Eleve` (`Email`);

--
-- Index pour la table `FORMATEUR`
--
ALTER TABLE `FORMATEUR`
  ADD PRIMARY KEY (`Id_Formateur`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `FORMATION`
--
ALTER TABLE `FORMATION`
  ADD PRIMARY KEY (`Id_Formation`),
  ADD KEY `Id_Formation` (`Id_Formation`) USING BTREE,
  ADD KEY `Id_Formateur` (`Id_Formateur`);

--
-- Index pour la table `GROUPE`
--
ALTER TABLE `GROUPE`
  ADD PRIMARY KEY (`Id_Groupe`),
  ADD KEY `Id_Eleve` (`Id_Eleve`);

--
-- Index pour la table `PLANNING`
--
ALTER TABLE `PLANNING`
  ADD PRIMARY KEY (`Id_Planning`),
  ADD KEY `Id_Formation` (`Id_Formation`,`Id_Formateur`,`Id_Groupe`),
  ADD KEY `Id_Groupe` (`Id_Groupe`),
  ADD KEY `Id_Formateur` (`Id_Formateur`);

--
-- Index pour la table `PRESENCE`
--
ALTER TABLE `PRESENCE`
  ADD KEY `Id_Formation` (`Id_Formation`,`Id_Eleve`),
  ADD KEY `Id_Statut` (`Id_Statut`),
  ADD KEY `Id_Eleve` (`Id_Eleve`);

--
-- Index pour la table `RESPONSABLE`
--
ALTER TABLE `RESPONSABLE`
  ADD PRIMARY KEY (`Id_Responsable`),
  ADD UNIQUE KEY `email` (`Email`),
  ADD KEY `Id_Ecole` (`Id_Ecole`);

--
-- Index pour la table `STATUT_ELEVE`
--
ALTER TABLE `STATUT_ELEVE`
  ADD PRIMARY KEY (`Id_Statut`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ECOLE`
--
ALTER TABLE `ECOLE`
  MODIFY `Id_Ecole` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `ELEVE`
--
ALTER TABLE `ELEVE`
  MODIFY `Id_Eleve` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `FORMATEUR`
--
ALTER TABLE `FORMATEUR`
  MODIFY `Id_Formateur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `FORMATION`
--
ALTER TABLE `FORMATION`
  MODIFY `Id_Formation` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `GROUPE`
--
ALTER TABLE `GROUPE`
  MODIFY `Id_Groupe` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `PLANNING`
--
ALTER TABLE `PLANNING`
  MODIFY `Id_Planning` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `RESPONSABLE`
--
ALTER TABLE `RESPONSABLE`
  MODIFY `Id_Responsable` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `STATUT_ELEVE`
--
ALTER TABLE `STATUT_ELEVE`
  MODIFY `Id_Statut` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `FORMATION`
--
ALTER TABLE `FORMATION`
  ADD CONSTRAINT `FORMATION_ibfk_1` FOREIGN KEY (`Id_Formateur`) REFERENCES `FORMATEUR` (`Id_Formateur`);

--
-- Contraintes pour la table `GROUPE`
--
ALTER TABLE `GROUPE`
  ADD CONSTRAINT `GROUPE_ibfk_1` FOREIGN KEY (`Id_Eleve`) REFERENCES `ELEVE` (`Id_Eleve`);

--
-- Contraintes pour la table `PLANNING`
--
ALTER TABLE `PLANNING`
  ADD CONSTRAINT `PLANNING_ibfk_1` FOREIGN KEY (`Id_Groupe`) REFERENCES `GROUPE` (`Id_Groupe`),
  ADD CONSTRAINT `PLANNING_ibfk_2` FOREIGN KEY (`Id_Formateur`) REFERENCES `FORMATEUR` (`Id_Formateur`),
  ADD CONSTRAINT `PLANNING_ibfk_3` FOREIGN KEY (`Id_Formation`) REFERENCES `FORMATION` (`Id_Formation`);

--
-- Contraintes pour la table `PRESENCE`
--
ALTER TABLE `PRESENCE`
  ADD CONSTRAINT `PRESENCE_ibfk_1` FOREIGN KEY (`Id_Eleve`) REFERENCES `ELEVE` (`Id_Eleve`),
  ADD CONSTRAINT `PRESENCE_ibfk_2` FOREIGN KEY (`Id_Formation`) REFERENCES `FORMATION` (`Id_Formation`);

--
-- Contraintes pour la table `RESPONSABLE`
--
ALTER TABLE `RESPONSABLE`
  ADD CONSTRAINT `RESPONSABLE_ibfk_1` FOREIGN KEY (`Id_Ecole`) REFERENCES `ECOLE` (`Id_Ecole`);

--
-- Contraintes pour la table `STATUT_ELEVE`
--
ALTER TABLE `STATUT_ELEVE`
  ADD CONSTRAINT `STATUT_ELEVE_ibfk_1` FOREIGN KEY (`Id_Statut`) REFERENCES `PRESENCE` (`Id_Statut`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
