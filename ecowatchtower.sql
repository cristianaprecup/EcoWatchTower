-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2024 at 10:49 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecowatchtower`
--

-- --------------------------------------------------------

--
-- Table structure for table `firehistory`
--

CREATE TABLE `firehistory` (
  `FireHistoryID` int(11) NOT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FireIntensity` decimal(5,2) DEFAULT NULL,
  `AreaAffected` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `firehistory`
--

INSERT INTO `firehistory` (`FireHistoryID`, `LocationID`, `Timestamp`, `FireIntensity`, `AreaAffected`) VALUES
(1, 1, '2024-01-05 06:30:00', '3.00', '10.00'),
(2, 2, '2024-01-10 08:15:00', '2.50', '8.50'),
(3, 3, '2024-01-15 10:45:00', '4.00', '12.00'),
(4, 4, '2024-01-20 12:20:00', '3.80', '11.50'),
(5, 5, '2024-01-25 14:00:00', '2.00', '6.00'),
(2532, 3, '0000-00-00 00:00:00', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `LocationID` int(11) NOT NULL,
  `LocationName` varchar(255) DEFAULT NULL,
  `Latitude` decimal(10,8) DEFAULT NULL,
  `Longitude` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`LocationID`, `LocationName`, `Latitude`, `Longitude`) VALUES
(1, 'Yellowstone National Park', '44.42800000', '-110.58850000'),
(2, 'Amazon Rainforest', '-3.46530000', '-62.21590000'),
(3, 'Great Barrier Reef', '-18.28710000', '147.69920000'),
(4, 'Serengeti National Park', '-2.33250000', '34.82510000'),
(5, 'Mount Everest', '27.98810000', '86.92500000'),
(9, 'Asia', '23.44500000', '324.56000000');

-- --------------------------------------------------------

--
-- Table structure for table `observation`
--

CREATE TABLE `observation` (
  `ObservationID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `SpeciesID` int(11) DEFAULT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `observation`
--

INSERT INTO `observation` (`ObservationID`, `UserID`, `SpeciesID`, `LocationID`, `Timestamp`, `Notes`) VALUES
(0, 1, 2, 1, '2024-01-16 10:14:07', 'Recorded temperature and humidity readings in Yellowstone National Park'),
(2, 2, 2, 2, '2024-01-02 07:00:00', 'Measured air quality levels at the Amazon Rainforest'),
(4, 4, 3, 4, '2024-01-17 11:28:46', 'Collected climate data in Serengeti National Park');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `PermissionID` int(11) NOT NULL,
  `PermissionName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`PermissionID`, `PermissionName`) VALUES
(1, 'Environmental Monitoring'),
(2, 'Access to Land'),
(3, 'Data Collection'),
(4, 'Collaboration with Experts'),
(5, 'Environmental Impact Assessment');

-- --------------------------------------------------------

--
-- Table structure for table `projectlocation`
--

CREATE TABLE `projectlocation` (
  `ProjectLocationID` int(11) NOT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `LocationID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projectlocation`
--

INSERT INTO `projectlocation` (`ProjectLocationID`, `ProjectID`, `LocationID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `protectedareas`
--

CREATE TABLE `protectedareas` (
  `ProtectedAreaID` int(11) NOT NULL,
  `AreaName` varchar(255) DEFAULT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `Regulations` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `protectedareas`
--

INSERT INTO `protectedareas` (`ProtectedAreaID`, `AreaName`, `LocationID`, `Regulations`) VALUES
(1, 'Yellowstone National Park', 1, 'Regulations for Yellowstone National Park'),
(2, 'Amazon Rainforest Reserve', 2, 'Regulations for Amazon Rainforest Reserve'),
(3, 'Great Barrier Reef Marine Park', 3, 'Regulations for Great Barrier Reef Marine Park'),
(4, 'Serengeti National Park', 4, 'Regulations for Serengeti National Park'),
(5, 'Everest Conservation Area', 5, 'Regulations for Everest Conservation Area');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `ReportID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `ReportType` varchar(255) DEFAULT NULL,
  `ReportContent` text DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`ReportID`, `UserID`, `ReportType`, `ReportContent`, `Timestamp`) VALUES
(1, 1, 'Ecological Survey Report', 'Comprehensive survey report on local ecosystems and habitats', '2024-01-01 06:00:00'),
(2, 2, 'Pollution Analysis Report', 'Analysis report on pollution levels in urban and rural areas', '2024-01-02 07:00:00'),
(3, 3, 'Wildlife Conservation Plan', 'Plan outlining strategies for the conservation of endangered species', '2024-01-03 08:00:00'),
(4, 4, 'Sustainable Resource Management Report', 'Report focusing on sustainable management of natural resources', '2024-01-04 09:00:00'),
(5, 5, 'Climate Adaptation Strategy', 'Strategy report addressing adaptation to changing climate patterns', '2024-01-05 10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `researcher`
--

CREATE TABLE `researcher` (
  `ResearcherID` int(11) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Affiliation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `researcher`
--

INSERT INTO `researcher` (`ResearcherID`, `FirstName`, `LastName`, `Affiliation`) VALUES
(1, 'Emma', 'Garcia', 'Harvard University'),
(2, 'Alexander', 'Wang', 'Stanford University'),
(3, 'Sophia', 'Lopez', 'Massachusetts Institute of Technology (MIT)'),
(4, 'Daniel', 'Nguyen', 'California Institute of Technology (Caltech)'),
(5, 'Isabella', 'Kim', 'University of California, Berkeley');

-- --------------------------------------------------------

--
-- Table structure for table `researchproject`
--

CREATE TABLE `researchproject` (
  `ProjectID` int(11) NOT NULL,
  `ProjectName` varchar(255) DEFAULT NULL,
  `ResearcherID` int(11) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `researchproject`
--

INSERT INTO `researchproject` (`ProjectID`, `ProjectName`, `ResearcherID`, `Description`) VALUES
(1, 'Ecosystem Diversity Study', 1, 'Analyzing flora and fauna diversity in rainforest ecosystems'),
(2, 'Climate Change Impact Assessment', 2, 'Assessing the impact of climate change on coastal areas'),
(3, 'Sustainable Agriculture Practices', 3, 'Developing sustainable farming techniques for arid regions'),
(4, 'Biodiversity Conservation Project', 4, 'Conserving endangered species habitats in national parks'),
(5, 'Renewable Energy Implementation', 5, 'Implementing renewable energy solutions in remote areas');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`RoleID`, `RoleName`) VALUES
(1, 'Role1'),
(2, 'Role2'),
(3, 'Role3'),
(4, 'Role4'),
(5, 'Role5');

-- --------------------------------------------------------

--
-- Table structure for table `sensor`
--

CREATE TABLE `sensor` (
  `SensorID` int(11) NOT NULL,
  `SensorName` varchar(255) DEFAULT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `SensorType` varchar(255) DEFAULT NULL,
  `InstallationDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sensor`
--

INSERT INTO `sensor` (`SensorID`, `SensorName`, `LocationID`, `SensorType`, `InstallationDate`) VALUES
(1, 'Temperature Sensor', 1, 'Temperature', '2024-01-01'),
(2, 'Humidity Sensor', 2, 'Humidity', '2024-01-02'),
(3, 'Air Quality Sensor', 3, 'Air Quality', '2024-01-03'),
(4, 'Motion Sensor', 4, 'Motion', '2024-01-04'),
(5, 'Weather Sensor', 5, 'Weather', '2024-01-05');

-- --------------------------------------------------------

--
-- Table structure for table `sensordata`
--

CREATE TABLE `sensordata` (
  `DataID` int(11) NOT NULL,
  `SensorID` int(11) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `DataValue` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sensordata`
--

INSERT INTO `sensordata` (`DataID`, `SensorID`, `Timestamp`, `DataValue`) VALUES
(1, 1, '2024-01-01 06:00:00', '22.50'),
(2, 2, '2024-01-02 07:00:00', '60.00'),
(3, 3, '2024-01-03 08:00:00', '78.30'),
(4, 4, '2024-01-04 09:00:00', '1.00'),
(5, 5, '2024-01-05 10:00:00', '15.00');

-- --------------------------------------------------------

--
-- Table structure for table `soilcomposition`
--

CREATE TABLE `soilcomposition` (
  `SoilCompositionID` int(11) NOT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `SoilType` varchar(255) DEFAULT NULL,
  `pHLevel` decimal(3,2) DEFAULT NULL,
  `NutrientLevels` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `soilcomposition`
--

INSERT INTO `soilcomposition` (`SoilCompositionID`, `LocationID`, `SoilType`, `pHLevel`, `NutrientLevels`) VALUES
(1, 1, 'Sandy Loam', '6.50', 'High'),
(2, 2, 'Clay', '7.20', 'Medium'),
(3, 3, 'Silt', '5.80', 'Low'),
(4, 4, 'Peat', '6.90', 'High'),
(5, 5, 'Chalky', '7.50', 'Medium');

-- --------------------------------------------------------

--
-- Table structure for table `species`
--

CREATE TABLE `species` (
  `SpeciesID` int(11) NOT NULL,
  `SpeciesName` varchar(255) DEFAULT NULL,
  `ScientificName` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `species`
--

INSERT INTO `species` (`SpeciesID`, `SpeciesName`, `ScientificName`, `Description`) VALUES
(1, 'Red Panda', 'Ailurus fulgens', 'The red panda is a small mammal native to the eastern Himalayas...'),
(2, 'Snow Leopard', 'Panthera uncia', 'The snow leopard is a large cat native to the mountain ranges...'),
(3, 'Giant Panda', 'Ailuropoda melanoleuca', 'The giant panda is a bear native to south-central China...'),
(4, 'Amur Leopard', 'Panthera pardus orientalis', 'The Amur leopard is a leopard subspecies native to southeastern...'),
(5, 'Sumatran Orangutan', 'Pongo abelii', 'The Sumatran orangutan is a great ape native to the Indonesian island...');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `UserType` varchar(255) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Password`, `Email`, `UserType`, `CreatedAt`) VALUES
(1, 'user1', 'pass1', 'user1@example.com', 'Normal', '2023-12-31 22:00:00'),
(2, 'user2', 'pass2', 'user2@example.com', 'Normal', '2024-01-01 22:00:00'),
(3, 'user3', 'pass3', 'user3@example.com', 'Admin', '2024-01-02 22:00:00'),
(4, 'user4', 'pass4', 'user4@example.com', 'Normal', '2024-01-03 22:00:00'),
(5, 'user5', 'pass5', 'user5@example.com', 'Normal', '2024-01-04 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `userpermission`
--

CREATE TABLE `userpermission` (
  `UserPermissionID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `PermissionID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userpermission`
--

INSERT INTO `userpermission` (`UserPermissionID`, `UserID`, `PermissionID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(7, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE `userrole` (
  `UserRoleID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `RoleID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`UserRoleID`, `UserID`, `RoleID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `vegetation`
--

CREATE TABLE `vegetation` (
  `VegetationID` int(11) NOT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `SpeciesID` int(11) DEFAULT NULL,
  `CoveragePercentage` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vegetation`
--

INSERT INTO `vegetation` (`VegetationID`, `LocationID`, `SpeciesID`, `CoveragePercentage`) VALUES
(1, 1, 1, '40.00'),
(2, 2, 2, '55.00'),
(3, 3, 3, '30.00'),
(4, 4, 4, '65.00'),
(5, 5, 5, '20.00');

-- --------------------------------------------------------

--
-- Table structure for table `waterquality`
--

CREATE TABLE `waterquality` (
  `WaterQualityID` int(11) NOT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `pHLevel` decimal(3,2) DEFAULT NULL,
  `DissolvedOxygen` decimal(5,2) DEFAULT NULL,
  `Turbidity` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `waterquality`
--

INSERT INTO `waterquality` (`WaterQualityID`, `LocationID`, `Timestamp`, `pHLevel`, `DissolvedOxygen`, `Turbidity`) VALUES
(1, 1, '2024-01-01 06:00:00', '7.00', '8.50', '10.20'),
(2, 2, '2024-01-02 07:00:00', '7.20', '7.80', '9.80'),
(3, 3, '2024-01-03 08:00:00', '6.80', '9.00', '11.50'),
(4, 4, '2024-01-04 09:00:00', '7.50', '8.20', '10.00'),
(5, 5, '2024-01-05 10:00:00', '7.10', '8.70', '9.50');

-- --------------------------------------------------------

--
-- Table structure for table `weather`
--

CREATE TABLE `weather` (
  `WeatherID` int(11) NOT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Temperature` decimal(5,2) DEFAULT NULL,
  `Humidity` decimal(5,2) DEFAULT NULL,
  `WindSpeed` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `weather`
--

INSERT INTO `weather` (`WeatherID`, `LocationID`, `Timestamp`, `Temperature`, `Humidity`, `WindSpeed`) VALUES
(1, 1, '2024-01-01 06:00:00', '20.50', '60.00', '5.20'),
(2, 2, '2024-01-02 07:00:00', '25.30', '55.00', '6.10'),
(3, 3, '2024-01-03 08:00:00', '18.70', '70.00', '4.80'),
(4, 4, '2024-01-04 09:00:00', '22.00', '65.00', '5.50'),
(5, 5, '2024-01-05 10:00:00', '16.90', '75.00', '4.20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `firehistory`
--
ALTER TABLE `firehistory`
  ADD PRIMARY KEY (`FireHistoryID`),
  ADD KEY `FK_FireHistory_LocationID` (`LocationID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`LocationID`);

--
-- Indexes for table `observation`
--
ALTER TABLE `observation`
  ADD PRIMARY KEY (`ObservationID`),
  ADD KEY `FK_Observation_UserID` (`UserID`),
  ADD KEY `FK_Observation_SpeciesID` (`SpeciesID`),
  ADD KEY `FK_Observation_LocationID` (`LocationID`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`PermissionID`);

--
-- Indexes for table `projectlocation`
--
ALTER TABLE `projectlocation`
  ADD PRIMARY KEY (`ProjectLocationID`),
  ADD KEY `ProjectID` (`ProjectID`),
  ADD KEY `LocationID` (`LocationID`);

--
-- Indexes for table `protectedareas`
--
ALTER TABLE `protectedareas`
  ADD PRIMARY KEY (`ProtectedAreaID`),
  ADD KEY `FK_ProtectedAreas_LocationID` (`LocationID`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`ReportID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `researcher`
--
ALTER TABLE `researcher`
  ADD PRIMARY KEY (`ResearcherID`);

--
-- Indexes for table `researchproject`
--
ALTER TABLE `researchproject`
  ADD PRIMARY KEY (`ProjectID`),
  ADD KEY `FK_ResearchProject_ResearcherID` (`ResearcherID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RoleID`);

--
-- Indexes for table `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`SensorID`),
  ADD KEY `FK_Sensor_LocationID` (`LocationID`);

--
-- Indexes for table `sensordata`
--
ALTER TABLE `sensordata`
  ADD PRIMARY KEY (`DataID`),
  ADD KEY `FK_SensorData_SensorID` (`SensorID`);

--
-- Indexes for table `soilcomposition`
--
ALTER TABLE `soilcomposition`
  ADD PRIMARY KEY (`SoilCompositionID`),
  ADD KEY `FK_SoilComposition_LocationID` (`LocationID`);

--
-- Indexes for table `species`
--
ALTER TABLE `species`
  ADD PRIMARY KEY (`SpeciesID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `userpermission`
--
ALTER TABLE `userpermission`
  ADD PRIMARY KEY (`UserPermissionID`),
  ADD KEY `FK_UserPermission_UserID` (`UserID`),
  ADD KEY `FK_UserPermission_PermissionID` (`PermissionID`);

--
-- Indexes for table `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`UserRoleID`),
  ADD KEY `FK_UserRole_UserID` (`UserID`),
  ADD KEY `FK_UserRole_RoleID` (`RoleID`);

--
-- Indexes for table `vegetation`
--
ALTER TABLE `vegetation`
  ADD PRIMARY KEY (`VegetationID`),
  ADD KEY `FK_Vegetation_LocationID` (`LocationID`),
  ADD KEY `FK_Vegetation_SpeciesID` (`SpeciesID`);

--
-- Indexes for table `waterquality`
--
ALTER TABLE `waterquality`
  ADD PRIMARY KEY (`WaterQualityID`),
  ADD KEY `FK_WaterQuality_LocationID` (`LocationID`);

--
-- Indexes for table `weather`
--
ALTER TABLE `weather`
  ADD PRIMARY KEY (`WeatherID`),
  ADD KEY `FK_Weather_LocationID` (`LocationID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `firehistory`
--
ALTER TABLE `firehistory`
  ADD CONSTRAINT `FK_FireHistory_LocationID` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`),
  ADD CONSTRAINT `firehistory_ibfk_1` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`);

--
-- Constraints for table `observation`
--
ALTER TABLE `observation`
  ADD CONSTRAINT `FK_Observation_LocationID` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`),
  ADD CONSTRAINT `FK_Observation_SpeciesID` FOREIGN KEY (`SpeciesID`) REFERENCES `species` (`SpeciesID`),
  ADD CONSTRAINT `FK_Observation_UserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `observation_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `observation_ibfk_2` FOREIGN KEY (`SpeciesID`) REFERENCES `species` (`SpeciesID`),
  ADD CONSTRAINT `observation_ibfk_3` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`);

--
-- Constraints for table `projectlocation`
--
ALTER TABLE `projectlocation`
  ADD CONSTRAINT `projectlocation_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `researchproject` (`ProjectID`),
  ADD CONSTRAINT `projectlocation_ibfk_2` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`);

--
-- Constraints for table `protectedareas`
--
ALTER TABLE `protectedareas`
  ADD CONSTRAINT `FK_ProtectedAreas_LocationID` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`),
  ADD CONSTRAINT `protectedareas_ibfk_1` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `researchproject`
--
ALTER TABLE `researchproject`
  ADD CONSTRAINT `FK_ResearchProject_ResearcherID` FOREIGN KEY (`ResearcherID`) REFERENCES `researcher` (`ResearcherID`),
  ADD CONSTRAINT `researchproject_ibfk_1` FOREIGN KEY (`ResearcherID`) REFERENCES `researcher` (`ResearcherID`);

--
-- Constraints for table `sensor`
--
ALTER TABLE `sensor`
  ADD CONSTRAINT `FK_Sensor_LocationID` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`),
  ADD CONSTRAINT `sensor_ibfk_1` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`);

--
-- Constraints for table `sensordata`
--
ALTER TABLE `sensordata`
  ADD CONSTRAINT `FK_SensorData_SensorID` FOREIGN KEY (`SensorID`) REFERENCES `sensor` (`SensorID`),
  ADD CONSTRAINT `sensordata_ibfk_1` FOREIGN KEY (`SensorID`) REFERENCES `sensor` (`SensorID`);

--
-- Constraints for table `soilcomposition`
--
ALTER TABLE `soilcomposition`
  ADD CONSTRAINT `FK_SoilComposition_LocationID` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`),
  ADD CONSTRAINT `soilcomposition_ibfk_1` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`);

--
-- Constraints for table `userpermission`
--
ALTER TABLE `userpermission`
  ADD CONSTRAINT `FK_UserPermission_PermissionID` FOREIGN KEY (`PermissionID`) REFERENCES `permission` (`PermissionID`),
  ADD CONSTRAINT `FK_UserPermission_UserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `userpermission_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `userpermission_ibfk_2` FOREIGN KEY (`PermissionID`) REFERENCES `permission` (`PermissionID`);

--
-- Constraints for table `userrole`
--
ALTER TABLE `userrole`
  ADD CONSTRAINT `FK_UserRole_RoleID` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`),
  ADD CONSTRAINT `FK_UserRole_UserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`);

--
-- Constraints for table `vegetation`
--
ALTER TABLE `vegetation`
  ADD CONSTRAINT `FK_Vegetation_LocationID` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`),
  ADD CONSTRAINT `FK_Vegetation_SpeciesID` FOREIGN KEY (`SpeciesID`) REFERENCES `species` (`SpeciesID`),
  ADD CONSTRAINT `vegetation_ibfk_1` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`),
  ADD CONSTRAINT `vegetation_ibfk_2` FOREIGN KEY (`SpeciesID`) REFERENCES `species` (`SpeciesID`);

--
-- Constraints for table `waterquality`
--
ALTER TABLE `waterquality`
  ADD CONSTRAINT `FK_WaterQuality_LocationID` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`),
  ADD CONSTRAINT `waterquality_ibfk_1` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`);

--
-- Constraints for table `weather`
--
ALTER TABLE `weather`
  ADD CONSTRAINT `FK_Weather_LocationID` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`),
  ADD CONSTRAINT `weather_ibfk_1` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
