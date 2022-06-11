-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 11, 2022 at 12:14 PM
-- Server version: 8.0.27
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evaluation-system`
--

-- --------------------------------------------------------

--
-- Table structure for table `competency_reports`
--

DROP TABLE IF EXISTS `competency_reports`;
CREATE TABLE IF NOT EXISTS `competency_reports` (
  `competency_report_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `evaluator_id` int NOT NULL,
  `evaluation_period_id` int NOT NULL,
  `status_id` int NOT NULL,
  `score` tinyint NOT NULL DEFAULT '1',
  `survey_ans` json DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`competency_report_id`),
  KEY `employee_id` (`employee_id`),
  KEY `evaluation_period_id` (`evaluation_period_id`),
  KEY `evaluator_id` (`evaluator_id`),
  KEY `status_id` (`status_id`)
) ;

--
-- Dumping data for table `competency_reports`
--

INSERT INTO `competency_reports` (`competency_report_id`, `employee_id`, `evaluator_id`, `evaluation_period_id`, `status_id`, `score`, `survey_ans`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 5, 1, 5, NULL, '2022-06-07 12:28:27', '2022-06-08 15:10:24'),
(2, 4, 1, 5, 2, 2, '[2, 2, 1, 2, 3, 5, 1, 1, 2, 3, 4, 5]', '2022-06-07 17:16:36', '2022-06-09 10:17:25'),
(3, 15, 4, 5, 3, 3, '[1, 5, 5, 4, 3, 2, 3, 5, 5, 4, 1, 3]', '2022-06-08 08:10:12', '2022-06-08 08:10:12'),
(4, 5, 2, 4, 1, 4, NULL, '2022-06-08 08:30:31', '2022-06-08 15:31:14'),
(6, 6, 2, 5, 2, 3, NULL, '2022-06-09 09:24:27', '2022-06-09 09:45:43'),
(7, 6, 2, 5, 2, 4, NULL, '2022-06-09 09:27:58', '2022-06-09 10:17:24'),
(14, 3, 1, 5, 1, 5, NULL, '2022-06-09 11:37:21', '2022-06-09 11:37:40'),
(15, 6, 2, 5, 2, 3, '[5, 4, 3, 2, 1, 5, 5, 3, 3, 4, 5, 1]', '2022-06-09 11:38:43', '2022-06-09 11:39:00'),
(16, 3, 1, 5, 3, 1, NULL, '2022-06-11 11:00:07', '2022-06-11 11:00:07'),
(17, 3, 1, 5, 3, 1, NULL, '2022-06-11 11:08:25', '2022-06-11 11:08:25'),
(23, 3, 1, 5, 3, 5, NULL, '2022-06-11 11:26:23', '2022-06-11 11:26:23'),
(24, 14, 4, 5, 2, 5, NULL, '2022-06-11 11:48:01', '2022-06-11 12:13:41'),
(25, 15, 4, 5, 1, 1, NULL, '2022-06-11 11:48:15', '2022-06-11 12:13:28'),
(26, 16, 4, 5, 3, 2, NULL, '2022-06-11 11:48:48', '2022-06-11 11:48:48'),
(32, 16, 4, 5, 3, 2, '[1, 1, 1, 2, 2, 2, 3, 3, 3, 1, 2, 3]', '2022-06-11 12:10:52', '2022-06-11 12:10:52'),
(33, 15, 4, 5, 3, 2, NULL, '2022-06-11 12:11:10', '2022-06-11 12:11:10');

-- --------------------------------------------------------

--
-- Table structure for table `competency_report_statuses`
--

DROP TABLE IF EXISTS `competency_report_statuses`;
CREATE TABLE IF NOT EXISTS `competency_report_statuses` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `competency_report_statuses`
--

INSERT INTO `competency_report_statuses` (`status_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Accepted', '2022-06-07 10:00:48', '2022-06-07 10:00:48'),
(2, 'Rejected', '2022-06-07 10:00:48', '2022-06-07 10:00:48'),
(3, 'Pending', '2022-06-07 10:00:48', '2022-06-07 10:00:48');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'IT', '2022-06-07 08:57:05', '2022-06-07 08:57:05'),
(2, 'HR', '2022-06-07 09:58:32', '2022-06-07 09:58:32'),
(3, 'QC', '2022-06-07 09:58:32', '2022-06-07 09:58:32');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `department_id` int NOT NULL,
  `manager_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `email` (`email`),
  KEY `department_id` (`department_id`),
  KEY `manager_id` (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `name`, `email`, `password`, `department_id`, `manager_id`, `created_at`, `updated_at`) VALUES
(1, 'Ahmed', 'ahmed@email.com', '$2y$10$Pu3TJmqtuQpF5I2QpzrBZu2965474pL2LuXZZHnBZbY4La4v.6Uaq', 1, NULL, '2022-06-07 08:57:18', '2022-06-07 08:57:18'),
(2, 'Joe', 'joe@email.com', '$2y$10$Pu3TJmqtuQpF5I2QpzrBZu2965474pL2LuXZZHnBZbY4La4v.6Uaq', 1, 1, '2022-06-07 10:21:55', '2022-06-07 10:21:55'),
(3, 'Henry', 'henry@email.com', '$2y$10$Pu3TJmqtuQpF5I2QpzrBZu2965474pL2LuXZZHnBZbY4La4v.6Uaq', 1, 1, '2022-06-07 10:21:55', '2022-06-07 10:21:55'),
(4, 'Mike', 'mike@email.com', '$2y$10$Pu3TJmqtuQpF5I2QpzrBZu2965474pL2LuXZZHnBZbY4La4v.6Uaq', 1, 1, '2022-06-07 10:21:55', '2022-06-07 10:21:55'),
(5, 'David', 'david@email.com', '$2y$10$Pu3TJmqtuQpF5I2QpzrBZu2965474pL2LuXZZHnBZbY4La4v.6Uaq', 1, 1, '2022-06-07 10:21:55', '2022-06-07 10:21:55'),
(6, 'Roger', 'roger@email.com', '$2y$10$Pu3TJmqtuQpF5I2QpzrBZu2965474pL2LuXZZHnBZbY4La4v.6Uaq', 1, 1, '2022-06-07 10:21:55', '2022-06-07 10:21:55'),
(7, 'Mona', 'mona@email.com', '$2y$10$Pu3TJmqtuQpF5I2QpzrBZu2965474pL2LuXZZHnBZbY4La4v.6Uaq', 2, NULL, '2022-06-07 10:21:55', '2022-06-07 10:21:55'),
(8, 'Sam', 'sam@email.com', '$2y$10$Pu3TJmqtuQpF5I2QpzrBZu2965474pL2LuXZZHnBZbY4La4v.6Uaq', 2, 7, '2022-06-07 10:21:55', '2022-06-07 10:21:55'),
(9, 'Joseph', 'joseph@email.com', '$2y$10$Pu3TJmqtuQpF5I2QpzrBZu2965474pL2LuXZZHnBZbY4La4v.6Uaq', 2, 7, '2022-06-07 10:21:55', '2022-06-07 10:21:55'),
(10, 'Ben', 'ben@email.com', '$2y$10$Pu3TJmqtuQpF5I2QpzrBZu2965474pL2LuXZZHnBZbY4La4v.6Uaq', 2, 7, '2022-06-07 10:21:55', '2022-06-07 10:21:55'),
(11, 'Ali', 'ali@email.com', '$2y$10$Pu3TJmqtuQpF5I2QpzrBZu2965474pL2LuXZZHnBZbY4La4v.6Uaq', 2, 7, '2022-06-07 10:21:55', '2022-06-07 10:21:55'),
(12, 'Khalid', 'khalid@email.com', '$2y$10$Pu3TJmqtuQpF5I2QpzrBZu2965474pL2LuXZZHnBZbY4La4v.6Uaq', 3, NULL, '2022-06-07 10:21:55', '2022-06-07 10:21:55'),
(13, 'Max', 'max@email.com', '$2y$10$Pu3TJmqtuQpF5I2QpzrBZu2965474pL2LuXZZHnBZbY4La4v.6Uaq', 3, 12, '2022-06-07 10:21:55', '2022-06-07 10:21:55'),
(14, 'Marry', 'marry@email.com', '$2y$10$Pu3TJmqtuQpF5I2QpzrBZu2965474pL2LuXZZHnBZbY4La4v.6Uaq', 3, 12, '2022-06-07 10:21:55', '2022-06-07 10:21:55'),
(15, 'Aya', 'aya@email.com', '$2y$10$Pu3TJmqtuQpF5I2QpzrBZu2965474pL2LuXZZHnBZbY4La4v.6Uaq', 3, 12, '2022-06-07 10:21:55', '2022-06-07 10:21:55'),
(16, 'May', 'may@email.com', '$2y$10$Pu3TJmqtuQpF5I2QpzrBZu2965474pL2LuXZZHnBZbY4La4v.6Uaq', 3, 12, '2022-06-07 10:21:55', '2022-06-07 10:21:55');

-- --------------------------------------------------------

--
-- Stand-in structure for view `employee_view`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `employee_view`;
CREATE TABLE IF NOT EXISTS `employee_view` (
`department` varchar(50)
,`employee_created_at` timestamp
,`employee_email` varchar(150)
,`employee_id` int
,`employee_name` varchar(50)
,`employee_pass` varchar(150)
,`employee_updated_at` timestamp
,`manager_email` varchar(150)
,`manager_id` int
,`manager_name` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_periods`
--

DROP TABLE IF EXISTS `evaluation_periods`;
CREATE TABLE IF NOT EXISTS `evaluation_periods` (
  `evaluation_period_id` int NOT NULL AUTO_INCREMENT,
  `evaluation_period` varchar(50) NOT NULL,
  `evaluation_year` year NOT NULL,
  `status_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`evaluation_period_id`),
  UNIQUE KEY `evaluation_period` (`evaluation_period`,`evaluation_year`),
  KEY `evaluation_periods_ibfk_1` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `evaluation_periods`
--

INSERT INTO `evaluation_periods` (`evaluation_period_id`, `evaluation_period`, `evaluation_year`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 'First Half', 2020, 2, '2022-06-07 10:04:24', '2022-06-07 10:04:24'),
(2, 'Second Half', 2020, 2, '2022-06-07 10:04:24', '2022-06-07 10:04:24'),
(3, 'First Half', 2021, 2, '2022-06-07 10:04:24', '2022-06-07 10:04:24'),
(4, 'Second Half', 2021, 2, '2022-06-07 10:04:24', '2022-06-07 10:04:24'),
(5, 'First Half', 2022, 1, '2022-06-07 10:04:24', '2022-06-07 10:04:24'),
(6, 'Second Half', 2022, 3, '2022-06-07 10:04:24', '2022-06-07 10:04:24');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_period_statuses`
--

DROP TABLE IF EXISTS `evaluation_period_statuses`;
CREATE TABLE IF NOT EXISTS `evaluation_period_statuses` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `evaluation_period_statuses`
--

INSERT INTO `evaluation_period_statuses` (`status_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Active', '2022-06-07 10:01:40', '2022-06-07 10:01:40'),
(2, 'Closed', '2022-06-07 10:01:40', '2022-06-07 10:01:40'),
(3, 'Pending', '2022-06-07 10:01:40', '2022-06-07 10:01:40');

-- --------------------------------------------------------

--
-- Stand-in structure for view `evaluation_period_view`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `evaluation_period_view`;
CREATE TABLE IF NOT EXISTS `evaluation_period_view` (
`created_at` timestamp
,`evaluation_period` varchar(50)
,`evaluation_period_id` int
,`evaluation_year` year
,`status` varchar(50)
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `evaluation_view`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `evaluation_view`;
CREATE TABLE IF NOT EXISTS `evaluation_view` (
`created_at` timestamp
,`department` varchar(50)
,`employee_created_at` timestamp
,`employee_email` varchar(150)
,`employee_id` int
,`employee_name` varchar(50)
,`employee_updated_at` timestamp
,`evaluation_id` int
,`evaluation_period_id` int
,`evaluation_score` tinyint
,`evaluation_status` varchar(50)
,`evaluator_created_at` timestamp
,`evaluator_email` varchar(150)
,`evaluator_employee_id` int
,`evaluator_id` int
,`evaluator_name` varchar(50)
,`evaluator_updated_at` timestamp
,`manager_email` varchar(150)
,`manager_id` int
,`manager_name` varchar(50)
,`survey_ans` json
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `evaluators`
--

DROP TABLE IF EXISTS `evaluators`;
CREATE TABLE IF NOT EXISTS `evaluators` (
  `evaluator_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `evaluation_period_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`evaluator_id`),
  UNIQUE KEY `employee_id` (`employee_id`,`evaluation_period_id`),
  KEY `evaluation_period_id` (`evaluation_period_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `evaluators`
--

INSERT INTO `evaluators` (`evaluator_id`, `employee_id`, `evaluation_period_id`, `created_at`, `updated_at`) VALUES
(1, 2, 5, '2022-06-07 10:24:28', '2022-06-07 10:24:28'),
(2, 3, 4, '2022-06-07 10:24:28', '2022-06-07 10:24:28'),
(3, 8, 5, '2022-06-07 10:24:28', '2022-06-07 10:24:28'),
(4, 13, 5, '2022-06-07 10:24:28', '2022-06-07 10:24:28');

-- --------------------------------------------------------

--
-- Stand-in structure for view `evaluator_view`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `evaluator_view`;
CREATE TABLE IF NOT EXISTS `evaluator_view` (
`department` varchar(50)
,`employee_created_at` timestamp
,`employee_email` varchar(150)
,`employee_id` int
,`employee_name` varchar(50)
,`employee_updated_at` timestamp
,`evaluation_period` varchar(50)
,`evaluation_period_id` int
,`evaluation_period_status` varchar(50)
,`evaluation_year` year
,`evaluator_created_at` timestamp
,`evaluator_id` int
,`evaluator_updated_at` timestamp
,`manager_email` varchar(150)
,`manager_id` int
,`manager_name` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure for view `employee_view`
--
DROP TABLE IF EXISTS `employee_view`;

DROP VIEW IF EXISTS `employee_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_view`  AS SELECT `emp`.`employee_id` AS `employee_id`, `emp`.`name` AS `employee_name`, `emp`.`email` AS `employee_email`, `emp`.`password` AS `employee_pass`, `emp`.`created_at` AS `employee_created_at`, `emp`.`updated_at` AS `employee_updated_at`, `depart`.`name` AS `department`, `mang`.`employee_id` AS `manager_id`, `mang`.`name` AS `manager_name`, `mang`.`email` AS `manager_email` FROM ((`employees` `emp` left join `departments` `depart` on((`emp`.`department_id` = `depart`.`department_id`))) left join `employees` `mang` on((`emp`.`manager_id` = `mang`.`employee_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `evaluation_period_view`
--
DROP TABLE IF EXISTS `evaluation_period_view`;

DROP VIEW IF EXISTS `evaluation_period_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `evaluation_period_view`  AS SELECT `p`.`evaluation_period_id` AS `evaluation_period_id`, `p`.`evaluation_period` AS `evaluation_period`, `p`.`evaluation_year` AS `evaluation_year`, `s`.`status` AS `status`, `p`.`created_at` AS `created_at`, `p`.`updated_at` AS `updated_at` FROM (`evaluation_periods` `p` left join `evaluation_period_statuses` `s` on((`p`.`status_id` = `s`.`status_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `evaluation_view`
--
DROP TABLE IF EXISTS `evaluation_view`;

DROP VIEW IF EXISTS `evaluation_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `evaluation_view`  AS SELECT `report`.`competency_report_id` AS `evaluation_id`, `emp`.`employee_id` AS `employee_id`, `emp`.`employee_name` AS `employee_name`, `emp`.`employee_email` AS `employee_email`, `emp`.`employee_created_at` AS `employee_created_at`, `emp`.`employee_updated_at` AS `employee_updated_at`, `emp`.`department` AS `department`, `emp`.`manager_id` AS `manager_id`, `emp`.`manager_name` AS `manager_name`, `emp`.`manager_email` AS `manager_email`, `eval`.`evaluator_id` AS `evaluator_id`, `eval`.`employee_id` AS `evaluator_employee_id`, `eval`.`employee_name` AS `evaluator_name`, `eval`.`employee_email` AS `evaluator_email`, `eval`.`employee_created_at` AS `evaluator_created_at`, `eval`.`employee_updated_at` AS `evaluator_updated_at`, `eval_period`.`evaluation_period_id` AS `evaluation_period_id`, `report_status`.`status` AS `evaluation_status`, `report`.`score` AS `evaluation_score`, `report`.`survey_ans` AS `survey_ans`, `report`.`created_at` AS `created_at`, `report`.`updated_at` AS `updated_at` FROM ((((`competency_reports` `report` left join `employee_view` `emp` on((`report`.`employee_id` = `emp`.`employee_id`))) left join `evaluator_view` `eval` on((`report`.`evaluator_id` = `eval`.`evaluator_id`))) left join `evaluation_period_view` `eval_period` on((`report`.`evaluation_period_id` = `eval_period`.`evaluation_period_id`))) left join `competency_report_statuses` `report_status` on((`report`.`status_id` = `report_status`.`status_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `evaluator_view`
--
DROP TABLE IF EXISTS `evaluator_view`;

DROP VIEW IF EXISTS `evaluator_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `evaluator_view`  AS SELECT `eval`.`evaluator_id` AS `evaluator_id`, `emp`.`employee_id` AS `employee_id`, `emp`.`employee_name` AS `employee_name`, `emp`.`employee_email` AS `employee_email`, `emp`.`employee_created_at` AS `employee_created_at`, `emp`.`employee_updated_at` AS `employee_updated_at`, `emp`.`department` AS `department`, `emp`.`manager_id` AS `manager_id`, `emp`.`manager_name` AS `manager_name`, `emp`.`manager_email` AS `manager_email`, `period`.`evaluation_period_id` AS `evaluation_period_id`, `period`.`evaluation_period` AS `evaluation_period`, `period`.`evaluation_year` AS `evaluation_year`, `period`.`status` AS `evaluation_period_status`, `eval`.`created_at` AS `evaluator_created_at`, `eval`.`updated_at` AS `evaluator_updated_at` FROM ((`evaluators` `eval` left join `employee_view` `emp` on((`eval`.`employee_id` = `emp`.`employee_id`))) left join `evaluation_period_view` `period` on((`eval`.`evaluation_period_id` = `period`.`evaluation_period_id`))) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `competency_reports`
--
ALTER TABLE `competency_reports`
  ADD CONSTRAINT `competency_reports_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `competency_reports_ibfk_2` FOREIGN KEY (`evaluation_period_id`) REFERENCES `evaluation_periods` (`evaluation_period_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `competency_reports_ibfk_3` FOREIGN KEY (`evaluator_id`) REFERENCES `evaluators` (`evaluator_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `competency_reports_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `competency_report_statuses` (`status_id`) ON DELETE RESTRICT;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE;

--
-- Constraints for table `evaluation_periods`
--
ALTER TABLE `evaluation_periods`
  ADD CONSTRAINT `evaluation_periods_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `evaluation_period_statuses` (`status_id`) ON DELETE CASCADE;

--
-- Constraints for table `evaluators`
--
ALTER TABLE `evaluators`
  ADD CONSTRAINT `evaluators_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `evaluators_ibfk_2` FOREIGN KEY (`evaluation_period_id`) REFERENCES `evaluation_periods` (`evaluation_period_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
