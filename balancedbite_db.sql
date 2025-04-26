-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 14, 2025 at 11:00 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `balancedbite_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `deficiencies`
--

DROP TABLE IF EXISTS `deficiencies`;
CREATE TABLE IF NOT EXISTS `deficiencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deficiency_name` varchar(255) NOT NULL,
  `mild_threshold` int NOT NULL,
  `moderate_threshold` int NOT NULL,
  `severe_threshold` int NOT NULL,
  `recommended_food` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `deficiencies`
--

INSERT INTO `deficiencies` (`id`, `deficiency_name`, `mild_threshold`, `moderate_threshold`, `severe_threshold`, `recommended_food`) VALUES
(1, 'Protein Deficiency', 5, 10, 15, 'Eggs, Meat, Lentils, Nuts'),
(2, 'Iron Deficiency', 4, 8, 12, 'Spinach, Red Meat, Beans'),
(3, 'Vitamin C Deficiency', 3, 6, 9, 'Citrus Fruits, Bell Peppers, Strawberries'),
(4, 'Calcium Deficiency', 4, 7, 11, 'Milk, Cheese, Yogurt, Almonds'),
(5, 'Hydration Deficiency', 5, 10, 15, 'Water, Electrolytes, Fruits'),
(6, 'Omega-3 Deficiency', 3, 6, 9, 'Fish, Chia Seeds, Walnuts'),
(7, 'Vitamin A Deficiency', 4, 8, 12, 'Carrots, Sweet Potatoes, Spinach'),
(8, 'Magnesium Deficiency', 3, 7, 10, 'Nuts, Seeds, Dark Chocolate');

-- --------------------------------------------------------

--
-- Table structure for table `deficiency_questions`
--

DROP TABLE IF EXISTS `deficiency_questions`;
CREATE TABLE IF NOT EXISTS `deficiency_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deficiency_name` varchar(255) NOT NULL,
  `question_id` int NOT NULL,
  `min_required_score` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `deficiency_questions`
--

INSERT INTO `deficiency_questions` (`id`, `deficiency_name`, `question_id`, `min_required_score`) VALUES
(1, 'Protein Deficiency', 1, 5),
(2, 'Protein Deficiency', 2, 5),
(3, 'Protein Deficiency', 4, 5),
(4, 'Calcium Deficiency', 3, 5),
(5, 'Calcium Deficiency', 7, 3),
(6, 'Vitamin C Deficiency', 5, 5),
(7, 'Dehydration', 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int DEFAULT NULL,
  `option_text` varchar(255) NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_text` text NOT NULL,
  `deficiency_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question_text`, `deficiency_id`) VALUES
(6, 'How often do you drink enough water?', 5),
(5, 'How often do you eat citrus fruits or berries?', 3),
(4, 'How often do you eat fish?', 6),
(3, 'How often do you consume dairy products?', 4),
(2, 'How often do you eat eggs or meat?', 1),
(1, 'How often do you eat vegetables?', 7),
(7, 'How often do you eat nuts or seeds?', 8);

-- --------------------------------------------------------

--
-- Table structure for table `question_deficiencies`
--

DROP TABLE IF EXISTS `question_deficiencies`;
CREATE TABLE IF NOT EXISTS `question_deficiencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `deficiency_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `deficiency_id` (`deficiency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `question_deficiencies`
--

INSERT INTO `question_deficiencies` (`id`, `question_id`, `deficiency_id`) VALUES
(1, 3, 1),
(2, 3, 4),
(3, 5, 2),
(4, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_results`
--

DROP TABLE IF EXISTS `quiz_results`;
CREATE TABLE IF NOT EXISTS `quiz_results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quiz_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  `selected_option` int DEFAULT NULL,
  `deficiency` varchar(255) DEFAULT NULL,
  `severity` enum('No Deficiency','mild','moderate','severe') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `question_id` (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=374 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quiz_results`
--

INSERT INTO `quiz_results` (`id`, `quiz_id`, `user_id`, `question_id`, `selected_option`, `deficiency`, `severity`) VALUES
(352, 1, 1, 3, 4, 'Calcium Deficiency', ''),
(351, 1, 1, 3, 4, 'Calcium Deficiency', ''),
(350, 1, 1, 7, 0, 'Magnesium Deficiency', 'severe'),
(349, 1, 1, 1, 0, 'Vitamin A Deficiency', 'severe'),
(348, 1, 1, 2, 0, 'Protein Deficiency', 'severe'),
(347, 1, 1, 3, 0, 'Calcium Deficiency', 'severe'),
(346, 1, 1, 4, 4, 'Omega-3 Deficiency', ''),
(345, 1, 1, 5, 4, 'Vitamin C Deficiency', ''),
(344, 1, 1, 6, 4, 'Hydration Deficiency', ''),
(353, 2, 1, 6, 4, 'Hydration Deficiency', 'No Deficiency'),
(354, 2, 1, 5, 4, 'Vitamin C Deficiency', 'No Deficiency'),
(355, 2, 1, 4, 4, 'Omega-3 Deficiency', 'No Deficiency'),
(356, 2, 1, 3, 0, 'Calcium Deficiency', 'severe'),
(357, 2, 1, 2, 0, 'Protein Deficiency', 'severe'),
(358, 2, 1, 1, 0, 'Vitamin A Deficiency', 'severe'),
(359, 2, 1, 7, 0, 'Magnesium Deficiency', 'severe'),
(360, 3, 1, 6, 0, 'Hydration Deficiency', 'severe'),
(361, 3, 1, 5, 0, 'Vitamin C Deficiency', 'severe'),
(362, 3, 1, 4, 0, 'Omega-3 Deficiency', 'severe'),
(363, 3, 1, 3, 0, 'Calcium Deficiency', 'severe'),
(364, 3, 1, 2, 0, 'Protein Deficiency', 'severe'),
(365, 3, 1, 1, 0, 'Vitamin A Deficiency', 'severe'),
(366, 3, 1, 7, 0, 'Magnesium Deficiency', 'severe'),
(367, 4, 1, 6, 4, 'Hydration Deficiency', 'No Deficiency'),
(368, 4, 1, 5, 4, 'Vitamin C Deficiency', 'No Deficiency'),
(369, 4, 1, 4, 4, 'Omega-3 Deficiency', 'No Deficiency'),
(370, 4, 1, 3, 4, 'Calcium Deficiency', 'No Deficiency'),
(371, 4, 1, 2, 4, 'Protein Deficiency', 'No Deficiency'),
(372, 4, 1, 1, 4, 'Vitamin A Deficiency', 'No Deficiency'),
(373, 4, 1, 7, 4, 'Magnesium Deficiency', 'No Deficiency');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'Fondey', 'king@gmail.com', '123');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
