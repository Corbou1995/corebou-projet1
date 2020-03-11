-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 11 mars 2020 à 08:14
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet1`
--
DROP DATEBASE projet1
CREATE DATABASE IF NOT EXISTS `projet1` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `projet1`;

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE IF NOT EXISTS `image` (
  `idimage` int(11) NOT NULL AUTO_INCREMENT,
  `idproduit` int(11) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`idimage`,`idproduit`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`idimage`, `idproduit`, `url`) VALUES
(1, 1, 'image-contenustylo-sharpie-marqueur-permanent-noir.jpg'),
(2, 2, 'image-contenumarqueur-tableau-blanc.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `idproduit` int(11) NOT NULL AUTO_INCREMENT,
  `ean` char(13) DEFAULT NULL,
  `titre` varchar(64) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `prix` float DEFAULT NULL,
  `rating` int(11) DEFAULT '0',
  `DIMENSION` varchar(11) DEFAULT NULL,
  `poids` float DEFAULT NULL,
  PRIMARY KEY (`idproduit`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`idproduit`, `ean`, `titre`, `description`, `prix`, `rating`, `DIMENSION`, `poids`) VALUES
(1, '400476484515', 'marqueur bleu tableau blanc', 'superbe stylo, avec une qualité remarquable pour tableau et à prix discount', 0.99, 0, '30x30x120', 65),
(2, '4100476484515', 'marqueur rouge tableau blanc', 'superbe stylo, avec une qualité remarquable pour tableau et à prix discount', 0.99, 0, '30x30x120', 65);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*DROP DATABASE boutique;*/
CREATE DATABASE boutique;
USE boutique;
CREATE TABLE categorie(idcat INTEGER PRIMARY KEY AUTO_INCREMENT,
                       nom VARCHAR(32),
                       description VARCHAR (128)
);
CREATE TABLE produit(idp int(11) AUTO_INCREMENT,
                     titre VARCHAR(64),
                     description VARCHAR(256), 
                     dimensions VARCHAR(11),
                     poids FLOAT,
                     ean VARCHAR(13),
                     idcat INTEGER REFERENCES categorie(idcat),
                     PRIMARY KEY(idp, idcat)
);
CREATE TABLE image(idimage INTEGER AUTO_INCREMENT PRIMARY KEY,idp INTEGER REFERENCES produit(idp), url VARCHAR(256));
CREATE TABLE client(idcl INTEGER PRIMARY KEY AUTO_INCREMENT,
                    nom VARCHAR(64),
                    pnom VARCHAR(64),
                    adr1 VARCHAR(32),
					adr2 VARCHAR(32),
                    cp CHAR(5),
                    ville VARCHAR(32)
);
CREATE TABLE etat (idetat INTEGER PRIMARY KEY AUTO_INCREMENT,
                   nom VARCHAR(32),
                   description VARCHAR(128)
);
CREATE TABLE ajouter_panier(idcl INTEGER REFERENCES client(idcl),
                            idp INTEGER REFERENCES produit(idp),
                            PRIMARY KEY(idcl,idp)
);
CREATE TABLE acheter(idcl INTEGER REFERENCES client(idcl),
                            idp INTEGER REFERENCES produit(idp),
                            idetat INTEGER REFERENCES etat(idetat),
                            PRIMARY KEY(idcl,idp,idetat)
);


