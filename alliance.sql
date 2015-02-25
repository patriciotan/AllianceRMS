-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2015 at 04:38 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `alliance`
--

-- --------------------------------------------------------

--
-- Table structure for table `effort`
--

CREATE TABLE IF NOT EXISTS `effort` (
  `effort_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned zerofill NOT NULL,
  `resource_id` int(10) unsigned zerofill NOT NULL,
  `year` int(5) NOT NULL,
  `jan` float DEFAULT NULL,
  `feb` float DEFAULT NULL,
  `mar` float DEFAULT NULL,
  `apr` float DEFAULT NULL,
  `may` float DEFAULT NULL,
  `jun` float DEFAULT NULL,
  `jul` float DEFAULT NULL,
  `aug` float DEFAULT NULL,
  `sep` float DEFAULT NULL,
  `oct` float DEFAULT NULL,
  `nov` float DEFAULT NULL,
  `dece` float DEFAULT NULL,
  PRIMARY KEY (`effort_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `project_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `type` enum('Project-Based','Time and Material','','') NOT NULL,
  `status` enum('No movement','Proposal','Official go','Verbal go','For estimation','Ongoing estimation','Dropped','Ongoing','Closed') NOT NULL,
  `business_unit` enum('Philippines','Japan','Rest of the World','Alliance') NOT NULL,
  `resources_needed` int(6) DEFAULT NULL,
  `remarks` varchar(100) NOT NULL DEFAULT 'No remarks added',
  `reference` enum('Outlook','Summary') NOT NULL,
  `added_by` int(10) unsigned zerofill NOT NULL,
  `added_date` date NOT NULL,
  `updated_by` int(10) unsigned zerofill DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE IF NOT EXISTS `resource` (
  `resource_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `business_unit` enum('Local','JP Independent','ROW','Alliance') NOT NULL,
  `date_hired` date NOT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `resource`
--

INSERT INTO `resource` (`resource_id`, `first_name`, `middle_name`, `last_name`, `business_unit`, `date_hired`) VALUES
(0000000001, 'Mario', 'Hotsummers', 'Newinters', 'Alliance', '2013-06-16'),
(0000000002, 'Barry', 'Watkins', 'Mcbride', 'Local', '2013-03-20'),
(0000000003, 'Marcia', 'Snyder', 'Mckenzie', 'Alliance', '2012-08-08'),
(0000000004, 'Emma', 'Brewer', 'Osborne', 'Alliance', '2011-07-07'),
(0000000005, 'Maria', 'Jones', 'Johnson', 'Local', '2010-03-04'),
(0000000006, 'Christopher', 'Hodge', 'Acosta', 'Alliance', '2009-01-09'),
(0000000007, 'Amy', 'Lanz', 'Turcotte', 'Alliance', '2010-03-11');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(256) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`) VALUES
(1, 'Admin', '21232f297a57a5a743894a0e4a801fc3');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
