-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 18 Novembre 2015 à 16:54
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `gestionstock`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `ARTICLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(50) NOT NULL,
  `QUANTITE` double NOT NULL DEFAULT '0',
  `TYPE` varchar(20) DEFAULT NULL,
  `DESCRIPTION` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ARTICLE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `articles`
--

INSERT INTO `articles` (`ARTICLE_ID`, `NOM`, `QUANTITE`, `TYPE`, `DESCRIPTION`) VALUES
(1, 'Louz', 15, 'Fakia', NULL),
(2, 'Guerga3', 13, 'Fakia', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `CLIENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(35) NOT NULL,
  `ADRESSE` varchar(256) DEFAULT NULL,
  `TELEPHONE` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(256) DEFAULT NULL,
  `FIDELITE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `commandes_clients`
--

CREATE TABLE IF NOT EXISTS `commandes_clients` (
  `COMMANDE_CLIENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` int(11) NOT NULL,
  `DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EST_LIVREE` int(11) NOT NULL DEFAULT '0' COMMENT ' 0 : non livré , 1 : Livré , 2 incomplete',
  PRIMARY KEY (`COMMANDE_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `commandes_fournisseurs`
--

CREATE TABLE IF NOT EXISTS `commandes_fournisseurs` (
  `COMMANDE_FOURNISSEUR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FOURNISSEUR_ID` int(11) NOT NULL,
  `DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EST_LIVREE` int(11) NOT NULL DEFAULT '0' COMMENT '0 : non livré , 1 : Livrée; 2 incomplete',
  PRIMARY KEY (`COMMANDE_FOURNISSEUR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `entrees`
--

CREATE TABLE IF NOT EXISTS `entrees` (
  `ENTREE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ARTICLE_ID` int(11) NOT NULL,
  `QUANTITE` double NOT NULL DEFAULT '0',
  `PRIX_ENTREE` double NOT NULL DEFAULT '0',
  `DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ENTREE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseurs`
--

CREATE TABLE IF NOT EXISTS `fournisseurs` (
  `FOURNISSEUR_ID` int(11) NOT NULL,
  `NOM` varchar(35) NOT NULL,
  `ADRESSE` varchar(256) DEFAULT NULL,
  `VILLE` varchar(75) DEFAULT NULL,
  `TELEPHONE` varchar(20) DEFAULT NULL,
  `ADD_FIELD` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`FOURNISSEUR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `lignes_commandes_clients`
--

CREATE TABLE IF NOT EXISTS `lignes_commandes_clients` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COMMANDE_CLIENT_ID` int(11) NOT NULL,
  `ARTICLE_ID` int(11) NOT NULL,
  `QUANTITE` double NOT NULL DEFAULT '0',
  `PRIX_VENTE` double NOT NULL DEFAULT '0',
  `EST_LIVREE` int(11) NOT NULL DEFAULT '0' COMMENT '1:livree;0:nonlivree',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `lignes_commandes_fournisseurs`
--

CREATE TABLE IF NOT EXISTS `lignes_commandes_fournisseurs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COMMANDE_FOURNISSEUR_ID` int(11) NOT NULL,
  `ARTICLE_ID` int(11) NOT NULL,
  `QUANTITE` double NOT NULL DEFAULT '0',
  `PRIX_ACHAT` double NOT NULL DEFAULT '0',
  `EST_LIVREE` int(11) NOT NULL DEFAULT '0' COMMENT '0:nonlivree;1livree',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `magasin`
--

CREATE TABLE IF NOT EXISTS `magasin` (
  `ARTICLE_ID` int(11) NOT NULL,
  `QUANTITE` double NOT NULL DEFAULT '0',
  `LAST_MODIFIED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `ARTICLE_ID` (`ARTICLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sorties`
--

CREATE TABLE IF NOT EXISTS `sorties` (
  `SORTIE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ARTICLE_ID` int(11) NOT NULL,
  `QUANTITE` double NOT NULL DEFAULT '0',
  `PRIX_VENTE` double NOT NULL DEFAULT '0',
  `DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SORTIE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
