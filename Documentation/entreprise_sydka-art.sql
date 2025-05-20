SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+01:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

DROP TABLE IF EXISTS `avis`;
CREATE TABLE IF NOT EXISTS `avis` (
                                      `id_avis` int NOT NULL AUTO_INCREMENT,
                                      `ref_oeuvre` int NOT NULL,
                                      `nom` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
                                      `commentaire` text COLLATE utf8mb4_general_ci,
                                      `note` tinyint DEFAULT NULL,
                                      `date_avis` datetime DEFAULT CURRENT_TIMESTAMP,
                                      PRIMARY KEY (`id_avis`),
                                      KEY `ref_oeuvre` (`ref_oeuvre`)
) ;

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
                                         `id_contact` int NOT NULL AUTO_INCREMENT,
                                         `nom` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
                                         `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
                                         `sujet` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
                                         `message` text COLLATE utf8mb4_general_ci NOT NULL,
                                         `date_envoi` datetime DEFAULT CURRENT_TIMESTAMP,
                                         PRIMARY KEY (`id_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `oeuvre`;
CREATE TABLE IF NOT EXISTS `oeuvre` (
                                        `id_oeuvre` int NOT NULL AUTO_INCREMENT,
                                        `titre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
                                        `description` text COLLATE utf8mb4_general_ci,
                                        `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
                                        `creation` date DEFAULT NULL,
                                        `date_ajout` datetime DEFAULT CURRENT_TIMESTAMP,
                                        PRIMARY KEY (`id_oeuvre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
                                             `id_utilisateur` int NOT NULL AUTO_INCREMENT,
                                             `nom` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
                                             `email` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
                                             `mot_de_passe` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
                                             `role` enum('admin','client') COLLATE utf8mb4_general_ci DEFAULT 'client',
                                             `date_inscription` datetime DEFAULT CURRENT_TIMESTAMP,
                                             PRIMARY KEY (`id_utilisateur`),
                                             UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `oeuvre`
    ADD CONSTRAINT `oeuvre_ibfk_1` FOREIGN KEY (`id_oeuvre`) REFERENCES `avis` (`ref_oeuvre`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
