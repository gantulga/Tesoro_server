-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2023 at 01:12 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tesoro`
--

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('4c4f4e80c3904e3cc170cdc33718a1013ea31edf', '2021-05-30 15:45:27.349011', 2),
('5e0f80b71ae67932c623a471c6b0a32980a70185', '2021-07-27 05:12:51.662353', 7),
('8bbffcdd730c9b2dbee9b7074c2078ef1a6df17f', '2020-06-20 07:52:30.831022', 1),
('a44c202293a29a2405626519fdc2e94d59b630b1', '2021-08-09 04:10:33.678736', 9),
('b55d6811294098d3fe15472ef4c506f4840d7136', '2021-07-27 05:11:16.628918', 6),
('c460d40647bbb0cf926ac64b42c533913c79110b', '2021-07-27 07:13:44.002649', 8),
('f3cc91a59e1bdd4fb867f27bc16c9a54933a6f6e', '2020-07-05 05:19:45.188768', 4);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(20, 'Аж ахуйн алба'),
(7, 'Ахлах тогооч'),
(12, 'Бармен'),
(15, 'Буудлын ресефшин туслах'),
(10, 'Бэлтгэгч'),
(1, 'Захирал'),
(13, 'Зөөгч'),
(18, 'Массажист'),
(3, 'Менежер'),
(5, 'Нягтлан'),
(4, 'Нярав'),
(14, 'Ресефшин'),
(8, 'Тогооч'),
(6, 'Туслах'),
(9, 'Туслах тогооч'),
(11, 'Угаагч'),
(19, 'Угаалгын газрын ажилтан'),
(2, 'Удирдлага'),
(16, 'Үйлчлэгч'),
(17, 'Үрэгч');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add budget', 7, 'add_budget'),
(26, 'Can change budget', 7, 'change_budget'),
(27, 'Can delete budget', 7, 'delete_budget'),
(28, 'Can view budget', 7, 'view_budget'),
(29, 'Can add budget_type', 8, 'add_budget_type'),
(30, 'Can change budget_type', 8, 'change_budget_type'),
(31, 'Can delete budget_type', 8, 'delete_budget_type'),
(32, 'Can view budget_type', 8, 'view_budget_type'),
(33, 'Can add currency', 9, 'add_currency'),
(34, 'Can change currency', 9, 'change_currency'),
(35, 'Can delete currency', 9, 'delete_currency'),
(36, 'Can view currency', 9, 'view_currency'),
(37, 'Can add investment', 10, 'add_investment'),
(38, 'Can change investment', 10, 'change_investment'),
(39, 'Can delete investment', 10, 'delete_investment'),
(40, 'Can view investment', 10, 'view_investment'),
(41, 'Can add loan', 11, 'add_loan'),
(42, 'Can change loan', 11, 'change_loan'),
(43, 'Can delete loan', 11, 'delete_loan'),
(44, 'Can view loan', 11, 'view_loan'),
(45, 'Can add money_transfer', 12, 'add_money_transfer'),
(46, 'Can change money_transfer', 12, 'change_money_transfer'),
(47, 'Can delete money_transfer', 12, 'delete_money_transfer'),
(48, 'Can view money_transfer', 12, 'view_money_transfer'),
(49, 'Can add wallet', 13, 'add_wallet'),
(50, 'Can change wallet', 13, 'change_wallet'),
(51, 'Can delete wallet', 13, 'delete_wallet'),
(52, 'Can view wallet', 13, 'view_wallet'),
(53, 'Can add money_transfer_type', 14, 'add_money_transfer_type'),
(54, 'Can change money_transfer_type', 14, 'change_money_transfer_type'),
(55, 'Can delete money_transfer_type', 14, 'delete_money_transfer_type'),
(56, 'Can view money_transfer_type', 14, 'view_money_transfer_type'),
(57, 'Can add bill', 15, 'add_bill'),
(58, 'Can change bill', 15, 'change_bill'),
(59, 'Can delete bill', 15, 'delete_bill'),
(60, 'Can view bill', 15, 'view_bill'),
(61, 'Can add order', 16, 'add_order'),
(62, 'Can change order', 16, 'change_order'),
(63, 'Can delete order', 16, 'delete_order'),
(64, 'Can view order', 16, 'view_order'),
(65, 'Can add payment', 17, 'add_payment'),
(66, 'Can change payment', 17, 'change_payment'),
(67, 'Can delete payment', 17, 'delete_payment'),
(68, 'Can view payment', 17, 'view_payment'),
(69, 'Can add pos_account_consolidation', 18, 'add_pos_account_consolidation'),
(70, 'Can change pos_account_consolidation', 18, 'change_pos_account_consolidation'),
(71, 'Can delete pos_account_consolidation', 18, 'delete_pos_account_consolidation'),
(72, 'Can view pos_account_consolidation', 18, 'view_pos_account_consolidation'),
(73, 'Can add payment_bills', 19, 'add_payment_bills'),
(74, 'Can change payment_bills', 19, 'change_payment_bills'),
(75, 'Can delete payment_bills', 19, 'delete_payment_bills'),
(76, 'Can view payment_bills', 19, 'view_payment_bills'),
(77, 'Can add order_payments', 20, 'add_order_payments'),
(78, 'Can change order_payments', 20, 'change_order_payments'),
(79, 'Can delete order_payments', 20, 'delete_order_payments'),
(80, 'Can view order_payments', 20, 'view_order_payments'),
(81, 'Can add order_detial', 21, 'add_order_detial'),
(82, 'Can change order_detial', 21, 'change_order_detial'),
(83, 'Can delete order_detial', 21, 'delete_order_detial'),
(84, 'Can view order_detial', 21, 'view_order_detial'),
(85, 'Can add basic_asset', 22, 'add_basic_asset'),
(86, 'Can change basic_asset', 22, 'change_basic_asset'),
(87, 'Can delete basic_asset', 22, 'delete_basic_asset'),
(88, 'Can view basic_asset', 22, 'view_basic_asset'),
(89, 'Can add commodity', 23, 'add_commodity'),
(90, 'Can change commodity', 23, 'change_commodity'),
(91, 'Can delete commodity', 23, 'delete_commodity'),
(92, 'Can view commodity', 23, 'view_commodity'),
(93, 'Can add ingredient', 24, 'add_ingredient'),
(94, 'Can change ingredient', 24, 'change_ingredient'),
(95, 'Can delete ingredient', 24, 'delete_ingredient'),
(96, 'Can view ingredient', 24, 'view_ingredient'),
(97, 'Can add store', 25, 'add_store'),
(98, 'Can change store', 25, 'change_store'),
(99, 'Can delete store', 25, 'delete_store'),
(100, 'Can view store', 25, 'view_store'),
(101, 'Can add size_type', 26, 'add_size_type'),
(102, 'Can change size_type', 26, 'change_size_type'),
(103, 'Can delete size_type', 26, 'delete_size_type'),
(104, 'Can view size_type', 26, 'view_size_type'),
(105, 'Can add product_category', 27, 'add_product_category'),
(106, 'Can change product_category', 27, 'change_product_category'),
(107, 'Can delete product_category', 27, 'delete_product_category'),
(108, 'Can view product_category', 27, 'view_product_category'),
(109, 'Can add product', 28, 'add_product'),
(110, 'Can change product', 28, 'change_product'),
(111, 'Can delete product', 28, 'delete_product'),
(112, 'Can view product', 28, 'view_product'),
(113, 'Can add item_transfer_type', 29, 'add_item_transfer_type'),
(114, 'Can change item_transfer_type', 29, 'change_item_transfer_type'),
(115, 'Can delete item_transfer_type', 29, 'delete_item_transfer_type'),
(116, 'Can view item_transfer_type', 29, 'view_item_transfer_type'),
(117, 'Can add item_transfer', 30, 'add_item_transfer'),
(118, 'Can change item_transfer', 30, 'change_item_transfer'),
(119, 'Can delete item_transfer', 30, 'delete_item_transfer'),
(120, 'Can view item_transfer', 30, 'view_item_transfer'),
(121, 'Can add item_balance_log', 31, 'add_item_balance_log'),
(122, 'Can change item_balance_log', 31, 'change_item_balance_log'),
(123, 'Can delete item_balance_log', 31, 'delete_item_balance_log'),
(124, 'Can view item_balance_log', 31, 'view_item_balance_log'),
(125, 'Can add item_balance', 32, 'add_item_balance'),
(126, 'Can change item_balance', 32, 'change_item_balance'),
(127, 'Can delete item_balance', 32, 'delete_item_balance'),
(128, 'Can view item_balance', 32, 'view_item_balance'),
(129, 'Can add commodity_category', 33, 'add_commodity_category'),
(130, 'Can change commodity_category', 33, 'change_commodity_category'),
(131, 'Can delete commodity_category', 33, 'delete_commodity_category'),
(132, 'Can view commodity_category', 33, 'view_commodity_category'),
(133, 'Can add broken_item', 34, 'add_broken_item'),
(134, 'Can change broken_item', 34, 'change_broken_item'),
(135, 'Can delete broken_item', 34, 'delete_broken_item'),
(136, 'Can view broken_item', 34, 'view_broken_item'),
(137, 'Can add basic_asset_count', 35, 'add_basic_asset_count'),
(138, 'Can change basic_asset_count', 35, 'change_basic_asset_count'),
(139, 'Can delete basic_asset_count', 35, 'delete_basic_asset_count'),
(140, 'Can view basic_asset_count', 35, 'view_basic_asset_count'),
(141, 'Can add configuration_value', 36, 'add_configuration_value'),
(142, 'Can change configuration_value', 36, 'change_configuration_value'),
(143, 'Can delete configuration_value', 36, 'delete_configuration_value'),
(144, 'Can view configuration_value', 36, 'view_configuration_value'),
(145, 'Can add division', 37, 'add_division'),
(146, 'Can change division', 37, 'change_division'),
(147, 'Can delete division', 37, 'delete_division'),
(148, 'Can view division', 37, 'view_division'),
(149, 'Can add shift_work', 38, 'add_shift_work'),
(150, 'Can change shift_work', 38, 'change_shift_work'),
(151, 'Can delete shift_work', 38, 'delete_shift_work'),
(152, 'Can view shift_work', 38, 'view_shift_work'),
(153, 'Can add customer', 39, 'add_customer'),
(154, 'Can change customer', 39, 'change_customer'),
(155, 'Can delete customer', 39, 'delete_customer'),
(156, 'Can view customer', 39, 'view_customer'),
(157, 'Can add user_ profile', 40, 'add_user_profile'),
(158, 'Can change user_ profile', 40, 'change_user_profile'),
(159, 'Can delete user_ profile', 40, 'delete_user_profile'),
(160, 'Can view user_ profile', 40, 'view_user_profile'),
(161, 'Can add client', 41, 'add_client'),
(162, 'Can change client', 41, 'change_client'),
(163, 'Can delete client', 41, 'delete_client'),
(164, 'Can view client', 41, 'view_client'),
(165, 'Can add notification', 42, 'add_notification'),
(166, 'Can change notification', 42, 'change_notification'),
(167, 'Can delete notification', 42, 'delete_notification'),
(168, 'Can view notification', 42, 'view_notification'),
(169, 'Can add hotel_client_item', 43, 'add_hotel_client_item'),
(170, 'Can change hotel_client_item', 43, 'change_hotel_client_item'),
(171, 'Can delete hotel_client_item', 43, 'delete_hotel_client_item'),
(172, 'Can view hotel_client_item', 43, 'view_hotel_client_item'),
(173, 'Can add hotel_client_log', 44, 'add_hotel_client_log'),
(174, 'Can change hotel_client_log', 44, 'change_hotel_client_log'),
(175, 'Can delete hotel_client_log', 44, 'delete_hotel_client_log'),
(176, 'Can view hotel_client_log', 44, 'view_hotel_client_log'),
(177, 'Can add hotel_client_item_eelj', 45, 'add_hotel_client_item_eelj'),
(178, 'Can change hotel_client_item_eelj', 45, 'change_hotel_client_item_eelj'),
(179, 'Can delete hotel_client_item_eelj', 45, 'delete_hotel_client_item_eelj'),
(180, 'Can view hotel_client_item_eelj', 45, 'view_hotel_client_item_eelj'),
(181, 'Can add Token', 46, 'add_token'),
(182, 'Can change Token', 46, 'change_token'),
(183, 'Can delete Token', 46, 'delete_token'),
(184, 'Can view Token', 46, 'view_token'),
(185, 'Can add token', 47, 'add_tokenproxy'),
(186, 'Can change token', 47, 'change_tokenproxy'),
(187, 'Can delete token', 47, 'delete_tokenproxy'),
(188, 'Can view token', 47, 'view_tokenproxy'),
(189, 'Can add ingredient_product', 48, 'add_ingredient_product'),
(190, 'Can change ingredient_product', 48, 'change_ingredient_product'),
(191, 'Can delete ingredient_product', 48, 'delete_ingredient_product'),
(192, 'Can view ingredient_product', 48, 'view_ingredient_product');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$LFSgAp2DBkQCnsGtfj695E$gx/dS/YmKw0xqhi8ZiLivHzlBSJR7ClVw13spZUfz5E=', '2023-02-08 08:25:53.255456', 1, 'admin', 'Gantulga', 'Davaasuren', 'admin@admin.com', 1, 1, '2020-01-09 09:29:31.000000'),
(2, 'pbkdf2_sha256$260000$hj42HI6UKB1kdTlTrkHPC6$e8nET9GH8rmM5C5aVG9gt0zUZoGOyv20JP8esPuz6PA=', '2022-01-19 02:12:43.872587', 0, 'tsaska', 'Tsaschikher', 'Erdenebileg', 'tsaskac@yahoo.com', 1, 1, '2020-01-05 04:31:35.000000'),
(3, 'pbkdf2_sha256$260000$UMe7v95kGeDFCpT9JgH5s6$V7QzySkFcjELhomeqDL6rlIU/RF5hpO2kpe0xsMgucI=', '2020-01-05 07:34:51.148000', 0, 'hashka', 'Khas-Erdene', 'Erdenebileg', 'haku_10000@yahoo.com', 1, 1, '2020-01-05 07:02:11.000000'),
(4, 'pbkdf2_sha256$260000$UMe7v95kGeDFCpT9JgH5s6$V7QzySkFcjELhomeqDL6rlIU/RF5hpO2kpe0xsMgucI=', '2020-01-05 07:34:51.000000', 1, 'erdenesoyol', 'Erdenesoyol', 'Bal', 'erdenesoyol.b@yahoo.com', 1, 1, '2020-01-25 09:58:53.000000'),
(6, 'pbkdf2_sha256$260000$Hahd9FcKyOn6YqHhscN1wG$xLZmvteL6rEDs4WGjeh9KwkMoAiG5q/7GWWN1MRZREw=', NULL, 0, 'batbayr', 'batbayr', 'jargalsaikhan', 'jargalsaikhanbatbayr@icloud.com', 0, 1, '2021-07-26 12:55:23.000000'),
(7, 'pbkdf2_sha256$260000$6LkYF5XkauuRv3m6pyBZAU$k1zq10f9NMlp6Yj8FcsrUKaoQxtdGx52laUuphZRRO0=', NULL, 0, 'naraa', 'Narangarav', 'Altankhuyag', 'naraanrn24@gmail.com', 0, 1, '2021-07-26 12:58:50.000000'),
(8, 'pbkdf2_sha256$260000$bQGBnsmjeaRpjtmNSxxbTu$HQjQeuyo4nU03I3oHhMDMWuzGRIbvAyaYpLvL2HjH8I=', NULL, 0, 'eegii', 'enkhtsetseg', 'magsar', 'meegiinee43@gmail.com', 0, 1, '2021-07-26 13:00:53.000000'),
(9, 'pbkdf2_sha256$260000$UJ1RM8io4WTcap1GER7G1q$dF6AzlS0NK2LiqLFHeEs5If1axPSmRDaL1vcATLD9d4=', NULL, 0, 'Urnaa', 'Uranbileg', 'Zorigt', 'uranzo513@gmail.com', 0, 1, '2021-08-09 04:09:33.000000'),
(10, 'pbkdf2_sha256$260000$DIU99WyMlzA9yj8AOWKRf8$N/S2NxFcMLNss0fuht4BDoWrYOAfgv899I4HdTJij+0=', NULL, 0, 'unuruu', 'unurbold', 'tsevegjav', 'tsaskac@yahoo.com', 0, 1, '2021-08-10 14:52:52.000000'),
(11, 'pbkdf2_sha256$260000$35BlgAUnbJPj32asM7XyW9$HvGVz3O9BATUGe1YmHRP8tTWdlHEAzyVeNwFUjElU1A=', NULL, 0, 'zulaa', 'Zulaa', 'Dulamsuren', 'Tsaskac@yahoo.com', 0, 1, '2021-08-10 14:53:35.000000'),
(12, 'pbkdf2_sha256$260000$VtfRR84LmKCY1RvnKphJoT$TR2VFUKEk1PW7LDMRQIiUNHIkuGVNhdlUvH3paVa6Vo=', NULL, 0, 'baatraa', 'batbaatar', 'ganbold', 'Tsaskac@yahoo.com', 0, 1, '2021-08-10 14:54:14.000000'),
(13, 'pbkdf2_sha256$260000$qBDkSeejXBxBkQWJF3xgZu$oWRbeRthq+1BfGR1GFxFleO1ECVvdXUt9XPiXet1Wyw=', NULL, 0, 'orhoo', 'orhontuya', 'orhoo', 'tsaskac@yahoo.com', 0, 1, '2021-08-10 14:54:47.000000'),
(14, 'pbkdf2_sha256$260000$4gkAC5MmxW1HvouQYsnLS5$Tj9aIX4TvOV06PzAvfcYex3rSLwW0C2Nl55RIMP4Uhw=', NULL, 0, 'oyunchimeg', 'oyunchimeg', 'oyunaa', 'Tsaskac@yahoo.com', 0, 1, '2021-08-10 14:55:21.000000'),
(15, 'pbkdf2_sha256$260000$oa282oanhfxcoE3AARvrTM$HEryXvAcfuEijpxukoD77KQH7RkuQBmt2DSbcnCQyy8=', NULL, 0, 'bolor-erdene', 'bolor-erdene', 'bolroo egch', 'Tsaskac@yahoo.com', 0, 1, '2021-08-10 14:56:10.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_divisions`
--

CREATE TABLE `auth_user_divisions` (
  `id` int(11) NOT NULL,
  `division_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_user_divisions`
--

INSERT INTO `auth_user_divisions` (`id`, `division_id`, `user_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(13, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 2),
(6, 2, 3),
(7, 2, 4),
(8, 3, 2),
(9, 3, 3),
(10, 3, 4),
(11, 4, 1),
(14, 6, 13),
(16, 7, 13),
(15, 8, 13),
(17, 9, 13),
(18, 10, 8),
(19, 11, 6),
(20, 12, 8),
(21, 13, 11),
(22, 14, 6),
(23, 15, 16);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(30, 2, 13),
(31, 2, 14),
(32, 2, 15),
(29, 2, 16),
(34, 2, 62),
(33, 2, 66),
(6, 2, 89),
(7, 2, 90),
(8, 2, 91),
(9, 2, 92),
(14, 2, 93),
(15, 2, 94),
(16, 2, 95),
(13, 2, 96),
(17, 2, 105),
(18, 2, 106),
(19, 2, 107),
(20, 2, 108),
(2, 2, 109),
(3, 2, 110),
(4, 2, 111),
(5, 2, 112),
(10, 2, 125),
(11, 2, 126),
(12, 2, 127),
(1, 2, 128),
(21, 2, 129),
(22, 2, 130),
(23, 2, 131),
(24, 2, 132),
(26, 2, 189),
(27, 2, 190),
(28, 2, 191),
(25, 2, 192);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-06-20 08:56:40.380998', '1', 'Wallet object (1)', 1, '[{\"added\": {}}]', 13, 1),
(2, '2020-06-20 08:58:40.130793', '2', 'Wallet object (2)', 1, '[{\"added\": {}}]', 13, 1),
(3, '2020-06-20 09:25:22.016738', '1', 'Hotel_client_item object (1)', 1, '[{\"added\": {}}]', 43, 1),
(4, '2020-06-20 09:25:33.354637', '2', 'Hotel_client_item object (2)', 1, '[{\"added\": {}}]', 43, 1),
(5, '2020-07-05 05:26:53.497361', '4', 'erdenesoyol', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]', 4, 1),
(6, '2020-07-05 05:28:51.515127', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(7, '2020-07-05 05:28:55.612258', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Last name\"]}}]', 4, 1),
(8, '2020-07-05 07:51:28.554632', '3', 'Wallet object (3)', 1, '[{\"added\": {}}]', 13, 1),
(9, '2020-07-05 07:53:00.045693', '4', 'Wallet object (4)', 1, '[{\"added\": {}}]', 13, 1),
(10, '2020-07-05 07:53:43.235116', '5', 'Wallet object (5)', 1, '[{\"added\": {}}]', 13, 1),
(11, '2020-07-05 07:55:32.145763', '1', 'Wallet object (1)', 2, '[]', 13, 1),
(12, '2020-07-05 07:55:35.976359', '2', 'Wallet object (2)', 2, '[]', 13, 1),
(13, '2020-07-05 07:55:39.361072', '3', 'Wallet object (3)', 2, '[]', 13, 1),
(14, '2020-07-05 07:55:44.360417', '4', 'Wallet object (4)', 2, '[{\"changed\": {\"fields\": [\"Owner\"]}}]', 13, 1),
(15, '2020-07-05 07:55:49.325136', '5', 'Wallet object (5)', 2, '[{\"changed\": {\"fields\": [\"Owner\"]}}]', 13, 1),
(16, '2020-07-05 09:34:41.035407', '28', '308 өрөө ЦАГ', 3, '', 28, 1),
(17, '2020-07-05 09:34:41.040911', '14', '308 өрөө ХОНОГ', 3, '', 28, 1),
(18, '2020-07-05 09:35:32.766680', '14', 'Зочид буудал - 308', 3, '', 41, 1),
(19, '2021-05-29 08:12:48.876838', '5', 'Хоол', 1, '[{\"added\": {}}]', 27, 1),
(20, '2021-05-29 08:13:03.150655', '6', 'Share food', 1, '[{\"added\": {}}]', 27, 1),
(21, '2021-05-29 08:13:14.304293', '7', 'Korean food', 1, '[{\"added\": {}}]', 27, 1),
(22, '2021-05-29 08:13:33.951416', '8', 'Salat', 1, '[{\"added\": {}}]', 27, 1),
(23, '2021-05-29 08:13:57.423759', '9', 'Soup', 1, '[{\"added\": {}}]', 27, 1),
(24, '2021-05-29 08:14:04.654172', '10', 'Pasta', 1, '[{\"added\": {}}]', 27, 1),
(25, '2021-05-29 08:14:10.748521', '11', 'Pizza', 1, '[{\"added\": {}}]', 27, 1),
(26, '2021-05-29 08:14:24.256294', '12', 'Main course', 1, '[{\"added\": {}}]', 27, 1),
(27, '2021-05-29 08:14:36.092971', '13', 'Side dish', 1, '[{\"added\": {}}]', 27, 1),
(28, '2021-05-29 08:14:54.184005', '14', 'Ice cold', 1, '[{\"added\": {}}]', 27, 1),
(29, '2021-05-29 08:15:08.490824', '15', 'Water', 1, '[{\"added\": {}}]', 27, 1),
(30, '2021-05-29 08:15:20.353502', '16', 'Soft drinks', 1, '[{\"added\": {}}]', 27, 1),
(31, '2021-05-29 08:15:28.542971', '17', 'Juice', 1, '[{\"added\": {}}]', 27, 1),
(32, '2021-05-29 08:17:13.510974', '18', 'Bagged pot teas', 1, '[{\"added\": {}}]', 27, 1),
(33, '2021-05-29 08:17:22.818507', '19', 'Iced tea', 1, '[{\"added\": {}}]', 27, 1),
(34, '2021-05-29 08:17:31.500003', '20', 'Smoothies', 1, '[{\"added\": {}}]', 27, 1),
(35, '2021-05-29 08:17:43.323680', '21', 'Milk shake', 1, '[{\"added\": {}}]', 27, 1),
(36, '2021-05-29 08:19:41.931464', '5', 'Food', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 27, 1),
(37, '2021-05-29 08:19:59.430465', '14', 'Drinks', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 27, 1),
(38, '2021-05-29 08:20:36.699596', '22', 'Alcohol', 1, '[{\"added\": {}}]', 27, 1),
(39, '2021-05-29 08:20:50.687396', '23', 'Bottled bear', 1, '[{\"added\": {}}]', 27, 1),
(40, '2021-05-29 08:21:00.352949', '24', 'Vodka', 1, '[{\"added\": {}}]', 27, 1),
(41, '2021-05-29 08:21:09.178454', '25', 'Cognac', 1, '[{\"added\": {}}]', 27, 1),
(42, '2021-05-29 08:21:20.845121', '26', 'Bourbon whiskey', 1, '[{\"added\": {}}]', 27, 1),
(43, '2021-05-29 08:21:37.998102', '27', 'Single malt whiskey', 1, '[{\"added\": {}}]', 27, 1),
(44, '2021-05-29 08:22:01.988474', '28', 'Tequila', 1, '[{\"added\": {}}]', 27, 1),
(45, '2021-05-29 08:22:18.637427', '29', 'Gin', 1, '[{\"added\": {}}]', 27, 1),
(46, '2021-05-29 08:22:27.263920', '30', 'Liquers', 1, '[{\"added\": {}}]', 27, 1),
(47, '2021-05-29 08:22:45.711975', '31', 'Vermouth & Bitter', 1, '[{\"added\": {}}]', 27, 1),
(48, '2021-05-29 08:23:00.923845', '32', 'Sparkling wine', 1, '[{\"added\": {}}]', 27, 1),
(49, '2021-05-29 08:23:16.090713', '33', 'White wine', 1, '[{\"added\": {}}]', 27, 1),
(50, '2021-05-29 08:23:31.600600', '34', 'Rose wine', 1, '[{\"added\": {}}]', 27, 1),
(51, '2021-05-29 08:23:40.590114', '35', 'Red wine', 1, '[{\"added\": {}}]', 27, 1),
(52, '2021-05-29 08:26:40.804422', '29', 'Хавирганы махан цуглуулга 2-3', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Description\", \"Cost\", \"Categories\", \"Client\", \"Division\"]}}]', 28, 1),
(53, '2021-05-29 08:27:01.712618', '31', 'Хавирганы махан цуглуулга 4-5', 1, '[{\"added\": {}}]', 28, 1),
(54, '2021-05-29 08:27:57.198791', '32', 'Монгол хоолны цуглуулга 2-3', 1, '[{\"added\": {}}]', 28, 1),
(55, '2021-05-29 08:28:22.111216', '33', 'Монгол хоолны цуглуулга 4-5', 1, '[{\"added\": {}}]', 28, 1),
(56, '2021-05-29 08:29:55.971585', '34', 'Маханд дурлагсад цуглуулга', 1, '[{\"added\": {}}]', 28, 1),
(57, '2021-05-29 08:30:26.817349', '29', 'йыб', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Client\", \"Division\"]}}]', 28, 1),
(58, '2021-05-29 08:30:46.557478', '30', 'Хавирганы махан цуглуулга 2-3', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Description\", \"Cost\", \"Categories\", \"Division\"]}}]', 28, 1),
(59, '2021-05-29 08:31:14.252062', '29', 'йыб', 3, '', 28, 1),
(60, '2021-05-29 08:31:30.075967', '34', 'Маханд дурлагсад цуглуулга 4-5', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(61, '2021-05-29 08:31:34.365213', '30', 'Хавирганы махан цуглуулга 2-3', 2, '[]', 28, 1),
(62, '2021-05-29 08:31:42.523679', '31', 'Хавирганы махан цуглуулга 4-5', 2, '[{\"changed\": {\"fields\": [\"Client\", \"Division\"]}}]', 28, 1),
(63, '2021-05-29 08:31:54.782380', '32', 'Монгол хоолны цуглуулга 2-3', 2, '[{\"changed\": {\"fields\": [\"Client\", \"Division\"]}}]', 28, 1),
(64, '2021-05-29 08:32:04.700948', '33', 'Монгол хоолны цуглуулга 4-5', 2, '[{\"changed\": {\"fields\": [\"Client\", \"Division\"]}}]', 28, 1),
(65, '2021-05-29 08:32:10.625286', '34', 'Маханд дурлагсад цуглуулга 4-5', 2, '[]', 28, 1),
(66, '2021-05-29 08:32:54.314785', '35', 'Шорлогны цуглуулга 2-3', 1, '[{\"added\": {}}]', 28, 1),
(67, '2021-05-29 08:33:07.304528', '36', 'Шорлогны цуглуулга 4-5', 1, '[{\"added\": {}}]', 28, 1),
(68, '2021-05-29 08:33:48.829903', '37', 'Тахианы махан цуглуулга 2-3', 1, '[{\"added\": {}}]', 28, 1),
(69, '2021-05-29 08:34:29.009202', '38', 'Тахианы махан цуглуулга 4-5', 1, '[{\"added\": {}}]', 28, 1),
(70, '2021-05-29 08:34:55.116695', '39', 'Солонгос хоолны цуглуулга', 1, '[{\"added\": {}}]', 28, 1),
(71, '2021-05-29 08:35:32.077809', '39', 'Солонгос хоолны цуглуулга', 2, '[]', 28, 1),
(72, '2021-05-29 08:36:27.636987', '39', 'Солонгос хоолны цуглуулга 2-3', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Division\"]}}]', 28, 1),
(73, '2021-05-29 08:36:43.183876', '40', 'Солонгос хоолны цуглуулга 4-5', 1, '[{\"added\": {}}]', 28, 1),
(74, '2021-05-29 08:37:33.875775', '41', 'Жэюүгбуггим', 1, '[{\"added\": {}}]', 28, 1),
(75, '2021-05-29 08:37:59.635249', '42', 'Кимчи сангёбсал', 1, '[{\"added\": {}}]', 28, 1),
(76, '2021-05-29 08:38:14.732112', '43', 'Калбижим', 1, '[{\"added\": {}}]', 28, 1),
(77, '2021-05-29 08:38:30.927039', '44', 'Калбитан', 1, '[{\"added\": {}}]', 28, 1),
(78, '2021-05-29 08:38:52.998301', '45', 'Калбитан 2хүн', 1, '[{\"added\": {}}]', 28, 1),
(79, '2021-05-29 08:39:27.407269', '46', 'Бүлгүгги 2хүн', 1, '[{\"added\": {}}]', 28, 1),
(80, '2021-05-29 08:39:52.532706', '43', 'Калбижим 2хүн', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(81, '2021-05-29 08:40:04.747405', '42', 'Кимчи сангёбсал 2хүн', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(82, '2021-05-29 08:40:12.475847', '41', 'Жэюүгбуггим 2хүн', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(83, '2021-05-29 08:40:44.368671', '47', 'Кимчижигэ', 1, '[{\"added\": {}}]', 28, 1),
(84, '2021-05-29 08:41:05.838899', '48', 'Тэнжанжигэ', 1, '[{\"added\": {}}]', 28, 1),
(85, '2021-05-29 08:41:23.706921', '49', 'Моёгтой шөл', 1, '[{\"added\": {}}]', 28, 1),
(86, '2021-05-29 08:41:42.921020', '50', 'Бүдэжигэ 2хүн', 1, '[{\"added\": {}}]', 28, 1),
(87, '2021-05-29 08:42:06.580373', '51', 'Тагтуритан 2хүн', 1, '[{\"added\": {}}]', 28, 1),
(88, '2021-05-29 08:42:20.020142', '52', 'Гоймон', 1, '[{\"added\": {}}]', 28, 1),
(89, '2021-05-29 08:42:32.819874', '53', 'Кимбаб', 1, '[{\"added\": {}}]', 28, 1),
(90, '2021-05-29 08:42:49.168809', '54', 'Догбугги', 1, '[{\"added\": {}}]', 28, 1),
(91, '2021-05-29 08:43:17.133409', '55', 'Цезарь салат', 1, '[{\"added\": {}}]', 28, 1),
(92, '2021-05-29 08:43:30.388167', '56', 'Грек салат', 1, '[{\"added\": {}}]', 28, 1),
(93, '2021-05-29 08:43:52.813449', '57', 'Бууцайтай үхрийн хэлэн салат', 1, '[{\"added\": {}}]', 28, 1),
(94, '2021-05-29 08:44:18.777934', '58', 'Swiss bowl salat', 1, '[{\"added\": {}}]', 28, 1),
(95, '2021-05-29 08:44:51.013778', '59', 'Броколи зутан шөл', 1, '[{\"added\": {}}]', 28, 1),
(96, '2021-05-29 08:45:12.866028', '60', 'Хулууны зутан шөл', 1, '[{\"added\": {}}]', 28, 1),
(97, '2021-05-29 08:45:27.344856', '61', 'Бантан', 1, '[{\"added\": {}}]', 28, 1),
(98, '2021-05-29 08:45:50.708193', '62', 'Банштай цай', 1, '[{\"added\": {}}]', 28, 1),
(99, '2021-05-29 08:46:20.603902', '63', 'Бинтэй хар шөл', 1, '[{\"added\": {}}]', 28, 1),
(100, '2021-05-29 08:46:50.450610', '64', 'Карборанара паста', 1, '[{\"added\": {}}]', 28, 1),
(101, '2021-05-29 08:47:10.384750', '65', 'Бологнайз паста', 1, '[{\"added\": {}}]', 28, 1),
(102, '2021-05-29 08:47:47.042847', '66', 'Mushroom (taglatil) pasta', 1, '[{\"added\": {}}]', 28, 1),
(103, '2021-05-29 08:48:11.436242', '67', 'Салям пицца', 1, '[{\"added\": {}}]', 28, 1),
(104, '2021-05-29 08:48:56.521820', '68', 'Хавай пицца', 1, '[{\"added\": {}}]', 28, 1),
(105, '2021-05-29 08:49:01.557108', '67', 'Салям пицца', 2, '[]', 28, 1),
(106, '2021-05-29 08:49:18.199060', '69', 'Холимог пицца', 1, '[{\"added\": {}}]', 28, 1),
(107, '2021-05-29 08:49:36.406102', '70', 'Кето пицца', 1, '[{\"added\": {}}]', 28, 1),
(108, '2021-05-29 08:50:41.361817', '71', 'Tesoro нэрийн стэйк', 1, '[{\"added\": {}}]', 28, 1),
(109, '2021-05-29 08:50:57.148720', '72', 'Цуйван', 1, '[{\"added\": {}}]', 28, 1),
(110, '2021-05-29 08:51:14.084689', '73', 'Шаржигнуур тахиа', 1, '[{\"added\": {}}]', 28, 1),
(111, '2021-05-29 08:51:32.308731', '74', 'Хуушуур багц', 1, '[{\"added\": {}}]', 28, 1),
(112, '2021-05-29 08:51:58.017201', '75', 'Бууз багц', 1, '[{\"added\": {}}]', 28, 1),
(113, '2021-05-29 08:52:21.451542', '76', 'Хонины шарсан хавирга', 1, '[{\"added\": {}}]', 28, 1),
(114, '2021-05-29 08:52:39.535576', '77', 'Үхрийн шарсан хавирга', 1, '[{\"added\": {}}]', 28, 1),
(115, '2021-05-29 08:53:03.364939', '78', 'Tbone ётэйк', 1, '[{\"added\": {}}]', 28, 1),
(116, '2021-05-29 08:53:35.443774', '79', 'Шарсан төмс', 1, '[{\"added\": {}}]', 28, 1),
(117, '2021-05-29 08:53:46.999435', '80', 'Будаа', 1, '[{\"added\": {}}]', 28, 1),
(118, '2021-05-29 08:54:39.394432', '81', 'Bonaqua 0.5', 1, '[{\"added\": {}}]', 28, 1),
(119, '2021-05-29 08:55:03.995839', '82', 'SanBenedetto still 0.5', 1, '[{\"added\": {}}]', 28, 1),
(120, '2021-05-29 08:56:10.476641', '83', 'SanBenedetto sparkling 0.5', 1, '[{\"added\": {}}]', 28, 1),
(121, '2021-05-29 08:56:40.852379', '84', 'Coca cola', 1, '[{\"added\": {}}]', 28, 1),
(122, '2021-05-29 08:56:59.061420', '85', 'Fanta', 1, '[{\"added\": {}}]', 28, 1),
(123, '2021-05-29 08:57:09.078993', '86', 'Sprite', 1, '[{\"added\": {}}]', 28, 1),
(124, '2021-05-29 08:57:21.428700', '87', 'Soda', 1, '[{\"added\": {}}]', 28, 1),
(125, '2021-05-29 08:57:34.467445', '88', '+C', 1, '[{\"added\": {}}]', 28, 1),
(126, '2021-05-29 08:58:26.607428', '89', 'Juice 250ml', 1, '[{\"added\": {}}]', 28, 1),
(127, '2021-05-29 08:58:46.296554', '90', 'Lipton tea', 1, '[{\"added\": {}}]', 28, 1),
(128, '2021-05-29 08:59:03.076513', '91', 'Green tea', 1, '[{\"added\": {}}]', 28, 1),
(129, '2021-05-29 08:59:25.336787', '92', 'Kiwi & Apple iced tea', 1, '[{\"added\": {}}]', 28, 1),
(130, '2021-05-29 08:59:50.454223', '93', 'Strawberry & Orange iced tea', 1, '[{\"added\": {}}]', 28, 1),
(131, '2021-05-29 09:00:11.234412', '94', 'Blue berry & Watermelon iced tea', 1, '[{\"added\": {}}]', 28, 1),
(132, '2021-05-29 09:00:53.151809', '95', 'Power', 1, '[{\"added\": {}}]', 28, 1),
(133, '2021-05-29 09:01:32.097037', '96', 'Avatar', 1, '[{\"added\": {}}]', 28, 1),
(134, '2021-05-29 09:02:07.658071', '97', 'Passion fruit', 1, '[{\"added\": {}}]', 28, 1),
(135, '2021-05-29 09:02:26.278136', '98', 'Chocolate & Coffee shake', 1, '[{\"added\": {}}]', 28, 1),
(136, '2021-05-29 09:02:53.275680', '99', 'Strawberry & Honey shake', 1, '[{\"added\": {}}]', 28, 1),
(137, '2021-05-29 09:03:09.863629', '100', 'Vanilla & Oreo shake', 1, '[{\"added\": {}}]', 28, 1),
(138, '2021-05-29 09:03:37.463207', '101', 'Sengur', 1, '[{\"added\": {}}]', 28, 1),
(139, '2021-05-29 09:08:06.736609', '101', 'Sengur', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 28, 1),
(140, '2021-05-29 09:09:43.358135', '102', 'Kaltenberg 0.5', 1, '[{\"added\": {}}]', 28, 1),
(141, '2021-05-29 09:11:51.454462', '103', 'Heineken 0.5', 1, '[{\"added\": {}}]', 28, 1),
(142, '2021-05-29 09:15:34.269206', '104', 'Miller 0.5', 1, '[{\"added\": {}}]', 28, 1),
(143, '2021-05-29 09:17:01.134175', '105', 'Сибирская корона 0.5', 1, '[{\"added\": {}}]', 28, 1),
(144, '2021-05-29 09:19:30.579723', '106', 'Harbin ice 0.5', 1, '[{\"added\": {}}]', 28, 1),
(145, '2021-05-29 09:24:19.137227', '107', 'Guinness 0.5', 1, '[{\"added\": {}}]', 28, 1),
(146, '2021-05-29 09:25:09.494107', '108', 'Eden 0.7', 1, '[{\"added\": {}}]', 28, 1),
(147, '2021-05-29 09:25:57.339844', '109', 'Eden 50ml', 1, '[{\"added\": {}}]', 28, 1),
(148, '2021-05-29 09:26:40.186295', '110', 'Velvet 0.7', 1, '[{\"added\": {}}]', 28, 1),
(149, '2021-05-29 09:27:05.422738', '111', 'Velvet 50ml', 1, '[{\"added\": {}}]', 28, 1),
(150, '2021-05-29 09:28:10.279448', '112', 'Evok 700ml', 1, '[{\"added\": {}}]', 28, 1),
(151, '2021-05-29 09:28:27.598438', '113', 'Evok 50ml', 1, '[{\"added\": {}}]', 28, 1),
(152, '2021-05-29 09:29:21.199504', '114', 'Smirnoff red 700ml', 1, '[{\"added\": {}}]', 28, 1),
(153, '2021-05-29 09:29:52.326284', '115', 'Smirnoff red 50ml', 1, '[{\"added\": {}}]', 28, 1),
(154, '2021-05-29 09:30:42.409149', '116', 'Finlandia 700ml', 1, '[{\"added\": {}}]', 28, 1),
(155, '2021-05-29 09:31:03.492355', '117', 'Finlandia 50ml', 1, '[{\"added\": {}}]', 28, 1),
(156, '2021-05-29 09:31:55.681340', '118', 'Beluga 700ml', 1, '[{\"added\": {}}]', 28, 1),
(157, '2021-05-29 09:32:13.654368', '119', 'Beluga 50ml', 1, '[{\"added\": {}}]', 28, 1),
(158, '2021-05-29 09:33:05.629341', '120', 'Belvedere 700ml', 1, '[{\"added\": {}}]', 28, 1),
(159, '2021-05-29 09:33:22.779322', '121', 'Belvedere 50ml', 1, '[{\"added\": {}}]', 28, 1),
(160, '2021-05-29 09:34:12.947191', '122', 'Ciroc 700ml', 1, '[{\"added\": {}}]', 28, 1),
(161, '2021-05-29 09:34:29.303127', '123', 'Ciroc 50ml', 1, '[{\"added\": {}}]', 28, 1),
(162, '2021-05-29 09:35:21.354104', '124', 'Hennessy V.S 700ml', 1, '[{\"added\": {}}]', 28, 1),
(163, '2021-05-29 09:35:39.325132', '125', 'Hennessy V.S 50ml', 1, '[{\"added\": {}}]', 28, 1),
(164, '2021-05-29 09:37:42.721190', '126', 'Hennessy V.S.O.P 700ml', 1, '[{\"added\": {}}]', 28, 1),
(165, '2021-05-29 09:38:01.903287', '127', 'Hennessy V.S.O.P 50ml', 1, '[{\"added\": {}}]', 28, 1),
(166, '2021-05-29 09:38:42.343600', '128', 'Hennessy X.O 700ml', 1, '[{\"added\": {}}]', 28, 1),
(167, '2021-05-29 09:40:11.297688', '129', 'Wild Turkey 700ml', 1, '[{\"added\": {}}]', 28, 1),
(168, '2021-05-29 09:40:48.867836', '130', 'Wild Turkey 50ml', 1, '[{\"added\": {}}]', 28, 1),
(169, '2021-05-29 09:42:02.425044', '131', 'Jameson 700ml', 1, '[{\"added\": {}}]', 28, 1),
(170, '2021-05-29 09:42:25.334354', '132', 'Jameson 50ml', 1, '[{\"added\": {}}]', 28, 1),
(171, '2021-05-29 09:44:53.494828', '133', 'Jack Daniel\'s  700ml', 1, '[{\"added\": {}}]', 28, 1),
(172, '2021-05-29 09:45:10.451798', '134', 'Jack Daniel\'s  50ml', 1, '[{\"added\": {}}]', 28, 1),
(173, '2021-05-29 09:46:07.028034', '135', 'Jack Daniel\'s Honey 700ml', 1, '[{\"added\": {}}]', 28, 1),
(174, '2021-05-29 09:46:29.100297', '136', 'Jack Daniel\'s Honey 50ml', 1, '[{\"added\": {}}]', 28, 1),
(175, '2021-05-29 09:47:15.143930', '137', 'Jack Daniel\'s Fire 700ml', 1, '[{\"added\": {}}]', 28, 1),
(176, '2021-05-29 09:47:39.120302', '138', 'Jack Daniel\'s Fire 50ml', 1, '[{\"added\": {}}]', 28, 1),
(177, '2021-05-29 09:48:35.933551', '139', 'Jack Single barrel 700ml', 1, '[{\"added\": {}}]', 28, 1),
(178, '2021-05-29 09:49:05.319232', '140', 'Jack Single barrel 50ml', 1, '[{\"added\": {}}]', 28, 1),
(179, '2021-05-29 09:49:58.490273', '141', 'Glenmorangie Orignal 700ml', 1, '[{\"added\": {}}]', 28, 1),
(180, '2021-05-29 09:50:18.768433', '142', 'Glenmorangie Orignal 50ml', 1, '[{\"added\": {}}]', 28, 1),
(181, '2021-05-29 09:50:40.616683', '142', 'Glenmorangie Orignal 50ml', 2, '[{\"changed\": {\"fields\": [\"Categories\"]}}]', 28, 1),
(182, '2021-05-29 09:51:17.662802', '36', 'Scotch & Canadian whiskey', 1, '[{\"added\": {}}]', 27, 1),
(183, '2021-05-29 09:52:10.583828', '143', 'Ballantine\'s Finest 700ml', 1, '[{\"added\": {}}]', 28, 1),
(184, '2021-05-29 09:52:27.456793', '144', 'Ballantine\'s Finest 50ml', 1, '[{\"added\": {}}]', 28, 1),
(185, '2021-05-29 09:53:03.339846', '145', 'Crown Royal 700ml', 1, '[{\"added\": {}}]', 28, 1),
(186, '2021-05-29 09:53:18.685724', '146', 'Crown Royal 50ml', 1, '[{\"added\": {}}]', 28, 1),
(187, '2021-05-29 09:54:11.335735', '147', 'Chivas regal 12yo 700ml', 1, '[{\"added\": {}}]', 28, 1),
(188, '2021-05-29 09:54:33.210986', '148', 'Chivas regal 12yo 50ml', 1, '[{\"added\": {}}]', 28, 1),
(189, '2021-05-29 09:55:34.558495', '149', 'Johnnie Walker Red 700ml', 1, '[{\"added\": {}}]', 28, 1),
(190, '2021-05-29 09:55:51.619471', '150', 'Johnnie Walker Red 50ml', 1, '[{\"added\": {}}]', 28, 1),
(191, '2021-05-29 09:56:43.948464', '151', 'Johnnie Walker Blue 700ml', 1, '[{\"added\": {}}]', 28, 1),
(192, '2021-05-29 09:57:06.204737', '37', 'Rum', 1, '[{\"added\": {}}]', 27, 1),
(193, '2021-05-29 09:58:05.698140', '152', 'Bacardi Superior 1000ml', 1, '[{\"added\": {}}]', 28, 1),
(194, '2021-05-29 09:58:25.534274', '153', 'Bacardi Superior 50ml', 1, '[{\"added\": {}}]', 28, 1),
(195, '2021-05-29 09:59:55.945446', '154', 'Captain Morgan spiced gold 1000ml', 1, '[{\"added\": {}}]', 28, 1),
(196, '2021-05-29 10:00:12.335383', '155', 'Captain Morgan spiced gold 50ml', 1, '[{\"added\": {}}]', 28, 1),
(197, '2021-05-29 10:01:09.810670', '156', 'Captain Morgan dark 1000ml', 1, '[{\"added\": {}}]', 28, 1),
(198, '2021-05-29 10:01:25.514569', '157', 'Captain Morgan dark 50ml', 1, '[{\"added\": {}}]', 28, 1),
(199, '2021-05-29 10:04:05.866740', '158', 'Sierra Silver 700ml', 1, '[{\"added\": {}}]', 28, 1),
(200, '2021-05-29 10:04:27.959004', '159', 'Sierra Silver 50ml', 1, '[{\"added\": {}}]', 28, 1),
(201, '2021-05-29 10:05:11.015467', '160', 'Silver Gold 700ml', 1, '[{\"added\": {}}]', 28, 1),
(202, '2021-05-29 10:05:24.684248', '161', 'Silver Gold 50ml', 1, '[{\"added\": {}}]', 28, 1),
(203, '2021-05-29 10:06:10.762884', '162', 'Pepe Lopez Gold 700ml', 1, '[{\"added\": {}}]', 28, 1),
(204, '2021-05-29 10:06:26.385777', '163', 'Pepe Lopez Gold 50ml', 1, '[{\"added\": {}}]', 28, 1),
(205, '2021-05-29 10:07:21.458927', '164', 'Kahlua 700ml', 1, '[{\"added\": {}}]', 28, 1),
(206, '2021-05-29 10:07:39.252945', '165', 'Kahlua 700ml', 1, '[{\"added\": {}}]', 28, 1),
(207, '2021-05-29 10:07:48.675484', '165', 'Kahlua 50ml', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(208, '2021-05-29 10:08:34.629113', '166', 'Bailey\'s 700ml', 1, '[{\"added\": {}}]', 28, 1),
(209, '2021-05-29 10:08:53.610198', '167', 'Bailey\'s 50ml', 1, '[{\"added\": {}}]', 28, 1),
(210, '2021-05-29 10:09:50.655461', '168', 'Jagermeister 700ml', 1, '[{\"added\": {}}]', 28, 1),
(211, '2021-05-29 10:10:16.360931', '169', 'Jagermeister 50ml', 1, '[{\"added\": {}}]', 28, 1),
(212, '2021-05-29 10:11:43.247901', '170', 'Sambuca 1000ml', 1, '[{\"added\": {}}]', 28, 1),
(213, '2021-05-29 10:11:59.921855', '171', 'Sambuca 50ml', 1, '[{\"added\": {}}]', 28, 1),
(214, '2021-05-29 10:12:36.630954', '172', 'AbsenthXenta 700ml', 1, '[{\"added\": {}}]', 28, 1),
(215, '2021-05-29 10:12:55.446030', '173', 'AbsenthXenta 50ml', 1, '[{\"added\": {}}]', 28, 1),
(216, '2021-05-29 10:13:49.743136', '174', 'Gordon\'s 700ml', 1, '[{\"added\": {}}]', 28, 1),
(217, '2021-05-29 10:14:07.670161', '175', 'Gordon\'s 50ml', 1, '[{\"added\": {}}]', 28, 1),
(218, '2021-05-29 10:14:55.532899', '176', 'Campari 700ml', 1, '[{\"added\": {}}]', 28, 1),
(219, '2021-05-29 10:15:17.234140', '177', 'Campari 50ml', 1, '[{\"added\": {}}]', 28, 1),
(220, '2021-05-29 10:16:08.617079', '178', 'Aperol 700ml', 1, '[{\"added\": {}}]', 28, 1),
(221, '2021-05-29 10:16:26.631110', '179', 'Aperol 50ml', 1, '[{\"added\": {}}]', 28, 1),
(222, '2021-05-29 10:17:55.556196', '180', 'Martini 1000ml', 1, '[{\"added\": {}}]', 28, 1),
(223, '2021-05-29 10:18:17.264437', '181', 'Martini 50ml', 1, '[{\"added\": {}}]', 28, 1),
(224, '2021-05-29 10:22:01.995291', '182', 'Moet&Chandon rose', 1, '[{\"added\": {}}]', 28, 1),
(225, '2021-05-29 10:24:23.054359', '183', 'Altos del Plata', 1, '[{\"added\": {}}]', 28, 1),
(226, '2021-05-29 10:26:01.605996', '184', 'Domaine La Baume', 1, '[{\"added\": {}}]', 28, 1),
(227, '2021-05-29 10:27:48.204093', '183', 'Altos del Plata', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 28, 1),
(228, '2021-05-29 10:28:16.104689', '184', 'Domaine La Baume', 2, '[]', 28, 1),
(229, '2021-05-29 10:30:33.142527', '185', 'Domaine Le Baume', 1, '[{\"added\": {}}]', 28, 1),
(230, '2021-05-29 10:32:09.606045', '186', 'Altos del Plata', 1, '[{\"added\": {}}]', 28, 1),
(231, '2021-05-29 10:32:17.307485', '186', 'Altos del Plata', 2, '[]', 28, 1),
(232, '2021-05-29 10:34:03.407554', '187', 'Domaine La Baume', 1, '[{\"added\": {}}]', 28, 1),
(233, '2021-05-29 10:34:58.174686', '186', 'Altos del Plata Red', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(234, '2021-05-29 10:35:58.754151', '188', 'Altos del Plata Red', 1, '[{\"added\": {}}]', 28, 1),
(235, '2021-05-29 10:36:22.271496', '188', 'Altos del Plata Red 125ml', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(236, '2021-05-29 10:37:05.168950', '187', 'Domaine La Baume', 2, '[]', 28, 1),
(237, '2021-05-29 10:37:40.232955', '189', 'Domaine La Baume 125ml', 1, '[{\"added\": {}}]', 28, 1),
(238, '2021-05-29 10:41:53.696453', '190', 'Louis Eschenauer BORDEAUX', 1, '[{\"added\": {}}]', 28, 1),
(239, '2021-05-29 11:41:22.675587', '78', 'Tbone steak', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(240, '2021-05-29 11:51:10.904231', '191', 'Rib eye steak', 1, '[{\"added\": {}}]', 28, 1),
(241, '2021-05-29 11:53:44.071992', '192', 'Chicken breast', 1, '[{\"added\": {}}]', 28, 1),
(242, '2021-05-29 11:54:20.918100', '78', 'Tbone steak', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 1),
(243, '2021-05-29 11:55:43.760838', '102', 'Kaltenberg 500ml', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(244, '2021-05-29 11:55:51.887303', '107', 'Guinness 500ml', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(245, '2021-05-29 11:55:59.620745', '106', 'Harbin ice 500ml', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(246, '2021-05-29 11:56:06.919162', '105', 'Сибирская корона 500ml', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(247, '2021-05-29 11:56:17.143747', '104', 'Miller 500ml', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(248, '2021-05-29 11:56:25.766240', '103', 'Heineken 500ml', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(249, '2021-05-29 11:56:37.404906', '110', 'Velvet 700ml', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(250, '2021-05-29 11:56:47.349475', '108', 'Eden 700ml', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(251, '2021-05-29 11:57:20.742385', '83', 'SanBenedetto sparkling 500ml', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(252, '2021-05-29 11:57:41.236557', '82', 'SanBenedetto still 500ml', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(253, '2021-05-29 11:57:48.301961', '81', 'Bonaqua 500ml', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(254, '2021-05-29 12:00:31.573300', '56', 'Грек салат', 3, '', 28, 1),
(255, '2021-05-29 12:00:55.643677', '82', 'SanBenedetto still 500ml', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 1),
(256, '2021-05-29 12:01:00.908978', '83', 'SanBenedetto sparkling 500ml', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 1),
(257, '2021-05-29 12:01:34.089876', '101', 'Sengur', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 1),
(258, '2021-05-29 12:02:05.935697', '183', 'Altos del Plata', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 1),
(259, '2021-05-29 12:02:10.304947', '186', 'Altos del Plata Red', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 1),
(260, '2021-05-29 12:16:24.118782', '71', 'Tesoro нэрийн стэйк', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 28, 1),
(261, '2021-05-29 12:17:35.520866', '34', 'Маханд дурлагсад цуглуулга 4-5', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 28, 1),
(262, '2021-05-29 12:38:15.702801', '85', 'Fanta Orange', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(263, '2021-05-29 12:39:35.382358', '193', 'Fanta grape', 1, '[{\"added\": {}}]', 28, 1),
(264, '2021-05-29 12:41:08.388678', '85', 'Fanta Orange', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 28, 1),
(265, '2021-05-29 12:41:26.129692', '84', 'Coca cola', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 28, 1),
(266, '2021-05-29 12:42:07.458056', '86', 'Sprite', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 28, 1),
(267, '2021-05-29 12:42:57.255905', '88', '+C', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 28, 1),
(268, '2021-05-29 12:44:45.791112', '87', 'Soda', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 28, 1),
(269, '2021-05-29 12:45:51.529872', '81', 'Bonaqua 500ml', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 28, 1),
(270, '2021-05-29 12:48:42.110629', '83', 'SanBenedetto sparkling 500ml', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 28, 1),
(271, '2021-05-29 12:49:30.794414', '82', 'SanBenedetto still 500ml', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 28, 1),
(272, '2021-05-29 12:54:15.074674', '81', 'Bonaqua 500ml', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 28, 1),
(273, '2021-05-30 14:11:43.658355', '14', 'Item_transfer object (14)', 3, '', 30, 1),
(274, '2021-05-30 14:11:43.716358', '13', 'Item_transfer object (13)', 3, '', 30, 1),
(275, '2021-05-30 14:11:43.757360', '12', 'Item_transfer object (12)', 3, '', 30, 1),
(276, '2021-05-30 14:11:43.800363', '11', 'Item_transfer object (11)', 3, '', 30, 1),
(277, '2021-05-30 14:11:43.841365', '10', 'Item_transfer object (10)', 3, '', 30, 1),
(278, '2021-05-30 14:11:43.883368', '9', 'Item_transfer object (9)', 3, '', 30, 1),
(279, '2021-05-30 14:11:43.918370', '8', 'Item_transfer object (8)', 3, '', 30, 1),
(280, '2021-05-30 14:11:43.979373', '7', 'Item_transfer object (7)', 3, '', 30, 1),
(281, '2021-05-30 14:11:44.026376', '6', 'Item_transfer object (6)', 3, '', 30, 1),
(282, '2021-05-30 14:11:44.066378', '5', 'Item_transfer object (5)', 3, '', 30, 1),
(283, '2021-05-30 14:34:43.695288', '6', 'Wallet object (6)', 1, '[{\"added\": {}}]', 13, 1),
(284, '2021-05-30 14:55:31.590664', '194', 'Hennessy V.S 350ml', 1, '[{\"added\": {}}]', 28, 1),
(285, '2021-05-30 15:20:57.278928', '195', 'JB Rare 750ml', 1, '[{\"added\": {}}]', 28, 1),
(286, '2021-05-30 15:32:38.523037', '187', 'Domaine La Baume Cabernet Sauvignon', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(287, '2021-05-30 15:33:38.710480', '184', 'Domaine La Baume White', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(288, '2021-05-30 15:45:12.483161', '2', 'tsaska', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(289, '2021-05-30 15:47:29.554001', '5', 'tuul', 1, '[{\"added\": {}}]', 4, 1),
(290, '2021-05-30 15:47:50.456197', '5', 'tuul', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Groups\"]}}]', 4, 1),
(291, '2021-05-31 04:52:09.514913', '5', 'tuul', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(292, '2021-05-31 04:52:34.378940', '5', 'tuul', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(293, '2021-06-26 02:53:57.803969', '1', 'ш', 1, '[{\"added\": {}}]', 26, 1),
(294, '2021-06-26 02:54:48.347334', '2', 'гр', 1, '[{\"added\": {}}]', 26, 1),
(295, '2021-06-30 12:09:23.693639', '2', 'Money_transfer_type object (2)', 1, '[{\"added\": {}}]', 14, 1),
(296, '2021-07-03 01:41:12.273388', '1', 'Alcohol gramm', 1, '[{\"added\": {}}]', 33, 1),
(297, '2021-07-03 01:43:00.154981', '2', 'Eden 1000ml', 1, '[{\"added\": {}}]', 33, 1),
(298, '2021-07-03 01:44:30.364003', '3', 'Velvet 1000ml', 1, '[{\"added\": {}}]', 33, 1),
(299, '2021-07-03 01:46:24.293487', '4', 'Smirnoff red 1000ml', 1, '[{\"added\": {}}]', 33, 1),
(300, '2021-07-03 01:46:51.682209', '5', 'Finlandia 1000ml', 1, '[{\"added\": {}}]', 33, 1),
(301, '2021-07-03 01:51:16.500108', '5', 'Finlandia 1000ml', 3, '', 33, 1),
(302, '2021-07-03 01:51:16.502128', '4', 'Smirnoff red 1000ml', 3, '', 33, 1),
(303, '2021-07-03 01:51:16.503314', '3', 'Velvet 1000ml', 3, '', 33, 1),
(304, '2021-07-03 01:51:16.504313', '2', 'Eden 1000ml', 3, '', 33, 1),
(305, '2021-07-03 01:53:44.975830', '1', 'Eden 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(306, '2021-07-03 01:54:04.310114', '2', 'Velvet 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(307, '2021-07-03 01:54:33.871423', '3', 'Evok 750ml', 1, '[{\"added\": {}}]', 23, 1),
(308, '2021-07-03 01:55:04.265130', '4', 'Smirnoff red 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(309, '2021-07-03 01:55:22.174628', '5', 'Finlandia 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(310, '2021-07-03 01:56:18.319307', '6', 'Beluga 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(311, '2021-07-03 01:57:22.213676', '7', 'Belvedere 700ml', 1, '[{\"added\": {}}]', 23, 1),
(312, '2021-07-03 01:58:07.068137', '8', 'Ciroc 700ml', 1, '[{\"added\": {}}]', 23, 1),
(313, '2021-07-03 01:59:01.532608', '9', 'Hennessy V.S 700ml', 1, '[{\"added\": {}}]', 23, 1),
(314, '2021-07-03 01:59:32.618361', '10', 'Hennessy V.S.O.P 700ml', 1, '[{\"added\": {}}]', 23, 1),
(315, '2021-07-03 02:00:15.801121', '11', 'Wild Turkey 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(316, '2021-07-03 02:01:44.747915', '12', 'Jameson 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(317, '2021-07-03 02:02:24.072561', '13', 'Jack Daniel\'s 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(318, '2021-07-03 02:03:26.457700', '14', 'Jack Daniel\'s Honey 700ml', 1, '[{\"added\": {}}]', 23, 1),
(319, '2021-07-03 02:03:38.436389', '8', 'Ciroc 750ml', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Description\", \"Unit size\"]}}]', 23, 1),
(320, '2021-07-03 02:04:34.306536', '15', 'Jack Daniel\'s Fire 750ml', 1, '[{\"added\": {}}]', 23, 1),
(321, '2021-07-03 02:05:19.392594', '140', 'Jack Single barrel 50ml', 3, '', 28, 1),
(322, '2021-07-03 02:06:15.101997', '16', 'Glenmorangie Original 700ml', 1, '[{\"added\": {}}]', 23, 1),
(323, '2021-07-03 02:06:58.122821', '17', 'Ballantine\'s Finest 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(324, '2021-07-03 02:08:03.852817', '146', 'Crown Royal 50ml', 3, '', 28, 1),
(325, '2021-07-03 02:09:15.066568', '148', 'Chivas regal 12yo 50ml', 3, '', 28, 1),
(326, '2021-07-03 02:09:51.225902', '18', 'Johnnie Walker Red 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(327, '2021-07-03 02:11:07.187669', '19', 'Bacardi Superior 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(328, '2021-07-03 02:13:04.419458', '20', 'Captain Morgan Spiced Gold 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(329, '2021-07-03 02:13:24.789671', '157', 'Captain Morgan dark 50ml', 3, '', 28, 1),
(330, '2021-07-03 02:13:24.791692', '156', 'Captain Morgan dark 1000ml', 3, '', 28, 1),
(331, '2021-07-03 02:14:42.960842', '21', 'Sierra Silver 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(332, '2021-07-03 02:14:59.743308', '22', 'Sierra Gold 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(333, '2021-07-03 02:16:06.700086', '21', 'Sierra Silver 700ml', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]', 23, 1),
(334, '2021-07-03 02:16:15.370182', '22', 'Sierra Gold 700ml', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]', 23, 1),
(335, '2021-07-03 02:17:24.383377', '23', 'Pepe Lopez Gold 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(336, '2021-07-03 02:18:16.814029', '24', 'Kahlua 700ml', 1, '[{\"added\": {}}]', 23, 1),
(337, '2021-07-03 02:18:49.972789', '25', 'Bailey\'s 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(338, '2021-07-03 02:19:41.589748', '26', 'Jagermaister 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(339, '2021-07-03 02:22:53.503595', '27', 'Sambuca 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(340, '2021-07-03 02:23:45.062972', '28', 'AbsenthXenta 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(341, '2021-07-03 02:24:35.629159', '29', 'Gordon\'s 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(342, '2021-07-03 02:26:22.477285', '30', 'Campari 700ml', 1, '[{\"added\": {}}]', 23, 1),
(343, '2021-07-03 02:26:53.149873', '31', 'Aperol 700ml', 1, '[{\"added\": {}}]', 23, 1),
(344, '2021-07-03 02:29:35.117953', '32', 'Martini Bianco 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(345, '2021-07-03 02:31:09.733725', '33', 'Martini Rosso 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(346, '2021-07-03 02:32:29.020277', '34', 'Martini Extra Dry 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(347, '2021-07-03 02:34:05.822324', '180', 'Martini Bianco 1000ml', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Description\", \"Image\", \"Whole item\", \"Gramm\"]}}]', 28, 1),
(348, '2021-07-03 02:38:00.593391', '196', 'Martini Rosso 1000ml', 1, '[{\"added\": {}}]', 28, 1),
(349, '2021-07-03 02:38:58.412030', '197', 'Martini Extra Dry 1000ml', 1, '[{\"added\": {}}]', 28, 1),
(350, '2021-07-03 04:22:09.979206', '35', 'Altos del Plata Red 750ml', 1, '[{\"added\": {}}]', 23, 1),
(351, '2021-07-03 04:22:50.494586', '36', 'Domaine La Baume 125ml', 1, '[{\"added\": {}}]', 23, 1),
(352, '2021-07-03 04:25:45.123970', '1', 'Eden 1000ml ---> Eden 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(353, '2021-07-03 04:26:11.838844', '2', 'Velvet 1000ml ---> Velvet 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(354, '2021-07-03 04:26:28.640374', '3', 'Evok 750ml ---> Evok 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(355, '2021-07-03 04:27:03.165724', '4', 'Smirnoff red 1000ml ---> Smirnoff red 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(356, '2021-07-03 04:27:20.187620', '5', 'Finlandia 1000ml ---> Finlandia 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(357, '2021-07-03 04:27:58.084422', '6', 'Beluga 1000ml ---> Beluga 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(358, '2021-07-03 04:28:19.591590', '7', 'Belvedere 700ml ---> Belvedere 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(359, '2021-07-03 04:28:32.356894', '8', 'Ciroc 750ml ---> Ciroc 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(360, '2021-07-03 04:28:48.377981', '9', 'Hennessy V.S 700ml ---> Hennessy V.S 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(361, '2021-07-03 04:29:10.802504', '10', 'Hennessy V.S.O.P 700ml ---> Hennessy V.S.O.P 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(362, '2021-07-03 04:29:27.679439', '11', 'Wild Turkey 1000ml ---> Wild Turkey 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(363, '2021-07-03 04:29:42.062693', '12', 'Jameson 1000ml ---> Jameson 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(364, '2021-07-03 04:30:10.301221', '13', 'Jack Daniel\'s 1000ml ---> Jack Daniel\'s  50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(365, '2021-07-03 04:30:57.382336', '14', 'Jack Daniel\'s Honey 700ml ---> Jack Daniel\'s Honey 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(366, '2021-07-03 04:31:20.950453', '15', 'Jack Daniel\'s Fire 750ml ---> Jack Daniel\'s Fire 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(367, '2021-07-03 04:32:06.479328', '16', 'Glenmorangie Original 700ml ---> Glenmorangie Orignal 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(368, '2021-07-03 04:32:30.635333', '17', 'Ballantine\'s Finest 1000ml ---> Ballantine\'s Finest 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(369, '2021-07-03 04:33:05.027009', '18', 'Johnnie Walker Red 1000ml ---> Johnnie Walker Red 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(370, '2021-07-03 04:34:17.871539', '19', 'Bacardi Superior 1000ml ---> Bacardi Superior 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(371, '2021-07-03 04:34:40.400326', '20', 'Captain Morgan Spiced Gold 1000ml ---> Captain Morgan spiced gold 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(372, '2021-07-03 04:35:28.360602', '21', 'Sierra Silver 700ml ---> Sierra Silver 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(373, '2021-07-03 04:39:08.973263', '37', 'Silver Gold 700ml', 1, '[{\"added\": {}}]', 23, 1),
(374, '2021-07-03 04:39:39.810560', '22', 'Silver Gold 700ml ---> Silver Gold 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(375, '2021-07-03 04:39:57.122122', '23', 'Pepe Lopez Gold 1000ml ---> Pepe Lopez Gold 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(376, '2021-07-03 04:40:18.133028', '24', 'Kahlua 700ml ---> Kahlua 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(377, '2021-07-03 04:40:40.192934', '25', 'Bailey\'s 1000ml ---> Bailey\'s 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(378, '2021-07-03 04:41:20.788542', '26', 'Jagermaister 1000ml ---> Jagermeister 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(379, '2021-07-03 04:41:51.055190', '27', 'Sambuca 1000ml ---> Sambuca 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(380, '2021-07-03 04:43:09.576257', '28', 'AbsenthXenta 1000ml ---> AbsenthXenta 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(381, '2021-07-03 04:43:30.296810', '29', 'Gordon\'s 1000ml ---> Gordon\'s 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(382, '2021-07-03 04:44:00.947347', '30', 'Campari 700ml ---> Campari 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(383, '2021-07-03 04:44:21.704112', '31', 'Aperol 700ml ---> Aperol 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(384, '2021-07-03 04:44:57.004384', '32', 'Martini Bianco 1000ml ---> Martini 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(385, '2021-07-03 04:47:56.426461', '33', 'Martini Rosso 1000ml ---> Martini Rosso 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(386, '2021-07-03 04:48:21.124536', '34', 'Martini Extra Dry 1000ml ---> Martini Extra Dry 50ml : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(387, '2021-07-03 06:48:36.482342', '90', 'Item_transfer object (90)', 1, '[{\"added\": {}}]', 30, 1),
(388, '2021-07-03 13:20:48.853714', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(389, '2021-07-03 13:21:10.055374', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(390, '2021-07-05 02:37:41.315944', '200', 'Louis Eschenauer White 750ml', 2, '[{\"changed\": {\"fields\": [\"Categories\", \"Image\", \"Gramm\"]}}]', 28, 1),
(391, '2021-07-06 07:11:58.015527', '2', 'tsaska', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(392, '2021-07-06 07:16:57.882806', '2', 'tsaska', 2, '[]', 4, 1),
(393, '2021-07-06 07:19:52.557900', '2', 'tsaska', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 4, 1),
(394, '2021-07-06 07:21:21.938578', '24', 'Kahlua 1000ml', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Description\", \"Unit size\"]}}]', 23, 2),
(395, '2021-07-06 07:27:10.307037', '38', 'cointreau 1000ml', 1, '[{\"added\": {}}]', 23, 2),
(396, '2021-07-06 07:28:22.409825', '38', 'Cointreau 1000ml', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]', 23, 2),
(397, '2021-07-06 07:37:46.784538', '39', 'Jagermeister 1000ml', 1, '[{\"added\": {}}]', 23, 2),
(398, '2021-07-06 07:38:36.829426', '39', 'Jagermeister 1000ml', 3, '', 23, 2),
(399, '2021-07-06 07:41:12.921665', '2', 'tsaska', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 4, 1),
(400, '2021-07-06 07:52:44.135833', '2', 'tsaska', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 4, 1),
(401, '2021-07-06 07:56:33.037576', '38', 'Cocktails', 1, '[{\"added\": {}}]', 27, 2),
(402, '2021-07-06 08:00:43.248719', '201', 'Tesoro Special Long Island iced tea', 1, '[{\"added\": {}}]', 28, 2),
(403, '2021-07-06 08:01:33.014997', '202', 'Adios mother  fucker', 1, '[{\"added\": {}}]', 28, 2),
(404, '2021-07-06 08:03:28.098399', '203', 'Cuba Libra', 1, '[{\"added\": {}}]', 28, 2),
(405, '2021-07-06 08:04:16.927485', '204', 'Green summer', 1, '[{\"added\": {}}]', 28, 2),
(406, '2021-07-06 08:04:48.276942', '205', 'Tesoro Special Mojito', 1, '[{\"added\": {}}]', 28, 2),
(407, '2021-07-06 08:05:28.314211', '206', 'Kiwi mojito', 1, '[{\"added\": {}}]', 28, 2),
(408, '2021-07-06 08:08:12.254899', '207', 'Tesoro strong', 1, '[{\"added\": {}}]', 28, 2),
(409, '2021-07-06 08:08:44.283755', '208', 'Alien brain', 1, '[{\"added\": {}}]', 28, 2),
(410, '2021-07-06 08:09:14.235808', '209', 'Crazy Brain', 1, '[{\"added\": {}}]', 28, 2),
(411, '2021-07-06 08:09:55.779681', '210', 'Blow job', 1, '[{\"added\": {}}]', 28, 2),
(412, '2021-07-06 08:10:23.757931', '211', 'B-52', 1, '[{\"added\": {}}]', 28, 2),
(413, '2021-07-06 08:10:45.707170', '212', 'Negroni', 1, '[{\"added\": {}}]', 28, 2),
(414, '2021-07-06 08:11:32.928453', '213', 'Cosmopolitan', 1, '[{\"added\": {}}]', 28, 2),
(415, '2021-07-06 08:11:57.233295', '214', 'God father', 1, '[{\"added\": {}}]', 28, 2),
(416, '2021-07-06 08:12:30.025553', '215', 'Martini', 1, '[{\"added\": {}}]', 28, 2),
(417, '2021-07-06 08:12:57.762402', '216', 'Whiskey sour', 1, '[{\"added\": {}}]', 28, 2),
(418, '2021-07-06 08:13:41.208478', '217', 'Sexy monica', 1, '[{\"added\": {}}]', 28, 2),
(419, '2021-07-06 08:15:03.810623', '218', 'Sex on the beach', 1, '[{\"added\": {}}]', 28, 2),
(420, '2021-07-06 08:15:36.774481', '219', 'Pina coloda', 1, '[{\"added\": {}}]', 28, 2),
(421, '2021-07-06 08:16:06.508133', '220', 'Blue margarita', 1, '[{\"added\": {}}]', 28, 2),
(422, '2021-07-06 08:16:42.313196', '221', 'Strawberry daiquiri', 1, '[{\"added\": {}}]', 28, 2),
(423, '2021-07-06 08:17:05.432437', '222', 'Bloody mary', 1, '[{\"added\": {}}]', 28, 2),
(424, '2021-07-06 08:17:23.670067', '223', 'Red eye', 1, '[{\"added\": {}}]', 28, 2),
(425, '2021-07-06 08:18:53.886827', '35', 'Smirnoff red 1000ml ---> Tesoro Special Long Island iced tea : size = 20', 1, '[{\"added\": {}}]', 24, 2),
(426, '2021-07-06 08:19:48.408923', '36', 'Bacardi Superior 1000ml ---> Tesoro Special Long Island iced tea : size = 20', 1, '[{\"added\": {}}]', 24, 2),
(427, '2021-07-06 08:21:59.920154', '37', 'Sierra Gold 700ml ---> Tesoro Special Long Island iced tea : size = 20', 1, '[{\"added\": {}}]', 24, 2),
(428, '2021-07-06 08:22:52.024246', '38', 'Gordon\'s 1000ml ---> Tesoro Special Long Island iced tea : size = 20', 1, '[{\"added\": {}}]', 24, 2),
(429, '2021-07-06 08:26:03.176522', '2', 'tsaska', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 4, 1),
(430, '2021-07-06 08:27:10.682798', '6', 'Cocktails commodity', 1, '[{\"added\": {}}]', 33, 2),
(431, '2021-07-06 08:27:46.639389', '40', 'coca cola', 1, '[{\"added\": {}}]', 23, 2),
(432, '2021-07-06 08:28:08.780307', '41', 'sprite', 1, '[{\"added\": {}}]', 23, 2),
(433, '2021-07-06 08:29:11.878242', '39', 'coca cola ---> Tesoro Special Long Island iced tea : size = 1', 1, '[{\"added\": {}}]', 24, 2),
(434, '2021-07-06 08:29:32.044654', '40', 'Jack Daniel\'s 1000ml ---> Tesoro Special Long Island iced tea : size = 20', 1, '[{\"added\": {}}]', 24, 2),
(435, '2021-07-06 08:35:28.336795', '42', 'Lemon Juice 750ml', 1, '[{\"added\": {}}]', 23, 2),
(436, '2021-07-06 08:35:39.313202', '41', 'Sprite', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 23, 2),
(437, '2021-07-06 08:35:45.511556', '40', 'Coca cola', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 23, 2),
(438, '2021-07-06 08:36:17.064274', '41', 'Lemon Juice 750ml ---> Tesoro Special Long Island iced tea : size = 15', 1, '[{\"added\": {}}]', 24, 2),
(439, '2021-07-06 08:48:28.945184', '43', 'Triple sec Syrop 700ml', 1, '[{\"added\": {}}]', 23, 2),
(440, '2021-07-06 08:49:26.757287', '44', 'Cucumber Syrop 700ml', 1, '[{\"added\": {}}]', 23, 2),
(441, '2021-07-06 08:56:00.818979', '45', 'Cane sugar 700ml', 1, '[{\"added\": {}}]', 23, 2),
(442, '2021-07-06 08:57:14.639309', '46', 'Blue Curacao syrop 700ml', 1, '[{\"added\": {}}]', 23, 2),
(443, '2021-07-06 09:24:11.357302', '42', 'Smirnoff red 1000ml ---> Adios mother  fucker : size = 20', 1, '[{\"added\": {}}]', 24, 2),
(444, '2021-07-06 09:28:37.672813', '43', 'Bacardi Superior 1000ml ---> Adios mother  fucker : size = 20', 1, '[{\"added\": {}}]', 24, 2),
(445, '2021-07-06 09:29:44.399218', '44', 'Sierra Gold 700ml ---> Adios mother  fucker : size = 20', 1, '[{\"added\": {}}]', 24, 2),
(446, '2021-07-06 09:30:13.686716', '45', 'Gordon\'s 1000ml ---> Adios mother  fucker : size = 20', 1, '[{\"added\": {}}]', 24, 2),
(447, '2021-07-06 09:30:42.430818', '46', 'Triple sec Syrop 700ml ---> Adios mother  fucker : size = 15', 1, '[{\"added\": {}}]', 24, 2),
(448, '2021-07-06 09:31:11.083994', '47', 'Blue Curacao syrop 700ml ---> Adios mother  fucker : size = 15', 1, '[{\"added\": {}}]', 24, 2),
(449, '2021-07-06 09:31:38.560704', '48', 'Sprite ---> Adios mother  fucker : size = 1', 1, '[{\"added\": {}}]', 24, 2),
(450, '2021-07-06 09:32:31.412821', '49', 'Bacardi Superior 1000ml ---> Cuba Libra : size = 50', 1, '[{\"added\": {}}]', 24, 2),
(451, '2021-07-06 09:32:53.455963', '50', 'Cane sugar 700ml ---> Cuba Libra : size = 20', 1, '[{\"added\": {}}]', 24, 2),
(452, '2021-07-06 09:33:15.935603', '51', 'Coca cola ---> Cuba Libra : size = 20', 1, '[{\"added\": {}}]', 24, 2),
(453, '2021-07-06 09:33:35.702838', '51', 'Coca cola ---> Cuba Libra : size = 1', 2, '[{\"changed\": {\"fields\": [\"Size\", \"Size type\"]}}]', 24, 2),
(454, '2021-07-06 09:34:19.866515', '52', 'Smirnoff red 1000ml ---> Green summer : size = 50', 1, '[{\"added\": {}}]', 24, 2),
(455, '2021-07-06 09:34:50.926170', '53', 'Cucumber Syrop 700ml ---> Green summer : size = 15', 1, '[{\"added\": {}}]', 24, 2),
(456, '2021-07-06 09:35:21.112223', '54', 'Sprite ---> Green summer : size = 1', 1, '[{\"added\": {}}]', 24, 2),
(457, '2021-07-06 09:38:11.887596', '224', 'Blueberry Mojito', 1, '[{\"added\": {}}]', 28, 2),
(458, '2021-07-06 09:38:54.274870', '225', 'Sea Buckthorn Mojito', 1, '[{\"added\": {}}]', 28, 2),
(459, '2021-07-06 09:38:55.710073', '226', 'Sea Buckthorn Mojito', 1, '[{\"added\": {}}]', 28, 2),
(460, '2021-07-06 09:39:11.606501', '226', 'Sea Buckthorn Mojito', 3, '', 28, 2),
(461, '2021-07-06 10:47:08.569144', '55', 'Bacardi Superior 1000ml ---> Tesoro Special Mojito : size = 60', 1, '[{\"added\": {}}]', 24, 2),
(462, '2021-07-06 10:48:05.758844', '56', 'Lemon Juice 750ml ---> Tesoro Special Mojito : size = 15', 1, '[{\"added\": {}}]', 24, 2),
(463, '2021-07-06 10:49:14.494565', '47', 'Soda', 1, '[{\"added\": {}}]', 23, 2),
(464, '2021-07-06 10:49:37.240405', '57', 'Soda ---> Tesoro Special Mojito : size = 1', 1, '[{\"added\": {}}]', 24, 2),
(465, '2021-07-06 10:56:27.314933', '58', 'Bacardi Superior 1000ml ---> Kiwi mojito : size = 50', 1, '[{\"added\": {}}]', 24, 2),
(466, '2021-07-06 13:20:20.383005', '59', 'Lemon Juice 750ml ---> Kiwi mojito : size = 15', 1, '[{\"added\": {}}]', 24, 2),
(467, '2021-07-06 13:20:42.488244', '60', 'Soda ---> Kiwi mojito : size = 1', 1, '[{\"added\": {}}]', 24, 2),
(468, '2021-07-20 09:56:34.586068', '61', 'Bacardi Superior 1000ml ---> Blueberry Mojito : size = 60', 1, '[{\"added\": {}}]', 24, 1),
(469, '2021-07-20 09:57:10.304013', '62', 'Lemon Juice 750ml ---> Blueberry Mojito : size = 15', 1, '[{\"added\": {}}]', 24, 1),
(470, '2021-07-20 09:57:43.223772', '63', 'Soda ---> Blueberry Mojito : size = 1', 1, '[{\"added\": {}}]', 24, 1),
(471, '2021-07-20 09:58:25.014981', '64', 'Bacardi Superior 1000ml ---> Sea Buckthorn Mojito : size = 60', 1, '[{\"added\": {}}]', 24, 1),
(472, '2021-07-20 09:58:55.024001', '65', 'Lemon Juice 750ml ---> Sea Buckthorn Mojito : size = 15', 1, '[{\"added\": {}}]', 24, 1),
(473, '2021-07-20 09:59:22.081688', '66', 'Soda ---> Sea Buckthorn Mojito : size = 1', 1, '[{\"added\": {}}]', 24, 1),
(474, '2021-07-20 10:01:07.995714', '67', 'Sambuca 1000ml ---> Tesoro strong : size = 30', 1, '[{\"added\": {}}]', 24, 1),
(475, '2021-07-20 10:01:41.216529', '68', 'Bailey\'s 1000ml ---> Tesoro strong : size = 15', 1, '[{\"added\": {}}]', 24, 1),
(476, '2021-07-20 10:02:21.722884', '69', 'AbsenthXenta 1000ml ---> Tesoro strong : size = 10', 1, '[{\"added\": {}}]', 24, 1),
(477, '2021-07-20 10:03:11.888286', '70', 'Smirnoff red 1000ml ---> Alien brain : size = 30', 1, '[{\"added\": {}}]', 24, 1),
(478, '2021-07-20 10:03:39.529791', '71', 'Bailey\'s 1000ml ---> Alien brain : size = 20', 1, '[{\"added\": {}}]', 24, 1),
(479, '2021-07-20 10:04:40.625915', '72', 'Kahlua 1000ml ---> Alien brain : size = 20', 1, '[{\"added\": {}}]', 24, 1),
(480, '2021-07-20 10:05:11.875096', '73', 'Bailey\'s 1000ml ---> B-52 : size = 20', 1, '[{\"added\": {}}]', 24, 1),
(481, '2021-07-20 10:05:21.950305', '72', 'Kahlua 1000ml ---> B-52 : size = 20', 2, '[{\"changed\": {\"fields\": [\"Product\"]}}]', 24, 1),
(482, '2021-07-20 10:05:56.741481', '74', 'Cointreau 1000ml ---> B-52 : size = 20', 1, '[{\"added\": {}}]', 24, 1),
(483, '2021-07-20 10:07:04.281714', '75', 'Kahlua 1000ml ---> Blow job : size = 20', 1, '[{\"added\": {}}]', 24, 1),
(484, '2021-07-20 10:07:34.042827', '76', 'Bailey\'s 1000ml ---> Blow job : size = 20', 1, '[{\"added\": {}}]', 24, 1),
(485, '2021-07-20 10:09:46.814849', '77', 'Gordon\'s 1000ml ---> Negroni : size = 30', 1, '[{\"added\": {}}]', 24, 1),
(486, '2021-07-20 10:10:20.373778', '78', 'Campari 700ml ---> Negroni : size = 30', 1, '[{\"added\": {}}]', 24, 1),
(487, '2021-07-20 10:11:19.956996', '79', 'Martini Rosso 1000ml ---> Negroni : size = 30', 1, '[{\"added\": {}}]', 24, 1),
(488, '2021-07-20 10:11:50.520069', '80', 'Smirnoff red 1000ml ---> Cosmopolitan : size = 30', 1, '[{\"added\": {}}]', 24, 1),
(489, '2021-07-20 10:12:14.699002', '81', 'Cointreau 1000ml ---> Cosmopolitan : size = 20', 1, '[{\"added\": {}}]', 24, 1),
(490, '2021-07-20 10:12:35.361518', '82', 'Lemon Juice 750ml ---> Cosmopolitan : size = 15', 1, '[{\"added\": {}}]', 24, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(491, '2021-07-20 10:13:40.734912', '83', 'Jack Daniel\'s 1000ml ---> God father : size = 60', 1, '[{\"added\": {}}]', 24, 1),
(492, '2021-07-20 10:17:49.948924', '84', 'Gordon\'s 1000ml ---> Martini : size = 40', 1, '[{\"added\": {}}]', 24, 1),
(493, '2021-07-20 10:18:13.827792', '85', 'Martini Extra Dry 1000ml ---> Martini : size = 30', 1, '[{\"added\": {}}]', 24, 1),
(494, '2021-07-20 10:18:34.824215', '86', 'Lemon Juice 750ml ---> Martini : size = 15', 1, '[{\"added\": {}}]', 24, 1),
(495, '2021-07-20 10:25:21.832588', '87', 'Jack Daniel\'s 1000ml ---> Whiskey sour : size = 60', 1, '[{\"added\": {}}]', 24, 1),
(496, '2021-07-20 10:25:55.731019', '88', 'Lemon Juice 750ml ---> Whiskey sour : size = 15', 1, '[{\"added\": {}}]', 24, 1),
(497, '2021-07-20 11:11:19.001463', '89', 'Smirnoff red 1000ml ---> Sexy monica : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(498, '2021-07-20 11:11:44.423557', '90', 'Lemon Juice 750ml ---> Sexy monica : size = 15', 1, '[{\"added\": {}}]', 24, 1),
(499, '2021-07-20 11:12:09.285804', '91', 'Sprite ---> Sexy monica : size = 1', 1, '[{\"added\": {}}]', 24, 1),
(500, '2021-07-20 11:41:03.850361', '92', 'Smirnoff red 1000ml ---> Sex on the beach : size = 50', 1, '[{\"added\": {}}]', 24, 1),
(501, '2021-07-20 11:42:22.471803', '93', 'Bacardi Superior 1000ml ---> Pina coloda : size = 60', 1, '[{\"added\": {}}]', 24, 1),
(502, '2021-07-20 11:46:56.028261', '94', 'Sierra Gold 700ml ---> Blue margarita : size = 60', 1, '[{\"added\": {}}]', 24, 1),
(503, '2021-07-20 11:47:20.316372', '95', 'Lemon Juice 750ml ---> Blue margarita : size = 15', 1, '[{\"added\": {}}]', 24, 1),
(504, '2021-07-20 11:48:00.007185', '96', 'Cointreau 1000ml ---> Blue margarita : size = 20', 1, '[{\"added\": {}}]', 24, 1),
(505, '2021-07-20 11:49:08.436059', '97', 'Captain Morgan Spiced Gold 1000ml ---> Strawberry daiquiri : size = 60', 1, '[{\"added\": {}}]', 24, 1),
(506, '2021-07-20 11:49:43.048733', '98', 'Lemon Juice 750ml ---> Strawberry daiquiri : size = 15', 1, '[{\"added\": {}}]', 24, 1),
(507, '2021-07-20 11:50:25.811824', '99', 'Smirnoff red 1000ml ---> Bloody mary : size = 60', 1, '[{\"added\": {}}]', 24, 1),
(508, '2021-07-20 11:50:48.581276', '100', 'Lemon Juice 750ml ---> Bloody mary : size = 15', 1, '[{\"added\": {}}]', 24, 1),
(509, '2021-07-24 11:39:02.657705', '91', 'Sprite ---> Sexy monica : size = 1', 3, '', 24, 2),
(510, '2021-07-24 11:39:02.720105', '66', 'Soda ---> Sea Buckthorn Mojito : size = 1', 3, '', 24, 2),
(511, '2021-07-24 11:39:02.751305', '63', 'Soda ---> Blueberry Mojito : size = 1', 3, '', 24, 2),
(512, '2021-07-24 11:39:02.798105', '60', 'Soda ---> Kiwi mojito : size = 1', 3, '', 24, 2),
(513, '2021-07-24 11:39:02.829305', '57', 'Soda ---> Tesoro Special Mojito : size = 1', 3, '', 24, 2),
(514, '2021-07-24 11:39:02.876105', '54', 'Sprite ---> Green summer : size = 1', 3, '', 24, 2),
(515, '2021-07-24 11:39:02.907305', '51', 'Coca cola ---> Cuba Libra : size = 1', 3, '', 24, 2),
(516, '2021-07-24 11:39:02.969705', '48', 'Sprite ---> Adios mother  fucker : size = 1', 3, '', 24, 2),
(517, '2021-07-24 11:39:03.094506', '39', 'Coca cola ---> Tesoro Special Long Island iced tea : size = 1', 3, '', 24, 2),
(518, '2021-07-24 11:41:20.021328', '2', 'tsaska', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 4, 1),
(519, '2021-07-24 11:42:52.966867', '1', 'Sprite ---> Sexy monica : size = 1', 1, '[{\"added\": {}}]', 48, 2),
(520, '2021-07-24 11:43:29.421260', '2', 'Sprite ---> Green summer : size = 1', 1, '[{\"added\": {}}]', 48, 2),
(521, '2021-07-24 11:43:54.661480', '3', 'Sprite ---> Adios mother  fucker : size = 1', 1, '[{\"added\": {}}]', 48, 2),
(522, '2021-07-24 11:43:55.163884', '4', 'Sprite ---> Adios mother  fucker : size = 1', 1, '[{\"added\": {}}]', 48, 2),
(523, '2021-07-24 11:44:25.188210', '5', 'Soda ---> Blueberry Mojito : size = 1', 1, '[{\"added\": {}}]', 48, 2),
(524, '2021-07-24 11:44:38.772581', '6', 'Soda ---> Sea Buckthorn Mojito : size = 1', 1, '[{\"added\": {}}]', 48, 2),
(525, '2021-07-24 11:46:05.074811', '7', 'Soda ---> Kiwi mojito : size = 1', 1, '[{\"added\": {}}]', 48, 2),
(526, '2021-07-24 11:46:47.839052', '8', 'Soda ---> Tesoro Special Mojito : size = 1', 1, '[{\"added\": {}}]', 48, 2),
(527, '2021-07-24 11:47:24.667478', '9', 'Coca cola ---> Cuba Libra : size = 1', 1, '[{\"added\": {}}]', 48, 2),
(528, '2021-07-24 11:48:04.614763', '10', 'Coca cola ---> Tesoro Special Long Island iced tea : size = 1', 1, '[{\"added\": {}}]', 48, 2),
(529, '2021-07-24 12:01:22.253134', '227', 'Мояа семьяа 1000ml', 1, '[{\"added\": {}}]', 28, 1),
(530, '2021-07-24 12:01:37.415676', '227', 'Мояа семьяа 1000ml', 2, '[{\"changed\": {\"fields\": [\"Categories\"]}}]', 28, 1),
(531, '2021-07-24 12:22:38.784385', '228', 'Louis Eschenauer White 125ml', 1, '[{\"added\": {}}]', 28, 1),
(532, '2021-07-24 12:23:53.286954', '229', 'Louis Eschenauer Red 125ml', 1, '[{\"added\": {}}]', 28, 1),
(533, '2021-07-24 12:25:09.891953', '187', 'Domaine La Baume Red', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Description\", \"Gramm\"]}}]', 28, 1),
(534, '2021-07-24 12:25:45.011989', '189', 'Domaine La Baume 125ml', 2, '[{\"changed\": {\"fields\": [\"Categories\"]}}]', 28, 1),
(535, '2021-07-24 12:27:56.125472', '189', 'Domaine La Baume Red 125ml', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Gramm\"]}}]', 28, 1),
(536, '2021-07-24 12:29:36.332648', '230', 'Domaine La Baume White 125ml', 1, '[{\"added\": {}}]', 28, 1),
(537, '2021-07-24 12:30:45.490029', '185', 'Domaine Le Baume', 3, '', 28, 1),
(538, '2021-07-24 12:31:39.602081', '184', 'Domaine La Baume White 750ml', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Gramm\"]}}]', 28, 1),
(539, '2021-07-24 12:31:58.842360', '187', 'Domaine La Baume Red 750ml', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(540, '2021-07-24 12:32:31.470047', '187', 'Domaine La Baume Red 750ml', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 28, 1),
(541, '2021-07-24 12:33:52.455199', '188', 'Altos del Plata Red 125ml', 2, '[{\"changed\": {\"fields\": [\"Description\", \"Gramm\"]}}]', 28, 1),
(542, '2021-07-24 12:34:12.436703', '183', 'Altos del Plata White 750ml', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Description\", \"Gramm\"]}}]', 28, 1),
(543, '2021-07-24 12:34:45.152946', '186', 'Altos del Plata Red 750ml', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Gramm\"]}}]', 28, 1),
(544, '2021-07-24 12:37:36.008797', '231', 'Altos del Plata White 125ml', 1, '[{\"added\": {}}]', 28, 1),
(545, '2021-07-24 12:38:58.081872', '35', 'Altos del Plata Red 750ml', 2, '[]', 23, 1),
(546, '2021-07-24 12:39:10.392739', '35', 'Altos del Plata Red 750ml', 2, '[]', 23, 1),
(547, '2021-07-24 12:39:35.527967', '48', 'Altos del Plata White 750ml', 1, '[{\"added\": {}}]', 23, 1),
(548, '2021-07-24 12:40:22.654404', '36', 'Domaine La Baume Red 750ml', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]', 23, 1),
(549, '2021-07-24 12:41:14.271801', '49', 'Domaine La Baume White 750ml', 1, '[{\"added\": {}}]', 23, 1),
(550, '2021-07-24 12:43:14.540336', '50', 'Louis Eschenauer Red 750ml', 1, '[{\"added\": {}}]', 23, 1),
(551, '2021-07-24 12:44:52.931307', '51', 'Louis Eschenauer White 750ml', 1, '[{\"added\": {}}]', 23, 1),
(552, '2021-07-24 12:46:10.627675', '101', 'Altos del Plata Red 750ml ---> Altos del Plata Red 125ml : size = 125', 1, '[{\"added\": {}}]', 24, 1),
(553, '2021-07-24 12:46:40.924313', '102', 'Altos del Plata White 750ml ---> Altos del Plata White 125ml : size = 125', 1, '[{\"added\": {}}]', 24, 1),
(554, '2021-07-24 12:47:04.227342', '103', 'Louis Eschenauer White 750ml ---> Louis Eschenauer White 125ml : size = 125', 1, '[{\"added\": {}}]', 24, 1),
(555, '2021-07-24 12:47:21.185961', '104', 'Louis Eschenauer Red 750ml ---> Louis Eschenauer Red 125ml : size = 125', 1, '[{\"added\": {}}]', 24, 1),
(556, '2021-07-24 12:47:44.634769', '105', 'Domaine La Baume White 750ml ---> Domaine La Baume White 125ml : size = 125', 1, '[{\"added\": {}}]', 24, 1),
(557, '2021-07-24 12:48:02.632952', '106', 'Domaine La Baume Red 750ml ---> Domaine La Baume Red 125ml : size = 125', 1, '[{\"added\": {}}]', 24, 1),
(558, '2021-07-25 03:14:48.654375', '90', 'Lipton tea - Гүцтэй', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]', 28, 1),
(559, '2021-07-25 03:15:57.160419', '232', 'Lipton tea - Аяга', 1, '[{\"added\": {}}]', 28, 1),
(560, '2021-07-25 03:17:25.249385', '233', 'Сүүтэй цай - Аяга', 1, '[{\"added\": {}}]', 28, 1),
(561, '2021-07-25 03:17:49.942463', '234', 'Сүүтэй цай - Халуун сав', 1, '[{\"added\": {}}]', 28, 1),
(562, '2021-07-25 03:18:19.718991', '18', 'Teas', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 27, 1),
(563, '2021-07-25 03:18:35.269348', '23', 'Beer', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 27, 1),
(564, '2021-07-25 03:19:07.592146', '39', 'Бусад', 1, '[{\"added\": {}}]', 27, 1),
(565, '2021-07-25 03:20:02.318724', '40', 'Пакет', 1, '[{\"added\": {}}]', 27, 1),
(566, '2021-07-25 03:20:12.638555', '40', 'Пакет', 3, '', 27, 1),
(567, '2021-07-25 03:20:41.271186', '235', 'Пакет сав', 1, '[{\"added\": {}}]', 28, 1),
(568, '2021-07-25 03:22:55.418500', '236', 'Хүргэлт үйлчилгээ', 1, '[{\"added\": {}}]', 28, 1),
(569, '2021-07-26 06:01:01.228604', '2', 'tsaska', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 4, 1),
(570, '2021-07-26 06:01:15.268235', '5', 'tuul', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 4, 1),
(571, '2021-07-26 06:01:25.017606', '5', 'tuul', 3, '', 4, 1),
(572, '2021-07-26 12:55:23.849194', '6', 'batbayr', 1, '[{\"added\": {}}]', 4, 2),
(573, '2021-07-26 12:56:31.195512', '6', 'batbayr', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 2),
(574, '2021-07-26 12:56:50.227546', '6', 'batbayr', 2, '[]', 4, 2),
(575, '2021-07-26 12:57:37.261628', '6', 'batbayr', 2, '[]', 4, 2),
(576, '2021-07-26 12:58:51.113158', '7', 'naraa', 1, '[{\"added\": {}}]', 4, 2),
(577, '2021-07-26 12:59:55.790872', '7', 'naraa', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 2),
(578, '2021-07-26 13:00:54.727775', '8', 'eegii', 1, '[{\"added\": {}}]', 4, 2),
(579, '2021-07-26 13:01:51.277875', '8', 'eegii', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 2),
(580, '2021-07-26 13:45:04.652246', '90', 'Lipton tea - Гүцтэй', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(581, '2021-07-26 13:48:30.681808', '90', 'Lipton tea - Гүцтэй', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(582, '2021-07-26 14:07:02.722390', '237', 'Vip tax', 1, '[{\"added\": {}}]', 28, 2),
(583, '2021-07-26 14:08:43.014126', '238', 'alcohol tax', 1, '[{\"added\": {}}]', 28, 2),
(584, '2021-07-26 14:11:55.883157', '239', 'bread', 1, '[{\"added\": {}}]', 28, 2),
(585, '2021-07-27 05:11:07.147375', '6', 'batbayr', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(586, '2021-07-27 05:11:28.276584', '8', 'eegii', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(587, '2021-07-27 05:12:04.907679', '7', 'naraa', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(588, '2021-07-27 05:36:34.520736', '240', 'Juice mango 250ml', 1, '[{\"added\": {}}]', 28, 1),
(589, '2021-07-27 05:37:15.497080', '241', 'Juice apple 250ml', 1, '[{\"added\": {}}]', 28, 1),
(590, '2021-07-27 05:37:50.212065', '242', 'Juice orange 250ml', 1, '[{\"added\": {}}]', 28, 1),
(591, '2021-07-27 05:38:44.676181', '243', 'Juice cranberry 250ml', 1, '[{\"added\": {}}]', 28, 1),
(592, '2021-07-27 05:40:10.830108', '52', 'Juice apple 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(593, '2021-07-27 05:40:37.466632', '53', 'Juice mango 1500ml', 1, '[{\"added\": {}}]', 23, 1),
(594, '2021-07-27 05:40:58.598840', '54', 'Juice cranberry 1000ml', 1, '[{\"added\": {}}]', 23, 1),
(595, '2021-07-27 05:41:26.511437', '55', 'Juice orange 1500ml', 1, '[{\"added\": {}}]', 23, 1),
(596, '2021-07-27 05:44:07.434641', '89', 'Juice Моя Семья 250ml', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Description\", \"Is ingrediented\", \"Gramm\"]}}]', 28, 1),
(597, '2021-07-27 05:45:41.538024', '56', 'Juice Моя Семья 950ml', 1, '[{\"added\": {}}]', 23, 1),
(598, '2021-07-27 05:46:39.465337', '107', 'Juice mango 1500ml ---> Juice mango 250ml : size = 250', 1, '[{\"added\": {}}]', 24, 1),
(599, '2021-07-27 05:46:58.608432', '108', 'Juice apple 1000ml ---> Juice apple 250ml : size = 250', 1, '[{\"added\": {}}]', 24, 1),
(600, '2021-07-27 05:47:24.453910', '109', 'Juice orange 1500ml ---> Juice orange 250ml : size = 250', 1, '[{\"added\": {}}]', 24, 1),
(601, '2021-07-27 05:47:59.296903', '110', 'Juice cranberry 1000ml ---> Juice cranberry 250ml : size = 250', 1, '[{\"added\": {}}]', 24, 1),
(602, '2021-07-27 05:50:34.681791', '111', 'Juice Моя Семья 950ml ---> Juice Моя Семья 250ml : size = 250', 1, '[{\"added\": {}}]', 24, 1),
(603, '2021-07-27 05:57:45.053406', '112', 'Juice Моя Семья 950ml ---> Мояа семьяа 1000ml : size = 950', 1, '[{\"added\": {}}]', 24, 1),
(604, '2021-07-27 05:58:16.913229', '112', 'Juice Моя Семья 950ml ---> Мояа семьяа 1000ml : size = 950', 3, '', 24, 1),
(605, '2021-07-27 07:44:56.958247', '2', 'tsaska', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 4, 1),
(606, '2021-07-27 13:53:39.222950', '244', 'тактуритан 1 хүн', 1, '[{\"added\": {}}]', 28, 2),
(607, '2021-07-28 03:50:16.004688', '245', 'Бин', 1, '[{\"added\": {}}]', 28, 2),
(608, '2021-07-28 03:51:20.089601', '234', 'Сүүтэй цай - Халуун сав', 2, '[{\"changed\": {\"fields\": [\"Division\"]}}]', 28, 2),
(609, '2021-07-28 03:51:59.231070', '244', 'Тактуритан 1 хүн', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Is ingrediented\"]}}]', 28, 2),
(610, '2021-07-28 03:52:52.412563', '244', 'Тактуритан 1 хүн', 2, '[{\"changed\": {\"fields\": [\"Is ingrediented\"]}}]', 28, 2),
(611, '2021-07-28 03:53:10.274595', '234', 'Сүүтэй цай - Халуун сав', 2, '[{\"changed\": {\"fields\": [\"Is ingrediented\"]}}]', 28, 2),
(612, '2021-07-28 03:53:36.872641', '239', 'bread', 2, '[{\"changed\": {\"fields\": [\"Is ingrediented\"]}}]', 28, 2),
(613, '2021-07-28 03:53:44.298254', '239', 'bread', 2, '[{\"changed\": {\"fields\": [\"Is ingrediented\"]}}]', 28, 2),
(614, '2021-07-28 03:54:08.952707', '233', 'Сүүтэй цай - Аяга', 2, '[{\"changed\": {\"fields\": [\"Is ingrediented\"]}}]', 28, 2),
(615, '2021-07-28 03:54:22.977132', '232', 'Lipton tea - Аяга', 2, '[{\"changed\": {\"fields\": [\"Is ingrediented\"]}}]', 28, 2),
(616, '2021-07-28 03:55:07.081819', '192', 'Chicken breast', 2, '[{\"changed\": {\"fields\": [\"Is ingrediented\"]}}]', 28, 2),
(617, '2021-07-28 03:55:28.750257', '191', 'Rib eye steak', 2, '[{\"changed\": {\"fields\": [\"Is ingrediented\"]}}]', 28, 2),
(618, '2021-07-28 03:55:36.466671', '245', 'Бин', 2, '[{\"changed\": {\"fields\": [\"Is ingrediented\"]}}]', 28, 2),
(619, '2021-07-29 05:23:01.221443', '241', 'Juice apple 250ml', 2, '[{\"changed\": {\"fields\": [\"Is ingrediented\"]}}]', 28, 2),
(620, '2021-07-29 05:31:09.663637', '89', 'Juice Моя Семья 250ml', 2, '[{\"changed\": {\"fields\": [\"Is ingrediented\"]}}]', 28, 2),
(621, '2021-07-29 05:32:06.039862', '89', 'Juice Моя Семья 250ml', 2, '[{\"changed\": {\"fields\": [\"Is ingrediented\"]}}]', 28, 2),
(622, '2021-07-29 05:34:05.846715', '41', 'Coffee', 1, '[{\"added\": {}}]', 27, 2),
(623, '2021-07-29 05:35:18.445867', '246', 'Americano', 1, '[{\"added\": {}}]', 28, 2),
(624, '2021-07-29 05:36:32.235087', '247', 'Cappuccino', 1, '[{\"added\": {}}]', 28, 2),
(625, '2021-07-29 05:51:15.253593', '248', 'Cafe latte', 1, '[{\"added\": {}}]', 28, 2),
(626, '2021-07-29 05:51:45.657332', '249', 'Vanilla latte', 1, '[{\"added\": {}}]', 28, 2),
(627, '2021-07-29 14:11:47.375963', '204', 'Green summer', 2, '[{\"changed\": {\"fields\": [\"Is ingrediented\"]}}]', 28, 2),
(628, '2021-07-29 14:14:45.824676', '204', 'Green summer', 2, '[{\"changed\": {\"fields\": [\"Is ingrediented\"]}}]', 28, 2),
(629, '2021-07-29 14:15:45.182781', '53', 'Cucumber Syrop 700ml ---> Green summer : size = 15', 3, '', 24, 2),
(630, '2021-07-29 14:23:04.483552', '22', 'Sierra Gold 700ml ---> Sierra Gold 50ml : size = 50', 2, '[{\"changed\": {\"fields\": [\"\\u0411\\u04af\\u0442\\u044d\\u044d\\u0433\\u0434\\u044d\\u0445\\u04af\\u04af\\u043d\\u0434 \\u043e\\u0440\\u043e\\u0445 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\"]}}]', 24, 2),
(631, '2021-08-07 08:24:51.569295', '250', 'Сүү', 1, '[{\"added\": {}}]', 28, 2),
(632, '2021-08-07 13:41:39.498275', '251', 'Peanuts', 1, '[{\"added\": {}}]', 28, 2),
(633, '2021-08-07 13:44:03.798429', '46', 'Triple sec Syrop 700ml ---> Adios mother  fucker : size = 15', 3, '', 24, 2),
(634, '2021-08-07 13:44:38.500412', '47', 'Blue Curacao syrop 700ml ---> Adios mother  fucker : size = 15', 3, '', 24, 2),
(635, '2021-08-09 04:09:34.085631', '9', 'Urnaa', 1, '[{\"added\": {}}]', 4, 1),
(636, '2021-08-09 04:10:18.858710', '9', 'Urnaa', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]', 4, 1),
(637, '2021-08-10 05:16:22.772002', '252', 'Domaine La Baume Rose', 1, '[{\"added\": {}}]', 28, 2),
(638, '2021-08-10 05:17:48.306952', '253', 'Remy Martin', 1, '[{\"added\": {}}]', 28, 2),
(639, '2021-08-10 05:19:12.016699', '254', 'JP chenet XO 0.7', 1, '[{\"added\": {}}]', 28, 2),
(640, '2021-08-10 05:21:42.338563', '253', 'Remy Martin', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(641, '2021-08-10 05:22:46.719876', '255', 'Feeneys 1L', 1, '[{\"added\": {}}]', 28, 2),
(642, '2021-08-10 05:25:29.131761', '256', 'Hans Bear Riesling', 1, '[{\"added\": {}}]', 28, 2),
(643, '2021-08-10 05:30:36.421101', '252', 'Domaine La Baume Rose', 2, '[{\"changed\": {\"fields\": [\"Division\"]}}]', 28, 2),
(644, '2021-08-10 05:30:47.653121', '253', 'Remy Martin', 2, '[{\"changed\": {\"fields\": [\"Division\"]}}]', 28, 2),
(645, '2021-08-10 05:30:56.794737', '254', 'JP chenet XO 0.7', 2, '[{\"changed\": {\"fields\": [\"Division\"]}}]', 28, 2),
(646, '2021-08-10 05:31:05.421552', '255', 'Feeneys 1L', 2, '[{\"changed\": {\"fields\": [\"Division\"]}}]', 28, 2),
(647, '2021-08-10 05:31:13.814367', '256', 'Hans Bear Riesling', 2, '[{\"changed\": {\"fields\": [\"Division\"]}}]', 28, 2),
(648, '2021-08-10 05:39:44.804369', '256', 'Hans Bear Riesling', 2, '[{\"changed\": {\"fields\": [\"Is ingrediented\"]}}]', 28, 1),
(649, '2021-08-10 05:40:28.103814', '255', 'Feeneys 1L', 2, '[{\"changed\": {\"fields\": [\"Is ingrediented\"]}}]', 28, 2),
(650, '2021-08-10 05:40:35.534239', '254', 'JP chenet XO 0.7', 2, '[{\"changed\": {\"fields\": [\"Is ingrediented\"]}}]', 28, 2),
(651, '2021-08-10 05:40:43.518696', '253', 'Remy Martin', 2, '[{\"changed\": {\"fields\": [\"Is ingrediented\"]}}]', 28, 2),
(652, '2021-08-10 05:41:00.664677', '252', 'Domaine La Baume Rose', 2, '[{\"changed\": {\"fields\": [\"Is ingrediented\"]}}]', 28, 2),
(653, '2021-08-10 14:52:53.067562', '10', 'unuruu', 1, '[{\"added\": {}}]', 4, 2),
(654, '2021-08-10 14:53:19.090050', '10', 'unuruu', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]', 4, 2),
(655, '2021-08-10 14:53:35.885426', '11', 'zulaa', 1, '[{\"added\": {}}]', 4, 2),
(656, '2021-08-10 14:54:01.001470', '11', 'zulaa', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]', 4, 2),
(657, '2021-08-10 14:54:15.041495', '12', 'baatraa', 1, '[{\"added\": {}}]', 4, 2),
(658, '2021-08-10 14:54:33.353393', '12', 'baatraa', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]', 4, 2),
(659, '2021-08-10 14:54:48.127238', '13', 'orhoo', 1, '[{\"added\": {}}]', 4, 2),
(660, '2021-08-10 14:55:06.894312', '13', 'orhoo', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]', 4, 2),
(661, '2021-08-10 14:55:22.488031', '14', 'oyunchimeg', 1, '[{\"added\": {}}]', 4, 2),
(662, '2021-08-10 14:55:41.886588', '14', 'oyunchimeg', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]', 4, 2),
(663, '2021-08-10 14:56:11.369274', '15', 'bolor-erdene', 1, '[{\"added\": {}}]', 4, 2),
(664, '2021-08-10 14:56:57.559353', '15', 'bolor-erdene', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]', 4, 2),
(665, '2021-08-11 01:52:41.687053', '257', 'Cola Zero', 1, '[{\"added\": {}}]', 28, 2),
(666, '2021-08-12 04:25:59.275590', '248', 'Cafe latte', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(667, '2021-08-12 04:26:19.711626', '249', 'Vanilla latte', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(668, '2021-08-12 04:26:41.224064', '246', 'Americano', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(669, '2021-08-12 04:27:08.633312', '247', 'Cappuccino', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(670, '2021-12-07 14:05:24.070652', '257', 'Cola Zero', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(671, '2022-01-17 04:51:55.245235', '257', 'Cola Zero', 2, '[]', 28, 2),
(672, '2022-01-17 04:53:54.489055', '256', 'Hans Bear Riesling', 3, '', 28, 2),
(673, '2022-01-17 04:54:10.777987', '255', 'Feeneys 1L', 3, '', 28, 2),
(674, '2022-01-17 04:54:19.435482', '254', 'JP chenet XO 0.7', 3, '', 28, 2),
(675, '2022-01-18 04:08:45.842518', '253', 'Remy Martin', 2, '[]', 28, 2),
(676, '2022-01-18 04:08:47.246520', '253', 'Remy Martin', 2, '[]', 28, 2),
(677, '2022-01-19 02:14:44.040460', '253', 'Remy Martin V.S.O.P', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Cost\"]}}]', 28, 2),
(678, '2022-01-19 02:24:07.925712', '253', 'Remy Martin V.S.O.P (700ml)', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 2),
(679, '2022-01-19 02:24:38.650470', '251', 'Peanuts', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(680, '2022-01-19 02:29:58.684775', '244', 'Тактуритан 1 хүн', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(681, '2022-01-19 02:33:04.478402', '234', 'Сүүтэй цай - Халуун сав', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(682, '2022-01-19 02:40:38.288358', '221', 'Strawberry daiquiri', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(683, '2022-01-19 02:41:09.249129', '220', 'Blue margarita', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(684, '2022-01-19 02:42:08.707530', '218', 'Sex on the beach', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(685, '2022-01-19 02:42:31.851853', '217', 'Sexy monica', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(686, '2022-01-19 02:44:58.284229', '215', 'Martini', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(687, '2022-01-19 02:45:33.744257', '215', 'Martini', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(688, '2022-01-19 02:51:05.787249', '204', 'Green summer', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(689, '2022-01-19 02:51:28.053522', '202', 'Adios mother  fucker', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(690, '2022-01-19 02:57:37.643662', '193', 'Fanta grape', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(691, '2022-01-19 02:58:27.283501', '192', 'Chicken breast', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(692, '2022-01-19 02:58:51.480885', '253', 'Remy Martin V.S.O.P 700ml', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 2),
(693, '2022-01-19 03:18:20.162730', '186', 'Altos del Plata Red 750ml', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(694, '2022-01-20 05:25:33.998752', '227', 'Мояа семьяа 1000ml', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(695, '2022-01-20 05:25:35.473837', '227', 'Мояа семьяа 1000ml', 2, '[]', 28, 2),
(696, '2022-01-20 05:26:21.900492', '1', '201 өрөө ХОНОГ', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 2),
(697, '2022-01-24 03:49:45.487756', '258', 'Fruit combo tea', 1, '[{\"added\": {}}]', 28, 2),
(698, '2022-11-06 05:48:28.634503', '1169', '1169', 2, '[]', 21, 1),
(699, '2022-11-07 04:15:53.491234', '30', 'Havirganii mahan TS (2-3)', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(700, '2022-11-07 04:16:28.286885', '31', 'Havirganii mahan TS (4-5)', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(701, '2022-11-07 04:16:48.448226', '32', 'Mongol mahan TS (2-3)', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(702, '2022-11-07 04:16:58.552273', '33', 'Mongol mahan TS (4-5)', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(703, '2022-11-07 04:18:26.376659', '33', 'Монгол махан цуглуулга (4-5)', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(704, '2022-11-07 04:18:39.501796', '32', 'Монгол махан цуглуулга (2-3)', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(705, '2022-11-07 04:18:52.462618', '31', 'Хавирганы махан цуглуулга (4-5)', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(706, '2022-11-07 04:19:03.993764', '30', 'Хавирганы махан цуглуулга (2-3)', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 28, 1),
(707, '2022-11-07 05:09:53.752560', '80', 'Будаа', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(708, '2022-11-07 05:10:02.886896', '79', 'Шарсан төмс', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(709, '2022-11-07 05:10:12.847832', '78', 'Tbone steak', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(710, '2022-11-07 05:10:26.134762', '77', 'Үхрийн шарсан хавирга', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(711, '2022-11-07 05:10:38.046098', '76', 'Хонины шарсан хавирга', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(712, '2022-11-07 05:10:46.232587', '75', 'Бууз багц', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(713, '2022-11-07 05:11:23.313566', '74', 'Хуушуур багц', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(714, '2022-11-07 05:11:33.651954', '73', 'Шаржигнуур тахиа', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(715, '2022-11-07 05:11:40.682041', '72', 'Цуйван', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(716, '2022-11-07 05:11:49.611534', '71', 'Tesoro нэрийн стэйк', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(717, '2022-11-07 05:11:58.407014', '70', 'Кето пицца', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(718, '2022-11-07 05:12:34.872300', '57', 'Бууцайтай үхрийн хэлэн салат', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(719, '2022-11-07 05:12:45.444438', '58', 'Swiss bowl salat', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(720, '2022-11-07 05:13:03.354991', '59', 'Броколи зутан шөл', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(721, '2022-11-07 05:13:13.998935', '60', 'Хулууны зутан шөл', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(722, '2022-11-07 05:13:21.229827', '61', 'Бантан', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(723, '2022-11-07 05:13:31.150195', '62', 'Банштай цай', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(724, '2022-11-07 05:13:40.723729', '63', 'Бинтэй хар шөл', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(725, '2022-11-07 05:14:10.181578', '64', 'Карборанара паста', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(726, '2022-11-07 05:14:21.925357', '65', 'Бологнайз паста', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(727, '2022-11-07 05:14:37.467308', '66', 'Mushroom (taglatil) pasta', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(728, '2022-11-07 05:14:57.616889', '67', 'Салям пицца', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(729, '2022-11-07 05:15:06.712987', '68', 'Хавай пицца', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(730, '2022-11-07 05:15:15.465698', '69', 'Холимог пицца', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(731, '2022-11-07 05:15:47.350998', '45', 'Калбитан 2хүн', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(732, '2022-11-07 05:16:00.384527', '46', 'Бүлгүгги 2хүн', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(733, '2022-11-07 05:16:12.698097', '47', 'Кимчижигэ', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(734, '2022-11-07 05:16:24.661715', '48', 'Тэнжанжигэ', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(735, '2022-11-07 05:17:04.932709', '49', 'Миёогтой шөл', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Print name\"]}}]', 28, 1),
(736, '2022-11-07 05:17:16.658556', '50', 'Бүдэжигэ 2хүн', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(737, '2022-11-07 05:17:31.500998', '51', 'Тагтуритан 2хүн', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(738, '2022-11-07 05:17:38.856319', '52', 'Гоймон', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(739, '2022-11-07 05:17:46.133408', '53', 'Кимбаб', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(740, '2022-11-07 05:17:54.538517', '54', 'Догбугги', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(741, '2022-11-07 05:18:08.851067', '55', 'Цезарь салат', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(742, '2022-11-07 05:18:20.263405', '55', 'Цезарь салат', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(743, '2022-11-07 05:19:00.490715', '30', 'Хавирганы махан цуглуулга (2-3)', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(744, '2022-11-07 05:19:19.254331', '31', 'Хавирганы махан цуглуулга (4-5)', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(745, '2022-11-07 05:19:34.802503', '32', 'Монгол махан цуглуулга (2-3)', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(746, '2022-11-07 05:19:44.175646', '33', 'Монгол махан цуглуулга (4-5)', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(747, '2022-11-07 05:19:58.939799', '34', 'Маханд дурлагсад цуглуулга 4-5', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(748, '2022-11-07 05:20:14.317613', '35', 'Шорлогны цуглуулга 2-3', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(749, '2022-11-07 05:20:25.275415', '36', 'Шорлогны цуглуулга 4-5', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(750, '2022-11-07 05:20:51.544463', '37', 'Тахианы махан цуглуулга 2-3', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(751, '2022-11-07 05:21:01.681451', '38', 'Тахианы махан цуглуулга 4-5', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(752, '2022-11-07 05:21:41.584368', '39', 'Солонгос хоолны цуглуулга 2-3', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(753, '2022-11-07 05:21:50.190502', '40', 'Солонгос хоолны цуглуулга 4-5', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(754, '2022-11-07 05:22:09.028905', '41', 'Жэюүгбуггим 2хүн', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(755, '2022-11-07 05:22:25.351350', '42', 'Кимчи сангёбсал 2хүн', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(756, '2022-11-07 05:22:35.521871', '43', 'Калбижим 2хүн', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(757, '2022-11-07 05:22:43.080773', '44', 'Калбитан', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(758, '2022-11-07 05:23:54.833566', '37', 'Тахианы махан цуглуулга 2-3', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(759, '2022-11-07 05:42:57.912166', '1', 'Configuration_value object (1)', 2, '[{\"changed\": {\"fields\": [\"Hotel deadline time of dayService\", \"Hotel start time of timeService\", \"Hotel deadline time of timeService\", \"Hotel minimum time of timeService\", \"Hotel must leave time\", \"Kitchen bill number\"]}}]', 36, 1),
(760, '2022-11-07 05:54:24.882715', '234', 'Сүүтэй цай - Халуун сав', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(761, '2022-11-07 05:54:37.256534', '233', 'Сүүтэй цай - Аяга', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(762, '2022-11-07 05:55:00.870977', '244', 'Тактуритан 1 хүн', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(763, '2022-11-07 05:55:08.806116', '245', 'Бин', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(764, '2022-11-07 05:55:16.819022', '235', 'Пакет сав', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(765, '2022-11-07 05:56:06.702073', '235', 'Пакет сав', 2, '[{\"changed\": {\"fields\": [\"Print name\"]}}]', 28, 1),
(766, '2023-02-08 09:05:06.965355', '3', '3', 3, '', 15, 1),
(767, '2023-02-08 09:10:10.399706', '81', 'Bonaqua 500ml', 2, '[{\"changed\": {\"fields\": [\"Cost\"]}}]', 28, 1),
(768, '2023-02-09 12:40:43.019853', '19', '19', 3, '', 15, 1),
(769, '2023-02-09 12:40:43.026828', '18', '18', 3, '', 15, 1),
(770, '2023-02-09 12:40:43.028985', '17', '17', 3, '', 15, 1),
(771, '2023-02-09 12:40:43.031185', '16', '16', 3, '', 15, 1),
(772, '2023-02-09 12:40:43.032186', '15', '15', 3, '', 15, 1),
(773, '2023-02-09 13:21:16.835735', '2', 'tsaska', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(774, '2023-02-09 13:21:38.754718', '2', 'tsaska', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(46, 'authtoken', 'token'),
(47, 'authtoken', 'tokenproxy'),
(5, 'contenttypes', 'contenttype'),
(7, 'financial_app', 'budget'),
(8, 'financial_app', 'budget_type'),
(9, 'financial_app', 'currency'),
(10, 'financial_app', 'investment'),
(11, 'financial_app', 'loan'),
(12, 'financial_app', 'money_transfer'),
(14, 'financial_app', 'money_transfer_type'),
(13, 'financial_app', 'wallet'),
(43, 'hotel', 'hotel_client_item'),
(45, 'hotel', 'hotel_client_item_eelj'),
(44, 'hotel', 'hotel_client_log'),
(42, 'notification', 'notification'),
(15, 'payment_app', 'bill'),
(16, 'payment_app', 'order'),
(21, 'payment_app', 'order_detial'),
(20, 'payment_app', 'order_payments'),
(17, 'payment_app', 'payment'),
(19, 'payment_app', 'payment_bills'),
(18, 'payment_app', 'pos_account_consolidation'),
(22, 'product_app', 'basic_asset'),
(35, 'product_app', 'basic_asset_count'),
(34, 'product_app', 'broken_item'),
(23, 'product_app', 'commodity'),
(33, 'product_app', 'commodity_category'),
(24, 'product_app', 'ingredient'),
(48, 'product_app', 'ingredient_product'),
(32, 'product_app', 'item_balance'),
(31, 'product_app', 'item_balance_log'),
(30, 'product_app', 'item_transfer'),
(29, 'product_app', 'item_transfer_type'),
(28, 'product_app', 'product'),
(27, 'product_app', 'product_category'),
(26, 'product_app', 'size_type'),
(25, 'product_app', 'store'),
(6, 'sessions', 'session'),
(41, 'structure_app', 'client'),
(36, 'structure_app', 'configuration_value'),
(39, 'structure_app', 'customer'),
(37, 'structure_app', 'division'),
(38, 'structure_app', 'shift_work'),
(40, 'structure_app', 'user_profile');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-06-20 06:41:37.777435'),
(2, 'auth', '0001_initial', '2020-06-20 06:41:37.902446'),
(3, 'admin', '0001_initial', '2020-06-20 06:41:38.277474'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-06-20 06:41:38.591058'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-06-20 06:41:38.606677'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-06-20 06:41:38.669178'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-06-20 06:41:38.700447'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-06-20 06:41:38.747299'),
(9, 'auth', '0004_alter_user_username_opts', '2020-06-20 06:41:38.762953'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-06-20 06:41:38.794205'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-06-20 06:41:38.809814'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-06-20 06:41:38.825430'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-06-20 06:41:38.841056'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-06-20 06:41:38.856683'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-06-20 06:41:38.903561'),
(16, 'auth', '0011_update_proxy_permissions', '2020-06-20 06:41:38.903561'),
(17, 'authtoken', '0001_initial', '2020-06-20 06:41:38.950451'),
(18, 'authtoken', '0002_auto_20160226_1747', '2020-06-20 06:41:39.059833'),
(19, 'structure_app', '0001_initial', '2020-06-20 06:41:39.385079'),
(20, 'financial_app', '0001_initial', '2020-06-20 06:41:40.228893'),
(21, 'payment_app', '0001_initial', '2020-06-20 06:41:41.198632'),
(22, 'financial_app', '0002_auto_20200620_1435', '2020-06-20 06:41:50.747263'),
(23, 'product_app', '0001_initial', '2020-06-20 06:41:53.698385'),
(24, 'hotel', '0001_initial', '2020-06-20 06:42:01.120452'),
(25, 'hotel', '0002_auto_20200620_1435', '2020-06-20 06:42:02.073825'),
(26, 'notification', '0001_initial', '2020-06-20 06:42:02.276967'),
(27, 'payment_app', '0002_auto_20200620_1435', '2020-06-20 06:42:06.429276'),
(28, 'sessions', '0001_initial', '2020-06-20 06:42:06.616807'),
(29, 'structure_app', '0002_auto_20200621_1448', '2020-06-21 06:49:04.925749'),
(30, 'hotel', '0003_auto_20200628_1400', '2020-06-28 06:00:08.499322'),
(31, 'hotel', '0004_auto_20200628_1404', '2020-06-28 06:04:07.079059'),
(32, 'hotel', '0005_auto_20200628_1439', '2020-06-28 06:40:49.251068'),
(33, 'payment_app', '0003_payment_division', '2020-07-04 03:01:05.559174'),
(34, 'payment_app', '0004_remove_payment_division', '2020-07-04 03:30:10.973308'),
(35, 'payment_app', '0005_payment_division', '2020-07-04 03:37:45.700332'),
(36, 'financial_app', '0003_auto_20200705_1639', '2020-07-05 08:39:31.378783'),
(37, 'auth', '0012_alter_user_first_name_max_length', '2021-05-29 02:33:21.856330'),
(38, 'authtoken', '0003_tokenproxy', '2021-05-29 02:33:21.918334'),
(39, 'structure_app', '0003_auto_20200802_1106', '2021-05-29 02:33:22.265354'),
(40, 'structure_app', '0004_auto_20200802_1111', '2021-05-29 02:33:22.506367'),
(41, 'structure_app', '0005_auto_20200802_1117', '2021-05-29 02:33:23.125403'),
(42, 'structure_app', '0006_auto_20200802_1118', '2021-05-29 02:33:23.514425'),
(43, 'structure_app', '0007_client_room_clean', '2021-05-29 02:33:23.965451'),
(44, 'structure_app', '0008_auto_20200802_1120', '2021-05-29 02:33:24.354473'),
(45, 'financial_app', '0004_auto_20200927_1156', '2021-05-29 02:33:28.325700'),
(46, 'product_app', '0002_auto_20200801_1153', '2021-05-29 02:33:28.936735'),
(47, 'payment_app', '0006_auto_20200923_2135', '2021-05-29 02:33:30.574829'),
(48, 'product_app', '0003_product_category_is_created', '2021-05-29 02:33:30.985852'),
(49, 'structure_app', '0009_auto_20210529_1033', '2021-05-29 02:33:31.643890'),
(50, 'product_app', '0004_alter_product_description', '2021-05-29 08:09:04.171986'),
(51, 'product_app', '0005_alter_product_category_description', '2021-05-29 08:11:39.234855'),
(52, 'structure_app', '0010_division_erembe', '2021-05-31 04:59:36.280184'),
(53, 'product_app', '0006_auto_20210626_1101', '2021-06-26 03:01:54.666038'),
(54, 'product_app', '0007_auto_20210629_1014', '2021-06-29 02:15:05.090114'),
(55, 'structure_app', '0011_auto_20210629_1014', '2021-06-29 02:15:05.214709'),
(56, 'structure_app', '0012_auto_20210629_1015', '2021-06-29 02:15:05.321423'),
(57, 'product_app', '0008_product_whole', '2021-07-02 09:27:46.476083'),
(58, 'product_app', '0009_remove_product_whole', '2021-07-02 09:29:25.644386'),
(59, 'product_app', '0010_auto_20210703_1037', '2021-07-03 02:37:52.816866'),
(60, 'product_app', '0011_auto_20210703_1210', '2021-07-03 04:10:45.017896'),
(61, 'financial_app', '0005_wallet_is_pos', '2021-07-04 04:50:24.326909'),
(62, 'product_app', '0012_auto_20210705_1244', '2021-07-05 04:44:38.783706'),
(63, 'payment_app', '0007_order_detial_finished', '2021-07-24 06:26:26.453803'),
(64, 'payment_app', '0008_order_detial_finished_at', '2021-07-24 06:26:27.239848'),
(65, 'product_app', '0013_auto_20210724_1022', '2021-07-24 06:26:40.598612'),
(66, 'product_app', '0014_remove_ingredient_product_size_type', '2021-07-24 06:26:41.926688'),
(67, 'financial_app', '0006_wallet_parent', '2021-07-25 13:05:04.687958'),
(68, 'payment_app', '0009_auto_20210725_1353', '2021-07-25 13:05:05.701960'),
(69, 'payment_app', '0010_order_discount_by', '2021-07-25 13:05:07.840164'),
(70, 'payment_app', '0011_order_detial_temp', '2021-08-30 09:05:45.071000'),
(71, 'payment_app', '0012_remove_order_detial_temp', '2021-08-30 09:05:45.390018'),
(72, 'payment_app', '0013_order_name', '2021-08-30 09:05:45.736038'),
(73, 'payment_app', '0014_remove_order_name', '2021-08-30 09:05:46.879103'),
(74, 'product_app', '0015_product_print_name', '2022-11-07 05:08:50.422225'),
(75, 'structure_app', '0013_configuration_value_kitchen_bill_number', '2022-11-07 05:27:27.877945'),
(76, 'structure_app', '0014_configuration_value_district_code', '2023-02-07 14:09:59.728857'),
(77, 'structure_app', '0015_alter_configuration_value_district_code', '2023-02-07 14:09:59.769599'),
(78, 'structure_app', '0016_auto_20230207_1908', '2023-02-07 14:09:59.818554'),
(79, 'payment_app', '0015_auto_20230207_1531', '2023-02-07 14:10:00.107365'),
(80, 'payment_app', '0016_auto_20230207_1848', '2023-02-07 14:10:01.337127'),
(81, 'payment_app', '0017_auto_20230207_1951', '2023-02-07 14:10:02.929392'),
(82, 'payment_app', '0018_auto_20230207_2025', '2023-02-07 14:10:03.074050'),
(83, 'payment_app', '0019_alter_bill_bill_type', '2023-02-08 04:39:48.566103'),
(84, 'payment_app', '0020_auto_20230208_1002', '2023-02-08 04:39:48.650634'),
(85, 'payment_app', '0021_alter_bill_status', '2023-02-09 04:40:38.113546'),
(86, 'payment_app', '0022_bill_printer', '2023-02-09 06:37:20.254923'),
(87, 'product_app', '0016_remove_product_print_name', '2023-02-09 09:35:34.331022'),
(88, 'payment_app', '0023_bill_customer_name', '2023-02-09 12:32:58.430962');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('03ke44i5713smny3czczwyrq5zjj7k0b', '.eJxVjEEOwiAQRe_C2hAGsQwu3fcMhBkGqZo2Ke3KeHfbpAvd_vfef6uY1qXGtckch6yuCtTpd6PETxl3kB9pvE-ap3GZB9K7og_adD9led0O9--gpla3uhRhCyQYOJ3pEjKEjlznbUYRdFCyY-sdG0Ykj-CFHHIIABsvxqjPFwPUOE4:1m8E7F:ZYfDmULmc2OVSFx7FWJ7dVRlTgu3W0rvtjBHBmmkHdE', '2021-08-10 03:50:49.806839'),
('0b13k66dsmae60vs85l30thtssqcg2f0', '.eJxVjDkOwjAQRe_iGlle4mUo6TmD5WUGB5AtxUmFuDtESgHtf-_9FwtxW2vYBi5hLuzMFDv9binmB7YdlHtst85zb-syJ74r_KCDX3vB5-Vw_w5qHPVbAykpnRVFe-dwQgQbKZFKQlPyEwI4a7UnD0oZMMKgF0gks_ZFos7s_QHUAzec:1mCwFP:Z67lKfruHhME75hovSTKf0sOMyhdM_NbwMd3vHMYkkI', '2021-08-23 03:46:43.568176'),
('14ld7rj8rapze2shhtrqx38nsepf1flc', '.eJxVjDkOwjAQRe_iGlle4mUo6TmD5WUGB5AtxUmFuDtESgHtf-_9FwtxW2vYBi5hLuzMFDv9binmB7YdlHtst85zb-syJ74r_KCDX3vB5-Vw_w5qHPVbAykpnRVFe-dwQgQbKZFKQlPyEwI4a7UnD0oZMMKgF0gks_ZFos7s_QHUAzec:1m7UlL:iMEP4xH65EKJm6w0mHZwz8NWKzZZNnZ0QFhH2D1zLTI', '2021-08-08 03:25:11.731112'),
('17tq67jiujxlhy1fcf0k0uo2zep3kk37', '.eJxVjEEOwiAQRe_C2hAGsQwu3fcMhBkGqZo2Ke3KeHfbpAvd_vfef6uY1qXGtckch6yuCtTpd6PETxl3kB9pvE-ap3GZB9K7og_adD9led0O9--gpla3uhRhCyQYOJ3pEjKEjlznbUYRdFCyY-sdG0Ykj-CFHHIIABsvxqjPFwPUOE4:1m8G5K:4VOoTdOeSirxkOtW69E_q5ZlMpyGsQVBCjpTH3QM628', '2021-08-10 05:56:58.443740'),
('1gmhbl761ywdlao7d0qf5840779i0irj', '.eJxVjDkOwjAQRe_iGlle4mUo6TmD5WUGB5AtxUmFuDtESgHtf-_9FwtxW2vYBi5hLuzMFDv9binmB7YdlHtst85zb-syJ74r_KCDX3vB5-Vw_w5qHPVbAykpnRVFe-dwQgQbKZFKQlPyEwI4a7UnD0oZMMKgF0gks_ZFos7s_QHUAzec:1mCcNB:WhS8xL2ERHKu59Ozsw611xjEQxoLqfUIwjXIwpwNgDM', '2021-08-22 06:33:25.841655'),
('24wdpnc6seizbeq2wjl47ufvxnf8dijh', '.eJxVjDsOwjAQBe_iGln-fyjpOYO13rVxADlSnFSIu0OkFNC-mXkvlmBbW9pGWdJE7MwkO_1uGfBR-g7oDv02c5z7ukyZ7wo_6ODXmcrzcrh_Bw1G-9ZYvTYKavSOBGmUaLIHI1zU2rtqlEbhIxUMwhCqYElCxWxLVTZIIPb-AOOaOC8:1lzfa9:-G1varjno54vTpnO_H4gdnQopL65Th8mq8fDBOU6eVo', '2021-07-17 13:21:17.013565'),
('2busg1b09m0mdjfx5d9h3yyr8woj1yhi', '.eJxVjLsOwjAMAP8lM4qa2E0IIzvfUNmJTQoolfqYEP-OKnWA9e50bzPQttZhW2QexmIuxpnTL2PKT2m7KA9q98nmqa3zyHZP7GEXe5uKvK5H-zeotNR9i9yh496xAkAqQQWQow8dxV57xCQ-UeyyBAUMZw8glBWyDxqR1Xy-yuk3oA:1lmxrT:3K7K2lJP6poQ1yiRHK-eg6OtIp_hfKVy40GPLXRVFFM', '2021-06-12 12:14:39.894821'),
('2jn0gvwz0vll4larhjpb2r7of3h8payt', '.eJxVjDkOwjAQRe_iGlle4mUo6TmD5WUGB5AtxUmFuDtESgHtf-_9FwtxW2vYBi5hLuzMFDv9binmB7YdlHtst85zb-syJ74r_KCDX3vB5-Vw_w5qHPVbAykpnRVFe-dwQgQbKZFKQlPyEwI4a7UnD0oZMMKgF0gks_ZFos7s_QHUAzec:1m7UkD:Mmw-3mHIrMS8vVqOiuRVunFNvLkUYw72pmP7_fO0mao', '2021-08-08 03:24:01.374989'),
('2pom9s9lqs9azv1em9ny3nypyv1fqjn0', '.eJxVjEEOwiAQRe_C2hAGsQwu3fcMhBkGqZo2Ke3KeHfbpAvd_vfef6uY1qXGtckch6yuCtTpd6PETxl3kB9pvE-ap3GZB9K7og_adD9led0O9--gpla3uhRhCyQYOJ3pEjKEjlznbUYRdFCyY-sdG0Ykj-CFHHIIABsvxqjPFwPUOE4:1m0esy:n6d5zSLwnxgkLheagrlylshFhBnVo1qScS-owPHKZAQ', '2021-07-20 06:48:48.250802'),
('33szk5htj8agr29jibsm2km6j0ci0qg2', '.eJxVjDkOwjAQRe_iGlle4mUo6TmD5WUGB5AtxUmFuDtESgHtf-_9FwtxW2vYBi5hLuzMFDv9binmB7YdlHtst85zb-syJ74r_KCDX3vB5-Vw_w5qHPVbAykpnRVFe-dwQgQbKZFKQlPyEwI4a7UnD0oZMMKgF0gks_ZFos7s_QHUAzec:1m8BsH:c8Q7uZzvBpPgyTgA5vURqzzvrTOGiU_vA6jOgluZ-rM', '2021-08-10 01:27:13.262570'),
('3synvz68uzhkjmfh7ksudje68cycxcr0', '.eJxVjLsOwjAMAP8lM4qa2E0IIzvfUNmJTQoolfqYEP-OKnWA9e50bzPQttZhW2QexmIuxpnTL2PKT2m7KA9q98nmqa3zyHZP7GEXe5uKvK5H-zeotNR9i9yh496xAkAqQQWQow8dxV57xCQ-UeyyBAUMZw8glBWyDxqR1Xy-yuk3oA:1lmpTz:-G2eYLbQxdeA8fpoHyx-8HhSqJni_SnNcLffOknV8w4', '2021-06-12 03:17:51.215009'),
('6h5xxbqcto5aj38881mnty6w6glcvdxq', '.eJxVjDkOwjAQRe_iGlle4mUo6TmD5WUGB5AtxUmFuDtESgHtf-_9FwtxW2vYBi5hLuzMFDv9binmB7YdlHtst85zb-syJ74r_KCDX3vB5-Vw_w5qHPVbAykpnRVFe-dwQgQbKZFKQlPyEwI4a7UnD0oZMMKgF0gks_ZFos7s_QHUAzec:1mDg8w:W6d5mrpbPN7ctgGURgqDrWQnJ7IJzfaNPx6sYhRNHsI', '2021-08-25 04:47:06.693874'),
('83cc9wo7pcvrnkamksut1mq3zphpkzj9', '.eJxVjDkOwjAQRe_iGlle4mUo6TmD5WUGB5AtxUmFuDtESgHtf-_9FwtxW2vYBi5hLuzMFDv9binmB7YdlHtst85zb-syJ74r_KCDX3vB5-Vw_w5qHPVbAykpnRVFe-dwQgQbKZFKQlPyEwI4a7UnD0oZMMKgF0gks_ZFos7s_QHUAzec:1mXElO:a_ig1gsvWzWfc1dSMXAGZkBXSgtJfKtPp98CazlwEKo', '2021-10-18 03:35:38.817388'),
('al7wvjacxm1yrzmh68p8y7ttsf8akh1d', '.eJxVjDkOwjAQRe_iGlle4mUo6TmD5WUGB5AtxUmFuDtESgHtf-_9FwtxW2vYBi5hLuzMFDv9binmB7YdlHtst85zb-syJ74r_KCDX3vB5-Vw_w5qHPVbAykpnRVFe-dwQgQbKZFKQlPyEwI4a7UnD0oZMMKgF0gks_ZFos7s_QHUAzec:1mDdOk:jKP20T-FNpmhnH-WYv6d_QwvwHlpeVo8qNt_Vi5aabE', '2021-08-25 01:51:14.465095'),
('bl0wqlmlma7pypy7r67se55h4jqyd94e', '.eJxVjEEOwiAQRe_C2hAGsQwu3fcMhBkGqZo2Ke3KeHfbpAvd_vfef6uY1qXGtckch6yuCtTpd6PETxl3kB9pvE-ap3GZB9K7og_adD9led0O9--gpla3uhRhCyQYOJ3pEjKEjlznbUYRdFCyY-sdG0Ykj-CFHHIIABsvxqjPFwPUOE4:1mCE1v:sG4vLBeUmY0qdM4MycgDoTaO4u-H0WAOW7xEaB5Ai84', '2021-08-21 04:33:51.073810'),
('bsn8uqzskk1tjri8ft2w6ut8t3wefmmg', 'MWM0ZTM2MjEyM2EzOGMwMmNjMmY3YjY2ZWRjNDBiZDY0NTEzMTI1MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMzBhMTdjMDM5MjRmYjhiYmE2ZDBjNzVlODY4MGVjNzk3NGQzMzc4In0=', '2020-07-19 07:50:19.849765'),
('d9h59nhwgyz4k554i4s5a2dvh98yk4wr', '.eJxVjDkOwjAQRe_iGlle4mUo6TmD5WUGB5AtxUmFuDtESgHtf-_9FwtxW2vYBi5hLuzMFDv9binmB7YdlHtst85zb-syJ74r_KCDX3vB5-Vw_w5qHPVbAykpnRVFe-dwQgQbKZFKQlPyEwI4a7UnD0oZMMKgF0gks_ZFos7s_QHUAzec:1mE6L1:SHhYeUftP44Zt-3-d9gkOm7OXVNOnyKtITv3HCi11ns', '2021-08-26 08:45:19.454635'),
('db6v9ktzpn5git60j7twhqtqr2rt82hq', '.eJxVjDkOwjAQRe_iGlle4mUo6TmD5WUGB5AtxUmFuDtESgHtf-_9FwtxW2vYBi5hLuzMFDv9binmB7YdlHtst85zb-syJ74r_KCDX3vB5-Vw_w5qHPVbAykpnRVFe-dwQgQbKZFKQlPyEwI4a7UnD0oZMMKgF0gks_ZFos7s_QHUAzec:1n9fnC:8ew7dPAoytP3JPqqNRe-JZSVd4l8OXJEARssx-8BImA', '2022-02-01 04:08:22.972877'),
('dgn2h3opk1ud3sstrsesorppc1gvemu6', '.eJxVjEEOwiAQRe_C2hAGsQwu3fcMhBkGqZo2Ke3KeHfbpAvd_vfef6uY1qXGtckch6yuCtTpd6PETxl3kB9pvE-ap3GZB9K7og_adD9led0O9--gpla3uhRhCyQYOJ3pEjKEjlznbUYRdFCyY-sdG0Ykj-CFHHIIABsvxqjPFwPUOE4:1mDKRU:P9ZLFuZ3MqijH96XiLZ4Vaw_NYvlVAGkbCZbIsnB1Ss', '2021-08-24 05:36:48.290881'),
('dqx8mrk6p55mtxs8ad9jcssw73cybpid', '.eJxVjDkOwjAQRe_iGlle4mUo6TmD5WUGB5AtxUmFuDtESgHtf-_9FwtxW2vYBi5hLuzMFDv9binmB7YdlHtst85zb-syJ74r_KCDX3vB5-Vw_w5qHPVbAykpnRVFe-dwQgQbKZFKQlPyEwI4a7UnD0oZMMKgF0gks_ZFos7s_QHUAzec:1m8ahs:29rS4dJLNX1tSQX6is996jYr3wt8Wz1lSA4V_gTango', '2021-08-11 03:58:08.867339'),
('e0535caxvqte0pt27g0g6gcg9dik7uzt', '.eJxVjDkOwjAQRe_iGlle4mUo6TmD5WUGB5AtxUmFuDtESgHtf-_9FwtxW2vYBi5hLuzMFDv9binmB7YdlHtst85zb-syJ74r_KCDX3vB5-Vw_w5qHPVbAykpnRVFe-dwQgQbKZFKQlPyEwI4a7UnD0oZMMKgF0gks_ZFos7s_QHUAzec:1mLG3E:zvAsCF4RXZU14zU4HOEu5krLsZC6GkPh578wYzAQPxk', '2021-09-15 02:32:32.975900'),
('fjo2mortbmpwc8rk6u24h94hnnf7mefc', '.eJxVjEEOwiAQRe_C2pCBoSAu3XsGwgAjVUOT0q6MdzckXej2v_f-W4S4bzXsvaxhzuIilDj9bhTTs7QB8iO2-yLT0rZ1JjkUedAub0sur-vh_h3U2OuovUEFqJwny4VNIe2IWEe2jidvFWRUDKZM54TEpC0CEaAzANkyi88X5IA39Q:1orYDO:Dzn24VLH5wilx9NU17mY37D73UZgTQtUTEai6QfEN88', '2022-11-20 05:29:02.341987'),
('fq5isqsp2s6mew7w3byu0ms4zbm9y1yr', '.eJxVjDkOwjAQRe_iGlle4mUo6TmD5WUGB5AtxUmFuDtESgHtf-_9FwtxW2vYBi5hLuzMFDv9binmB7YdlHtst85zb-syJ74r_KCDX3vB5-Vw_w5qHPVbAykpnRVFe-dwQgQbKZFKQlPyEwI4a7UnD0oZMMKgF0gks_ZFos7s_QHUAzec:1nA0Sq:Ayp8pcTSu_46XYw4nDXb7dK5TdX5hAXYd97pGkEhoXc', '2022-02-02 02:12:44.028596'),
('hfti7avtd1ihmk3zmpqzwugdv9ejykt1', '.eJxVjDkOwjAQRe_iGlle4mUo6TmD5WUGB5AtxUmFuDtESgHtf-_9FwtxW2vYBi5hLuzMFDv9binmB7YdlHtst85zb-syJ74r_KCDX3vB5-Vw_w5qHPVbAykpnRVFe-dwQgQbKZFKQlPyEwI4a7UnD0oZMMKgF0gks_ZFos7s_QHUAzec:1m0gPO:urDok7-1sxQyOajK8bJE5unHs3EnUkb7_mfOkK7X1Os', '2021-07-20 08:26:22.432855'),
('hitt4jss77n43p9pcptcj8pl9u3u9ua3', '.eJxVjEEOwiAQRe_C2hAGsQwu3fcMhBkGqZo2Ke3KeHfbpAvd_vfef6uY1qXGtckch6yuCtTpd6PETxl3kB9pvE-ap3GZB9K7og_adD9led0O9--gpla3uhRhCyQYOJ3pEjKEjlznbUYRdFCyY-sdG0Ykj-CFHHIIABsvxqjPFwPUOE4:1nsfbj:IwjtJPVa57Wrfpxo7-Y8efJfULIf2hC6zk-v8il-fyU', '2022-06-05 07:02:31.596508'),
('hludytgowubwvxfwd2lvh9w2jdgdfgu5', '.eJxVjLsOwjAMAP8lM4qa2E0IIzvfUNmJTQoolfqYEP-OKnWA9e50bzPQttZhW2QexmIuxpnTL2PKT2m7KA9q98nmqa3zyHZP7GEXe5uKvK5H-zeotNR9i9yh496xAkAqQQWQow8dxV57xCQ-UeyyBAUMZw8glBWyDxqR1Xy-yuk3oA:1lnNcm:NKkcufrcQ2cmH3uTpe4DtaM_lF-HVQaNZtUZcKiCr20', '2021-06-13 15:45:12.635170'),
('hze0lommca3tw7e7kc5fmv8711rid28l', '.eJxVjLsOwjAMAP8lM4qa2E0IIzvfUNmJTQoolfqYEP-OKnWA9e50bzPQttZhW2QexmIuxpnTL2PKT2m7KA9q98nmqa3zyHZP7GEXe5uKvK5H-zeotNR9i9yh496xAkAqQQWQow8dxV57xCQ-UeyyBAUMZw8glBWyDxqR1Xy-yuk3oA:1lnM89:Q1zFW1uNoKSsulzM8TPaF3vEcMDiUU7SviS62w2Hon4', '2021-06-13 14:09:29.476680'),
('i7fwlm6w588tqqj3ic4kfbcvf6v3m6i1', '.eJxVjEEOwiAQRe_C2hAGsQwu3fcMhBkGqZo2Ke3KeHfbpAvd_vfef6uY1qXGtckch6yuCtTpd6PETxl3kB9pvE-ap3GZB9K7og_adD9led0O9--gpla3uhRhCyQYOJ3pEjKEjlznbUYRdFCyY-sdG0Ykj-CFHHIIABsvxqjPFwPUOE4:1m0fFO:nHixwenP5CcE18-BNVwnYn7QNx5aRRyZ8z1qx0BhRw8', '2021-07-20 07:11:58.187128'),
('jcwijf0631wav02eplwdienvqnzv7brh', '.eJxVjEEOwiAQRe_C2hAGsQwu3fcMhBkGqZo2Ke3KeHfbpAvd_vfef6uY1qXGtckch6yuCtTpd6PETxl3kB9pvE-ap3GZB9K7og_adD9led0O9--gpla3uhRhCyQYOJ3pEjKEjlznbUYRdFCyY-sdG0Ykj-CFHHIIABsvxqjPFwPUOE4:1m0fJC:IC3ml0YOzomqn6ruJdpU9yK8G_UYuKYrYI5_yXl7MII', '2021-07-20 07:15:54.478323'),
('jqxt3x6n51whllc89256l0nov85kahaq', '.eJxVjDkOwjAQRe_iGlle4mUo6TmD5WUGB5AtxUmFuDtESgHtf-_9FwtxW2vYBi5hLuzMFDv9binmB7YdlHtst85zb-syJ74r_KCDX3vB5-Vw_w5qHPVbAykpnRVFe-dwQgQbKZFKQlPyEwI4a7UnD0oZMMKgF0gks_ZFos7s_QHUAzec:1mE2HG:d24pcPZJCn6OuKl4-ziJZ0kgzIZjWapRxG_4a92sib8', '2021-08-26 04:25:10.057504'),
('mrvc7sx96x4c5pb7lyzke5780w8qdhja', '.eJxVjDsOwjAQBe_iGln-fyjpOYO13rVxADlSnFSIu0OkFNC-mXkvlmBbW9pGWdJE7MwkO_1uGfBR-g7oDv02c5z7ukyZ7wo_6ODXmcrzcrh_Bw1G-9ZYvTYKavSOBGmUaLIHI1zU2rtqlEbhIxUMwhCqYElCxWxLVTZIIPb-AOOaOC8:1lwyNe:nU5KtIgsHcaO1mT9IFZSkdj1Z5xe8OdeEwILCeHFA4c', '2021-07-10 02:49:14.427568'),
('pkd26ehy7jg5teyd94le1vrtafvivvb6', '.eJxVjDkOwjAQRe_iGlle4mUo6TmD5WUGB5AtxUmFuDtESgHtf-_9FwtxW2vYBi5hLuzMFDv9binmB7YdlHtst85zb-syJ74r_KCDX3vB5-Vw_w5qHPVbAykpnRVFe-dwQgQbKZFKQlPyEwI4a7UnD0oZMMKgF0gks_ZFos7s_QHUAzec:1muazN:EzyH2iaTtWF20rJoidgiAGsAvYLrJAmOoF9W4nIpPAU', '2021-12-21 13:58:37.072373'),
('q363h73woc3n7vkpo0w1rrqzeq4qlf27', '.eJxVjDkOwjAQRe_iGlle4mUo6TmD5WUGB5AtxUmFuDtESgHtf-_9FwtxW2vYBi5hLuzMFDv9binmB7YdlHtst85zb-syJ74r_KCDX3vB5-Vw_w5qHPVbAykpnRVFe-dwQgQbKZFKQlPyEwI4a7UnD0oZMMKgF0gks_ZFos7s_QHUAzec:1n9JlO:MaMDrIRM2pnKuFC_-wpepevE-TuGf0SjICBcR9RPe2s', '2022-01-31 04:37:02.877194'),
('qhooj9kx5wmngwwe3q00goi91trtn3wv', '.eJxVjDkOwjAQRe_iGlle4mUo6TmD5WUGB5AtxUmFuDtESgHtf-_9FwtxW2vYBi5hLuzMFDv9binmB7YdlHtst85zb-syJ74r_KCDX3vB5-Vw_w5qHPVbAykpnRVFe-dwQgQbKZFKQlPyEwI4a7UnD0oZMMKgF0gks_ZFos7s_QHUAzec:1mDmQ6:m0rkaPDT9czdTncRfru9gj5Yq3sEJe_bq7uEv6skH4s', '2021-08-25 11:29:14.029535'),
('qyxxmkc0g3sfsbqkegpwqximy8app6pl', 'MWM0ZTM2MjEyM2EzOGMwMmNjMmY3YjY2ZWRjNDBiZDY0NTEzMTI1MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMzBhMTdjMDM5MjRmYjhiYmE2ZDBjNzVlODY4MGVjNzk3NGQzMzc4In0=', '2020-07-12 06:53:05.308663'),
('r7pt3pjxgoc19q8q6kr1wcjcl7jtj6y3', 'MWM0ZTM2MjEyM2EzOGMwMmNjMmY3YjY2ZWRjNDBiZDY0NTEzMTI1MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMzBhMTdjMDM5MjRmYjhiYmE2ZDBjNzVlODY4MGVjNzk3NGQzMzc4In0=', '2020-07-04 08:54:28.939107'),
('ssjke3kv40dxlhho89fakyqi25yhg4zn', '.eJxVjEEOwiAQRe_C2hAGsQwu3fcMhBkGqZo2Ke3KeHfbpAvd_vfef6uY1qXGtckch6yuCtTpd6PETxl3kB9pvE-ap3GZB9K7og_adD9led0O9--gpla3uhRhCyQYOJ3pEjKEjlznbUYRdFCyY-sdG0Ykj-CFHHIIABsvxqjPFwPUOE4:1m8ENM:gWvn8VH8PSOgIKvNFypydjX6IUo2IXxtq5i723WMmKI', '2021-08-10 04:07:28.381954'),
('syd6yrenccmzc4cvam4akq8srkbhgslu', '.eJxVjEEOwiAQRe_C2hAGsQwu3fcMhBkGqZo2Ke3KeHfbpAvd_vfef6uY1qXGtckch6yuCtTpd6PETxl3kB9pvE-ap3GZB9K7og_adD9led0O9--gpla3uhRhCyQYOJ3pEjKEjlznbUYRdFCyY-sdG0Ykj-CFHHIIABsvxqjPFwPUOE4:1m8EQY:56l7bhh6kCftwEC9ChlYa19t4TwMXeVuBQStVXoyhHo', '2021-08-10 04:10:46.839306'),
('t06k651u4ct5nmi6ob74elam41dweci3', '.eJxVjEEOwiAQRe_C2hAGsQwu3fcMhBkGqZo2Ke3KeHfbpAvd_vfef6uY1qXGtckch6yuCtTpd6PETxl3kB9pvE-ap3GZB9K7og_adD9led0O9--gpla3uhRhCyQYOJ3pEjKEjlznbUYRdFCyY-sdG0Ykj-CFHHIIABsvxqjPFwPUOE4:1nrEPk:coutq3JasoZ9OEleH1ONJYo0U66_kIcTTtNuFPDgpIE', '2022-06-01 07:48:12.894065'),
('tks8hw9hnizjuo9ucj4vokp5cy65lmhu', '.eJxVjDkOwjAQRe_iGlle4mUo6TmD5WUGB5AtxUmFuDtESgHtf-_9FwtxW2vYBi5hLuzMFDv9binmB7YdlHtst85zb-syJ74r_KCDX3vB5-Vw_w5qHPVbAykpnRVFe-dwQgQbKZFKQlPyEwI4a7UnD0oZMMKgF0gks_ZFos7s_QHUAzec:1mDQd3:IjG_6Or8mM0SRa8HWyehnvxQBNMBgMqe98YANY9roAI', '2021-08-24 12:13:09.810106'),
('u2ilg9z5qv98ibtblz4qq1vpfculnlhp', '.eJxVjMsOwiAQRf-FtSHDu7h07zeQgQGpGkhKuzL-uzbpQrf3nHNfLOC21rCNvISZ2JkJdvrdIqZHbjugO7Zb56m3dZkj3xV-0MGvnfLzcrh_BxVH_dbSYDEWcgRtgJIsVEhgRlTgvLNIZEXR6JLy0muw3kyorIxTAiGMQPb-APMEN7o:1pPBzf:O73HqUU3B9KjgiVqeer_vhaaSlu9avh3iUq2y-SDEcM', '2023-02-21 00:37:55.853624'),
('x18lit00vtj0lriynr1wggf6lfyxqdu2', '.eJxVjLsOwjAMAP8lM4qa2E0IIzvfUNmJTQoolfqYEP-OKnWA9e50bzPQttZhW2QexmIuxpnTL2PKT2m7KA9q98nmqa3zyHZP7GEXe5uKvK5H-zeotNR9i9yh496xAkAqQQWQow8dxV57xCQ-UeyyBAUMZw8glBWyDxqR1Xy-yuk3oA:1lmxyK:40q3blFsLpLEQNx5Gy6JNcFdnhO34DCd6w_YmvacfLw', '2021-06-12 12:21:44.229092'),
('xln4c8ou4upt7rztdxcz9uxmyeusawe7', '.eJxVjDsOwjAQRO_iGlnexDFeSnrOEHk_wQFkS_lUiLuTSClgynlv5m36tC65X2ed-lHMxYA5_XaU-KllB_JI5V4t17JMI9ldsQed7a2Kvq6H-3eQ05y39dB26DAQtIKsgOKBOHkk6chFjNAw0uBFB43oWLvo2hDOWzxCA2A-X-TqN1w:1pQ6rq:SxaaDqbH7hixwzIiEI_27Or3IodBUGkT4TXeLIVcJOM', '2023-02-23 13:21:38.765561'),
('y62jyeas3shs9clbkkq3txocc02d5n2l', '.eJxVjEEOwiAQRe_C2hAGsQwu3fcMhBkGqZo2Ke3KeHfbpAvd_vfef6uY1qXGtckch6yuCtTpd6PETxl3kB9pvE-ap3GZB9K7og_adD9led0O9--gpla3uhRhCyQYOJ3pEjKEjlznbUYRdFCyY-sdG0Ykj-CFHHIIABsvxqjPFwPUOE4:1m0egb:NlzRlnowK42TbiY7F60N0A2TUI7U45YDbqC7MFB3uo0', '2021-07-20 06:36:01.216268'),
('ycot3qj4lbb1qz7p5nd3zybz76qv4onl', '.eJxVjEEOwiAQRe_C2pCBoSAu3XsGwgAjVUOT0q6MdzckXej2v_f-W4S4bzXsvaxhzuIilDj9bhTTs7QB8iO2-yLT0rZ1JjkUedAub0sur-vh_h3U2OuovUEFqJwny4VNIe2IWEe2jidvFWRUDKZM54TEpC0CEaAzANkyi88X5IA39Q:1ortWi:oxmupqindhktOpzy9VbMDCU1eagxnZ6vtGvFypOZVP4', '2022-11-21 04:14:24.674654');

-- --------------------------------------------------------

--
-- Table structure for table `financial_app_budget`
--

CREATE TABLE `financial_app_budget` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `amount` decimal(14,2) DEFAULT NULL,
  `balance` decimal(14,2) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `budget_type_id` int(11) NOT NULL,
  `coordinator_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `financial_app_budget_type`
--

CREATE TABLE `financial_app_budget_type` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `financial_app_currency`
--

CREATE TABLE `financial_app_currency` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `ratio` decimal(14,2) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `financial_app_currency`
--

INSERT INTO `financial_app_currency` (`id`, `created_at`, `name`, `ratio`, `country`, `created_by_id`) VALUES
(1, '2020-06-20 07:47:52.907636', 'Төгрөг', '1.00', 'Mongolia', 1);

-- --------------------------------------------------------

--
-- Table structure for table `financial_app_investment`
--

CREATE TABLE `financial_app_investment` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `investor` varchar(255) NOT NULL,
  `issued_money` decimal(14,2) NOT NULL,
  `refunded_money` decimal(14,2) NOT NULL,
  `balance` decimal(14,2) NOT NULL,
  `issued_date` datetime(6) DEFAULT NULL,
  `refunded_date` datetime(6) DEFAULT NULL,
  `will_refund` tinyint(1) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `financial_app_loan`
--

CREATE TABLE `financial_app_loan` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `lender` varchar(255) NOT NULL,
  `issued_money` decimal(14,2) NOT NULL,
  `refunded_money` decimal(14,2) NOT NULL,
  `balance` decimal(14,2) NOT NULL,
  `loan_rate` int(11) NOT NULL,
  `issued_date` datetime(6) DEFAULT NULL,
  `refunded_date` datetime(6) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `financial_app_money_transfer`
--

CREATE TABLE `financial_app_money_transfer` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `msg_info_fee` decimal(14,2) DEFAULT NULL,
  `transfer_fee` decimal(14,2) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `wanna_delete` tinyint(1) NOT NULL,
  `recieved_ebarimt` tinyint(1) NOT NULL,
  `amount` decimal(14,2) DEFAULT NULL,
  `bill_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `currency_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL,
  `fr_budget_id` int(11) DEFAULT NULL,
  `fr_investment_id` int(11) DEFAULT NULL,
  `fr_loan_id` int(11) DEFAULT NULL,
  `fr_user_id` int(11) DEFAULT NULL,
  `fr_wallet_id` int(11) DEFAULT NULL,
  `money_transfer_type_id` int(11) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `to_budget_id` int(11) DEFAULT NULL,
  `to_investment_id` int(11) DEFAULT NULL,
  `to_loan_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `to_wallet_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `shift_work_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `financial_app_money_transfer`
--

INSERT INTO `financial_app_money_transfer` (`id`, `created_at`, `updated_at`, `msg_info_fee`, `transfer_fee`, `description`, `wanna_delete`, `recieved_ebarimt`, `amount`, `bill_id`, `created_by_id`, `currency_id`, `customer_id`, `division_id`, `fr_budget_id`, `fr_investment_id`, `fr_loan_id`, `fr_user_id`, `fr_wallet_id`, `money_transfer_type_id`, `payment_id`, `to_budget_id`, `to_investment_id`, `to_loan_id`, `to_user_id`, `to_wallet_id`, `updated_by_id`, `shift_work_id`) VALUES
(1, '2023-02-09 05:00:35.790534', '2023-02-09 05:00:35.790534', '0.00', '0.00', 'Лоунж, ресторанаас орж ирсэн орлогын гүйлгээ.', 0, 0, '100.00', NULL, 1, 1, NULL, 5, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 6, NULL, 45),
(2, '2023-02-09 05:01:06.589074', '2023-02-09 05:01:06.589074', '0.00', '0.00', 'Лоунж, ресторанаас орж ирсэн орлогын гүйлгээ.', 0, 0, '100.00', NULL, 1, 1, NULL, 5, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, 6, NULL, 45),
(3, '2023-02-09 05:03:27.288897', '2023-02-09 05:03:27.288897', '0.00', '0.00', 'Лоунж, ресторанаас орж ирсэн орлогын гүйлгээ.', 0, 0, '100.00', NULL, 1, 1, NULL, 5, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, NULL, 1, NULL, 45),
(4, '2023-02-09 05:23:08.459346', '2023-02-09 05:23:08.459346', '0.00', '0.00', 'Лоунж, ресторанаас орж ирсэн орлогын гүйлгээ.', 0, 0, '100.00', NULL, 1, 1, NULL, 5, NULL, NULL, NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, NULL, 2, NULL, 45),
(5, '2023-02-09 05:28:18.094025', '2023-02-09 05:28:18.094025', '0.00', '0.00', 'Лоунж, ресторанаас орж ирсэн орлогын гүйлгээ.', 0, 0, '100.00', NULL, 1, 1, NULL, 5, NULL, NULL, NULL, NULL, NULL, 1, 5, NULL, NULL, NULL, NULL, 6, NULL, 45),
(6, '2023-02-09 05:37:03.259844', '2023-02-09 05:37:03.259844', '0.00', '0.00', 'Лоунж, ресторанаас орж ирсэн орлогын гүйлгээ.', 0, 0, '100.00', NULL, 1, 1, NULL, 5, NULL, NULL, NULL, NULL, NULL, 1, 6, NULL, NULL, NULL, NULL, 6, NULL, 45),
(7, '2023-02-09 05:43:40.799570', '2023-02-09 05:43:40.799570', '0.00', '0.00', 'Лоунж, ресторанаас орж ирсэн орлогын гүйлгээ.', 0, 0, '100.00', NULL, 1, 1, NULL, 5, NULL, NULL, NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, NULL, 6, NULL, 45),
(8, '2023-02-09 05:52:09.477841', '2023-02-09 05:52:09.477841', '0.00', '0.00', 'Лоунж, ресторанаас орж ирсэн орлогын гүйлгээ.', 0, 0, '100.00', NULL, 1, 1, NULL, 5, NULL, NULL, NULL, NULL, NULL, 1, 8, NULL, NULL, NULL, NULL, 6, NULL, 45),
(9, '2023-02-09 06:39:49.636920', '2023-02-09 06:39:49.636920', '0.00', '0.00', 'Лоунж, ресторанаас орж ирсэн орлогын гүйлгээ.', 0, 0, '100.00', NULL, 1, 1, NULL, 5, NULL, NULL, NULL, NULL, NULL, 1, 9, NULL, NULL, NULL, NULL, 6, NULL, 45),
(10, '2023-02-09 06:41:57.022030', '2023-02-09 06:41:57.022030', '0.00', '0.00', 'Лоунж, ресторанаас орж ирсэн орлогын гүйлгээ.', 0, 0, '100.00', NULL, 1, 1, NULL, 5, NULL, NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, NULL, 6, NULL, 45),
(11, '2023-02-09 12:34:21.205787', '2023-02-09 12:34:21.205787', '0.00', '0.00', 'Лоунж, ресторанаас орж ирсэн орлогын гүйлгээ.', 0, 0, '100.00', NULL, 1, 1, NULL, 5, NULL, NULL, NULL, NULL, NULL, 1, 11, NULL, NULL, NULL, NULL, 6, NULL, 45),
(12, '2023-02-09 13:07:01.697172', '2023-02-09 13:07:01.697172', '0.00', '0.00', 'Лоунж, ресторанаас орж ирсэн орлогын гүйлгээ.', 0, 0, '6100.00', NULL, 1, 1, NULL, 5, NULL, NULL, NULL, NULL, NULL, 1, 12, NULL, NULL, NULL, NULL, 6, NULL, 45),
(13, '2023-02-09 13:08:03.881413', '2023-02-09 13:08:03.881413', '0.00', '0.00', 'Лоунж, ресторанаас орж ирсэн орлогын гүйлгээ.', 0, 0, '7600.00', NULL, 1, 1, NULL, 5, NULL, NULL, NULL, NULL, NULL, 1, 13, NULL, NULL, NULL, NULL, 6, NULL, 45),
(14, '2023-02-09 13:10:37.929763', '2023-02-09 13:10:37.929763', '0.00', '0.00', 'Лоунж, ресторанаас орж ирсэн орлогын гүйлгээ.', 0, 0, '1900.00', NULL, 1, 1, NULL, 5, NULL, NULL, NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, NULL, 6, NULL, 45),
(15, '2023-02-09 13:11:02.854266', '2023-02-09 13:11:02.854266', '0.00', '0.00', 'Лоунж, ресторанаас орж ирсэн орлогын гүйлгээ.', 0, 0, '100.00', NULL, 1, 1, NULL, 5, NULL, NULL, NULL, NULL, NULL, 1, 15, NULL, NULL, NULL, NULL, 6, NULL, 45),
(16, '2023-02-09 13:22:56.879497', '2023-02-09 13:22:56.879497', '0.00', '0.00', 'Лоунж, ресторанаас орж ирсэн орлогын гүйлгээ.', 0, 0, '100.00', NULL, 1, 1, NULL, 5, NULL, NULL, NULL, NULL, NULL, 1, 16, NULL, NULL, NULL, NULL, 6, NULL, 46),
(17, '2023-02-09 13:30:40.055866', '2023-02-09 13:30:40.055866', '0.00', '0.00', 'Лоунж, ресторанаас орж ирсэн орлогын гүйлгээ.', 0, 0, '256500.00', NULL, 1, 1, NULL, 5, NULL, NULL, NULL, NULL, NULL, 1, 17, NULL, NULL, NULL, NULL, 1, NULL, 46);

-- --------------------------------------------------------

--
-- Table structure for table `financial_app_money_transfer_type`
--

CREATE TABLE `financial_app_money_transfer_type` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `financial_app_money_transfer_type`
--

INSERT INTO `financial_app_money_transfer_type` (`id`, `created_at`, `name`, `description`, `created_by_id`) VALUES
(1, '2020-06-20 07:47:52.913968', 'Орлогын гүйлгээ', 'Үйлчилгээ үзүүлээд олсон мөнгөний гүйлгээ.', 1),
(2, '2021-06-30 12:09:23.693639', 'Зарлагын гүйлгээ', 'Орлогоос ямар нэгэн зүйлд зориулж, аль эсвэл хувьдаа авсан бүх гүйлгээг хэлнэ.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `financial_app_wallet`
--

CREATE TABLE `financial_app_wallet` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `account` bigint(20) DEFAULT NULL,
  `balance` decimal(14,2) NOT NULL,
  `msg_info_fee` decimal(14,2) DEFAULT NULL,
  `transfer_fee` decimal(14,2) DEFAULT NULL,
  `bank_transfer_fee` decimal(14,2) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL,
  `is_pos` tinyint(1) NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `financial_app_wallet`
--

INSERT INTO `financial_app_wallet` (`id`, `created_at`, `name`, `description`, `bank`, `account`, `balance`, `msg_info_fee`, `transfer_fee`, `bank_transfer_fee`, `created_by_id`, `owner_id`, `division_id`, `is_pos`, `parent_id`) VALUES
(1, '2020-06-20 08:56:40.378495', 'Цасчихэр', 'Цасчихэр', 'Хаан банк', 5094321905, '0.00', '0.00', '0.00', '0.00', 1, 2, NULL, 0, NULL),
(2, '2020-06-20 08:58:40.129292', 'Хаш-Эрдэнэ', 'Хаш-Эрдэнэ', 'Хаан банк', 5090613276, '0.00', '0.00', '0.00', '0.00', 1, 3, NULL, 0, NULL),
(3, '2020-07-05 07:51:28.552630', 'Эрдэнэсоёл', 'Эрдэнэсоёл', 'Голомт банк', 4025107178, '0.00', '0.00', '0.00', '0.00', 1, 4, NULL, 0, NULL),
(4, '2020-07-05 07:53:00.043191', 'POS - Зочид буудал', 'POS - Зочид буудал', 'Голомт банк', 100001, '0.00', '0.00', '0.00', '0.00', 1, 4, 3, 0, NULL),
(5, '2020-07-05 07:53:43.233613', 'POS - Лоунж', 'POS - Лоунж', 'Голомт банк', 100002, '0.00', '0.00', '0.00', '0.00', 1, 4, 5, 0, NULL),
(6, '2021-05-30 14:34:43.588282', 'Бэлэн - Лоунж', 'Бэлэн - Лоунж', 'Бэлэн', 100003, '0.00', '0.00', '0.00', '0.00', 1, 2, 5, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_hotel_client_item`
--

CREATE TABLE `hotel_hotel_client_item` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotel_hotel_client_item_eelj`
--

CREATE TABLE `hotel_hotel_client_item_eelj` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotel_hotel_client_log`
--

CREATE TABLE `hotel_hotel_client_log` (
  `id` int(11) NOT NULL,
  `value` varchar(3) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `choices_type` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_notification`
--

CREATE TABLE `notification_notification` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `message` longtext NOT NULL,
  `viewed` tinyint(1) NOT NULL,
  `url` longtext DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_app_bill`
--

CREATE TABLE `payment_app_bill` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `city_tax` varchar(255) DEFAULT NULL,
  `cash_amount` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `lottery_warning_msg` varchar(255) DEFAULT NULL,
  `bill_id` varchar(255) DEFAULT NULL,
  `lottery` varchar(255) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `division_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `bill_id_suffix` varchar(255) DEFAULT NULL,
  `bill_type` varchar(1) DEFAULT NULL,
  `customer_no` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `district_code` varchar(255) DEFAULT NULL,
  `error_code` varchar(255) DEFAULT NULL,
  `internal_code` varchar(255) DEFAULT NULL,
  `mac_address` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `non_cash_amount` varchar(255) DEFAULT NULL,
  `pos_no` varchar(255) DEFAULT NULL,
  `qr_data` varchar(255) DEFAULT NULL,
  `register_no` varchar(255) DEFAULT NULL,
  `return_bill_id` varchar(255) DEFAULT NULL,
  `tax_type` varchar(255) DEFAULT NULL,
  `vat` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `printer` varchar(1) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_app_bill`
--

INSERT INTO `payment_app_bill` (`id`, `created_at`, `city_tax`, `cash_amount`, `amount`, `lottery_warning_msg`, `bill_id`, `lottery`, `client_id`, `created_by_id`, `customer_id`, `division_id`, `order_id`, `bill_id_suffix`, `bill_type`, `customer_no`, `date`, `district_code`, `error_code`, `internal_code`, `mac_address`, `message`, `non_cash_amount`, `pos_no`, `qr_data`, `register_no`, `return_bill_id`, `tax_type`, `vat`, `updated_at`, `updated_by_id`, `status`, `printer`, `customer_name`) VALUES
(1, '2023-02-08 08:42:21.411005', '0.00', '2090.00', '2090.00', NULL, NULL, NULL, 29, NULL, NULL, 5, 1, '100031', '1', NULL, NULL, '20', NULL, NULL, NULL, NULL, '0.00', '0005', NULL, NULL, NULL, '1', '190.00', '2023-02-08 08:42:26.243418', NULL, '1', NULL, NULL),
(2, '2023-02-08 08:50:52.202222', '0.00', '2090.00', '2090.00', NULL, '000004388771001230208000005100032', 'ZN 88877749', 20, NULL, NULL, 5, 2, '100032', '1', NULL, '2023-02-08 08:50:52', '20', NULL, '5B420731275268DB6F4244EFAD7A03137D60CA0F5128A3DA076276', '0242AC160002', NULL, '0.00', '0005', '410762533836498894767070426581813746438903183889516901433661085804866863327479363006301977750816129677468395863217100901330096129551854172053408312336709792220780860489494771541495243731642016525000313735347170163844809410174270007978409591278438918643964', '4388771', NULL, '1', '190.00', '2023-02-08 08:50:56.232694', NULL, '1', NULL, NULL),
(4, '2023-02-08 09:05:15.765009', '0.00', '2090.00', '2090.00', NULL, '000004388771001230208000003100034', '', 1, NULL, NULL, 3, 3, '100034', '3', '2074192', '2023-02-08 09:05:16', '20', NULL, NULL, '0242AC160002', NULL, '0.00', '0003', '123873379432634551822452267120925225449211251779678611451698085804860592456775215239706778812872815907920847152455169143858958907047458413294604687798451341698678798421654567506316334898344200647209044741624645888618627173059411690143322269872647118404953', '4388771', NULL, '1', '190.00', '2023-02-08 09:05:18.658876', NULL, '1', NULL, NULL),
(5, '2023-02-08 09:10:58.714896', '0.00', '110.00', '110.00', NULL, '000004388771001230208000005100035', 'ZN 88870649', 29, NULL, NULL, 5, 4, '100035', '1', NULL, '2023-02-08 09:10:59', '20', NULL, NULL, '0242AC160002', NULL, '0.00', '0005', '698855545115654558658609856034754825329754272503013727980194085804869310417446598115304030945391726630100654820281548299328118813602195457198388596475097208420343358719740445134193613729813154684150390298174625348052002245399719367431754780968932001767021', '4388771', NULL, '1', '10.00', '2023-02-08 09:10:59.716339', NULL, '1', NULL, NULL),
(6, '2023-02-09 05:01:13.482260', '0.00', '110.00', '110.00', NULL, '000004388771001230209000005100036', 'ZN 88873554', 27, NULL, NULL, 5, 5, '100036', '1', NULL, '2023-02-09 05:01:13', '20', NULL, NULL, '0242AC160002', NULL, '0.00', '0005', '424855357902777233553302889262356361131712041975316021017169085804861900264961124793994808463659050623117762175491379847428737503381030807074159676378355182150100459230968808120515322825256328009526205751101730606428228574749485948334609301410422913536566', '4388771', NULL, '1', '10.00', '2023-02-09 05:01:16.749866', NULL, '1', NULL, NULL),
(7, '2023-02-09 05:03:35.533468', '0.00', '110.00', '110.00', NULL, '000004388771001230209000005100037', 'ZN 88876457', 24, NULL, NULL, 5, 6, '100037', '1', NULL, '2023-02-09 05:03:34', '20', NULL, NULL, '0242AC160002', NULL, '0.00', '0005', '801573780349497270763898600792312423822014293970645400386590085804865561023841337042543288524482146268260499847338320210690272525788117154720425323954282833960398850039316011100330577503080175812432007452513447010854863168370034017038585137690562515910500', '4388771', NULL, '1', '10.00', '2023-02-09 05:03:40.419439', NULL, '1', NULL, NULL),
(8, '2023-02-09 05:23:26.271469', '0.00', '100.00', '100.00', NULL, '000004388771001230209000006100038', 'ZN 88879358', 30, NULL, NULL, 6, 8, '100038', '1', NULL, '2023-02-09 05:23:25', '20', NULL, NULL, '0242AC160002', NULL, '0.00', '0006', '594965881320308333982566305522580667864172377588803920654123085804860497913821480650350572774300584492211357896213064171073896645507980652516147985305316871274572350822416684518756188262465969177666167532493870500209071098267607473609287301861489586027578', '4388771', NULL, '1', '10.00', '2023-02-09 05:23:31.945903', NULL, '1', NULL, NULL),
(9, '2023-02-09 05:28:20.442676', '1.00', '100.00', '100.00', NULL, NULL, NULL, 32, NULL, NULL, 6, 9, '100039', '1', NULL, NULL, '20', NULL, NULL, NULL, NULL, '0.00', '0006', NULL, NULL, NULL, '1', '0.9090909090909090909090909091', '2023-02-09 05:28:20.442676', NULL, '0', NULL, NULL),
(10, '2023-02-09 05:41:29.390615', '1.0', '100.00', '100.00', NULL, NULL, NULL, 31, NULL, NULL, 6, 10, '100040', '1', NULL, NULL, '20', NULL, NULL, NULL, NULL, '0.00', '0006', NULL, NULL, NULL, '1', '0.91', '2023-02-09 05:41:29.390615', NULL, '0', NULL, NULL),
(11, '2023-02-09 05:43:42.576732', '1.0', '100.00', '100.00', NULL, NULL, NULL, 31, NULL, NULL, 6, 11, '100041', '1', NULL, NULL, '20', NULL, NULL, NULL, NULL, '0.00', '0006', NULL, NULL, NULL, '1', '0.91', '2023-02-09 05:43:42.576732', NULL, '0', NULL, NULL),
(12, '2023-02-09 06:32:25.424595', '0.00', '100.00', '100.00', NULL, '000004388771001230209000006100055', 'ZN 88872250', 32, NULL, NULL, 6, 12, '100055', '1', NULL, '2023-02-09 06:32:24', '20', NULL, NULL, '0242AC160002', NULL, '0.00', '0006', '332305489690915210768056989223173760753978262966613487526426085804863162886210718074102553488505055476989822029956078483137075324188694693547013176746716478219249636633247177305428818332233074308859617629453835535346793272595525562122713257963102430519639', '4388771', NULL, '1', '9.09', '2023-02-09 06:32:27.547875', NULL, '1', NULL, NULL),
(13, '2023-02-09 06:39:52.668624', '0.00', '100.00', '100.00', NULL, '000004388771001230209000006100056', 'ZN 88875147', 33, NULL, NULL, 6, 13, '100056', '1', NULL, '2023-02-09 06:39:52', '20', NULL, NULL, '0242AC160002', NULL, '0.00', '0006', '770343196920914002724213346606913537035299836102168535774112085804869138413405292504179966575523363365133362092030282124202009762070846528082336520929713211064848424962409687650930479927853102957383627775455767661283071145232525264193186403708007302493649', '4388771', NULL, '1', '9.09', '2023-02-09 06:39:54.113762', NULL, '1', '1', NULL),
(14, '2023-02-09 06:41:58.858187', '0.00', '100.00', '100.00', NULL, '000004388771001230209000006100057', 'ZN 88878042', 30, NULL, NULL, 6, 14, '100057', '1', NULL, '2023-02-09 06:41:58', '20', NULL, NULL, '0242AC160002', NULL, '0.00', '0006', '395425246600969208626783679394546079835266029950281956412508085804863886371595973635970125994865794170497837561016052388244875224825400513523617398993630580215922009881830037339698040397617053572154794926660125130632533619061761938250157435618357597781617', '4388771', NULL, '1', '9.09', '2023-02-09 06:41:59.433440', NULL, '1', '1', NULL),
(20, '2023-02-09 12:39:36.817793', '0.00', '100.00', '100.00', NULL, '000004388771001230209000006100063', '', 32, NULL, NULL, 6, 15, '100063', '3', '2074192', '2023-02-09 12:39:36', '20', NULL, NULL, '0242AC160002', NULL, '0.00', '0006', '802761412044616889806153919390760153246699986432101143082244085804860945346803499082624343872830767390282421343951248451759856009160690701834130299419835824036244805911519460757940419162710040294499053387921653490054567662765916075002397825419741004860650', '4388771', NULL, '1', '9.09', '2023-02-09 12:39:37.815401', NULL, '1', '1', 'Эрдэнэт үйлдвэр ТӨҮГ'),
(21, '2023-02-09 13:07:08.110970', '0.00', '6100.00', '6100.00', NULL, '000004388771001230209000005100064', 'ZN 88870928', 28, NULL, NULL, 5, 16, '100064', '1', NULL, '2023-02-09 13:07:07', '20', NULL, NULL, '0242AC160002', NULL, '0.00', '0005', '167231787553200927362912502370355226384795223833586272613221085804869231364499855036269053014049209417826640351994799017729736130823662039600169491642850211387511735577316751529449671149821675948469511672630830611045844248329800848491618542233121645826158', '4388771', NULL, '1', '554.55', '2023-02-09 13:07:12.345071', NULL, '1', '1', ''),
(22, '2023-02-09 13:09:06.235651', '0.00', '7600.00', '7600.00', NULL, '000004388771001230209000005100065', '', 27, NULL, NULL, 5, 17, '100065', '3', '2074192', '2023-02-09 13:09:05', '20', NULL, NULL, '0242AC160002', NULL, '0.00', '0005', '763500680116317744899277949757023308151814663076925787798382085804864085712119254267604654101513023070574636536130909954759566853841698424859964855832851859610636031037801910122392554207580611297630341647878867181200409218729885489018691030020429823593442', '4388771', NULL, '1', '1145.45', '2023-02-09 13:09:11.656141', NULL, '1', '1', 'Эрдэнэт үйлдвэр ТӨҮГ'),
(23, '2023-02-09 13:11:07.700920', '0.00', '100.00', '100.00', NULL, '000004388771001230209000005100066', '', 24, NULL, NULL, 5, 18, '100066', '3', '2074192', '2023-02-09 13:11:07', '20', NULL, NULL, '0242AC160002', NULL, '0.00', '0005', '766582210062063941721234395896247120086956336974805895659559085804867092526745910847065682572637452110937793756077797222587800147713787863848700513350339942913569624655687821965714803317193049247314070321778421154949707321423958568473027097370272720933340', '4388771', NULL, '1', '9.09', '2023-02-09 13:11:09.268015', NULL, '1', '1', 'Эрдэнэт үйлдвэр ТӨҮГ');

-- --------------------------------------------------------

--
-- Table structure for table `payment_app_order`
--

CREATE TABLE `payment_app_order` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `amount` decimal(14,2) DEFAULT NULL,
  `required_date` datetime(6) NOT NULL,
  `is_now` tinyint(1) NOT NULL,
  `status` varchar(255) NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `division_id` int(11) NOT NULL,
  `shift_work_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `discount` decimal(14,2) DEFAULT NULL,
  `discounted_amount` decimal(14,2) DEFAULT NULL,
  `discounted_percent` decimal(14,2) DEFAULT NULL,
  `discount_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_app_order`
--

INSERT INTO `payment_app_order` (`id`, `created_at`, `updated_at`, `amount`, `required_date`, `is_now`, `status`, `client_id`, `created_by_id`, `customer_id`, `division_id`, `shift_work_id`, `updated_by_id`, `worker_id`, `discount`, `discounted_amount`, `discounted_percent`, `discount_by_id`) VALUES
(1, '2023-02-08 08:41:36.128254', '2023-02-09 13:33:51.049815', '109900.00', '2023-02-08 08:41:36.099000', 1, 'Төлбөр төлөгдөөгүй.', 29, 1, NULL, 5, 45, 1, NULL, '0.00', '109900.00', '0.00', NULL),
(2, '2023-02-08 08:50:47.994753', '2023-02-09 13:10:37.925709', '1900.00', '2023-02-08 08:50:47.983000', 1, 'Төлбөр гүйцэт төлсөн.', 20, 1, NULL, 5, 45, NULL, NULL, '0.00', '1900.00', '0.00', NULL),
(3, '2023-02-08 09:02:42.099502', '2023-02-09 13:28:09.197232', '1900.00', '2023-02-08 09:02:42.086000', 1, 'Төлбөр төлөгдөөгүй.', 1, 1, NULL, 3, 45, NULL, 1, '0.00', '1900.00', '0.00', NULL),
(4, '2023-02-08 09:10:49.768244', '2023-02-09 05:00:35.778971', '100.00', '2023-02-08 09:10:49.757000', 1, 'Төлбөр гүйцэт төлсөн.', 29, 1, NULL, 5, 45, NULL, NULL, '0.00', '100.00', '0.00', NULL),
(5, '2023-02-09 04:49:06.910925', '2023-02-09 05:01:06.587499', '100.00', '2023-02-09 04:49:06.893000', 1, 'Төлбөр гүйцэт төлсөн.', 27, 1, NULL, 5, 45, NULL, NULL, '0.00', '100.00', '0.00', NULL),
(6, '2023-02-09 05:03:14.111829', '2023-02-09 05:03:27.283991', '100.00', '2023-02-09 05:03:14.098000', 1, 'Төлбөр гүйцэт төлсөн.', 24, 1, NULL, 5, 45, NULL, NULL, '0.00', '100.00', '0.00', NULL),
(7, '2023-02-09 05:04:48.575566', '2023-02-09 13:30:40.049354', '256500.00', '2023-02-09 05:04:48.561000', 1, 'Төлбөр гүйцэт төлсөн.', 21, 1, NULL, 5, 45, 1, NULL, '0.00', '256500.00', '0.00', NULL),
(8, '2023-02-09 05:22:53.059449', '2023-02-09 05:23:08.455337', '100.00', '2023-02-09 05:22:53.047000', 1, 'Төлбөр гүйцэт төлсөн.', 30, 1, NULL, 6, 45, NULL, NULL, '0.00', '100.00', '0.00', NULL),
(9, '2023-02-09 05:27:56.854274', '2023-02-09 05:28:18.088194', '100.00', '2023-02-09 05:27:56.838000', 1, 'Төлбөр гүйцэт төлсөн.', 32, 1, NULL, 6, 45, NULL, NULL, '0.00', '100.00', '0.00', NULL),
(10, '2023-02-09 05:36:52.235358', '2023-02-09 05:37:03.253943', '100.00', '2023-02-09 05:36:52.221000', 1, 'Төлбөр гүйцэт төлсөн.', 31, 1, NULL, 6, 45, NULL, NULL, '0.00', '100.00', '0.00', NULL),
(11, '2023-02-09 05:43:35.616670', '2023-02-09 05:43:40.794406', '100.00', '2023-02-09 05:43:35.605000', 1, 'Төлбөр гүйцэт төлсөн.', 31, 1, NULL, 6, 45, NULL, NULL, '0.00', '100.00', '0.00', NULL),
(12, '2023-02-09 05:52:03.440925', '2023-02-09 05:52:09.476371', '100.00', '2023-02-09 05:52:03.427000', 1, 'Төлбөр гүйцэт төлсөн.', 32, 1, NULL, 6, 45, NULL, NULL, '0.00', '100.00', '0.00', NULL),
(13, '2023-02-09 06:39:42.875525', '2023-02-09 06:39:49.632233', '100.00', '2023-02-09 06:39:42.861000', 1, 'Төлбөр гүйцэт төлсөн.', 33, 1, NULL, 6, 45, NULL, NULL, '0.00', '100.00', '0.00', NULL),
(14, '2023-02-09 06:41:51.970788', '2023-02-09 06:41:57.016698', '100.00', '2023-02-09 06:41:51.957000', 1, 'Төлбөр гүйцэт төлсөн.', 30, 1, NULL, 6, 45, NULL, NULL, '0.00', '100.00', '0.00', NULL),
(15, '2023-02-09 12:34:13.212194', '2023-02-09 12:34:21.197230', '100.00', '2023-02-09 12:34:13.192000', 1, 'Төлбөр гүйцэт төлсөн.', 32, 1, NULL, 6, 45, NULL, NULL, '0.00', '100.00', '0.00', NULL),
(16, '2023-02-09 13:06:48.792374', '2023-02-09 13:07:01.697172', '6100.00', '2023-02-09 13:06:48.778000', 1, 'Төлбөр гүйцэт төлсөн.', 28, 1, NULL, 5, 45, NULL, NULL, '0.00', '6100.00', '0.00', NULL),
(17, '2023-02-09 13:07:56.866332', '2023-02-09 13:08:03.859889', '7600.00', '2023-02-09 13:07:56.836000', 1, 'Төлбөр гүйцэт төлсөн.', 27, 1, NULL, 5, 45, NULL, NULL, '0.00', '7600.00', '0.00', NULL),
(18, '2023-02-09 13:10:57.866719', '2023-02-09 13:11:02.838502', '100.00', '2023-02-09 13:10:57.836000', 1, 'Төлбөр гүйцэт төлсөн.', 24, 1, NULL, 5, 45, NULL, NULL, '0.00', '100.00', '0.00', NULL),
(19, '2023-02-09 13:22:48.903229', '2023-02-09 13:22:56.872426', '100.00', '2023-02-09 13:22:48.890000', 1, 'Төлбөр гүйцэт төлсөн.', 20, 1, NULL, 5, 46, NULL, NULL, '0.00', '100.00', '0.00', NULL),
(20, '2023-02-09 13:34:34.811143', '2023-02-09 13:34:34.811143', '59000.00', '2023-02-09 13:34:34.798000', 1, 'Төлбөр төлөгдөөгүй.', 1, 1, NULL, 3, 46, NULL, NULL, '0.00', '59000.00', '0.00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_app_order_detial`
--

CREATE TABLE `payment_app_order_detial` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `discount` int(10) UNSIGNED NOT NULL CHECK (`discount` >= 0),
  `fr_date` datetime(6) DEFAULT NULL,
  `to_date` datetime(6) DEFAULT NULL,
  `discount_rate` int(11) NOT NULL,
  `subtotal` decimal(14,2) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `why_deleted` longtext DEFAULT NULL,
  `deleted_date` datetime(6) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `fr_client_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `shift_work_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `finished` tinyint(1) NOT NULL,
  `finished_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_app_order_detial`
--

INSERT INTO `payment_app_order_detial` (`id`, `created_at`, `updated_at`, `quantity`, `discount`, `fr_date`, `to_date`, `discount_rate`, `subtotal`, `is_deleted`, `why_deleted`, `deleted_date`, `client_id`, `created_by_id`, `fr_client_id`, `order_id`, `product_id`, `shift_work_id`, `updated_by_id`, `finished`, `finished_at`) VALUES
(1, '2023-02-08 08:41:36.197282', '2023-02-08 08:41:36.197282', 1, 1900, NULL, NULL, 0, '1900.00', 0, NULL, NULL, 29, 1, 19, 1, 81, 45, NULL, 0, NULL),
(2, '2023-02-08 08:50:48.045251', '2023-02-08 08:50:48.045251', 1, 1900, NULL, NULL, 0, '1900.00', 0, NULL, NULL, 20, 1, 19, 2, 81, 45, NULL, 0, NULL),
(3, '2023-02-08 09:02:42.143130', '2023-02-08 09:02:42.143130', 1, 1900, NULL, NULL, 0, '1900.00', 0, NULL, NULL, 1, 1, 19, 3, 81, 45, NULL, 0, NULL),
(4, '2023-02-08 09:10:49.809637', '2023-02-08 09:10:49.809637', 1, 100, NULL, NULL, 0, '100.00', 0, NULL, NULL, 29, 1, 19, 4, 81, 45, NULL, 0, NULL),
(5, '2023-02-09 04:49:06.968212', '2023-02-09 04:49:06.968212', 1, 100, NULL, NULL, 0, '100.00', 0, NULL, NULL, 27, 1, 19, 5, 81, 45, NULL, 0, NULL),
(6, '2023-02-09 05:03:14.162212', '2023-02-09 05:03:14.162701', 1, 100, NULL, NULL, 0, '100.00', 0, NULL, NULL, 24, 1, 19, 6, 81, 45, NULL, 0, NULL),
(7, '2023-02-09 05:04:48.617207', '2023-02-09 05:04:48.617207', 1, 100, NULL, NULL, 0, '100.00', 0, NULL, NULL, 21, 1, 19, 7, 81, 45, NULL, 0, NULL),
(8, '2023-02-09 05:22:53.102477', '2023-02-09 05:22:53.102477', 1, 100, NULL, NULL, 0, '100.00', 0, NULL, NULL, 30, 1, 19, 8, 81, 45, NULL, 0, NULL),
(9, '2023-02-09 05:27:56.898587', '2023-02-09 05:27:56.898587', 1, 100, NULL, NULL, 0, '100.00', 0, NULL, NULL, 32, 1, 19, 9, 81, 45, NULL, 0, NULL),
(10, '2023-02-09 05:36:52.278554', '2023-02-09 05:36:52.278554', 1, 100, NULL, NULL, 0, '100.00', 0, NULL, NULL, 31, 1, 19, 10, 81, 45, NULL, 0, NULL),
(11, '2023-02-09 05:43:35.675618', '2023-02-09 05:43:35.675618', 1, 100, NULL, NULL, 0, '100.00', 0, NULL, NULL, 31, 1, 19, 11, 81, 45, NULL, 0, NULL),
(12, '2023-02-09 05:52:03.481574', '2023-02-09 05:52:03.481574', 1, 100, NULL, NULL, 0, '100.00', 0, NULL, NULL, 32, 1, 19, 12, 81, 45, NULL, 0, NULL),
(13, '2023-02-09 06:39:42.918579', '2023-02-09 06:39:42.918579', 1, 100, NULL, NULL, 0, '100.00', 0, NULL, NULL, 33, 1, 19, 13, 81, 45, NULL, 0, NULL),
(14, '2023-02-09 06:41:52.016864', '2023-02-09 06:41:52.016864', 1, 100, NULL, NULL, 0, '100.00', 0, NULL, NULL, 30, 1, 19, 14, 81, 45, NULL, 0, NULL),
(15, '2023-02-09 10:27:27.185107', '2023-02-09 13:33:05.400552', 1, 49000, NULL, NULL, 0, '49000.00', 0, NULL, NULL, 21, 1, 19, 7, 30, 45, NULL, 1, '2023-02-09 13:33:05.395204'),
(16, '2023-02-09 10:27:27.254623', '2023-02-09 13:33:06.172918', 1, 49000, NULL, NULL, 0, '49000.00', 0, NULL, NULL, 21, 1, 19, 7, 32, 45, NULL, 1, '2023-02-09 13:33:06.171918'),
(17, '2023-02-09 10:27:27.262687', '2023-02-09 13:33:06.946780', 1, 59000, NULL, NULL, 0, '59000.00', 0, NULL, NULL, 21, 1, 19, 7, 31, 45, NULL, 1, '2023-02-09 13:33:06.945657'),
(18, '2023-02-09 10:27:27.272355', '2023-02-09 10:27:27.272355', 4, 27600, NULL, NULL, 0, '27600.00', 0, NULL, NULL, 21, 1, 19, 7, 104, 45, NULL, 0, NULL),
(19, '2023-02-09 10:27:27.319569', '2023-02-09 13:33:07.618551', 1, 59000, NULL, NULL, 0, '59000.00', 0, NULL, NULL, 21, 1, 19, 7, 33, 45, NULL, 1, '2023-02-09 13:33:07.617527'),
(20, '2023-02-09 10:27:27.423552', '2023-02-09 10:27:27.423552', 1, 5900, NULL, NULL, 0, '5900.00', 0, NULL, NULL, 21, 1, 19, 7, 102, 45, NULL, 0, NULL),
(21, '2023-02-09 10:27:27.445572', '2023-02-09 10:27:27.445572', 1, 6900, NULL, NULL, 0, '6900.00', 0, NULL, NULL, 21, 1, 19, 7, 103, 45, NULL, 0, NULL),
(22, '2023-02-09 12:34:13.287114', '2023-02-09 12:34:13.287114', 1, 100, NULL, NULL, 0, '100.00', 0, NULL, NULL, 32, 1, 19, 15, 81, 45, NULL, 0, NULL),
(23, '2023-02-09 13:06:48.863617', '2023-02-09 13:06:48.863617', 1, 100, NULL, NULL, 0, '100.00', 0, NULL, NULL, 28, 1, 19, 16, 81, 45, NULL, 0, NULL),
(24, '2023-02-09 13:06:48.877366', '2023-02-09 13:06:48.877366', 1, 3000, NULL, NULL, 0, '3000.00', 0, NULL, NULL, 28, 1, 19, 16, 85, 45, NULL, 0, NULL),
(25, '2023-02-09 13:06:48.883846', '2023-02-09 13:06:48.883846', 1, 3000, NULL, NULL, 0, '3000.00', 0, NULL, NULL, 28, 1, 19, 16, 86, 45, NULL, 0, NULL),
(26, '2023-02-09 13:07:56.937904', '2023-02-09 13:07:56.937904', 6, 600, NULL, NULL, 0, '600.00', 0, NULL, NULL, 27, 1, 19, 17, 81, 45, NULL, 0, NULL),
(27, '2023-02-09 13:07:56.942808', '2023-02-09 13:07:56.942808', 1, 2000, NULL, NULL, 0, '2000.00', 0, NULL, NULL, 27, 1, 19, 17, 235, 45, NULL, 0, NULL),
(28, '2023-02-09 13:07:56.945611', '2023-02-09 13:07:56.945611', 1, 3000, NULL, NULL, 0, '3000.00', 0, NULL, NULL, 27, 1, 19, 17, 84, 45, NULL, 0, NULL),
(29, '2023-02-09 13:07:56.954329', '2023-02-09 13:07:56.954329', 1, 2000, NULL, NULL, 0, '2000.00', 0, NULL, NULL, 27, 1, 19, 17, 236, 45, NULL, 0, NULL),
(30, '2023-02-09 13:10:57.925274', '2023-02-09 13:10:57.925274', 1, 100, NULL, NULL, 0, '100.00', 0, NULL, NULL, 24, 1, 19, 18, 81, 45, NULL, 0, NULL),
(31, '2023-02-09 13:22:48.969464', '2023-02-09 13:22:48.969464', 1, 100, NULL, NULL, 0, '100.00', 0, NULL, NULL, 20, 1, 19, 19, 81, 46, NULL, 0, NULL),
(32, '2023-02-09 13:32:40.876905', '2023-02-09 14:00:48.724361', 1, 49000, NULL, NULL, 0, '49000.00', 0, NULL, NULL, 29, 1, 19, 1, 30, 46, NULL, 1, '2023-02-09 14:00:48.722362'),
(33, '2023-02-09 13:33:51.092893', '2023-02-09 13:33:51.092893', 1, 59000, NULL, NULL, 0, '59000.00', 0, NULL, NULL, 29, 1, 19, 1, 33, 46, NULL, 0, NULL),
(34, '2023-02-09 13:34:34.875487', '2023-02-09 13:34:34.875487', 1, 59000, NULL, NULL, 0, '59000.00', 0, NULL, NULL, 1, 1, 19, 20, 34, 46, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_app_order_payments`
--

CREATE TABLE `payment_app_order_payments` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `updated_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_app_order_payments`
--

INSERT INTO `payment_app_order_payments` (`id`, `created_at`, `updated_at`, `created_by_id`, `order_id`, `payment_id`, `updated_by_id`) VALUES
(1, '2023-02-09 05:00:35.778971', '2023-02-09 05:00:35.778971', NULL, 4, 1, NULL),
(2, '2023-02-09 05:01:06.583561', '2023-02-09 05:01:06.583561', NULL, 5, 2, NULL),
(3, '2023-02-09 05:03:27.281573', '2023-02-09 05:03:27.281573', NULL, 6, 3, NULL),
(4, '2023-02-09 05:23:08.450746', '2023-02-09 05:23:08.450746', NULL, 8, 4, NULL),
(5, '2023-02-09 05:28:18.084477', '2023-02-09 05:28:18.084477', NULL, 9, 5, NULL),
(6, '2023-02-09 05:37:03.251412', '2023-02-09 05:37:03.251412', NULL, 10, 6, NULL),
(7, '2023-02-09 05:43:40.792732', '2023-02-09 05:43:40.792732', NULL, 11, 7, NULL),
(8, '2023-02-09 05:52:09.472590', '2023-02-09 05:52:09.472590', NULL, 12, 8, NULL),
(9, '2023-02-09 06:39:49.630795', '2023-02-09 06:39:49.630795', NULL, 13, 9, NULL),
(10, '2023-02-09 06:41:57.013843', '2023-02-09 06:41:57.013843', NULL, 14, 10, NULL),
(11, '2023-02-09 12:34:21.192810', '2023-02-09 12:34:21.192810', NULL, 15, 11, NULL),
(12, '2023-02-09 13:07:01.697172', '2023-02-09 13:07:01.697172', NULL, 16, 12, NULL),
(13, '2023-02-09 13:08:03.859889', '2023-02-09 13:08:03.859889', NULL, 17, 13, NULL),
(14, '2023-02-09 13:10:37.921282', '2023-02-09 13:10:37.921282', NULL, 2, 14, NULL),
(15, '2023-02-09 13:11:02.838502', '2023-02-09 13:11:02.838502', NULL, 18, 15, NULL),
(16, '2023-02-09 13:22:56.868873', '2023-02-09 13:22:56.868873', NULL, 19, 16, NULL),
(17, '2023-02-09 13:30:40.045386', '2023-02-09 13:30:40.045386', NULL, 7, 17, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_app_payment`
--

CREATE TABLE `payment_app_payment` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `amount` decimal(14,2) DEFAULT NULL,
  `confirmed_by_id` int(11) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `shift_work_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `wallet_id` int(11) NOT NULL,
  `division_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_app_payment`
--

INSERT INTO `payment_app_payment` (`id`, `created_at`, `updated_at`, `amount`, `confirmed_by_id`, `created_by_id`, `shift_work_id`, `updated_by_id`, `wallet_id`, `division_id`) VALUES
(1, '2023-02-09 05:00:35.770876', '2023-02-09 05:00:35.770876', '100.00', 1, 1, 45, NULL, 6, 5),
(2, '2023-02-09 05:01:06.573809', '2023-02-09 05:01:06.573809', '100.00', 1, 1, 45, NULL, 6, 5),
(3, '2023-02-09 05:03:27.277306', '2023-02-09 05:03:27.277306', '100.00', 1, 1, 45, NULL, 1, 5),
(4, '2023-02-09 05:23:08.442754', '2023-02-09 05:23:08.442754', '100.00', 1, 1, 45, NULL, 2, 5),
(5, '2023-02-09 05:28:18.081250', '2023-02-09 05:28:18.081250', '100.00', 1, 1, 45, NULL, 6, 5),
(6, '2023-02-09 05:37:03.244719', '2023-02-09 05:37:03.244719', '100.00', 1, 1, 45, NULL, 6, 5),
(7, '2023-02-09 05:43:40.786552', '2023-02-09 05:43:40.786552', '100.00', 1, 1, 45, NULL, 6, 5),
(8, '2023-02-09 05:52:09.464203', '2023-02-09 05:52:09.464203', '100.00', 1, 1, 45, NULL, 6, 5),
(9, '2023-02-09 06:39:49.625127', '2023-02-09 06:39:49.625127', '100.00', 1, 1, 45, NULL, 6, 5),
(10, '2023-02-09 06:41:57.008860', '2023-02-09 06:41:57.008860', '100.00', 1, 1, 45, NULL, 6, 5),
(11, '2023-02-09 12:34:21.181812', '2023-02-09 12:34:21.181812', '100.00', 1, 1, 45, NULL, 6, 5),
(12, '2023-02-09 13:07:01.692082', '2023-02-09 13:07:01.692082', '6100.00', 1, 1, 45, NULL, 6, 5),
(13, '2023-02-09 13:08:03.859889', '2023-02-09 13:08:03.859889', '7600.00', 1, 1, 45, NULL, 6, 5),
(14, '2023-02-09 13:10:37.911978', '2023-02-09 13:10:37.911978', '1900.00', 1, 1, 45, NULL, 6, 5),
(15, '2023-02-09 13:11:02.836521', '2023-02-09 13:11:02.836521', '100.00', 1, 1, 45, NULL, 6, 5),
(16, '2023-02-09 13:22:56.860179', '2023-02-09 13:22:56.860179', '100.00', 1, 1, 46, NULL, 6, 5),
(17, '2023-02-09 13:30:40.038698', '2023-02-09 13:30:40.038698', '256500.00', 1, 1, 46, NULL, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `payment_app_pos_account_consolidation`
--

CREATE TABLE `payment_app_pos_account_consolidation` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `fr_date` datetime(6) NOT NULL,
  `to_date` datetime(6) NOT NULL,
  `amount` decimal(14,2) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `confirmed_by_id` int(11) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `division_id` int(11) NOT NULL,
  `person_of_charge_id` int(11) NOT NULL,
  `shift_work_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_app_basic_asset`
--

CREATE TABLE `product_app_basic_asset` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `description` longtext DEFAULT NULL,
  `real_price` decimal(14,2) NOT NULL,
  `rised_price` decimal(14,2) NOT NULL,
  `code` varchar(30) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_app_basic_asset`
--

INSERT INTO `product_app_basic_asset` (`id`, `created_at`, `updated_at`, `name`, `description`, `real_price`, `rised_price`, `code`, `photo`, `created_by_id`, `division_id`, `updated_by_id`) VALUES
(1, '2020-06-20 07:47:55.212647', '2020-06-20 07:47:55.212647', 'Дөрвөлжин пял таваг 30х30', 'Цагаан шаазан иржгэртэй таваг', '0.00', '0.00', '129', 'asset_images\\/image_fyAS3Xd.jpg', 2, 2, 2),
(3, '2020-06-20 07:47:53.804695', '2020-06-20 07:47:53.804695', 'Толин грилл', 'Газан грил', '0.00', '0.00', '1', 'asset_images\\/image_ybFsVV5.jpg', 2, 2, 2),
(4, '2020-06-20 07:47:53.817743', '2020-06-20 07:47:53.817743', 'Газан плитка 8 ширэмтэй', 'Жижиг 6 том 2', '0.00', '0.00', '2', 'asset_images\\/image_BpyPKfL.jpg', 2, 2, 2),
(5, '2020-06-20 07:47:53.831044', '2020-06-20 07:47:53.831044', 'Хөлдөөгч 53кг', 'Цагаан 1.2х0.8', '0.00', '0.00', '3', 'asset_images\\/image_GtrVGB8.jpg', 2, 2, 2),
(6, '2020-06-20 07:47:53.841441', '2020-06-20 07:47:53.841441', '4 ширэмтэй цахилгаан плитка', 'Доороо дуковктой', '0.00', '0.00', '4', 'asset_images\\/image_tbQiKBl.jpg', 2, 2, 2),
(7, '2020-06-20 07:47:53.852193', '2020-06-20 07:47:53.852193', 'Шилэн хаалгатай хөргөгч', 'Дээжний хөргөгч', '0.00', '0.00', '5', 'asset_images\\/image_V26CztV.jpg', 2, 2, 2),
(8, '2020-06-20 07:47:53.862775', '2020-06-20 07:47:53.862775', 'Хөргүүртэй бандан ширээ', 'Доороо хөргүүртэй ширээ', '0.00', '0.00', '6', 'asset_images\\/image_Re1SE0R.jpg', 2, 2, 2),
(9, '2020-06-20 07:47:53.875147', '2020-06-20 07:47:53.875147', 'Бэлтгэлийн ширээ', 'Гүүдэг хаалгатай бэлтгэлийн ширээ', '0.00', '0.00', '7', 'asset_images\\/image_HEnAdJU.jpg', 2, 2, 2),
(10, '2020-06-20 07:47:53.886512', '2020-06-20 07:47:53.886512', 'Ус буцалгагч', '40л', '0.00', '0.00', '8', 'asset_images\\/image_MiDY6pH.jpg', 2, 2, 2),
(11, '2020-06-20 07:47:53.897523', '2020-06-20 07:47:53.898523', 'Гурил будааны сав', 'Цагаан 30 кг', '0.00', '0.00', '9', 'asset_images\\/image_xWoJGrL.jpg', 2, 2, 2),
(12, '2020-06-20 07:47:53.908533', '2020-06-20 07:47:53.908533', 'Угаалтуур 1 тэй', 'Никель', '0.00', '0.00', '10', 'asset_images\\/image_RflTk9e.jpg', 2, 2, 2),
(13, '2020-06-20 07:47:53.919153', '2020-06-20 07:47:53.919153', 'Богино долгионы зуух', 'Цагаан жижиг', '0.00', '0.00', '11', 'asset_images\\/image_qVKxtEA.jpg', 2, 2, 2),
(14, '2020-06-20 07:47:53.929163', '2020-06-20 07:47:53.929163', 'Угаалтуур 3 тай', 'Никель', '0.00', '0.00', '12', 'Default', 2, 2, 2),
(15, '2020-06-20 07:47:53.940173', '2020-06-20 07:47:53.940173', 'Аяга таваг ариутгагч 2 хаалгат', 'Том 2 хаалгатай', '0.00', '0.00', '13', 'asset_images\\/image_t0EGsBt.jpg', 2, 2, 2),
(16, '2020-06-20 07:47:53.950609', '2020-06-20 07:47:53.950609', 'Аяга таваг ариутгагч жижиг', 'Жижиг дээр доороо хаалгатай', '0.00', '0.00', '14', 'asset_images\\/image_mFzYwQu.jpg', 2, 2, 2),
(17, '2020-06-20 07:47:53.960619', '2020-06-20 07:47:53.960619', 'Жигнүүр 12 давхар', 'Никель 12 давхар', '0.00', '0.00', '15', 'asset_images\\/image_5D3pN2h.jpg', 2, 2, 2),
(18, '2020-06-20 07:47:53.971832', '2020-06-20 07:47:53.971832', 'Шарх шүүгээ 3 давхартай чулуут', 'Чулуутай шарх шүүгээ', '0.00', '0.00', '16', 'asset_images\\/image_fRlXZxy.jpg', 2, 2, 2),
(19, '2020-06-20 07:47:53.981869', '2020-06-20 07:47:53.981869', 'Махны хөрөө', 'Том', '0.00', '0.00', '17', 'asset_images\\/image_5rGnVZl.jpg', 2, 2, 2),
(20, '2020-06-20 07:47:53.992880', '2020-06-20 07:47:53.992880', 'Махны машин', 'Никель', '0.00', '0.00', '18', 'asset_images\\/image_3VPan6g.jpg', 2, 2, 2),
(21, '2020-06-20 07:47:54.002763', '2020-06-20 07:47:54.002763', 'Холигч', 'Саарал жижиг', '0.00', '0.00', '19', 'asset_images\\/image_Lbfmd6d.jpg', 2, 2, 2),
(22, '2020-06-20 07:47:54.012920', '2020-06-20 07:47:54.012920', 'Угаалтуур 2 той', 'Никель', '0.00', '0.00', '20', 'asset_images\\/image_IFwJuef.jpg', 2, 2, 2),
(23, '2020-06-20 07:47:54.023929', '2020-06-20 07:47:54.023929', 'Модон бандан ширээ', 'Модон бандан', '0.00', '0.00', '21', 'asset_images\\/image_gfAxNPm.jpg', 2, 2, 2),
(24, '2020-06-20 07:47:54.034205', '2020-06-20 07:47:54.034205', 'Халуун тогоо', '5 л', '0.00', '0.00', '22', 'asset_images\\/image_oPxfdoB.jpg', 2, 2, 2),
(25, '2020-06-20 07:47:54.045216', '2020-06-20 07:47:54.045216', 'Костроль 48см', 'Хөнгөн цагаан', '0.00', '0.00', '23', 'asset_images\\/image_TkQ7VlO.jpg', 2, 2, 2),
(26, '2020-06-20 07:47:54.055226', '2020-06-20 07:47:54.055226', 'Костроль 5 төрөл', 'Хөнгөн цагаан 48см, 42см, 33см, 30см, 24см', '0.00', '0.00', '24', 'asset_images\\/image_DbFUlQG.jpg', 2, 2, 2),
(27, '2020-06-20 07:47:54.064700', '2020-06-20 07:47:54.064700', 'Битүү чанагч 3ш', 'Никель 3 ш', '0.00', '0.00', '25', 'asset_images\\/image_l7S4maR.jpg', 2, 2, 2),
(28, '2020-06-20 07:47:54.074766', '2020-06-20 07:47:54.074766', 'Хар лист', 'Овенд', '0.00', '0.00', '26', 'asset_images\\/image_CNzbSkc.jpg', 2, 2, 2),
(29, '2020-06-20 07:47:54.084465', '2020-06-20 07:47:54.085466', 'Хөнгөн цагаан лист', 'Өндөр 6ш , нам 6ш нийт 12 ш', '0.00', '0.00', '27', 'asset_images\\/image_QQdRd20.jpg', 2, 2, 2),
(30, '2020-06-20 07:47:54.094791', '2020-06-20 07:47:54.094791', 'Жижиг лист овен', 'Овенгийн лист', '0.00', '0.00', '28', 'asset_images\\/image_VKjO5c9.jpg', 2, 2, 2),
(31, '2020-06-20 07:47:54.104537', '2020-06-20 07:47:54.105540', 'Жигнүүрийн лист битүү', 'Никель', '0.00', '0.00', '29', 'asset_images\\/image_OD7Sl4d.jpg', 2, 2, 2),
(32, '2020-06-20 07:47:54.115441', '2020-06-20 07:47:54.115441', 'Жигнүүрийн нүхтэй лист', 'Никель', '0.00', '0.00', '30', 'asset_images\\/image_9tM7r8j.jpg', 2, 2, 2),
(33, '2020-06-20 07:47:54.126452', '2020-06-20 07:47:54.126452', 'Босоо том лист', 'Никель', '0.00', '0.00', '31', 'asset_images\\/image_DNrRkeD.jpg', 2, 2, 2),
(34, '2020-06-20 07:47:54.136461', '2020-06-20 07:47:54.136461', 'Жүүсний сав', 'Буфет', '0.00', '0.00', '32', 'asset_images\\/image_LxKXTMK.jpg', 2, 2, 2),
(35, '2020-06-20 07:47:54.146472', '2020-06-20 07:47:54.146472', 'Шөлний тогоо', 'Буфет', '0.00', '0.00', '33', 'asset_images\\/image_v3e7gIm.jpg', 2, 2, 2),
(36, '2020-06-20 07:47:54.156481', '2020-06-20 07:47:54.156481', 'Цайны сав', 'Буфет хоолонд гарна', '0.00', '0.00', '34', 'asset_images\\/image_BhQX3L2.jpg', 2, 2, 2),
(37, '2020-06-20 07:47:54.166490', '2020-06-20 07:47:54.166490', 'Халуун сав', 'Цайны халуун сав том', '0.00', '0.00', '35', 'asset_images\\/image_kUy4CDy.jpg', 2, 2, 2),
(38, '2020-06-20 07:47:54.176563', '2020-06-20 07:47:54.176563', 'Гоёлын лист', 'Шармал бариултай никель лиет', '0.00', '0.00', '36', 'asset_images\\/image_SavE6Gw.jpg', 2, 2, 2),
(39, '2020-06-20 07:47:54.186364', '2020-06-20 07:47:54.186364', '2-р хоолны буфет', 'Буфет хоолонд гарна', '0.00', '0.00', '37', 'asset_images\\/image_FmMGAtM.jpg', 2, 2, 2),
(40, '2020-06-20 07:47:54.195950', '2020-06-20 07:47:54.195950', 'Обши хоолны никель тогоо  24см', 'Никель Жижиг', '0.00', '0.00', '38', 'asset_images\\/image_hqOQrNe.jpg', 2, 2, 2),
(41, '2020-06-20 07:47:54.204551', '2020-06-20 07:47:54.204551', 'Жин', 'Электрон жин', '0.00', '0.00', '39', 'asset_images\\/image_MifeNrd.jpg', 2, 2, 2),
(42, '2020-06-20 07:47:54.218228', '2020-06-20 07:47:54.218228', 'Ганбанз', '2 төрөл', '0.00', '0.00', '40', 'asset_images\\/image_NI1xM8Z.jpg', 2, 2, 2),
(43, '2020-06-20 07:47:54.248257', '2020-06-20 07:47:54.248257', 'Ганбанзны суурь', 'Никель суурь', '0.00', '0.00', '41', 'asset_images\\/image_NwZSFVl.jpg', 2, 2, 2),
(44, '2020-06-20 07:47:54.258266', '2020-06-20 07:47:54.258266', 'Будаа агшаагч', '10л', '0.00', '0.00', '42', 'asset_images\\/image_OCJvg5b.jpg', 3, 2, 2),
(45, '2020-06-20 07:47:54.271278', '2020-06-20 07:47:54.271278', 'Шарсан төмсний сагс', 'Төмөр', '0.00', '0.00', '43', 'asset_images\\/image_d4l7C0k.jpg', 2, 2, 2),
(46, '2020-06-20 07:47:54.284290', '2020-06-20 07:47:54.284290', 'Модон хусуур', 'Мод', '0.00', '0.00', '44', 'asset_images\\/image_jRRoDEw.jpg', 2, 2, 2),
(47, '2020-06-20 07:47:54.295289', '2020-06-20 07:47:54.295289', 'Шүүрэн шанага', 'Их тосны шүүрэн шанага том жижиг дунд', '0.00', '0.00', '45', 'asset_images\\/image_NnnrrhO.jpg', 2, 2, 2),
(48, '2020-06-20 07:47:54.305426', '2020-06-20 07:47:54.305426', 'Цайны шүүр', 'Никель', '0.00', '0.00', '46', 'asset_images\\/image_5Skpbdn.jpg', 2, 2, 2),
(49, '2020-06-20 07:47:54.317039', '2020-06-20 07:47:54.317039', 'Махны алх', 'Хөнгөн цагаан', '0.00', '0.00', '47', 'asset_images\\/image_uHbwZrS.jpg', 2, 2, 2),
(50, '2020-06-20 07:47:54.327175', '2020-06-20 07:47:54.327175', 'Будааны хусуур', 'Цагаан пиавор', '0.00', '0.00', '48', 'asset_images\\/image_kYDH4qr.jpg', 2, 2, 2),
(51, '2020-06-20 07:47:54.338186', '2020-06-20 07:47:54.338186', 'Гриллны хусуур', 'Никель том 2ш, дунд 1ш,  битүү жижиг 1ш', '0.00', '0.00', '49', 'asset_images\\/image_7jNDx5w.jpg', 2, 2, 2),
(52, '2020-06-20 07:47:54.350076', '2020-06-20 07:47:54.350076', 'Хоолны халбага', 'Нүхтэй халбага 2ш, порцны халбага 4 ш, соусны халбага 4, хусуур 2', '0.00', '0.00', '50', 'asset_images\\/image_2K0FPhw.jpg', 2, 2, 2),
(53, '2020-06-20 07:47:54.360570', '2020-06-20 07:47:54.361572', 'Пиццаны хусуур', 'Жижиг', '0.00', '0.00', '51', 'asset_images\\/image_eW34V0I.jpg', 2, 2, 2),
(54, '2020-06-20 07:47:54.372451', '2020-06-20 07:47:54.372451', 'Зайрмагны халбага', 'Никель', '0.00', '0.00', '52', 'asset_images\\/image_CbmwVv1.jpg', 2, 2, 2),
(55, '2020-06-20 07:47:54.383460', '2020-06-20 07:47:54.383460', 'Гар миксер', 'Никель', '0.00', '0.00', '53', 'Default', 2, 2, 2),
(56, '2020-06-20 07:47:54.393620', '2020-06-20 07:47:54.393620', 'Төмс арилгагч', 'Никель', '0.00', '0.00', '54', 'asset_images\\/image_7UgxfB8.jpg', 2, 2, 2),
(57, '2020-06-20 07:47:54.404584', '2020-06-20 07:47:54.404584', 'Шанага', '3 төрөл том 1.2, дунд 0.8, жижиг 0.6', '0.00', '0.00', '55', 'asset_images\\/image_WyRdXwN.jpg', 2, 2, 2),
(58, '2020-06-20 07:47:54.415603', '2020-06-20 07:47:54.415603', 'Тиорк', '3 төрөл никель, модон, пиавор', '0.00', '0.00', '56', 'asset_images\\/image_xdtQnmW.jpg', 2, 2, 2),
(59, '2020-06-20 07:47:54.425613', '2020-06-20 07:47:54.425613', 'Өндөг хирчэгч', 'Төмөр', '0.00', '0.00', '57', 'asset_images\\/image_PMPh3me.jpg', 2, 2, 2),
(60, '2020-06-20 07:47:54.435116', '2020-06-20 07:47:54.435116', 'Нүхтэй хавчаар', 'Төмөр', '0.00', '0.00', '58', 'asset_images\\/image_dBDzlDl.jpg', 2, 2, 2),
(61, '2020-06-20 07:47:54.445537', '2020-06-20 07:47:54.445537', 'Резинтэй хавчаар', 'Улаан өнгөтэй', '0.00', '0.00', '59', 'asset_images\\/image_vKTY0uf.jpg', 2, 2, 2),
(62, '2020-06-20 07:47:54.455546', '2020-06-20 07:47:54.456548', 'Том төмөр хавчаар', 'Төмөр хавчаар хайчин хэлбэртэй', '0.00', '0.00', '60', 'asset_images\\/image_bBktMXB.jpg', 2, 2, 2),
(63, '2020-06-20 07:47:54.468135', '2020-06-20 07:47:54.468135', 'Сармис бяцлагч', 'Никель', '0.00', '0.00', '61', 'asset_images\\/image_cbzAZnS.jpg', 2, 2, 2),
(64, '2020-06-20 07:47:54.480151', '2020-06-20 07:47:54.480151', 'Никель хүнд хоолны халбага', 'Том', '0.00', '0.00', '62', 'asset_images\\/image_TMC2rPB.jpg', 2, 2, 2),
(65, '2020-06-20 07:47:54.492162', '2020-06-20 07:47:54.492162', 'Төмөр бөөрөнхий хэв', 'Никель', '0.00', '0.00', '63', 'asset_images\\/image_IqYveD2.jpg', 2, 2, 2),
(66, '2020-06-20 07:47:54.502920', '2020-06-20 07:47:54.502920', 'Модон ганбанз', 'Мах нүддэг ганбанз', '0.00', '0.00', '64', 'asset_images\\/image_BRLgYua.jpg', 2, 2, 2),
(67, '2020-06-20 07:47:54.512416', '2020-06-20 07:47:54.512416', 'Никель таг', 'Гоелын таг том 1ш, жижиг 1ш', '0.00', '0.00', '65', 'asset_images\\/image_Mo2eHwW.jpg', 2, 2, 2),
(68, '2020-06-20 07:47:54.522901', '2020-06-20 07:47:54.522901', 'Мензурк', 'Пиавор', '0.00', '0.00', '66', 'asset_images\\/image_MWz6sM9.jpg', 2, 2, 2),
(69, '2020-06-20 07:47:54.533160', '2020-06-20 07:47:54.533160', 'Газны гал', 'Урт', '0.00', '0.00', '67', 'asset_images\\/image_uRHGwyL.jpg', 2, 2, 2),
(70, '2020-06-20 07:47:54.542858', '2020-06-20 07:47:54.542858', 'Хөнгөн цагаан шанага', '4 төрөл', '0.00', '0.00', '68', 'asset_images\\/image_qhUf4Ee.jpg', 2, 2, 2),
(71, '2020-06-20 07:47:54.553175', '2020-06-20 07:47:54.553175', 'Хайруулын таваг нам D34', 'Намхан диаметр', '0.00', '0.00', '69', 'asset_images\\/image_qaBnFfN.jpg', 2, 2, 2),
(72, '2020-06-20 07:47:54.564018', '2020-06-20 07:47:54.564018', 'Хайруулын таваг нам D32', 'Намхан хайруулын таваг', '0.00', '0.00', '70', 'asset_images\\/image_D24e4Ye.jpg', 2, 2, 2),
(73, '2020-06-20 07:47:54.573515', '2020-06-20 07:47:54.573515', 'Хайруулын таваг өндөр D28', 'Undur tomor', '0.00', '0.00', '71', 'asset_images\\/image_yZnD9fT.jpg', 2, 2, 2),
(74, '2020-06-20 07:47:54.584002', '2020-06-20 07:47:54.584002', 'Хайруулын таваг өндөр D32', 'Өндөр хайруулын таваг төмөр', '0.00', '0.00', '72', 'asset_images\\/image_ydu9mib.jpg', 2, 2, 2),
(75, '2020-06-20 07:47:54.594011', '2020-06-20 07:47:54.594011', 'Хайруулын таваг хар d32', 'Өндөр хар хайруулын таваг', '0.00', '0.00', '73', 'asset_images\\/image_iikoN7m.jpg', 2, 2, 2),
(76, '2020-06-20 07:47:54.604017', '2020-06-20 07:47:54.604017', 'Хайруулын таваг нам D20', 'Хайруулын таваг жижиг төмөр', '0.00', '0.00', '74', 'asset_images\\/image_iPgphXc.jpg', 2, 2, 2),
(77, '2020-06-20 07:47:54.614715', '2020-06-20 07:47:54.614715', 'Шүүрэн шанага богино иштэй', 'Их тосны шүүрэн шанага жижиг', '0.00', '0.00', '75', 'asset_images\\/image_7Tj8OKW.jpg', 2, 2, 2),
(78, '2020-06-20 07:47:54.624724', '2020-06-20 07:47:54.624724', 'Хогийн сав', 'Пиавор саарал том', '0.00', '0.00', '76', 'asset_images\\/image_KgLRMzt.jpg', 2, 2, 2),
(79, '2020-06-20 07:47:54.634730', '2020-06-20 07:47:54.634730', 'Зуушны хөргүүртэй ширээ', 'Хөргүүртэй ширээ', '0.00', '0.00', '77', 'asset_images\\/image_xubg6N3.jpg', 2, 2, 2),
(80, '2020-06-20 07:47:54.644869', '2020-06-20 07:47:54.644869', 'Пиавор төмпөн', 'Дунд 4, жижиг 1ш', '0.00', '0.00', '78', 'asset_images\\/image_bCwfUW9.jpg', 2, 2, 2),
(81, '2020-06-20 07:47:54.654879', '2020-06-20 07:47:54.654879', 'Нүхтэй төмөр төмпөн', 'Том 1ш, жижиг 1ш', '0.00', '0.00', '79', 'asset_images\\/image_C6lK14c.jpg', 2, 2, 2),
(82, '2020-06-20 07:47:54.664888', '2020-06-20 07:47:54.664888', 'Төмөр төмпөн ком', 'Жижгээс томруулсан 11 ш', '0.00', '0.00', '80', 'asset_images\\/image_ZMMpHeu.jpg', 2, 2, 2),
(83, '2020-06-20 07:47:54.674905', '2020-06-20 07:47:54.674905', 'Пиццаны мод', 'Бариултай пиццаны мод 28, 22, 20', '0.00', '0.00', '81', 'asset_images\\/image_XF39pAU.jpg', 2, 2, 2),
(84, '2020-06-20 07:47:54.684915', '2020-06-20 07:47:54.684915', 'Пиццаны дугуй төмөр лист', 'Хар пиццаны бөөөний төөр лист', '0.00', '0.00', '82', 'asset_images\\/image_Euzc2A2.jpg', 2, 2, 2),
(85, '2020-06-20 07:47:54.694924', '2020-06-20 07:47:54.694924', 'Пиццаны бариултай лист', 'Хар өнгөтэй', '0.00', '0.00', '83', 'asset_images\\/image_TbhlBCb.jpg', 2, 2, 2),
(86, '2020-06-20 07:47:54.704934', '2020-06-20 07:47:54.704934', 'Будаа угаадаг шүүрэн шанага', 'Никель нүхтэй том шанага', '0.00', '0.00', '84', 'asset_images\\/image_hojRq29.jpg', 2, 2, 2),
(87, '2020-06-20 07:47:54.714603', '2020-06-20 07:47:54.714603', 'Хутганы ком', 'Хар иштэй 9 ш хутга', '0.00', '0.00', '85', 'asset_images\\/image_NYcA5zn.jpg', 2, 2, 2),
(88, '2020-06-20 07:47:54.724612', '2020-06-20 07:47:54.724612', 'Заазуур', 'Том бор иштэй заазуур', '0.00', '0.00', '86', 'asset_images\\/image_4IInieL.jpg', 2, 2, 2),
(89, '2020-06-20 07:47:54.734833', '2020-06-20 07:47:54.734833', 'Амтлагчны сав 5 тай', 'Никель', '0.00', '0.00', '87', 'asset_images\\/image_c2u9Ulb.jpg', 2, 2, 2),
(90, '2020-06-20 07:47:54.744843', '2020-06-20 07:47:54.744843', 'Амтлагчны сав том 6 тай', 'Никель', '0.00', '0.00', '88', 'asset_images\\/image_oI7zEna.jpg', 2, 2, 2),
(91, '2020-06-20 07:47:54.754852', '2020-06-20 07:47:54.754852', 'Тосны багс', '', '0.00', '0.00', '89', 'asset_images\\/image_Vzs94y3.jpg', 2, 2, 2),
(92, '2020-06-20 07:47:54.765928', '2020-06-20 07:47:54.765928', 'Хананы цаг', 'Дугуй', '0.00', '0.00', '90', 'asset_images\\/image_haVoALA.jpg', 2, 2, 2),
(93, '2020-06-20 07:47:54.775938', '2020-06-20 07:47:54.775938', 'Хогийн шүүр', 'Усан цэнхэр', '0.00', '0.00', '91', 'asset_images\\/image_dkxZQVA.jpg', 2, 2, 2),
(94, '2020-06-20 07:47:54.797124', '2020-06-20 07:47:54.797124', 'Илдүүр', 'Модон', '0.00', '0.00', '92', 'asset_images\\/image_Z55ZqBf.jpg', 2, 2, 2),
(95, '2020-06-20 07:47:54.816258', '2020-06-20 07:47:54.816258', 'Обши хоолны хар тогоо', 'Хар цуйвангийн тогоо', '0.00', '0.00', '93', 'asset_images\\/image_ZTRKWVz.jpg', 2, 2, 2),
(96, '2020-06-20 07:47:54.826265', '2020-06-20 07:47:54.826265', 'Цайны данх', 'Никель', '0.00', '0.00', '94', 'asset_images\\/image_ezkb20r.jpg', 2, 2, 2),
(97, '2020-06-20 07:47:54.837247', '2020-06-20 07:47:54.837247', 'Пицца зүсэгч', 'Хар бариултай', '0.00', '0.00', '95', 'asset_images\\/image_0PAINp7.jpg', 3, 2, 2),
(98, '2020-06-20 07:47:54.846356', '2020-06-20 07:47:54.846356', 'Өлгүүр', 'Төмөр өлгүүр', '0.00', '0.00', '96', 'asset_images\\/image_DhG1jgo.jpg', 2, 2, 2),
(99, '2020-06-20 07:47:54.857366', '2020-06-20 07:47:54.857366', 'Агааржуулагч', 'Никель том', '0.00', '0.00', '97', 'asset_images\\/image_WpKqTmv.jpg', 2, 2, 2),
(100, '2020-06-20 07:47:54.868684', '2020-06-20 07:47:54.868684', 'Мензурк том', 'Том жижиг', '0.00', '0.00', '98', 'asset_images\\/image_FKTAGAG.jpg', 3, 2, 2),
(101, '2020-06-20 07:47:54.878880', '2020-06-20 07:47:54.878880', 'Суурь таваг', 'Том шаазан', '0.00', '0.00', '99', 'asset_images\\/image_t7T21m5.jpg', 2, 2, 2),
(102, '2020-06-20 07:47:54.889743', '2020-06-20 07:47:54.889743', 'Ембүүн таваг', 'Шаазан', '0.00', '0.00', '100', 'asset_images\\/image_RdMI798.jpg', 2, 2, 2),
(103, '2020-06-20 07:47:54.899724', '2020-06-20 07:47:54.899724', 'Хуурганы иржгэр таваг', 'Шаазан иржгэр ирмэгтэй', '0.00', '0.00', '101', 'asset_images\\/image_2ZIWuUe.jpg', 2, 2, 2),
(104, '2020-06-20 07:47:54.909960', '2020-06-20 07:47:54.909960', 'Шөлний аяга жижиг', 'Хуургатай тавганд дагалдах шөлний аяга', '0.00', '0.00', '102', 'asset_images\\/image_dXjIhVa.jpg', 2, 2, 2),
(105, '2020-06-20 07:47:54.919969', '2020-06-20 07:47:54.919969', 'Обши хоолны таваг d12', 'Тасалгаатай обши хоолны пиавор таваг', '0.00', '0.00', '103', 'asset_images\\/image_WorHEdc.jpg', 2, 2, 2),
(106, '2020-06-20 07:47:54.931328', '2020-06-20 07:47:54.931328', 'Обши хоолны таваг D14', 'Обши хоолны тасалгаатай пиавор таваг', '0.00', '0.00', '104', 'asset_images\\/image_Oknl970.jpg', 2, 2, 2),
(107, '2020-06-20 07:47:54.941335', '2020-06-20 07:47:54.941335', 'Обши хоолны таваг d16', 'Обши хоолны тасалгаатай пиавор таваг', '0.00', '0.00', '105', 'asset_images\\/image_bMp6uXL.jpg', 2, 2, 2),
(108, '2020-06-20 07:47:54.952362', '2020-06-20 07:47:54.952362', 'Махны цуглуулганы зуйван таваг', 'Цагаан пиавор таваг', '0.00', '0.00', '106', 'asset_images\\/image_Cwy6owA.jpg', 2, 2, 2),
(109, '2020-06-20 07:47:54.961804', '2020-06-20 07:47:54.961804', 'Нүхтэй дугуй хуурганы таваг', 'Пиавор дугуй', '0.00', '0.00', '107', 'asset_images\\/image_4X8YCee.jpg', 2, 2, 2),
(110, '2020-06-20 07:47:54.973124', '2020-06-20 07:47:54.973124', 'Сэт хоолны ширмэн таваг', '3 цагаан жижиг тавагтай дөрвөлжин ширэмтэй', '0.00', '0.00', '108', 'asset_images\\/image_lNDmc0k.jpg', 2, 2, 2),
(111, '2020-06-20 07:47:54.983230', '2020-06-20 07:47:54.983230', 'Жижиг хачирны таваг', 'Цагаан таваг', '0.00', '0.00', '109', 'asset_images\\/image_u6x6NxS.jpg', 2, 2, 2),
(112, '2020-06-20 07:47:54.994240', '2020-06-20 07:47:54.994240', 'Зуйван ширэм суурьтай', 'Доороо модон суурьтай ширмэн таваг', '0.00', '0.00', '110', 'asset_images\\/image_XeLQz4e.jpg', 2, 2, 2),
(113, '2020-06-20 07:47:55.004251', '2020-06-20 07:47:55.005252', 'Обши шөлтэй хоолны халбага', 'Никель', '0.00', '0.00', '111', 'asset_images\\/image_37cLCjg.jpg', 2, 2, 2),
(114, '2020-06-20 07:47:55.014260', '2020-06-20 07:47:55.014260', 'Бариултай зууван том ширэм суу', 'Бариултай зууван том ширэм суурьтай', '0.00', '0.00', '112', 'asset_images\\/image_Hr6elJN.jpg', 2, 2, 2),
(115, '2020-06-20 07:47:55.024270', '2020-06-20 07:47:55.024270', 'Бариултай зууван дундаж ширэм ', 'Бариултай зууван дундаж  ширэм суурьтай', '0.00', '0.00', '113', 'asset_images\\/image_N4R8yE6.jpg', 2, 2, 2),
(116, '2020-06-20 07:47:55.036240', '2020-06-20 07:47:55.036240', 'Хайруулын таваг хэлбэртэй ширэ', 'Хайруулын таваг хэлбэртэй ширэм', '0.00', '0.00', '114', 'asset_images\\/image_A13kFwG.jpg', 2, 2, 2),
(117, '2020-06-20 07:47:55.049325', '2020-06-20 07:47:55.050326', 'Обши хоолны модон таваг 20 см', '', '0.00', '0.00', '115', 'asset_images\\/image_SqwAmqk.jpg', 2, 2, 2),
(118, '2020-06-20 07:47:55.060336', '2020-06-20 07:47:55.060336', 'Обши хоолны модон таваг 30см', '', '0.00', '0.00', '116', 'asset_images\\/image_j5sQObx.jpg', 2, 2, 2),
(119, '2020-06-20 07:47:55.070067', '2020-06-20 07:47:55.070067', 'Обши хоолны модон таваг 50 см', '', '0.00', '0.00', '117', 'asset_images\\/image_i3mLcuN.jpg', 2, 2, 2),
(120, '2020-06-20 07:47:55.081277', '2020-06-20 07:47:55.081277', 'Зураастай модон таваг 70', '', '0.00', '0.00', '118', 'asset_images\\/image_kuIVDVK.jpg', 2, 2, 2),
(121, '2020-06-20 07:47:55.091286', '2020-06-20 07:47:55.091286', 'Хясаан таваг хачирных жижиг', 'Шаазан', '0.00', '0.00', '119', 'asset_images\\/image_IgVPa6x.jpg', 2, 2, 2),
(122, '2020-06-20 07:47:55.100295', '2020-06-20 07:47:55.100295', 'Зутан шөлний чихтэй аяга', 'Шаазан', '0.00', '0.00', '120', 'asset_images\\/image_e9CzMor.jpg', 2, 2, 2),
(123, '2020-06-20 07:47:55.110304', '2020-06-20 07:47:55.110304', 'Цайны сэнжтэй аяга', 'Шаазан сэнжтэй аяга', '0.00', '0.00', '121', 'asset_images\\/image_L9qsbpG.jpg', 2, 2, 2),
(124, '2020-06-20 07:47:55.122317', '2020-06-20 07:47:55.122317', 'Удвал цэцгэн таваг жижиг d10', 'Шаазан иржгэр хээтэй зууш салатны таваг', '0.00', '0.00', '122', 'asset_images\\/image_BceMrBy.jpg', 2, 2, 2),
(125, '2020-06-20 07:47:55.132312', '2020-06-20 07:47:55.132312', 'Удвал цэцгэн таваг d14', 'Цагаан шаазан иржгэр хээтэй хоолны таваг', '0.00', '0.00', '123', 'asset_images\\/image_JsnZzN8.jpg', 2, 2, 2),
(126, '2020-06-20 07:47:55.142923', '2020-06-20 07:47:55.142923', 'Хясаан таваг том хоолны', 'Шаазан зузаан хясаан таваг', '0.00', '0.00', '124', 'asset_images\\/image_JA5MxHx.jpg', 2, 2, 2),
(127, '2020-06-20 07:47:55.153031', '2020-06-20 07:47:55.153031', 'Обши хоолны никель тогоо 26см', 'Никель тогоо', '0.00', '0.00', '125', 'asset_images\\/image_eddx31F.jpg', 2, 2, 2),
(128, '2020-06-20 07:47:55.163042', '2020-06-20 07:47:55.163042', 'Обши хоолны никель тогоо 28см', 'Никель тогоо', '0.00', '0.00', '126', 'asset_images\\/image_i5XC8RF.jpg', 2, 2, 2),
(129, '2020-06-20 07:47:55.173057', '2020-06-20 07:47:55.173057', 'Пиавор сандал', 'Угсардаг сандал', '0.00', '0.00', '127', 'asset_images\\/image_Oa7aUA3.jpg', 2, 2, 2),
(130, '2020-06-20 07:47:55.184138', '2020-06-20 07:47:55.184138', 'Хутга ирлэгч', 'Улаан', '0.00', '0.00', '128', 'asset_images\\/image_IpiY8B8.jpg', 2, 2, 2),
(131, '2020-06-20 07:47:55.193146', '2020-06-20 07:47:55.193146', 'Дөрвөлжин пял таваг 30х30', 'Дөрвөлжин пял таваг 30х30', '0.00', '0.00', '130', 'asset_images\\/image_IpiY8B8.jpg', 2, 2, 2),
(132, '2020-06-20 07:47:55.202811', '2020-06-20 07:47:55.202811', 'Шөлний аяга', 'Шөлний аяга', '0.00', '0.00', '131', 'asset_images\\/image_IpiY8B8.jpg', 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_app_basic_asset_count`
--

CREATE TABLE `product_app_basic_asset_count` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `counted_day` date NOT NULL,
  `prev_quantity` int(10) UNSIGNED NOT NULL CHECK (`prev_quantity` >= 0),
  `quantity_balance` int(10) UNSIGNED NOT NULL CHECK (`quantity_balance` >= 0),
  `quantity_increased` int(10) UNSIGNED NOT NULL CHECK (`quantity_increased` >= 0),
  `quantity_deducted` int(10) UNSIGNED NOT NULL CHECK (`quantity_deducted` >= 0),
  `information` longtext DEFAULT NULL,
  `controll_confirmed` tinyint(1) NOT NULL,
  `basic_asset_id` int(11) NOT NULL,
  `controlled_by_id` int(11) DEFAULT NULL,
  `counted_by_id` int(11) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_app_basic_asset_count`
--

INSERT INTO `product_app_basic_asset_count` (`id`, `created_at`, `updated_at`, `counted_day`, `prev_quantity`, `quantity_balance`, `quantity_increased`, `quantity_deducted`, `information`, `controll_confirmed`, `basic_asset_id`, `controlled_by_id`, `counted_by_id`, `created_by_id`, `updated_by_id`) VALUES
(1, '2020-06-20 07:47:53.808208', '2020-06-20 07:47:53.808208', '2020-01-06', 0, 1, 1, 0, NULL, 0, 3, NULL, 2, 2, 2),
(2, '2020-06-20 07:47:53.821570', '2020-06-20 07:47:53.821570', '2020-01-06', 0, 1, 1, 0, NULL, 0, 4, NULL, 2, 2, 2),
(3, '2020-06-20 07:47:53.833431', '2020-06-20 07:47:53.834435', '2020-01-06', 0, 2, 2, 0, NULL, 0, 5, NULL, 2, 2, 2),
(4, '2020-06-20 07:47:53.843183', '2020-06-20 07:47:53.843183', '2020-01-06', 0, 1, 1, 0, NULL, 0, 6, NULL, 2, 2, 2),
(5, '2020-06-20 07:47:53.855196', '2020-06-20 07:47:53.855196', '2020-01-06', 0, 2, 2, 0, NULL, 0, 7, NULL, 2, 2, 2),
(6, '2020-06-20 07:47:53.866766', '2020-06-20 07:47:53.866766', '2020-01-06', 0, 2, 2, 0, NULL, 0, 8, NULL, 2, 2, 2),
(7, '2020-06-20 07:47:53.878504', '2020-06-20 07:47:53.878504', '2020-01-06', 0, 2, 2, 0, NULL, 0, 9, NULL, 2, 2, 2),
(8, '2020-06-20 07:47:53.889514', '2020-06-20 07:47:53.889514', '2020-01-06', 0, 1, 1, 0, NULL, 0, 10, NULL, 2, 2, 2),
(9, '2020-06-20 07:47:53.900525', '2020-06-20 07:47:53.900525', '2020-01-06', 0, 3, 3, 0, NULL, 0, 11, NULL, 2, 2, 2),
(10, '2020-06-20 07:47:53.910545', '2020-06-20 07:47:53.910545', '2020-01-06', 0, 1, 1, 0, NULL, 0, 12, NULL, 2, 2, 2),
(11, '2020-06-20 07:47:53.921154', '2020-06-20 07:47:53.921154', '2020-01-06', 0, 1, 1, 0, NULL, 0, 13, NULL, 2, 2, 2),
(12, '2020-06-20 07:47:53.933167', '2020-06-20 07:47:53.933167', '2020-01-06', 0, 1, 1, 0, NULL, 0, 14, NULL, 2, 2, 2),
(13, '2020-06-20 07:47:53.942149', '2020-06-20 07:47:53.943154', '2020-01-06', 0, 1, 1, 0, NULL, 0, 15, NULL, 2, 2, 2),
(14, '2020-06-20 07:47:53.953610', '2020-06-20 07:47:53.953610', '2020-01-06', 0, 1, 1, 0, NULL, 0, 16, NULL, 2, 2, 2),
(15, '2020-06-20 07:47:53.963824', '2020-06-20 07:47:53.963824', '2020-01-06', 0, 1, 1, 0, NULL, 0, 17, NULL, 2, 2, 2),
(16, '2020-06-20 07:47:53.973450', '2020-06-20 07:47:53.973450', '2020-01-06', 0, 1, 1, 0, NULL, 0, 18, NULL, 2, 2, 2),
(17, '2020-06-20 07:47:53.984872', '2020-06-20 07:47:53.984872', '2020-01-06', 0, 1, 1, 0, NULL, 0, 19, NULL, 2, 2, 2),
(18, '2020-06-20 07:47:53.994752', '2020-06-20 07:47:53.994752', '2020-01-06', 0, 1, 1, 0, NULL, 0, 20, NULL, 2, 2, 2),
(19, '2020-06-20 07:47:54.005912', '2020-06-20 07:47:54.005912', '2020-01-06', 0, 1, 1, 0, NULL, 0, 21, NULL, 2, 2, 2),
(20, '2020-06-20 07:47:54.015922', '2020-06-20 07:47:54.015922', '2020-01-06', 0, 1, 1, 0, NULL, 0, 22, NULL, 2, 2, 2),
(21, '2020-06-20 07:47:54.025931', '2020-06-20 07:47:54.025931', '2020-01-06', 0, 1, 1, 0, NULL, 0, 23, NULL, 2, 2, 2),
(22, '2020-06-20 07:47:54.037208', '2020-06-20 07:47:54.037208', '2020-01-06', 0, 1, 1, 0, NULL, 0, 24, NULL, 2, 2, 2),
(23, '2020-06-20 07:47:54.048219', '2020-06-20 07:47:54.048219', '2020-01-06', 0, 1, 1, 0, NULL, 0, 25, NULL, 2, 2, 2),
(24, '2020-06-20 07:47:54.058229', '2020-06-20 07:47:54.058229', '2020-01-06', 0, 5, 5, 0, NULL, 0, 26, NULL, 2, 2, 2),
(25, '2020-06-20 07:47:54.067757', '2020-06-20 07:47:54.067757', '2020-01-06', 0, 3, 3, 0, NULL, 0, 27, NULL, 2, 2, 2),
(26, '2020-06-20 07:47:54.077769', '2020-06-20 07:47:54.077769', '2020-01-06', 0, 3, 3, 0, NULL, 0, 28, NULL, 2, 2, 2),
(27, '2020-06-20 07:47:54.087780', '2020-06-20 07:47:54.087780', '2020-01-06', 0, 12, 12, 0, NULL, 0, 29, NULL, 2, 2, 2),
(28, '2020-06-20 07:47:54.097526', '2020-06-20 07:47:54.097526', '2020-01-06', 0, 2, 2, 0, NULL, 0, 30, NULL, 2, 2, 2),
(29, '2020-06-20 07:47:54.106958', '2020-06-20 07:47:54.107928', '2020-01-06', 0, 22, 22, 0, NULL, 0, 31, NULL, 2, 2, 2),
(30, '2020-06-20 07:47:54.118445', '2020-06-20 07:47:54.118445', '2020-01-06', 0, 10, 10, 0, NULL, 0, 32, NULL, 2, 2, 2),
(31, '2020-06-20 07:47:54.128453', '2020-06-20 07:47:54.128453', '2020-01-06', 0, 3, 3, 0, NULL, 0, 33, NULL, 2, 2, 2),
(32, '2020-06-20 07:47:54.139464', '2020-06-20 07:47:54.139464', '2020-01-06', 0, 1, 1, 0, NULL, 0, 34, NULL, 2, 2, 2),
(33, '2020-06-20 07:47:54.149473', '2020-06-20 07:47:54.149473', '2020-01-06', 0, 1, 1, 0, NULL, 0, 35, NULL, 2, 2, 2),
(34, '2020-06-20 07:47:54.158481', '2020-06-20 07:47:54.158481', '2020-01-06', 0, 1, 1, 0, NULL, 0, 36, NULL, 2, 2, 2),
(35, '2020-06-20 07:47:54.168552', '2020-06-20 07:47:54.168552', '2020-01-06', 0, 2, 2, 0, NULL, 0, 37, NULL, 2, 2, 2),
(36, '2020-06-20 07:47:54.178352', '2020-06-20 07:47:54.178352', '2020-01-06', 0, 2, 2, 0, NULL, 0, 38, NULL, 2, 2, 2),
(37, '2020-06-20 07:47:54.187939', '2020-06-20 07:47:54.187939', '2020-01-06', 0, 1, 1, 0, NULL, 0, 39, NULL, 2, 2, 2),
(38, '2020-06-20 07:47:54.198546', '2020-06-20 07:47:54.198546', '2020-01-06', 0, 5, 5, 0, NULL, 0, 40, NULL, 2, 2, 2),
(39, '2020-06-20 07:47:54.206825', '2020-06-20 07:47:54.206825', '2020-01-06', 0, 1, 1, 0, NULL, 0, 41, NULL, 2, 2, 2),
(40, '2020-06-20 07:47:54.223629', '2020-06-20 07:47:54.223629', '2020-01-06', 0, 12, 12, 0, NULL, 0, 42, NULL, 2, 2, 2),
(41, '2020-06-20 07:47:54.250258', '2020-06-20 07:47:54.250258', '2020-01-06', 0, 2, 2, 0, NULL, 0, 43, NULL, 2, 2, 2),
(42, '2020-06-20 07:47:54.262269', '2020-06-20 07:47:54.262269', '2020-01-06', 0, 1, 1, 0, NULL, 0, 44, NULL, 2, 2, 2),
(43, '2020-06-20 07:47:54.276283', '2020-06-20 07:47:54.276283', '2020-01-06', 0, 12, 12, 0, NULL, 0, 45, NULL, 2, 2, 2),
(44, '2020-06-20 07:47:54.287277', '2020-06-20 07:47:54.287277', '2020-01-06', 0, 5, 5, 0, NULL, 0, 46, NULL, 2, 2, 2),
(45, '2020-06-20 07:47:54.298292', '2020-06-20 07:47:54.298292', '2020-01-06', 0, 3, 3, 0, NULL, 0, 47, NULL, 2, 2, 2),
(46, '2020-06-20 07:47:54.308026', '2020-06-20 07:47:54.309031', '2020-01-06', 0, 1, 1, 0, NULL, 0, 48, NULL, 2, 2, 2),
(47, '2020-06-20 07:47:54.319167', '2020-06-20 07:47:54.319167', '2020-01-06', 0, 1, 1, 0, NULL, 0, 49, NULL, 2, 2, 2),
(48, '2020-06-20 07:47:54.329178', '2020-06-20 07:47:54.330179', '2020-01-06', 0, 2, 2, 0, NULL, 0, 50, NULL, 2, 2, 2),
(49, '2020-06-20 07:47:54.341067', '2020-06-20 07:47:54.341067', '2020-01-06', 0, 4, 4, 0, NULL, 0, 51, NULL, 2, 2, 2),
(50, '2020-06-20 07:47:54.353097', '2020-06-20 07:47:54.353097', '2020-01-06', 0, 11, 11, 0, NULL, 0, 52, NULL, 2, 2, 2),
(51, '2020-06-20 07:47:54.364441', '2020-06-20 07:47:54.364441', '2020-01-06', 0, 1, 1, 0, NULL, 0, 53, NULL, 2, 2, 2),
(52, '2020-06-20 07:47:54.375452', '2020-06-20 07:47:54.375452', '2020-01-06', 0, 2, 2, 0, NULL, 0, 54, NULL, 2, 2, 2),
(53, '2020-06-20 07:47:54.385610', '2020-06-20 07:47:54.385610', '2020-01-06', 0, 3, 3, 0, NULL, 0, 55, NULL, 2, 2, 2),
(54, '2020-06-20 07:47:54.396572', '2020-06-20 07:47:54.396572', '2020-01-06', 0, 3, 3, 0, NULL, 0, 56, NULL, 2, 2, 2),
(55, '2020-06-20 07:47:54.407587', '2020-06-20 07:47:54.407587', '2020-01-06', 0, 3, 3, 0, NULL, 0, 57, NULL, 2, 2, 2),
(56, '2020-06-20 07:47:54.417605', '2020-06-20 07:47:54.417605', '2020-01-06', 0, 3, 3, 0, NULL, 0, 58, NULL, 2, 2, 2),
(57, '2020-06-20 07:47:54.427105', '2020-06-20 07:47:54.427105', '2020-01-06', 0, 1, 1, 0, NULL, 0, 59, NULL, 2, 2, 2),
(58, '2020-06-20 07:47:54.438119', '2020-06-20 07:47:54.438119', '2020-01-06', 0, 3, 3, 0, NULL, 0, 60, NULL, 2, 2, 2),
(59, '2020-06-20 07:47:54.448540', '2020-06-20 07:47:54.448540', '2020-01-06', 0, 1, 1, 0, NULL, 0, 61, NULL, 2, 2, 2),
(60, '2020-06-20 07:47:54.458549', '2020-06-20 07:47:54.458549', '2020-01-06', 0, 4, 4, 0, NULL, 0, 62, NULL, 2, 2, 2),
(61, '2020-06-20 07:47:54.470537', '2020-06-20 07:47:54.471542', '2020-01-06', 0, 1, 1, 0, NULL, 0, 63, NULL, 2, 2, 2),
(62, '2020-06-20 07:47:54.483154', '2020-06-20 07:47:54.483154', '2020-01-06', 0, 1, 1, 0, NULL, 0, 64, NULL, 2, 2, 2),
(63, '2020-06-20 07:47:54.494912', '2020-06-20 07:47:54.494912', '2020-01-06', 0, 2, 2, 0, NULL, 0, 65, NULL, 2, 2, 2),
(64, '2020-06-20 07:47:54.504921', '2020-06-20 07:47:54.504921', '2020-01-06', 0, 1, 1, 0, NULL, 0, 66, NULL, 2, 2, 2),
(65, '2020-06-20 07:47:54.515418', '2020-06-20 07:47:54.515418', '2020-01-06', 0, 2, 2, 0, NULL, 0, 67, NULL, 2, 2, 2),
(66, '2020-06-20 07:47:54.524903', '2020-06-20 07:47:54.524903', '2020-01-06', 0, 1, 1, 0, NULL, 0, 68, NULL, 2, 2, 2),
(67, '2020-06-20 07:47:54.535257', '2020-06-20 07:47:54.536262', '2020-01-06', 0, 2, 2, 0, NULL, 0, 69, NULL, 2, 2, 2),
(68, '2020-06-20 07:47:54.544971', '2020-06-20 07:47:54.544971', '2020-01-06', 0, 4, 4, 0, NULL, 0, 70, NULL, 2, 2, 2),
(69, '2020-06-20 07:47:54.556178', '2020-06-20 07:47:54.556178', '2020-01-06', 0, 1, 1, 0, NULL, 0, 71, NULL, 2, 2, 2),
(70, '2020-06-20 07:47:54.567021', '2020-06-20 07:47:54.567021', '2020-01-06', 0, 2, 2, 0, NULL, 0, 72, NULL, 2, 2, 2),
(71, '2020-06-20 07:47:54.575589', '2020-06-20 07:47:54.575589', '2020-01-06', 0, 1, 1, 0, NULL, 0, 73, NULL, 2, 2, 2),
(72, '2020-06-20 07:47:54.586003', '2020-06-20 07:47:54.587005', '2020-01-06', 0, 1, 1, 0, NULL, 0, 74, NULL, 2, 2, 2),
(73, '2020-06-20 07:47:54.596006', '2020-06-20 07:47:54.596006', '2020-01-06', 0, 2, 2, 0, NULL, 0, 75, NULL, 2, 2, 2),
(74, '2020-06-20 07:47:54.606868', '2020-06-20 07:47:54.606868', '2020-01-06', 0, 1, 1, 0, NULL, 0, 76, NULL, 2, 2, 2),
(75, '2020-06-20 07:47:54.616716', '2020-06-20 07:47:54.616716', '2020-01-06', 0, 1, 1, 0, NULL, 0, 77, NULL, 2, 2, 2),
(76, '2020-06-20 07:47:54.626719', '2020-06-20 07:47:54.626719', '2020-01-06', 0, 2, 2, 0, NULL, 0, 78, NULL, 2, 2, 2),
(77, '2020-06-20 07:47:54.636858', '2020-06-20 07:47:54.636858', '2020-01-06', 0, 1, 1, 0, NULL, 0, 79, NULL, 2, 2, 2),
(78, '2020-06-20 07:47:54.647872', '2020-06-20 07:47:54.647872', '2020-01-06', 0, 5, 5, 0, NULL, 0, 80, NULL, 2, 2, 2),
(79, '2020-06-20 07:47:54.656882', '2020-06-20 07:47:54.656882', '2020-01-06', 0, 2, 2, 0, NULL, 0, 81, NULL, 2, 2, 2),
(80, '2020-06-20 07:47:54.667891', '2020-06-20 07:47:54.667891', '2020-01-06', 0, 11, 11, 0, NULL, 0, 82, NULL, 2, 2, 2),
(81, '2020-06-20 07:47:54.676906', '2020-06-20 07:47:54.676906', '2020-01-06', 0, 3, 3, 0, NULL, 0, 83, NULL, 2, 2, 2),
(82, '2020-06-20 07:47:54.686930', '2020-06-20 07:47:54.687918', '2020-01-06', 0, 6, 6, 0, NULL, 0, 84, NULL, 2, 2, 2),
(83, '2020-06-20 07:47:54.696925', '2020-06-20 07:47:54.696925', '2020-01-06', 0, 1, 1, 0, NULL, 0, 85, NULL, 2, 2, 2),
(84, '2020-06-20 07:47:54.707279', '2020-06-20 07:47:54.707279', '2020-01-06', 0, 1, 1, 0, NULL, 0, 86, NULL, 2, 2, 2),
(85, '2020-06-20 07:47:54.717605', '2020-06-20 07:47:54.717605', '2020-01-06', 0, 9, 9, 0, NULL, 0, 87, NULL, 2, 2, 2),
(86, '2020-06-20 07:47:54.727614', '2020-06-20 07:47:54.727614', '2020-01-06', 0, 1, 1, 0, NULL, 0, 88, NULL, 2, 2, 2),
(87, '2020-06-20 07:47:54.737836', '2020-06-20 07:47:54.737836', '2020-01-06', 0, 1, 1, 0, NULL, 0, 89, NULL, 2, 2, 2),
(88, '2020-06-20 07:47:54.748847', '2020-06-20 07:47:54.748847', '2020-01-06', 0, 1, 1, 0, NULL, 0, 90, NULL, 2, 2, 2),
(89, '2020-06-20 07:47:54.758173', '2020-06-20 07:47:54.758173', '2020-01-06', 0, 1, 1, 0, NULL, 0, 91, NULL, 2, 2, 2),
(90, '2020-06-20 07:47:54.768931', '2020-06-20 07:47:54.768931', '2020-01-06', 0, 1, 1, 0, NULL, 0, 92, NULL, 2, 2, 2),
(91, '2020-06-20 07:47:54.777938', '2020-06-20 07:47:54.777938', '2020-01-06', 0, 1, 1, 0, NULL, 0, 93, NULL, 2, 2, 2),
(92, '2020-06-20 07:47:54.806591', '2020-06-20 07:47:54.806591', '2020-01-06', 0, 1, 1, 0, NULL, 0, 94, NULL, 2, 2, 2),
(93, '2020-06-20 07:47:54.819259', '2020-06-20 07:47:54.819259', '2020-01-06', 0, 5, 5, 0, NULL, 0, 95, NULL, 2, 2, 2),
(94, '2020-06-20 07:47:54.829239', '2020-06-20 07:47:54.829239', '2020-01-06', 0, 2, 2, 0, NULL, 0, 96, NULL, 2, 2, 2),
(95, '2020-06-20 07:47:54.839248', '2020-06-20 07:47:54.839248', '2020-01-06', 0, 1, 1, 0, NULL, 0, 97, NULL, 2, 2, 2),
(96, '2020-06-20 07:47:54.850360', '2020-06-20 07:47:54.850360', '2020-01-06', 0, 8, 8, 0, NULL, 0, 98, NULL, 2, 2, 2),
(97, '2020-06-20 07:47:54.859981', '2020-06-20 07:47:54.859981', '2020-01-06', 0, 5, 5, 0, NULL, 0, 99, NULL, 2, 2, 2),
(98, '2020-06-20 07:47:54.871873', '2020-06-20 07:47:54.871873', '2020-01-06', 0, 2, 2, 0, NULL, 0, 100, NULL, 2, 2, 2),
(99, '2020-06-20 07:47:54.881732', '2020-06-20 07:47:54.881732', '2020-01-06', 0, 9, 9, 0, NULL, 0, 101, NULL, 2, 2, 2),
(100, '2020-06-20 07:47:54.891713', '2020-06-20 07:47:54.891713', '2020-01-06', 0, 9, 9, 0, NULL, 0, 102, NULL, 2, 2, 2),
(101, '2020-06-20 07:47:54.902727', '2020-06-20 07:47:54.902727', '2020-01-06', 0, 47, 47, 0, NULL, 0, 103, NULL, 2, 2, 2),
(102, '2020-06-20 07:47:54.912963', '2020-06-20 07:47:54.912963', '2020-01-06', 0, 18, 18, 0, NULL, 0, 104, NULL, 2, 2, 2),
(103, '2020-06-20 07:47:54.923159', '2020-06-20 07:47:54.923159', '2020-01-06', 0, 10, 10, 0, NULL, 0, 105, NULL, 2, 2, 2),
(104, '2020-06-20 07:47:54.934329', '2020-06-20 07:47:54.934329', '2020-01-06', 0, 10, 10, 0, NULL, 0, 106, NULL, 2, 2, 2),
(105, '2020-06-20 07:47:54.943337', '2020-06-20 07:47:54.943337', '2020-01-06', 0, 10, 10, 0, NULL, 0, 107, NULL, 2, 2, 2),
(106, '2020-06-20 07:47:54.954166', '2020-06-20 07:47:54.954166', '2020-01-06', 0, 5, 5, 0, NULL, 0, 108, NULL, 2, 2, 2),
(107, '2020-06-20 07:47:54.965116', '2020-06-20 07:47:54.965116', '2020-01-06', 0, 5, 5, 0, NULL, 0, 109, NULL, 2, 2, 2),
(108, '2020-06-20 07:47:54.974880', '2020-06-20 07:47:54.974880', '2020-01-06', 0, 21, 21, 0, NULL, 0, 110, NULL, 2, 2, 2),
(109, '2020-06-20 07:47:54.985231', '2020-06-20 07:47:54.985231', '2020-01-06', 0, 30, 30, 0, NULL, 0, 111, NULL, 2, 2, 2),
(110, '2020-06-20 07:47:54.997243', '2020-06-20 07:47:54.997243', '2020-01-06', 0, 6, 6, 0, NULL, 0, 112, NULL, 2, 2, 2),
(111, '2020-06-20 07:47:55.007253', '2020-06-20 07:47:55.007253', '2020-01-06', 0, 10, 10, 0, NULL, 0, 113, NULL, 2, 2, 2),
(112, '2020-06-20 07:47:55.016261', '2020-06-20 07:47:55.016261', '2020-01-06', 0, 6, 6, 0, NULL, 0, 114, NULL, 2, 2, 2),
(113, '2020-06-20 07:47:55.027226', '2020-06-20 07:47:55.027226', '2020-01-06', 0, 6, 6, 0, NULL, 0, 115, NULL, 2, 2, 2),
(114, '2020-06-20 07:47:55.039311', '2020-06-20 07:47:55.039311', '2020-01-06', 0, 6, 6, 0, NULL, 0, 116, NULL, 2, 2, 2),
(115, '2020-06-20 07:47:55.052328', '2020-06-20 07:47:55.052328', '2020-01-06', 0, 4, 4, 0, NULL, 0, 117, NULL, 2, 2, 2),
(116, '2020-06-20 07:47:55.062056', '2020-06-20 07:47:55.062056', '2020-01-06', 0, 6, 6, 0, NULL, 0, 118, NULL, 2, 2, 2),
(117, '2020-06-20 07:47:55.072265', '2020-06-20 07:47:55.072265', '2020-01-06', 0, 6, 6, 0, NULL, 0, 119, NULL, 2, 2, 2),
(118, '2020-06-20 07:47:55.083278', '2020-06-20 07:47:55.083278', '2020-01-06', 0, 6, 6, 0, NULL, 0, 120, NULL, 2, 2, 2),
(119, '2020-06-20 07:47:55.093288', '2020-06-20 07:47:55.093288', '2020-01-06', 0, 50, 50, 0, NULL, 0, 121, NULL, 2, 2, 2),
(120, '2020-06-20 07:47:55.103297', '2020-06-20 07:47:55.103297', '2020-01-06', 0, 21, 21, 0, NULL, 0, 122, NULL, 2, 2, 2),
(121, '2020-06-20 07:47:55.113307', '2020-06-20 07:47:55.113307', '2020-01-06', 0, 80, 80, 0, NULL, 0, 123, NULL, 2, 2, 2),
(122, '2020-06-20 07:47:55.124317', '2020-06-20 07:47:55.124317', '2020-01-06', 0, 45, 45, 0, NULL, 0, 124, NULL, 2, 2, 2),
(123, '2020-06-20 07:47:55.135315', '2020-06-20 07:47:55.135315', '2020-01-06', 0, 43, 43, 0, NULL, 0, 125, NULL, 2, 2, 2),
(124, '2020-06-20 07:47:55.145388', '2020-06-20 07:47:55.145388', '2020-01-06', 0, 1, 1, 0, NULL, 0, 126, NULL, 2, 2, 2),
(125, '2020-06-20 07:47:55.156034', '2020-06-20 07:47:55.156034', '2020-01-06', 0, 5, 5, 0, NULL, 0, 127, NULL, 2, 2, 2),
(126, '2020-06-20 07:47:55.165042', '2020-06-20 07:47:55.166044', '2020-01-06', 0, 5, 5, 0, NULL, 0, 128, NULL, 2, 2, 2),
(127, '2020-06-20 07:47:55.176130', '2020-06-20 07:47:55.176130', '2020-01-06', 0, 2, 2, 0, NULL, 0, 129, NULL, 2, 2, 2),
(128, '2020-06-20 07:47:55.186140', '2020-06-20 07:47:55.186140', '2020-01-06', 0, 1, 1, 0, NULL, 0, 130, NULL, 2, 2, 2),
(129, '2020-06-20 07:47:55.195800', '2020-06-20 07:47:55.195800', '2020-01-06', 0, 50, 50, 0, NULL, 0, 131, NULL, 2, 2, 2),
(130, '2020-06-20 07:47:55.205167', '2020-06-20 07:47:55.205167', '2020-01-06', 0, 100, 100, 0, NULL, 0, 132, NULL, 2, 2, 2),
(131, '2020-06-20 07:47:55.215218', '2020-06-20 07:47:55.215218', '2020-01-06', 0, 24, 24, 0, NULL, 0, 1, NULL, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_app_broken_item`
--

CREATE TABLE `product_app_broken_item` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `size` int(10) UNSIGNED NOT NULL CHECK (`size` >= 0),
  `description` longtext DEFAULT NULL,
  `damage_paid` tinyint(1) NOT NULL,
  `money_transfer_status` varchar(30) NOT NULL,
  `basic_asset_id` int(11) NOT NULL,
  `commodity_id` int(11) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `money_transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_type_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_app_commodity`
--

CREATE TABLE `product_app_commodity` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `unit_size` int(10) UNSIGNED NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `size_type_id` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_app_commodity`
--

INSERT INTO `product_app_commodity` (`id`, `created_at`, `name`, `description`, `unit_size`, `created_by_id`, `size_type_id`, `image`) VALUES
(1, '2021-07-03 01:53:44.971841', 'Eden 1000ml', 'Eden 1000ml', 1000, NULL, 2, 'commodity-images/eden-0.75l-7.5.png'),
(2, '2021-07-03 01:54:04.306093', 'Velvet 1000ml', 'Velvet 1000ml', 1000, NULL, 2, 'commodity-images/velvet-1l-8.5_l.png'),
(3, '2021-07-03 01:54:33.868432', 'Evok 750ml', 'Evok 750ml', 750, NULL, 2, 'commodity-images/download.jpg'),
(4, '2021-07-03 01:55:04.261965', 'Smirnoff red 1000ml', 'Smirnoff red 1000ml', 1000, NULL, 2, 'commodity-images/70778-smirnoff-red-label-vodka-375-prozent-vol.jpg'),
(5, '2021-07-03 01:55:22.169642', 'Finlandia 1000ml', 'Finlandia 1000ml', 1000, NULL, 2, 'commodity-images/vodka-of-finland-400-2_1.jpg'),
(6, '2021-07-03 01:56:18.315318', 'Beluga 1000ml', 'Beluga 1000ml', 1000, NULL, 2, 'commodity-images/download_1.jpg'),
(7, '2021-07-03 01:57:22.210733', 'Belvedere 700ml', 'Belvedere 700ml', 700, NULL, 2, 'commodity-images/belvedere-vodka-688155_e.jpg'),
(8, '2021-07-03 01:58:07.065170', 'Ciroc 750ml', 'Ciroc 750ml', 750, NULL, 2, 'commodity-images/download_2.jpg'),
(9, '2021-07-03 01:59:01.529232', 'Hennessy V.S 700ml', 'Hennessy V.S 700ml', 700, NULL, 2, 'commodity-images/18291_Hennessy-VS-07L-40-Vol_4.jpg'),
(10, '2021-07-03 01:59:32.615001', 'Hennessy V.S.O.P 700ml', 'Hennessy V.S.O.P 700ml', 700, NULL, 2, 'commodity-images/download_3.jpg'),
(11, '2021-07-03 02:00:15.797894', 'Wild Turkey 1000ml', 'Wild Turkey 1000ml', 1000, NULL, 2, 'commodity-images/ci-wild-turkey-bourbon-fe554d942f449305.jpeg'),
(12, '2021-07-03 02:01:44.745254', 'Jameson 1000ml', 'Jameson 1000ml', 1000, NULL, 2, 'commodity-images/4006-jameson.png'),
(13, '2021-07-03 02:02:24.069881', 'Jack Daniel\'s 1000ml', 'Jack Daniel\'s 1000ml', 1000, NULL, 2, 'commodity-images/jack-daniels-old-no7-400_2.jpg'),
(14, '2021-07-03 02:03:26.453739', 'Jack Daniel\'s Honey 700ml', 'Jack Daniel\'s Honey 700ml', 700, NULL, 2, 'commodity-images/2087207030007_1_default_default.jpg'),
(15, '2021-07-03 02:04:34.303892', 'Jack Daniel\'s Fire 750ml', 'Jack Daniel\'s Fire 750ml', 750, NULL, 2, 'commodity-images/100430_jack_daniels_tennesee_fire_700.jpg'),
(16, '2021-07-03 02:06:15.097965', 'Glenmorangie Original 700ml', 'Glenmorangie Original 700ml', 700, NULL, 2, 'commodity-images/99800_glenmorangie_original_700_ohne_gp.jpg'),
(17, '2021-07-03 02:06:58.118774', 'Ballantine\'s Finest 1000ml', 'Ballantine\'s Finest 1000ml', 1000, NULL, 2, 'commodity-images/ballantines-finest_1.jpg'),
(18, '2021-07-03 02:09:51.222963', 'Johnnie Walker Red 1000ml', 'Johnnie Walker Red 1000ml', 1000, NULL, 2, 'commodity-images/Johnnie-Walker-Red-Label.png'),
(19, '2021-07-03 02:11:07.183659', 'Bacardi Superior 1000ml', 'Bacardi Superior 1000ml', 1000, NULL, 2, 'commodity-images/00-02-111-01_1.jpg'),
(20, '2021-07-03 02:13:04.416762', 'Captain Morgan Spiced Gold 1000ml', 'Captain Morgan Spiced Gold 1000ml', 1000, NULL, 2, 'commodity-images/cpt-morgan-spiced-gold-2450-750ml.jpg'),
(21, '2021-07-03 02:14:42.956826', 'Sierra Silver 700ml', 'Sierra Silver 700ml', 1000, NULL, 2, 'commodity-images/sierra-tequila-silver-700ml.jpg'),
(22, '2021-07-03 02:14:59.739584', 'Sierra Gold 700ml', 'Sierra Gold 700ml', 1000, NULL, 2, 'commodity-images/SIERRA-TEQUILA-GOLD-1L.jpg'),
(23, '2021-07-03 02:17:24.378656', 'Pepe Lopez Gold 1000ml', 'Pepe Lopez Gold 1000ml', 1000, NULL, 2, 'commodity-images/0000428.jpeg'),
(24, '2021-07-03 02:18:16.811055', 'Kahlua 1000ml', 'Kahlua 1000ml', 1000, NULL, 2, 'commodity-images/download_6.jpg'),
(25, '2021-07-03 02:18:49.970792', 'Bailey\'s 1000ml', 'Bailey\'s 1000ml', 1000, NULL, 2, 'commodity-images/baileys-original-irish-cream-700ml.jpg'),
(26, '2021-07-03 02:19:41.586443', 'Jagermaister 1000ml', 'Jagermaister 1000ml', 1000, NULL, 2, 'commodity-images/jagermeister-100-cl-m.jpg'),
(27, '2021-07-03 02:22:53.500601', 'Sambuca 1000ml', 'Sambuca 1000ml', 1000, NULL, 2, ''),
(28, '2021-07-03 02:23:45.060597', 'AbsenthXenta 1000ml', 'AbsenthXenta 1000ml', 1000, NULL, 2, 'commodity-images/10414581.jpg'),
(29, '2021-07-03 02:24:35.626812', 'Gordon\'s 1000ml', 'Gordon\'s 1000ml', 1000, NULL, 2, 'commodity-images/gordons-london-dry-gin-3750-1l_1.jpg'),
(30, '2021-07-03 02:26:22.474264', 'Campari 700ml', 'Campari 700ml', 700, NULL, 2, 'commodity-images/00-02-111-01_1_led7RKz.jpg'),
(31, '2021-07-03 02:26:53.146232', 'Aperol 700ml', 'Aperol 700ml', 700, NULL, 2, 'commodity-images/aperol-aperitivo-700ml_grande.jpg'),
(32, '2021-07-03 02:29:35.114738', 'Martini Bianco 1000ml', 'Martini Bianco 1000ml', 1000, NULL, 2, 'commodity-images/cq5dam.web.1280.1280.jpeg'),
(33, '2021-07-03 02:31:09.730731', 'Martini Rosso 1000ml', 'Martini Rosso 1000ml', 1000, NULL, 2, 'commodity-images/ME089.png'),
(34, '2021-07-03 02:32:29.017285', 'Martini Extra Dry 1000ml', 'Martini Extra Dry 1000ml', 1000, NULL, 2, 'commodity-images/martini-extra-dry-vermouth-75cl-15-abv_temp.jpg'),
(35, '2021-07-03 04:22:09.972264', 'Altos del Plata Red 750ml', 'Altos del Plata Red 750ml', 750, NULL, 2, 'commodity-images/terrazas-de-los-andes-altos-del-plata-malbec.jpg'),
(36, '2021-07-03 04:22:50.490597', 'Domaine La Baume Red 750ml', 'Domaine La Baume Red 750ml', 750, NULL, 2, 'commodity-images/8127_la_baume_cabsauv_2019_1.png'),
(37, '2021-07-03 04:39:08.967630', 'Silver Gold 700ml', 'Silver Gold 700ml', 700, NULL, 2, ''),
(38, '2021-07-06 07:27:10.182237', 'Cointreau 1000ml', 'Cointreau 1000ml', 1000, NULL, 2, ''),
(40, '2021-07-06 08:27:46.576989', 'Coca cola', 'cocktails commodity', 1, NULL, 1, ''),
(41, '2021-07-06 08:28:08.749107', 'Sprite', 'cocktails commodity', 1, NULL, 1, ''),
(42, '2021-07-06 08:35:28.305595', 'Lemon Juice 750ml', 'Lemon Juice 750ml', 750, NULL, 2, ''),
(43, '2021-07-06 08:48:28.913984', 'Triple sec Syrop 700ml', 'Cocktails commodity', 700, NULL, 2, ''),
(44, '2021-07-06 08:49:26.726087', 'Cucumber Syrop 700ml', 'Cocktails commodity', 700, NULL, 2, ''),
(45, '2021-07-06 08:56:00.803379', 'Cane sugar 700ml', 'Cocktails commodity', 700, NULL, 2, ''),
(46, '2021-07-06 08:57:14.623709', 'Blue Curacao syrop 700ml', 'Cocktails commodity', 700, NULL, 2, ''),
(47, '2021-07-06 10:49:14.416565', 'Soda', 'Cocktails commodity', 1, NULL, 1, ''),
(48, '2021-07-24 12:39:35.472964', 'Altos del Plata White 750ml', 'Altos del Plata White 750ml', 750, NULL, 2, 'commodity-images/product988.jpg'),
(49, '2021-07-24 12:41:14.240800', 'Domaine La Baume White 750ml', 'Domaine La Baume White 750ml', 750, NULL, 2, 'commodity-images/8126_la_baume_sauv_blanc_2019.png'),
(50, '2021-07-24 12:43:14.519335', 'Louis Eschenauer Red 750ml', 'Louis Eschenauer Red 750ml', 750, NULL, 2, 'commodity-images/8036_bordeaux_louis_eschenauer_075.png'),
(51, '2021-07-24 12:44:52.738295', 'Louis Eschenauer White 750ml', 'Louis Eschenauer White 750ml', 750, NULL, 2, 'commodity-images/Louis_Eschenauer_Bordeaux_white.png'),
(52, '2021-07-27 05:40:10.602095', 'Juice apple 1000ml', 'Juice apple 1000ml', 1000, NULL, 2, ''),
(53, '2021-07-27 05:40:37.429630', 'Juice mango 1500ml', 'Juice mango 1500ml', 1500, NULL, 2, ''),
(54, '2021-07-27 05:40:58.574839', 'Juice cranberry 1000ml', 'Juice cranberry 1000ml', 1000, NULL, 2, ''),
(55, '2021-07-27 05:41:26.491436', 'Juice orange 1500ml', 'Juice orange 1500ml', 1500, NULL, 2, ''),
(56, '2021-07-27 05:45:41.520023', 'Juice Моя Семья 950ml', 'Juice Моя Семья 250ml', 950, NULL, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `product_app_commodity_categories`
--

CREATE TABLE `product_app_commodity_categories` (
  `id` int(11) NOT NULL,
  `commodity_id` int(11) NOT NULL,
  `commodity_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_app_commodity_categories`
--

INSERT INTO `product_app_commodity_categories` (`id`, `commodity_id`, `commodity_category_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21, 21, 1),
(22, 22, 1),
(23, 23, 1),
(24, 24, 1),
(25, 25, 1),
(26, 26, 1),
(27, 27, 1),
(28, 28, 1),
(29, 29, 1),
(30, 30, 1),
(31, 31, 1),
(32, 32, 1),
(33, 33, 1),
(34, 34, 1),
(35, 35, 1),
(36, 36, 1),
(37, 37, 1),
(38, 38, 1),
(40, 40, 6),
(41, 41, 6),
(42, 42, 6),
(43, 43, 6),
(44, 44, 6),
(45, 45, 6),
(46, 46, 6),
(47, 47, 6),
(48, 48, 1),
(49, 49, 1),
(50, 50, 1),
(51, 51, 1),
(52, 52, 6),
(53, 53, 6),
(54, 54, 6),
(55, 55, 6),
(56, 56, 6);

-- --------------------------------------------------------

--
-- Table structure for table `product_app_commodity_category`
--

CREATE TABLE `product_app_commodity_category` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_app_commodity_category`
--

INSERT INTO `product_app_commodity_category` (`id`, `created_at`, `name`, `description`, `created_by_id`, `parent_id`) VALUES
(1, '2021-07-03 01:41:12.257919', 'Alcohol gramm', 'Граммаар гарч буй архинууд', 1, NULL),
(6, '2021-07-06 08:27:10.620398', 'Cocktails commodity', 'Cocktails commodity', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_app_division_commodity_categories`
--

CREATE TABLE `product_app_division_commodity_categories` (
  `id` int(11) NOT NULL,
  `commodity_category_id` int(11) NOT NULL,
  `division_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_app_division_commodity_categories`
--

INSERT INTO `product_app_division_commodity_categories` (`id`, `commodity_category_id`, `division_id`) VALUES
(1, 1, 5),
(6, 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_app_ingredient`
--

CREATE TABLE `product_app_ingredient` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `size` int(10) UNSIGNED NOT NULL CHECK (`size` >= 0),
  `commodity_id` int(11) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `size_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_app_ingredient`
--

INSERT INTO `product_app_ingredient` (`id`, `created_at`, `size`, `commodity_id`, `created_by_id`, `product_id`, `size_type_id`) VALUES
(1, '2021-07-03 04:25:45.121161', 50, 1, NULL, 109, 2),
(2, '2021-07-03 04:26:11.837847', 50, 2, NULL, 111, 2),
(3, '2021-07-03 04:26:28.629522', 50, 3, NULL, 113, 2),
(4, '2021-07-03 04:27:03.154991', 50, 4, NULL, 115, 2),
(5, '2021-07-03 04:27:20.175942', 50, 5, NULL, 117, 2),
(6, '2021-07-03 04:27:58.073096', 50, 6, NULL, 119, 2),
(7, '2021-07-03 04:28:19.590388', 50, 7, NULL, 121, 2),
(8, '2021-07-03 04:28:32.344332', 50, 8, NULL, 123, 2),
(9, '2021-07-03 04:28:48.366503', 50, 9, NULL, 125, 2),
(10, '2021-07-03 04:29:10.791875', 50, 10, NULL, 127, 2),
(11, '2021-07-03 04:29:27.667903', 50, 11, NULL, 130, 2),
(12, '2021-07-03 04:29:42.062220', 50, 12, NULL, 132, 2),
(13, '2021-07-03 04:30:10.298978', 50, 13, NULL, 134, 2),
(14, '2021-07-03 04:30:57.371292', 50, 14, NULL, 136, 2),
(15, '2021-07-03 04:31:20.939133', 50, 15, NULL, 138, 2),
(16, '2021-07-03 04:32:06.467575', 50, 16, NULL, 142, 2),
(17, '2021-07-03 04:32:30.623301', 50, 17, NULL, 144, 2),
(18, '2021-07-03 04:33:05.025966', 50, 18, NULL, 150, 2),
(19, '2021-07-03 04:34:17.869557', 50, 19, NULL, 153, 2),
(20, '2021-07-03 04:34:40.399876', 50, 20, NULL, 155, 2),
(21, '2021-07-03 04:35:28.359606', 50, 21, NULL, 159, 2),
(22, '2021-07-03 04:39:39.810090', 50, 22, NULL, 161, 2),
(23, '2021-07-03 04:39:57.110079', 50, 23, NULL, 163, 2),
(24, '2021-07-03 04:40:18.131948', 50, 24, NULL, 165, 2),
(25, '2021-07-03 04:40:40.191904', 50, 25, NULL, 167, 2),
(26, '2021-07-03 04:41:20.788542', 50, 26, NULL, 169, 2),
(27, '2021-07-03 04:41:51.042846', 50, 27, NULL, 171, 2),
(28, '2021-07-03 04:43:09.575259', 50, 28, NULL, 173, 2),
(29, '2021-07-03 04:43:30.296517', 50, 29, NULL, 175, 2),
(30, '2021-07-03 04:44:00.947347', 50, 30, NULL, 177, 2),
(31, '2021-07-03 04:44:21.704112', 50, 31, NULL, 179, 2),
(32, '2021-07-03 04:44:57.004384', 50, 32, NULL, 181, 2),
(33, '2021-07-03 04:47:56.425997', 50, 33, NULL, 198, 2),
(34, '2021-07-03 04:48:21.124131', 50, 34, NULL, 199, 2),
(35, '2021-07-06 08:18:53.855627', 20, 4, NULL, 201, 2),
(36, '2021-07-06 08:19:48.393323', 20, 19, NULL, 201, 2),
(37, '2021-07-06 08:21:59.904554', 20, 22, NULL, 201, 2),
(38, '2021-07-06 08:22:52.024246', 20, 29, NULL, 201, 2),
(40, '2021-07-06 08:29:32.013454', 20, 13, NULL, 201, 2),
(41, '2021-07-06 08:36:17.048674', 15, 42, NULL, 201, 2),
(42, '2021-07-06 09:24:11.347302', 20, 4, NULL, 202, 2),
(43, '2021-07-06 09:28:37.670813', 20, 19, NULL, 202, 2),
(44, '2021-07-06 09:29:44.384217', 20, 22, NULL, 202, 2),
(45, '2021-07-06 09:30:13.686716', 20, 29, NULL, 202, 2),
(49, '2021-07-06 09:32:31.397221', 50, 19, NULL, 203, 2),
(50, '2021-07-06 09:32:53.424763', 20, 45, NULL, 203, 2),
(52, '2021-07-06 09:34:19.850915', 50, 4, NULL, 204, 2),
(55, '2021-07-06 10:47:08.537944', 60, 19, NULL, 205, 2),
(56, '2021-07-06 10:48:05.743244', 15, 42, NULL, 205, 2),
(58, '2021-07-06 10:56:27.299333', 50, 19, NULL, 206, 2),
(59, '2021-07-06 13:20:20.367405', 15, 42, NULL, 206, 2),
(61, '2021-07-20 09:56:34.565066', 60, 19, NULL, 224, 2),
(62, '2021-07-20 09:57:10.288012', 15, 42, NULL, 224, 2),
(64, '2021-07-20 09:58:25.007981', 60, 19, NULL, 225, 2),
(65, '2021-07-20 09:58:55.014000', 15, 42, NULL, 225, 2),
(67, '2021-07-20 10:01:07.980713', 30, 27, NULL, 207, 2),
(68, '2021-07-20 10:01:41.213529', 15, 25, NULL, 207, 2),
(69, '2021-07-20 10:02:21.709883', 10, 28, NULL, 207, 2),
(70, '2021-07-20 10:03:11.886286', 30, 4, NULL, 208, 2),
(71, '2021-07-20 10:03:39.526791', 20, 25, NULL, 208, 2),
(72, '2021-07-20 10:04:40.622915', 20, 24, NULL, 211, 2),
(73, '2021-07-20 10:05:11.873096', 20, 25, NULL, 211, 2),
(74, '2021-07-20 10:05:56.727480', 20, 38, NULL, 211, 2),
(75, '2021-07-20 10:07:04.267713', 20, 24, NULL, 210, 2),
(76, '2021-07-20 10:07:34.022825', 20, 25, NULL, 210, 2),
(77, '2021-07-20 10:09:46.795848', 30, 29, NULL, 212, 2),
(78, '2021-07-20 10:10:20.356777', 30, 30, NULL, 212, 2),
(79, '2021-07-20 10:11:19.935995', 30, 33, NULL, 212, 2),
(80, '2021-07-20 10:11:50.492067', 30, 4, NULL, 213, 2),
(81, '2021-07-20 10:12:14.697002', 20, 38, NULL, 213, 2),
(82, '2021-07-20 10:12:35.345517', 15, 42, NULL, 213, 2),
(83, '2021-07-20 10:13:40.731912', 60, 13, NULL, 214, 2),
(84, '2021-07-20 10:17:49.927923', 40, 29, NULL, 215, 2),
(85, '2021-07-20 10:18:13.824791', 30, 34, NULL, 215, 2),
(86, '2021-07-20 10:18:34.821215', 15, 42, NULL, 215, 2),
(87, '2021-07-20 10:25:21.813587', 60, 13, NULL, 216, 2),
(88, '2021-07-20 10:25:55.727019', 15, 42, NULL, 216, 2),
(89, '2021-07-20 11:11:18.987463', 50, 4, NULL, 217, 2),
(90, '2021-07-20 11:11:44.413557', 15, 42, NULL, 217, 2),
(92, '2021-07-20 11:41:03.830360', 50, 4, NULL, 218, 2),
(93, '2021-07-20 11:42:22.454802', 60, 19, NULL, 219, 2),
(94, '2021-07-20 11:46:56.015260', 60, 22, NULL, 220, 2),
(95, '2021-07-20 11:47:20.313372', 15, 42, NULL, 220, 2),
(96, '2021-07-20 11:48:00.004185', 20, 38, NULL, 220, 2),
(97, '2021-07-20 11:49:08.422058', 60, 20, NULL, 221, 2),
(98, '2021-07-20 11:49:43.045733', 15, 42, NULL, 221, 2),
(99, '2021-07-20 11:50:25.795824', 60, 4, NULL, 222, 2),
(100, '2021-07-20 11:50:48.563274', 15, 42, NULL, 222, 2),
(101, '2021-07-24 12:46:10.593673', 125, 35, NULL, 188, 2),
(102, '2021-07-24 12:46:40.921313', 125, 48, NULL, 231, 2),
(103, '2021-07-24 12:47:04.205341', 125, 51, NULL, 228, 2),
(104, '2021-07-24 12:47:21.164960', 125, 50, NULL, 229, 2),
(105, '2021-07-24 12:47:44.619768', 125, 49, NULL, 230, 2),
(106, '2021-07-24 12:48:02.615951', 125, 36, NULL, 189, 2),
(107, '2021-07-27 05:46:39.428335', 250, 53, NULL, 240, 2),
(108, '2021-07-27 05:46:58.592431', 250, 52, NULL, 241, 2),
(109, '2021-07-27 05:47:24.442910', 250, 55, NULL, 242, 2),
(110, '2021-07-27 05:47:59.292903', 250, 54, NULL, 243, 2),
(111, '2021-07-27 05:50:34.667790', 250, 56, NULL, 89, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_app_ingredient_product`
--

CREATE TABLE `product_app_ingredient_product` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `size` int(10) UNSIGNED NOT NULL CHECK (`size` >= 0),
  `commodity_id` int(11) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_app_ingredient_product`
--

INSERT INTO `product_app_ingredient_product` (`id`, `created_at`, `size`, `commodity_id`, `created_by_id`, `product_id`) VALUES
(1, '2021-07-24 11:42:52.951267', 1, 86, NULL, 217),
(2, '2021-07-24 11:43:29.390060', 1, 86, NULL, 204),
(3, '2021-07-24 11:43:54.645880', 1, 86, NULL, 202),
(4, '2021-07-24 11:43:55.132684', 1, 86, NULL, 202),
(5, '2021-07-24 11:44:25.172209', 1, 87, NULL, 224),
(6, '2021-07-24 11:44:38.752580', 1, 87, NULL, 225),
(7, '2021-07-24 11:46:05.028011', 1, 87, NULL, 206),
(8, '2021-07-24 11:46:47.807852', 1, 87, NULL, 205),
(9, '2021-07-24 11:47:24.646477', 1, 84, NULL, 203),
(10, '2021-07-24 11:48:04.600763', 1, 84, NULL, 201);

-- --------------------------------------------------------

--
-- Table structure for table `product_app_item_balance`
--

CREATE TABLE `product_app_item_balance` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL CHECK (`quantity` >= 0),
  `size` int(10) UNSIGNED DEFAULT NULL CHECK (`size` >= 0),
  `client_id` int(11) DEFAULT NULL,
  `commodity_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_app_item_balance`
--

INSERT INTO `product_app_item_balance` (`id`, `created_at`, `updated_at`, `quantity`, `size`, `client_id`, `commodity_id`, `created_by_id`, `division_id`, `product_id`, `updated_by_id`, `user_id`) VALUES
(1, '2021-07-24 11:56:28.258091', '2021-07-24 11:56:28.258091', 1, NULL, 19, NULL, 2, 5, 122, NULL, NULL),
(2, '2021-07-24 11:56:28.528094', '2021-08-09 03:41:36.495290', 1, NULL, 19, NULL, 2, 5, 116, 6, NULL),
(3, '2021-07-24 11:56:28.702101', '2021-07-24 11:56:28.702101', 1, NULL, 19, NULL, 2, 5, 162, NULL, NULL),
(4, '2021-07-24 11:56:28.792101', '2021-07-24 11:56:28.792101', 0, NULL, 19, NULL, 2, 5, 160, NULL, NULL),
(5, '2021-07-24 11:56:28.892101', '2021-07-24 11:56:28.892101', 1, NULL, 19, NULL, 2, 5, 128, NULL, NULL),
(6, '2021-07-24 11:56:28.972101', '2021-08-11 04:45:00.006052', 1, NULL, 19, NULL, 2, 5, 124, 6, NULL),
(7, '2021-07-24 11:56:29.524104', '2021-08-11 04:44:59.694051', 1, NULL, 19, NULL, 2, 5, 133, 2, NULL),
(8, '2021-07-24 11:56:29.714104', '2021-07-24 11:56:29.714104', 1, NULL, 19, NULL, 2, 5, 139, NULL, NULL),
(9, '2021-07-24 11:56:29.814104', '2021-07-24 11:56:29.814104', 1, NULL, 19, NULL, 2, 5, 141, NULL, NULL),
(10, '2021-07-24 11:56:29.884104', '2021-07-24 11:56:29.884104', 1, NULL, 19, NULL, 2, 5, 149, NULL, NULL),
(11, '2021-07-24 11:56:29.944105', '2021-08-09 03:39:44.653417', 1, NULL, 19, NULL, 2, 5, 131, 2, NULL),
(12, '2021-07-24 11:56:30.174105', '2021-07-28 11:00:12.181823', 0, NULL, 19, NULL, 2, 5, 129, 6, NULL),
(13, '2021-07-24 11:56:30.354105', '2021-07-24 11:56:30.354105', 1, NULL, 19, NULL, 2, 5, 145, NULL, NULL),
(14, '2021-07-24 11:56:30.484105', '2021-08-13 02:27:21.954988', 0, NULL, 19, NULL, 2, 5, 108, 2, NULL),
(15, '2021-07-24 11:56:30.584105', '2021-08-07 05:55:00.535328', 1, NULL, 19, NULL, 2, 5, 110, 2, NULL),
(16, '2021-07-24 11:56:30.664106', '2021-07-30 08:34:07.163300', 1, NULL, 19, NULL, 2, 5, 112, 2, NULL),
(17, '2021-07-24 11:56:30.744106', '2023-02-09 13:06:48.931396', 17, NULL, 19, NULL, 2, 5, 86, 1, NULL),
(18, '2021-07-24 11:56:30.824106', '2023-02-09 13:07:56.994695', 3, NULL, 19, NULL, 2, 5, 84, 1, NULL),
(19, '2021-07-24 11:56:30.894106', '2022-11-07 05:35:54.722986', 32, NULL, 19, NULL, 2, 5, 88, 1, NULL),
(20, '2021-07-24 11:56:30.974106', '2021-08-07 05:55:00.857346', 0, NULL, 19, NULL, 2, 5, 193, 2, NULL),
(21, '2021-07-24 11:56:31.114106', '2023-02-09 13:06:48.924425', 52, NULL, 19, NULL, 2, 5, 85, 1, NULL),
(22, '2021-07-24 11:56:31.204106', '2021-08-12 08:25:01.515973', 0, NULL, 19, NULL, 2, 5, 87, 2, NULL),
(23, '2021-07-24 11:56:31.284106', '2023-02-09 13:22:48.996858', 78, NULL, 19, NULL, 2, 5, 81, 1, NULL),
(24, '2021-07-24 11:56:31.364107', '2021-07-24 11:56:31.364107', 0, NULL, 19, NULL, 2, 5, 89, NULL, NULL),
(25, '2021-07-24 11:57:41.778097', '2021-08-13 02:35:49.829480', 82, NULL, 19, NULL, 2, 5, 101, 2, NULL),
(26, '2021-07-24 11:57:41.887104', '2023-02-09 10:27:27.506840', 0, NULL, 19, NULL, 2, 5, 103, 1, NULL),
(27, '2021-07-24 12:05:28.541820', '2021-08-07 05:38:40.462271', 0, NULL, 16, NULL, 2, 5, 103, NULL, NULL),
(28, '2021-07-24 12:05:28.760220', '2021-08-11 11:43:56.625905', 40, NULL, 16, NULL, 2, 5, 101, NULL, NULL),
(29, '2021-07-24 12:05:29.134621', '2021-08-11 04:45:00.084052', 1, NULL, 16, NULL, 2, 5, 108, NULL, NULL),
(30, '2021-07-24 12:05:29.228221', '2021-08-11 04:52:54.278085', 144, NULL, 16, NULL, 2, 5, 84, NULL, NULL),
(31, '2021-07-24 12:05:29.290621', '2021-08-07 05:42:13.734469', 120, NULL, 16, NULL, 2, 5, 87, NULL, NULL),
(32, '2021-07-24 12:05:29.384221', '2021-07-28 03:29:04.749623', 0, NULL, 16, NULL, 2, 5, 88, NULL, NULL),
(33, '2021-07-24 12:05:29.478821', '2021-08-11 04:52:54.418485', 84, NULL, 16, NULL, 2, 5, 81, NULL, NULL),
(34, '2021-07-24 12:05:29.572422', '2021-08-11 04:44:59.943652', 1, NULL, 16, NULL, 2, 5, 124, NULL, NULL),
(35, '2021-07-24 12:05:29.650422', '2021-07-30 08:34:07.413314', 2, NULL, 16, NULL, 2, 5, 126, NULL, NULL),
(36, '2021-07-24 12:05:29.728422', '2021-08-11 04:50:38.323846', 3, NULL, 16, NULL, 2, 5, 160, NULL, NULL),
(37, '2021-07-24 12:05:29.792822', '2021-08-07 05:42:14.010485', 1, NULL, 16, NULL, 2, 5, 149, NULL, NULL),
(38, '2021-07-24 12:05:29.921424', '2021-08-11 04:44:59.647251', 2, NULL, 16, NULL, 2, 5, 133, NULL, NULL),
(39, '2021-07-24 12:05:30.093024', '2021-08-09 03:41:36.154271', 1, NULL, 16, NULL, 2, 5, 116, NULL, NULL),
(40, '2021-07-24 12:05:30.202225', '2021-07-24 12:05:30.202225', 12, NULL, 16, NULL, 2, 5, 82, NULL, NULL),
(41, '2021-07-24 12:05:30.295825', '2021-07-29 05:58:47.406455', 2, NULL, 16, NULL, 2, 5, 110, NULL, NULL),
(42, '2021-07-24 12:05:30.373825', '2021-08-07 05:42:14.336503', 0, NULL, 16, NULL, 2, 5, 112, NULL, NULL),
(43, '2021-07-24 12:06:05.589817', '2021-08-11 04:44:59.850052', 7, NULL, 19, NULL, 2, 5, 227, 8, NULL),
(44, '2021-07-24 12:06:23.074150', '2021-08-11 04:44:59.818852', 29, NULL, 16, NULL, 2, 5, 227, NULL, NULL),
(45, '2021-07-24 12:20:22.520110', '2021-08-09 03:42:31.266125', NULL, 650, 19, 5, 2, 5, NULL, 6, NULL),
(46, '2021-07-24 12:20:22.610715', '2021-08-13 02:35:49.813880', NULL, 480, 19, 4, 2, 5, NULL, 2, NULL),
(47, '2021-07-24 12:20:23.024738', '2021-08-12 08:25:01.254958', NULL, 470, 19, 19, 2, 5, NULL, 2, NULL),
(48, '2021-07-24 12:20:23.245751', '2021-08-10 14:41:48.676136', NULL, 450, 19, 29, 2, 5, NULL, 2, NULL),
(49, '2021-07-24 12:20:23.463962', '2021-08-12 08:28:19.629304', NULL, 760, 19, 20, 2, 5, NULL, 2, NULL),
(50, '2021-07-24 12:20:23.556967', '2021-08-09 03:37:34.628235', NULL, 750, 19, 24, 2, 5, NULL, 2, NULL),
(51, '2021-07-24 12:20:23.653973', '2021-08-10 14:47:03.197632', NULL, 120, 19, 38, 2, 5, NULL, 2, NULL),
(52, '2021-07-24 12:20:24.651017', '2021-07-24 12:20:24.651017', NULL, 800, 19, 30, 2, 5, NULL, NULL, NULL),
(53, '2021-07-24 12:20:24.805219', '2021-07-27 14:09:27.936766', NULL, 0, 19, 21, 2, 5, NULL, 2, NULL),
(54, '2021-07-24 12:20:24.969225', '2021-08-07 06:05:17.916557', NULL, 150, 19, 27, 2, 5, NULL, NULL, NULL),
(55, '2021-07-24 12:20:25.086029', '2021-08-07 06:05:18.502590', NULL, 250, 19, 28, 2, 5, NULL, 2, NULL),
(56, '2021-07-24 12:20:25.202035', '2021-08-12 08:08:53.162586', NULL, 300, 19, 25, 2, 5, NULL, 2, NULL),
(57, '2021-07-24 12:20:25.280035', '2021-07-24 12:20:25.280035', NULL, 700, 19, 31, 2, 5, NULL, NULL, NULL),
(58, '2021-07-24 12:20:25.560836', '2021-07-24 12:20:25.560836', NULL, 650, 19, 10, 2, 5, NULL, NULL, NULL),
(59, '2021-07-24 12:20:25.816437', '2021-08-12 08:41:21.667034', NULL, 540, 19, 13, 2, 5, NULL, 2, NULL),
(60, '2021-07-24 12:20:26.159637', '2021-07-24 12:20:26.159637', NULL, 400, 19, 15, 2, 5, NULL, NULL, NULL),
(61, '2021-07-24 12:20:26.233439', '2021-07-24 12:20:26.233439', NULL, 50, 19, 16, 2, 5, NULL, NULL, NULL),
(62, '2021-07-24 12:20:26.327039', '2021-08-13 02:32:33.237935', NULL, 800, 19, 18, 2, 5, NULL, 2, NULL),
(63, '2021-07-24 12:20:26.420639', '2021-08-12 04:57:59.096363', NULL, 650, 19, 26, 2, 5, NULL, 2, NULL),
(64, '2021-07-24 12:20:26.514239', '2021-08-12 08:28:19.795314', NULL, 645, 19, 42, 2, 5, NULL, 2, NULL),
(65, '2021-07-24 12:20:26.592239', '2021-08-12 08:08:53.320595', NULL, 250, 19, 1, 2, 5, NULL, 2, NULL),
(66, '2021-07-24 12:20:26.693241', '2021-08-08 14:54:34.642410', NULL, 100, 19, 3, 2, 5, NULL, 6, NULL),
(67, '2021-07-24 12:20:26.817847', '2021-07-24 12:20:26.817847', NULL, 600, 19, 32, 2, 5, NULL, NULL, NULL),
(68, '2021-07-24 12:20:27.085449', '2021-08-09 03:37:34.726240', NULL, 1020, 19, 34, 2, 5, NULL, NULL, NULL),
(69, '2021-07-24 12:50:28.480316', '2021-08-12 08:23:20.033168', NULL, 125, 19, 50, 2, 5, NULL, 2, NULL),
(70, '2021-07-24 12:50:28.963917', '2021-08-07 06:05:19.158628', NULL, 0, 19, 51, 2, 5, NULL, NULL, NULL),
(71, '2021-07-25 05:24:02.642148', '2021-07-25 05:24:02.642148', 7, NULL, 15, NULL, 2, 3, 88, NULL, NULL),
(72, '2021-07-25 05:24:02.902148', '2021-07-25 05:24:02.902148', 12, NULL, 15, NULL, 2, 3, 81, NULL, NULL),
(73, '2021-07-25 05:32:29.648890', '2021-07-25 05:32:29.648890', NULL, 11000, 16, 1, 2, 5, NULL, NULL, NULL),
(74, '2021-07-25 05:32:29.990893', '2021-08-11 04:46:41.921031', NULL, 0, 16, 18, 2, 5, NULL, NULL, NULL),
(75, '2021-07-25 05:32:30.510893', '2021-07-25 05:32:30.510893', NULL, 1000, 16, 13, 2, 5, NULL, NULL, NULL),
(76, '2021-07-25 05:32:30.610893', '2021-08-07 05:44:16.794508', NULL, 0, 16, 5, 2, 5, NULL, NULL, NULL),
(77, '2021-07-25 05:32:30.690893', '2021-08-07 09:05:31.792996', NULL, 2000, 16, 4, 2, 5, NULL, NULL, NULL),
(78, '2021-07-26 04:41:57.402071', '2021-08-11 01:53:51.895279', 72, NULL, 16, NULL, 2, 5, 86, NULL, NULL),
(79, '2021-07-26 05:53:31.636276', '2021-07-26 13:16:32.507223', 0, NULL, 19, NULL, 1, 5, 106, 2, NULL),
(80, '2021-07-26 05:59:52.603359', '2021-08-10 14:47:02.994831', NULL, 0, 19, 22, 1, 5, NULL, 2, NULL),
(81, '2021-07-26 10:05:06.181116', '2021-08-11 04:52:54.324885', 48, NULL, 17, NULL, 2, 3, 84, NULL, NULL),
(82, '2021-07-26 10:05:06.633517', '2021-08-11 04:52:54.496485', 36, NULL, 17, NULL, 2, 3, 81, NULL, NULL),
(83, '2021-07-26 13:09:23.008868', '2023-02-09 13:07:57.005883', 82, NULL, 19, NULL, 2, 5, 236, 1, NULL),
(84, '2021-07-26 13:10:09.216149', '2023-02-09 13:07:56.992267', 69, NULL, 19, NULL, 2, 5, 235, 1, NULL),
(85, '2021-07-27 05:52:55.178827', '2021-08-12 08:30:20.334208', NULL, 0, 19, 52, 1, 5, NULL, 2, NULL),
(86, '2021-07-27 05:52:55.451842', '2021-07-27 05:52:55.451842', NULL, 250, 19, 54, 1, 5, NULL, NULL, NULL),
(87, '2021-07-27 05:52:55.542847', '2021-08-08 14:45:06.015658', NULL, 0, 19, 53, 1, 5, NULL, 6, NULL),
(88, '2021-07-27 05:52:55.635853', '2021-08-12 08:34:11.980458', NULL, 1500, 19, 55, 1, 5, NULL, 2, NULL),
(89, '2021-07-27 05:52:56.711914', '2021-08-07 09:19:57.299718', NULL, 0, 19, 56, 1, 5, NULL, 2, NULL),
(90, '2021-07-27 14:25:23.915251', '2021-08-10 05:13:55.367343', 2, NULL, 19, NULL, 1, 5, 190, NULL, NULL),
(91, '2021-07-28 03:29:51.206505', '2021-08-11 04:49:01.915677', NULL, 1000, 16, 52, 2, 5, NULL, NULL, NULL),
(92, '2021-07-28 03:30:58.974024', '2021-08-11 04:49:02.024877', NULL, 1000, 16, 55, 2, 5, NULL, NULL, NULL),
(93, '2021-07-30 08:34:07.455316', '2021-08-12 08:22:16.765550', 0, NULL, 19, NULL, 2, 5, 126, 2, NULL),
(94, '2021-07-30 08:35:42.222737', '2021-08-11 04:49:01.806477', NULL, 750, 16, 42, 2, 5, NULL, NULL, NULL),
(95, '2021-08-07 09:03:28.427670', '2021-08-07 09:06:28.440487', 0, NULL, 16, NULL, 1, 5, 135, NULL, NULL),
(96, '2021-08-07 09:05:31.617986', '2021-08-07 09:09:02.733473', NULL, 1000, 16, 20, 1, 5, NULL, NULL, NULL),
(97, '2021-08-07 09:06:28.511491', '2021-08-07 09:06:28.511491', 1, NULL, 19, NULL, 1, 5, 135, NULL, NULL),
(98, '2021-08-09 03:32:42.171574', '2021-08-09 03:41:35.990262', 5, NULL, 16, NULL, 2, 5, 118, NULL, NULL),
(99, '2021-08-09 03:41:36.024263', '2021-08-09 03:41:36.024263', 1, NULL, 19, NULL, 2, 5, 118, NULL, NULL),
(100, '2021-08-10 05:13:54.946142', '2021-08-10 05:13:54.946142', 1, NULL, 19, NULL, 2, 5, 200, NULL, NULL),
(101, '2021-08-10 05:13:55.164543', '2021-08-10 05:13:55.164543', 1, NULL, 19, NULL, 2, 5, 187, NULL, NULL),
(102, '2021-08-10 05:13:55.258143', '2021-08-10 05:13:55.258143', 1, NULL, 19, NULL, 2, 5, 184, NULL, NULL),
(103, '2021-08-10 14:46:05.110120', '2021-08-10 14:46:30.858775', 1, NULL, 19, NULL, 2, 5, 82, 2, NULL),
(104, '2021-08-11 01:53:11.793523', '2021-08-12 08:22:16.819553', 44, NULL, 19, NULL, 2, 5, 257, 2, NULL),
(105, '2021-08-11 04:51:51.628375', '2021-08-11 04:51:51.628375', NULL, 700, 19, 37, 2, 5, NULL, NULL, NULL),
(106, '2021-08-11 11:39:44.111893', '2021-08-12 04:57:39.284329', NULL, 1000, 16, 26, 2, 5, NULL, NULL, NULL),
(107, '2021-08-11 11:41:22.434386', '2021-08-12 12:00:16.105248', 12, NULL, 16, NULL, 2, 5, 102, NULL, NULL),
(108, '2021-08-11 11:41:22.543392', '2021-08-11 11:43:56.991925', 80, NULL, 16, NULL, 2, 5, 104, NULL, NULL),
(109, '2021-08-11 11:41:22.667399', '2021-08-11 11:43:57.520956', 0, NULL, 16, NULL, 2, 5, 105, NULL, NULL),
(110, '2021-08-11 11:41:22.768405', '2021-08-11 11:43:57.351946', 40, NULL, 16, NULL, 2, 5, 107, NULL, NULL),
(111, '2021-08-11 11:43:57.034928', '2023-02-09 10:27:27.372855', 21, NULL, 19, NULL, 2, 5, 104, 1, NULL),
(112, '2021-08-11 11:43:57.250940', '2023-02-09 10:27:27.487667', 4, NULL, 19, NULL, 2, 5, 102, 1, NULL),
(113, '2021-08-11 11:43:57.391948', '2021-08-11 11:43:57.391948', 20, NULL, 19, NULL, 2, 5, 107, NULL, NULL),
(114, '2021-08-11 11:43:57.559958', '2021-08-11 11:43:57.559958', 60, NULL, 19, NULL, 2, 5, 105, NULL, NULL),
(115, '2021-08-11 11:48:10.590953', '2021-08-11 11:49:01.760742', 24, NULL, 16, NULL, 2, 5, 85, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_app_item_balance_log`
--

CREATE TABLE `product_app_item_balance_log` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL CHECK (`quantity` >= 0),
  `size` int(10) UNSIGNED DEFAULT NULL CHECK (`size` >= 0),
  `client_id` int(11) DEFAULT NULL,
  `commodity_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `shift_work_id` int(11) NOT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_app_item_balance_log`
--

INSERT INTO `product_app_item_balance_log` (`id`, `created_at`, `updated_at`, `quantity`, `size`, `client_id`, `commodity_id`, `created_by_id`, `division_id`, `product_id`, `shift_work_id`, `updated_by_id`, `user_id`) VALUES
(1, '2021-07-24 14:24:21.048274', '2021-07-24 14:24:21.048274', 1, NULL, 19, NULL, 1, 5, 122, 29, NULL, NULL),
(2, '2021-07-24 14:24:21.110674', '2021-07-24 14:24:21.110674', 1, NULL, 19, NULL, 1, 5, 116, 29, NULL, NULL),
(3, '2021-07-24 14:24:21.329075', '2021-07-24 14:24:21.329075', 1, NULL, 19, NULL, 1, 5, 162, 29, NULL, NULL),
(4, '2021-07-24 14:24:21.360275', '2021-07-24 14:24:21.360275', 1, NULL, 19, NULL, 1, 5, 160, 29, NULL, NULL),
(5, '2021-07-24 14:24:21.422675', '2021-07-24 14:24:21.422675', 1, NULL, 19, NULL, 1, 5, 128, 29, NULL, NULL),
(6, '2021-07-24 14:24:21.469475', '2021-07-24 14:24:21.469475', 1, NULL, 19, NULL, 1, 5, 124, 29, NULL, NULL),
(7, '2021-07-24 14:24:21.516275', '2021-07-24 14:24:21.516275', 1, NULL, 19, NULL, 1, 5, 133, 29, NULL, NULL),
(8, '2021-07-24 14:24:21.563075', '2021-07-24 14:24:21.563075', 1, NULL, 19, NULL, 1, 5, 139, 29, NULL, NULL),
(9, '2021-07-24 14:24:21.594275', '2021-07-24 14:24:21.594275', 1, NULL, 19, NULL, 1, 5, 141, 29, NULL, NULL),
(10, '2021-07-24 14:24:21.641075', '2021-07-24 14:24:21.641075', 1, NULL, 19, NULL, 1, 5, 149, 29, NULL, NULL),
(11, '2021-07-24 14:24:21.687875', '2021-07-24 14:24:21.687875', 1, NULL, 19, NULL, 1, 5, 131, 29, NULL, NULL),
(12, '2021-07-24 14:24:21.750275', '2021-07-24 14:24:21.750275', 1, NULL, 19, NULL, 1, 5, 129, 29, NULL, NULL),
(13, '2021-07-24 14:24:21.797075', '2021-07-24 14:24:21.797075', 1, NULL, 19, NULL, 1, 5, 145, 29, NULL, NULL),
(14, '2021-07-24 14:24:21.843876', '2021-07-24 14:24:21.843876', 3, NULL, 19, NULL, 1, 5, 108, 29, NULL, NULL),
(15, '2021-07-24 14:24:21.875076', '2021-07-24 14:24:21.875076', 1, NULL, 19, NULL, 1, 5, 110, 29, NULL, NULL),
(16, '2021-07-24 14:24:22.093476', '2021-07-24 14:24:22.093476', 1, NULL, 19, NULL, 1, 5, 112, 29, NULL, NULL),
(17, '2021-07-24 14:24:22.171476', '2021-07-24 14:24:22.171476', 34, NULL, 19, NULL, 1, 5, 86, 29, NULL, NULL),
(18, '2021-07-24 14:24:22.218276', '2021-07-24 14:24:22.218276', 11, NULL, 19, NULL, 1, 5, 84, 29, NULL, NULL),
(19, '2021-07-24 14:24:22.280676', '2021-07-24 14:24:22.280676', 8, NULL, 19, NULL, 1, 5, 88, 29, NULL, NULL),
(20, '2021-07-24 14:24:22.311876', '2021-07-24 14:24:22.311876', 18, NULL, 19, NULL, 1, 5, 193, 29, NULL, NULL),
(21, '2021-07-24 14:24:22.343076', '2021-07-24 14:24:22.343076', 28, NULL, 19, NULL, 1, 5, 85, 29, NULL, NULL),
(22, '2021-07-24 14:24:22.405476', '2021-07-24 14:24:22.405476', 3, NULL, 19, NULL, 1, 5, 87, 29, NULL, NULL),
(23, '2021-07-24 14:24:22.452277', '2021-07-24 14:24:22.452277', 23, NULL, 19, NULL, 1, 5, 81, 29, NULL, NULL),
(24, '2021-07-24 14:24:22.483477', '2021-07-24 14:24:22.483477', 0, NULL, 19, NULL, 1, 5, 89, 29, NULL, NULL),
(25, '2021-07-24 14:24:22.561477', '2021-07-24 14:24:22.561477', 86, NULL, 19, NULL, 1, 5, 101, 29, NULL, NULL),
(26, '2021-07-24 14:24:22.608277', '2021-07-24 14:24:22.608277', 16, NULL, 19, NULL, 1, 5, 103, 29, NULL, NULL),
(27, '2021-07-24 14:24:22.655077', '2021-07-24 14:24:22.655077', 4, NULL, 19, NULL, 1, 5, 227, 29, NULL, NULL),
(28, '2021-07-24 14:24:22.701877', '2021-07-24 14:24:22.701877', NULL, 300, 19, 5, 1, 5, NULL, 29, NULL, NULL),
(29, '2021-07-24 14:24:22.748677', '2021-07-24 14:24:22.748677', NULL, 800, 19, 4, 1, 5, NULL, 29, NULL, NULL),
(30, '2021-07-24 14:24:22.795477', '2021-07-24 14:24:22.795477', NULL, 200, 19, 19, 1, 5, NULL, 29, NULL, NULL),
(31, '2021-07-24 14:24:22.842277', '2021-07-24 14:24:22.842277', NULL, 700, 19, 29, 1, 5, NULL, 29, NULL, NULL),
(32, '2021-07-24 14:24:22.889077', '2021-07-24 14:24:22.889077', NULL, 900, 19, 20, 1, 5, NULL, 29, NULL, NULL),
(33, '2021-07-24 14:24:22.935877', '2021-07-24 14:24:22.935877', NULL, 50, 19, 24, 1, 5, NULL, 29, NULL, NULL),
(34, '2021-07-24 14:24:23.029478', '2021-07-24 14:24:23.029478', NULL, 900, 19, 38, 1, 5, NULL, 29, NULL, NULL),
(35, '2021-07-24 14:24:23.138678', '2021-07-24 14:24:23.138678', NULL, 800, 19, 30, 1, 5, NULL, 29, NULL, NULL),
(36, '2021-07-24 14:24:23.310278', '2021-07-24 14:24:23.310278', NULL, 100, 19, 21, 1, 5, NULL, 29, NULL, NULL),
(37, '2021-07-24 14:24:23.357078', '2021-07-24 14:24:23.357078', NULL, 200, 19, 27, 1, 5, NULL, 29, NULL, NULL),
(38, '2021-07-24 14:24:23.419478', '2021-07-24 14:24:23.419478', NULL, 500, 19, 28, 1, 5, NULL, 29, NULL, NULL),
(39, '2021-07-24 14:24:23.466278', '2021-07-24 14:24:23.466278', NULL, 1400, 19, 25, 1, 5, NULL, 29, NULL, NULL),
(40, '2021-07-24 14:24:23.513078', '2021-07-24 14:24:23.513078', NULL, 700, 19, 31, 1, 5, NULL, 29, NULL, NULL),
(41, '2021-07-24 14:24:23.544278', '2021-07-24 14:24:23.544278', NULL, 650, 19, 10, 1, 5, NULL, 29, NULL, NULL),
(42, '2021-07-24 14:24:23.591079', '2021-07-24 14:24:23.591079', NULL, 1000, 19, 13, 1, 5, NULL, 29, NULL, NULL),
(43, '2021-07-24 14:24:23.638280', '2021-07-24 14:24:23.638280', NULL, 400, 19, 15, 1, 5, NULL, 29, NULL, NULL),
(44, '2021-07-24 14:24:23.688282', '2021-07-24 14:24:23.688282', NULL, 100, 19, 16, 1, 5, NULL, 29, NULL, NULL),
(45, '2021-07-24 14:24:23.735082', '2021-07-24 14:24:23.735082', NULL, 200, 19, 18, 1, 5, NULL, 29, NULL, NULL),
(46, '2021-07-24 14:24:23.781883', '2021-07-24 14:24:23.781883', NULL, 650, 19, 26, 1, 5, NULL, 29, NULL, NULL),
(47, '2021-07-24 14:24:23.828683', '2021-07-24 14:24:23.828683', NULL, 750, 19, 42, 1, 5, NULL, 29, NULL, NULL),
(48, '2021-07-24 14:24:23.875483', '2021-07-24 14:24:23.875483', NULL, 1000, 19, 1, 1, 5, NULL, 29, NULL, NULL),
(49, '2021-07-24 14:24:23.922283', '2021-07-24 14:24:23.922283', NULL, 400, 19, 3, 1, 5, NULL, 29, NULL, NULL),
(50, '2021-07-24 14:24:23.984683', '2021-07-24 14:24:23.984683', NULL, 600, 19, 32, 1, 5, NULL, 29, NULL, NULL),
(51, '2021-07-24 14:24:24.062683', '2021-07-24 14:24:24.062683', NULL, 50, 19, 34, 1, 5, NULL, 29, NULL, NULL),
(52, '2021-07-24 14:24:24.717884', '2021-07-24 14:24:24.717884', NULL, 500, 19, 50, 1, 5, NULL, 29, NULL, NULL),
(53, '2021-07-24 14:24:24.749084', '2021-07-24 14:24:24.749084', NULL, 450, 19, 51, 1, 5, NULL, 29, NULL, NULL),
(54, '2021-07-26 07:32:27.267322', '2021-07-26 07:32:27.267322', 1, NULL, 19, NULL, 1, 5, 122, 30, NULL, NULL),
(55, '2021-07-26 07:32:27.316325', '2021-07-26 07:32:27.316325', 1, NULL, 19, NULL, 1, 5, 116, 30, NULL, NULL),
(56, '2021-07-26 07:32:27.357327', '2021-07-26 07:32:27.357327', 1, NULL, 19, NULL, 1, 5, 162, 30, NULL, NULL),
(57, '2021-07-26 07:32:27.399330', '2021-07-26 07:32:27.399330', 0, NULL, 19, NULL, 1, 5, 160, 30, NULL, NULL),
(58, '2021-07-26 07:32:27.440332', '2021-07-26 07:32:27.440332', 1, NULL, 19, NULL, 1, 5, 128, 30, NULL, NULL),
(59, '2021-07-26 07:32:27.481334', '2021-07-26 07:32:27.481334', 1, NULL, 19, NULL, 1, 5, 124, 30, NULL, NULL),
(60, '2021-07-26 07:32:27.523337', '2021-07-26 07:32:27.523337', 1, NULL, 19, NULL, 1, 5, 133, 30, NULL, NULL),
(61, '2021-07-26 07:32:27.573339', '2021-07-26 07:32:27.573339', 1, NULL, 19, NULL, 1, 5, 139, 30, NULL, NULL),
(62, '2021-07-26 07:32:27.747349', '2021-07-26 07:32:27.747349', 1, NULL, 19, NULL, 1, 5, 141, 30, NULL, NULL),
(63, '2021-07-26 07:32:27.781351', '2021-07-26 07:32:27.781351', 1, NULL, 19, NULL, 1, 5, 149, 30, NULL, NULL),
(64, '2021-07-26 07:32:27.926360', '2021-07-26 07:32:27.926360', 0, NULL, 19, NULL, 1, 5, 131, 30, NULL, NULL),
(65, '2021-07-26 07:32:27.997364', '2021-07-26 07:32:27.998364', 1, NULL, 19, NULL, 1, 5, 129, 30, NULL, NULL),
(66, '2021-07-26 07:32:28.039366', '2021-07-26 07:32:28.040366', 1, NULL, 19, NULL, 1, 5, 145, 30, NULL, NULL),
(67, '2021-07-26 07:32:28.097369', '2021-07-26 07:32:28.097369', 2, NULL, 19, NULL, 1, 5, 108, 30, NULL, NULL),
(68, '2021-07-26 07:32:28.147372', '2021-07-26 07:32:28.148372', 1, NULL, 19, NULL, 1, 5, 110, 30, NULL, NULL),
(69, '2021-07-26 07:32:28.197375', '2021-07-26 07:32:28.197375', 1, NULL, 19, NULL, 1, 5, 112, 30, NULL, NULL),
(70, '2021-07-26 07:32:28.248378', '2021-07-26 07:32:28.248378', 24, NULL, 19, NULL, 1, 5, 86, 30, NULL, NULL),
(71, '2021-07-26 07:32:28.322382', '2021-07-26 07:32:28.323382', 48, NULL, 19, NULL, 1, 5, 84, 30, NULL, NULL),
(72, '2021-07-26 07:32:28.357384', '2021-07-26 07:32:28.357384', 10, NULL, 19, NULL, 1, 5, 88, 30, NULL, NULL),
(73, '2021-07-26 07:32:28.406387', '2021-07-26 07:32:28.406387', 12, NULL, 19, NULL, 1, 5, 193, 30, NULL, NULL),
(74, '2021-07-26 07:32:28.459390', '2021-07-26 07:32:28.459390', 23, NULL, 19, NULL, 1, 5, 85, 30, NULL, NULL),
(75, '2021-07-26 07:32:28.502393', '2021-07-26 07:32:28.502393', 2, NULL, 19, NULL, 1, 5, 87, 30, NULL, NULL),
(76, '2021-07-26 07:32:28.557396', '2021-07-26 07:32:28.557396', 40, NULL, 19, NULL, 1, 5, 81, 30, NULL, NULL),
(77, '2021-07-26 07:32:28.598398', '2021-07-26 07:32:28.598398', 0, NULL, 19, NULL, 1, 5, 89, 30, NULL, NULL),
(78, '2021-07-26 07:32:28.651401', '2021-07-26 07:32:28.651401', 108, NULL, 19, NULL, 1, 5, 101, 30, NULL, NULL),
(79, '2021-07-26 07:32:28.705404', '2021-07-26 07:32:28.705404', 18, NULL, 19, NULL, 1, 5, 103, 30, NULL, NULL),
(80, '2021-07-26 07:32:28.761407', '2021-07-26 07:32:28.761407', 4, NULL, 19, NULL, 1, 5, 227, 30, NULL, NULL),
(81, '2021-07-26 07:32:28.815410', '2021-07-26 07:32:28.815410', NULL, 200, 19, 5, 1, 5, NULL, 30, NULL, NULL),
(82, '2021-07-26 07:32:28.864413', '2021-07-26 07:32:28.864413', NULL, 1000, 19, 4, 1, 5, NULL, 30, NULL, NULL),
(83, '2021-07-26 07:32:28.931417', '2021-07-26 07:32:28.931417', NULL, 200, 19, 19, 1, 5, NULL, 30, NULL, NULL),
(84, '2021-07-26 07:32:29.336440', '2021-07-26 07:32:29.336440', NULL, 700, 19, 29, 1, 5, NULL, 30, NULL, NULL),
(85, '2021-07-26 07:32:29.414445', '2021-07-26 07:32:29.414445', NULL, 800, 19, 20, 1, 5, NULL, 30, NULL, NULL),
(86, '2021-07-26 07:32:29.464448', '2021-07-26 07:32:29.464448', NULL, 50, 19, 24, 1, 5, NULL, 30, NULL, NULL),
(87, '2021-07-26 07:32:29.513450', '2021-07-26 07:32:29.513450', NULL, 900, 19, 38, 1, 5, NULL, 30, NULL, NULL),
(88, '2021-07-26 07:32:29.547452', '2021-07-26 07:32:29.547452', NULL, 800, 19, 30, 1, 5, NULL, 30, NULL, NULL),
(89, '2021-07-26 07:32:29.596455', '2021-07-26 07:32:29.597455', NULL, 100, 19, 21, 1, 5, NULL, 30, NULL, NULL),
(90, '2021-07-26 07:32:29.641458', '2021-07-26 07:32:29.641458', NULL, 200, 19, 27, 1, 5, NULL, 30, NULL, NULL),
(91, '2021-07-26 07:32:29.680460', '2021-07-26 07:32:29.680460', NULL, 500, 19, 28, 1, 5, NULL, 30, NULL, NULL),
(92, '2021-07-26 07:32:29.722462', '2021-07-26 07:32:29.723462', NULL, 1400, 19, 25, 1, 5, NULL, 30, NULL, NULL),
(93, '2021-07-26 07:32:29.763465', '2021-07-26 07:32:29.763465', NULL, 700, 19, 31, 1, 5, NULL, 30, NULL, NULL),
(94, '2021-07-26 07:32:29.805467', '2021-07-26 07:32:29.805467', NULL, 650, 19, 10, 1, 5, NULL, 30, NULL, NULL),
(95, '2021-07-26 07:32:29.855470', '2021-07-26 07:32:29.855470', NULL, 1000, 19, 13, 1, 5, NULL, 30, NULL, NULL),
(96, '2021-07-26 07:32:29.897472', '2021-07-26 07:32:29.897472', NULL, 400, 19, 15, 1, 5, NULL, 30, NULL, NULL),
(97, '2021-07-26 07:32:29.946475', '2021-07-26 07:32:29.946475', NULL, 50, 19, 16, 1, 5, NULL, 30, NULL, NULL),
(98, '2021-07-26 07:32:30.005479', '2021-07-26 07:32:30.005479', NULL, 200, 19, 18, 1, 5, NULL, 30, NULL, NULL),
(99, '2021-07-26 07:32:30.055481', '2021-07-26 07:32:30.055481', NULL, 650, 19, 26, 1, 5, NULL, 30, NULL, NULL),
(100, '2021-07-26 07:32:30.098484', '2021-07-26 07:32:30.098484', NULL, 600, 19, 42, 1, 5, NULL, 30, NULL, NULL),
(101, '2021-07-26 07:32:30.190489', '2021-07-26 07:32:30.190489', NULL, 1000, 19, 1, 1, 5, NULL, 30, NULL, NULL),
(102, '2021-07-26 07:32:30.230491', '2021-07-26 07:32:30.231491', NULL, 400, 19, 3, 1, 5, NULL, 30, NULL, NULL),
(103, '2021-07-26 07:32:30.273494', '2021-07-26 07:32:30.273494', NULL, 600, 19, 32, 1, 5, NULL, 30, NULL, NULL),
(104, '2021-07-26 07:32:30.322497', '2021-07-26 07:32:30.322497', NULL, 50, 19, 34, 1, 5, NULL, 30, NULL, NULL),
(105, '2021-07-26 07:32:30.353498', '2021-07-26 07:32:30.353498', NULL, 0, 19, 50, 1, 5, NULL, 30, NULL, NULL),
(106, '2021-07-26 07:32:30.389501', '2021-07-26 07:32:30.389501', NULL, 450, 19, 51, 1, 5, NULL, 30, NULL, NULL),
(107, '2021-07-26 07:32:30.440503', '2021-07-26 07:32:30.440503', 1, NULL, 19, NULL, 1, 5, 106, 30, NULL, NULL),
(108, '2021-07-26 07:32:30.481506', '2021-07-26 07:32:30.481506', NULL, 450, 19, 22, 1, 5, NULL, 30, NULL, NULL),
(109, '2021-07-26 07:35:47.975802', '2021-07-26 07:35:47.975802', 1, NULL, 19, NULL, 1, 5, 122, 31, NULL, NULL),
(110, '2021-07-26 07:35:48.020804', '2021-07-26 07:35:48.020804', 1, NULL, 19, NULL, 1, 5, 116, 31, NULL, NULL),
(111, '2021-07-26 07:35:48.074807', '2021-07-26 07:35:48.074807', 1, NULL, 19, NULL, 1, 5, 162, 31, NULL, NULL),
(112, '2021-07-26 07:35:48.123810', '2021-07-26 07:35:48.123810', 0, NULL, 19, NULL, 1, 5, 160, 31, NULL, NULL),
(113, '2021-07-26 07:35:48.171813', '2021-07-26 07:35:48.171813', 1, NULL, 19, NULL, 1, 5, 128, 31, NULL, NULL),
(114, '2021-07-26 07:35:48.206815', '2021-07-26 07:35:48.206815', 1, NULL, 19, NULL, 1, 5, 124, 31, NULL, NULL),
(115, '2021-07-26 07:35:48.265818', '2021-07-26 07:35:48.265818', 1, NULL, 19, NULL, 1, 5, 133, 31, NULL, NULL),
(116, '2021-07-26 07:35:48.320822', '2021-07-26 07:35:48.320822', 1, NULL, 19, NULL, 1, 5, 139, 31, NULL, NULL),
(117, '2021-07-26 07:35:48.364824', '2021-07-26 07:35:48.364824', 1, NULL, 19, NULL, 1, 5, 141, 31, NULL, NULL),
(118, '2021-07-26 07:35:48.409827', '2021-07-26 07:35:48.409827', 1, NULL, 19, NULL, 1, 5, 149, 31, NULL, NULL),
(119, '2021-07-26 07:35:48.458829', '2021-07-26 07:35:48.458829', 0, NULL, 19, NULL, 1, 5, 131, 31, NULL, NULL),
(120, '2021-07-26 07:35:48.507832', '2021-07-26 07:35:48.507832', 1, NULL, 19, NULL, 1, 5, 129, 31, NULL, NULL),
(121, '2021-07-26 07:35:48.548835', '2021-07-26 07:35:48.548835', 1, NULL, 19, NULL, 1, 5, 145, 31, NULL, NULL),
(122, '2021-07-26 07:35:48.599838', '2021-07-26 07:35:48.599838', 2, NULL, 19, NULL, 1, 5, 108, 31, NULL, NULL),
(123, '2021-07-26 07:35:48.969859', '2021-07-26 07:35:48.969859', 1, NULL, 19, NULL, 1, 5, 110, 31, NULL, NULL),
(124, '2021-07-26 07:35:49.037863', '2021-07-26 07:35:49.037863', 1, NULL, 19, NULL, 1, 5, 112, 31, NULL, NULL),
(125, '2021-07-26 07:35:49.116867', '2021-07-26 07:35:49.116867', 24, NULL, 19, NULL, 1, 5, 86, 31, NULL, NULL),
(126, '2021-07-26 07:35:49.179871', '2021-07-26 07:35:49.179871', 48, NULL, 19, NULL, 1, 5, 84, 31, NULL, NULL),
(127, '2021-07-26 07:35:49.228873', '2021-07-26 07:35:49.229874', 10, NULL, 19, NULL, 1, 5, 88, 31, NULL, NULL),
(128, '2021-07-26 07:35:49.272876', '2021-07-26 07:35:49.272876', 12, NULL, 19, NULL, 1, 5, 193, 31, NULL, NULL),
(129, '2021-07-26 07:35:49.317879', '2021-07-26 07:35:49.317879', 23, NULL, 19, NULL, 1, 5, 85, 31, NULL, NULL),
(130, '2021-07-26 07:35:49.372882', '2021-07-26 07:35:49.372882', 2, NULL, 19, NULL, 1, 5, 87, 31, NULL, NULL),
(131, '2021-07-26 07:35:49.422885', '2021-07-26 07:35:49.422885', 40, NULL, 19, NULL, 1, 5, 81, 31, NULL, NULL),
(132, '2021-07-26 07:35:49.463887', '2021-07-26 07:35:49.463887', 0, NULL, 19, NULL, 1, 5, 89, 31, NULL, NULL),
(133, '2021-07-26 07:35:49.552892', '2021-07-26 07:35:49.552892', 108, NULL, 19, NULL, 1, 5, 101, 31, NULL, NULL),
(134, '2021-07-26 07:35:49.588894', '2021-07-26 07:35:49.588894', 18, NULL, 19, NULL, 1, 5, 103, 31, NULL, NULL),
(135, '2021-07-26 07:35:49.638897', '2021-07-26 07:35:49.638897', 4, NULL, 19, NULL, 1, 5, 227, 31, NULL, NULL),
(136, '2021-07-26 07:35:49.688900', '2021-07-26 07:35:49.688900', NULL, 200, 19, 5, 1, 5, NULL, 31, NULL, NULL),
(137, '2021-07-26 07:35:49.730902', '2021-07-26 07:35:49.730902', NULL, 1000, 19, 4, 1, 5, NULL, 31, NULL, NULL),
(138, '2021-07-26 07:35:49.763904', '2021-07-26 07:35:49.763904', NULL, 200, 19, 19, 1, 5, NULL, 31, NULL, NULL),
(139, '2021-07-26 07:35:49.804906', '2021-07-26 07:35:49.805906', NULL, 700, 19, 29, 1, 5, NULL, 31, NULL, NULL),
(140, '2021-07-26 07:35:49.846909', '2021-07-26 07:35:49.846909', NULL, 800, 19, 20, 1, 5, NULL, 31, NULL, NULL),
(141, '2021-07-26 07:35:49.890911', '2021-07-26 07:35:49.890911', NULL, 50, 19, 24, 1, 5, NULL, 31, NULL, NULL),
(142, '2021-07-26 07:35:49.930914', '2021-07-26 07:35:49.930914', NULL, 900, 19, 38, 1, 5, NULL, 31, NULL, NULL),
(143, '2021-07-26 07:35:50.005918', '2021-07-26 07:35:50.005918', NULL, 800, 19, 30, 1, 5, NULL, 31, NULL, NULL),
(144, '2021-07-26 07:35:50.081922', '2021-07-26 07:35:50.081922', NULL, 100, 19, 21, 1, 5, NULL, 31, NULL, NULL),
(145, '2021-07-26 07:35:50.130925', '2021-07-26 07:35:50.130925', NULL, 200, 19, 27, 1, 5, NULL, 31, NULL, NULL),
(146, '2021-07-26 07:35:50.172927', '2021-07-26 07:35:50.172927', NULL, 500, 19, 28, 1, 5, NULL, 31, NULL, NULL),
(147, '2021-07-26 07:35:50.223930', '2021-07-26 07:35:50.223930', NULL, 1400, 19, 25, 1, 5, NULL, 31, NULL, NULL),
(148, '2021-07-26 07:35:50.263933', '2021-07-26 07:35:50.263933', NULL, 700, 19, 31, 1, 5, NULL, 31, NULL, NULL),
(149, '2021-07-26 07:35:50.314936', '2021-07-26 07:35:50.315936', NULL, 650, 19, 10, 1, 5, NULL, 31, NULL, NULL),
(150, '2021-07-26 07:35:50.363938', '2021-07-26 07:35:50.363938', NULL, 1000, 19, 13, 1, 5, NULL, 31, NULL, NULL),
(151, '2021-07-26 07:35:50.413941', '2021-07-26 07:35:50.413941', NULL, 400, 19, 15, 1, 5, NULL, 31, NULL, NULL),
(152, '2021-07-26 07:35:50.492946', '2021-07-26 07:35:50.492946', NULL, 50, 19, 16, 1, 5, NULL, 31, NULL, NULL),
(153, '2021-07-26 07:35:50.540949', '2021-07-26 07:35:50.540949', NULL, 200, 19, 18, 1, 5, NULL, 31, NULL, NULL),
(154, '2021-07-26 07:35:50.585951', '2021-07-26 07:35:50.585951', NULL, 650, 19, 26, 1, 5, NULL, 31, NULL, NULL),
(155, '2021-07-26 07:35:50.649955', '2021-07-26 07:35:50.649955', NULL, 600, 19, 42, 1, 5, NULL, 31, NULL, NULL),
(156, '2021-07-26 07:35:50.722959', '2021-07-26 07:35:50.722959', NULL, 1000, 19, 1, 1, 5, NULL, 31, NULL, NULL),
(157, '2021-07-26 07:35:50.982974', '2021-07-26 07:35:50.982974', NULL, 400, 19, 3, 1, 5, NULL, 31, NULL, NULL),
(158, '2021-07-26 07:35:51.055978', '2021-07-26 07:35:51.056978', NULL, 600, 19, 32, 1, 5, NULL, 31, NULL, NULL),
(159, '2021-07-26 07:35:51.099981', '2021-07-26 07:35:51.099981', NULL, 50, 19, 34, 1, 5, NULL, 31, NULL, NULL),
(160, '2021-07-26 07:35:51.149983', '2021-07-26 07:35:51.149983', NULL, 0, 19, 50, 1, 5, NULL, 31, NULL, NULL),
(161, '2021-07-26 07:35:51.204987', '2021-07-26 07:35:51.204987', NULL, 450, 19, 51, 1, 5, NULL, 31, NULL, NULL),
(162, '2021-07-26 07:35:51.257990', '2021-07-26 07:35:51.257990', 1, NULL, 19, NULL, 1, 5, 106, 31, NULL, NULL),
(163, '2021-07-26 07:35:51.294992', '2021-07-26 07:35:51.294992', NULL, 450, 19, 22, 1, 5, NULL, 31, NULL, NULL),
(189, '2021-07-26 14:39:39.026783', '2021-07-26 14:39:39.026783', 32, NULL, 19, NULL, 1, 5, 103, 32, NULL, NULL),
(190, '2021-07-26 14:39:39.122788', '2021-07-26 14:39:39.122788', 4, NULL, 19, NULL, 1, 5, 227, 32, NULL, NULL),
(191, '2021-07-26 14:39:39.213793', '2021-07-26 14:39:39.213793', NULL, 200, 19, 5, 1, 5, NULL, 32, NULL, NULL),
(192, '2021-07-26 14:39:39.315799', '2021-07-26 14:39:39.315799', NULL, 1000, 19, 4, 1, 5, NULL, 32, NULL, NULL),
(193, '2021-07-26 14:39:39.425806', '2021-07-26 14:39:39.425806', NULL, 200, 19, 19, 1, 5, NULL, 32, NULL, NULL),
(194, '2021-07-26 14:39:39.459808', '2021-07-26 14:39:39.459808', NULL, 700, 19, 29, 1, 5, NULL, 32, NULL, NULL),
(195, '2021-07-26 14:39:39.500810', '2021-07-26 14:39:39.500810', NULL, 800, 19, 20, 1, 5, NULL, 32, NULL, NULL),
(196, '2021-07-26 14:39:39.534812', '2021-07-26 14:39:39.534812', NULL, 50, 19, 24, 1, 5, NULL, 32, NULL, NULL),
(197, '2021-07-26 14:39:39.583815', '2021-07-26 14:39:39.583815', NULL, 900, 19, 38, 1, 5, NULL, 32, NULL, NULL),
(198, '2021-07-26 14:39:39.642818', '2021-07-26 14:39:39.642818', NULL, 800, 19, 30, 1, 5, NULL, 32, NULL, NULL),
(199, '2021-07-26 14:39:39.685820', '2021-07-26 14:39:39.685820', NULL, 100, 19, 21, 1, 5, NULL, 32, NULL, NULL),
(200, '2021-07-26 14:39:39.750824', '2021-07-26 14:39:39.750824', NULL, 200, 19, 27, 1, 5, NULL, 32, NULL, NULL),
(201, '2021-07-26 14:39:40.032840', '2021-07-26 14:39:40.032840', NULL, 450, 19, 28, 1, 5, NULL, 32, NULL, NULL),
(202, '2021-07-26 14:39:40.067842', '2021-07-26 14:39:40.067842', NULL, 1400, 19, 25, 1, 5, NULL, 32, NULL, NULL),
(203, '2021-07-26 14:39:40.109845', '2021-07-26 14:39:40.109845', NULL, 700, 19, 31, 1, 5, NULL, 32, NULL, NULL),
(204, '2021-07-26 14:39:40.158848', '2021-07-26 14:39:40.158848', NULL, 650, 19, 10, 1, 5, NULL, 32, NULL, NULL),
(205, '2021-07-26 14:39:40.208850', '2021-07-26 14:39:40.208850', NULL, 1000, 19, 13, 1, 5, NULL, 32, NULL, NULL),
(206, '2021-07-26 14:39:40.258853', '2021-07-26 14:39:40.258853', NULL, 400, 19, 15, 1, 5, NULL, 32, NULL, NULL),
(207, '2021-07-26 14:39:40.308856', '2021-07-26 14:39:40.308856', NULL, 50, 19, 16, 1, 5, NULL, 32, NULL, NULL),
(208, '2021-07-26 14:39:40.349858', '2021-07-26 14:39:40.349858', NULL, 200, 19, 18, 1, 5, NULL, 32, NULL, NULL),
(209, '2021-07-26 14:39:40.399861', '2021-07-26 14:39:40.399861', NULL, 650, 19, 26, 1, 5, NULL, 32, NULL, NULL),
(210, '2021-07-26 14:39:40.476866', '2021-07-26 14:39:40.476866', NULL, 600, 19, 42, 1, 5, NULL, 32, NULL, NULL),
(211, '2021-07-26 14:39:40.542869', '2021-07-26 14:39:40.542869', NULL, 1000, 19, 1, 1, 5, NULL, 32, NULL, NULL),
(212, '2021-07-26 14:39:40.592872', '2021-07-26 14:39:40.593872', NULL, 400, 19, 3, 1, 5, NULL, 32, NULL, NULL),
(213, '2021-07-26 14:39:40.642875', '2021-07-26 14:39:40.642875', NULL, 600, 19, 32, 1, 5, NULL, 32, NULL, NULL),
(214, '2021-07-26 14:39:40.684878', '2021-07-26 14:39:40.685878', NULL, 50, 19, 34, 1, 5, NULL, 32, NULL, NULL),
(215, '2021-07-26 14:39:40.743881', '2021-07-26 14:39:40.743881', NULL, 0, 19, 50, 1, 5, NULL, 32, NULL, NULL),
(216, '2021-07-26 14:39:40.792884', '2021-07-26 14:39:40.793884', NULL, 450, 19, 51, 1, 5, NULL, 32, NULL, NULL),
(217, '2021-07-26 14:39:40.842887', '2021-07-26 14:39:40.843887', 0, NULL, 19, NULL, 1, 5, 106, 32, NULL, NULL),
(218, '2021-07-26 14:39:40.885889', '2021-07-26 14:39:40.885889', NULL, 450, 19, 22, 1, 5, NULL, 32, NULL, NULL),
(219, '2021-07-26 14:39:40.977894', '2021-07-26 14:39:40.977894', 100, NULL, 19, NULL, 1, 5, 236, 32, NULL, NULL),
(220, '2021-07-26 14:39:41.117902', '2021-07-26 14:39:41.117902', 13, NULL, 19, NULL, 1, 5, 235, 32, NULL, NULL),
(221, '2021-07-27 04:34:22.979304', '2021-07-27 04:34:22.979304', 1, NULL, 19, NULL, 1, 5, 122, 32, NULL, NULL),
(222, '2021-07-27 04:34:23.013306', '2021-07-27 04:34:23.013306', 1, NULL, 19, NULL, 1, 5, 116, 32, NULL, NULL),
(223, '2021-07-27 04:34:23.100311', '2021-07-27 04:34:23.100311', 1, NULL, 19, NULL, 1, 5, 162, 32, NULL, NULL),
(224, '2021-07-27 04:34:23.174315', '2021-07-27 04:34:23.174315', 0, NULL, 19, NULL, 1, 5, 160, 32, NULL, NULL),
(225, '2021-07-27 04:34:23.250320', '2021-07-27 04:34:23.250320', 1, NULL, 19, NULL, 1, 5, 128, 32, NULL, NULL),
(226, '2021-07-27 04:34:23.303323', '2021-07-27 04:34:23.303323', 1, NULL, 19, NULL, 1, 5, 124, 32, NULL, NULL),
(227, '2021-07-27 04:34:23.345325', '2021-07-27 04:34:23.345325', 1, NULL, 19, NULL, 1, 5, 133, 32, NULL, NULL),
(228, '2021-07-27 04:34:23.378327', '2021-07-27 04:34:23.379327', 1, NULL, 19, NULL, 1, 5, 139, 32, NULL, NULL),
(229, '2021-07-27 04:34:23.420329', '2021-07-27 04:34:23.420329', 1, NULL, 19, NULL, 1, 5, 141, 32, NULL, NULL),
(230, '2021-07-27 04:34:23.453331', '2021-07-27 04:34:23.453331', 1, NULL, 19, NULL, 1, 5, 149, 32, NULL, NULL),
(231, '2021-07-27 04:34:23.488333', '2021-07-27 04:34:23.488333', 0, NULL, 19, NULL, 1, 5, 131, 32, NULL, NULL),
(232, '2021-07-27 04:34:23.545336', '2021-07-27 04:34:23.545336', 1, NULL, 19, NULL, 1, 5, 129, 32, NULL, NULL),
(233, '2021-07-27 04:34:23.595339', '2021-07-27 04:34:23.595339', 1, NULL, 19, NULL, 1, 5, 145, 32, NULL, NULL),
(234, '2021-07-27 04:34:23.629341', '2021-07-27 04:34:23.629341', 2, NULL, 19, NULL, 1, 5, 108, 32, NULL, NULL),
(235, '2021-07-27 04:34:23.670344', '2021-07-27 04:34:23.670344', 1, NULL, 19, NULL, 1, 5, 110, 32, NULL, NULL),
(236, '2021-07-27 04:34:23.712346', '2021-07-27 04:34:23.712346', 1, NULL, 19, NULL, 1, 5, 112, 32, NULL, NULL),
(237, '2021-07-27 04:34:23.745348', '2021-07-27 04:34:23.745348', 21, NULL, 19, NULL, 1, 5, 86, 32, NULL, NULL),
(238, '2021-07-27 04:34:23.787350', '2021-07-27 04:34:23.787350', 47, NULL, 19, NULL, 1, 5, 84, 32, NULL, NULL),
(239, '2021-07-27 04:34:23.846354', '2021-07-27 04:34:23.846354', 10, NULL, 19, NULL, 1, 5, 88, 32, NULL, NULL),
(240, '2021-07-27 04:34:24.316381', '2021-07-27 04:34:24.316381', 12, NULL, 19, NULL, 1, 5, 193, 32, NULL, NULL),
(241, '2021-07-27 04:34:24.377384', '2021-07-27 04:34:24.377384', 20, NULL, 19, NULL, 1, 5, 85, 32, NULL, NULL),
(242, '2021-07-27 04:34:24.426387', '2021-07-27 04:34:24.426387', 2, NULL, 19, NULL, 1, 5, 87, 32, NULL, NULL),
(243, '2021-07-27 04:34:24.468389', '2021-07-27 04:34:24.468389', 34, NULL, 19, NULL, 1, 5, 81, 32, NULL, NULL),
(244, '2021-07-27 04:34:24.502391', '2021-07-27 04:34:24.502391', 0, NULL, 19, NULL, 1, 5, 89, 32, NULL, NULL),
(245, '2021-07-27 04:34:24.535393', '2021-07-27 04:34:24.535393', 117, NULL, 19, NULL, 1, 5, 101, 32, NULL, NULL),
(246, '2021-07-27 14:56:36.926728', '2021-07-27 14:56:36.926728', 1, NULL, 19, NULL, 2, 5, 122, 33, NULL, NULL),
(247, '2021-07-27 14:56:36.989128', '2021-07-27 14:56:36.989128', 1, NULL, 19, NULL, 2, 5, 116, 33, NULL, NULL),
(248, '2021-07-27 14:56:37.035928', '2021-07-27 14:56:37.035928', 1, NULL, 19, NULL, 2, 5, 162, 33, NULL, NULL),
(249, '2021-07-27 14:56:37.067128', '2021-07-27 14:56:37.067128', 0, NULL, 19, NULL, 2, 5, 160, 33, NULL, NULL),
(250, '2021-07-27 14:56:37.113928', '2021-07-27 14:56:37.113928', 1, NULL, 19, NULL, 2, 5, 128, 33, NULL, NULL),
(251, '2021-07-27 14:56:37.145128', '2021-07-27 14:56:37.145128', 1, NULL, 19, NULL, 2, 5, 124, 33, NULL, NULL),
(252, '2021-07-27 14:56:37.207528', '2021-07-27 14:56:37.207528', 1, NULL, 19, NULL, 2, 5, 133, 33, NULL, NULL),
(253, '2021-07-27 14:56:37.254329', '2021-07-27 14:56:37.254329', 1, NULL, 19, NULL, 2, 5, 139, 33, NULL, NULL),
(254, '2021-07-27 14:56:37.301129', '2021-07-27 14:56:37.301129', 1, NULL, 19, NULL, 2, 5, 141, 33, NULL, NULL),
(255, '2021-07-27 14:56:37.347929', '2021-07-27 14:56:37.347929', 1, NULL, 19, NULL, 2, 5, 149, 33, NULL, NULL),
(256, '2021-07-27 14:56:37.394729', '2021-07-27 14:56:37.394729', 0, NULL, 19, NULL, 2, 5, 131, 33, NULL, NULL),
(257, '2021-07-27 14:56:37.457129', '2021-07-27 14:56:37.457129', 1, NULL, 19, NULL, 2, 5, 129, 33, NULL, NULL),
(258, '2021-07-27 14:56:37.488329', '2021-07-27 14:56:37.488329', 1, NULL, 19, NULL, 2, 5, 145, 33, NULL, NULL),
(259, '2021-07-27 14:56:37.550729', '2021-07-27 14:56:37.550729', 2, NULL, 19, NULL, 2, 5, 108, 33, NULL, NULL),
(260, '2021-07-27 14:56:37.581929', '2021-07-27 14:56:37.581929', 1, NULL, 19, NULL, 2, 5, 110, 33, NULL, NULL),
(261, '2021-07-27 14:56:37.628729', '2021-07-27 14:56:37.628729', 1, NULL, 19, NULL, 2, 5, 112, 33, NULL, NULL),
(262, '2021-07-27 14:56:37.737929', '2021-07-27 14:56:37.737929', 19, NULL, 19, NULL, 2, 5, 86, 33, NULL, NULL),
(263, '2021-07-27 14:56:37.909530', '2021-07-27 14:56:37.909530', 44, NULL, 19, NULL, 2, 5, 84, 33, NULL, NULL),
(264, '2021-07-27 14:56:38.221530', '2021-07-27 14:56:38.221530', 10, NULL, 19, NULL, 2, 5, 88, 33, NULL, NULL),
(265, '2021-07-27 14:56:38.424331', '2021-07-27 14:56:38.424331', 10, NULL, 19, NULL, 2, 5, 193, 33, NULL, NULL),
(266, '2021-07-27 14:56:38.455531', '2021-07-27 14:56:38.455531', 18, NULL, 19, NULL, 2, 5, 85, 33, NULL, NULL),
(267, '2021-07-27 14:56:38.502331', '2021-07-27 14:56:38.502331', 0, NULL, 19, NULL, 2, 5, 87, 33, NULL, NULL),
(268, '2021-07-27 14:56:38.549131', '2021-07-27 14:56:38.549131', 31, NULL, 19, NULL, 2, 5, 81, 33, NULL, NULL),
(269, '2021-07-27 14:56:38.580331', '2021-07-27 14:56:38.580331', 0, NULL, 19, NULL, 2, 5, 89, 33, NULL, NULL),
(270, '2021-07-27 14:56:38.658331', '2021-07-27 14:56:38.658331', 109, NULL, 19, NULL, 2, 5, 101, 33, NULL, NULL),
(271, '2021-07-27 14:56:38.720731', '2021-07-27 14:56:38.720731', 27, NULL, 19, NULL, 2, 5, 103, 33, NULL, NULL),
(272, '2021-07-27 14:56:38.783131', '2021-07-27 14:56:38.783131', 4, NULL, 19, NULL, 2, 5, 227, 33, NULL, NULL),
(273, '2021-07-27 14:56:38.939132', '2021-07-27 14:56:38.939132', NULL, 200, 19, 5, 2, 5, NULL, 33, NULL, NULL),
(274, '2021-07-27 14:56:38.985932', '2021-07-27 14:56:38.985932', NULL, 950, 19, 4, 2, 5, NULL, 33, NULL, NULL),
(275, '2021-07-27 14:56:39.048332', '2021-07-27 14:56:39.048332', NULL, 80, 19, 19, 2, 5, NULL, 33, NULL, NULL),
(276, '2021-07-27 14:56:39.095132', '2021-07-27 14:56:39.095132', NULL, 700, 19, 29, 2, 5, NULL, 33, NULL, NULL),
(277, '2021-07-27 14:56:39.157532', '2021-07-27 14:56:39.157532', NULL, 680, 19, 20, 2, 5, NULL, 33, NULL, NULL),
(278, '2021-07-27 14:56:39.204332', '2021-07-27 14:56:39.204332', NULL, 10, 19, 24, 2, 5, NULL, 33, NULL, NULL),
(279, '2021-07-27 14:56:39.266732', '2021-07-27 14:56:39.266732', NULL, 840, 19, 38, 2, 5, NULL, 33, NULL, NULL),
(280, '2021-07-27 14:56:39.313532', '2021-07-27 14:56:39.313532', NULL, 800, 19, 30, 2, 5, NULL, 33, NULL, NULL),
(281, '2021-07-27 14:56:39.360332', '2021-07-27 14:56:39.360332', NULL, 0, 19, 21, 2, 5, NULL, 33, NULL, NULL),
(282, '2021-07-27 14:56:39.407132', '2021-07-27 14:56:39.407132', NULL, 200, 19, 27, 2, 5, NULL, 33, NULL, NULL),
(283, '2021-07-27 14:56:39.438332', '2021-07-27 14:56:39.438332', NULL, 450, 19, 28, 2, 5, NULL, 33, NULL, NULL),
(284, '2021-07-27 14:56:39.485132', '2021-07-27 14:56:39.485132', NULL, 1360, 19, 25, 2, 5, NULL, 33, NULL, NULL),
(285, '2021-07-27 14:56:39.531933', '2021-07-27 14:56:39.531933', NULL, 700, 19, 31, 2, 5, NULL, 33, NULL, NULL),
(286, '2021-07-27 14:56:39.563133', '2021-07-27 14:56:39.563133', NULL, 650, 19, 10, 2, 5, NULL, 33, NULL, NULL),
(287, '2021-07-27 14:56:39.609933', '2021-07-27 14:56:39.609933', NULL, 1000, 19, 13, 2, 5, NULL, 33, NULL, NULL),
(288, '2021-07-27 14:56:39.656733', '2021-07-27 14:56:39.656733', NULL, 400, 19, 15, 2, 5, NULL, 33, NULL, NULL),
(289, '2021-07-27 14:56:39.703533', '2021-07-27 14:56:39.703533', NULL, 50, 19, 16, 2, 5, NULL, 33, NULL, NULL),
(290, '2021-07-27 14:56:39.750333', '2021-07-27 14:56:39.750333', NULL, 200, 19, 18, 2, 5, NULL, 33, NULL, NULL),
(291, '2021-07-27 14:56:39.797133', '2021-07-27 14:56:39.797133', NULL, 650, 19, 26, 2, 5, NULL, 33, NULL, NULL),
(292, '2021-07-27 14:56:39.843933', '2021-07-27 14:56:39.843933', NULL, 510, 19, 42, 2, 5, NULL, 33, NULL, NULL),
(293, '2021-07-27 14:56:39.921933', '2021-07-27 14:56:39.921933', NULL, 1000, 19, 1, 2, 5, NULL, 33, NULL, NULL),
(294, '2021-07-27 14:56:39.953133', '2021-07-27 14:56:39.953133', NULL, 400, 19, 3, 2, 5, NULL, 33, NULL, NULL),
(295, '2021-07-27 14:56:40.015533', '2021-07-27 14:56:40.015533', NULL, 600, 19, 32, 2, 5, NULL, 33, NULL, NULL),
(296, '2021-07-27 14:56:40.046733', '2021-07-27 14:56:40.046733', NULL, 50, 19, 34, 2, 5, NULL, 33, NULL, NULL),
(297, '2021-07-27 14:56:40.124734', '2021-07-27 14:56:40.124734', NULL, 0, 19, 50, 2, 5, NULL, 33, NULL, NULL),
(298, '2021-07-27 14:56:40.155934', '2021-07-27 14:56:40.155934', NULL, 450, 19, 51, 2, 5, NULL, 33, NULL, NULL),
(299, '2021-07-27 14:56:40.202734', '2021-07-27 14:56:40.202734', 0, NULL, 19, NULL, 2, 5, 106, 33, NULL, NULL),
(300, '2021-07-27 14:56:40.265134', '2021-07-27 14:56:40.265134', NULL, 390, 19, 22, 2, 5, NULL, 33, NULL, NULL),
(301, '2021-07-27 14:56:40.296334', '2021-07-27 14:56:40.296334', 99, NULL, 19, NULL, 2, 5, 236, 33, NULL, NULL),
(302, '2021-07-27 14:56:40.343134', '2021-07-27 14:56:40.343134', 6, NULL, 19, NULL, 2, 5, 235, 33, NULL, NULL),
(303, '2021-07-27 14:56:40.405534', '2021-07-27 14:56:40.405534', NULL, 250, 19, 52, 2, 5, NULL, 33, NULL, NULL),
(304, '2021-07-27 14:56:40.452334', '2021-07-27 14:56:40.452334', NULL, 250, 19, 54, 2, 5, NULL, 33, NULL, NULL),
(305, '2021-07-27 14:56:40.499134', '2021-07-27 14:56:40.499134', NULL, 750, 19, 53, 2, 5, NULL, 33, NULL, NULL),
(306, '2021-07-27 14:56:40.545934', '2021-07-27 14:56:40.545934', NULL, 1750, 19, 55, 2, 5, NULL, 33, NULL, NULL),
(307, '2021-07-27 14:56:40.577134', '2021-07-27 14:56:40.577134', NULL, 500, 19, 56, 2, 5, NULL, 33, NULL, NULL),
(308, '2021-07-27 14:56:40.608334', '2021-07-27 14:56:40.608334', 1, NULL, 19, NULL, 2, 5, 190, 33, NULL, NULL),
(309, '2021-07-28 15:02:09.329542', '2021-07-28 15:02:09.329542', 1, NULL, 19, NULL, 2, 5, 122, 34, NULL, NULL),
(310, '2021-07-28 15:02:09.376342', '2021-07-28 15:02:09.376342', 1, NULL, 19, NULL, 2, 5, 116, 34, NULL, NULL),
(311, '2021-07-28 15:02:09.423142', '2021-07-28 15:02:09.423142', 1, NULL, 19, NULL, 2, 5, 162, 34, NULL, NULL),
(312, '2021-07-28 15:02:09.469942', '2021-07-28 15:02:09.469942', 0, NULL, 19, NULL, 2, 5, 160, 34, NULL, NULL),
(313, '2021-07-28 15:02:09.516742', '2021-07-28 15:02:09.516742', 1, NULL, 19, NULL, 2, 5, 128, 34, NULL, NULL),
(314, '2021-07-28 15:02:09.625942', '2021-07-28 15:02:09.625942', 1, NULL, 19, NULL, 2, 5, 124, 34, NULL, NULL),
(315, '2021-07-28 15:02:09.657142', '2021-07-28 15:02:09.657142', 1, NULL, 19, NULL, 2, 5, 133, 34, NULL, NULL),
(316, '2021-07-28 15:02:09.703942', '2021-07-28 15:02:09.703942', 1, NULL, 19, NULL, 2, 5, 139, 34, NULL, NULL),
(317, '2021-07-28 15:02:09.750743', '2021-07-28 15:02:09.750743', 1, NULL, 19, NULL, 2, 5, 141, 34, NULL, NULL),
(318, '2021-07-28 15:02:09.797543', '2021-07-28 15:02:09.797543', 1, NULL, 19, NULL, 2, 5, 149, 34, NULL, NULL),
(319, '2021-07-28 15:02:09.875543', '2021-07-28 15:02:09.875543', 1, NULL, 19, NULL, 2, 5, 131, 34, NULL, NULL),
(320, '2021-07-28 15:02:09.937943', '2021-07-28 15:02:09.937943', 0, NULL, 19, NULL, 2, 5, 129, 34, NULL, NULL),
(321, '2021-07-28 15:02:09.969143', '2021-07-28 15:02:09.969143', 1, NULL, 19, NULL, 2, 5, 145, 34, NULL, NULL),
(322, '2021-07-28 15:02:10.000343', '2021-07-28 15:02:10.000343', 2, NULL, 19, NULL, 2, 5, 108, 34, NULL, NULL),
(323, '2021-07-28 15:02:10.047143', '2021-07-28 15:02:10.047143', 0, NULL, 19, NULL, 2, 5, 110, 34, NULL, NULL),
(324, '2021-07-28 15:02:10.078343', '2021-07-28 15:02:10.078343', 1, NULL, 19, NULL, 2, 5, 112, 34, NULL, NULL),
(325, '2021-07-28 15:02:10.125143', '2021-07-28 15:02:10.125143', 33, NULL, 19, NULL, 2, 5, 86, 34, NULL, NULL),
(326, '2021-07-28 15:02:10.171943', '2021-07-28 15:02:10.171943', 48, NULL, 19, NULL, 2, 5, 84, 34, NULL, NULL),
(327, '2021-07-28 15:02:10.234343', '2021-07-28 15:02:10.234343', 18, NULL, 19, NULL, 2, 5, 88, 34, NULL, NULL),
(328, '2021-07-28 15:02:10.281143', '2021-07-28 15:02:10.281143', 8, NULL, 19, NULL, 2, 5, 193, 34, NULL, NULL),
(329, '2021-07-28 15:02:10.312343', '2021-07-28 15:02:10.312343', 18, NULL, 19, NULL, 2, 5, 85, 34, NULL, NULL),
(330, '2021-07-28 15:02:10.374744', '2021-07-28 15:02:10.374744', 22, NULL, 19, NULL, 2, 5, 87, 34, NULL, NULL),
(331, '2021-07-28 15:02:10.405944', '2021-07-28 15:02:10.405944', 9, NULL, 19, NULL, 2, 5, 81, 34, NULL, NULL),
(332, '2021-07-28 15:02:10.452744', '2021-07-28 15:02:10.452744', 0, NULL, 19, NULL, 2, 5, 89, 34, NULL, NULL),
(333, '2021-07-28 15:02:10.499544', '2021-07-28 15:02:10.499544', 102, NULL, 19, NULL, 2, 5, 101, 34, NULL, NULL),
(334, '2021-07-28 15:02:10.546344', '2021-07-28 15:02:10.546344', 23, NULL, 19, NULL, 2, 5, 103, 34, NULL, NULL),
(335, '2021-07-28 15:02:10.593144', '2021-07-28 15:02:10.593144', 4, NULL, 19, NULL, 2, 5, 227, 34, NULL, NULL),
(336, '2021-07-28 15:02:10.624344', '2021-07-28 15:02:10.624344', NULL, 200, 19, 5, 2, 5, NULL, 34, NULL, NULL),
(337, '2021-07-28 15:02:10.671144', '2021-07-28 15:02:10.671144', NULL, 900, 19, 4, 2, 5, NULL, 34, NULL, NULL),
(338, '2021-07-28 15:02:10.702344', '2021-07-28 15:02:10.702344', NULL, 20, 19, 19, 2, 5, NULL, 34, NULL, NULL),
(339, '2021-07-28 15:02:10.749144', '2021-07-28 15:02:10.749144', NULL, 700, 19, 29, 2, 5, NULL, 34, NULL, NULL),
(340, '2021-07-28 15:02:10.780344', '2021-07-28 15:02:10.780344', NULL, 620, 19, 20, 2, 5, NULL, 34, NULL, NULL),
(341, '2021-07-28 15:02:10.827144', '2021-07-28 15:02:10.827144', NULL, 10, 19, 24, 2, 5, NULL, 34, NULL, NULL),
(342, '2021-07-28 15:02:11.045545', '2021-07-28 15:02:11.045545', NULL, 820, 19, 38, 2, 5, NULL, 34, NULL, NULL),
(343, '2021-07-28 15:02:11.076745', '2021-07-28 15:02:11.076745', NULL, 800, 19, 30, 2, 5, NULL, 34, NULL, NULL),
(344, '2021-07-28 15:02:11.139145', '2021-07-28 15:02:11.139145', NULL, 0, 19, 21, 2, 5, NULL, 34, NULL, NULL),
(345, '2021-07-28 15:02:11.185945', '2021-07-28 15:02:11.185945', NULL, 200, 19, 27, 2, 5, NULL, 34, NULL, NULL),
(346, '2021-07-28 15:02:11.232745', '2021-07-28 15:02:11.232745', NULL, 450, 19, 28, 2, 5, NULL, 34, NULL, NULL),
(347, '2021-07-28 15:02:11.279545', '2021-07-28 15:02:11.279545', NULL, 1360, 19, 25, 2, 5, NULL, 34, NULL, NULL),
(348, '2021-07-28 15:02:11.373145', '2021-07-28 15:02:11.373145', NULL, 700, 19, 31, 2, 5, NULL, 34, NULL, NULL),
(349, '2021-07-28 15:02:11.435545', '2021-07-28 15:02:11.435545', NULL, 650, 19, 10, 2, 5, NULL, 34, NULL, NULL),
(350, '2021-07-28 15:02:11.544746', '2021-07-28 15:02:11.544746', NULL, 1000, 19, 13, 2, 5, NULL, 34, NULL, NULL),
(351, '2021-07-28 15:02:11.575946', '2021-07-28 15:02:11.575946', NULL, 400, 19, 15, 2, 5, NULL, 34, NULL, NULL),
(352, '2021-07-28 15:02:11.622746', '2021-07-28 15:02:11.622746', NULL, 50, 19, 16, 2, 5, NULL, 34, NULL, NULL),
(353, '2021-07-28 15:02:11.653946', '2021-07-28 15:02:11.653946', NULL, 200, 19, 18, 2, 5, NULL, 34, NULL, NULL),
(354, '2021-07-28 15:02:11.685146', '2021-07-28 15:02:11.685146', NULL, 650, 19, 26, 2, 5, NULL, 34, NULL, NULL),
(355, '2021-07-28 15:02:11.731946', '2021-07-28 15:02:11.731946', NULL, 465, 19, 42, 2, 5, NULL, 34, NULL, NULL),
(356, '2021-07-28 15:02:11.778746', '2021-07-28 15:02:11.778746', NULL, 1000, 19, 1, 2, 5, NULL, 34, NULL, NULL),
(357, '2021-07-28 15:02:11.825546', '2021-07-28 15:02:11.825546', NULL, 400, 19, 3, 2, 5, NULL, 34, NULL, NULL),
(358, '2021-07-28 15:02:11.872346', '2021-07-28 15:02:11.872346', NULL, 600, 19, 32, 2, 5, NULL, 34, NULL, NULL),
(359, '2021-07-28 15:02:11.934746', '2021-07-28 15:02:11.934746', NULL, 50, 19, 34, 2, 5, NULL, 34, NULL, NULL),
(360, '2021-07-28 15:02:11.965946', '2021-07-28 15:02:11.965946', NULL, 0, 19, 50, 2, 5, NULL, 34, NULL, NULL),
(361, '2021-07-28 15:02:12.012746', '2021-07-28 15:02:12.012746', NULL, 450, 19, 51, 2, 5, NULL, 34, NULL, NULL),
(362, '2021-07-28 15:02:12.059547', '2021-07-28 15:02:12.059547', 0, NULL, 19, NULL, 2, 5, 106, 34, NULL, NULL),
(363, '2021-07-28 15:02:12.106347', '2021-07-28 15:02:12.106347', NULL, 330, 19, 22, 2, 5, NULL, 34, NULL, NULL),
(364, '2021-07-28 15:02:12.168747', '2021-07-28 15:02:12.168747', 98, NULL, 19, NULL, 2, 5, 236, 34, NULL, NULL),
(365, '2021-07-28 15:02:12.215547', '2021-07-28 15:02:12.215547', 9, NULL, 19, NULL, 2, 5, 235, 34, NULL, NULL),
(366, '2021-07-28 15:02:12.246747', '2021-07-28 15:02:12.246747', NULL, 1250, 19, 52, 2, 5, NULL, 34, NULL, NULL),
(367, '2021-07-28 15:02:12.293547', '2021-07-28 15:02:12.293547', NULL, 250, 19, 54, 2, 5, NULL, 34, NULL, NULL),
(368, '2021-07-28 15:02:12.340347', '2021-07-28 15:02:12.340347', NULL, 0, 19, 53, 2, 5, NULL, 34, NULL, NULL),
(369, '2021-07-28 15:02:12.605548', '2021-07-28 15:02:12.605548', NULL, 1750, 19, 55, 2, 5, NULL, 34, NULL, NULL),
(370, '2021-07-28 15:02:12.636748', '2021-07-28 15:02:12.636748', NULL, 250, 19, 56, 2, 5, NULL, 34, NULL, NULL),
(371, '2021-07-28 15:02:12.683548', '2021-07-28 15:02:12.683548', 1, NULL, 19, NULL, 2, 5, 190, 34, NULL, NULL),
(372, '2021-07-30 03:56:13.607472', '2021-07-30 03:56:13.607472', 1, NULL, 19, NULL, 2, 5, 122, 35, NULL, NULL),
(373, '2021-07-30 03:56:13.813476', '2021-07-30 03:56:13.814476', 1, NULL, 19, NULL, 2, 5, 116, 35, NULL, NULL),
(374, '2021-07-30 03:56:13.860478', '2021-07-30 03:56:13.860478', 1, NULL, 19, NULL, 2, 5, 162, 35, NULL, NULL),
(375, '2021-07-30 03:56:13.909481', '2021-07-30 03:56:13.909481', 0, NULL, 19, NULL, 2, 5, 160, 35, NULL, NULL),
(376, '2021-07-30 03:56:13.960484', '2021-07-30 03:56:13.960484', 1, NULL, 19, NULL, 2, 5, 128, 35, NULL, NULL),
(377, '2021-07-30 03:56:14.018487', '2021-07-30 03:56:14.018487', 0, NULL, 19, NULL, 2, 5, 124, 35, NULL, NULL),
(378, '2021-07-30 03:56:14.068490', '2021-07-30 03:56:14.068490', 1, NULL, 19, NULL, 2, 5, 133, 35, NULL, NULL),
(379, '2021-07-30 03:56:14.279502', '2021-07-30 03:56:14.279502', 1, NULL, 19, NULL, 2, 5, 139, 35, NULL, NULL),
(380, '2021-07-30 03:56:14.336506', '2021-07-30 03:56:14.336506', 1, NULL, 19, NULL, 2, 5, 141, 35, NULL, NULL),
(381, '2021-07-30 03:56:14.421510', '2021-07-30 03:56:14.421510', 1, NULL, 19, NULL, 2, 5, 149, 35, NULL, NULL),
(382, '2021-07-30 03:56:14.471513', '2021-07-30 03:56:14.471513', 1, NULL, 19, NULL, 2, 5, 131, 35, NULL, NULL),
(383, '2021-07-30 03:56:14.510515', '2021-07-30 03:56:14.510515', 0, NULL, 19, NULL, 2, 5, 129, 35, NULL, NULL),
(384, '2021-07-30 03:56:14.560518', '2021-07-30 03:56:14.560518', 1, NULL, 19, NULL, 2, 5, 145, 35, NULL, NULL),
(385, '2021-07-30 03:56:14.603120', '2021-07-30 03:56:14.603120', 2, NULL, 19, NULL, 2, 5, 108, 35, NULL, NULL),
(386, '2021-07-30 03:56:14.649920', '2021-07-30 03:56:14.649920', 2, NULL, 19, NULL, 2, 5, 110, 35, NULL, NULL),
(387, '2021-07-30 03:56:14.712320', '2021-07-30 03:56:14.712320', 0, NULL, 19, NULL, 2, 5, 112, 35, NULL, NULL),
(388, '2021-07-30 03:56:14.759120', '2021-07-30 03:56:14.759120', 16, NULL, 19, NULL, 2, 5, 86, 35, NULL, NULL),
(389, '2021-07-30 03:56:14.805920', '2021-07-30 03:56:14.805920', 33, NULL, 19, NULL, 2, 5, 84, 35, NULL, NULL),
(390, '2021-07-30 03:56:14.852720', '2021-07-30 03:56:14.852720', 18, NULL, 19, NULL, 2, 5, 88, 35, NULL, NULL),
(391, '2021-07-30 03:56:14.899520', '2021-07-30 03:56:14.899520', 8, NULL, 19, NULL, 2, 5, 193, 35, NULL, NULL),
(392, '2021-07-30 03:56:14.961921', '2021-07-30 03:56:14.961921', 17, NULL, 19, NULL, 2, 5, 85, 35, NULL, NULL),
(393, '2021-07-30 03:56:15.008721', '2021-07-30 03:56:15.008721', 20, NULL, 19, NULL, 2, 5, 87, 35, NULL, NULL),
(394, '2021-07-30 03:56:15.146125', '2021-07-30 03:56:15.146125', 20, NULL, 19, NULL, 2, 5, 81, 35, NULL, NULL),
(395, '2021-07-30 03:56:15.272925', '2021-07-30 03:56:15.272925', 0, NULL, 19, NULL, 2, 5, 89, 35, NULL, NULL),
(396, '2021-07-30 03:56:15.335325', '2021-07-30 03:56:15.335325', 105, NULL, 19, NULL, 2, 5, 101, 35, NULL, NULL),
(397, '2021-07-30 03:56:15.397726', '2021-07-30 03:56:15.397726', 42, NULL, 19, NULL, 2, 5, 103, 35, NULL, NULL),
(398, '2021-07-30 03:56:15.428926', '2021-07-30 03:56:15.428926', 4, NULL, 19, NULL, 2, 5, 227, 35, NULL, NULL),
(399, '2021-07-30 03:56:15.491326', '2021-07-30 03:56:15.491326', NULL, 200, 19, 5, 2, 5, NULL, 35, NULL, NULL),
(400, '2021-07-30 03:56:15.522526', '2021-07-30 03:56:15.522526', NULL, 700, 19, 4, 2, 5, NULL, 35, NULL, NULL),
(401, '2021-07-30 03:56:15.569326', '2021-07-30 03:56:15.569326', NULL, 1000, 19, 19, 2, 5, NULL, 35, NULL, NULL),
(402, '2021-07-30 03:56:15.643727', '2021-07-30 03:56:15.643727', NULL, 700, 19, 29, 2, 5, NULL, 35, NULL, NULL),
(403, '2021-07-30 03:56:15.684729', '2021-07-30 03:56:15.684729', NULL, 560, 19, 20, 2, 5, NULL, 35, NULL, NULL),
(404, '2021-07-30 03:56:15.734732', '2021-07-30 03:56:15.734732', NULL, 10, 19, 24, 2, 5, NULL, 35, NULL, NULL),
(405, '2021-07-30 03:56:15.775734', '2021-07-30 03:56:15.775734', NULL, 760, 19, 38, 2, 5, NULL, 35, NULL, NULL),
(406, '2021-07-30 03:56:15.825737', '2021-07-30 03:56:15.825737', NULL, 800, 19, 30, 2, 5, NULL, 35, NULL, NULL),
(407, '2021-07-30 03:56:15.867739', '2021-07-30 03:56:15.867739', NULL, 0, 19, 21, 2, 5, NULL, 35, NULL, NULL),
(408, '2021-07-30 03:56:15.959745', '2021-07-30 03:56:15.959745', NULL, 200, 19, 27, 2, 5, NULL, 35, NULL, NULL),
(409, '2021-07-30 03:56:16.119754', '2021-07-30 03:56:16.119754', NULL, 450, 19, 28, 2, 5, NULL, 35, NULL, NULL),
(410, '2021-07-30 03:56:16.227760', '2021-07-30 03:56:16.228760', NULL, 1360, 19, 25, 2, 5, NULL, 35, NULL, NULL),
(411, '2021-07-30 03:56:16.271763', '2021-07-30 03:56:16.271763', NULL, 700, 19, 31, 2, 5, NULL, 35, NULL, NULL),
(412, '2021-07-30 03:56:16.319765', '2021-07-30 03:56:16.319765', NULL, 650, 19, 10, 2, 5, NULL, 35, NULL, NULL),
(413, '2021-07-30 03:56:16.368768', '2021-07-30 03:56:16.369768', NULL, 1000, 19, 13, 2, 5, NULL, 35, NULL, NULL),
(414, '2021-07-30 03:56:16.419771', '2021-07-30 03:56:16.419771', NULL, 400, 19, 15, 2, 5, NULL, 35, NULL, NULL),
(415, '2021-07-30 03:56:16.467774', '2021-07-30 03:56:16.468774', NULL, 50, 19, 16, 2, 5, NULL, 35, NULL, NULL),
(416, '2021-07-30 03:56:16.518777', '2021-07-30 03:56:16.518777', NULL, 200, 19, 18, 2, 5, NULL, 35, NULL, NULL),
(417, '2021-07-30 03:56:16.570780', '2021-07-30 03:56:16.570780', NULL, 650, 19, 26, 2, 5, NULL, 35, NULL, NULL),
(418, '2021-07-30 03:56:16.617981', '2021-07-30 03:56:16.617981', NULL, 315, 19, 42, 2, 5, NULL, 35, NULL, NULL),
(419, '2021-07-30 03:56:16.680381', '2021-07-30 03:56:16.680381', NULL, 1000, 19, 1, 2, 5, NULL, 35, NULL, NULL),
(420, '2021-07-30 03:56:16.742781', '2021-07-30 03:56:16.742781', NULL, 400, 19, 3, 2, 5, NULL, 35, NULL, NULL),
(421, '2021-07-30 03:56:16.788982', '2021-07-30 03:56:16.788982', NULL, 600, 19, 32, 2, 5, NULL, 35, NULL, NULL),
(422, '2021-07-30 03:56:16.820182', '2021-07-30 03:56:16.820182', NULL, 50, 19, 34, 2, 5, NULL, 35, NULL, NULL),
(423, '2021-07-30 03:56:16.866982', '2021-07-30 03:56:16.866982', NULL, 0, 19, 50, 2, 5, NULL, 35, NULL, NULL),
(424, '2021-07-30 03:56:16.931382', '2021-07-30 03:56:16.931382', NULL, 450, 19, 51, 2, 5, NULL, 35, NULL, NULL),
(425, '2021-07-30 03:56:17.135583', '2021-07-30 03:56:17.135583', 0, NULL, 19, NULL, 2, 5, 106, 35, NULL, NULL),
(426, '2021-07-30 03:56:17.688188', '2021-07-30 03:56:17.688188', NULL, 100, 19, 22, 2, 5, NULL, 35, NULL, NULL),
(427, '2021-07-30 03:56:17.852198', '2021-07-30 03:56:17.852198', 96, NULL, 19, NULL, 2, 5, 236, 35, NULL, NULL),
(428, '2021-07-30 03:56:17.906201', '2021-07-30 03:56:17.906201', 7, NULL, 19, NULL, 2, 5, 235, 35, NULL, NULL),
(429, '2021-07-30 03:56:17.960204', '2021-07-30 03:56:17.960204', NULL, 750, 19, 52, 2, 5, NULL, 35, NULL, NULL),
(430, '2021-07-30 03:56:18.006206', '2021-07-30 03:56:18.006206', NULL, 250, 19, 54, 2, 5, NULL, 35, NULL, NULL),
(431, '2021-07-30 03:56:18.060210', '2021-07-30 03:56:18.061210', NULL, 1000, 19, 53, 2, 5, NULL, 35, NULL, NULL),
(432, '2021-07-30 03:56:18.154215', '2021-07-30 03:56:18.154215', NULL, 1750, 19, 55, 2, 5, NULL, 35, NULL, NULL),
(433, '2021-07-30 03:56:18.211218', '2021-07-30 03:56:18.211218', NULL, 250, 19, 56, 2, 5, NULL, 35, NULL, NULL),
(434, '2021-07-30 03:56:18.281222', '2021-07-30 03:56:18.281222', 1, NULL, 19, NULL, 2, 5, 190, 35, NULL, NULL),
(435, '2021-08-07 07:15:06.605949', '2021-08-07 07:15:06.605949', 1, NULL, 19, NULL, 2, 5, 122, 36, NULL, NULL),
(436, '2021-08-07 07:15:06.652749', '2021-08-07 07:15:06.652749', 0, NULL, 19, NULL, 2, 5, 116, 36, NULL, NULL),
(437, '2021-08-07 07:15:06.699549', '2021-08-07 07:15:06.699549', 1, NULL, 19, NULL, 2, 5, 162, 36, NULL, NULL),
(438, '2021-08-07 07:15:06.746349', '2021-08-07 07:15:06.746349', 0, NULL, 19, NULL, 2, 5, 160, 36, NULL, NULL),
(439, '2021-08-07 07:15:06.793149', '2021-08-07 07:15:06.793149', 1, NULL, 19, NULL, 2, 5, 128, 36, NULL, NULL),
(440, '2021-08-07 07:15:06.839949', '2021-08-07 07:15:06.839949', 0, NULL, 19, NULL, 2, 5, 124, 36, NULL, NULL),
(441, '2021-08-07 07:15:06.886749', '2021-08-07 07:15:06.886749', 1, NULL, 19, NULL, 2, 5, 133, 36, NULL, NULL),
(442, '2021-08-07 07:15:06.933549', '2021-08-07 07:15:06.933549', 1, NULL, 19, NULL, 2, 5, 139, 36, NULL, NULL),
(443, '2021-08-07 07:15:06.964749', '2021-08-07 07:15:06.964749', 1, NULL, 19, NULL, 2, 5, 141, 36, NULL, NULL),
(444, '2021-08-07 07:15:07.027149', '2021-08-07 07:15:07.027149', 1, NULL, 19, NULL, 2, 5, 149, 36, NULL, NULL),
(445, '2021-08-07 07:15:07.073949', '2021-08-07 07:15:07.073949', 0, NULL, 19, NULL, 2, 5, 131, 36, NULL, NULL),
(446, '2021-08-07 07:15:07.339150', '2021-08-07 07:15:07.339150', 0, NULL, 19, NULL, 2, 5, 129, 36, NULL, NULL),
(447, '2021-08-07 07:15:07.526350', '2021-08-07 07:15:07.526350', 1, NULL, 19, NULL, 2, 5, 145, 36, NULL, NULL),
(448, '2021-08-07 07:15:07.588750', '2021-08-07 07:15:07.588750', 2, NULL, 19, NULL, 2, 5, 108, 36, NULL, NULL),
(449, '2021-08-07 07:15:07.651150', '2021-08-07 07:15:07.651150', 1, NULL, 19, NULL, 2, 5, 110, 36, NULL, NULL),
(450, '2021-08-07 07:15:07.697951', '2021-08-07 07:15:07.697951', 1, NULL, 19, NULL, 2, 5, 112, 36, NULL, NULL),
(451, '2021-08-07 07:15:07.729151', '2021-08-07 07:15:07.729151', 34, NULL, 19, NULL, 2, 5, 86, 36, NULL, NULL),
(452, '2021-08-07 07:15:07.760351', '2021-08-07 07:15:07.760351', 38, NULL, 19, NULL, 2, 5, 84, 36, NULL, NULL),
(453, '2021-08-07 07:15:07.807151', '2021-08-07 07:15:07.807151', 33, NULL, 19, NULL, 2, 5, 88, 36, NULL, NULL),
(454, '2021-08-07 07:15:07.838351', '2021-08-07 07:15:07.838351', 0, NULL, 19, NULL, 2, 5, 193, 36, NULL, NULL),
(455, '2021-08-07 07:15:07.885151', '2021-08-07 07:15:07.885151', 35, NULL, 19, NULL, 2, 5, 85, 36, NULL, NULL),
(456, '2021-08-07 07:15:07.916351', '2021-08-07 07:15:07.916351', 24, NULL, 19, NULL, 2, 5, 87, 36, NULL, NULL),
(457, '2021-08-07 07:15:07.963151', '2021-08-07 07:15:07.963151', 36, NULL, 19, NULL, 2, 5, 81, 36, NULL, NULL),
(458, '2021-08-07 07:15:07.994351', '2021-08-07 07:15:07.994351', 0, NULL, 19, NULL, 2, 5, 89, 36, NULL, NULL),
(459, '2021-08-07 07:15:08.025551', '2021-08-07 07:15:08.025551', 38, NULL, 19, NULL, 2, 5, 101, 36, NULL, NULL),
(460, '2021-08-07 07:15:08.087951', '2021-08-07 07:15:08.087951', 52, NULL, 19, NULL, 2, 5, 103, 36, NULL, NULL),
(461, '2021-08-07 07:15:08.134751', '2021-08-07 07:15:08.134751', 5, NULL, 19, NULL, 2, 5, 227, 36, NULL, NULL),
(462, '2021-08-07 07:15:08.181551', '2021-08-07 07:15:08.181551', NULL, 1100, 19, 5, 2, 5, NULL, 36, NULL, NULL),
(463, '2021-08-07 07:15:08.228351', '2021-08-07 07:15:08.228351', NULL, 700, 19, 4, 2, 5, NULL, 36, NULL, NULL),
(464, '2021-08-07 07:15:08.275152', '2021-08-07 07:15:08.275152', NULL, 900, 19, 19, 2, 5, NULL, 36, NULL, NULL),
(465, '2021-08-07 07:15:08.306352', '2021-08-07 07:15:08.306352', NULL, 700, 19, 29, 2, 5, NULL, 36, NULL, NULL),
(466, '2021-08-07 07:15:08.337552', '2021-08-07 07:15:08.337552', NULL, 0, 19, 20, 2, 5, NULL, 36, NULL, NULL),
(467, '2021-08-07 07:15:08.368752', '2021-08-07 07:15:08.368752', NULL, 0, 19, 24, 2, 5, NULL, 36, NULL, NULL),
(468, '2021-08-07 07:15:08.415552', '2021-08-07 07:15:08.415552', NULL, 300, 19, 38, 2, 5, NULL, 36, NULL, NULL),
(469, '2021-08-07 07:15:08.462352', '2021-08-07 07:15:08.462352', NULL, 800, 19, 30, 2, 5, NULL, 36, NULL, NULL),
(470, '2021-08-07 07:15:08.509152', '2021-08-07 07:15:08.509152', NULL, 0, 19, 21, 2, 5, NULL, 36, NULL, NULL),
(471, '2021-08-07 07:15:08.571552', '2021-08-07 07:15:08.571552', NULL, 150, 19, 27, 2, 5, NULL, 36, NULL, NULL),
(472, '2021-08-07 07:15:08.618352', '2021-08-07 07:15:08.618352', NULL, 250, 19, 28, 2, 5, NULL, 36, NULL, NULL);
INSERT INTO `product_app_item_balance_log` (`id`, `created_at`, `updated_at`, `quantity`, `size`, `client_id`, `commodity_id`, `created_by_id`, `division_id`, `product_id`, `shift_work_id`, `updated_by_id`, `user_id`) VALUES
(473, '2021-08-07 07:15:08.649552', '2021-08-07 07:15:08.649552', NULL, 1100, 19, 25, 2, 5, NULL, 36, NULL, NULL),
(474, '2021-08-07 07:15:08.680752', '2021-08-07 07:15:08.680752', NULL, 700, 19, 31, 2, 5, NULL, 36, NULL, NULL),
(475, '2021-08-07 07:15:08.727552', '2021-08-07 07:15:08.727552', NULL, 650, 19, 10, 2, 5, NULL, 36, NULL, NULL),
(476, '2021-08-07 07:15:08.774352', '2021-08-07 07:15:08.774352', NULL, 850, 19, 13, 2, 5, NULL, 36, NULL, NULL),
(477, '2021-08-07 07:15:08.805553', '2021-08-07 07:15:08.805553', NULL, 400, 19, 15, 2, 5, NULL, 36, NULL, NULL),
(478, '2021-08-07 07:15:08.852353', '2021-08-07 07:15:08.852353', NULL, 50, 19, 16, 2, 5, NULL, 36, NULL, NULL),
(479, '2021-08-07 07:15:08.883553', '2021-08-07 07:15:08.883553', NULL, 200, 19, 18, 2, 5, NULL, 36, NULL, NULL),
(480, '2021-08-07 07:15:08.992753', '2021-08-07 07:15:08.992753', NULL, 400, 19, 26, 2, 5, NULL, 36, NULL, NULL),
(481, '2021-08-07 07:15:09.055153', '2021-08-07 07:15:09.055153', NULL, 1065, 19, 42, 2, 5, NULL, 36, NULL, NULL),
(482, '2021-08-07 07:15:09.304753', '2021-08-07 07:15:09.304753', NULL, 650, 19, 1, 2, 5, NULL, 36, NULL, NULL),
(483, '2021-08-07 07:15:09.382754', '2021-08-07 07:15:09.382754', NULL, 400, 19, 3, 2, 5, NULL, 36, NULL, NULL),
(484, '2021-08-07 07:15:09.429554', '2021-08-07 07:15:09.429554', NULL, 600, 19, 32, 2, 5, NULL, 36, NULL, NULL),
(485, '2021-08-07 07:15:09.507554', '2021-08-07 07:15:09.507554', NULL, 20, 19, 34, 2, 5, NULL, 36, NULL, NULL),
(486, '2021-08-07 07:15:09.569954', '2021-08-07 07:15:09.569954', NULL, 0, 19, 50, 2, 5, NULL, 36, NULL, NULL),
(487, '2021-08-07 07:15:09.601154', '2021-08-07 07:15:09.601154', NULL, 0, 19, 51, 2, 5, NULL, 36, NULL, NULL),
(488, '2021-08-07 07:15:09.632354', '2021-08-07 07:15:09.632354', 0, NULL, 19, NULL, 2, 5, 106, 36, NULL, NULL),
(489, '2021-08-07 07:15:09.710354', '2021-08-07 07:15:09.710354', NULL, 750, 19, 22, 2, 5, NULL, 36, NULL, NULL),
(490, '2021-08-07 07:15:09.772754', '2021-08-07 07:15:09.772754', 96, NULL, 19, NULL, 2, 5, 236, 36, NULL, NULL),
(491, '2021-08-07 07:15:09.850754', '2021-08-07 07:15:09.850754', 27, NULL, 19, NULL, 2, 5, 235, 36, NULL, NULL),
(492, '2021-08-07 07:15:09.913154', '2021-08-07 07:15:09.913154', NULL, 750, 19, 52, 2, 5, NULL, 36, NULL, NULL),
(493, '2021-08-07 07:15:10.006755', '2021-08-07 07:15:10.006755', NULL, 250, 19, 54, 2, 5, NULL, 36, NULL, NULL),
(494, '2021-08-07 07:15:10.069155', '2021-08-07 07:15:10.069155', NULL, 1000, 19, 53, 2, 5, NULL, 36, NULL, NULL),
(495, '2021-08-07 07:15:10.115955', '2021-08-07 07:15:10.115955', NULL, 1750, 19, 55, 2, 5, NULL, 36, NULL, NULL),
(496, '2021-08-07 07:15:10.225155', '2021-08-07 07:15:10.225155', NULL, 250, 19, 56, 2, 5, NULL, 36, NULL, NULL),
(497, '2021-08-07 07:15:10.287555', '2021-08-07 07:15:10.287555', 0, NULL, 19, NULL, 2, 5, 190, 36, NULL, NULL),
(498, '2021-08-07 07:15:10.349955', '2021-08-07 07:15:10.349955', 1, NULL, 19, NULL, 2, 5, 126, 36, NULL, NULL),
(499, '2021-08-07 14:56:44.966970', '2021-08-07 14:56:44.966970', 1, NULL, 19, NULL, 2, 5, 122, 37, NULL, NULL),
(500, '2021-08-07 14:56:45.111978', '2021-08-07 14:56:45.111978', 1, NULL, 19, NULL, 2, 5, 116, 37, NULL, NULL),
(501, '2021-08-07 14:56:45.161981', '2021-08-07 14:56:45.161981', 1, NULL, 19, NULL, 2, 5, 162, 37, NULL, NULL),
(502, '2021-08-07 14:56:45.200983', '2021-08-07 14:56:45.201983', 0, NULL, 19, NULL, 2, 5, 160, 37, NULL, NULL),
(503, '2021-08-07 14:56:45.234985', '2021-08-07 14:56:45.234985', 1, NULL, 19, NULL, 2, 5, 128, 37, NULL, NULL),
(504, '2021-08-07 14:56:45.276988', '2021-08-07 14:56:45.276988', 0, NULL, 19, NULL, 2, 5, 124, 37, NULL, NULL),
(505, '2021-08-07 14:56:45.318990', '2021-08-07 14:56:45.318990', 1, NULL, 19, NULL, 2, 5, 133, 37, NULL, NULL),
(506, '2021-08-07 14:56:45.359992', '2021-08-07 14:56:45.359992', 1, NULL, 19, NULL, 2, 5, 139, 37, NULL, NULL),
(507, '2021-08-07 14:56:45.401995', '2021-08-07 14:56:45.401995', 1, NULL, 19, NULL, 2, 5, 141, 37, NULL, NULL),
(508, '2021-08-07 14:56:45.443997', '2021-08-07 14:56:45.444997', 1, NULL, 19, NULL, 2, 5, 149, 37, NULL, NULL),
(509, '2021-08-07 14:56:45.484999', '2021-08-07 14:56:45.484999', 0, NULL, 19, NULL, 2, 5, 131, 37, NULL, NULL),
(510, '2021-08-07 14:56:45.527002', '2021-08-07 14:56:45.527002', 0, NULL, 19, NULL, 2, 5, 129, 37, NULL, NULL),
(511, '2021-08-07 14:56:45.568004', '2021-08-07 14:56:45.569004', 1, NULL, 19, NULL, 2, 5, 145, 37, NULL, NULL),
(512, '2021-08-07 14:56:45.618007', '2021-08-07 14:56:45.619007', 2, NULL, 19, NULL, 2, 5, 108, 37, NULL, NULL),
(513, '2021-08-07 14:56:45.666010', '2021-08-07 14:56:45.666010', 1, NULL, 19, NULL, 2, 5, 110, 37, NULL, NULL),
(514, '2021-08-07 14:56:45.710012', '2021-08-07 14:56:45.710012', 1, NULL, 19, NULL, 2, 5, 112, 37, NULL, NULL),
(515, '2021-08-07 14:56:45.746014', '2021-08-07 14:56:45.746014', 15, NULL, 19, NULL, 2, 5, 86, 37, NULL, NULL),
(516, '2021-08-07 14:56:45.786017', '2021-08-07 14:56:45.786017', 25, NULL, 19, NULL, 2, 5, 84, 37, NULL, NULL),
(517, '2021-08-07 14:56:45.837020', '2021-08-07 14:56:45.837020', 33, NULL, 19, NULL, 2, 5, 88, 37, NULL, NULL),
(518, '2021-08-07 14:56:45.913024', '2021-08-07 14:56:45.913024', 0, NULL, 19, NULL, 2, 5, 193, 37, NULL, NULL),
(519, '2021-08-07 14:56:45.968027', '2021-08-07 14:56:45.968027', 32, NULL, 19, NULL, 2, 5, 85, 37, NULL, NULL),
(520, '2021-08-07 14:56:46.018030', '2021-08-07 14:56:46.019030', 24, NULL, 19, NULL, 2, 5, 87, 37, NULL, NULL),
(521, '2021-08-07 14:56:46.060032', '2021-08-07 14:56:46.060032', 33, NULL, 19, NULL, 2, 5, 81, 37, NULL, NULL),
(522, '2021-08-07 14:56:46.124036', '2021-08-07 14:56:46.124036', 0, NULL, 19, NULL, 2, 5, 89, 37, NULL, NULL),
(523, '2021-08-07 14:56:46.175039', '2021-08-07 14:56:46.175039', 15, NULL, 19, NULL, 2, 5, 101, 37, NULL, NULL),
(524, '2021-08-07 14:56:46.210041', '2021-08-07 14:56:46.210041', 33, NULL, 19, NULL, 2, 5, 103, 37, NULL, NULL),
(525, '2021-08-07 14:56:46.245043', '2021-08-07 14:56:46.245043', 5, NULL, 19, NULL, 2, 5, 227, 37, NULL, NULL),
(526, '2021-08-07 14:56:46.284045', '2021-08-07 14:56:46.284045', NULL, 1050, 19, 5, 2, 5, NULL, 37, NULL, NULL),
(527, '2021-08-07 14:56:46.319047', '2021-08-07 14:56:46.320047', NULL, 480, 19, 4, 2, 5, NULL, 37, NULL, NULL),
(528, '2021-08-07 14:56:46.370050', '2021-08-07 14:56:46.370050', NULL, 780, 19, 19, 2, 5, NULL, 37, NULL, NULL),
(529, '2021-08-07 14:56:46.409052', '2021-08-07 14:56:46.410052', NULL, 580, 19, 29, 2, 5, NULL, 37, NULL, NULL),
(530, '2021-08-07 14:56:46.451055', '2021-08-07 14:56:46.452055', NULL, 1000, 19, 20, 2, 5, NULL, 37, NULL, NULL),
(531, '2021-08-07 14:56:46.485057', '2021-08-07 14:56:46.485057', NULL, 0, 19, 24, 2, 5, NULL, 37, NULL, NULL),
(532, '2021-08-07 14:56:46.526059', '2021-08-07 14:56:46.526059', NULL, 280, 19, 38, 2, 5, NULL, 37, NULL, NULL),
(533, '2021-08-07 14:56:46.560061', '2021-08-07 14:56:46.560061', NULL, 800, 19, 30, 2, 5, NULL, 37, NULL, NULL),
(534, '2021-08-07 14:56:46.757072', '2021-08-07 14:56:46.757072', NULL, 0, 19, 21, 2, 5, NULL, 37, NULL, NULL),
(535, '2021-08-07 14:56:46.809075', '2021-08-07 14:56:46.809075', NULL, 150, 19, 27, 2, 5, NULL, 37, NULL, NULL),
(536, '2021-08-07 14:56:46.852078', '2021-08-07 14:56:46.852078', NULL, 250, 19, 28, 2, 5, NULL, 37, NULL, NULL),
(537, '2021-08-07 14:56:46.901080', '2021-08-07 14:56:46.901080', NULL, 1100, 19, 25, 2, 5, NULL, 37, NULL, NULL),
(538, '2021-08-07 14:56:46.951083', '2021-08-07 14:56:46.951083', NULL, 700, 19, 31, 2, 5, NULL, 37, NULL, NULL),
(539, '2021-08-07 14:56:47.026088', '2021-08-07 14:56:47.026088', NULL, 650, 19, 10, 2, 5, NULL, 37, NULL, NULL),
(540, '2021-08-07 14:56:47.175096', '2021-08-07 14:56:47.175096', NULL, 750, 19, 13, 2, 5, NULL, 37, NULL, NULL),
(541, '2021-08-07 14:56:47.225099', '2021-08-07 14:56:47.226099', NULL, 400, 19, 15, 2, 5, NULL, 37, NULL, NULL),
(542, '2021-08-07 14:56:47.275102', '2021-08-07 14:56:47.276102', NULL, 50, 19, 16, 2, 5, NULL, 37, NULL, NULL),
(543, '2021-08-07 14:56:47.317104', '2021-08-07 14:56:47.317104', NULL, 200, 19, 18, 2, 5, NULL, 37, NULL, NULL),
(544, '2021-08-07 14:56:47.361107', '2021-08-07 14:56:47.361107', NULL, 400, 19, 26, 2, 5, NULL, 37, NULL, NULL),
(545, '2021-08-07 14:56:47.406109', '2021-08-07 14:56:47.406109', NULL, 960, 19, 42, 2, 5, NULL, 37, NULL, NULL),
(546, '2021-08-07 14:56:47.451112', '2021-08-07 14:56:47.451112', NULL, 650, 19, 1, 2, 5, NULL, 37, NULL, NULL),
(547, '2021-08-07 14:56:47.492114', '2021-08-07 14:56:47.492114', NULL, 400, 19, 3, 2, 5, NULL, 37, NULL, NULL),
(548, '2021-08-07 14:56:47.534117', '2021-08-07 14:56:47.534117', NULL, 600, 19, 32, 2, 5, NULL, 37, NULL, NULL),
(549, '2021-08-07 14:56:47.605121', '2021-08-07 14:56:47.605121', NULL, 20, 19, 34, 2, 5, NULL, 37, NULL, NULL),
(550, '2021-08-07 14:56:47.650123', '2021-08-07 14:56:47.650123', NULL, 0, 19, 50, 2, 5, NULL, 37, NULL, NULL),
(551, '2021-08-07 14:56:47.726128', '2021-08-07 14:56:47.726128', NULL, 0, 19, 51, 2, 5, NULL, 37, NULL, NULL),
(552, '2021-08-07 14:56:47.785131', '2021-08-07 14:56:47.785131', 0, NULL, 19, NULL, 2, 5, 106, 37, NULL, NULL),
(553, '2021-08-07 14:56:47.853135', '2021-08-07 14:56:47.853135', NULL, 470, 19, 22, 2, 5, NULL, 37, NULL, NULL),
(554, '2021-08-07 14:56:47.906138', '2021-08-07 14:56:47.906138', 94, NULL, 19, NULL, 2, 5, 236, 37, NULL, NULL),
(555, '2021-08-07 14:56:48.021144', '2021-08-07 14:56:48.021144', 20, NULL, 19, NULL, 2, 5, 235, 37, NULL, NULL),
(556, '2021-08-07 14:56:48.167153', '2021-08-07 14:56:48.167153', NULL, 500, 19, 52, 2, 5, NULL, 37, NULL, NULL),
(557, '2021-08-07 14:56:48.225156', '2021-08-07 14:56:48.225156', NULL, 250, 19, 54, 2, 5, NULL, 37, NULL, NULL),
(558, '2021-08-07 14:56:48.278159', '2021-08-07 14:56:48.279159', NULL, 250, 19, 53, 2, 5, NULL, 37, NULL, NULL),
(559, '2021-08-07 14:56:48.325162', '2021-08-07 14:56:48.325162', NULL, 1750, 19, 55, 2, 5, NULL, 37, NULL, NULL),
(560, '2021-08-07 14:56:48.374165', '2021-08-07 14:56:48.374165', NULL, 0, 19, 56, 2, 5, NULL, 37, NULL, NULL),
(561, '2021-08-07 14:56:48.420167', '2021-08-07 14:56:48.420167', 0, NULL, 19, NULL, 2, 5, 190, 37, NULL, NULL),
(562, '2021-08-07 14:56:48.476171', '2021-08-07 14:56:48.476171', 1, NULL, 19, NULL, 2, 5, 126, 37, NULL, NULL),
(563, '2021-08-07 14:56:48.522173', '2021-08-07 14:56:48.523173', 1, NULL, 19, NULL, 2, 5, 135, 37, NULL, NULL),
(564, '2021-08-09 03:27:42.848106', '2021-08-09 03:27:42.848106', 1, NULL, 19, NULL, 2, 5, 122, 38, NULL, NULL),
(565, '2021-08-09 03:27:42.972906', '2021-08-09 03:27:42.972906', 0, NULL, 19, NULL, 2, 5, 116, 38, NULL, NULL),
(566, '2021-08-09 03:27:43.082106', '2021-08-09 03:27:43.082106', 1, NULL, 19, NULL, 2, 5, 162, 38, NULL, NULL),
(567, '2021-08-09 03:27:43.141907', '2021-08-09 03:27:43.141907', 0, NULL, 19, NULL, 2, 5, 160, 38, NULL, NULL),
(568, '2021-08-09 03:27:43.188707', '2021-08-09 03:27:43.188707', 1, NULL, 19, NULL, 2, 5, 128, 38, NULL, NULL),
(569, '2021-08-09 03:27:43.235507', '2021-08-09 03:27:43.235507', 0, NULL, 19, NULL, 2, 5, 124, 38, NULL, NULL),
(570, '2021-08-09 03:27:43.297907', '2021-08-09 03:27:43.297907', 1, NULL, 19, NULL, 2, 5, 133, 38, NULL, NULL),
(571, '2021-08-09 03:27:43.329107', '2021-08-09 03:27:43.329107', 1, NULL, 19, NULL, 2, 5, 139, 38, NULL, NULL),
(572, '2021-08-09 03:27:43.384710', '2021-08-09 03:27:43.384710', 1, NULL, 19, NULL, 2, 5, 141, 38, NULL, NULL),
(573, '2021-08-09 03:27:43.449713', '2021-08-09 03:27:43.449713', 1, NULL, 19, NULL, 2, 5, 149, 38, NULL, NULL),
(574, '2021-08-09 03:27:43.503717', '2021-08-09 03:27:43.503717', 0, NULL, 19, NULL, 2, 5, 131, 38, NULL, NULL),
(575, '2021-08-09 03:27:43.552719', '2021-08-09 03:27:43.552719', 0, NULL, 19, NULL, 2, 5, 129, 38, NULL, NULL),
(576, '2021-08-09 03:27:43.630719', '2021-08-09 03:27:43.630719', 1, NULL, 19, NULL, 2, 5, 145, 38, NULL, NULL),
(577, '2021-08-09 03:27:43.897127', '2021-08-09 03:27:43.897127', 2, NULL, 19, NULL, 2, 5, 108, 38, NULL, NULL),
(578, '2021-08-09 03:27:43.946130', '2021-08-09 03:27:43.946130', 1, NULL, 19, NULL, 2, 5, 110, 38, NULL, NULL),
(579, '2021-08-09 03:27:44.000133', '2021-08-09 03:27:44.000133', 1, NULL, 19, NULL, 2, 5, 112, 38, NULL, NULL),
(580, '2021-08-09 03:27:44.050136', '2021-08-09 03:27:44.050136', 4, NULL, 19, NULL, 2, 5, 86, 38, NULL, NULL),
(581, '2021-08-09 03:27:44.100139', '2021-08-09 03:27:44.100139', 14, NULL, 19, NULL, 2, 5, 84, 38, NULL, NULL),
(582, '2021-08-09 03:27:44.141141', '2021-08-09 03:27:44.141141', 33, NULL, 19, NULL, 2, 5, 88, 38, NULL, NULL),
(583, '2021-08-09 03:27:44.210343', '2021-08-09 03:27:44.210343', 0, NULL, 19, NULL, 2, 5, 193, 38, NULL, NULL),
(584, '2021-08-09 03:27:44.272743', '2021-08-09 03:27:44.272743', 26, NULL, 19, NULL, 2, 5, 85, 38, NULL, NULL),
(585, '2021-08-09 03:27:44.319543', '2021-08-09 03:27:44.319543', 20, NULL, 19, NULL, 2, 5, 87, 38, NULL, NULL),
(586, '2021-08-09 03:27:44.366343', '2021-08-09 03:27:44.366343', 33, NULL, 19, NULL, 2, 5, 81, 38, NULL, NULL),
(587, '2021-08-09 03:27:44.413143', '2021-08-09 03:27:44.413143', 0, NULL, 19, NULL, 2, 5, 89, 38, NULL, NULL),
(588, '2021-08-09 03:27:44.459944', '2021-08-09 03:27:44.459944', 40, NULL, 19, NULL, 2, 5, 101, 38, NULL, NULL),
(589, '2021-08-09 03:27:44.522344', '2021-08-09 03:27:44.522344', 25, NULL, 19, NULL, 2, 5, 103, 38, NULL, NULL),
(590, '2021-08-09 03:27:44.574144', '2021-08-09 03:27:44.574144', 3, NULL, 19, NULL, 2, 5, 227, 38, NULL, NULL),
(591, '2021-08-09 03:27:44.634147', '2021-08-09 03:27:44.634147', NULL, 850, 19, 5, 2, 5, NULL, 38, NULL, NULL),
(592, '2021-08-09 03:27:44.941363', '2021-08-09 03:27:44.941363', NULL, 310, 19, 4, 2, 5, NULL, 38, NULL, NULL),
(593, '2021-08-09 03:27:44.992366', '2021-08-09 03:27:44.992366', NULL, 740, 19, 19, 2, 5, NULL, 38, NULL, NULL),
(594, '2021-08-09 03:27:45.039369', '2021-08-09 03:27:45.039369', NULL, 540, 19, 29, 2, 5, NULL, 38, NULL, NULL),
(595, '2021-08-09 03:27:45.090372', '2021-08-09 03:27:45.090372', NULL, 1000, 19, 20, 2, 5, NULL, 38, NULL, NULL),
(596, '2021-08-09 03:27:45.140375', '2021-08-09 03:27:45.140375', NULL, 0, 19, 24, 2, 5, NULL, 38, NULL, NULL),
(597, '2021-08-09 03:27:45.190378', '2021-08-09 03:27:45.190378', NULL, 260, 19, 38, 2, 5, NULL, 38, NULL, NULL),
(598, '2021-08-09 03:27:45.242381', '2021-08-09 03:27:45.242381', NULL, 800, 19, 30, 2, 5, NULL, 38, NULL, NULL),
(599, '2021-08-09 03:27:45.289383', '2021-08-09 03:27:45.289383', NULL, 0, 19, 21, 2, 5, NULL, 38, NULL, NULL),
(600, '2021-08-09 03:27:45.331386', '2021-08-09 03:27:45.331386', NULL, 150, 19, 27, 2, 5, NULL, 38, NULL, NULL),
(601, '2021-08-09 03:27:45.379388', '2021-08-09 03:27:45.379388', NULL, 250, 19, 28, 2, 5, NULL, 38, NULL, NULL),
(602, '2021-08-09 03:27:45.426188', '2021-08-09 03:27:45.426188', NULL, 1100, 19, 25, 2, 5, NULL, 38, NULL, NULL),
(603, '2021-08-09 03:27:45.481390', '2021-08-09 03:27:45.481390', NULL, 700, 19, 31, 2, 5, NULL, 38, NULL, NULL),
(604, '2021-08-09 03:27:45.531393', '2021-08-09 03:27:45.531393', NULL, 650, 19, 10, 2, 5, NULL, 38, NULL, NULL),
(605, '2021-08-09 03:27:45.567994', '2021-08-09 03:27:45.567994', NULL, 710, 19, 13, 2, 5, NULL, 38, NULL, NULL),
(606, '2021-08-09 03:27:45.599194', '2021-08-09 03:27:45.599194', NULL, 400, 19, 15, 2, 5, NULL, 38, NULL, NULL),
(607, '2021-08-09 03:27:45.661594', '2021-08-09 03:27:45.661594', NULL, 50, 19, 16, 2, 5, NULL, 38, NULL, NULL),
(608, '2021-08-09 03:27:45.708394', '2021-08-09 03:27:45.708394', NULL, 200, 19, 18, 2, 5, NULL, 38, NULL, NULL),
(609, '2021-08-09 03:27:45.781795', '2021-08-09 03:27:45.781795', NULL, 400, 19, 26, 2, 5, NULL, 38, NULL, NULL),
(610, '2021-08-09 03:27:45.830595', '2021-08-09 03:27:45.830595', NULL, 900, 19, 42, 2, 5, NULL, 38, NULL, NULL),
(611, '2021-08-09 03:27:45.892396', '2021-08-09 03:27:45.892396', NULL, 650, 19, 1, 2, 5, NULL, 38, NULL, NULL),
(612, '2021-08-09 03:27:45.939196', '2021-08-09 03:27:45.939196', NULL, 100, 19, 3, 2, 5, NULL, 38, NULL, NULL),
(613, '2021-08-09 03:27:45.985996', '2021-08-09 03:27:45.985996', NULL, 600, 19, 32, 2, 5, NULL, 38, NULL, NULL),
(614, '2021-08-09 03:27:46.048396', '2021-08-09 03:27:46.048396', NULL, 20, 19, 34, 2, 5, NULL, 38, NULL, NULL),
(615, '2021-08-09 03:27:46.110796', '2021-08-09 03:27:46.110796', NULL, 0, 19, 50, 2, 5, NULL, 38, NULL, NULL),
(616, '2021-08-09 03:27:46.157597', '2021-08-09 03:27:46.157597', NULL, 0, 19, 51, 2, 5, NULL, 38, NULL, NULL),
(617, '2021-08-09 03:27:46.266797', '2021-08-09 03:27:46.266797', 0, NULL, 19, NULL, 2, 5, 106, 38, NULL, NULL),
(618, '2021-08-09 03:27:46.313597', '2021-08-09 03:27:46.313597', NULL, 430, 19, 22, 2, 5, NULL, 38, NULL, NULL),
(619, '2021-08-09 03:27:46.344797', '2021-08-09 03:27:46.344797', 94, NULL, 19, NULL, 2, 5, 236, 38, NULL, NULL),
(620, '2021-08-09 03:27:46.391597', '2021-08-09 03:27:46.391597', 16, NULL, 19, NULL, 2, 5, 235, 38, NULL, NULL),
(621, '2021-08-09 03:27:46.438397', '2021-08-09 03:27:46.438397', NULL, 500, 19, 52, 2, 5, NULL, 38, NULL, NULL),
(622, '2021-08-09 03:27:46.485197', '2021-08-09 03:27:46.485197', NULL, 250, 19, 54, 2, 5, NULL, 38, NULL, NULL),
(623, '2021-08-09 03:27:46.531997', '2021-08-09 03:27:46.531997', NULL, 0, 19, 53, 2, 5, NULL, 38, NULL, NULL),
(624, '2021-08-09 03:27:46.594397', '2021-08-09 03:27:46.594397', NULL, 1750, 19, 55, 2, 5, NULL, 38, NULL, NULL),
(625, '2021-08-09 03:27:46.632598', '2021-08-09 03:27:46.632598', NULL, 0, 19, 56, 2, 5, NULL, 38, NULL, NULL),
(626, '2021-08-09 03:27:46.679398', '2021-08-09 03:27:46.679398', 0, NULL, 19, NULL, 2, 5, 190, 38, NULL, NULL),
(627, '2021-08-09 03:27:46.846399', '2021-08-09 03:27:46.846399', 1, NULL, 19, NULL, 2, 5, 126, 38, NULL, NULL),
(628, '2021-08-09 03:27:46.939999', '2021-08-09 03:27:46.939999', 1, NULL, 19, NULL, 2, 5, 135, 38, NULL, NULL),
(629, '2021-08-09 14:26:21.990608', '2021-08-09 14:26:21.990608', 1, NULL, 19, NULL, 2, 5, 122, 39, NULL, NULL),
(630, '2021-08-09 14:26:22.053008', '2021-08-09 14:26:22.053008', 1, NULL, 19, NULL, 2, 5, 116, 39, NULL, NULL),
(631, '2021-08-09 14:26:22.115409', '2021-08-09 14:26:22.115409', 1, NULL, 19, NULL, 2, 5, 162, 39, NULL, NULL),
(632, '2021-08-09 14:26:22.209009', '2021-08-09 14:26:22.209009', 0, NULL, 19, NULL, 2, 5, 160, 39, NULL, NULL),
(633, '2021-08-09 14:26:22.552209', '2021-08-09 14:26:22.552209', 1, NULL, 19, NULL, 2, 5, 128, 39, NULL, NULL),
(634, '2021-08-09 14:26:22.599009', '2021-08-09 14:26:22.599009', 0, NULL, 19, NULL, 2, 5, 124, 39, NULL, NULL),
(635, '2021-08-09 14:26:22.645809', '2021-08-09 14:26:22.645809', 1, NULL, 19, NULL, 2, 5, 133, 39, NULL, NULL),
(636, '2021-08-09 14:26:22.692610', '2021-08-09 14:26:22.692610', 1, NULL, 19, NULL, 2, 5, 139, 39, NULL, NULL),
(637, '2021-08-09 14:26:22.755010', '2021-08-09 14:26:22.755010', 1, NULL, 19, NULL, 2, 5, 141, 39, NULL, NULL),
(638, '2021-08-09 14:26:22.833010', '2021-08-09 14:26:22.833010', 1, NULL, 19, NULL, 2, 5, 149, 39, NULL, NULL),
(639, '2021-08-09 14:26:22.942210', '2021-08-09 14:26:22.942210', 1, NULL, 19, NULL, 2, 5, 131, 39, NULL, NULL),
(640, '2021-08-09 14:26:23.020210', '2021-08-09 14:26:23.020210', 0, NULL, 19, NULL, 2, 5, 129, 39, NULL, NULL),
(641, '2021-08-09 14:26:23.067010', '2021-08-09 14:26:23.067010', 1, NULL, 19, NULL, 2, 5, 145, 39, NULL, NULL),
(642, '2021-08-09 14:26:23.098210', '2021-08-09 14:26:23.098210', 2, NULL, 19, NULL, 2, 5, 108, 39, NULL, NULL),
(643, '2021-08-09 14:26:23.207410', '2021-08-09 14:26:23.207410', 1, NULL, 19, NULL, 2, 5, 110, 39, NULL, NULL),
(644, '2021-08-09 14:26:23.254211', '2021-08-09 14:26:23.254211', 1, NULL, 19, NULL, 2, 5, 112, 39, NULL, NULL),
(645, '2021-08-09 14:26:23.285411', '2021-08-09 14:26:23.285411', 22, NULL, 19, NULL, 2, 5, 86, 39, NULL, NULL),
(646, '2021-08-09 14:26:23.332211', '2021-08-09 14:26:23.332211', 23, NULL, 19, NULL, 2, 5, 84, 39, NULL, NULL),
(647, '2021-08-09 14:26:23.394611', '2021-08-09 14:26:23.394611', 33, NULL, 19, NULL, 2, 5, 88, 39, NULL, NULL),
(648, '2021-08-09 14:26:23.457011', '2021-08-09 14:26:23.457011', 0, NULL, 19, NULL, 2, 5, 193, 39, NULL, NULL),
(649, '2021-08-09 14:26:23.519411', '2021-08-09 14:26:23.519411', 14, NULL, 19, NULL, 2, 5, 85, 39, NULL, NULL),
(650, '2021-08-09 14:26:23.566211', '2021-08-09 14:26:23.566211', 18, NULL, 19, NULL, 2, 5, 87, 39, NULL, NULL),
(651, '2021-08-09 14:26:23.613011', '2021-08-09 14:26:23.613011', 25, NULL, 19, NULL, 2, 5, 81, 39, NULL, NULL),
(652, '2021-08-09 14:26:23.659811', '2021-08-09 14:26:23.659811', 0, NULL, 19, NULL, 2, 5, 89, 39, NULL, NULL),
(653, '2021-08-09 14:26:23.691011', '2021-08-09 14:26:23.691011', 87, NULL, 19, NULL, 2, 5, 101, 39, NULL, NULL),
(654, '2021-08-09 14:26:23.737811', '2021-08-09 14:26:23.737811', 15, NULL, 19, NULL, 2, 5, 103, 39, NULL, NULL),
(655, '2021-08-09 14:26:23.784611', '2021-08-09 14:26:23.784611', 4, NULL, 19, NULL, 2, 5, 227, 39, NULL, NULL),
(656, '2021-08-09 14:26:23.831412', '2021-08-09 14:26:23.831412', NULL, 650, 19, 5, 2, 5, NULL, 39, NULL, NULL),
(657, '2021-08-09 14:26:24.034212', '2021-08-09 14:26:24.034212', NULL, 310, 19, 4, 2, 5, NULL, 39, NULL, NULL),
(658, '2021-08-09 14:26:24.081012', '2021-08-09 14:26:24.081012', NULL, 680, 19, 19, 2, 5, NULL, 39, NULL, NULL),
(659, '2021-08-09 14:26:24.127812', '2021-08-09 14:26:24.127812', NULL, 490, 19, 29, 2, 5, NULL, 39, NULL, NULL),
(660, '2021-08-09 14:26:24.361812', '2021-08-09 14:26:24.361812', NULL, 1000, 19, 20, 2, 5, NULL, 39, NULL, NULL),
(661, '2021-08-09 14:26:24.408613', '2021-08-09 14:26:24.408613', NULL, 750, 19, 24, 2, 5, NULL, 39, NULL, NULL),
(662, '2021-08-09 14:26:24.471013', '2021-08-09 14:26:24.471013', NULL, 260, 19, 38, 2, 5, NULL, 39, NULL, NULL),
(663, '2021-08-09 14:26:24.517813', '2021-08-09 14:26:24.517813', NULL, 800, 19, 30, 2, 5, NULL, 39, NULL, NULL),
(664, '2021-08-09 14:26:24.549013', '2021-08-09 14:26:24.549013', NULL, 0, 19, 21, 2, 5, NULL, 39, NULL, NULL),
(665, '2021-08-09 14:26:24.595813', '2021-08-09 14:26:24.595813', NULL, 150, 19, 27, 2, 5, NULL, 39, NULL, NULL),
(666, '2021-08-09 14:26:24.642613', '2021-08-09 14:26:24.642613', NULL, 250, 19, 28, 2, 5, NULL, 39, NULL, NULL),
(667, '2021-08-09 14:26:24.689413', '2021-08-09 14:26:24.689413', NULL, 1100, 19, 25, 2, 5, NULL, 39, NULL, NULL),
(668, '2021-08-09 14:26:24.736213', '2021-08-09 14:26:24.736213', NULL, 700, 19, 31, 2, 5, NULL, 39, NULL, NULL),
(669, '2021-08-09 14:26:24.767413', '2021-08-09 14:26:24.767413', NULL, 650, 19, 10, 2, 5, NULL, 39, NULL, NULL),
(670, '2021-08-09 14:26:24.814213', '2021-08-09 14:26:24.814213', NULL, 710, 19, 13, 2, 5, NULL, 39, NULL, NULL),
(671, '2021-08-09 14:26:24.861013', '2021-08-09 14:26:24.861013', NULL, 400, 19, 15, 2, 5, NULL, 39, NULL, NULL),
(672, '2021-08-09 14:26:24.907813', '2021-08-09 14:26:24.907813', NULL, 50, 19, 16, 2, 5, NULL, 39, NULL, NULL),
(673, '2021-08-09 14:26:24.970214', '2021-08-09 14:26:24.970214', NULL, 200, 19, 18, 2, 5, NULL, 39, NULL, NULL),
(674, '2021-08-09 14:26:25.017014', '2021-08-09 14:26:25.017014', NULL, 400, 19, 26, 2, 5, NULL, 39, NULL, NULL),
(675, '2021-08-09 14:26:25.063814', '2021-08-09 14:26:25.063814', NULL, 885, 19, 42, 2, 5, NULL, 39, NULL, NULL),
(676, '2021-08-09 14:26:25.110614', '2021-08-09 14:26:25.110614', NULL, 650, 19, 1, 2, 5, NULL, 39, NULL, NULL),
(677, '2021-08-09 14:26:25.141814', '2021-08-09 14:26:25.141814', NULL, 100, 19, 3, 2, 5, NULL, 39, NULL, NULL),
(678, '2021-08-09 14:26:25.188614', '2021-08-09 14:26:25.188614', NULL, 600, 19, 32, 2, 5, NULL, 39, NULL, NULL),
(679, '2021-08-09 14:26:25.235414', '2021-08-09 14:26:25.235414', NULL, 1020, 19, 34, 2, 5, NULL, 39, NULL, NULL),
(680, '2021-08-09 14:26:25.344614', '2021-08-09 14:26:25.344614', NULL, 0, 19, 50, 2, 5, NULL, 39, NULL, NULL),
(681, '2021-08-09 14:26:25.485014', '2021-08-09 14:26:25.485014', NULL, 0, 19, 51, 2, 5, NULL, 39, NULL, NULL),
(682, '2021-08-09 14:26:25.547415', '2021-08-09 14:26:25.547415', 0, NULL, 19, NULL, 2, 5, 106, 39, NULL, NULL),
(683, '2021-08-09 14:26:25.594215', '2021-08-09 14:26:25.594215', NULL, 430, 19, 22, 2, 5, NULL, 39, NULL, NULL),
(684, '2021-08-09 14:26:25.656615', '2021-08-09 14:26:25.656615', 94, NULL, 19, NULL, 2, 5, 236, 39, NULL, NULL),
(685, '2021-08-09 14:26:25.687815', '2021-08-09 14:26:25.687815', 0, NULL, 19, NULL, 2, 5, 235, 39, NULL, NULL),
(686, '2021-08-09 14:26:25.734615', '2021-08-09 14:26:25.734615', NULL, 500, 19, 52, 2, 5, NULL, 39, NULL, NULL),
(687, '2021-08-09 14:26:25.781415', '2021-08-09 14:26:25.781415', NULL, 250, 19, 54, 2, 5, NULL, 39, NULL, NULL),
(688, '2021-08-09 14:26:25.812615', '2021-08-09 14:26:25.812615', NULL, 0, 19, 53, 2, 5, NULL, 39, NULL, NULL),
(689, '2021-08-09 14:26:25.906215', '2021-08-09 14:26:25.906215', NULL, 1750, 19, 55, 2, 5, NULL, 39, NULL, NULL),
(690, '2021-08-09 14:26:25.953015', '2021-08-09 14:26:25.953015', NULL, 0, 19, 56, 2, 5, NULL, 39, NULL, NULL),
(691, '2021-08-09 14:26:25.999815', '2021-08-09 14:26:25.999815', 0, NULL, 19, NULL, 2, 5, 190, 39, NULL, NULL),
(692, '2021-08-09 14:26:26.031015', '2021-08-09 14:26:26.031015', 1, NULL, 19, NULL, 2, 5, 126, 39, NULL, NULL),
(693, '2021-08-09 14:26:26.077815', '2021-08-09 14:26:26.077815', 1, NULL, 19, NULL, 2, 5, 135, 39, NULL, NULL),
(694, '2021-08-09 14:26:26.140216', '2021-08-09 14:26:26.140216', 1, NULL, 19, NULL, 2, 5, 118, 39, NULL, NULL),
(695, '2021-08-10 05:48:27.703162', '2021-08-10 05:48:27.703162', 1, NULL, 19, NULL, 2, 5, 122, 40, NULL, NULL),
(696, '2021-08-10 05:48:27.781162', '2021-08-10 05:48:27.781162', 1, NULL, 19, NULL, 2, 5, 116, 40, NULL, NULL),
(697, '2021-08-10 05:48:27.827962', '2021-08-10 05:48:27.827962', 1, NULL, 19, NULL, 2, 5, 162, 40, NULL, NULL),
(698, '2021-08-10 05:48:27.921562', '2021-08-10 05:48:27.921562', 0, NULL, 19, NULL, 2, 5, 160, 40, NULL, NULL),
(699, '2021-08-10 05:48:27.983962', '2021-08-10 05:48:27.983962', 1, NULL, 19, NULL, 2, 5, 128, 40, NULL, NULL),
(700, '2021-08-10 05:48:28.061962', '2021-08-10 05:48:28.061962', 0, NULL, 19, NULL, 2, 5, 124, 40, NULL, NULL),
(701, '2021-08-10 05:48:28.124362', '2021-08-10 05:48:28.124362', 1, NULL, 19, NULL, 2, 5, 133, 40, NULL, NULL),
(702, '2021-08-10 05:48:28.202362', '2021-08-10 05:48:28.202362', 1, NULL, 19, NULL, 2, 5, 139, 40, NULL, NULL),
(703, '2021-08-10 05:48:28.249163', '2021-08-10 05:48:28.249163', 1, NULL, 19, NULL, 2, 5, 141, 40, NULL, NULL),
(704, '2021-08-10 05:48:28.358363', '2021-08-10 05:48:28.358363', 1, NULL, 19, NULL, 2, 5, 149, 40, NULL, NULL),
(705, '2021-08-10 05:48:28.607963', '2021-08-10 05:48:28.607963', 1, NULL, 19, NULL, 2, 5, 131, 40, NULL, NULL),
(706, '2021-08-10 05:48:28.654763', '2021-08-10 05:48:28.654763', 0, NULL, 19, NULL, 2, 5, 129, 40, NULL, NULL),
(707, '2021-08-10 05:48:28.701563', '2021-08-10 05:48:28.701563', 1, NULL, 19, NULL, 2, 5, 145, 40, NULL, NULL),
(708, '2021-08-10 05:48:28.748363', '2021-08-10 05:48:28.748363', 2, NULL, 19, NULL, 2, 5, 108, 40, NULL, NULL),
(709, '2021-08-10 05:48:28.810763', '2021-08-10 05:48:28.810763', 1, NULL, 19, NULL, 2, 5, 110, 40, NULL, NULL),
(710, '2021-08-10 05:48:28.857564', '2021-08-10 05:48:28.857564', 1, NULL, 19, NULL, 2, 5, 112, 40, NULL, NULL),
(711, '2021-08-10 05:48:28.904364', '2021-08-10 05:48:28.904364', 22, NULL, 19, NULL, 2, 5, 86, 40, NULL, NULL),
(712, '2021-08-10 05:48:28.966764', '2021-08-10 05:48:28.966764', 23, NULL, 19, NULL, 2, 5, 84, 40, NULL, NULL),
(713, '2021-08-10 05:48:28.997964', '2021-08-10 05:48:29.013564', 33, NULL, 19, NULL, 2, 5, 88, 40, NULL, NULL),
(714, '2021-08-10 05:48:29.044764', '2021-08-10 05:48:29.044764', 0, NULL, 19, NULL, 2, 5, 193, 40, NULL, NULL),
(715, '2021-08-10 05:48:29.091564', '2021-08-10 05:48:29.091564', 14, NULL, 19, NULL, 2, 5, 85, 40, NULL, NULL),
(716, '2021-08-10 05:48:29.138364', '2021-08-10 05:48:29.138364', 18, NULL, 19, NULL, 2, 5, 87, 40, NULL, NULL),
(717, '2021-08-10 05:48:29.185164', '2021-08-10 05:48:29.185164', 25, NULL, 19, NULL, 2, 5, 81, 40, NULL, NULL),
(718, '2021-08-10 05:48:29.216364', '2021-08-10 05:48:29.216364', 0, NULL, 19, NULL, 2, 5, 89, 40, NULL, NULL),
(719, '2021-08-10 05:48:29.309964', '2021-08-10 05:48:29.309964', 87, NULL, 19, NULL, 2, 5, 101, 40, NULL, NULL),
(720, '2021-08-10 05:48:29.450365', '2021-08-10 05:48:29.450365', 15, NULL, 19, NULL, 2, 5, 103, 40, NULL, NULL),
(721, '2021-08-10 05:48:29.481565', '2021-08-10 05:48:29.481565', 4, NULL, 19, NULL, 2, 5, 227, 40, NULL, NULL),
(722, '2021-08-10 05:48:29.543965', '2021-08-10 05:48:29.543965', NULL, 650, 19, 5, 2, 5, NULL, 40, NULL, NULL),
(723, '2021-08-10 05:48:29.590765', '2021-08-10 05:48:29.590765', NULL, 310, 19, 4, 2, 5, NULL, 40, NULL, NULL),
(724, '2021-08-10 05:48:29.637565', '2021-08-10 05:48:29.637565', NULL, 680, 19, 19, 2, 5, NULL, 40, NULL, NULL),
(725, '2021-08-10 05:48:29.684365', '2021-08-10 05:48:29.684365', NULL, 490, 19, 29, 2, 5, NULL, 40, NULL, NULL),
(726, '2021-08-10 05:48:29.715565', '2021-08-10 05:48:29.715565', NULL, 1000, 19, 20, 2, 5, NULL, 40, NULL, NULL),
(727, '2021-08-10 05:48:29.762365', '2021-08-10 05:48:29.762365', NULL, 750, 19, 24, 2, 5, NULL, 40, NULL, NULL),
(728, '2021-08-10 05:48:29.824765', '2021-08-10 05:48:29.824765', NULL, 260, 19, 38, 2, 5, NULL, 40, NULL, NULL),
(729, '2021-08-10 05:48:29.887165', '2021-08-10 05:48:29.887165', NULL, 800, 19, 30, 2, 5, NULL, 40, NULL, NULL),
(730, '2021-08-10 05:48:30.027566', '2021-08-10 05:48:30.027566', NULL, 0, 19, 21, 2, 5, NULL, 40, NULL, NULL),
(731, '2021-08-10 05:48:30.089966', '2021-08-10 05:48:30.089966', NULL, 150, 19, 27, 2, 5, NULL, 40, NULL, NULL),
(732, '2021-08-10 05:48:30.121166', '2021-08-10 05:48:30.121166', NULL, 250, 19, 28, 2, 5, NULL, 40, NULL, NULL),
(733, '2021-08-10 05:48:30.167966', '2021-08-10 05:48:30.167966', NULL, 1100, 19, 25, 2, 5, NULL, 40, NULL, NULL),
(734, '2021-08-10 05:48:30.199166', '2021-08-10 05:48:30.199166', NULL, 700, 19, 31, 2, 5, NULL, 40, NULL, NULL),
(735, '2021-08-10 05:48:30.261566', '2021-08-10 05:48:30.261566', NULL, 650, 19, 10, 2, 5, NULL, 40, NULL, NULL),
(736, '2021-08-10 05:48:30.323966', '2021-08-10 05:48:30.323966', NULL, 710, 19, 13, 2, 5, NULL, 40, NULL, NULL),
(737, '2021-08-10 05:48:30.355166', '2021-08-10 05:48:30.355166', NULL, 400, 19, 15, 2, 5, NULL, 40, NULL, NULL),
(738, '2021-08-10 05:48:30.386366', '2021-08-10 05:48:30.386366', NULL, 50, 19, 16, 2, 5, NULL, 40, NULL, NULL),
(739, '2021-08-10 05:48:30.433166', '2021-08-10 05:48:30.433166', NULL, 200, 19, 18, 2, 5, NULL, 40, NULL, NULL),
(740, '2021-08-10 05:48:30.495566', '2021-08-10 05:48:30.495566', NULL, 400, 19, 26, 2, 5, NULL, 40, NULL, NULL),
(741, '2021-08-10 05:48:30.542367', '2021-08-10 05:48:30.542367', NULL, 885, 19, 42, 2, 5, NULL, 40, NULL, NULL),
(742, '2021-08-10 05:48:30.573567', '2021-08-10 05:48:30.573567', NULL, 650, 19, 1, 2, 5, NULL, 40, NULL, NULL),
(743, '2021-08-10 05:48:30.620367', '2021-08-10 05:48:30.620367', NULL, 100, 19, 3, 2, 5, NULL, 40, NULL, NULL),
(744, '2021-08-10 05:48:30.667167', '2021-08-10 05:48:30.667167', NULL, 600, 19, 32, 2, 5, NULL, 40, NULL, NULL),
(745, '2021-08-10 05:48:30.760767', '2021-08-10 05:48:30.760767', NULL, 1020, 19, 34, 2, 5, NULL, 40, NULL, NULL),
(746, '2021-08-10 05:48:30.791967', '2021-08-10 05:48:30.791967', NULL, 0, 19, 50, 2, 5, NULL, 40, NULL, NULL),
(747, '2021-08-10 05:48:30.854367', '2021-08-10 05:48:30.854367', NULL, 0, 19, 51, 2, 5, NULL, 40, NULL, NULL),
(748, '2021-08-10 05:48:30.901167', '2021-08-10 05:48:30.901167', 0, NULL, 19, NULL, 2, 5, 106, 40, NULL, NULL),
(749, '2021-08-10 05:48:30.947967', '2021-08-10 05:48:30.947967', NULL, 430, 19, 22, 2, 5, NULL, 40, NULL, NULL),
(750, '2021-08-10 05:48:30.994767', '2021-08-10 05:48:30.994767', 94, NULL, 19, NULL, 2, 5, 236, 40, NULL, NULL),
(751, '2021-08-10 05:48:31.057167', '2021-08-10 05:48:31.057167', 0, NULL, 19, NULL, 2, 5, 235, 40, NULL, NULL),
(752, '2021-08-10 05:48:31.103968', '2021-08-10 05:48:31.103968', NULL, 500, 19, 52, 2, 5, NULL, 40, NULL, NULL),
(753, '2021-08-10 05:48:31.135168', '2021-08-10 05:48:31.135168', NULL, 250, 19, 54, 2, 5, NULL, 40, NULL, NULL),
(754, '2021-08-10 05:48:31.181968', '2021-08-10 05:48:31.181968', NULL, 0, 19, 53, 2, 5, NULL, 40, NULL, NULL),
(755, '2021-08-10 05:48:31.213168', '2021-08-10 05:48:31.213168', NULL, 1750, 19, 55, 2, 5, NULL, 40, NULL, NULL),
(756, '2021-08-10 05:48:31.259968', '2021-08-10 05:48:31.259968', NULL, 0, 19, 56, 2, 5, NULL, 40, NULL, NULL),
(757, '2021-08-10 05:48:31.337968', '2021-08-10 05:48:31.337968', 2, NULL, 19, NULL, 2, 5, 190, 40, NULL, NULL),
(758, '2021-08-10 05:48:31.987376', '2021-08-10 05:48:31.987376', 1, NULL, 19, NULL, 2, 5, 126, 40, NULL, NULL),
(759, '2021-08-10 05:48:32.158976', '2021-08-10 05:48:32.158976', 1, NULL, 19, NULL, 2, 5, 135, 40, NULL, NULL),
(760, '2021-08-10 05:48:32.190176', '2021-08-10 05:48:32.190176', 1, NULL, 19, NULL, 2, 5, 118, 40, NULL, NULL),
(761, '2021-08-10 05:48:32.251977', '2021-08-10 05:48:32.251977', 1, NULL, 19, NULL, 2, 5, 200, 40, NULL, NULL),
(762, '2021-08-10 05:48:32.301980', '2021-08-10 05:48:32.301980', 1, NULL, 19, NULL, 2, 5, 187, 40, NULL, NULL),
(763, '2021-08-10 05:48:32.350983', '2021-08-10 05:48:32.350983', 1, NULL, 19, NULL, 2, 5, 184, 40, NULL, NULL),
(764, '2021-08-10 15:31:06.248905', '2021-08-10 15:31:06.248905', 1, NULL, 19, NULL, 2, 5, 122, 41, NULL, NULL),
(765, '2021-08-10 15:31:06.311909', '2021-08-10 15:31:06.311909', 1, NULL, 19, NULL, 2, 5, 116, 41, NULL, NULL),
(766, '2021-08-10 15:31:06.363912', '2021-08-10 15:31:06.363912', 1, NULL, 19, NULL, 2, 5, 162, 41, NULL, NULL),
(767, '2021-08-10 15:31:06.413915', '2021-08-10 15:31:06.413915', 0, NULL, 19, NULL, 2, 5, 160, 41, NULL, NULL),
(768, '2021-08-10 15:31:06.455917', '2021-08-10 15:31:06.455917', 1, NULL, 19, NULL, 2, 5, 128, 41, NULL, NULL),
(769, '2021-08-10 15:31:06.505920', '2021-08-10 15:31:06.506920', 0, NULL, 19, NULL, 2, 5, 124, 41, NULL, NULL),
(770, '2021-08-10 15:31:06.548922', '2021-08-10 15:31:06.548922', 0, NULL, 19, NULL, 2, 5, 133, 41, NULL, NULL),
(771, '2021-08-10 15:31:06.605926', '2021-08-10 15:31:06.605926', 1, NULL, 19, NULL, 2, 5, 139, 41, NULL, NULL),
(772, '2021-08-10 15:31:06.646928', '2021-08-10 15:31:06.646928', 1, NULL, 19, NULL, 2, 5, 141, 41, NULL, NULL),
(773, '2021-08-10 15:31:06.696931', '2021-08-10 15:31:06.696931', 1, NULL, 19, NULL, 2, 5, 149, 41, NULL, NULL),
(774, '2021-08-10 15:31:06.738933', '2021-08-10 15:31:06.738933', 1, NULL, 19, NULL, 2, 5, 131, 41, NULL, NULL),
(775, '2021-08-10 15:31:06.789936', '2021-08-10 15:31:06.789936', 0, NULL, 19, NULL, 2, 5, 129, 41, NULL, NULL),
(776, '2021-08-10 15:31:06.830938', '2021-08-10 15:31:06.830938', 1, NULL, 19, NULL, 2, 5, 145, 41, NULL, NULL),
(777, '2021-08-10 15:31:06.904943', '2021-08-10 15:31:06.904943', 1, NULL, 19, NULL, 2, 5, 108, 41, NULL, NULL),
(778, '2021-08-10 15:31:06.962946', '2021-08-10 15:31:06.962946', 1, NULL, 19, NULL, 2, 5, 110, 41, NULL, NULL),
(779, '2021-08-10 15:31:07.004948', '2021-08-10 15:31:07.004948', 1, NULL, 19, NULL, 2, 5, 112, 41, NULL, NULL),
(780, '2021-08-10 15:31:07.057951', '2021-08-10 15:31:07.057951', 5, NULL, 19, NULL, 2, 5, 86, 41, NULL, NULL),
(781, '2021-08-10 15:31:07.259963', '2021-08-10 15:31:07.259963', 8, NULL, 19, NULL, 2, 5, 84, 41, NULL, NULL),
(782, '2021-08-10 15:31:07.497977', '2021-08-10 15:31:07.497977', 33, NULL, 19, NULL, 2, 5, 88, 41, NULL, NULL),
(783, '2021-08-10 15:31:07.547979', '2021-08-10 15:31:07.547979', 0, NULL, 19, NULL, 2, 5, 193, 41, NULL, NULL),
(784, '2021-08-10 15:31:07.589982', '2021-08-10 15:31:07.589982', 12, NULL, 19, NULL, 2, 5, 85, 41, NULL, NULL),
(785, '2021-08-10 15:31:07.631984', '2021-08-10 15:31:07.631984', 9, NULL, 19, NULL, 2, 5, 87, 41, NULL, NULL),
(786, '2021-08-10 15:31:07.706988', '2021-08-10 15:31:07.706988', 23, NULL, 19, NULL, 2, 5, 81, 41, NULL, NULL),
(787, '2021-08-10 15:31:07.756991', '2021-08-10 15:31:07.756991', 0, NULL, 19, NULL, 2, 5, 89, 41, NULL, NULL),
(788, '2021-08-10 15:31:07.798994', '2021-08-10 15:31:07.798994', 50, NULL, 19, NULL, 2, 5, 101, 41, NULL, NULL),
(789, '2021-08-10 15:31:07.863997', '2021-08-10 15:31:07.863997', 1, NULL, 19, NULL, 2, 5, 103, 41, NULL, NULL),
(790, '2021-08-10 15:31:07.908000', '2021-08-10 15:31:07.908000', 3, NULL, 19, NULL, 2, 5, 227, 41, NULL, NULL),
(791, '2021-08-10 15:31:07.948002', '2021-08-10 15:31:07.948002', NULL, 650, 19, 5, 2, 5, NULL, 41, NULL, NULL),
(792, '2021-08-10 15:31:07.999005', '2021-08-10 15:31:07.999005', NULL, 630, 19, 4, 2, 5, NULL, 41, NULL, NULL),
(793, '2021-08-10 15:31:08.064009', '2021-08-10 15:31:08.064009', NULL, 520, 19, 19, 2, 5, NULL, 41, NULL, NULL),
(794, '2021-08-10 15:31:08.199017', '2021-08-10 15:31:08.199017', NULL, 450, 19, 29, 2, 5, NULL, 41, NULL, NULL),
(795, '2021-08-10 15:31:08.282021', '2021-08-10 15:31:08.282021', NULL, 820, 19, 20, 2, 5, NULL, 41, NULL, NULL),
(796, '2021-08-10 15:31:08.330024', '2021-08-10 15:31:08.330024', NULL, 750, 19, 24, 2, 5, NULL, 41, NULL, NULL),
(797, '2021-08-10 15:31:08.372027', '2021-08-10 15:31:08.372027', NULL, 120, 19, 38, 2, 5, NULL, 41, NULL, NULL),
(798, '2021-08-10 15:31:08.415029', '2021-08-10 15:31:08.415029', NULL, 800, 19, 30, 2, 5, NULL, 41, NULL, NULL),
(799, '2021-08-10 15:31:08.497034', '2021-08-10 15:31:08.497034', NULL, 0, 19, 21, 2, 5, NULL, 41, NULL, NULL),
(800, '2021-08-10 15:31:08.550037', '2021-08-10 15:31:08.550037', NULL, 150, 19, 27, 2, 5, NULL, 41, NULL, NULL),
(801, '2021-08-10 15:31:08.613040', '2021-08-10 15:31:08.613040', NULL, 250, 19, 28, 2, 5, NULL, 41, NULL, NULL),
(802, '2021-08-10 15:31:08.672044', '2021-08-10 15:31:08.672044', NULL, 1100, 19, 25, 2, 5, NULL, 41, NULL, NULL),
(803, '2021-08-10 15:31:08.720046', '2021-08-10 15:31:08.720046', NULL, 700, 19, 31, 2, 5, NULL, 41, NULL, NULL),
(804, '2021-08-10 15:31:08.761049', '2021-08-10 15:31:08.762049', NULL, 650, 19, 10, 2, 5, NULL, 41, NULL, NULL),
(805, '2021-08-10 15:31:08.804051', '2021-08-10 15:31:08.804051', NULL, 690, 19, 13, 2, 5, NULL, 41, NULL, NULL),
(806, '2021-08-10 15:31:08.868055', '2021-08-10 15:31:08.869055', NULL, 400, 19, 15, 2, 5, NULL, 41, NULL, NULL),
(807, '2021-08-10 15:31:08.944059', '2021-08-10 15:31:08.944059', NULL, 50, 19, 16, 2, 5, NULL, 41, NULL, NULL),
(808, '2021-08-10 15:31:08.981061', '2021-08-10 15:31:08.981061', NULL, 100, 19, 18, 2, 5, NULL, 41, NULL, NULL),
(809, '2021-08-10 15:31:09.023064', '2021-08-10 15:31:09.023064', NULL, 400, 19, 26, 2, 5, NULL, 41, NULL, NULL),
(810, '2021-08-10 15:31:09.261077', '2021-08-10 15:31:09.261077', NULL, 675, 19, 42, 2, 5, NULL, 41, NULL, NULL),
(811, '2021-08-10 15:31:09.307080', '2021-08-10 15:31:09.307080', NULL, 650, 19, 1, 2, 5, NULL, 41, NULL, NULL),
(812, '2021-08-10 15:31:09.343082', '2021-08-10 15:31:09.343082', NULL, 100, 19, 3, 2, 5, NULL, 41, NULL, NULL),
(813, '2021-08-10 15:31:09.383084', '2021-08-10 15:31:09.383084', NULL, 600, 19, 32, 2, 5, NULL, 41, NULL, NULL),
(814, '2021-08-10 15:31:09.451088', '2021-08-10 15:31:09.451088', NULL, 1020, 19, 34, 2, 5, NULL, 41, NULL, NULL),
(815, '2021-08-10 15:31:09.506091', '2021-08-10 15:31:09.507091', NULL, 0, 19, 50, 2, 5, NULL, 41, NULL, NULL),
(816, '2021-08-10 15:31:09.552094', '2021-08-10 15:31:09.552094', NULL, 0, 19, 51, 2, 5, NULL, 41, NULL, NULL),
(817, '2021-08-10 15:31:09.583294', '2021-08-10 15:31:09.583294', 0, NULL, 19, NULL, 2, 5, 106, 41, NULL, NULL),
(818, '2021-08-10 15:31:09.648496', '2021-08-10 15:31:09.648496', NULL, 0, 19, 22, 2, 5, NULL, 41, NULL, NULL),
(819, '2021-08-10 15:31:09.692499', '2021-08-10 15:31:09.692499', 93, NULL, 19, NULL, 2, 5, 236, 41, NULL, NULL),
(820, '2021-08-10 15:31:09.743502', '2021-08-10 15:31:09.743502', 86, NULL, 19, NULL, 2, 5, 235, 41, NULL, NULL),
(821, '2021-08-10 15:31:09.811505', '2021-08-10 15:31:09.811505', NULL, 250, 19, 52, 2, 5, NULL, 41, NULL, NULL),
(822, '2021-08-10 15:31:09.855508', '2021-08-10 15:31:09.855508', NULL, 250, 19, 54, 2, 5, NULL, 41, NULL, NULL),
(823, '2021-08-10 15:31:09.917908', '2021-08-10 15:31:09.917908', NULL, 0, 19, 53, 2, 5, NULL, 41, NULL, NULL),
(824, '2021-08-10 15:31:09.964708', '2021-08-10 15:31:09.964708', NULL, 1750, 19, 55, 2, 5, NULL, 41, NULL, NULL),
(825, '2021-08-10 15:31:10.011508', '2021-08-10 15:31:10.011508', NULL, 0, 19, 56, 2, 5, NULL, 41, NULL, NULL),
(826, '2021-08-10 15:31:10.042708', '2021-08-10 15:31:10.042708', 2, NULL, 19, NULL, 2, 5, 190, 41, NULL, NULL),
(827, '2021-08-10 15:31:10.136308', '2021-08-10 15:31:10.136308', 1, NULL, 19, NULL, 2, 5, 126, 41, NULL, NULL),
(828, '2021-08-10 15:31:10.198709', '2021-08-10 15:31:10.198709', 1, NULL, 19, NULL, 2, 5, 135, 41, NULL, NULL),
(829, '2021-08-10 15:31:10.270109', '2021-08-10 15:31:10.271109', 1, NULL, 19, NULL, 2, 5, 118, 41, NULL, NULL),
(830, '2021-08-10 15:31:10.332113', '2021-08-10 15:31:10.332113', 1, NULL, 19, NULL, 2, 5, 200, 41, NULL, NULL),
(831, '2021-08-10 15:31:10.369115', '2021-08-10 15:31:10.369115', 1, NULL, 19, NULL, 2, 5, 187, 41, NULL, NULL),
(832, '2021-08-10 15:31:10.429118', '2021-08-10 15:31:10.429118', 1, NULL, 19, NULL, 2, 5, 184, 41, NULL, NULL),
(833, '2021-08-10 15:31:10.468120', '2021-08-10 15:31:10.468120', 1, NULL, 19, NULL, 2, 5, 82, 41, NULL, NULL),
(834, '2021-08-12 12:01:54.040388', '2021-08-12 12:01:54.040388', 1, NULL, 19, NULL, 2, 5, 122, 42, NULL, NULL),
(835, '2021-08-12 12:01:54.102788', '2021-08-12 12:01:54.102788', 1, NULL, 19, NULL, 2, 5, 116, 42, NULL, NULL),
(836, '2021-08-12 12:01:54.165188', '2021-08-12 12:01:54.165188', 1, NULL, 19, NULL, 2, 5, 162, 42, NULL, NULL),
(837, '2021-08-12 12:01:54.258789', '2021-08-12 12:01:54.258789', 0, NULL, 19, NULL, 2, 5, 160, 42, NULL, NULL),
(838, '2021-08-12 12:01:54.336789', '2021-08-12 12:01:54.336789', 1, NULL, 19, NULL, 2, 5, 128, 42, NULL, NULL),
(839, '2021-08-12 12:01:54.383589', '2021-08-12 12:01:54.383589', 1, NULL, 19, NULL, 2, 5, 124, 42, NULL, NULL),
(840, '2021-08-12 12:01:54.430389', '2021-08-12 12:01:54.430389', 1, NULL, 19, NULL, 2, 5, 133, 42, NULL, NULL),
(841, '2021-08-12 12:01:54.477189', '2021-08-12 12:01:54.477189', 1, NULL, 19, NULL, 2, 5, 139, 42, NULL, NULL),
(842, '2021-08-12 12:01:54.523989', '2021-08-12 12:01:54.523989', 1, NULL, 19, NULL, 2, 5, 141, 42, NULL, NULL),
(843, '2021-08-12 12:01:54.570789', '2021-08-12 12:01:54.570789', 1, NULL, 19, NULL, 2, 5, 149, 42, NULL, NULL),
(844, '2021-08-12 12:01:54.633189', '2021-08-12 12:01:54.633189', 1, NULL, 19, NULL, 2, 5, 131, 42, NULL, NULL),
(845, '2021-08-12 12:01:54.664389', '2021-08-12 12:01:54.664389', 0, NULL, 19, NULL, 2, 5, 129, 42, NULL, NULL),
(846, '2021-08-12 12:01:54.711189', '2021-08-12 12:01:54.711189', 1, NULL, 19, NULL, 2, 5, 145, 42, NULL, NULL),
(847, '2021-08-12 12:01:54.757989', '2021-08-12 12:01:54.757989', 2, NULL, 19, NULL, 2, 5, 108, 42, NULL, NULL),
(848, '2021-08-12 12:01:54.804790', '2021-08-12 12:01:54.804790', 1, NULL, 19, NULL, 2, 5, 110, 42, NULL, NULL),
(849, '2021-08-12 12:01:54.851590', '2021-08-12 12:01:54.851590', 1, NULL, 19, NULL, 2, 5, 112, 42, NULL, NULL),
(850, '2021-08-12 12:01:54.945190', '2021-08-12 12:01:54.945190', 22, NULL, 19, NULL, 2, 5, 86, 42, NULL, NULL),
(851, '2021-08-12 12:01:55.038790', '2021-08-12 12:01:55.038790', 13, NULL, 19, NULL, 2, 5, 84, 42, NULL, NULL),
(852, '2021-08-12 12:01:55.147990', '2021-08-12 12:01:55.147990', 33, NULL, 19, NULL, 2, 5, 88, 42, NULL, NULL),
(853, '2021-08-12 12:01:55.225990', '2021-08-12 12:01:55.225990', 0, NULL, 19, NULL, 2, 5, 193, 42, NULL, NULL),
(854, '2021-08-12 12:01:55.397591', '2021-08-12 12:01:55.397591', 53, NULL, 19, NULL, 2, 5, 85, 42, NULL, NULL),
(855, '2021-08-12 12:01:55.631591', '2021-08-12 12:01:55.631591', 0, NULL, 19, NULL, 2, 5, 87, 42, NULL, NULL),
(856, '2021-08-12 12:01:55.943592', '2021-08-12 12:01:55.943592', 12, NULL, 19, NULL, 2, 5, 81, 42, NULL, NULL),
(857, '2021-08-12 12:01:55.990392', '2021-08-12 12:01:55.990392', 0, NULL, 19, NULL, 2, 5, 89, 42, NULL, NULL),
(858, '2021-08-12 12:01:56.037192', '2021-08-12 12:01:56.037192', 103, NULL, 19, NULL, 2, 5, 101, 42, NULL, NULL),
(859, '2021-08-12 12:01:56.083992', '2021-08-12 12:01:56.083992', 1, NULL, 19, NULL, 2, 5, 103, 42, NULL, NULL),
(860, '2021-08-12 12:01:56.137792', '2021-08-12 12:01:56.137792', 7, NULL, 19, NULL, 2, 5, 227, 42, NULL, NULL),
(861, '2021-08-12 12:01:56.184592', '2021-08-12 12:01:56.184592', NULL, 650, 19, 5, 2, 5, NULL, 42, NULL, NULL),
(862, '2021-08-12 12:01:56.215792', '2021-08-12 12:01:56.215792', NULL, 530, 19, 4, 2, 5, NULL, 42, NULL, NULL),
(863, '2021-08-12 12:01:56.293793', '2021-08-12 12:01:56.293793', NULL, 470, 19, 19, 2, 5, NULL, 42, NULL, NULL),
(864, '2021-08-12 12:01:56.340593', '2021-08-12 12:01:56.340593', NULL, 450, 19, 29, 2, 5, NULL, 42, NULL, NULL),
(865, '2021-08-12 12:01:56.486394', '2021-08-12 12:01:56.486394', NULL, 760, 19, 20, 2, 5, NULL, 42, NULL, NULL),
(866, '2021-08-12 12:01:56.579994', '2021-08-12 12:01:56.579994', NULL, 750, 19, 24, 2, 5, NULL, 42, NULL, NULL),
(867, '2021-08-12 12:01:56.611194', '2021-08-12 12:01:56.611194', NULL, 120, 19, 38, 2, 5, NULL, 42, NULL, NULL),
(868, '2021-08-12 12:01:56.657994', '2021-08-12 12:01:56.657994', NULL, 800, 19, 30, 2, 5, NULL, 42, NULL, NULL),
(869, '2021-08-12 12:01:56.704794', '2021-08-12 12:01:56.704794', NULL, 0, 19, 21, 2, 5, NULL, 42, NULL, NULL),
(870, '2021-08-12 12:01:56.751595', '2021-08-12 12:01:56.751595', NULL, 150, 19, 27, 2, 5, NULL, 42, NULL, NULL),
(871, '2021-08-12 12:01:56.782795', '2021-08-12 12:01:56.782795', NULL, 250, 19, 28, 2, 5, NULL, 42, NULL, NULL),
(872, '2021-08-12 12:01:56.829595', '2021-08-12 12:01:56.829595', NULL, 300, 19, 25, 2, 5, NULL, 42, NULL, NULL),
(873, '2021-08-12 12:01:56.954395', '2021-08-12 12:01:56.954395', NULL, 700, 19, 31, 2, 5, NULL, 42, NULL, NULL),
(874, '2021-08-12 12:01:57.126995', '2021-08-12 12:01:57.126995', NULL, 650, 19, 10, 2, 5, NULL, 42, NULL, NULL),
(875, '2021-08-12 12:01:57.293005', '2021-08-12 12:01:57.293005', NULL, 540, 19, 13, 2, 5, NULL, 42, NULL, NULL),
(876, '2021-08-12 12:01:57.442212', '2021-08-12 12:01:57.442212', NULL, 400, 19, 15, 2, 5, NULL, 42, NULL, NULL),
(877, '2021-08-12 12:01:57.555218', '2021-08-12 12:01:57.555218', NULL, 50, 19, 16, 2, 5, NULL, 42, NULL, NULL),
(878, '2021-08-12 12:01:57.737026', '2021-08-12 12:01:57.737026', NULL, 1100, 19, 18, 2, 5, NULL, 42, NULL, NULL),
(879, '2021-08-12 12:01:57.826031', '2021-08-12 12:01:57.826031', NULL, 650, 19, 26, 2, 5, NULL, 42, NULL, NULL),
(880, '2021-08-12 12:01:57.921036', '2021-08-12 12:01:57.921036', NULL, 645, 19, 42, 2, 5, NULL, 42, NULL, NULL),
(881, '2021-08-12 12:01:58.018438', '2021-08-12 12:01:58.018438', NULL, 250, 19, 1, 2, 5, NULL, 42, NULL, NULL),
(882, '2021-08-12 12:01:58.075640', '2021-08-12 12:01:58.075640', NULL, 100, 19, 3, 2, 5, NULL, 42, NULL, NULL),
(883, '2021-08-12 12:01:58.169240', '2021-08-12 12:01:58.169240', NULL, 600, 19, 32, 2, 5, NULL, 42, NULL, NULL),
(884, '2021-08-12 12:01:58.204841', '2021-08-12 12:01:58.204841', NULL, 1020, 19, 34, 2, 5, NULL, 42, NULL, NULL),
(885, '2021-08-12 12:01:58.251641', '2021-08-12 12:01:58.251641', NULL, 125, 19, 50, 2, 5, NULL, 42, NULL, NULL),
(886, '2021-08-12 12:01:58.298441', '2021-08-12 12:01:58.298441', NULL, 0, 19, 51, 2, 5, NULL, 42, NULL, NULL),
(887, '2021-08-12 12:01:58.360842', '2021-08-12 12:01:58.360842', 0, NULL, 19, NULL, 2, 5, 106, 42, NULL, NULL),
(888, '2021-08-12 12:01:58.392042', '2021-08-12 12:01:58.392042', NULL, 0, 19, 22, 2, 5, NULL, 42, NULL, NULL),
(889, '2021-08-12 12:01:58.470042', '2021-08-12 12:01:58.470042', 84, NULL, 19, NULL, 2, 5, 236, 42, NULL, NULL),
(890, '2021-08-12 12:01:58.532442', '2021-08-12 12:01:58.532442', 77, NULL, 19, NULL, 2, 5, 235, 42, NULL, NULL),
(891, '2021-08-12 12:01:58.610442', '2021-08-12 12:01:58.610442', NULL, 0, 19, 52, 2, 5, NULL, 42, NULL, NULL),
(892, '2021-08-12 12:01:58.671243', '2021-08-12 12:01:58.671243', NULL, 250, 19, 54, 2, 5, NULL, 42, NULL, NULL),
(893, '2021-08-12 12:01:58.718043', '2021-08-12 12:01:58.718043', NULL, 0, 19, 53, 2, 5, NULL, 42, NULL, NULL),
(894, '2021-08-12 12:01:58.766843', '2021-08-12 12:01:58.766843', NULL, 1500, 19, 55, 2, 5, NULL, 42, NULL, NULL),
(895, '2021-08-12 12:01:58.813044', '2021-08-12 12:01:58.813044', NULL, 0, 19, 56, 2, 5, NULL, 42, NULL, NULL),
(896, '2021-08-12 12:01:58.833644', '2021-08-12 12:01:58.833644', 2, NULL, 19, NULL, 2, 5, 190, 42, NULL, NULL),
(897, '2021-08-12 12:01:58.880444', '2021-08-12 12:01:58.880444', 0, NULL, 19, NULL, 2, 5, 126, 42, NULL, NULL),
(898, '2021-08-12 12:01:58.924645', '2021-08-12 12:01:58.924645', 1, NULL, 19, NULL, 2, 5, 135, 42, NULL, NULL),
(899, '2021-08-12 12:01:59.111449', '2021-08-12 12:01:59.111449', 1, NULL, 19, NULL, 2, 5, 118, 42, NULL, NULL),
(900, '2021-08-12 12:01:59.158249', '2021-08-12 12:01:59.158249', 1, NULL, 19, NULL, 2, 5, 200, 42, NULL, NULL),
(901, '2021-08-12 12:01:59.189449', '2021-08-12 12:01:59.189449', 1, NULL, 19, NULL, 2, 5, 187, 42, NULL, NULL),
(902, '2021-08-12 12:01:59.251849', '2021-08-12 12:01:59.251849', 1, NULL, 19, NULL, 2, 5, 184, 42, NULL, NULL),
(903, '2021-08-12 12:01:59.283049', '2021-08-12 12:01:59.283049', 1, NULL, 19, NULL, 2, 5, 82, 42, NULL, NULL),
(904, '2021-08-12 12:01:59.356450', '2021-08-12 12:01:59.356450', 44, NULL, 19, NULL, 2, 5, 257, 42, NULL, NULL),
(905, '2021-08-12 12:01:59.403250', '2021-08-12 12:01:59.403250', NULL, 700, 19, 37, 2, 5, NULL, 42, NULL, NULL),
(906, '2021-08-12 12:01:59.434450', '2021-08-12 12:01:59.434450', 25, NULL, 19, NULL, 2, 5, 104, 42, NULL, NULL),
(907, '2021-08-12 12:01:59.496850', '2021-08-12 12:01:59.496850', 32, NULL, 19, NULL, 2, 5, 102, 42, NULL, NULL),
(908, '2021-08-12 12:01:59.528050', '2021-08-12 12:01:59.528050', 20, NULL, 19, NULL, 2, 5, 107, 42, NULL, NULL),
(909, '2021-08-12 12:01:59.559250', '2021-08-12 12:01:59.559250', 60, NULL, 19, NULL, 2, 5, 105, 42, NULL, NULL),
(910, '2021-09-01 02:36:22.338540', '2021-09-01 02:36:22.338540', 1, NULL, 19, NULL, 2, 5, 122, 43, NULL, NULL),
(911, '2021-09-01 02:36:22.400940', '2021-09-01 02:36:22.400940', 1, NULL, 19, NULL, 2, 5, 116, 43, NULL, NULL),
(912, '2021-09-01 02:36:22.463340', '2021-09-01 02:36:22.463340', 1, NULL, 19, NULL, 2, 5, 162, 43, NULL, NULL),
(913, '2021-09-01 02:36:22.525740', '2021-09-01 02:36:22.525740', 0, NULL, 19, NULL, 2, 5, 160, 43, NULL, NULL),
(914, '2021-09-01 02:36:22.572540', '2021-09-01 02:36:22.572540', 1, NULL, 19, NULL, 2, 5, 128, 43, NULL, NULL),
(915, '2021-09-01 02:36:22.619340', '2021-09-01 02:36:22.619340', 1, NULL, 19, NULL, 2, 5, 124, 43, NULL, NULL),
(916, '2021-09-01 02:36:22.666140', '2021-09-01 02:36:22.666140', 1, NULL, 19, NULL, 2, 5, 133, 43, NULL, NULL),
(917, '2021-09-01 02:36:22.744140', '2021-09-01 02:36:22.744140', 1, NULL, 19, NULL, 2, 5, 139, 43, NULL, NULL),
(918, '2021-09-01 02:36:22.806541', '2021-09-01 02:36:22.806541', 1, NULL, 19, NULL, 2, 5, 141, 43, NULL, NULL),
(919, '2021-09-01 02:36:22.868941', '2021-09-01 02:36:22.868941', 1, NULL, 19, NULL, 2, 5, 149, 43, NULL, NULL);
INSERT INTO `product_app_item_balance_log` (`id`, `created_at`, `updated_at`, `quantity`, `size`, `client_id`, `commodity_id`, `created_by_id`, `division_id`, `product_id`, `shift_work_id`, `updated_by_id`, `user_id`) VALUES
(920, '2021-09-01 02:36:22.915741', '2021-09-01 02:36:22.915741', 1, NULL, 19, NULL, 2, 5, 131, 43, NULL, NULL),
(921, '2021-09-01 02:36:22.978141', '2021-09-01 02:36:22.978141', 0, NULL, 19, NULL, 2, 5, 129, 43, NULL, NULL),
(922, '2021-09-01 02:36:23.009341', '2021-09-01 02:36:23.009341', 1, NULL, 19, NULL, 2, 5, 145, 43, NULL, NULL),
(923, '2021-09-01 02:36:23.134141', '2021-09-01 02:36:23.134141', 0, NULL, 19, NULL, 2, 5, 108, 43, NULL, NULL),
(924, '2021-09-01 02:36:23.583744', '2021-09-01 02:36:23.583744', 1, NULL, 19, NULL, 2, 5, 110, 43, NULL, NULL),
(925, '2021-09-01 02:36:23.630544', '2021-09-01 02:36:23.630544', 1, NULL, 19, NULL, 2, 5, 112, 43, NULL, NULL),
(926, '2021-09-01 02:36:23.661744', '2021-09-01 02:36:23.661744', 18, NULL, 19, NULL, 2, 5, 86, 43, NULL, NULL),
(927, '2021-09-01 02:36:23.724145', '2021-09-01 02:36:23.724145', 4, NULL, 19, NULL, 2, 5, 84, 43, NULL, NULL),
(928, '2021-09-01 02:36:23.770945', '2021-09-01 02:36:23.770945', 33, NULL, 19, NULL, 2, 5, 88, 43, NULL, NULL),
(929, '2021-09-01 02:36:23.836345', '2021-09-01 02:36:23.836345', 0, NULL, 19, NULL, 2, 5, 193, 43, NULL, NULL),
(930, '2021-09-01 02:36:23.883145', '2021-09-01 02:36:23.883145', 53, NULL, 19, NULL, 2, 5, 85, 43, NULL, NULL),
(931, '2021-09-01 02:36:23.929945', '2021-09-01 02:36:23.929945', 0, NULL, 19, NULL, 2, 5, 87, 43, NULL, NULL),
(932, '2021-09-01 02:36:23.976745', '2021-09-01 02:36:23.976745', 4, NULL, 19, NULL, 2, 5, 81, 43, NULL, NULL),
(933, '2021-09-01 02:36:24.007945', '2021-09-01 02:36:24.007945', 0, NULL, 19, NULL, 2, 5, 89, 43, NULL, NULL),
(934, '2021-09-01 02:36:24.070345', '2021-09-01 02:36:24.070345', 82, NULL, 19, NULL, 2, 5, 101, 43, NULL, NULL),
(935, '2021-09-01 02:36:24.148345', '2021-09-01 02:36:24.148345', 1, NULL, 19, NULL, 2, 5, 103, 43, NULL, NULL),
(936, '2021-09-01 02:36:24.195146', '2021-09-01 02:36:24.195146', 7, NULL, 19, NULL, 2, 5, 227, 43, NULL, NULL),
(937, '2021-09-01 02:36:24.241946', '2021-09-01 02:36:24.241946', NULL, 650, 19, 5, 2, 5, NULL, 43, NULL, NULL),
(938, '2021-09-01 02:36:24.288746', '2021-09-01 02:36:24.288746', NULL, 480, 19, 4, 2, 5, NULL, 43, NULL, NULL),
(939, '2021-09-01 02:36:24.335546', '2021-09-01 02:36:24.335546', NULL, 470, 19, 19, 2, 5, NULL, 43, NULL, NULL),
(940, '2021-09-01 02:36:24.382346', '2021-09-01 02:36:24.382346', NULL, 450, 19, 29, 2, 5, NULL, 43, NULL, NULL),
(941, '2021-09-01 02:36:24.460346', '2021-09-01 02:36:24.460346', NULL, 760, 19, 20, 2, 5, NULL, 43, NULL, NULL),
(942, '2021-09-01 02:36:24.491546', '2021-09-01 02:36:24.491546', NULL, 750, 19, 24, 2, 5, NULL, 43, NULL, NULL),
(943, '2021-09-01 02:36:24.538346', '2021-09-01 02:36:24.538346', NULL, 120, 19, 38, 2, 5, NULL, 43, NULL, NULL),
(944, '2021-09-01 02:36:24.585146', '2021-09-01 02:36:24.585146', NULL, 800, 19, 30, 2, 5, NULL, 43, NULL, NULL),
(945, '2021-09-01 02:36:24.631946', '2021-09-01 02:36:24.631946', NULL, 0, 19, 21, 2, 5, NULL, 43, NULL, NULL),
(946, '2021-09-01 02:36:24.678746', '2021-09-01 02:36:24.678746', NULL, 150, 19, 27, 2, 5, NULL, 43, NULL, NULL),
(947, '2021-09-01 02:36:24.725546', '2021-09-01 02:36:24.725546', NULL, 250, 19, 28, 2, 5, NULL, 43, NULL, NULL),
(948, '2021-09-01 02:36:24.756747', '2021-09-01 02:36:24.756747', NULL, 300, 19, 25, 2, 5, NULL, 43, NULL, NULL),
(949, '2021-09-01 02:36:24.819147', '2021-09-01 02:36:24.819147', NULL, 700, 19, 31, 2, 5, NULL, 43, NULL, NULL),
(950, '2021-09-01 02:36:24.897147', '2021-09-01 02:36:24.897147', NULL, 650, 19, 10, 2, 5, NULL, 43, NULL, NULL),
(951, '2021-09-01 02:36:24.943947', '2021-09-01 02:36:24.943947', NULL, 540, 19, 13, 2, 5, NULL, 43, NULL, NULL),
(952, '2021-09-01 02:36:24.990747', '2021-09-01 02:36:24.990747', NULL, 400, 19, 15, 2, 5, NULL, 43, NULL, NULL),
(953, '2021-09-01 02:36:25.068747', '2021-09-01 02:36:25.068747', NULL, 50, 19, 16, 2, 5, NULL, 43, NULL, NULL),
(954, '2021-09-01 02:36:25.146747', '2021-09-01 02:36:25.146747', NULL, 800, 19, 18, 2, 5, NULL, 43, NULL, NULL),
(955, '2021-09-01 02:36:25.209147', '2021-09-01 02:36:25.209147', NULL, 650, 19, 26, 2, 5, NULL, 43, NULL, NULL),
(956, '2021-09-01 02:36:25.255947', '2021-09-01 02:36:25.255947', NULL, 645, 19, 42, 2, 5, NULL, 43, NULL, NULL),
(957, '2021-09-01 02:36:25.302747', '2021-09-01 02:36:25.302747', NULL, 250, 19, 1, 2, 5, NULL, 43, NULL, NULL),
(958, '2021-09-01 02:36:25.333948', '2021-09-01 02:36:25.333948', NULL, 100, 19, 3, 2, 5, NULL, 43, NULL, NULL),
(959, '2021-09-01 02:36:25.380748', '2021-09-01 02:36:25.380748', NULL, 600, 19, 32, 2, 5, NULL, 43, NULL, NULL),
(960, '2021-09-01 02:36:25.411948', '2021-09-01 02:36:25.411948', NULL, 1020, 19, 34, 2, 5, NULL, 43, NULL, NULL),
(961, '2021-09-01 02:36:25.458748', '2021-09-01 02:36:25.458748', NULL, 125, 19, 50, 2, 5, NULL, 43, NULL, NULL),
(962, '2021-09-01 02:36:25.489948', '2021-09-01 02:36:25.489948', NULL, 0, 19, 51, 2, 5, NULL, 43, NULL, NULL),
(963, '2021-09-01 02:36:25.536748', '2021-09-01 02:36:25.536748', 0, NULL, 19, NULL, 2, 5, 106, 43, NULL, NULL),
(964, '2021-09-01 02:36:25.583548', '2021-09-01 02:36:25.583548', NULL, 0, 19, 22, 2, 5, NULL, 43, NULL, NULL),
(965, '2021-09-01 02:36:25.614748', '2021-09-01 02:36:25.614748', 83, NULL, 19, NULL, 2, 5, 236, 43, NULL, NULL),
(966, '2021-09-01 02:36:25.661548', '2021-09-01 02:36:25.661548', 70, NULL, 19, NULL, 2, 5, 235, 43, NULL, NULL),
(967, '2021-09-01 02:36:25.708348', '2021-09-01 02:36:25.708348', NULL, 0, 19, 52, 2, 5, NULL, 43, NULL, NULL),
(968, '2021-09-01 02:36:25.755148', '2021-09-01 02:36:25.755148', NULL, 250, 19, 54, 2, 5, NULL, 43, NULL, NULL),
(969, '2021-09-01 02:36:25.786348', '2021-09-01 02:36:25.786348', NULL, 0, 19, 53, 2, 5, NULL, 43, NULL, NULL),
(970, '2021-09-01 02:36:25.833148', '2021-09-01 02:36:25.833148', NULL, 1500, 19, 55, 2, 5, NULL, 43, NULL, NULL),
(971, '2021-09-01 02:36:25.864348', '2021-09-01 02:36:25.864348', NULL, 0, 19, 56, 2, 5, NULL, 43, NULL, NULL),
(972, '2021-09-01 02:36:25.942349', '2021-09-01 02:36:25.942349', 2, NULL, 19, NULL, 2, 5, 190, 43, NULL, NULL),
(973, '2021-09-01 02:36:25.989149', '2021-09-01 02:36:25.989149', 0, NULL, 19, NULL, 2, 5, 126, 43, NULL, NULL),
(974, '2021-09-01 02:36:26.020349', '2021-09-01 02:36:26.020349', 1, NULL, 19, NULL, 2, 5, 135, 43, NULL, NULL),
(975, '2021-09-01 02:36:26.067149', '2021-09-01 02:36:26.067149', 1, NULL, 19, NULL, 2, 5, 118, 43, NULL, NULL),
(976, '2021-09-01 02:36:26.113949', '2021-09-01 02:36:26.113949', 1, NULL, 19, NULL, 2, 5, 200, 43, NULL, NULL),
(977, '2021-09-01 02:36:26.160749', '2021-09-01 02:36:26.160749', 1, NULL, 19, NULL, 2, 5, 187, 43, NULL, NULL),
(978, '2021-09-01 02:36:26.238749', '2021-09-01 02:36:26.238749', 1, NULL, 19, NULL, 2, 5, 184, 43, NULL, NULL),
(979, '2021-09-01 02:36:26.301149', '2021-09-01 02:36:26.301149', 1, NULL, 19, NULL, 2, 5, 82, 43, NULL, NULL),
(980, '2021-09-01 02:36:26.363549', '2021-09-01 02:36:26.363549', 44, NULL, 19, NULL, 2, 5, 257, 43, NULL, NULL),
(981, '2021-09-01 02:36:26.425949', '2021-09-01 02:36:26.425949', NULL, 700, 19, 37, 2, 5, NULL, 43, NULL, NULL),
(982, '2021-09-01 02:36:26.457150', '2021-09-01 02:36:26.457150', 25, NULL, 19, NULL, 2, 5, 104, 43, NULL, NULL),
(983, '2021-09-01 02:36:26.503950', '2021-09-01 02:36:26.503950', 5, NULL, 19, NULL, 2, 5, 102, 43, NULL, NULL),
(984, '2021-09-01 02:36:26.535150', '2021-09-01 02:36:26.535150', 20, NULL, 19, NULL, 2, 5, 107, 43, NULL, NULL),
(985, '2021-09-01 02:36:26.581950', '2021-09-01 02:36:26.581950', 60, NULL, 19, NULL, 2, 5, 105, 43, NULL, NULL),
(986, '2023-02-09 13:21:55.873098', '2023-02-09 13:21:55.873098', 1, NULL, 19, NULL, 2, 5, 122, 45, NULL, NULL),
(987, '2023-02-09 13:21:55.873098', '2023-02-09 13:21:55.873098', 1, NULL, 19, NULL, 2, 5, 116, 45, NULL, NULL),
(988, '2023-02-09 13:21:55.873098', '2023-02-09 13:21:55.873098', 1, NULL, 19, NULL, 2, 5, 162, 45, NULL, NULL),
(989, '2023-02-09 13:21:55.889206', '2023-02-09 13:21:55.889206', 0, NULL, 19, NULL, 2, 5, 160, 45, NULL, NULL),
(990, '2023-02-09 13:21:55.889206', '2023-02-09 13:21:55.889206', 1, NULL, 19, NULL, 2, 5, 128, 45, NULL, NULL),
(991, '2023-02-09 13:21:55.904926', '2023-02-09 13:21:55.904926', 1, NULL, 19, NULL, 2, 5, 124, 45, NULL, NULL),
(992, '2023-02-09 13:21:55.904926', '2023-02-09 13:21:55.904926', 1, NULL, 19, NULL, 2, 5, 133, 45, NULL, NULL),
(993, '2023-02-09 13:21:55.920507', '2023-02-09 13:21:55.920507', 1, NULL, 19, NULL, 2, 5, 139, 45, NULL, NULL),
(994, '2023-02-09 13:21:55.920507', '2023-02-09 13:21:55.920507', 1, NULL, 19, NULL, 2, 5, 141, 45, NULL, NULL),
(995, '2023-02-09 13:21:55.920507', '2023-02-09 13:21:55.920507', 1, NULL, 19, NULL, 2, 5, 149, 45, NULL, NULL),
(996, '2023-02-09 13:21:55.936176', '2023-02-09 13:21:55.936176', 1, NULL, 19, NULL, 2, 5, 131, 45, NULL, NULL),
(997, '2023-02-09 13:21:55.936176', '2023-02-09 13:21:55.936176', 0, NULL, 19, NULL, 2, 5, 129, 45, NULL, NULL),
(998, '2023-02-09 13:21:55.952461', '2023-02-09 13:21:55.952461', 1, NULL, 19, NULL, 2, 5, 145, 45, NULL, NULL),
(999, '2023-02-09 13:21:55.952461', '2023-02-09 13:21:55.952461', 0, NULL, 19, NULL, 2, 5, 108, 45, NULL, NULL),
(1000, '2023-02-09 13:21:55.966266', '2023-02-09 13:21:55.966266', 1, NULL, 19, NULL, 2, 5, 110, 45, NULL, NULL),
(1001, '2023-02-09 13:21:55.966266', '2023-02-09 13:21:55.966266', 1, NULL, 19, NULL, 2, 5, 112, 45, NULL, NULL),
(1002, '2023-02-09 13:21:55.966266', '2023-02-09 13:21:55.966266', 17, NULL, 19, NULL, 2, 5, 86, 45, NULL, NULL),
(1003, '2023-02-09 13:21:55.981904', '2023-02-09 13:21:55.981904', 3, NULL, 19, NULL, 2, 5, 84, 45, NULL, NULL),
(1004, '2023-02-09 13:21:55.981904', '2023-02-09 13:21:55.981904', 32, NULL, 19, NULL, 2, 5, 88, 45, NULL, NULL),
(1005, '2023-02-09 13:21:55.998715', '2023-02-09 13:21:55.998715', 0, NULL, 19, NULL, 2, 5, 193, 45, NULL, NULL),
(1006, '2023-02-09 13:21:55.998715', '2023-02-09 13:21:55.998715', 52, NULL, 19, NULL, 2, 5, 85, 45, NULL, NULL),
(1007, '2023-02-09 13:21:55.998715', '2023-02-09 13:21:55.998715', 0, NULL, 19, NULL, 2, 5, 87, 45, NULL, NULL),
(1008, '2023-02-09 13:21:55.998715', '2023-02-09 13:21:55.998715', 79, NULL, 19, NULL, 2, 5, 81, 45, NULL, NULL),
(1009, '2023-02-09 13:21:56.014832', '2023-02-09 13:21:56.014832', 0, NULL, 19, NULL, 2, 5, 89, 45, NULL, NULL),
(1010, '2023-02-09 13:21:56.014832', '2023-02-09 13:21:56.014832', 82, NULL, 19, NULL, 2, 5, 101, 45, NULL, NULL),
(1011, '2023-02-09 13:21:56.014832', '2023-02-09 13:21:56.014832', 0, NULL, 19, NULL, 2, 5, 103, 45, NULL, NULL),
(1012, '2023-02-09 13:21:56.031095', '2023-02-09 13:21:56.031095', 7, NULL, 19, NULL, 2, 5, 227, 45, NULL, NULL),
(1013, '2023-02-09 13:21:56.031095', '2023-02-09 13:21:56.031095', NULL, 650, 19, 5, 2, 5, NULL, 45, NULL, NULL),
(1014, '2023-02-09 13:21:56.031095', '2023-02-09 13:21:56.031095', NULL, 480, 19, 4, 2, 5, NULL, 45, NULL, NULL),
(1015, '2023-02-09 13:21:56.047553', '2023-02-09 13:21:56.047553', NULL, 470, 19, 19, 2, 5, NULL, 45, NULL, NULL),
(1016, '2023-02-09 13:21:56.048048', '2023-02-09 13:21:56.048048', NULL, 450, 19, 29, 2, 5, NULL, 45, NULL, NULL),
(1017, '2023-02-09 13:21:56.054981', '2023-02-09 13:21:56.054981', NULL, 760, 19, 20, 2, 5, NULL, 45, NULL, NULL),
(1018, '2023-02-09 13:21:56.054981', '2023-02-09 13:21:56.054981', NULL, 750, 19, 24, 2, 5, NULL, 45, NULL, NULL),
(1019, '2023-02-09 13:21:56.054981', '2023-02-09 13:21:56.054981', NULL, 120, 19, 38, 2, 5, NULL, 45, NULL, NULL),
(1020, '2023-02-09 13:21:56.070796', '2023-02-09 13:21:56.070796', NULL, 800, 19, 30, 2, 5, NULL, 45, NULL, NULL),
(1021, '2023-02-09 13:21:56.070796', '2023-02-09 13:21:56.070796', NULL, 0, 19, 21, 2, 5, NULL, 45, NULL, NULL),
(1022, '2023-02-09 13:21:56.070796', '2023-02-09 13:21:56.070796', NULL, 150, 19, 27, 2, 5, NULL, 45, NULL, NULL),
(1023, '2023-02-09 13:21:56.070796', '2023-02-09 13:21:56.070796', NULL, 250, 19, 28, 2, 5, NULL, 45, NULL, NULL),
(1024, '2023-02-09 13:21:56.086977', '2023-02-09 13:21:56.086977', NULL, 300, 19, 25, 2, 5, NULL, 45, NULL, NULL),
(1025, '2023-02-09 13:21:56.086977', '2023-02-09 13:21:56.086977', NULL, 700, 19, 31, 2, 5, NULL, 45, NULL, NULL),
(1026, '2023-02-09 13:21:56.086977', '2023-02-09 13:21:56.086977', NULL, 650, 19, 10, 2, 5, NULL, 45, NULL, NULL),
(1027, '2023-02-09 13:21:56.103199', '2023-02-09 13:21:56.103199', NULL, 540, 19, 13, 2, 5, NULL, 45, NULL, NULL),
(1028, '2023-02-09 13:21:56.103199', '2023-02-09 13:21:56.103199', NULL, 400, 19, 15, 2, 5, NULL, 45, NULL, NULL),
(1029, '2023-02-09 13:21:56.103199', '2023-02-09 13:21:56.103199', NULL, 50, 19, 16, 2, 5, NULL, 45, NULL, NULL),
(1030, '2023-02-09 13:21:56.119024', '2023-02-09 13:21:56.119024', NULL, 800, 19, 18, 2, 5, NULL, 45, NULL, NULL),
(1031, '2023-02-09 13:21:56.119024', '2023-02-09 13:21:56.119024', NULL, 650, 19, 26, 2, 5, NULL, 45, NULL, NULL),
(1032, '2023-02-09 13:21:56.119024', '2023-02-09 13:21:56.119024', NULL, 645, 19, 42, 2, 5, NULL, 45, NULL, NULL),
(1033, '2023-02-09 13:21:56.119024', '2023-02-09 13:21:56.119024', NULL, 250, 19, 1, 2, 5, NULL, 45, NULL, NULL),
(1034, '2023-02-09 13:21:56.134645', '2023-02-09 13:21:56.134645', NULL, 100, 19, 3, 2, 5, NULL, 45, NULL, NULL),
(1035, '2023-02-09 13:21:56.134645', '2023-02-09 13:21:56.134645', NULL, 600, 19, 32, 2, 5, NULL, 45, NULL, NULL),
(1036, '2023-02-09 13:21:56.134645', '2023-02-09 13:21:56.134645', NULL, 1020, 19, 34, 2, 5, NULL, 45, NULL, NULL),
(1037, '2023-02-09 13:21:56.134645', '2023-02-09 13:21:56.134645', NULL, 125, 19, 50, 2, 5, NULL, 45, NULL, NULL),
(1038, '2023-02-09 13:21:56.150292', '2023-02-09 13:21:56.150292', NULL, 0, 19, 51, 2, 5, NULL, 45, NULL, NULL),
(1039, '2023-02-09 13:21:56.150292', '2023-02-09 13:21:56.150292', 0, NULL, 19, NULL, 2, 5, 106, 45, NULL, NULL),
(1040, '2023-02-09 13:21:56.150292', '2023-02-09 13:21:56.150292', NULL, 0, 19, 22, 2, 5, NULL, 45, NULL, NULL),
(1041, '2023-02-09 13:21:56.150292', '2023-02-09 13:21:56.150292', 82, NULL, 19, NULL, 2, 5, 236, 45, NULL, NULL),
(1042, '2023-02-09 13:21:56.170445', '2023-02-09 13:21:56.170445', 69, NULL, 19, NULL, 2, 5, 235, 45, NULL, NULL),
(1043, '2023-02-09 13:21:56.175464', '2023-02-09 13:21:56.175464', NULL, 0, 19, 52, 2, 5, NULL, 45, NULL, NULL),
(1044, '2023-02-09 13:21:56.179161', '2023-02-09 13:21:56.179161', NULL, 250, 19, 54, 2, 5, NULL, 45, NULL, NULL),
(1045, '2023-02-09 13:21:56.184232', '2023-02-09 13:21:56.184232', NULL, 0, 19, 53, 2, 5, NULL, 45, NULL, NULL),
(1046, '2023-02-09 13:21:56.188093', '2023-02-09 13:21:56.188093', NULL, 1500, 19, 55, 2, 5, NULL, 45, NULL, NULL),
(1047, '2023-02-09 13:21:56.192572', '2023-02-09 13:21:56.192572', NULL, 0, 19, 56, 2, 5, NULL, 45, NULL, NULL),
(1048, '2023-02-09 13:21:56.198207', '2023-02-09 13:21:56.198207', 2, NULL, 19, NULL, 2, 5, 190, 45, NULL, NULL),
(1049, '2023-02-09 13:21:56.201683', '2023-02-09 13:21:56.201683', 0, NULL, 19, NULL, 2, 5, 126, 45, NULL, NULL),
(1050, '2023-02-09 13:21:56.205239', '2023-02-09 13:21:56.205239', 1, NULL, 19, NULL, 2, 5, 135, 45, NULL, NULL),
(1051, '2023-02-09 13:21:56.205239', '2023-02-09 13:21:56.205239', 1, NULL, 19, NULL, 2, 5, 118, 45, NULL, NULL),
(1052, '2023-02-09 13:21:56.205239', '2023-02-09 13:21:56.205239', 1, NULL, 19, NULL, 2, 5, 200, 45, NULL, NULL),
(1053, '2023-02-09 13:21:56.221522', '2023-02-09 13:21:56.221522', 1, NULL, 19, NULL, 2, 5, 187, 45, NULL, NULL),
(1054, '2023-02-09 13:21:56.221522', '2023-02-09 13:21:56.221522', 1, NULL, 19, NULL, 2, 5, 184, 45, NULL, NULL),
(1055, '2023-02-09 13:21:56.232727', '2023-02-09 13:21:56.232727', 1, NULL, 19, NULL, 2, 5, 82, 45, NULL, NULL),
(1056, '2023-02-09 13:21:56.232727', '2023-02-09 13:21:56.232727', 44, NULL, 19, NULL, 2, 5, 257, 45, NULL, NULL),
(1057, '2023-02-09 13:21:56.232727', '2023-02-09 13:21:56.232727', NULL, 700, 19, 37, 2, 5, NULL, 45, NULL, NULL),
(1058, '2023-02-09 13:21:56.248500', '2023-02-09 13:21:56.248500', 21, NULL, 19, NULL, 2, 5, 104, 45, NULL, NULL),
(1059, '2023-02-09 13:21:56.248500', '2023-02-09 13:21:56.248500', 4, NULL, 19, NULL, 2, 5, 102, 45, NULL, NULL),
(1060, '2023-02-09 13:21:56.264287', '2023-02-09 13:21:56.264287', 20, NULL, 19, NULL, 2, 5, 107, 45, NULL, NULL),
(1061, '2023-02-09 13:21:56.264287', '2023-02-09 13:21:56.264287', 60, NULL, 19, NULL, 2, 5, 105, 45, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_app_item_transfer`
--

CREATE TABLE `product_app_item_transfer` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `product_quantity` int(10) UNSIGNED DEFAULT NULL CHECK (`product_quantity` >= 0),
  `is_confirmed` tinyint(1) NOT NULL,
  `recieved_ebarimt` tinyint(1) NOT NULL,
  `comment` longtext DEFAULT NULL,
  `unit_size` int(10) UNSIGNED DEFAULT NULL CHECK (`unit_size` >= 0),
  `unit_price` decimal(14,2) DEFAULT NULL,
  `total_amount` decimal(14,2) DEFAULT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL CHECK (`quantity` >= 0),
  `size` int(10) UNSIGNED DEFAULT NULL CHECK (`size` >= 0),
  `budget_id` int(11) DEFAULT NULL,
  `commodity_id` int(11) DEFAULT NULL,
  `confirmed_by_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `fr_client_id` int(11) DEFAULT NULL,
  `fr_division_id` int(11) DEFAULT NULL,
  `fr_user_id` int(11) DEFAULT NULL,
  `item_transfer_type_id` int(11) NOT NULL,
  `order_detial_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `to_client_id` int(11) DEFAULT NULL,
  `to_division_id` int(11) DEFAULT NULL,
  `to_product_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_app_item_transfer`
--

INSERT INTO `product_app_item_transfer` (`id`, `created_at`, `updated_at`, `product_quantity`, `is_confirmed`, `recieved_ebarimt`, `comment`, `unit_size`, `unit_price`, `total_amount`, `quantity`, `size`, `budget_id`, `commodity_id`, `confirmed_by_id`, `created_by_id`, `fr_client_id`, `fr_division_id`, `fr_user_id`, `item_transfer_type_id`, `order_detial_id`, `product_id`, `store_id`, `to_client_id`, `to_division_id`, `to_product_id`, `to_user_id`, `updated_by_id`) VALUES
(1, '2021-07-24 11:56:28.018090', '2021-07-24 11:56:28.018090', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 122, NULL, 19, 5, NULL, NULL, NULL),
(2, '2021-07-24 11:56:28.328091', '2021-07-24 11:56:28.328091', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 116, NULL, 19, 5, NULL, NULL, NULL),
(3, '2021-07-24 11:56:28.662100', '2021-07-24 11:56:28.662100', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 162, NULL, 19, 5, NULL, NULL, NULL),
(4, '2021-07-24 11:56:28.732101', '2021-07-24 11:56:28.732101', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 160, NULL, 19, 5, NULL, NULL, NULL),
(5, '2021-07-24 11:56:28.852101', '2021-07-24 11:56:28.852101', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 128, NULL, 19, 5, NULL, NULL, NULL),
(6, '2021-07-24 11:56:28.932101', '2021-07-24 11:56:28.932101', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 124, NULL, 19, 5, NULL, NULL, NULL),
(7, '2021-07-24 11:56:29.083102', '2021-07-24 11:56:29.083102', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 133, NULL, 19, 5, NULL, NULL, NULL),
(8, '2021-07-24 11:56:29.674104', '2021-07-24 11:56:29.674104', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 139, NULL, 19, 5, NULL, NULL, NULL),
(9, '2021-07-24 11:56:29.754104', '2021-07-24 11:56:29.754104', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 141, NULL, 19, 5, NULL, NULL, NULL),
(10, '2021-07-24 11:56:29.854104', '2021-07-24 11:56:29.854104', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 149, NULL, 19, 5, NULL, NULL, NULL),
(11, '2021-07-24 11:56:29.914105', '2021-07-24 11:56:29.914105', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 131, NULL, 19, 5, NULL, NULL, NULL),
(12, '2021-07-24 11:56:29.994105', '2021-07-24 11:56:29.994105', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 129, NULL, 19, 5, NULL, NULL, NULL),
(13, '2021-07-24 11:56:30.304105', '2021-07-24 11:56:30.304105', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 145, NULL, 19, 5, NULL, NULL, NULL),
(14, '2021-07-24 11:56:30.444105', '2021-07-24 11:56:30.444105', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 3, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 108, NULL, 19, 5, NULL, NULL, NULL),
(15, '2021-07-24 11:56:30.514105', '2021-07-24 11:56:30.514105', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 110, NULL, 19, 5, NULL, NULL, NULL),
(16, '2021-07-24 11:56:30.624106', '2021-07-24 11:56:30.624106', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 112, NULL, 19, 5, NULL, NULL, NULL),
(17, '2021-07-24 11:56:30.704106', '2021-07-24 11:56:30.704106', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 34, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 86, NULL, 19, 5, NULL, NULL, NULL),
(18, '2021-07-24 11:56:30.794106', '2021-07-24 11:56:30.794106', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 13, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 84, NULL, 19, 5, NULL, NULL, NULL),
(19, '2021-07-24 11:56:30.854106', '2021-07-24 11:56:30.854106', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 8, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 88, NULL, 19, 5, NULL, NULL, NULL),
(20, '2021-07-24 11:56:30.944106', '2021-07-24 11:56:30.944106', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 18, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 193, NULL, 19, 5, NULL, NULL, NULL),
(21, '2021-07-24 11:56:31.054106', '2021-07-24 11:56:31.054106', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 29, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 85, NULL, 19, 5, NULL, NULL, NULL),
(22, '2021-07-24 11:56:31.154106', '2021-07-24 11:56:31.154106', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 3, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 87, NULL, 19, 5, NULL, NULL, NULL),
(23, '2021-07-24 11:56:31.244106', '2021-07-24 11:56:31.244106', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 23, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 81, NULL, 19, 5, NULL, NULL, NULL),
(24, '2021-07-24 11:56:31.314106', '2021-07-24 11:56:31.314106', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 89, NULL, 19, 5, NULL, NULL, NULL),
(25, '2021-07-24 11:57:41.670091', '2021-07-24 11:57:41.670091', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 100, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 101, NULL, 19, 5, NULL, NULL, NULL),
(26, '2021-07-24 11:57:41.823100', '2021-07-24 11:57:41.823100', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 26, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 103, NULL, 19, 5, NULL, NULL, NULL),
(27, '2021-07-24 12:05:28.495020', '2021-07-24 12:05:28.495020', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 240, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 103, NULL, 16, 5, NULL, NULL, NULL),
(28, '2021-07-24 12:05:28.588620', '2021-07-24 12:05:28.588620', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 240, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 101, NULL, 16, 5, NULL, NULL, NULL),
(29, '2021-07-24 12:05:28.963020', '2021-07-24 12:05:28.963020', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 3, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 108, NULL, 16, 5, NULL, NULL, NULL),
(30, '2021-07-24 12:05:29.181421', '2021-07-24 12:05:29.181421', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 48, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 84, NULL, 16, 5, NULL, NULL, NULL),
(31, '2021-07-24 12:05:29.259421', '2021-07-24 12:05:29.259421', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 47, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 87, NULL, 16, 5, NULL, NULL, NULL),
(32, '2021-07-24 12:05:29.337421', '2021-07-24 12:05:29.337421', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 16, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 88, NULL, 16, 5, NULL, NULL, NULL),
(33, '2021-07-24 12:05:29.446621', '2021-07-24 12:05:29.446621', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 36, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 81, NULL, 16, 5, NULL, NULL, NULL),
(34, '2021-07-24 12:05:29.525621', '2021-07-24 12:05:29.525621', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 3, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 124, NULL, 16, 5, NULL, NULL, NULL),
(35, '2021-07-24 12:05:29.619222', '2021-07-24 12:05:29.619222', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 3, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 126, NULL, 16, 5, NULL, NULL, NULL),
(36, '2021-07-24 12:05:29.681622', '2021-07-24 12:05:29.681622', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 3, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 160, NULL, 16, 5, NULL, NULL, NULL),
(37, '2021-07-24 12:05:29.761622', '2021-07-24 12:05:29.761622', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 2, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 149, NULL, 16, 5, NULL, NULL, NULL),
(38, '2021-07-24 12:05:29.839622', '2021-07-24 12:05:29.839622', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 3, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 133, NULL, 16, 5, NULL, NULL, NULL),
(39, '2021-07-24 12:05:29.968224', '2021-07-24 12:05:29.968224', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 2, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 116, NULL, 16, 5, NULL, NULL, NULL),
(40, '2021-07-24 12:05:30.155425', '2021-07-24 12:05:30.155425', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 12, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 82, NULL, 16, 5, NULL, NULL, NULL),
(41, '2021-07-24 12:05:30.249025', '2021-07-24 12:05:30.249025', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 5, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 110, NULL, 16, 5, NULL, NULL, NULL),
(42, '2021-07-24 12:05:30.327025', '2021-07-24 12:05:30.327025', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 2, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 112, NULL, 16, 5, NULL, NULL, NULL),
(43, '2021-07-24 12:06:05.543017', '2021-07-24 12:06:05.543017', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 4, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 227, NULL, 19, 5, NULL, NULL, NULL),
(44, '2021-07-24 12:06:22.996150', '2021-07-24 12:06:22.996150', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 14, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 227, NULL, 16, 5, NULL, NULL, NULL),
(45, '2021-07-24 12:20:22.421510', '2021-07-24 12:20:22.421510', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 300, NULL, 5, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(46, '2021-07-24 12:20:22.574713', '2021-07-24 12:20:22.574713', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 800, NULL, 4, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(47, '2021-07-24 12:20:22.692719', '2021-07-24 12:20:22.692719', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 200, NULL, 19, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(48, '2021-07-24 12:20:23.068741', '2021-07-24 12:20:23.068741', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 700, NULL, 29, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(49, '2021-07-24 12:20:23.404359', '2021-07-24 12:20:23.404359', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 900, NULL, 20, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(50, '2021-07-24 12:20:23.512965', '2021-07-24 12:20:23.512965', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 50, NULL, 24, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(51, '2021-07-24 12:20:23.606970', '2021-07-24 12:20:23.606970', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 900, NULL, 38, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(52, '2021-07-24 12:20:23.835181', '2021-07-24 12:20:23.835181', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 800, NULL, 30, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(53, '2021-07-24 12:20:24.711619', '2021-07-24 12:20:24.711619', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 100, NULL, 21, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(54, '2021-07-24 12:20:24.893220', '2021-07-24 12:20:24.893220', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 200, NULL, 27, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(55, '2021-07-24 12:20:25.029228', '2021-07-24 12:20:25.029228', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 500, NULL, 28, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(56, '2021-07-24 12:20:25.134031', '2021-07-24 12:20:25.134031', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 1400, NULL, 25, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(57, '2021-07-24 12:20:25.248835', '2021-07-24 12:20:25.248835', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 700, NULL, 31, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(58, '2021-07-24 12:20:25.373636', '2021-07-24 12:20:25.373636', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 650, NULL, 10, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(59, '2021-07-24 12:20:25.707236', '2021-07-24 12:20:25.707236', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 1000, NULL, 13, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(60, '2021-07-24 12:20:26.081637', '2021-07-24 12:20:26.081637', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 400, NULL, 15, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(61, '2021-07-24 12:20:26.202239', '2021-07-24 12:20:26.202239', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 100, NULL, 16, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(62, '2021-07-24 12:20:26.280239', '2021-07-24 12:20:26.280239', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 200, NULL, 18, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(63, '2021-07-24 12:20:26.389439', '2021-07-24 12:20:26.389439', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 650, NULL, 26, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(64, '2021-07-24 12:20:26.467439', '2021-07-24 12:20:26.467439', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 750, NULL, 42, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(65, '2021-07-24 12:20:26.561039', '2021-07-24 12:20:26.561039', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 1000, NULL, 1, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(66, '2021-07-24 12:20:26.639040', '2021-07-24 12:20:26.639040', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 400, NULL, 3, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(67, '2021-07-24 12:20:26.750244', '2021-07-24 12:20:26.750244', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 600, NULL, 32, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(68, '2021-07-24 12:20:26.976248', '2021-07-24 12:20:26.976248', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 50, NULL, 34, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(69, '2021-07-24 12:50:28.246316', '2021-07-24 12:50:28.246316', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 500, NULL, 50, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(70, '2021-07-24 12:50:28.807917', '2021-07-24 12:50:28.807917', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 450, NULL, 51, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(71, '2021-07-24 14:04:54.800925', '2021-07-24 14:04:54.800925', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 121, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(72, '2021-07-24 14:05:34.260278', '2021-07-24 14:05:34.260278', NULL, 0, 0, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 122, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(73, '2021-07-24 14:08:19.721170', '2021-07-24 14:08:19.721170', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 124, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(74, '2021-07-24 14:09:35.484149', '2021-07-24 14:09:35.484149', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 126, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(75, '2021-07-24 14:12:49.621961', '2021-07-24 14:12:49.621961', NULL, 0, 0, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 130, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(76, '2021-07-24 14:16:03.261097', '2021-07-24 14:16:03.261097', NULL, 0, 0, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 133, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(77, '2021-07-24 14:17:06.471244', '2021-07-24 14:17:06.471244', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 134, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(78, '2021-07-24 14:17:27.441095', '2021-07-24 14:17:27.441095', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 135, 85, NULL, NULL, NULL, NULL, NULL, NULL),
(79, '2021-07-24 14:29:06.128512', '2021-07-24 14:29:06.128512', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 84, NULL, 19, 5, NULL, NULL, NULL),
(80, '2021-07-25 05:24:02.312147', '2021-07-25 05:24:02.312147', NULL, 1, 0, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 88, NULL, 15, 3, NULL, NULL, NULL),
(81, '2021-07-25 05:24:02.792148', '2021-07-25 05:24:02.792148', NULL, 1, 0, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 81, NULL, 15, 3, NULL, NULL, NULL),
(82, '2021-07-25 05:26:37.819377', '2021-07-25 05:26:37.819377', NULL, 1, 0, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 103, NULL, 19, 5, NULL, NULL, NULL),
(83, '2021-07-25 05:26:37.929377', '2021-07-25 05:26:37.929377', NULL, 1, 0, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 101, NULL, 19, 5, NULL, NULL, NULL),
(84, '2021-07-25 05:26:38.079377', '2021-07-25 05:26:38.079377', NULL, 1, 0, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 81, NULL, 19, 5, NULL, NULL, NULL),
(85, '2021-07-25 05:26:38.239378', '2021-07-25 05:26:38.239378', NULL, 1, 0, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 84, NULL, 19, 5, NULL, NULL, NULL),
(86, '2021-07-25 05:32:29.598890', '2021-07-25 05:32:29.598890', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 11000, NULL, 1, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(87, '2021-07-25 05:32:29.831892', '2021-07-25 05:32:29.831892', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 1000, NULL, 18, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(88, '2021-07-25 05:32:30.270893', '2021-07-25 05:32:30.270893', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 1000, NULL, 13, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(89, '2021-07-25 05:32:30.560893', '2021-07-25 05:32:30.560893', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 2000, NULL, 5, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(90, '2021-07-25 05:32:30.650893', '2021-07-25 05:32:30.650893', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 1000, NULL, 4, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(91, '2021-07-25 05:32:49.420920', '2021-07-25 05:32:49.420920', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 1000, NULL, 4, 2, 2, 16, 5, NULL, 2, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(92, '2021-07-25 14:00:42.645355', '2021-07-25 14:00:42.645355', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 137, 131, NULL, NULL, NULL, NULL, NULL, NULL),
(93, '2021-07-25 14:00:42.645355', '2021-07-25 14:00:42.645355', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 140, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(94, '2021-07-25 14:00:42.660955', '2021-07-25 14:00:42.660955', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 138, 87, NULL, NULL, NULL, NULL, NULL, NULL),
(95, '2021-07-25 14:00:42.660955', '2021-07-25 14:00:42.660955', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 139, 88, NULL, NULL, NULL, NULL, NULL, NULL),
(96, '2021-07-26 04:41:57.339671', '2021-07-26 04:41:57.339671', NULL, 1, 0, NULL, NULL, '1650.00', '118800.00', 72, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 86, NULL, 16, 5, NULL, NULL, NULL),
(97, '2021-07-26 04:43:53.171874', '2021-07-26 04:43:53.171874', NULL, 1, 0, NULL, NULL, '1650.00', '277200.00', 168, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 84, NULL, 16, 5, NULL, NULL, NULL),
(98, '2021-07-26 04:43:53.281075', '2021-07-26 04:43:53.281075', NULL, 1, 0, NULL, NULL, '740.00', '62160.00', 84, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 81, NULL, 16, 5, NULL, NULL, NULL),
(99, '2021-07-26 05:24:51.463729', '2021-07-26 05:24:51.463729', NULL, 1, 0, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 84, NULL, 19, 5, NULL, NULL, NULL),
(100, '2021-07-26 05:24:51.858751', '2021-07-26 05:24:51.858751', NULL, 1, 0, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 81, NULL, 19, 5, NULL, NULL, NULL),
(101, '2021-07-26 05:53:31.363260', '2021-07-26 05:53:31.363260', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 106, NULL, 19, 5, NULL, NULL, NULL),
(102, '2021-07-26 05:59:52.526355', '2021-07-26 05:59:52.526355', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 450, NULL, 22, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(103, '2021-07-26 09:49:45.771819', '2021-07-26 09:49:45.771819', NULL, 1, 0, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 103, NULL, 19, 5, NULL, NULL, NULL),
(104, '2021-07-26 09:49:46.115019', '2021-07-26 09:49:46.115019', NULL, 1, 0, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 101, NULL, 19, 5, NULL, NULL, NULL),
(105, '2021-07-26 10:05:06.056316', '2021-07-26 10:05:06.056316', NULL, 1, 0, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 84, NULL, 17, 3, NULL, NULL, NULL),
(106, '2021-07-26 10:05:06.524316', '2021-07-26 10:05:06.524316', NULL, 1, 0, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 81, NULL, 17, 3, NULL, NULL, NULL),
(107, '2021-07-26 12:51:39.626000', '2021-07-26 12:51:39.626000', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 2, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 103, NULL, 19, 5, NULL, NULL, NULL),
(108, '2021-07-26 12:53:37.907408', '2021-07-26 12:53:37.907408', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 144, 85, NULL, NULL, NULL, NULL, NULL, NULL),
(109, '2021-07-26 13:09:22.774868', '2021-07-26 13:09:22.774868', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 100, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 236, NULL, 19, 5, NULL, NULL, NULL),
(110, '2021-07-26 13:10:09.184949', '2021-07-26 13:10:09.184949', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 19, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 235, NULL, 19, 5, NULL, NULL, NULL),
(111, '2021-07-26 13:11:52.693131', '2021-07-26 13:11:52.693131', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 149, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(112, '2021-07-26 13:13:11.968871', '2021-07-26 13:13:11.968871', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 152, 85, NULL, NULL, NULL, NULL, NULL, NULL),
(113, '2021-07-26 13:16:32.273223', '2021-07-26 13:16:32.273223', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 155, 106, NULL, NULL, NULL, NULL, NULL, NULL),
(114, '2021-07-26 13:22:47.737683', '2021-07-26 13:22:47.737683', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 166, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(115, '2021-07-26 13:34:01.278879', '2021-07-26 13:34:01.278879', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 28, NULL, 2, 19, 5, NULL, 4, 171, NULL, NULL, NULL, NULL, 173, NULL, NULL),
(116, '2021-07-26 13:34:01.294479', '2021-07-26 13:34:01.294479', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 172, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(117, '2021-07-26 13:51:07.009682', '2021-07-26 13:51:07.009682', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 175, 85, NULL, NULL, NULL, NULL, NULL, NULL),
(118, '2021-07-26 13:51:07.009682', '2021-07-26 13:51:07.009682', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 178, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(119, '2021-07-26 14:10:08.485015', '2021-07-26 14:10:08.485015', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 186, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(120, '2021-07-26 14:13:10.514419', '2021-07-26 14:13:10.514419', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 188, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(121, '2021-07-26 14:16:20.681753', '2021-07-26 14:16:20.681753', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 190, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(122, '2021-07-26 14:22:24.038991', '2021-07-26 14:22:24.038991', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 199, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(123, '2021-07-26 14:22:24.063993', '2021-07-26 14:22:24.063993', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 200, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(124, '2021-07-26 14:22:52.961646', '2021-07-26 14:22:52.961646', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 203, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(125, '2021-07-26 14:24:09.324331', '2021-07-26 14:24:09.324331', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 204, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(126, '2021-07-26 14:28:01.423539', '2021-07-26 14:28:01.423539', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 205, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(127, '2021-07-27 05:33:01.438548', '2021-07-27 05:33:01.438548', NULL, 1, 0, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 81, NULL, 17, 3, NULL, NULL, NULL),
(128, '2021-07-27 05:52:55.096822', '2021-07-27 05:52:55.097822', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 250, NULL, 52, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(129, '2021-07-27 05:52:55.405840', '2021-07-27 05:52:55.405840', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 250, NULL, 54, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(130, '2021-07-27 05:52:55.505845', '2021-07-27 05:52:55.505845', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 1000, NULL, 53, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(131, '2021-07-27 05:52:55.598851', '2021-07-27 05:52:55.598851', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 2000, NULL, 55, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(132, '2021-07-27 05:52:55.681855', '2021-07-27 05:52:55.681855', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 500, NULL, 56, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(133, '2021-07-27 05:53:17.688114', '2021-07-27 05:53:17.688114', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 210, 85, NULL, NULL, NULL, NULL, NULL, NULL),
(134, '2021-07-27 05:59:03.287881', '2021-07-27 05:59:03.288881', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 250, NULL, 53, NULL, 6, 19, 5, NULL, 4, 211, NULL, NULL, NULL, NULL, 240, NULL, NULL),
(135, '2021-07-27 06:01:26.292061', '2021-07-27 06:01:26.292061', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 215, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(136, '2021-07-27 06:01:26.302061', '2021-07-27 06:01:26.302061', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 214, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(137, '2021-07-27 06:11:56.516107', '2021-07-27 06:11:56.516107', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 250, NULL, 55, NULL, 6, 19, 5, NULL, 4, 222, NULL, NULL, NULL, NULL, 242, NULL, NULL),
(138, '2021-07-27 06:11:56.836126', '2021-07-27 06:11:56.836126', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 227, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(139, '2021-07-27 07:23:49.184120', '2021-07-27 07:23:49.184120', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 234, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(140, '2021-07-27 08:13:32.288358', '2021-07-27 08:13:32.288358', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 238, 193, NULL, NULL, NULL, NULL, NULL, NULL),
(141, '2021-07-27 08:49:17.434540', '2021-07-27 08:49:17.434540', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 241, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(142, '2021-07-27 09:44:43.631649', '2021-07-27 09:44:43.631649', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 242, 236, NULL, NULL, NULL, NULL, NULL, NULL),
(143, '2021-07-27 13:48:45.628434', '2021-07-27 13:48:45.628434', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 245, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(144, '2021-07-27 13:56:35.723660', '2021-07-27 13:56:35.723660', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 22, NULL, 2, 19, 5, NULL, 4, 257, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(145, '2021-07-27 13:56:35.848460', '2021-07-27 13:56:35.848460', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 40, NULL, 24, NULL, 2, 19, 5, NULL, 4, 261, NULL, NULL, NULL, NULL, 211, NULL, NULL),
(146, '2021-07-27 13:56:35.848460', '2021-07-27 13:56:35.848460', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 20, NULL, 2, 19, 5, NULL, 4, 260, NULL, NULL, NULL, NULL, 221, NULL, NULL),
(147, '2021-07-27 13:56:35.848460', '2021-07-27 13:56:35.848460', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 4, NULL, 2, 19, 5, NULL, 4, 262, NULL, NULL, NULL, NULL, 217, NULL, NULL),
(148, '2021-07-27 13:56:36.098060', '2021-07-27 13:56:36.098060', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 257, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(149, '2021-07-27 13:56:36.176060', '2021-07-27 13:56:36.176060', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 260, NULL, NULL, NULL, NULL, 221, NULL, NULL),
(150, '2021-07-27 13:56:36.269661', '2021-07-27 13:56:36.269661', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 40, NULL, 25, NULL, 2, 19, 5, NULL, 4, 261, NULL, NULL, NULL, NULL, 211, NULL, NULL),
(151, '2021-07-27 13:56:36.269661', '2021-07-27 13:56:36.269661', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 262, NULL, NULL, NULL, NULL, 217, NULL, NULL),
(152, '2021-07-27 13:56:36.378861', '2021-07-27 13:56:36.378861', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 38, NULL, 2, 19, 5, NULL, 4, 257, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(153, '2021-07-27 13:56:36.488061', '2021-07-27 13:56:36.488061', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 40, NULL, 38, NULL, 2, 19, 5, NULL, 4, 261, NULL, NULL, NULL, NULL, 211, NULL, NULL),
(154, '2021-07-27 13:56:36.846862', '2021-07-27 13:56:36.846862', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 262, 86, NULL, NULL, NULL, 217, NULL, NULL),
(155, '2021-07-27 13:57:31.571758', '2021-07-27 13:57:31.571758', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 263, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(156, '2021-07-27 13:58:46.311489', '2021-07-27 13:58:46.311489', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 20, NULL, 2, 19, 5, NULL, 4, 267, NULL, NULL, NULL, NULL, 221, NULL, NULL),
(157, '2021-07-27 13:58:46.342689', '2021-07-27 13:58:46.342689', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 19, NULL, 2, 19, 5, NULL, 4, 269, NULL, NULL, NULL, NULL, 205, NULL, NULL),
(158, '2021-07-27 13:58:46.467489', '2021-07-27 13:58:46.467489', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 267, NULL, NULL, NULL, NULL, 221, NULL, NULL),
(159, '2021-07-27 13:58:46.483089', '2021-07-27 13:58:46.483089', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 269, NULL, NULL, NULL, NULL, 205, NULL, NULL),
(160, '2021-07-27 13:58:47.419091', '2021-07-27 13:58:47.419091', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 269, 87, NULL, NULL, NULL, 205, NULL, NULL),
(161, '2021-07-27 13:59:34.250373', '2021-07-27 13:59:34.250373', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 272, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(162, '2021-07-27 14:00:32.500876', '2021-07-27 14:00:32.500876', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 19, NULL, 2, 19, 5, NULL, 4, 274, NULL, NULL, NULL, NULL, 205, NULL, NULL),
(163, '2021-07-27 14:00:32.875276', '2021-07-27 14:00:32.875276', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 274, NULL, NULL, NULL, NULL, 205, NULL, NULL),
(164, '2021-07-27 14:00:32.937676', '2021-07-27 14:00:32.937676', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 274, 87, NULL, NULL, NULL, 205, NULL, NULL),
(165, '2021-07-27 14:02:13.651453', '2021-07-27 14:02:13.651453', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 280, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(166, '2021-07-27 14:02:13.651453', '2021-07-27 14:02:13.651453', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 278, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(167, '2021-07-27 14:02:14.509455', '2021-07-27 14:02:14.509455', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 284, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(168, '2021-07-27 14:02:14.556255', '2021-07-27 14:02:14.556255', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 283, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(169, '2021-07-27 14:02:14.571855', '2021-07-27 14:02:14.571855', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 282, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(170, '2021-07-27 14:09:27.034714', '2021-07-27 14:09:27.034714', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 285, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(171, '2021-07-27 14:09:27.041715', '2021-07-27 14:09:27.041715', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 289, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(172, '2021-07-27 14:09:27.057716', '2021-07-27 14:09:27.057716', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 100, NULL, 21, NULL, 2, 19, 5, NULL, 4, 290, NULL, NULL, NULL, NULL, 159, NULL, NULL),
(173, '2021-07-27 14:25:23.611233', '2021-07-27 14:25:23.611233', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 190, NULL, 19, 5, NULL, NULL, NULL),
(174, '2021-07-28 03:29:03.486021', '2021-07-28 03:29:03.486021', NULL, 1, 0, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 101, NULL, 19, 5, NULL, NULL, NULL),
(175, '2021-07-28 03:29:03.798021', '2021-07-28 03:29:03.798021', NULL, 1, 0, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 84, NULL, 19, 5, NULL, NULL, NULL),
(176, '2021-07-28 03:29:03.969622', '2021-07-28 03:29:03.969622', NULL, 1, 0, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 86, NULL, 19, 5, NULL, NULL, NULL),
(177, '2021-07-28 03:29:04.094422', '2021-07-28 03:29:04.110022', NULL, 1, 0, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 87, NULL, 19, 5, NULL, NULL, NULL),
(178, '2021-07-28 03:29:04.453222', '2021-07-28 03:29:04.453222', NULL, 1, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 110, NULL, 19, 5, NULL, NULL, NULL),
(179, '2021-07-28 03:29:04.609223', '2021-07-28 03:29:04.609223', NULL, 1, 0, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 103, NULL, 19, 5, NULL, NULL, NULL),
(180, '2021-07-28 03:29:04.702823', '2021-07-28 03:29:04.702823', NULL, 1, 0, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 88, NULL, 19, 5, NULL, NULL, NULL),
(181, '2021-07-28 03:29:51.144105', '2021-07-28 03:29:51.144105', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 2, NULL, 52, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(182, '2021-07-28 03:30:58.833623', '2021-07-28 03:30:58.833623', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 1998, NULL, 52, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(183, '2021-07-28 03:30:58.927224', '2021-07-28 03:30:58.927224', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 1500, NULL, 55, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(184, '2021-07-28 03:31:15.837653', '2021-07-28 03:31:15.837653', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 1000, NULL, 52, 2, 2, 16, 5, NULL, 2, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(185, '2021-07-28 03:32:28.011984', '2021-07-28 03:32:28.011984', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 101, NULL, 19, 5, NULL, NULL, NULL),
(186, '2021-07-28 03:32:28.136784', '2021-07-28 03:32:28.136784', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 87, NULL, 19, 5, NULL, NULL, NULL),
(187, '2021-07-28 05:34:07.881053', '2021-07-28 05:34:07.881053', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 291, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(188, '2021-07-28 05:59:40.155992', '2021-07-28 05:59:40.155992', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 7, 19, 5, NULL, 3, 299, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(189, '2021-07-28 06:18:48.464810', '2021-07-28 06:18:48.464810', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 7, 19, 5, NULL, 3, 304, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(190, '2021-07-28 08:38:39.574280', '2021-07-28 08:38:39.574280', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 312, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(191, '2021-07-28 09:25:41.156046', '2021-07-28 09:25:41.156046', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 315, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(192, '2021-07-28 09:30:35.293968', '2021-07-28 09:30:35.293968', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 131, NULL, 19, 5, NULL, NULL, NULL),
(193, '2021-07-28 11:00:11.573422', '2021-07-28 11:00:11.573422', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 323, 129, NULL, NULL, NULL, NULL, NULL, NULL),
(194, '2021-07-28 11:00:11.979023', '2021-07-28 11:00:11.979023', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 324, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(195, '2021-07-28 13:55:42.472558', '2021-07-28 13:55:42.472558', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 332, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(196, '2021-07-28 13:57:18.319126', '2021-07-28 13:57:18.319126', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 335, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(197, '2021-07-28 13:57:18.365926', '2021-07-28 13:57:18.365926', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 336, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(198, '2021-07-28 13:58:37.021265', '2021-07-28 13:58:37.021265', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 342, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(199, '2021-07-28 13:58:37.099265', '2021-07-28 13:58:37.099265', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 250, NULL, 56, NULL, 2, 19, 5, NULL, 4, 343, NULL, NULL, NULL, NULL, 89, NULL, NULL),
(200, '2021-07-28 14:02:43.286698', '2021-07-28 14:02:43.286698', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 10, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 235, NULL, 19, 5, NULL, NULL, NULL),
(201, '2021-07-28 14:04:55.403330', '2021-07-28 14:04:55.403330', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 344, 236, NULL, NULL, NULL, NULL, NULL, NULL),
(202, '2021-07-28 14:04:55.418930', '2021-07-28 14:04:55.418930', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 348, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(203, '2021-07-28 14:04:55.418930', '2021-07-28 14:04:55.418930', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 345, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(204, '2021-07-28 14:04:55.418930', '2021-07-28 14:04:55.418930', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 347, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(205, '2021-07-28 14:08:08.141669', '2021-07-28 14:08:08.141669', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 353, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(206, '2021-07-28 14:08:08.282069', '2021-07-28 14:08:08.282069', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 250, NULL, 53, NULL, 2, 19, 5, NULL, 4, 355, NULL, NULL, NULL, NULL, 240, NULL, NULL),
(207, '2021-07-28 14:13:30.214235', '2021-07-28 14:13:30.214235', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 362, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(208, '2021-07-28 14:13:30.214235', '2021-07-28 14:13:30.214235', NULL, 0, 0, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 364, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(209, '2021-07-28 14:13:30.214235', '2021-07-28 14:13:30.214235', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 363, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(210, '2021-07-28 14:13:31.353037', '2021-07-28 14:13:31.353037', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 365, 110, NULL, NULL, NULL, NULL, NULL, NULL),
(211, '2021-07-28 14:13:31.555837', '2021-07-28 14:13:31.555837', NULL, 0, 0, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 368, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(212, '2021-07-28 14:16:37.856365', '2021-07-28 14:16:37.856365', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 369, 88, NULL, NULL, NULL, NULL, NULL, NULL),
(213, '2021-07-28 14:23:10.543255', '2021-07-28 14:23:10.543255', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 371, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(214, '2021-07-28 14:23:10.574455', '2021-07-28 14:23:10.574455', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 22, NULL, 2, 19, 5, NULL, 4, 372, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(215, '2021-07-28 14:23:10.590055', '2021-07-28 14:23:10.590055', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 4, NULL, 2, 19, 5, NULL, 4, 373, NULL, NULL, NULL, NULL, 217, NULL, NULL),
(216, '2021-07-28 14:23:10.683655', '2021-07-28 14:23:10.683655', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 19, NULL, 2, 19, 5, NULL, 4, 374, NULL, NULL, NULL, NULL, 205, NULL, NULL),
(217, '2021-07-28 14:23:10.714855', '2021-07-28 14:23:10.714855', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 20, NULL, 2, 19, 5, NULL, 4, 375, NULL, NULL, NULL, NULL, 221, NULL, NULL),
(218, '2021-07-28 14:23:10.714855', '2021-07-28 14:23:10.714855', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 373, NULL, NULL, NULL, NULL, 217, NULL, NULL),
(219, '2021-07-28 14:23:10.761655', '2021-07-28 14:23:10.761655', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 372, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(220, '2021-07-28 14:23:10.808455', '2021-07-28 14:23:10.808455', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 500, NULL, 53, NULL, 2, 19, 5, NULL, 4, 376, NULL, NULL, NULL, NULL, 240, NULL, NULL),
(221, '2021-07-28 14:23:10.855255', '2021-07-28 14:23:10.855255', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 374, NULL, NULL, NULL, NULL, 205, NULL, NULL),
(222, '2021-07-28 14:23:10.870855', '2021-07-28 14:23:10.870855', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 373, 86, NULL, NULL, NULL, 217, NULL, NULL),
(223, '2021-07-28 14:23:10.886455', '2021-07-28 14:23:10.886455', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 375, NULL, NULL, NULL, NULL, 221, NULL, NULL),
(224, '2021-07-28 14:23:10.980055', '2021-07-28 14:23:10.980055', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 38, NULL, 2, 19, 5, NULL, 4, 372, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(225, '2021-07-28 14:23:11.307656', '2021-07-28 14:23:11.307656', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 374, 87, NULL, NULL, NULL, 205, NULL, NULL),
(226, '2021-07-28 14:25:04.189454', '2021-07-28 14:25:04.189454', NULL, 0, 0, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 379, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(227, '2021-07-28 14:27:27.850107', '2021-07-28 14:27:27.850107', NULL, 0, 0, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 380, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(228, '2021-07-28 14:27:27.881307', '2021-07-28 14:27:27.881307', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 381, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(229, '2021-07-28 14:28:51.809454', '2021-07-28 14:28:51.809454', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 382, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(230, '2021-07-28 14:29:40.653140', '2021-07-28 14:29:40.653140', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 383, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(231, '2021-07-28 14:29:40.715540', '2021-07-28 14:29:40.715540', NULL, 0, 0, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 384, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(232, '2021-07-28 14:47:54.981028', '2021-07-28 14:47:54.981028', NULL, 0, 0, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 387, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(233, '2021-07-28 14:52:45.799545', '2021-07-28 14:52:45.799545', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 391, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(234, '2021-07-28 14:52:45.799545', '2021-07-28 14:52:45.799545', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 393, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(235, '2021-07-28 14:52:45.815145', '2021-07-28 14:52:45.815145', NULL, 0, 0, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 394, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(236, '2021-07-28 14:52:45.815145', '2021-07-28 14:52:45.815145', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 390, 193, NULL, NULL, NULL, NULL, NULL, NULL),
(237, '2021-07-29 04:55:38.825693', '2021-07-29 04:55:38.825693', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 2, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 84, NULL, 19, 5, NULL, NULL, NULL),
(238, '2021-07-29 05:21:07.792644', '2021-07-29 05:21:07.792644', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 1000, NULL, 53, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(239, '2021-07-29 05:58:46.521404', '2021-07-29 05:58:46.521404', NULL, 1, 0, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 81, NULL, 19, 5, NULL, NULL, NULL),
(240, '2021-07-29 05:58:47.061435', '2021-07-29 05:58:47.061435', NULL, 1, 0, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 101, NULL, 19, 5, NULL, NULL, NULL),
(241, '2021-07-29 05:58:47.233445', '2021-07-29 05:58:47.233445', NULL, 1, 0, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 103, NULL, 19, 5, NULL, NULL, NULL),
(242, '2021-07-29 05:58:47.357452', '2021-07-29 05:58:47.357452', NULL, 1, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 110, NULL, 19, 5, NULL, NULL, NULL),
(243, '2021-07-29 06:26:01.647928', '2021-07-29 06:26:01.647928', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 398, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(244, '2021-07-29 06:26:01.649928', '2021-07-29 06:26:01.649928', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 500, NULL, 52, NULL, 8, 19, 5, NULL, 4, 397, NULL, NULL, NULL, NULL, 241, NULL, NULL),
(245, '2021-07-29 06:27:35.305285', '2021-07-29 06:27:35.305285', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 400, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(246, '2021-07-29 06:30:30.015278', '2021-07-29 06:30:30.015278', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 403, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(247, '2021-07-29 06:31:14.763837', '2021-07-29 06:31:14.763837', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 406, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(248, '2021-07-29 07:29:08.245509', '2021-07-29 07:29:08.245509', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 412, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(249, '2021-07-29 07:42:45.087726', '2021-07-29 07:42:45.087726', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 414, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(250, '2021-07-29 08:15:00.195050', '2021-07-29 08:15:00.195050', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 415, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(251, '2021-07-29 08:16:35.030418', '2021-07-29 08:16:35.030418', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 419, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(252, '2021-07-29 08:24:11.897222', '2021-07-29 08:24:11.897222', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 423, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(253, '2021-07-29 08:29:22.911373', '2021-07-29 08:29:22.911373', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 424, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(254, '2021-07-29 09:18:38.058583', '2021-07-29 09:18:38.058583', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 427, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(255, '2021-07-29 09:34:58.489506', '2021-07-29 09:34:58.489506', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 429, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(256, '2021-07-29 10:13:05.669138', '2021-07-29 10:13:05.669138', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 431, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(257, '2021-07-29 10:13:59.957234', '2021-07-29 10:13:59.957234', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 19, NULL, 8, 19, 5, NULL, 4, 432, NULL, NULL, NULL, NULL, 205, NULL, NULL);
INSERT INTO `product_app_item_transfer` (`id`, `created_at`, `updated_at`, `product_quantity`, `is_confirmed`, `recieved_ebarimt`, `comment`, `unit_size`, `unit_price`, `total_amount`, `quantity`, `size`, `budget_id`, `commodity_id`, `confirmed_by_id`, `created_by_id`, `fr_client_id`, `fr_division_id`, `fr_user_id`, `item_transfer_type_id`, `order_detial_id`, `product_id`, `store_id`, `to_client_id`, `to_division_id`, `to_product_id`, `to_user_id`, `updated_by_id`) VALUES
(258, '2021-07-29 10:14:00.004034', '2021-07-29 10:14:00.004034', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 22, NULL, 8, 19, 5, NULL, 4, 433, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(259, '2021-07-29 10:14:00.331634', '2021-07-29 10:14:00.331634', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 8, 19, 5, NULL, 4, 432, NULL, NULL, NULL, NULL, 205, NULL, NULL),
(260, '2021-07-29 10:14:00.362835', '2021-07-29 10:14:00.362835', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 8, 19, 5, NULL, 4, 433, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(261, '2021-07-29 10:14:00.690435', '2021-07-29 10:14:00.690435', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 4, 432, 87, NULL, NULL, NULL, 205, NULL, NULL),
(262, '2021-07-29 10:14:00.706035', '2021-07-29 10:14:00.706035', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 38, NULL, 8, 19, 5, NULL, 4, 433, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(263, '2021-07-29 11:11:46.496537', '2021-07-29 11:11:46.496537', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 435, 85, NULL, NULL, NULL, NULL, NULL, NULL),
(264, '2021-07-29 11:13:19.254300', '2021-07-29 11:13:19.254300', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 442, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(265, '2021-07-29 11:13:19.254300', '2021-07-29 11:13:19.254300', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 441, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(266, '2021-07-29 11:13:19.269900', '2021-07-29 11:13:19.269900', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 440, 124, NULL, NULL, NULL, NULL, NULL, NULL),
(267, '2021-07-29 11:13:19.269900', '2021-07-29 11:13:19.269900', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 443, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(268, '2021-07-29 11:26:40.222714', '2021-07-29 11:26:40.222714', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 444, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(269, '2021-07-29 11:36:17.829329', '2021-07-29 11:36:17.829329', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 447, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(270, '2021-07-29 11:36:17.829329', '2021-07-29 11:36:17.829329', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 446, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(271, '2021-07-29 12:02:54.529342', '2021-07-29 12:02:54.529342', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 449, 236, NULL, NULL, NULL, NULL, NULL, NULL),
(272, '2021-07-29 12:14:13.848942', '2021-07-29 12:14:13.848942', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 4, NULL, 6, 19, 5, NULL, 4, 451, NULL, NULL, NULL, NULL, 217, NULL, NULL),
(273, '2021-07-29 12:14:13.880142', '2021-07-29 12:14:13.880142', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 20, NULL, 6, 19, 5, NULL, 4, 453, NULL, NULL, NULL, NULL, 221, NULL, NULL),
(274, '2021-07-29 12:14:13.942542', '2021-07-29 12:14:13.942542', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 19, NULL, 6, 19, 5, NULL, 4, 452, NULL, NULL, NULL, NULL, 225, NULL, NULL),
(275, '2021-07-29 12:14:14.254542', '2021-07-29 12:14:14.254542', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 6, 19, 5, NULL, 4, 453, NULL, NULL, NULL, NULL, 221, NULL, NULL),
(276, '2021-07-29 12:14:14.301342', '2021-07-29 12:14:14.301342', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 6, 19, 5, NULL, 4, 451, NULL, NULL, NULL, NULL, 217, NULL, NULL),
(277, '2021-07-29 12:14:14.301342', '2021-07-29 12:14:14.301342', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 6, 19, 5, NULL, 4, 452, NULL, NULL, NULL, NULL, 225, NULL, NULL),
(278, '2021-07-29 12:14:14.457343', '2021-07-29 12:14:14.457343', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 4, 451, 86, NULL, NULL, NULL, 217, NULL, NULL),
(279, '2021-07-29 12:14:14.504143', '2021-07-29 12:14:14.504143', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 4, 452, 87, NULL, NULL, NULL, 225, NULL, NULL),
(280, '2021-07-29 12:14:38.091384', '2021-07-29 12:14:38.091384', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 19, NULL, 6, 19, 5, NULL, 4, 454, NULL, NULL, NULL, NULL, 205, NULL, NULL),
(281, '2021-07-29 12:14:38.200584', '2021-07-29 12:14:38.200584', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 6, 19, 5, NULL, 4, 454, NULL, NULL, NULL, NULL, 205, NULL, NULL),
(282, '2021-07-29 12:14:38.434585', '2021-07-29 12:14:38.434585', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 4, 454, 87, NULL, NULL, NULL, 205, NULL, NULL),
(283, '2021-07-29 14:06:50.568441', '2021-07-29 14:06:50.568441', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 457, 236, NULL, NULL, NULL, NULL, NULL, NULL),
(284, '2021-07-29 14:09:17.723499', '2021-07-29 14:09:17.723499', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 19, NULL, 2, 19, 5, NULL, 4, 458, NULL, NULL, NULL, NULL, 206, NULL, NULL),
(285, '2021-07-29 14:09:17.895099', '2021-07-29 14:09:17.895099', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 458, NULL, NULL, NULL, NULL, 206, NULL, NULL),
(286, '2021-07-29 14:09:17.973099', '2021-07-29 14:09:17.973099', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 458, 87, NULL, NULL, NULL, 206, NULL, NULL),
(287, '2021-07-29 14:10:22.572813', '2021-07-29 14:10:22.572813', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 19, NULL, 2, 19, 5, NULL, 4, 460, NULL, NULL, NULL, NULL, 205, NULL, NULL),
(288, '2021-07-29 14:10:22.604013', '2021-07-29 14:10:22.604013', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 4, NULL, 2, 19, 5, NULL, 4, 461, NULL, NULL, NULL, NULL, 217, NULL, NULL),
(289, '2021-07-29 14:10:22.744413', '2021-07-29 14:10:22.744413', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 460, NULL, NULL, NULL, NULL, 205, NULL, NULL),
(290, '2021-07-29 14:10:22.775613', '2021-07-29 14:10:22.775613', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 461, NULL, NULL, NULL, NULL, 217, NULL, NULL),
(291, '2021-07-29 14:10:22.869213', '2021-07-29 14:10:22.869213', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 460, 87, NULL, NULL, NULL, 205, NULL, NULL),
(292, '2021-07-29 14:10:22.900414', '2021-07-29 14:10:22.900414', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 461, 86, NULL, NULL, NULL, 217, NULL, NULL),
(293, '2021-07-29 14:13:05.703700', '2021-07-29 14:13:05.703700', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 1000, NULL, 19, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(294, '2021-07-29 14:16:59.567711', '2021-07-29 14:16:59.567711', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 120, NULL, 22, NULL, 2, 19, 5, NULL, 4, 463, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(295, '2021-07-29 14:16:59.583311', '2021-07-29 14:16:59.583311', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 465, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(296, '2021-07-29 14:16:59.598911', '2021-07-29 14:16:59.598911', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 100, NULL, 4, NULL, 2, 19, 5, NULL, 4, 462, NULL, NULL, NULL, NULL, 204, NULL, NULL),
(297, '2021-07-29 14:16:59.864112', '2021-07-29 14:16:59.864112', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 30, NULL, 42, NULL, 2, 19, 5, NULL, 4, 463, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(298, '2021-07-29 14:17:00.129312', '2021-07-29 14:17:00.129312', 2, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 462, 86, NULL, NULL, NULL, 204, NULL, NULL),
(299, '2021-07-29 14:17:00.971714', '2021-07-29 14:17:00.971714', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 40, NULL, 38, NULL, 2, 19, 5, NULL, 4, 463, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(300, '2021-07-29 14:23:13.765569', '2021-07-29 14:23:13.765569', NULL, 0, 0, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 471, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(301, '2021-07-29 14:23:13.796769', '2021-07-29 14:23:13.796769', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 470, 112, NULL, NULL, NULL, NULL, NULL, NULL),
(302, '2021-07-29 14:23:13.999569', '2021-07-29 14:23:13.999569', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 472, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(303, '2021-07-29 14:23:14.061969', '2021-07-29 14:23:14.061969', NULL, 0, 0, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 473, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(304, '2021-07-29 14:23:14.124369', '2021-07-29 14:23:14.124369', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 474, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(305, '2021-07-29 14:23:33.406003', '2021-07-29 14:23:33.406003', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 22, NULL, 2, 19, 5, NULL, 4, 477, NULL, NULL, NULL, NULL, 161, NULL, NULL),
(306, '2021-07-29 14:34:27.078309', '2021-07-29 14:34:27.078309', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 481, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(307, '2021-07-29 14:34:27.085309', '2021-07-29 14:34:27.085309', NULL, 0, 0, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 479, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(308, '2021-07-29 14:34:27.088309', '2021-07-29 14:34:27.088309', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 480, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(309, '2021-07-30 03:55:38.371846', '2021-07-30 03:55:38.372846', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 2, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 86, NULL, 19, 5, NULL, NULL, NULL),
(310, '2021-07-30 03:55:38.709866', '2021-07-30 03:55:38.709866', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 3, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 87, NULL, 19, 5, NULL, NULL, NULL),
(311, '2021-07-30 08:34:06.751276', '2021-07-30 08:34:06.751276', NULL, 1, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 112, NULL, 19, 5, NULL, NULL, NULL),
(312, '2021-07-30 08:34:07.221303', '2021-07-30 08:34:07.221303', NULL, 1, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 124, NULL, 19, 5, NULL, NULL, NULL),
(313, '2021-07-30 08:34:07.363311', '2021-07-30 08:34:07.363311', NULL, 1, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 126, NULL, 19, 5, NULL, NULL, NULL),
(314, '2021-07-30 08:35:42.158733', '2021-07-30 08:35:42.159733', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 2, NULL, 42, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(315, '2021-07-30 08:36:08.125218', '2021-07-30 08:36:08.125218', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 1498, NULL, 42, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(316, '2021-07-30 08:36:24.072130', '2021-07-30 08:36:24.072130', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 750, NULL, 42, 2, 2, 16, 5, NULL, 2, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(317, '2021-08-07 04:35:50.131620', '2021-08-07 04:35:50.131620', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 86, NULL, 19, 5, NULL, NULL, NULL),
(318, '2021-08-07 05:38:40.406267', '2021-08-07 05:38:40.406267', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 103, NULL, 16, 5, NULL, NULL, NULL),
(319, '2021-08-07 05:42:13.327446', '2021-08-07 05:42:13.327446', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 101, NULL, 16, 5, NULL, NULL, NULL),
(320, '2021-08-07 05:42:13.478454', '2021-08-07 05:42:13.478454', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 108, NULL, 16, 5, NULL, NULL, NULL),
(321, '2021-08-07 05:42:13.576460', '2021-08-07 05:42:13.576460', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 96, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 84, NULL, 16, 5, NULL, NULL, NULL),
(322, '2021-08-07 05:42:13.670465', '2021-08-07 05:42:13.670465', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 95, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 87, NULL, 16, 5, NULL, NULL, NULL),
(323, '2021-08-07 05:42:13.794472', '2021-08-07 05:42:13.794472', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 72, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 81, NULL, 16, 5, NULL, NULL, NULL),
(324, '2021-08-07 05:42:13.891478', '2021-08-07 05:42:13.891478', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 160, NULL, 16, 5, NULL, NULL, NULL),
(325, '2021-08-07 05:42:13.977483', '2021-08-07 05:42:13.977483', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 149, NULL, 16, 5, NULL, NULL, NULL),
(326, '2021-08-07 05:42:14.074489', '2021-08-07 05:42:14.074489', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 133, NULL, 16, 5, NULL, NULL, NULL),
(327, '2021-08-07 05:42:14.165494', '2021-08-07 05:42:14.165494', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 116, NULL, 16, 5, NULL, NULL, NULL),
(328, '2021-08-07 05:42:14.272500', '2021-08-07 05:42:14.273500', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 112, NULL, 16, 5, NULL, NULL, NULL),
(329, '2021-08-07 05:42:14.374506', '2021-08-07 05:42:14.374506', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 24, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 227, NULL, 16, 5, NULL, NULL, NULL),
(330, '2021-08-07 05:42:14.881535', '2021-08-07 05:42:14.881535', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 72, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 86, NULL, 16, 5, NULL, NULL, NULL),
(331, '2021-08-07 05:44:16.648499', '2021-08-07 05:44:16.648499', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 0, NULL, 5, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(332, '2021-08-07 05:44:16.877512', '2021-08-07 05:44:16.877512', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 0, NULL, 52, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(333, '2021-08-07 05:44:16.989519', '2021-08-07 05:44:16.989519', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 0, NULL, 55, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(334, '2021-08-07 05:44:17.113526', '2021-08-07 05:44:17.113526', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 0, NULL, 42, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(335, '2021-08-07 05:55:00.149305', '2021-08-07 05:55:00.149305', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 116, NULL, 19, 5, NULL, NULL, NULL),
(336, '2021-08-07 05:55:00.292314', '2021-08-07 05:55:00.292314', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 131, NULL, 19, 5, NULL, NULL, NULL),
(337, '2021-08-07 05:55:00.415321', '2021-08-07 05:55:00.416321', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 110, NULL, 19, 5, NULL, NULL, NULL),
(338, '2021-08-07 05:55:00.568329', '2021-08-07 05:55:00.568329', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 21, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 86, NULL, 19, 5, NULL, NULL, NULL),
(339, '2021-08-07 05:55:00.644334', '2021-08-07 05:55:00.644334', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 5, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 84, NULL, 19, 5, NULL, NULL, NULL),
(340, '2021-08-07 05:55:00.727339', '2021-08-07 05:55:00.727339', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 15, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 88, NULL, 19, 5, NULL, NULL, NULL),
(341, '2021-08-07 05:55:00.809343', '2021-08-07 05:55:00.809343', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 193, NULL, 19, 5, NULL, NULL, NULL),
(342, '2021-08-07 05:55:00.901348', '2021-08-07 05:55:00.901348', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 18, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 85, NULL, 19, 5, NULL, NULL, NULL),
(343, '2021-08-07 05:55:01.002354', '2021-08-07 05:55:01.002354', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 4, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 87, NULL, 19, 5, NULL, NULL, NULL),
(344, '2021-08-07 05:55:01.091359', '2021-08-07 05:55:01.091359', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 16, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 81, NULL, 19, 5, NULL, NULL, NULL),
(345, '2021-08-07 05:55:01.490382', '2021-08-07 05:55:01.490382', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 227, NULL, 19, 5, NULL, NULL, NULL),
(346, '2021-08-07 05:55:01.600388', '2021-08-07 05:55:01.600388', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 101, NULL, 19, 5, NULL, NULL, NULL),
(347, '2021-08-07 05:55:01.684393', '2021-08-07 05:55:01.684393', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 10, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 103, NULL, 19, 5, NULL, NULL, NULL),
(348, '2021-08-07 05:55:01.758398', '2021-08-07 05:55:01.758398', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 20, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 235, NULL, 19, 5, NULL, NULL, NULL),
(349, '2021-08-07 05:55:01.842402', '2021-08-07 05:55:01.842402', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 190, NULL, 19, 5, NULL, NULL, NULL),
(350, '2021-08-07 05:55:01.941408', '2021-08-07 05:55:01.941408', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 124, NULL, 19, 5, NULL, NULL, NULL),
(351, '2021-08-07 06:05:17.196516', '2021-08-07 06:05:17.197516', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 900, NULL, 5, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(352, '2021-08-07 06:05:17.371526', '2021-08-07 06:05:17.371526', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 0, NULL, 19, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(353, '2021-08-07 06:05:17.472532', '2021-08-07 06:05:17.472532', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 0, NULL, 20, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(354, '2021-08-07 06:05:17.703545', '2021-08-07 06:05:17.703545', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 0, NULL, 24, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(355, '2021-08-07 06:05:17.789550', '2021-08-07 06:05:17.789550', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 0, NULL, 38, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(356, '2021-08-07 06:05:17.884555', '2021-08-07 06:05:17.884555', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 0, NULL, 27, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(357, '2021-08-07 06:05:18.285578', '2021-08-07 06:05:18.286578', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 0, NULL, 28, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(358, '2021-08-07 06:05:18.548593', '2021-08-07 06:05:18.548593', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 0, NULL, 25, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(359, '2021-08-07 06:05:18.642599', '2021-08-07 06:05:18.642599', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 0, NULL, 13, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(360, '2021-08-07 06:05:18.723603', '2021-08-07 06:05:18.723603', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 0, NULL, 26, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(361, '2021-08-07 06:05:18.899613', '2021-08-07 06:05:18.899613', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 0, NULL, 1, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(362, '2021-08-07 06:05:18.974617', '2021-08-07 06:05:18.974617', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 0, NULL, 34, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(363, '2021-08-07 06:05:19.128626', '2021-08-07 06:05:19.128626', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 0, NULL, 51, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(364, '2021-08-07 06:05:19.199630', '2021-08-07 06:05:19.199630', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 650, NULL, 22, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(365, '2021-08-07 07:17:57.148448', '2021-08-07 07:17:57.148448', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 485, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(366, '2021-08-07 07:32:06.865174', '2021-08-07 07:32:06.865174', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 487, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(367, '2021-08-07 07:32:06.974374', '2021-08-07 07:32:06.974374', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 489, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(368, '2021-08-07 07:32:07.379975', '2021-08-07 07:32:07.379975', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 492, 85, NULL, NULL, NULL, NULL, NULL, NULL),
(369, '2021-08-07 08:18:42.410247', '2021-08-07 08:18:42.410247', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 495, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(370, '2021-08-07 08:18:43.127848', '2021-08-07 08:18:43.127848', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 501, 236, NULL, NULL, NULL, NULL, NULL, NULL),
(371, '2021-08-07 08:21:09.034905', '2021-08-07 08:21:09.034905', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 507, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(372, '2021-08-07 08:23:43.693576', '2021-08-07 08:23:43.693576', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 514, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(373, '2021-08-07 08:32:14.072073', '2021-08-07 08:32:14.072073', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 525, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(374, '2021-08-07 08:32:14.087673', '2021-08-07 08:32:14.087673', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 527, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(375, '2021-08-07 08:32:14.165673', '2021-08-07 08:32:14.165673', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 526, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(376, '2021-08-07 08:33:00.456528', '2021-08-07 08:33:00.456528', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 530, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(377, '2021-08-07 08:34:03.309123', '2021-08-07 08:34:03.309123', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 531, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(378, '2021-08-07 08:35:46.243010', '2021-08-07 08:35:46.243010', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 538, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(379, '2021-08-07 09:03:28.039647', '2021-08-07 09:03:28.039647', NULL, 1, 0, NULL, NULL, '81000.00', '243000.00', 3, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 133, NULL, 16, 5, NULL, NULL, NULL),
(380, '2021-08-07 09:03:28.375667', '2021-08-07 09:03:28.375667', NULL, 1, 0, NULL, NULL, '110000.00', '110000.00', 1, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 135, NULL, 16, 5, NULL, NULL, NULL),
(381, '2021-08-07 09:04:29.405600', '2021-08-07 09:04:29.406600', NULL, 1, 0, NULL, NULL, '47500.00', '142500.00', 3, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 116, NULL, 16, 5, NULL, NULL, NULL),
(382, '2021-08-07 09:04:29.540607', '2021-08-07 09:04:29.540607', NULL, 1, 0, NULL, NULL, '57000.00', '171000.00', 3, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 160, NULL, 16, 5, NULL, NULL, NULL),
(383, '2021-08-07 09:04:30.132641', '2021-08-07 09:04:30.132641', NULL, 1, 0, NULL, NULL, '47500.00', '142500.00', 3, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 116, NULL, 16, 5, NULL, NULL, NULL),
(384, '2021-08-07 09:04:30.288650', '2021-08-07 09:04:30.288650', NULL, 1, 0, NULL, NULL, '57000.00', '171000.00', 3, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 160, NULL, 16, 5, NULL, NULL, NULL),
(385, '2021-08-07 09:05:31.545982', '2021-08-07 09:05:31.545982', NULL, 1, 0, NULL, NULL, '70900.00', '141800.00', NULL, 2000, NULL, 20, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(386, '2021-08-07 09:05:31.736993', '2021-08-07 09:05:31.736993', NULL, 1, 0, NULL, NULL, '42000.00', '84000.00', NULL, 2000, NULL, 4, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(387, '2021-08-07 09:06:28.375484', '2021-08-07 09:06:28.375484', NULL, 1, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, 16, 5, NULL, 2, NULL, 135, NULL, 19, 5, NULL, NULL, NULL),
(388, '2021-08-07 09:06:28.861511', '2021-08-07 09:06:28.861511', NULL, 1, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, 16, 5, NULL, 2, NULL, 116, NULL, 19, 5, NULL, NULL, NULL),
(389, '2021-08-07 09:08:12.563866', '2021-08-07 09:08:12.563866', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 116, NULL, 16, 5, NULL, NULL, NULL),
(390, '2021-08-07 09:09:02.678469', '2021-08-07 09:09:02.678469', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 1000, NULL, 20, 1, 1, 16, 5, NULL, 2, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(391, '2021-08-07 09:15:59.941940', '2021-08-07 09:15:59.941940', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 541, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(392, '2021-08-07 09:15:59.957941', '2021-08-07 09:15:59.958941', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 5, NULL, 2, 19, 5, NULL, 4, 542, NULL, NULL, NULL, NULL, 117, NULL, NULL),
(393, '2021-08-07 09:19:57.065705', '2021-08-07 09:19:57.065705', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 250, NULL, 56, NULL, 2, 19, 5, NULL, 4, 543, NULL, NULL, NULL, NULL, 89, NULL, NULL),
(394, '2021-08-07 11:19:20.783410', '2021-08-07 11:19:20.783410', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 548, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(395, '2021-08-07 11:19:20.845810', '2021-08-07 11:19:20.845810', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 551, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(396, '2021-08-07 11:19:21.173411', '2021-08-07 11:19:21.173411', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 553, 85, NULL, NULL, NULL, NULL, NULL, NULL),
(397, '2021-08-07 11:23:58.574992', '2021-08-07 11:23:58.574992', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 250, NULL, 53, NULL, 2, 19, 5, NULL, 4, 555, NULL, NULL, NULL, NULL, 240, NULL, NULL),
(398, '2021-08-07 11:23:58.591993', '2021-08-07 11:23:58.591993', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 250, NULL, 52, NULL, 2, 19, 5, NULL, 4, 556, NULL, NULL, NULL, NULL, 241, NULL, NULL),
(399, '2021-08-07 13:24:18.475725', '2021-08-07 13:24:18.475725', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 558, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(400, '2021-08-07 13:24:18.506925', '2021-08-07 13:24:18.506925', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 559, 236, NULL, NULL, NULL, NULL, NULL, NULL),
(401, '2021-08-07 13:37:14.436580', '2021-08-07 13:37:14.436580', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 4, NULL, 8, 19, 5, NULL, 4, 560, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(402, '2021-08-07 13:37:14.514580', '2021-08-07 13:37:14.514580', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 250, NULL, 53, NULL, 8, 19, 5, NULL, 4, 562, NULL, NULL, NULL, NULL, 240, NULL, NULL),
(403, '2021-08-07 13:37:14.623780', '2021-08-07 13:37:14.623780', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 19, NULL, 8, 19, 5, NULL, 4, 560, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(404, '2021-08-07 13:37:14.748581', '2021-08-07 13:37:14.748581', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 22, NULL, 8, 19, 5, NULL, 4, 560, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(405, '2021-08-07 13:37:15.481782', '2021-08-07 13:37:15.481782', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 29, NULL, 8, 19, 5, NULL, 4, 560, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(406, '2021-08-07 13:37:15.559782', '2021-08-07 13:37:15.559782', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 13, NULL, 8, 19, 5, NULL, 4, 560, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(407, '2021-08-07 13:37:15.653382', '2021-08-07 13:37:15.653382', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 8, 19, 5, NULL, 4, 560, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(408, '2021-08-07 13:37:15.731382', '2021-08-07 13:37:15.731382', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 4, 560, 84, NULL, NULL, NULL, 201, NULL, NULL),
(409, '2021-08-07 13:39:47.658485', '2021-08-07 13:39:47.658485', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 563, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(410, '2021-08-07 13:39:47.727489', '2021-08-07 13:39:47.727489', NULL, 0, 0, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 564, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(411, '2021-08-07 13:39:47.750490', '2021-08-07 13:39:47.751491', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 4, NULL, 8, 19, 5, NULL, 4, 566, NULL, NULL, NULL, NULL, 204, NULL, NULL),
(412, '2021-08-07 13:39:47.880498', '2021-08-07 13:39:47.880498', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 4, 566, 86, NULL, NULL, NULL, 204, NULL, NULL),
(413, '2021-08-07 13:42:36.616468', '2021-08-07 13:42:36.616468', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 568, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(414, '2021-08-07 13:42:36.944069', '2021-08-07 13:42:36.944069', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 569, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(415, '2021-08-07 13:42:36.959669', '2021-08-07 13:42:36.959669', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 250, NULL, 53, NULL, 8, 19, 5, NULL, 4, 571, NULL, NULL, NULL, NULL, 240, NULL, NULL),
(416, '2021-08-07 13:44:52.808231', '2021-08-07 13:44:52.808231', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 572, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(417, '2021-08-07 13:44:52.813231', '2021-08-07 13:44:52.813231', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 573, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(418, '2021-08-07 13:44:52.842233', '2021-08-07 13:44:52.843233', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 576, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(419, '2021-08-07 13:44:52.850233', '2021-08-07 13:44:52.850233', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 4, NULL, 2, 19, 5, NULL, 4, 575, NULL, NULL, NULL, NULL, 204, NULL, NULL),
(420, '2021-08-07 13:44:52.938238', '2021-08-07 13:44:52.938238', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 4, NULL, 2, 19, 5, NULL, 4, 574, NULL, NULL, NULL, NULL, 202, NULL, NULL),
(421, '2021-08-07 13:44:53.221254', '2021-08-07 13:44:53.221254', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 19, NULL, 2, 19, 5, NULL, 4, 574, NULL, NULL, NULL, NULL, 202, NULL, NULL),
(422, '2021-08-07 13:44:53.254256', '2021-08-07 13:44:53.254256', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 575, 86, NULL, NULL, NULL, 204, NULL, NULL),
(423, '2021-08-07 13:44:53.341261', '2021-08-07 13:44:53.341261', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 22, NULL, 2, 19, 5, NULL, 4, 574, NULL, NULL, NULL, NULL, 202, NULL, NULL),
(424, '2021-08-07 13:44:53.451267', '2021-08-07 13:44:53.451267', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 29, NULL, 2, 19, 5, NULL, 4, 574, NULL, NULL, NULL, NULL, 202, NULL, NULL),
(425, '2021-08-07 13:44:53.746284', '2021-08-07 13:44:53.746284', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 574, 86, NULL, NULL, NULL, 202, NULL, NULL),
(426, '2021-08-07 13:44:53.865291', '2021-08-07 13:44:53.865291', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 574, 86, NULL, NULL, NULL, 202, NULL, NULL),
(427, '2021-08-07 13:49:20.441830', '2021-08-07 13:49:20.441830', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 580, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(428, '2021-08-07 13:49:20.504230', '2021-08-07 13:49:20.504230', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 581, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(429, '2021-08-07 13:49:20.753831', '2021-08-07 13:49:20.753831', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 100, NULL, 22, NULL, 8, 19, 5, NULL, 4, 582, NULL, NULL, NULL, NULL, 161, NULL, NULL),
(430, '2021-08-07 13:49:20.753831', '2021-08-07 13:49:20.753831', 3, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 4, NULL, 8, 19, 5, NULL, 4, 583, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(431, '2021-08-07 13:49:20.769431', '2021-08-07 13:49:20.769431', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 22, NULL, 8, 19, 5, NULL, 4, 585, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(432, '2021-08-07 13:49:20.972231', '2021-08-07 13:49:20.972231', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 586, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(433, '2021-08-07 13:49:21.159432', '2021-08-07 13:49:21.159432', 3, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 19, NULL, 8, 19, 5, NULL, 4, 583, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(434, '2021-08-07 13:49:21.159432', '2021-08-07 13:49:21.159432', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 8, 19, 5, NULL, 4, 585, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(435, '2021-08-07 13:49:21.299832', '2021-08-07 13:49:21.299832', 3, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 22, NULL, 8, 19, 5, NULL, 4, 583, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(436, '2021-08-07 13:49:21.299832', '2021-08-07 13:49:21.299832', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 38, NULL, 8, 19, 5, NULL, 4, 585, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(437, '2021-08-07 13:49:21.424632', '2021-08-07 13:49:21.424632', 3, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 29, NULL, 8, 19, 5, NULL, 4, 583, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(438, '2021-08-07 13:49:21.549432', '2021-08-07 13:49:21.549432', 3, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 13, NULL, 8, 19, 5, NULL, 4, 583, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(439, '2021-08-07 13:49:22.267033', '2021-08-07 13:49:22.267033', 3, 0, 0, NULL, NULL, NULL, NULL, NULL, 45, NULL, 42, NULL, 8, 19, 5, NULL, 4, 583, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(440, '2021-08-07 13:49:22.391834', '2021-08-07 13:49:22.391834', 3, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 4, 583, 84, NULL, NULL, NULL, 201, NULL, NULL),
(441, '2021-08-07 13:51:32.420062', '2021-08-07 13:51:32.420062', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 587, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(442, '2021-08-07 13:51:32.732063', '2021-08-07 13:51:32.732063', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 4, NULL, 8, 19, 5, NULL, 4, 591, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(443, '2021-08-07 13:51:32.747663', '2021-08-07 13:51:32.747663', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 4, NULL, 8, 19, 5, NULL, 4, 590, NULL, NULL, NULL, NULL, 217, NULL, NULL),
(444, '2021-08-07 13:51:33.044063', '2021-08-07 13:51:33.044063', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 8, 19, 5, NULL, 4, 590, NULL, NULL, NULL, NULL, 217, NULL, NULL),
(445, '2021-08-07 13:51:33.059663', '2021-08-07 13:51:33.059663', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 19, NULL, 8, 19, 5, NULL, 4, 591, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(446, '2021-08-07 13:51:33.231264', '2021-08-07 13:51:33.231264', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 4, 590, 86, NULL, NULL, NULL, 217, NULL, NULL),
(447, '2021-08-07 13:51:33.262464', '2021-08-07 13:51:33.262464', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 22, NULL, 8, 19, 5, NULL, 4, 591, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(448, '2021-08-07 13:51:33.480864', '2021-08-07 13:51:33.480864', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 29, NULL, 8, 19, 5, NULL, 4, 591, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(449, '2021-08-07 13:51:33.574464', '2021-08-07 13:51:33.574464', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 13, NULL, 8, 19, 5, NULL, 4, 591, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(450, '2021-08-07 13:51:33.668064', '2021-08-07 13:51:33.668064', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 8, 19, 5, NULL, 4, 591, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(451, '2021-08-07 13:51:33.730464', '2021-08-07 13:51:33.730464', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 4, 591, 84, NULL, NULL, NULL, 201, NULL, NULL),
(452, '2021-08-07 13:52:45.896191', '2021-08-07 13:52:45.896191', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 592, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(453, '2021-08-07 13:54:08.053979', '2021-08-07 13:54:08.053979', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 598, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(454, '2021-08-07 13:54:08.109982', '2021-08-07 13:54:08.109982', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 599, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(455, '2021-08-07 14:00:52.209803', '2021-08-07 14:00:52.209803', NULL, 0, 0, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 601, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(456, '2021-08-08 06:49:25.362765', '2021-08-08 06:49:25.362765', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 6, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 81, NULL, 19, 5, NULL, NULL, NULL),
(457, '2021-08-08 06:49:26.039804', '2021-08-08 06:49:26.039804', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 2, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 86, NULL, 19, 5, NULL, NULL, NULL),
(458, '2021-08-08 06:49:26.129809', '2021-08-08 06:49:26.129809', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 5, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 84, NULL, 19, 5, NULL, NULL, NULL),
(459, '2021-08-08 13:59:54.134887', '2021-08-08 13:59:54.134887', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 603, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(460, '2021-08-08 14:02:23.351150', '2021-08-08 14:02:23.351150', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 613, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(461, '2021-08-08 14:03:06.853027', '2021-08-08 14:03:06.853027', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 614, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(462, '2021-08-08 14:03:06.868627', '2021-08-08 14:03:06.868627', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 615, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(463, '2021-08-08 14:05:40.842897', '2021-08-08 14:05:40.842897', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 622, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(464, '2021-08-08 14:05:41.139298', '2021-08-08 14:05:41.139298', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 626, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(465, '2021-08-08 14:12:41.850522', '2021-08-08 14:12:41.850522', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 630, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(466, '2021-08-08 14:14:50.196863', '2021-08-08 14:14:50.196863', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 637, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(467, '2021-08-08 14:15:58.700781', '2021-08-08 14:15:58.700781', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 643, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(468, '2021-08-08 14:17:47.270991', '2021-08-08 14:17:47.270991', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 645, 227, NULL, NULL, NULL, NULL, NULL, NULL),
(469, '2021-08-08 14:17:47.314993', '2021-08-08 14:17:47.314993', NULL, 0, 0, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 646, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(470, '2021-08-08 14:17:47.500004', '2021-08-08 14:17:47.500004', NULL, 0, 0, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 651, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(471, '2021-08-08 14:17:47.642012', '2021-08-08 14:17:47.642012', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 652, 85, NULL, NULL, NULL, NULL, NULL, NULL),
(472, '2021-08-08 14:19:19.927291', '2021-08-08 14:19:19.928291', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 654, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(473, '2021-08-08 14:19:19.993294', '2021-08-08 14:19:19.993294', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 658, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(474, '2021-08-08 14:19:19.996295', '2021-08-08 14:19:19.996295', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 655, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(475, '2021-08-08 14:20:54.555703', '2021-08-08 14:20:54.555703', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 659, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(476, '2021-08-08 14:20:54.630707', '2021-08-08 14:20:54.630707', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 660, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(477, '2021-08-08 14:25:19.962883', '2021-08-08 14:25:19.962883', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 664, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(478, '2021-08-08 14:25:20.025887', '2021-08-08 14:25:20.025887', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 665, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(483, '2021-08-08 14:28:37.093159', '2021-08-08 14:28:37.093159', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 40, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 101, NULL, 19, 5, NULL, NULL, NULL),
(487, '2021-08-08 14:35:44.105518', '2021-08-08 14:35:44.105518', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 676, 87, NULL, NULL, NULL, NULL, NULL, NULL),
(488, '2021-08-08 14:35:44.175522', '2021-08-08 14:35:44.175522', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 679, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(489, '2021-08-08 14:35:44.177522', '2021-08-08 14:35:44.177522', 4, 0, 0, NULL, NULL, NULL, NULL, NULL, 200, NULL, 5, NULL, 6, 19, 5, NULL, 4, 680, NULL, NULL, NULL, NULL, 117, NULL, NULL),
(490, '2021-08-08 14:35:44.188523', '2021-08-08 14:35:44.188523', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 677, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(491, '2021-08-08 14:35:44.343532', '2021-08-08 14:35:44.343532', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 678, 116, NULL, NULL, NULL, NULL, NULL, NULL),
(492, '2021-08-08 14:39:43.053185', '2021-08-08 14:39:43.053185', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 684, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(493, '2021-08-08 14:39:43.065186', '2021-08-08 14:39:43.065186', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 4, NULL, 6, 19, 5, NULL, 4, 681, NULL, NULL, NULL, NULL, 217, NULL, NULL),
(494, '2021-08-08 14:39:43.122189', '2021-08-08 14:39:43.122189', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 30, NULL, 4, NULL, 6, 19, 5, NULL, 4, 683, NULL, NULL, NULL, NULL, 213, NULL, NULL),
(495, '2021-08-08 14:39:43.327201', '2021-08-08 14:39:43.327201', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 38, NULL, 6, 19, 5, NULL, 4, 683, NULL, NULL, NULL, NULL, 213, NULL, NULL),
(496, '2021-08-08 14:39:43.653219', '2021-08-08 14:39:43.653219', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 6, 19, 5, NULL, 4, 681, NULL, NULL, NULL, NULL, 217, NULL, NULL),
(497, '2021-08-08 14:39:43.943236', '2021-08-08 14:39:43.943236', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 6, 19, 5, NULL, 4, 683, NULL, NULL, NULL, NULL, 213, NULL, NULL),
(498, '2021-08-08 14:39:44.147248', '2021-08-08 14:39:44.147248', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 4, 681, 86, NULL, NULL, NULL, 217, NULL, NULL),
(499, '2021-08-08 14:45:05.167609', '2021-08-08 14:45:05.167609', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 694, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(500, '2021-08-08 14:45:05.396622', '2021-08-08 14:45:05.396622', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 699, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(501, '2021-08-08 14:45:05.419623', '2021-08-08 14:45:05.419623', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 698, 85, NULL, NULL, NULL, NULL, NULL, NULL),
(502, '2021-08-08 14:45:05.771644', '2021-08-08 14:45:05.771644', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 4, NULL, 6, 19, 5, NULL, 4, 700, NULL, NULL, NULL, NULL, 218, NULL, NULL),
(503, '2021-08-08 14:45:05.773644', '2021-08-08 14:45:05.773644', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 250, NULL, 53, NULL, 6, 19, 5, NULL, 4, 697, NULL, NULL, NULL, NULL, 240, NULL, NULL),
(504, '2021-08-08 14:45:05.896651', '2021-08-08 14:45:05.896651', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 40, NULL, 4, NULL, 6, 19, 5, NULL, 4, 701, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(505, '2021-08-08 14:45:06.148665', '2021-08-08 14:45:06.148665', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 40, NULL, 19, NULL, 6, 19, 5, NULL, 4, 701, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(506, '2021-08-08 14:45:06.280673', '2021-08-08 14:45:06.280673', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 40, NULL, 22, NULL, 6, 19, 5, NULL, 4, 701, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(507, '2021-08-08 14:45:08.037773', '2021-08-08 14:45:08.037773', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 40, NULL, 29, NULL, 6, 19, 5, NULL, 4, 701, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(508, '2021-08-08 14:45:08.142779', '2021-08-08 14:45:08.142779', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 40, NULL, 13, NULL, 6, 19, 5, NULL, 4, 701, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(509, '2021-08-08 14:45:08.237785', '2021-08-08 14:45:08.237785', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 30, NULL, 42, NULL, 6, 19, 5, NULL, 4, 701, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(510, '2021-08-08 14:45:08.363792', '2021-08-08 14:45:08.363792', 2, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 4, 701, 84, NULL, NULL, NULL, 201, NULL, NULL),
(511, '2021-08-08 14:47:22.048438', '2021-08-08 14:47:22.048438', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 708, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(512, '2021-08-08 14:47:22.086440', '2021-08-08 14:47:22.086440', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 709, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(513, '2021-08-08 14:54:34.018409', '2021-08-08 14:54:34.018409', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 719, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(514, '2021-08-08 14:54:34.065209', '2021-08-08 14:54:34.065209', 6, 0, 0, NULL, NULL, NULL, NULL, NULL, 300, NULL, 3, NULL, 6, 19, 5, NULL, 4, 720, NULL, NULL, NULL, NULL, 113, NULL, NULL),
(515, '2021-08-08 14:54:34.158810', '2021-08-08 14:54:34.158810', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, 19, 5, NULL, 3, 721, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(516, '2021-08-09 03:32:41.936561', '2021-08-09 03:32:41.936561', NULL, 1, 0, NULL, NULL, '108990.00', '653940.00', 6, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 118, NULL, 16, 5, NULL, NULL, NULL),
(517, '2021-08-09 03:37:34.551230', '2021-08-09 03:37:34.551230', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 750, NULL, 24, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(518, '2021-08-09 03:37:34.689238', '2021-08-09 03:37:34.689238', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 1000, NULL, 34, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(519, '2021-08-09 03:39:44.609415', '2021-08-09 03:39:44.609415', NULL, 1, 0, NULL, NULL, '97499.00', '97499.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 131, NULL, 19, 5, NULL, NULL, NULL),
(520, '2021-08-09 03:41:35.927258', '2021-08-09 03:41:35.927258', NULL, 1, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 118, NULL, 19, 5, NULL, NULL, NULL),
(521, '2021-08-09 03:41:36.110268', '2021-08-09 03:41:36.110268', NULL, 1, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 116, NULL, 19, 5, NULL, NULL, NULL),
(522, '2021-08-09 03:42:11.390003', '2021-08-09 03:42:11.391003', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 200, NULL, 5, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL);
INSERT INTO `product_app_item_transfer` (`id`, `created_at`, `updated_at`, `product_quantity`, `is_confirmed`, `recieved_ebarimt`, `comment`, `unit_size`, `unit_price`, `total_amount`, `quantity`, `size`, `budget_id`, `commodity_id`, `confirmed_by_id`, `created_by_id`, `fr_client_id`, `fr_division_id`, `fr_user_id`, `item_transfer_type_id`, `order_detial_id`, `product_id`, `store_id`, `to_client_id`, `to_division_id`, `to_product_id`, `to_user_id`, `updated_by_id`) VALUES
(523, '2021-08-09 03:42:31.201121', '2021-08-09 03:42:31.201121', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 0, NULL, 5, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(524, '2021-08-09 03:44:20.541089', '2021-08-09 03:44:20.541089', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 85, NULL, 19, 5, NULL, NULL, NULL),
(525, '2021-08-09 04:20:53.953425', '2021-08-09 04:20:53.953425', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 728, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(526, '2021-08-09 04:33:09.166388', '2021-08-09 04:33:09.166388', NULL, 1, 0, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 86, NULL, 19, 5, NULL, NULL, NULL),
(527, '2021-08-09 04:33:09.662416', '2021-08-09 04:33:09.663417', NULL, 1, 0, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 84, NULL, 19, 5, NULL, NULL, NULL),
(528, '2021-08-09 08:29:22.244507', '2021-08-09 08:29:22.244507', NULL, 1, 0, NULL, NULL, '1970.00', '354600.00', 180, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 101, NULL, 16, 5, NULL, NULL, NULL),
(529, '2021-08-09 08:50:42.467369', '2021-08-09 08:50:42.467369', NULL, 1, 0, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 101, NULL, 19, 5, NULL, NULL, NULL),
(530, '2021-08-09 10:04:40.254170', '2021-08-09 10:04:40.254170', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 9, 19, 5, NULL, 3, 730, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(531, '2021-08-09 10:04:40.285370', '2021-08-09 10:04:40.285370', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 9, 19, 5, NULL, 3, 733, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(532, '2021-08-09 10:04:40.690971', '2021-08-09 10:04:40.690971', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 9, 19, 5, NULL, 3, 735, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(533, '2021-08-09 12:12:55.290790', '2021-08-09 12:12:55.290790', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 737, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(534, '2021-08-09 12:14:42.119778', '2021-08-09 12:14:42.135378', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 740, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(535, '2021-08-09 12:40:17.224275', '2021-08-09 12:40:17.224275', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 745, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(536, '2021-08-09 12:40:17.224275', '2021-08-09 12:40:17.224275', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 746, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(537, '2021-08-09 12:45:14.655397', '2021-08-09 12:45:14.655397', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 747, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(538, '2021-08-09 12:46:23.638718', '2021-08-09 12:46:23.638718', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 751, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(539, '2021-08-09 12:49:41.166265', '2021-08-09 12:49:41.166265', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 756, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(540, '2021-08-09 12:53:21.313852', '2021-08-09 12:53:21.313852', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 762, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(541, '2021-08-09 12:53:22.249854', '2021-08-09 12:53:22.249854', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 766, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(542, '2021-08-09 12:53:22.249854', '2021-08-09 12:53:22.249854', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 765, 227, NULL, NULL, NULL, NULL, NULL, NULL),
(543, '2021-08-09 12:54:18.768753', '2021-08-09 12:54:18.768753', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 768, 85, NULL, NULL, NULL, NULL, NULL, NULL),
(544, '2021-08-09 12:54:18.784353', '2021-08-09 12:54:18.799953', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 769, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(548, '2021-08-09 13:08:11.500220', '2021-08-09 13:08:11.500220', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 783, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(549, '2021-08-09 13:09:46.726787', '2021-08-09 13:09:46.726787', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 786, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(550, '2021-08-09 13:09:46.742387', '2021-08-09 13:09:46.742387', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 787, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(551, '2021-08-09 13:41:04.536305', '2021-08-09 13:41:04.536305', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 791, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(552, '2021-08-09 13:42:57.091743', '2021-08-09 13:42:57.091743', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 796, 227, NULL, NULL, NULL, NULL, NULL, NULL),
(553, '2021-08-09 13:50:01.166999', '2021-08-09 13:50:01.166999', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 86, NULL, 19, 5, NULL, NULL, NULL),
(554, '2021-08-09 13:50:01.307007', '2021-08-09 13:50:01.307007', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 84, NULL, 19, 5, NULL, NULL, NULL),
(555, '2021-08-09 13:50:01.407013', '2021-08-09 13:50:01.407013', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 2, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 235, NULL, 19, 5, NULL, NULL, NULL),
(556, '2021-08-09 13:54:44.385009', '2021-08-09 13:54:44.385009', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 800, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(557, '2021-08-09 13:58:10.601771', '2021-08-09 13:58:10.601771', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 804, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(558, '2021-08-09 14:03:00.793481', '2021-08-09 14:03:00.793481', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 807, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(559, '2021-08-09 14:03:49.543567', '2021-08-09 14:03:49.543567', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 812, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(560, '2021-08-09 14:04:59.166489', '2021-08-09 14:04:59.166489', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 19, NULL, 2, 19, 5, NULL, 4, 814, NULL, NULL, NULL, NULL, 205, NULL, NULL),
(561, '2021-08-09 14:04:59.197689', '2021-08-09 14:04:59.197689', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 817, 87, NULL, NULL, NULL, NULL, NULL, NULL),
(562, '2021-08-09 14:04:59.228889', '2021-08-09 14:04:59.228889', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 29, NULL, 2, 19, 5, NULL, 4, 816, NULL, NULL, NULL, NULL, 175, NULL, NULL),
(563, '2021-08-09 14:04:59.572090', '2021-08-09 14:04:59.572090', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 814, NULL, NULL, NULL, NULL, 205, NULL, NULL),
(564, '2021-08-09 14:04:59.603290', '2021-08-09 14:04:59.603290', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 820, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(565, '2021-08-09 14:04:59.915290', '2021-08-09 14:04:59.915290', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 814, 87, NULL, NULL, NULL, 205, NULL, NULL),
(566, '2021-08-09 14:06:46.089077', '2021-08-09 14:06:46.089077', NULL, 0, 0, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 822, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(567, '2021-08-09 14:06:46.463477', '2021-08-09 14:06:46.463477', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 828, 227, NULL, NULL, NULL, NULL, NULL, NULL),
(568, '2021-08-09 14:10:50.744306', '2021-08-09 14:10:50.744306', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 834, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(569, '2021-08-09 14:10:50.962707', '2021-08-09 14:10:50.962707', NULL, 0, 0, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 837, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(570, '2021-08-09 14:10:51.040707', '2021-08-09 14:10:51.040707', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 838, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(571, '2021-08-09 14:10:51.071907', '2021-08-09 14:10:51.071907', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 840, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(572, '2021-08-09 14:10:51.103107', '2021-08-09 14:10:51.103107', NULL, 0, 0, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 839, 85, NULL, NULL, NULL, NULL, NULL, NULL),
(573, '2021-08-09 14:10:51.134307', '2021-08-09 14:10:51.134307', NULL, 0, 0, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 841, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(574, '2021-08-09 14:11:52.239615', '2021-08-09 14:11:52.239615', NULL, 1, 0, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, 1, 16, 5, NULL, 2, NULL, 227, NULL, 19, 5, NULL, NULL, NULL),
(575, '2021-08-09 14:12:04.906837', '2021-08-09 14:12:04.906837', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 842, 227, NULL, NULL, NULL, NULL, NULL, NULL),
(576, '2021-08-10 05:13:54.353341', '2021-08-10 05:13:54.353341', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 190, NULL, 19, 5, NULL, NULL, NULL),
(577, '2021-08-10 05:13:54.868142', '2021-08-10 05:13:54.868142', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 200, NULL, 19, 5, NULL, NULL, NULL),
(578, '2021-08-10 05:13:55.117742', '2021-08-10 05:13:55.117742', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 187, NULL, 19, 5, NULL, NULL, NULL),
(579, '2021-08-10 05:13:55.211343', '2021-08-10 05:13:55.211343', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 184, NULL, 19, 5, NULL, NULL, NULL),
(580, '2021-08-10 05:13:55.304943', '2021-08-10 05:13:55.304943', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 190, NULL, 19, 5, NULL, NULL, NULL),
(581, '2021-08-10 06:49:33.380978', '2021-08-10 06:49:33.380978', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 844, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(582, '2021-08-10 06:51:13.143153', '2021-08-10 06:51:13.143153', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 846, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(583, '2021-08-10 06:57:57.873264', '2021-08-10 06:57:57.873264', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 100, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 235, NULL, 19, 5, NULL, NULL, NULL),
(584, '2021-08-10 07:08:21.695363', '2021-08-10 07:08:21.695363', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 848, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(585, '2021-08-10 07:08:21.710963', '2021-08-10 07:08:21.710963', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 849, 236, NULL, NULL, NULL, NULL, NULL, NULL),
(586, '2021-08-10 07:39:29.743645', '2021-08-10 07:39:29.743645', NULL, 0, 0, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 856, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(587, '2021-08-10 07:39:29.821645', '2021-08-10 07:39:29.821645', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 858, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(588, '2021-08-10 07:43:48.376499', '2021-08-10 07:43:48.376499', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 864, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(589, '2021-08-10 07:53:22.645708', '2021-08-10 07:53:22.645708', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 865, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(590, '2021-08-10 07:57:10.702509', '2021-08-10 07:57:10.702509', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 875, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(591, '2021-08-10 08:37:24.982565', '2021-08-10 08:37:24.982565', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 878, 227, NULL, NULL, NULL, NULL, NULL, NULL),
(592, '2021-08-10 12:15:51.803791', '2021-08-10 12:15:51.803791', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 0, NULL, 4, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(593, '2021-08-10 12:16:05.765816', '2021-08-10 12:16:05.765816', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 1000, NULL, 4, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(594, '2021-08-10 13:50:48.443804', '2021-08-10 13:50:48.443804', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 250, NULL, 52, NULL, 2, 19, 5, NULL, 4, 881, NULL, NULL, NULL, NULL, 241, NULL, NULL),
(595, '2021-08-10 13:50:48.584204', '2021-08-10 13:50:48.584204', NULL, 0, 0, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 882, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(596, '2021-08-10 14:08:50.535568', '2021-08-10 14:08:50.536568', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 886, 87, NULL, NULL, NULL, NULL, NULL, NULL),
(597, '2021-08-10 14:08:50.893588', '2021-08-10 14:08:50.893588', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 889, 85, NULL, NULL, NULL, NULL, NULL, NULL),
(598, '2021-08-10 14:14:14.313087', '2021-08-10 14:14:14.313087', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 894, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(599, '2021-08-10 14:14:14.330088', '2021-08-10 14:14:14.330088', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 4, NULL, 2, 19, 5, NULL, 4, 891, NULL, NULL, NULL, NULL, 217, NULL, NULL),
(600, '2021-08-10 14:14:14.343089', '2021-08-10 14:14:14.343089', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 892, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(601, '2021-08-10 14:14:14.372090', '2021-08-10 14:14:14.372090', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 20, NULL, 2, 19, 5, NULL, 4, 895, NULL, NULL, NULL, NULL, 221, NULL, NULL),
(602, '2021-08-10 14:14:14.562101', '2021-08-10 14:14:14.563101', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 891, NULL, NULL, NULL, NULL, 217, NULL, NULL),
(603, '2021-08-10 14:14:14.591103', '2021-08-10 14:14:14.591103', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 895, NULL, NULL, NULL, NULL, 221, NULL, NULL),
(604, '2021-08-10 14:14:14.626105', '2021-08-10 14:14:14.626105', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 897, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(605, '2021-08-10 14:14:15.403149', '2021-08-10 14:14:15.403149', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 891, 86, NULL, NULL, NULL, 217, NULL, NULL),
(606, '2021-08-10 14:15:20.497872', '2021-08-10 14:15:20.497872', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 22, NULL, 2, 19, 5, NULL, 4, 899, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(607, '2021-08-10 14:15:20.573877', '2021-08-10 14:15:20.573877', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 899, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(608, '2021-08-10 14:15:20.673883', '2021-08-10 14:15:20.673883', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 38, NULL, 2, 19, 5, NULL, 4, 899, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(609, '2021-08-10 14:21:10.274879', '2021-08-10 14:21:10.274879', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 903, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(610, '2021-08-10 14:21:10.289879', '2021-08-10 14:21:10.289879', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 904, 108, NULL, NULL, NULL, NULL, NULL, NULL),
(611, '2021-08-10 14:21:32.689161', '2021-08-10 14:21:32.690161', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 906, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(612, '2021-08-10 14:22:26.995267', '2021-08-10 14:22:26.995267', NULL, 0, 0, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 907, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(613, '2021-08-10 14:23:38.858377', '2021-08-10 14:23:38.858377', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 908, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(614, '2021-08-10 14:36:08.450908', '2021-08-10 14:36:08.450908', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 911, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(615, '2021-08-10 14:36:08.453908', '2021-08-10 14:36:08.453908', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 912, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(616, '2021-08-10 14:36:43.533821', '2021-08-10 14:36:43.533821', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 914, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(617, '2021-08-10 14:36:43.535821', '2021-08-10 14:36:43.536821', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 915, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(618, '2021-08-10 14:37:59.456171', '2021-08-10 14:37:59.456171', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 22, NULL, 2, 19, 5, NULL, 4, 918, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(619, '2021-08-10 14:37:59.541176', '2021-08-10 14:37:59.541176', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 918, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(620, '2021-08-10 14:37:59.619180', '2021-08-10 14:37:59.619180', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 38, NULL, 2, 19, 5, NULL, 4, 918, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(621, '2021-08-10 14:40:24.300490', '2021-08-10 14:40:24.300490', NULL, 0, 0, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 923, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(622, '2021-08-10 14:40:24.331690', '2021-08-10 14:40:24.331690', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 925, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(623, '2021-08-10 14:41:46.878033', '2021-08-10 14:41:46.878033', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 19, NULL, 2, 19, 5, NULL, 4, 927, NULL, NULL, NULL, NULL, 205, NULL, NULL),
(624, '2021-08-10 14:41:46.936036', '2021-08-10 14:41:46.936036', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 22, NULL, 2, 19, 5, NULL, 4, 928, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(625, '2021-08-10 14:41:46.991039', '2021-08-10 14:41:46.991039', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 20, NULL, 2, 19, 5, NULL, 4, 930, NULL, NULL, NULL, NULL, 221, NULL, NULL),
(626, '2021-08-10 14:41:47.039042', '2021-08-10 14:41:47.039042', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 4, NULL, 2, 19, 5, NULL, 4, 932, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(627, '2021-08-10 14:41:47.042042', '2021-08-10 14:41:47.042042', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 4, NULL, 2, 19, 5, NULL, 4, 931, NULL, NULL, NULL, NULL, 217, NULL, NULL),
(628, '2021-08-10 14:41:47.050043', '2021-08-10 14:41:47.050043', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 927, NULL, NULL, NULL, NULL, 205, NULL, NULL),
(629, '2021-08-10 14:41:47.052043', '2021-08-10 14:41:47.052043', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 4, NULL, 2, 19, 5, NULL, 4, 929, NULL, NULL, NULL, NULL, 202, NULL, NULL),
(630, '2021-08-10 14:41:47.112046', '2021-08-10 14:41:47.113046', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 928, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(631, '2021-08-10 14:41:47.163049', '2021-08-10 14:41:47.164049', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 930, NULL, NULL, NULL, NULL, 221, NULL, NULL),
(632, '2021-08-10 14:41:47.258055', '2021-08-10 14:41:47.258055', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 19, NULL, 2, 19, 5, NULL, 4, 932, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(633, '2021-08-10 14:41:47.263055', '2021-08-10 14:41:47.263055', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 927, 87, NULL, NULL, NULL, 205, NULL, NULL),
(634, '2021-08-10 14:41:47.291056', '2021-08-10 14:41:47.291056', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 19, NULL, 2, 19, 5, NULL, 4, 929, NULL, NULL, NULL, NULL, 202, NULL, NULL),
(635, '2021-08-10 14:41:47.326058', '2021-08-10 14:41:47.326058', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 931, NULL, NULL, NULL, NULL, 217, NULL, NULL),
(636, '2021-08-10 14:41:47.376061', '2021-08-10 14:41:47.376061', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 38, NULL, 2, 19, 5, NULL, 4, 928, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(637, '2021-08-10 14:41:47.483067', '2021-08-10 14:41:47.483067', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 22, NULL, 2, 19, 5, NULL, 4, 929, NULL, NULL, NULL, NULL, 202, NULL, NULL),
(638, '2021-08-10 14:41:47.485068', '2021-08-10 14:41:47.485068', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 22, NULL, 2, 19, 5, NULL, 4, 932, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(639, '2021-08-10 14:41:47.545071', '2021-08-10 14:41:47.545071', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 931, 86, NULL, NULL, NULL, 217, NULL, NULL),
(640, '2021-08-10 14:41:48.577130', '2021-08-10 14:41:48.577130', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 29, NULL, 2, 19, 5, NULL, 4, 929, NULL, NULL, NULL, NULL, 202, NULL, NULL),
(641, '2021-08-10 14:41:48.618132', '2021-08-10 14:41:48.618132', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 29, NULL, 2, 19, 5, NULL, 4, 932, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(642, '2021-08-10 14:41:48.717138', '2021-08-10 14:41:48.717138', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 929, 86, NULL, NULL, NULL, 202, NULL, NULL),
(643, '2021-08-10 14:41:48.757140', '2021-08-10 14:41:48.757140', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 13, NULL, 2, 19, 5, NULL, 4, 932, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(644, '2021-08-10 14:41:48.916149', '2021-08-10 14:41:48.916149', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 929, 86, NULL, NULL, NULL, 202, NULL, NULL),
(645, '2021-08-10 14:41:49.300171', '2021-08-10 14:41:49.300171', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 932, NULL, NULL, NULL, NULL, 201, NULL, NULL),
(646, '2021-08-10 14:41:49.547186', '2021-08-10 14:41:49.547186', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 932, 84, NULL, NULL, NULL, 201, NULL, NULL),
(647, '2021-08-10 14:43:10.344620', '2021-08-10 14:43:10.344620', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 100, NULL, 18, NULL, 2, 19, 5, NULL, 4, 935, NULL, NULL, NULL, NULL, 150, NULL, NULL),
(648, '2021-08-10 14:43:10.361621', '2021-08-10 14:43:10.361621', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 936, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(649, '2021-08-10 14:46:04.896108', '2021-08-10 14:46:04.896108', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 3, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 82, NULL, 19, 5, NULL, NULL, NULL),
(650, '2021-08-10 14:46:30.531174', '2021-08-10 14:46:30.531174', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 20, NULL, 2, 19, 5, NULL, 4, 937, NULL, NULL, NULL, NULL, 221, NULL, NULL),
(651, '2021-08-10 14:46:30.593575', '2021-08-10 14:46:30.593575', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 938, 82, NULL, NULL, NULL, NULL, NULL, NULL),
(652, '2021-08-10 14:46:30.609175', '2021-08-10 14:46:30.609175', 3, 0, 0, NULL, NULL, NULL, NULL, NULL, 180, NULL, 22, NULL, 2, 19, 5, NULL, 4, 939, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(653, '2021-08-10 14:46:30.765175', '2021-08-10 14:46:30.765175', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 4, NULL, 2, 19, 5, NULL, 4, 941, NULL, NULL, NULL, NULL, 217, NULL, NULL),
(654, '2021-08-10 14:46:30.811975', '2021-08-10 14:46:30.811975', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 937, NULL, NULL, NULL, NULL, 221, NULL, NULL),
(655, '2021-08-10 14:46:31.014775', '2021-08-10 14:46:31.014775', 3, 0, 0, NULL, NULL, NULL, NULL, NULL, 45, NULL, 42, NULL, 2, 19, 5, NULL, 4, 939, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(656, '2021-08-10 14:46:31.061575', '2021-08-10 14:46:31.061575', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 941, NULL, NULL, NULL, NULL, 217, NULL, NULL),
(657, '2021-08-10 14:46:31.155176', '2021-08-10 14:46:31.155176', 3, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 38, NULL, 2, 19, 5, NULL, 4, 939, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(658, '2021-08-10 14:46:31.233176', '2021-08-10 14:46:31.233176', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 941, 86, NULL, NULL, NULL, 217, NULL, NULL),
(659, '2021-08-10 14:47:02.948031', '2021-08-10 14:47:02.948031', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 22, NULL, 2, 19, 5, NULL, 4, 942, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(660, '2021-08-10 14:47:03.057232', '2021-08-10 14:47:03.057232', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 942, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(661, '2021-08-10 14:47:03.150832', '2021-08-10 14:47:03.150832', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 20, NULL, 38, NULL, 2, 19, 5, NULL, 4, 942, NULL, NULL, NULL, NULL, 220, NULL, NULL),
(662, '2021-08-10 14:48:13.870066', '2021-08-10 14:48:13.870066', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 19, NULL, 2, 19, 5, NULL, 4, 943, NULL, NULL, NULL, NULL, 205, NULL, NULL),
(663, '2021-08-10 14:48:13.912068', '2021-08-10 14:48:13.912068', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 100, NULL, 4, NULL, 2, 19, 5, NULL, 4, 946, NULL, NULL, NULL, NULL, 218, NULL, NULL),
(664, '2021-08-10 14:48:13.919069', '2021-08-10 14:48:13.919069', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 4, NULL, 2, 19, 5, NULL, 4, 947, NULL, NULL, NULL, NULL, 204, NULL, NULL),
(665, '2021-08-10 14:48:14.229087', '2021-08-10 14:48:14.229087', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 943, NULL, NULL, NULL, NULL, 205, NULL, NULL),
(666, '2021-08-10 14:48:14.280090', '2021-08-10 14:48:14.280090', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 947, 86, NULL, NULL, NULL, 204, NULL, NULL),
(667, '2021-08-10 14:48:14.311091', '2021-08-10 14:48:14.311091', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 943, 87, NULL, NULL, NULL, 205, NULL, NULL),
(668, '2021-08-10 14:48:45.955318', '2021-08-10 14:48:45.955318', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 4, NULL, 2, 19, 5, NULL, 4, 948, NULL, NULL, NULL, NULL, 204, NULL, NULL),
(669, '2021-08-10 14:48:46.324339', '2021-08-10 14:48:46.324339', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 948, 86, NULL, NULL, NULL, 204, NULL, NULL),
(670, '2021-08-10 14:50:46.476636', '2021-08-10 14:50:46.476636', NULL, 0, 0, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 954, 87, NULL, NULL, NULL, NULL, NULL, NULL),
(671, '2021-08-10 14:50:46.492236', '2021-08-10 14:50:46.492236', NULL, 0, 0, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 953, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(672, '2021-08-10 14:50:46.492236', '2021-08-10 14:50:46.492236', NULL, 0, 0, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 950, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(673, '2021-08-10 14:50:46.507836', '2021-08-10 14:50:46.507836', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 949, 133, NULL, NULL, NULL, NULL, NULL, NULL),
(674, '2021-08-10 14:57:28.494208', '2021-08-10 14:57:28.494208', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 957, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(675, '2021-08-10 14:57:28.509808', '2021-08-10 14:57:28.509808', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 959, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(676, '2021-08-10 14:58:16.222334', '2021-08-10 14:58:16.222334', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 960, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(677, '2021-08-11 01:53:11.446503', '2021-08-11 01:53:11.446503', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 48, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 257, NULL, 19, 5, NULL, NULL, NULL),
(678, '2021-08-11 01:53:51.674266', '2021-08-11 01:53:51.674266', NULL, 1, 0, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 84, NULL, 19, 5, NULL, NULL, NULL),
(679, '2021-08-11 01:53:51.841276', '2021-08-11 01:53:51.841276', NULL, 1, 0, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 86, NULL, 19, 5, NULL, NULL, NULL),
(680, '2021-08-11 04:42:07.204548', '2021-08-11 04:42:07.204548', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 1, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 87, NULL, 19, 5, NULL, NULL, NULL),
(681, '2021-08-11 04:42:07.298149', '2021-08-11 04:42:07.298149', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 2, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 81, NULL, 19, 5, NULL, NULL, NULL),
(682, '2021-08-11 04:42:07.407349', '2021-08-11 04:42:07.407349', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 4, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 86, NULL, 19, 5, NULL, NULL, NULL),
(683, '2021-08-11 04:44:59.038850', '2021-08-11 04:44:59.038850', NULL, 1, 0, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 101, NULL, 19, 5, NULL, NULL, NULL),
(684, '2021-08-11 04:44:59.584851', '2021-08-11 04:44:59.584851', NULL, 1, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 133, NULL, 19, 5, NULL, NULL, NULL),
(685, '2021-08-11 04:44:59.756452', '2021-08-11 04:44:59.756452', NULL, 1, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 227, NULL, 19, 5, NULL, NULL, NULL),
(686, '2021-08-11 04:44:59.896852', '2021-08-11 04:44:59.896852', NULL, 1, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 124, NULL, 19, 5, NULL, NULL, NULL),
(687, '2021-08-11 04:45:00.037252', '2021-08-11 04:45:00.037252', NULL, 1, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 108, NULL, 19, 5, NULL, NULL, NULL),
(688, '2021-08-11 04:46:41.827431', '2021-08-11 04:46:41.827431', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 1000, NULL, 18, 2, 2, 16, 5, NULL, 2, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(689, '2021-08-11 04:49:01.728477', '2021-08-11 04:49:01.728477', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 750, NULL, 42, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(690, '2021-08-11 04:49:01.868877', '2021-08-11 04:49:01.868877', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 1000, NULL, 52, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(691, '2021-08-11 04:49:01.978077', '2021-08-11 04:49:01.978077', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 1000, NULL, 55, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(692, '2021-08-11 04:50:38.261446', '2021-08-11 04:50:38.261446', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 0, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 160, NULL, 16, 5, NULL, NULL, NULL),
(693, '2021-08-11 04:51:51.565975', '2021-08-11 04:51:51.565975', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 700, NULL, 37, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(694, '2021-08-11 04:52:54.215685', '2021-08-11 04:52:54.215685', NULL, 1, 0, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 84, NULL, 17, 3, NULL, NULL, NULL),
(695, '2021-08-11 04:52:54.387285', '2021-08-11 04:52:54.387285', NULL, 1, 0, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 81, NULL, 17, 3, NULL, NULL, NULL),
(696, '2021-08-11 11:39:43.790874', '2021-08-11 11:39:43.790874', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 2000, NULL, 26, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 16, 5, NULL, NULL, NULL),
(697, '2021-08-11 11:41:22.300378', '2021-08-11 11:41:22.300378', NULL, 1, 0, NULL, NULL, '3170.00', '190200.00', 60, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 102, NULL, 16, 5, NULL, NULL, NULL),
(698, '2021-08-11 11:41:22.491389', '2021-08-11 11:41:22.491389', NULL, 1, 0, NULL, NULL, '3000.00', '360000.00', 120, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 104, NULL, 16, 5, NULL, NULL, NULL),
(699, '2021-08-11 11:41:22.584394', '2021-08-11 11:41:22.584394', NULL, 1, 0, NULL, NULL, '3500.00', '210000.00', 60, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 105, NULL, 16, 5, NULL, NULL, NULL),
(700, '2021-08-11 11:41:22.719402', '2021-08-11 11:41:22.719402', NULL, 1, 0, NULL, NULL, '5400.00', '324000.00', 60, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 107, NULL, 16, 5, NULL, NULL, NULL),
(701, '2021-08-11 11:43:56.454895', '2021-08-11 11:43:56.454895', NULL, 1, 0, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 101, NULL, 19, 5, NULL, NULL, NULL),
(702, '2021-08-11 11:43:56.903920', '2021-08-11 11:43:56.903920', NULL, 1, 0, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 104, NULL, 19, 5, NULL, NULL, NULL),
(703, '2021-08-11 11:43:57.155935', '2021-08-11 11:43:57.155935', NULL, 1, 0, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 102, NULL, 19, 5, NULL, NULL, NULL),
(704, '2021-08-11 11:43:57.300943', '2021-08-11 11:43:57.300943', NULL, 1, 0, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 107, NULL, 19, 5, NULL, NULL, NULL),
(705, '2021-08-11 11:43:57.465953', '2021-08-11 11:43:57.465953', NULL, 1, 0, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 105, NULL, 19, 5, NULL, NULL, NULL),
(706, '2021-08-11 11:48:10.529950', '2021-08-11 11:48:10.529950', NULL, 1, 0, NULL, NULL, '0.00', '0.00', 72, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, 1, NULL, 85, NULL, 16, 5, NULL, NULL, NULL),
(707, '2021-08-11 11:49:01.168708', '2021-08-11 11:49:01.169708', NULL, 1, 0, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 85, NULL, 19, 5, NULL, NULL, NULL),
(708, '2021-08-11 11:49:01.646736', '2021-08-11 11:49:01.646736', NULL, 1, 0, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 85, NULL, 19, 5, NULL, NULL, NULL),
(709, '2021-08-11 11:49:36.701957', '2021-08-11 11:49:36.702957', NULL, 1, 0, NULL, NULL, '0.00', '0.00', NULL, 750, NULL, 50, 2, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(710, '2021-08-11 14:30:46.279336', '2021-08-11 14:30:46.279336', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 100, NULL, 1, NULL, 8, 19, 5, NULL, 4, 966, NULL, NULL, NULL, NULL, 109, NULL, NULL),
(711, '2021-08-11 14:30:46.310536', '2021-08-11 14:30:46.310536', NULL, 0, 0, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 967, 87, NULL, NULL, NULL, NULL, NULL, NULL),
(712, '2021-08-11 14:30:46.310536', '2021-08-11 14:30:46.310536', NULL, 0, 0, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 969, 104, NULL, NULL, NULL, NULL, NULL, NULL),
(713, '2021-08-11 14:30:46.388537', '2021-08-11 14:30:46.388537', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 8, 19, 5, NULL, 3, 970, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(714, '2021-08-12 04:14:34.883959', '2021-08-12 04:14:34.883959', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 971, 104, NULL, NULL, NULL, NULL, NULL, NULL),
(715, '2021-08-12 04:27:17.946529', '2021-08-12 04:27:17.946529', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 975, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(716, '2021-08-12 04:57:01.360662', '2021-08-12 04:57:01.360662', 8, 0, 0, NULL, NULL, NULL, NULL, NULL, 400, NULL, 26, NULL, 2, 19, 5, NULL, 4, 977, NULL, NULL, NULL, NULL, 169, NULL, NULL),
(717, '2021-08-12 04:57:39.221929', '2021-08-12 04:57:39.221929', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 1000, NULL, 26, 2, 2, 16, 5, NULL, 2, NULL, NULL, NULL, 19, 5, NULL, NULL, NULL),
(718, '2021-08-12 04:57:59.033963', '2021-08-12 04:57:59.033963', 7, 0, 0, NULL, NULL, NULL, NULL, NULL, 350, NULL, 26, NULL, 2, 19, 5, NULL, 4, 978, NULL, NULL, NULL, NULL, 169, NULL, NULL),
(719, '2021-08-12 05:03:59.718310', '2021-08-12 05:03:59.718310', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 980, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(720, '2021-08-12 07:30:45.715377', '2021-08-12 07:30:45.715377', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 981, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(721, '2021-08-12 07:30:45.777777', '2021-08-12 07:30:45.777777', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 985, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(722, '2021-08-12 07:30:45.777777', '2021-08-12 07:30:45.777777', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 984, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(723, '2021-08-12 07:30:45.840177', '2021-08-12 07:30:45.840177', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 982, 85, NULL, NULL, NULL, NULL, NULL, NULL),
(724, '2021-08-12 08:04:04.098855', '2021-08-12 08:04:04.098855', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 992, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(725, '2021-08-12 08:04:04.114455', '2021-08-12 08:04:04.114455', NULL, 0, 0, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 987, 104, NULL, NULL, NULL, NULL, NULL, NULL),
(726, '2021-08-12 08:04:04.130055', '2021-08-12 08:04:04.130055', 2, 0, 0, NULL, NULL, NULL, NULL, NULL, 100, NULL, 1, NULL, 2, 19, 5, NULL, 4, 988, NULL, NULL, NULL, NULL, 109, NULL, NULL),
(727, '2021-08-12 08:04:04.145655', '2021-08-12 08:04:04.145655', NULL, 0, 0, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 990, 87, NULL, NULL, NULL, NULL, NULL, NULL),
(728, '2021-08-12 08:05:00.745293', '2021-08-12 08:05:00.746293', NULL, 0, 0, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 993, 102, NULL, NULL, NULL, NULL, NULL, NULL),
(729, '2021-08-12 08:08:52.620555', '2021-08-12 08:08:52.620555', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 998, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(730, '2021-08-12 08:08:52.650557', '2021-08-12 08:08:52.650557', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 994, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(731, '2021-08-12 08:08:52.658557', '2021-08-12 08:08:52.658557', NULL, 0, 0, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 999, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(732, '2021-08-12 08:08:52.677558', '2021-08-12 08:08:52.677558', 4, 0, 0, NULL, NULL, NULL, NULL, NULL, 500, NULL, 50, NULL, 2, 19, 5, NULL, 4, 996, NULL, NULL, NULL, NULL, 229, NULL, NULL),
(733, '2021-08-12 08:08:52.970575', '2021-08-12 08:08:52.970575', 16, 0, 0, NULL, NULL, NULL, NULL, NULL, 800, NULL, 25, NULL, 2, 19, 5, NULL, 4, 1000, NULL, NULL, NULL, NULL, 167, NULL, NULL),
(734, '2021-08-12 08:08:53.174587', '2021-08-12 08:08:53.175587', 4, 0, 0, NULL, NULL, NULL, NULL, NULL, 200, NULL, 1, NULL, 2, 19, 5, NULL, 4, 1001, NULL, NULL, NULL, NULL, 109, NULL, NULL),
(735, '2021-08-12 08:08:53.447602', '2021-08-12 08:08:53.447602', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1002, 236, NULL, NULL, NULL, NULL, NULL, NULL),
(736, '2021-08-12 08:17:59.305824', '2021-08-12 08:17:59.305824', NULL, 0, 0, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1003, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(737, '2021-08-12 08:20:10.352319', '2021-08-12 08:20:10.352319', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1005, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(738, '2021-08-12 08:20:10.365320', '2021-08-12 08:20:10.365320', NULL, 0, 0, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1006, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(739, '2021-08-12 08:22:16.475533', '2021-08-12 08:22:16.475533', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1008, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(740, '2021-08-12 08:22:16.491534', '2021-08-12 08:22:16.491534', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1010, 126, NULL, NULL, NULL, NULL, NULL, NULL),
(741, '2021-08-12 08:22:16.502535', '2021-08-12 08:22:16.502535', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1009, 257, NULL, NULL, NULL, NULL, NULL, NULL),
(742, '2021-08-12 08:22:16.533536', '2021-08-12 08:22:16.533536', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1011, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(743, '2021-08-12 08:23:19.751152', '2021-08-12 08:23:19.751152', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1012, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(744, '2021-08-12 08:23:19.924162', '2021-08-12 08:23:19.924162', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 125, NULL, 50, NULL, 2, 19, 5, NULL, 4, 1014, NULL, NULL, NULL, NULL, 229, NULL, NULL),
(745, '2021-08-12 08:24:10.270042', '2021-08-12 08:24:10.270042', NULL, 0, 0, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1015, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(746, '2021-08-12 08:25:01.193954', '2021-08-12 08:25:01.193954', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 19, NULL, 2, 19, 5, NULL, 4, 1017, NULL, NULL, NULL, NULL, 206, NULL, NULL),
(747, '2021-08-12 08:25:01.202955', '2021-08-12 08:25:01.202955', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 4, NULL, 2, 19, 5, NULL, 4, 1018, NULL, NULL, NULL, NULL, 218, NULL, NULL),
(748, '2021-08-12 08:25:01.338963', '2021-08-12 08:25:01.338963', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 1017, NULL, NULL, NULL, NULL, 206, NULL, NULL),
(749, '2021-08-12 08:25:01.448969', '2021-08-12 08:25:01.448969', 1, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 4, 1017, 87, NULL, NULL, NULL, 206, NULL, NULL),
(750, '2021-08-12 08:25:55.334051', '2021-08-12 08:25:55.334051', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1021, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(751, '2021-08-12 08:27:12.342456', '2021-08-12 08:27:12.342456', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1026, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(752, '2021-08-12 08:27:12.349456', '2021-08-12 08:27:12.350456', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1027, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(753, '2021-08-12 08:27:12.354456', '2021-08-12 08:27:12.354456', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1024, 85, NULL, NULL, NULL, NULL, NULL, NULL),
(754, '2021-08-12 08:27:12.366457', '2021-08-12 08:27:12.366457', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1028, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(755, '2021-08-12 08:27:12.677475', '2021-08-12 08:27:12.677475', NULL, 0, 0, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1030, 236, NULL, NULL, NULL, NULL, NULL, NULL),
(756, '2021-08-12 08:28:19.559300', '2021-08-12 08:28:19.559300', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 60, NULL, 20, NULL, 2, 19, 5, NULL, 4, 1031, NULL, NULL, NULL, NULL, 221, NULL, NULL),
(757, '2021-08-12 08:28:19.574301', '2021-08-12 08:28:19.574301', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 4, NULL, 2, 19, 5, NULL, 4, 1032, NULL, NULL, NULL, NULL, 218, NULL, NULL),
(758, '2021-08-12 08:28:19.712309', '2021-08-12 08:28:19.712309', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 15, NULL, 42, NULL, 2, 19, 5, NULL, 4, 1031, NULL, NULL, NULL, NULL, 221, NULL, NULL),
(759, '2021-08-12 08:29:14.193425', '2021-08-12 08:29:14.193425', NULL, 0, 0, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1035, 102, NULL, NULL, NULL, NULL, NULL, NULL),
(760, '2021-08-12 08:30:20.229202', '2021-08-12 08:30:20.229202', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1041, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(761, '2021-08-12 08:30:20.248203', '2021-08-12 08:30:20.248203', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 250, NULL, 52, NULL, 2, 19, 5, NULL, 4, 1038, NULL, NULL, NULL, NULL, 241, NULL, NULL),
(762, '2021-08-12 08:31:23.652830', '2021-08-12 08:31:23.652830', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1043, 236, NULL, NULL, NULL, NULL, NULL, NULL),
(763, '2021-08-12 08:31:23.820839', '2021-08-12 08:31:23.820839', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1044, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(764, '2021-08-12 08:33:14.791186', '2021-08-12 08:33:14.791186', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1049, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(765, '2021-08-12 08:34:11.705442', '2021-08-12 08:34:11.705442', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1052, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(766, '2021-08-12 08:34:11.902453', '2021-08-12 08:34:11.902453', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 250, NULL, 55, NULL, 2, 19, 5, NULL, 4, 1054, NULL, NULL, NULL, NULL, 242, NULL, NULL),
(767, '2021-08-12 08:34:58.727131', '2021-08-12 08:34:58.727131', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1057, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(768, '2021-08-12 08:35:50.553096', '2021-08-12 08:35:50.553096', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1060, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(769, '2021-08-12 08:35:50.561096', '2021-08-12 08:35:50.561096', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1058, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(770, '2021-08-12 08:39:21.401155', '2021-08-12 08:39:21.402155', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1070, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(771, '2021-08-12 08:40:29.304039', '2021-08-12 08:40:29.304039', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1071, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(772, '2021-08-12 08:40:29.405045', '2021-08-12 08:40:29.405045', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1072, 85, NULL, NULL, NULL, NULL, NULL, NULL),
(773, '2021-08-12 08:40:29.454048', '2021-08-12 08:40:29.454048', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1075, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(774, '2021-08-12 08:41:21.361017', '2021-08-12 08:41:21.361017', 3, 0, 0, NULL, NULL, NULL, NULL, NULL, 150, NULL, 13, NULL, 2, 19, 5, NULL, 4, 1078, NULL, NULL, NULL, NULL, 134, NULL, NULL),
(775, '2021-08-12 08:42:42.206641', '2021-08-12 08:42:42.206641', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1084, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(776, '2021-08-12 08:42:42.236642', '2021-08-12 08:42:42.236642', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1086, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(777, '2021-08-12 12:00:15.686224', '2021-08-12 12:00:15.687224', NULL, 1, 0, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, 2, 2, 16, 5, NULL, 2, NULL, 102, NULL, 19, 5, NULL, NULL, NULL),
(778, '2021-08-13 02:20:54.887108', '2021-08-13 02:20:54.887108', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1087, 236, NULL, NULL, NULL, NULL, NULL, NULL),
(779, '2021-08-13 02:20:54.918308', '2021-08-13 02:20:54.918308', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1089, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(780, '2021-08-13 02:23:19.842563', '2021-08-13 02:23:19.842563', NULL, 0, 0, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1090, 102, NULL, NULL, NULL, NULL, NULL, NULL),
(781, '2021-08-13 02:27:21.315387', '2021-08-13 02:27:21.315387', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1094, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(782, '2021-08-13 02:27:21.689787', '2021-08-13 02:27:21.689787', NULL, 0, 0, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1098, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(783, '2021-08-13 02:27:21.798988', '2021-08-13 02:27:21.798988', NULL, 0, 0, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1101, 84, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_app_item_transfer` (`id`, `created_at`, `updated_at`, `product_quantity`, `is_confirmed`, `recieved_ebarimt`, `comment`, `unit_size`, `unit_price`, `total_amount`, `quantity`, `size`, `budget_id`, `commodity_id`, `confirmed_by_id`, `created_by_id`, `fr_client_id`, `fr_division_id`, `fr_user_id`, `item_transfer_type_id`, `order_detial_id`, `product_id`, `store_id`, `to_client_id`, `to_division_id`, `to_product_id`, `to_user_id`, `updated_by_id`) VALUES
(784, '2021-08-13 02:27:21.814588', '2021-08-13 02:27:21.814588', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1099, 108, NULL, NULL, NULL, NULL, NULL, NULL),
(785, '2021-08-13 02:29:19.298394', '2021-08-13 02:29:19.298394', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1107, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(786, '2021-08-13 02:29:19.298394', '2021-08-13 02:29:19.298394', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1104, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(787, '2021-08-13 02:29:19.329594', '2021-08-13 02:29:19.329594', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1103, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(788, '2021-08-13 02:29:19.329594', '2021-08-13 02:29:19.329594', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1106, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(789, '2021-08-13 02:29:19.563594', '2021-08-13 02:29:19.563594', 5, 0, 0, NULL, NULL, NULL, NULL, NULL, 250, NULL, 18, NULL, 2, 19, 5, NULL, 4, 1108, NULL, NULL, NULL, NULL, 150, NULL, NULL),
(790, '2021-08-13 02:32:33.175535', '2021-08-13 02:32:33.175535', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 18, NULL, 2, 19, 5, NULL, 4, 1109, NULL, NULL, NULL, NULL, 150, NULL, NULL),
(791, '2021-08-13 02:33:54.872878', '2021-08-13 02:33:54.872878', NULL, 0, 0, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1110, 102, NULL, NULL, NULL, NULL, NULL, NULL),
(792, '2021-08-13 02:35:49.689080', '2021-08-13 02:35:49.689080', NULL, 0, 0, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1113, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(793, '2021-08-13 02:35:49.689080', '2021-08-13 02:35:49.689080', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 50, NULL, 4, NULL, 2, 19, 5, NULL, 4, 1114, NULL, NULL, NULL, NULL, 218, NULL, NULL),
(794, '2021-08-13 03:48:51.658776', '2021-08-13 03:48:51.658776', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1118, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(795, '2021-08-13 04:31:01.281219', '2021-08-13 04:31:01.281219', NULL, 0, 0, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1123, 102, NULL, NULL, NULL, NULL, NULL, NULL),
(796, '2021-08-13 04:33:12.305849', '2021-08-13 04:33:12.305849', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1132, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(797, '2021-08-13 04:34:17.233163', '2021-08-13 04:34:17.233163', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1136, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(798, '2021-08-13 04:35:02.473243', '2021-08-13 04:35:02.473243', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1139, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(799, '2021-08-13 04:35:02.535643', '2021-08-13 04:35:02.535643', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1142, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(800, '2021-08-13 04:40:10.261783', '2021-08-13 04:40:10.261783', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1146, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(801, '2021-08-13 04:40:56.827865', '2021-08-13 04:40:56.827865', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1152, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(802, '2021-08-13 04:44:40.111057', '2021-08-13 04:44:40.111057', NULL, 0, 0, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 2, 19, 5, NULL, 3, 1160, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(803, '2022-11-07 05:35:54.461971', '2022-11-07 05:35:54.461971', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 1498, 88, NULL, NULL, NULL, NULL, NULL, NULL),
(804, '2022-11-07 05:43:07.074379', '2022-11-07 05:43:07.074379', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 1516, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(805, '2022-11-07 05:43:41.668417', '2022-11-07 05:43:41.668417', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 1519, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(806, '2023-02-08 08:41:36.207163', '2023-02-08 08:41:36.207163', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 1, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(807, '2023-02-08 08:50:48.066465', '2023-02-08 08:50:48.066465', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 2, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(808, '2023-02-08 09:02:17.462148', '2023-02-08 09:02:17.462148', NULL, 1, 0, NULL, NULL, '1500.00', '150000.00', 100, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, 81, NULL, 19, 5, NULL, NULL, NULL),
(809, '2023-02-08 09:02:42.163367', '2023-02-08 09:02:42.163367', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 3, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(810, '2023-02-08 09:10:49.826705', '2023-02-08 09:10:49.827201', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 4, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(811, '2023-02-09 04:49:06.980853', '2023-02-09 04:49:06.980853', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 5, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(812, '2023-02-09 05:03:14.174658', '2023-02-09 05:03:14.174658', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 6, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(813, '2023-02-09 05:04:48.632125', '2023-02-09 05:04:48.632125', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 7, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(814, '2023-02-09 05:22:53.120321', '2023-02-09 05:22:53.120321', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 8, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(815, '2023-02-09 05:27:56.914118', '2023-02-09 05:27:56.914118', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 9, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(816, '2023-02-09 05:36:52.302656', '2023-02-09 05:36:52.302656', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 10, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(817, '2023-02-09 05:43:35.692046', '2023-02-09 05:43:35.692046', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 11, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(818, '2023-02-09 05:52:03.498009', '2023-02-09 05:52:03.498009', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 12, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(819, '2023-02-09 06:39:42.938560', '2023-02-09 06:39:42.938786', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 13, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(820, '2023-02-09 06:41:52.031046', '2023-02-09 06:41:52.031046', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 14, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(821, '2023-02-09 10:27:27.325338', '2023-02-09 10:27:27.325338', NULL, 0, 0, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 18, 104, NULL, NULL, NULL, NULL, NULL, NULL),
(822, '2023-02-09 10:27:27.443557', '2023-02-09 10:27:27.443557', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 20, 102, NULL, NULL, NULL, NULL, NULL, NULL),
(823, '2023-02-09 10:27:27.494055', '2023-02-09 10:27:27.494552', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 21, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(824, '2023-02-09 12:34:13.301309', '2023-02-09 12:34:13.301309', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 22, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(825, '2023-02-09 13:06:48.899457', '2023-02-09 13:06:48.899457', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 23, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(826, '2023-02-09 13:06:48.907265', '2023-02-09 13:06:48.907265', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 24, 85, NULL, NULL, NULL, NULL, NULL, NULL),
(827, '2023-02-09 13:06:48.916428', '2023-02-09 13:06:48.916428', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 25, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(828, '2023-02-09 13:07:56.970780', '2023-02-09 13:07:56.970780', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 27, 235, NULL, NULL, NULL, NULL, NULL, NULL),
(829, '2023-02-09 13:07:56.971818', '2023-02-09 13:07:56.971818', NULL, 0, 0, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 26, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(830, '2023-02-09 13:07:56.974813', '2023-02-09 13:07:56.974813', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 29, 236, NULL, NULL, NULL, NULL, NULL, NULL),
(831, '2023-02-09 13:07:56.975440', '2023-02-09 13:07:56.975440', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 28, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(832, '2023-02-09 13:10:57.948228', '2023-02-09 13:10:57.948228', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 30, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(833, '2023-02-09 13:22:48.982338', '2023-02-09 13:22:48.982338', NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 19, 5, NULL, 3, 31, 81, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_app_item_transfer_type`
--

CREATE TABLE `product_app_item_transfer_type` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_app_item_transfer_type`
--

INSERT INTO `product_app_item_transfer_type` (`id`, `created_at`, `name`, `description`, `created_by_id`) VALUES
(1, '2020-06-20 07:47:55.228236', 'Худалдан авалт', 'Дэлгүүрээс шинээр худалдан авсан түүхий эд.', 1),
(2, '2020-06-20 07:47:55.233243', 'Шилжүүлэх', 'Түүхий эд газар хооронд шилжүүлэх, хувиарлаж олгосон.', 1),
(3, '2020-06-20 07:47:55.240250', 'Борлуулалт', 'Үйлчлүүлэгчдэд зарж борлуулсан', 1),
(4, '2020-06-20 07:47:55.262339', 'Бүтээгдэхүүнд зарцуулсан', 'Үйлчлүүлэгчдэд зарж борлуулсан', 1),
(5, '2020-06-20 07:47:55.270214', 'Хэрэгцээнд', 'Үйлчлэгчдийн хэрэгцээнд гэх мэт ажилчдын хэрэгцээнд олгосон', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_app_product`
--

CREATE TABLE `product_app_product` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `cost` decimal(14,2) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `gramm` int(10) UNSIGNED DEFAULT NULL CHECK (`gramm` >= 0),
  `is_ingrediented` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_app_product`
--

INSERT INTO `product_app_product` (`id`, `created_at`, `name`, `description`, `cost`, `client_id`, `created_by_id`, `division_id`, `image`, `gramm`, `is_ingrediented`) VALUES
(1, '2020-06-20 07:47:53.226641', '201 өрөө ХОНОГ', 'Зочид буудлын 201 тоот өрөөг хоногоор түрээслэх', '85000.00', 1, 1, 3, '', NULL, 1),
(2, '2020-06-20 07:47:53.244531', '202 өрөө ХОНОГ', 'Зочид буудлын 202 тоот өрөөг хоногоор түрээслэх', '130000.00', 2, 1, 3, NULL, NULL, 1),
(3, '2020-06-20 07:47:53.259160', '203 өрөө ХОНОГ', 'Зочид буудлын 203 тоот өрөөг хоногоор түрээслэх', '89000.00', 3, 1, 3, NULL, NULL, 1),
(4, '2020-06-20 07:47:53.274761', '204 өрөө ХОНОГ', 'Зочид буудлын 204 тоот өрөөг хоногоор түрээслэх', '150000.00', 4, 1, 3, NULL, NULL, 1),
(5, '2020-06-20 07:47:53.289381', '205 өрөө ХОНОГ', 'Зочид буудлын 205 тоот өрөөг хоногоор түрээслэх', '105000.00', 5, 1, 3, NULL, NULL, 1),
(6, '2020-06-20 07:47:53.305398', '207 өрөө ХОНОГ', 'Зочид буудлын 207 тоот өрөөг хоногоор түрээслэх', '120000.00', 6, 1, 3, NULL, NULL, 1),
(7, '2020-06-20 07:47:53.320411', '301 өрөө ХОНОГ', 'Зочид буудлын 301 тоот өрөөг хоногоор түрээслэх', '105000.00', 7, 1, 3, NULL, NULL, 1),
(8, '2020-06-20 07:47:53.335429', '302 өрөө ХОНОГ', 'Зочид буудлын 302 тоот өрөөг хоногоор түрээслэх', '130000.00', 8, 1, 3, NULL, NULL, 1),
(9, '2020-06-20 07:47:53.350685', '303 өрөө ХОНОГ', 'Зочид буудлын 303 тоот өрөөг хоногоор түрээслэх', '89000.00', 9, 1, 3, NULL, NULL, 1),
(10, '2020-06-20 07:47:53.364699', '304 өрөө ХОНОГ', 'Зочид буудлын 304 тоот өрөөг хоногоор түрээслэх', '150000.00', 10, 1, 3, NULL, NULL, 1),
(11, '2020-06-20 07:47:53.379518', '305 өрөө ХОНОГ', 'Зочид буудлын 305 тоот өрөөг хоногоор түрээслэх', '105000.00', 11, 1, 3, NULL, NULL, 1),
(12, '2020-06-20 07:47:53.393541', '306 өрөө ХОНОГ', 'Зочид буудлын 306 тоот өрөөг хоногоор түрээслэх', '105000.00', 12, 1, 3, NULL, NULL, 1),
(13, '2020-06-20 07:47:53.407560', '307 өрөө ХОНОГ', 'Зочид буудлын 307 тоот өрөөг хоногоор түрээслэх', '250000.00', 13, 1, 3, NULL, NULL, 1),
(15, '2020-06-20 07:47:53.434997', '201 өрөө ЦАГ', 'Зочид буудлын 201 тоот өрөөг цагаар түрээслэх', '30000.00', 1, 1, 3, NULL, NULL, 1),
(16, '2020-06-20 07:47:53.448266', '202 өрөө ЦАГ', 'Зочид буудлын 202 тоот өрөөг цагаар түрээслэх', '30000.00', 2, 1, 3, NULL, NULL, 1),
(17, '2020-06-20 07:47:53.462285', '203 өрөө ЦАГ', 'Зочид буудлын 203 тоот өрөөг цагаар түрээслэх', '30000.00', 3, 1, 3, NULL, NULL, 1),
(18, '2020-06-20 07:47:53.475237', '204 өрөө ЦАГ', 'Зочид буудлын 204 тоот өрөөг цагаар түрээслэх', '30000.00', 4, 1, 3, NULL, NULL, 1),
(19, '2020-06-20 07:47:53.490253', '205 өрөө ЦАГ', 'Зочид буудлын 205 тоот өрөөг цагаар түрээслэх', '30000.00', 5, 1, 3, NULL, NULL, 1),
(20, '2020-06-20 07:47:53.505266', '207 өрөө ЦАГ', 'Зочид буудлын 207 тоот өрөөг цагаар түрээслэх', '30000.00', 6, 1, 3, NULL, NULL, 1),
(21, '2020-06-20 07:47:53.519176', '301 өрөө ЦАГ', 'Зочид буудлын 301 тоот өрөөг цагаар түрээслэх', '30000.00', 7, 1, 3, NULL, NULL, 1),
(22, '2020-06-20 07:47:53.533262', '302 өрөө ЦАГ', 'Зочид буудлын 302 тоот өрөөг цагаар түрээслэх', '30000.00', 8, 1, 3, NULL, NULL, 1),
(23, '2020-06-20 07:47:53.548189', '303 өрөө ЦАГ', 'Зочид буудлын 303 тоот өрөөг цагаар түрээслэх', '30000.00', 9, 1, 3, NULL, NULL, 1),
(24, '2020-06-20 07:47:53.562975', '304 өрөө ЦАГ', 'Зочид буудлын 304 тоот өрөөг цагаар түрээслэх', '30000.00', 10, 1, 3, NULL, NULL, 1),
(25, '2020-06-20 07:47:53.576389', '305 өрөө ЦАГ', 'Зочид буудлын 305 тоот өрөөг цагаар түрээслэх', '30000.00', 11, 1, 3, NULL, NULL, 1),
(26, '2020-06-20 07:47:53.590402', '306 өрөө ЦАГ', 'Зочид буудлын 306 тоот өрөөг цагаар түрээслэх', '30000.00', 12, 1, 3, NULL, NULL, 1),
(27, '2020-06-20 07:47:53.605417', '307 өрөө ЦАГ', 'Зочид буудлын 307 тоот өрөөг цагаар түрээслэх', '100000.00', 13, 1, 3, NULL, NULL, 1),
(30, '2020-06-20 07:47:53.639719', 'Хавирганы махан цуглуулга (2-3)', '', '49000.00', NULL, 1, 2, '', NULL, 1),
(31, '2021-05-29 08:27:01.681616', 'Хавирганы махан цуглуулга (4-5)', '', '59000.00', NULL, NULL, 2, '', NULL, 1),
(32, '2021-05-29 08:27:57.145788', 'Монгол махан цуглуулга (2-3)', '', '49000.00', NULL, NULL, 2, '', NULL, 1),
(33, '2021-05-29 08:28:22.050213', 'Монгол махан цуглуулга (4-5)', '', '59000.00', NULL, NULL, 2, '', NULL, 1),
(34, '2021-05-29 08:29:55.960584', 'Маханд дурлагсад цуглуулга 4-5', '', '59000.00', NULL, NULL, 2, 'product-images/4A5E815A-6E3A-4D58-9F98-47F221169A71.jpeg', NULL, 1),
(35, '2021-05-29 08:32:54.300785', 'Шорлогны цуглуулга 2-3', '', '39000.00', NULL, NULL, 2, '', NULL, 1),
(36, '2021-05-29 08:33:07.252525', 'Шорлогны цуглуулга 4-5', '', '49000.00', NULL, NULL, 2, '', NULL, 1),
(37, '2021-05-29 08:33:48.626892', 'Тахианы махан цуглуулга 2-3', '', '39000.00', NULL, NULL, 2, '', NULL, 1),
(38, '2021-05-29 08:34:28.985200', 'Тахианы махан цуглуулга 4-5', '', '49000.00', NULL, NULL, 2, '', NULL, 1),
(39, '2021-05-29 08:34:55.083693', 'Солонгос хоолны цуглуулга 2-3', '', '49000.00', NULL, NULL, 2, '', NULL, 1),
(40, '2021-05-29 08:36:43.163875', 'Солонгос хоолны цуглуулга 4-5', '', '59000.00', NULL, NULL, 2, '', NULL, 1),
(41, '2021-05-29 08:37:33.676764', 'Жэюүгбуггим 2хүн', '', '29000.00', NULL, NULL, 2, '', NULL, 1),
(42, '2021-05-29 08:37:59.599247', 'Кимчи сангёбсал 2хүн', '', '39000.00', NULL, NULL, 2, '', NULL, 1),
(43, '2021-05-29 08:38:14.680109', 'Калбижим 2хүн', '', '29000.00', NULL, NULL, 2, '', NULL, 1),
(44, '2021-05-29 08:38:30.877036', 'Калбитан', '', '13900.00', NULL, NULL, 2, '', NULL, 1),
(45, '2021-05-29 08:38:52.975300', 'Калбитан 2хүн', '', '24900.00', NULL, NULL, 2, '', NULL, 1),
(46, '2021-05-29 08:39:27.378267', 'Бүлгүгги 2хүн', '', '29000.00', NULL, NULL, 2, '', NULL, 1),
(47, '2021-05-29 08:40:44.169660', 'Кимчижигэ', '', '12900.00', NULL, NULL, 2, '', NULL, 1),
(48, '2021-05-29 08:41:05.791896', 'Тэнжанжигэ', '', '12900.00', NULL, NULL, 2, '', NULL, 1),
(49, '2021-05-29 08:41:23.650918', 'Миёогтой шөл', '', '12900.00', NULL, NULL, 2, '', NULL, 1),
(50, '2021-05-29 08:41:42.895018', 'Бүдэжигэ 2хүн', '', '26900.00', NULL, NULL, 2, '', NULL, 1),
(51, '2021-05-29 08:42:06.564372', 'Тагтуритан 2хүн', '', '26900.00', NULL, NULL, 2, '', NULL, 1),
(52, '2021-05-29 08:42:19.985140', 'Гоймон', '', '5900.00', NULL, NULL, 2, '', NULL, 1),
(53, '2021-05-29 08:42:32.781872', 'Кимбаб', '', '5900.00', NULL, NULL, 2, '', NULL, 1),
(54, '2021-05-29 08:42:48.904794', 'Догбугги', '', '8900.00', NULL, NULL, 2, '', NULL, 1),
(55, '2021-05-29 08:43:17.091406', 'Цезарь салат', '', '10900.00', NULL, NULL, 2, '', NULL, 1),
(57, '2021-05-29 08:43:52.764447', 'Бууцайтай үхрийн хэлэн салат', '', '11900.00', NULL, NULL, 2, '', NULL, 1),
(58, '2021-05-29 08:44:18.743932', 'Swiss bowl salat', '', '11900.00', NULL, NULL, 2, '', NULL, 1),
(59, '2021-05-29 08:44:51.004778', 'Броколи зутан шөл', '', '7900.00', NULL, NULL, 2, '', NULL, 1),
(60, '2021-05-29 08:45:12.725020', 'Хулууны зутан шөл', '', '7900.00', NULL, NULL, 2, '', NULL, 1),
(61, '2021-05-29 08:45:27.223849', 'Бантан', '', '6900.00', NULL, NULL, 2, '', NULL, 1),
(62, '2021-05-29 08:45:50.697192', 'Банштай цай', '', '8900.00', NULL, NULL, 2, '', NULL, 1),
(63, '2021-05-29 08:46:20.578901', 'Бинтэй хар шөл', '', '8900.00', NULL, NULL, 2, '', NULL, 1),
(64, '2021-05-29 08:46:50.440609', 'Карборанара паста', '', '16900.00', NULL, NULL, 2, '', NULL, 1),
(65, '2021-05-29 08:47:10.346748', 'Бологнайз паста', '', '15900.00', NULL, NULL, 2, '', NULL, 1),
(66, '2021-05-29 08:47:46.989843', 'Mushroom (taglatil) pasta', '', '16900.00', NULL, NULL, 2, '', NULL, 1),
(67, '2021-05-29 08:48:11.413240', 'Салям пицца', '', '22900.00', NULL, NULL, 2, '', NULL, 1),
(68, '2021-05-29 08:48:56.477818', 'Хавай пицца', '', '22900.00', NULL, NULL, 2, '', NULL, 1),
(69, '2021-05-29 08:49:18.170059', 'Холимог пицца', '', '22900.00', NULL, NULL, 2, '', NULL, 1),
(70, '2021-05-29 08:49:36.360099', 'Кето пицца', '', '22900.00', NULL, NULL, 2, '', NULL, 1),
(71, '2021-05-29 08:50:41.347816', 'Tesoro нэрийн стэйк', '', '28900.00', NULL, NULL, 2, 'product-images/9B4C65B4-D3C2-404A-87CD-76EE4C3C2E6B.jpeg', NULL, 1),
(72, '2021-05-29 08:50:57.109718', 'Цуйван', '', '10900.00', NULL, NULL, 2, '', NULL, 1),
(73, '2021-05-29 08:51:14.071688', 'Шаржигнуур тахиа', '', '12900.00', NULL, NULL, 2, '', NULL, 1),
(74, '2021-05-29 08:51:32.297730', 'Хуушуур багц', '', '15900.00', NULL, NULL, 2, '', NULL, 1),
(75, '2021-05-29 08:51:58.008201', 'Бууз багц', '', '15900.00', NULL, NULL, 2, '', NULL, 1),
(76, '2021-05-29 08:52:21.399539', 'Хонины шарсан хавирга', '', '16900.00', NULL, NULL, 2, '', NULL, 1),
(77, '2021-05-29 08:52:39.512575', 'Үхрийн шарсан хавирга', '', '16900.00', NULL, NULL, 2, '', NULL, 1),
(78, '2021-05-29 08:53:03.066922', 'Tbone steak', '', '24900.00', NULL, NULL, 2, '', NULL, 1),
(79, '2021-05-29 08:53:35.420773', 'Шарсан төмс', '', '4900.00', NULL, NULL, 2, '', NULL, 1),
(80, '2021-05-29 08:53:46.964433', 'Будаа', '', '1900.00', NULL, NULL, 2, '', NULL, 1),
(81, '2021-05-29 08:54:39.356429', 'Bonaqua 500ml', '', '100.00', NULL, NULL, 5, 'product-images/Untitled-1.jpg', NULL, 0),
(82, '2021-05-29 08:55:03.943836', 'SanBenedetto still 500ml', '', '6900.00', NULL, NULL, 5, 'product-images/70522_XXX_v1.jpg', NULL, 0),
(83, '2021-05-29 08:56:10.454640', 'SanBenedetto sparkling 500ml', '', '6900.00', NULL, NULL, 5, 'product-images/large_c1146abe-35a9-414c-96ef-671ec5d4b0bc.png', NULL, 0),
(84, '2021-05-29 08:56:40.828377', 'Coca cola', '', '3000.00', NULL, NULL, 5, 'product-images/10-1.png', NULL, 0),
(85, '2021-05-29 08:56:59.011417', 'Fanta Orange', '', '3000.00', NULL, NULL, 5, 'product-images/fanta-naranja.jpg', NULL, 0),
(86, '2021-05-29 08:57:09.046991', 'Sprite', '', '3000.00', NULL, NULL, 5, 'product-images/11.png', NULL, 0),
(87, '2021-05-29 08:57:21.396698', 'Soda', '', '3000.00', NULL, NULL, 5, 'product-images/B1177016360.jpg', NULL, 0),
(88, '2021-05-29 08:57:34.241432', '+C', '', '3000.00', NULL, NULL, 5, 'product-images/e4b61d_2e9fc8b4b21a464fac819bcd21de30ff_mv2.jpg', NULL, 0),
(89, '2021-05-29 08:58:26.568425', 'Juice Моя Семья 250ml', '', '3900.00', NULL, NULL, 5, '', 250, 1),
(90, '2021-05-29 08:58:46.263552', 'Lipton tea - Гүцтэй', 'Lipton tea - Гүцтэй', '2900.00', NULL, NULL, 5, '', NULL, 1),
(91, '2021-05-29 08:59:03.030511', 'Green tea', '', '2900.00', NULL, NULL, 5, '', NULL, 1),
(92, '2021-05-29 08:59:25.315785', 'Kiwi & Apple iced tea', '', '5900.00', NULL, NULL, 5, '', NULL, 1),
(93, '2021-05-29 08:59:50.433222', 'Strawberry & Orange iced tea', '', '5900.00', NULL, NULL, 5, '', NULL, 1),
(94, '2021-05-29 09:00:11.204410', 'Blue berry & Watermelon iced tea', '', '5900.00', NULL, NULL, 5, '', NULL, 1),
(95, '2021-05-29 09:00:53.089806', 'Power', 'Spinach, kiwi, matcha, green tea, apple juice', '7900.00', NULL, NULL, 5, '', NULL, 1),
(96, '2021-05-29 09:01:32.059035', 'Avatar', 'red berries, blueberry, orange juice', '7900.00', NULL, NULL, 5, '', NULL, 1),
(97, '2021-05-29 09:02:07.626069', 'Passion fruit', 'passion fruit, mango juice, lemon juice', '7900.00', NULL, NULL, 5, '', NULL, 1),
(98, '2021-05-29 09:02:26.223133', 'Chocolate & Coffee shake', '', '8900.00', NULL, NULL, 5, '', NULL, 1),
(99, '2021-05-29 09:02:53.008665', 'Strawberry & Honey shake', '', '8900.00', NULL, NULL, 5, '', NULL, 1),
(100, '2021-05-29 09:03:09.814626', 'Vanilla & Oreo shake', '', '8900.00', NULL, NULL, 5, '', NULL, 1),
(101, '2021-05-29 09:03:37.436206', 'Sengur', '', '4500.00', NULL, NULL, 5, 'product-images/sengur.jpg', NULL, 0),
(102, '2021-05-29 09:09:43.317133', 'Kaltenberg 500ml', '', '5900.00', NULL, NULL, 5, 'product-images/kb-pils-new.png', NULL, 0),
(103, '2021-05-29 09:11:51.407459', 'Heineken 500ml', '', '6900.00', NULL, NULL, 5, 'product-images/1_0028Kopie.jpg4a444ab9-d14b-4b2e-b99a-6be577434c20Large.jpg', NULL, 0),
(104, '2021-05-29 09:15:34.192202', 'Miller 500ml', '', '6900.00', NULL, NULL, 5, 'product-images/Miller-Genuine-Draft-33-cl-Bierflasche.jpg', NULL, 0),
(105, '2021-05-29 09:17:01.101173', 'Сибирская корона 500ml', '', '7900.00', NULL, NULL, 5, 'product-images/images.jpg', NULL, 0),
(106, '2021-05-29 09:19:30.557721', 'Harbin ice 500ml', '', '7900.00', NULL, NULL, 5, '', NULL, 0),
(107, '2021-05-29 09:24:19.108225', 'Guinness 500ml', '', '9900.00', NULL, NULL, 5, 'product-images/364917219-guinness-draught-temnoe-4-5-0-5-g-b-650x650.jpg', NULL, 0),
(108, '2021-05-29 09:25:09.455105', 'Eden 700ml', '', '49000.00', NULL, NULL, 5, 'product-images/eden-0.75l-7.5.png', NULL, 0),
(109, '2021-05-29 09:25:57.306842', 'Eden 50ml', '', '4900.00', NULL, NULL, 5, 'product-images/eden-0.75l-7.5_DPj91R0.png', 50, 1),
(110, '2021-05-29 09:26:39.976283', 'Velvet 700ml', '', '69000.00', NULL, NULL, 5, 'product-images/velvet-1l-8.5_l.png', NULL, 0),
(111, '2021-05-29 09:27:05.387736', 'Velvet 50ml', '', '5900.00', NULL, NULL, 5, 'product-images/velvet-1l-8.5_l_FkZ4rMC.png', 50, 1),
(112, '2021-05-29 09:28:10.251446', 'Evok 750ml', '', '69000.00', NULL, NULL, 5, 'product-images/download_tH6TTOq.jpg', NULL, 0),
(113, '2021-05-29 09:28:27.557436', 'Evok 50ml', '', '5900.00', NULL, NULL, 5, 'product-images/download_o5kQOPO.jpg', 50, 1),
(114, '2021-05-29 09:29:21.160502', 'Smirnoff red 700ml', '', '69000.00', NULL, NULL, 5, 'product-images/70778-smirnoff-red-label-vodka-375-prozent-vol.jpg', NULL, 0),
(115, '2021-05-29 09:29:52.302283', 'Smirnoff red 50ml', '', '4900.00', NULL, NULL, 5, 'product-images/70778-smirnoff-red-label-vodka-375-prozent-vol_04UHdRP.jpg', 50, 1),
(116, '2021-05-29 09:30:42.351146', 'Finlandia 750ml', '', '99000.00', NULL, NULL, 5, 'product-images/vodka-of-finland-400-2_1.jpg', NULL, 0),
(117, '2021-05-29 09:31:03.442352', 'Finlandia 50ml', '', '7900.00', NULL, NULL, 5, 'product-images/vodka-of-finland-400-2_1_cuCtQUx.jpg', 50, 1),
(118, '2021-05-29 09:31:55.637337', 'Beluga 700ml', '', '199000.00', NULL, NULL, 5, 'product-images/download_1.jpg', NULL, 0),
(119, '2021-05-29 09:32:13.577364', 'Beluga 50ml', '', '9900.00', NULL, NULL, 5, 'product-images/download_1_2ItE1HV.jpg', 50, 1),
(120, '2021-05-29 09:33:05.595339', 'Belvedere 700ml', '', '229000.00', NULL, NULL, 5, 'product-images/belvedere-vodka-688155_e.jpg', NULL, 0),
(121, '2021-05-29 09:33:22.727319', 'Belvedere 50ml', '', '19000.00', NULL, NULL, 5, 'product-images/belvedere-vodka-688155_e_rilT3Bk.jpg', 50, 1),
(122, '2021-05-29 09:34:12.894188', 'Ciroc 700ml', '', '269000.00', NULL, NULL, 5, 'product-images/download_2.jpg', NULL, 0),
(123, '2021-05-29 09:34:29.277125', 'Ciroc 50ml', '', '18900.00', NULL, NULL, 5, 'product-images/download_2_QIPOTuQ.jpg', 50, 1),
(124, '2021-05-29 09:35:21.246098', 'Hennessy V.S 700ml', '', '199000.00', NULL, NULL, 5, 'product-images/18291_Hennessy-VS-07L-40-Vol_4.jpg', NULL, 0),
(125, '2021-05-29 09:35:39.231126', 'Hennessy V.S 50ml', '', '14900.00', NULL, NULL, 5, 'product-images/18291_Hennessy-VS-07L-40-Vol_4_ZR1zwfx.jpg', 50, 1),
(126, '2021-05-29 09:37:42.669187', 'Hennessy V.S.O.P 700ml', '', '249000.00', NULL, NULL, 5, 'product-images/download_3.jpg', NULL, 0),
(127, '2021-05-29 09:38:01.873285', 'Hennessy V.S.O.P 50ml', '', '18900.00', NULL, NULL, 5, 'product-images/download_3_eSJWXIb.jpg', 50, 1),
(128, '2021-05-29 09:38:42.316598', 'Hennessy X.O 700ml', '', '799000.00', NULL, NULL, 5, 'product-images/download_4.jpg', NULL, 0),
(129, '2021-05-29 09:40:11.257685', 'Wild Turkey 700ml', '', '139000.00', NULL, NULL, 5, 'product-images/ci-wild-turkey-bourbon-fe554d942f449305.jpeg', NULL, 0),
(130, '2021-05-29 09:40:48.852836', 'Wild Turkey 50ml', '', '10900.00', NULL, NULL, 5, 'product-images/ci-wild-turkey-bourbon-fe554d942f449305_gZPaQwX.jpeg', 50, 1),
(131, '2021-05-29 09:42:02.365040', 'Jameson 700ml', '', '139000.00', NULL, NULL, 5, 'product-images/4006-jameson.png', NULL, 0),
(132, '2021-05-29 09:42:25.289351', 'Jameson 50ml', '', '10900.00', NULL, NULL, 5, 'product-images/4006-jameson_oAtfu0x.png', 50, 1),
(133, '2021-05-29 09:44:53.461826', 'Jack Daniel\'s  700ml', '', '169000.00', NULL, NULL, 5, 'product-images/jack-daniels-old-no7-400_2.jpg', NULL, 0),
(134, '2021-05-29 09:45:10.402795', 'Jack Daniel\'s  50ml', '', '11900.00', NULL, NULL, 5, 'product-images/jack-daniels-old-no7-400_2_cTVnIuo.jpg', 50, 1),
(135, '2021-05-29 09:46:06.998032', 'Jack Daniel\'s Honey 700ml', '', '179000.00', NULL, NULL, 5, 'product-images/2087207030007_1_default_default.jpg', NULL, 0),
(136, '2021-05-29 09:46:29.061294', 'Jack Daniel\'s Honey 50ml', '', '13900.00', NULL, NULL, 5, 'product-images/2087207030007_1_default_default_JoKqXRi.jpg', 50, 1),
(137, '2021-05-29 09:47:15.101928', 'Jack Daniel\'s Fire 700ml', '', '199000.00', NULL, NULL, 5, 'product-images/100430_jack_daniels_tennesee_fire_700.jpg', NULL, 0),
(138, '2021-05-29 09:47:39.073299', 'Jack Daniel\'s Fire 50ml', '', '14900.00', NULL, NULL, 5, 'product-images/100430_jack_daniels_tennesee_fire_700_pUc1bUc.jpg', 50, 1),
(139, '2021-05-29 09:48:35.923551', 'Jack Single barrel 700ml', '', '439000.00', NULL, NULL, 5, 'product-images/jack-daniels-barrel.jpg', NULL, 0),
(141, '2021-05-29 09:49:58.458271', 'Glenmorangie Orignal 700ml', '', '239000.00', NULL, NULL, 5, 'product-images/99800_glenmorangie_original_700_ohne_gp.jpg', NULL, 0),
(142, '2021-05-29 09:50:18.715430', 'Glenmorangie Orignal 50ml', '', '17900.00', NULL, NULL, 5, 'product-images/99800_glenmorangie_original_700_ohne_gp_HoqKxNs.jpg', 50, 1),
(143, '2021-05-29 09:52:10.526825', 'Ballantine\'s Finest 750ml', '', '119000.00', NULL, NULL, 5, 'product-images/ballantines-finest_1.jpg', NULL, 0),
(144, '2021-05-29 09:52:27.416791', 'Ballantine\'s Finest 50ml', '', '89000.00', NULL, NULL, 5, 'product-images/ballantines-finest_1_PwXjY6p.jpg', 50, 1),
(145, '2021-05-29 09:53:03.320845', 'Crown Royal 750ml', '', '129000.00', NULL, NULL, 5, 'product-images/download_5.jpg', NULL, 0),
(147, '2021-05-29 09:54:11.307733', 'Chivas regal 12yo 700ml', '', '169000.00', NULL, NULL, 5, 'product-images/chivas-regal-12-years-1l.jpg', NULL, 0),
(149, '2021-05-29 09:55:34.532494', 'Johnnie Walker Red 750ml', '', '119000.00', NULL, NULL, 5, 'product-images/Johnnie-Walker-Red-Label.png', NULL, 0),
(150, '2021-05-29 09:55:51.595470', 'Johnnie Walker Red 50ml', '', '8900.00', NULL, NULL, 5, 'product-images/Johnnie-Walker-Red-Label_oEly76t.png', 50, 1),
(151, '2021-05-29 09:56:43.914462', 'Johnnie Walker Blue 750ml', '', '789000.00', NULL, NULL, 5, 'product-images/2200_master-1.jpg', NULL, 0),
(152, '2021-05-29 09:58:05.643137', 'Bacardi Superior 1000ml', '', '129000.00', NULL, NULL, 5, 'product-images/v2bcczy2ijzzwogukxdb.jpg', NULL, 0),
(153, '2021-05-29 09:58:25.503273', 'Bacardi Superior 50ml', '', '79000.00', NULL, NULL, 5, 'product-images/v2bcczy2ijzzwogukxdb_VlMpsea.jpg', 50, 1),
(154, '2021-05-29 09:59:55.902443', 'Captain Morgan spiced gold 1000ml', '', '139000.00', NULL, NULL, 5, 'product-images/cpt-morgan-spiced-gold-2450-750ml.jpg', NULL, 0),
(155, '2021-05-29 10:00:12.251378', 'Captain Morgan spiced gold 50ml', '', '7900.00', NULL, NULL, 5, 'product-images/cpt-morgan-spiced-gold-2450-750ml_Hio3nQv.jpg', 50, 1),
(158, '2021-05-29 10:04:05.813737', 'Sierra Silver 700ml', '', '119000.00', NULL, NULL, 5, 'product-images/sierra-tequila-silver-700ml.jpg', NULL, 0),
(159, '2021-05-29 10:04:27.888000', 'Sierra Silver 50ml', '', '7900.00', NULL, NULL, 5, 'product-images/sierra-tequila-silver-700ml_fiQZ5wj.jpg', 50, 1),
(160, '2021-05-29 10:05:10.958463', 'Sierra Gold 700ml', '', '119000.00', NULL, NULL, 5, 'product-images/SIERRA-TEQUILA-GOLD-1L.jpg', NULL, 0),
(161, '2021-05-29 10:05:24.654247', 'Sierra Gold 50ml', '', '7900.00', NULL, NULL, 5, 'product-images/SIERRA-TEQUILA-GOLD-1L_V4BXUMj.jpg', 50, 1),
(162, '2021-05-29 10:06:10.709881', 'Pepe Lopez Gold 750ml', '', '109000.00', NULL, NULL, 5, 'product-images/0000428.jpeg', NULL, 0),
(163, '2021-05-29 10:06:26.312773', 'Pepe Lopez Gold 50ml', '', '7900.00', NULL, NULL, 5, 'product-images/0000428_4NuaYZz.jpeg', 50, 1),
(164, '2021-05-29 10:07:21.388923', 'Kahlua 700ml', '', '89000.00', NULL, NULL, 5, 'product-images/download_6.jpg', NULL, 0),
(165, '2021-05-29 10:07:39.239945', 'Kahlua 50ml', '', '6900.00', NULL, NULL, 5, 'product-images/download_6_s79n7cW.jpg', 50, 1),
(166, '2021-05-29 10:08:34.580110', 'Bailey\'s 750ml', '', '109000.00', NULL, NULL, 5, 'product-images/baileys-original-irish-cream-700ml.jpg', NULL, 0),
(167, '2021-05-29 10:08:53.574196', 'Bailey\'s 50ml', '', '7900.00', NULL, NULL, 5, 'product-images/baileys-original-irish-cream-700ml_ogu6hFi.jpg', 50, 1),
(168, '2021-05-29 10:09:50.591457', 'Jagermeister 700ml', '', '99000.00', NULL, NULL, 5, 'product-images/jagermeister-100-cl-m.jpg', NULL, 0),
(169, '2021-05-29 10:10:16.299928', 'Jagermeister 50ml', '', '8900.00', NULL, NULL, 5, 'product-images/jagermeister-100-cl-m_JFkNRHI.jpg', 50, 1),
(170, '2021-05-29 10:11:43.184897', 'Sambuca 1000ml', '', '99000.00', NULL, NULL, 5, 'product-images/sambuca-luxardo-dei-cesari-436800_e.jpg', NULL, 0),
(171, '2021-05-29 10:11:59.872852', 'Sambuca 50ml', '', '7900.00', NULL, NULL, 5, 'product-images/sambuca-luxardo-dei-cesari-436800_e_eQ8veoL.jpg', 50, 1),
(172, '2021-05-29 10:12:36.599953', 'AbsenthXenta 700ml', '', '159000.00', NULL, NULL, 5, 'product-images/10414581.jpg', NULL, 0),
(173, '2021-05-29 10:12:55.401028', 'AbsenthXenta 50ml', '', '10900.00', NULL, NULL, 5, 'product-images/10414581_BagQiWh.jpg', 50, 1),
(174, '2021-05-29 10:13:49.494122', 'Gordon\'s 750ml', '', '89000.00', NULL, NULL, 5, 'product-images/gordons-london-dry-gin-3750-1l_1.jpg', NULL, 0),
(175, '2021-05-29 10:14:07.618158', 'Gordon\'s 50ml', '', '6900.00', NULL, NULL, 5, 'product-images/gordons-london-dry-gin-3750-1l_1_RCYa6VZ.jpg', 50, 1),
(176, '2021-05-29 10:14:55.488897', 'Campari 700ml', '', '89000.00', NULL, NULL, 5, 'product-images/00-02-111-01_1.jpg', NULL, 0),
(177, '2021-05-29 10:15:17.193138', 'Campari 50ml', '', '6900.00', NULL, NULL, 5, 'product-images/00-02-111-01_1_VSlXaXe.jpg', 50, 1),
(178, '2021-05-29 10:16:08.506073', 'Aperol 700ml', '', '79000.00', NULL, NULL, 5, 'product-images/aperol-aperitivo-700ml_grande.jpg', NULL, 0),
(179, '2021-05-29 10:16:26.506102', 'Aperol 50ml', '', '5900.00', NULL, NULL, 5, 'product-images/aperol-aperitivo-700ml_grande_owy6IGZ.jpg', 50, 1),
(180, '2021-05-29 10:17:55.525194', 'Martini Bianco 1000ml', 'Martini Bianco 1000ml', '69000.00', NULL, NULL, 5, 'product-images/cq5dam.web.1280.1280.jpeg', 1000, 0),
(181, '2021-05-29 10:18:17.215435', 'Martini Bianco 50ml', '', '3900.00', NULL, NULL, 5, 'product-images/martini_series__extra_dry_ross_1589541842_9727d899_progressive_5UXJR31.jpg', 50, 1),
(182, '2021-05-29 10:22:01.941288', 'Moet&Chandon rose', '', '249000.00', NULL, NULL, 5, 'product-images/99182_Moet---Chandon-Rose-Imperial-Magnum-15L-12-Vol_4.jpg', NULL, 0),
(183, '2021-05-29 10:24:23.002356', 'Altos del Plata White 750ml', 'Altos del Plata White 750ml', '79000.00', NULL, NULL, 5, 'product-images/46dced_0402564fbad346c0a3aa58da6c4d9e5c_mv2_300x300.jpg', 750, 0),
(184, '2021-05-29 10:26:01.544993', 'Domaine La Baume White 750ml', '', '79000.00', NULL, NULL, 5, 'product-images/8126_la_baume_sauv_blanc_2019.png', 750, 0),
(186, '2021-05-29 10:32:09.572043', 'Altos del Plata Red 750ml', '', '89000.00', NULL, NULL, 5, 'product-images/8127_la_baume_cabsauv_2019.png', 750, 0),
(187, '2021-05-29 10:34:03.374552', 'Domaine La Baume Red 750ml', 'Domaine La Baume Red 750ml', '79000.00', NULL, NULL, 5, 'product-images/8127_la_baume_cabsauv_2019_1.png', 750, 0),
(188, '2021-05-29 10:35:58.715149', 'Altos del Plata Red 125ml', 'Altos del Plata Red 125ml', '13900.00', NULL, NULL, 5, 'product-images/terrazas-de-los-andes-altos-del-plata-malbec_7OpGNM4.jpg', 125, 1),
(189, '2021-05-29 10:37:40.175952', 'Domaine La Baume Red 125ml', '', '12900.00', NULL, NULL, 5, 'product-images/8127_la_baume_cabsauv_2019_sUcZvdZ.png', 125, 1),
(190, '2021-05-29 10:41:53.659451', 'Louis Eschenauer Red 750ml', '', '49000.00', NULL, NULL, 5, 'product-images/8036_bordeaux_louis_eschenauer_075.png', NULL, 0),
(191, '2021-05-29 11:51:10.866229', 'Rib eye steak', '', '32000.00', NULL, NULL, 5, '', NULL, 1),
(192, '2021-05-29 11:53:44.023989', 'Chicken breast', '', '26900.00', NULL, NULL, 5, '', NULL, 1),
(193, '2021-05-29 12:39:35.253351', 'Fanta grape', '', '3500.00', NULL, NULL, 5, 'product-images/fanta-grape-copy.jpg', NULL, 0),
(194, '2021-05-30 14:55:31.537661', 'Hennessy V.S 350ml', '', '139000.00', NULL, NULL, 5, 'product-images/download.jfif', NULL, 0),
(195, '2021-05-30 15:20:57.192923', 'JB Rare 750ml', '', '159000.00', NULL, NULL, 5, 'product-images/download_1.jfif', NULL, 0),
(196, '2021-07-03 02:38:00.588608', 'Martini Rosso 1000ml', 'Martini Rosso 1000ml', '69000.00', 19, NULL, 5, 'product-images/ME089_tnNyvCV.png', 1000, 0),
(197, '2021-07-03 02:38:58.408399', 'Martini Extra Dry 1000ml', 'Martini Extra Dry 1000ml', '69000.00', 19, NULL, 5, 'product-images/martini-extra-dry-vermouth-75cl-15-abv_temp.jpg', 1000, 0),
(198, '2021-07-03 02:38:00.588608', 'Martini Rosso 50ml', 'Martini Rosso 50ml', '69000.00', 19, NULL, 5, 'product-images/ME089_tnNyvCV.png', 50, 1),
(199, '2021-07-03 02:38:58.408399', 'Martini Extra Dry 50ml', 'Martini Extra Dry 50ml', '69000.00', 19, NULL, 5, 'product-images/martini-extra-dry-vermouth-75cl-15-abv_temp.jpg', 50, 1),
(200, '2021-05-29 10:41:53.659451', 'Louis Eschenauer White 750ml', '', '49000.00', NULL, NULL, 5, 'product-images/DkQpgyNBQgeDm4hglWG6DQ_pb_600x600.png', 750, 0),
(201, '2021-07-06 08:00:43.217518', 'Tesoro Special Long Island iced tea', '', '16900.00', NULL, NULL, NULL, '', NULL, 1),
(202, '2021-07-06 08:01:32.983797', 'Adios mother  fucker', '', '14900.00', NULL, NULL, NULL, '', NULL, 1),
(203, '2021-07-06 08:03:28.082799', 'Cuba Libra', '', '10900.00', NULL, NULL, NULL, '', NULL, 1),
(204, '2021-07-06 08:04:16.911885', 'Green summer', '', '14900.00', NULL, NULL, NULL, '', NULL, 1),
(205, '2021-07-06 08:04:48.256942', 'Tesoro Special Mojito', '', '13900.00', NULL, NULL, NULL, '', NULL, 1),
(206, '2021-07-06 08:05:28.283011', 'Kiwi mojito', '', '12900.00', NULL, NULL, NULL, '', NULL, 1),
(207, '2021-07-06 08:08:12.239299', 'Tesoro strong', '', '9900.00', NULL, NULL, NULL, '', NULL, 1),
(208, '2021-07-06 08:08:44.268155', 'Alien brain', '', '6900.00', NULL, NULL, NULL, '', NULL, 1),
(209, '2021-07-06 08:09:14.204608', 'Crazy Brain', '', '6900.00', NULL, NULL, NULL, '', NULL, 1),
(210, '2021-07-06 08:09:55.748481', 'Blow job', '', '6900.00', NULL, NULL, NULL, '', NULL, 1),
(211, '2021-07-06 08:10:23.742331', 'B-52', '', '6900.00', NULL, NULL, NULL, '', NULL, 1),
(212, '2021-07-06 08:10:45.691570', 'Negroni', '', '12900.00', NULL, NULL, NULL, '', NULL, 1),
(213, '2021-07-06 08:11:32.928453', 'Cosmopolitan', '', '12900.00', NULL, NULL, NULL, '', NULL, 1),
(214, '2021-07-06 08:11:57.202095', 'God father', '', '12900.00', NULL, NULL, NULL, '', NULL, 1),
(215, '2021-07-06 08:12:30.009953', 'Martini', '', '12900.00', NULL, NULL, NULL, '', NULL, 1),
(216, '2021-07-06 08:12:57.746802', 'Whiskey sour', '', '12900.00', NULL, NULL, NULL, '', NULL, 1),
(217, '2021-07-06 08:13:41.192878', 'Sexy monica', '', '14900.00', NULL, NULL, NULL, '', NULL, 1),
(218, '2021-07-06 08:15:03.795023', 'Sex on the beach', '', '14900.00', NULL, NULL, NULL, '', NULL, 1),
(219, '2021-07-06 08:15:36.758881', 'Pina coloda', '', '12900.00', NULL, NULL, NULL, '', NULL, 1),
(220, '2021-07-06 08:16:06.476933', 'Blue margarita', '', '14900.00', NULL, NULL, NULL, '', NULL, 1),
(221, '2021-07-06 08:16:42.281996', 'Strawberry daiquiri', '', '14900.00', NULL, NULL, NULL, '', NULL, 1),
(222, '2021-07-06 08:17:05.416837', 'Bloody mary', '', '8900.00', NULL, NULL, NULL, '', NULL, 1),
(223, '2021-07-06 08:17:23.654467', 'Red eye', '', '8900.00', NULL, NULL, NULL, '', NULL, 1),
(224, '2021-07-06 09:38:11.793996', 'Blueberry Mojito', '', '12900.00', NULL, NULL, NULL, '', NULL, 1),
(225, '2021-07-06 09:38:54.228070', 'Sea Buckthorn Mojito', '', '12900.00', NULL, NULL, NULL, '', NULL, 1),
(227, '2021-07-24 12:01:22.011120', 'Мояа семьяа 1000ml', 'Мояа семьяа 1000ml', '9900.00', NULL, NULL, 5, 'product-images/download_7.jpg', 1000, 0),
(228, '2021-07-24 12:22:38.566373', 'Louis Eschenauer White 125ml', '', '11900.00', NULL, NULL, 5, 'product-images/8126_la_baume_sauv_blanc_2019_9NklJFr.png', 125, 1),
(229, '2021-07-24 12:23:53.266953', 'Louis Eschenauer Red 125ml', 'Louis Eschenauer Red 125ml', '11900.00', NULL, NULL, 5, '', 125, 1),
(230, '2021-07-24 12:29:36.308647', 'Domaine La Baume White 125ml', '', '12900.00', NULL, NULL, 5, '', 125, 1),
(231, '2021-07-24 12:37:35.980796', 'Altos del Plata White 125ml', 'Altos del Plata White 125ml', '13900.00', NULL, NULL, 5, 'product-images/product988.jpg', 125, 1),
(232, '2021-07-25 03:15:57.042413', 'Lipton tea - Аяга', 'Lipton tea - Аяга', '1500.00', NULL, NULL, 5, '', NULL, 1),
(233, '2021-07-25 03:17:25.201382', 'Сүүтэй цай - Аяга', 'Сүүтэй цай - Аяга', '1000.00', NULL, NULL, 5, '', NULL, 1),
(234, '2021-07-25 03:17:49.894460', 'Сүүтэй цай - Халуун сав', 'Сүүтэй цай - Халуун сав', '10000.00', NULL, NULL, NULL, '', NULL, 1),
(235, '2021-07-25 03:20:41.231183', 'Пакет сав', 'Пакет сав', '2000.00', NULL, NULL, 5, '', NULL, 0),
(236, '2021-07-25 03:22:55.032478', 'Хүргэлт үйлчилгээ', 'Хүргэлт үйлчилгээ', '2000.00', NULL, NULL, 5, 'product-images/Delivery-Service-Business-in-Dubai.jpg', NULL, 0),
(237, '2021-07-26 14:07:02.380370', 'Vip tax', 'Vip tax', '10000.00', NULL, NULL, NULL, '', NULL, 1),
(238, '2021-07-26 14:08:42.958123', 'alcohol tax', 'alcohol tax', '20000.00', NULL, NULL, NULL, '', NULL, 1),
(239, '2021-07-26 14:11:55.820154', 'bread', 'bread', '3500.00', NULL, NULL, NULL, '', NULL, 1),
(240, '2021-07-27 05:36:34.480734', 'Juice mango 250ml', '', '3900.00', NULL, NULL, 5, '', 250, 1),
(241, '2021-07-27 05:37:15.475079', 'Juice apple 250ml', '', '3900.00', NULL, NULL, 5, '', 250, 1),
(242, '2021-07-27 05:37:50.188064', 'Juice orange 250ml', '', '3900.00', NULL, NULL, 5, '', 250, 1),
(243, '2021-07-27 05:38:44.655179', 'Juice cranberry 250ml', '', '3900.00', NULL, NULL, 5, '', 250, 1),
(244, '2021-07-27 13:53:39.176149', 'Тактуритан 1 хүн', '', '18900.00', NULL, NULL, NULL, '', NULL, 1),
(245, '2021-07-28 03:50:15.973488', 'Бин', '', '1500.00', NULL, NULL, NULL, '', NULL, 1),
(246, '2021-07-29 05:35:18.350862', 'Americano', '', '3500.00', NULL, NULL, NULL, '', NULL, 1),
(247, '2021-07-29 05:36:32.213086', 'Cappuccino', '', '4800.00', NULL, NULL, NULL, '', NULL, 1),
(248, '2021-07-29 05:51:15.242593', 'Cafe latte', '', '5000.00', NULL, NULL, NULL, '', NULL, 1),
(249, '2021-07-29 05:51:45.600329', 'Vanilla latte', '', '5500.00', NULL, NULL, NULL, '', NULL, 1),
(250, '2021-08-07 08:24:51.538095', 'Сүү', '', '2500.00', NULL, NULL, NULL, '', NULL, 1),
(251, '2021-08-07 13:41:39.468273', 'Peanuts', '', '6500.00', NULL, NULL, NULL, '', NULL, 1),
(252, '2021-08-10 05:16:22.694002', 'Domaine La Baume Rose', '', '79000.00', NULL, NULL, 5, '', NULL, 0),
(253, '2021-08-10 05:17:48.275752', 'Remy Martin V.S.O.P 700ml', '', '399000.00', NULL, NULL, 5, '', NULL, 0),
(257, '2021-08-11 01:52:41.609049', 'Cola Zero', '', '3500.00', NULL, NULL, 5, '', NULL, 0),
(258, '2022-01-24 03:49:45.314746', 'Fruit combo tea', '', '7900.00', NULL, NULL, NULL, '', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_app_product_categories`
--

CREATE TABLE `product_app_product_categories` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_app_product_categories`
--

INSERT INTO `product_app_product_categories` (`id`, `product_id`, `product_category_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 2),
(5, 3, 1),
(6, 3, 2),
(7, 4, 1),
(8, 4, 2),
(9, 5, 1),
(10, 5, 2),
(11, 6, 1),
(12, 6, 2),
(13, 7, 1),
(14, 7, 2),
(15, 8, 1),
(16, 8, 2),
(17, 9, 1),
(18, 9, 2),
(19, 10, 1),
(20, 10, 2),
(21, 11, 1),
(22, 11, 2),
(23, 12, 1),
(24, 12, 2),
(25, 13, 1),
(26, 13, 2),
(29, 15, 1),
(30, 15, 3),
(31, 16, 1),
(32, 16, 3),
(33, 17, 1),
(34, 17, 3),
(35, 18, 1),
(36, 18, 3),
(37, 19, 1),
(38, 19, 3),
(39, 20, 1),
(40, 20, 3),
(41, 21, 1),
(42, 21, 3),
(43, 22, 1),
(44, 22, 3),
(45, 23, 1),
(46, 23, 3),
(47, 24, 1),
(48, 24, 3),
(49, 25, 1),
(50, 25, 3),
(51, 26, 1),
(52, 26, 3),
(53, 27, 1),
(54, 27, 3),
(257, 30, 5),
(64, 30, 6),
(253, 31, 5),
(60, 31, 6),
(254, 32, 5),
(61, 32, 6),
(255, 33, 5),
(62, 33, 6),
(256, 34, 5),
(63, 34, 6),
(258, 35, 5),
(65, 35, 6),
(259, 36, 5),
(66, 36, 6),
(260, 37, 5),
(67, 37, 6),
(261, 38, 5),
(68, 38, 6),
(262, 39, 5),
(69, 39, 6),
(263, 40, 5),
(70, 40, 6),
(264, 41, 5),
(71, 41, 7),
(265, 42, 5),
(72, 42, 7),
(266, 43, 5),
(73, 43, 7),
(267, 44, 5),
(74, 44, 7),
(268, 45, 5),
(75, 45, 7),
(269, 46, 5),
(76, 46, 7),
(270, 47, 5),
(77, 47, 7),
(271, 48, 5),
(78, 48, 7),
(272, 49, 5),
(79, 49, 7),
(273, 50, 5),
(80, 50, 7),
(274, 51, 5),
(81, 51, 7),
(275, 52, 5),
(82, 52, 7),
(276, 53, 5),
(83, 53, 7),
(277, 54, 5),
(84, 54, 7),
(278, 55, 5),
(85, 55, 8),
(279, 57, 5),
(87, 57, 8),
(280, 58, 5),
(88, 58, 8),
(281, 59, 5),
(89, 59, 9),
(282, 60, 5),
(90, 60, 9),
(283, 61, 5),
(91, 61, 9),
(284, 62, 5),
(92, 62, 9),
(285, 63, 5),
(93, 63, 9),
(286, 64, 5),
(94, 64, 10),
(287, 65, 5),
(95, 65, 10),
(288, 66, 5),
(96, 66, 10),
(289, 67, 5),
(97, 67, 11),
(290, 68, 5),
(98, 68, 11),
(291, 69, 5),
(99, 69, 11),
(292, 70, 5),
(100, 70, 11),
(293, 71, 5),
(101, 71, 12),
(294, 72, 5),
(102, 72, 12),
(295, 73, 5),
(103, 73, 12),
(296, 74, 5),
(104, 74, 12),
(297, 75, 5),
(105, 75, 12),
(298, 76, 5),
(106, 76, 12),
(299, 77, 5),
(107, 77, 12),
(300, 78, 5),
(108, 78, 12),
(303, 79, 5),
(109, 79, 13),
(304, 80, 5),
(110, 80, 13),
(305, 81, 14),
(111, 81, 15),
(306, 82, 14),
(112, 82, 15),
(307, 83, 14),
(113, 83, 15),
(308, 84, 14),
(114, 84, 16),
(309, 85, 14),
(115, 85, 16),
(310, 86, 14),
(116, 86, 16),
(311, 87, 14),
(117, 87, 16),
(312, 88, 14),
(118, 88, 16),
(314, 89, 14),
(119, 89, 17),
(315, 90, 14),
(120, 90, 18),
(316, 91, 14),
(121, 91, 18),
(317, 92, 14),
(122, 92, 19),
(318, 93, 14),
(123, 93, 19),
(319, 94, 14),
(124, 94, 19),
(320, 95, 14),
(125, 95, 20),
(321, 96, 14),
(126, 96, 20),
(322, 97, 14),
(127, 97, 20),
(323, 98, 14),
(128, 98, 21),
(324, 99, 14),
(129, 99, 21),
(325, 100, 14),
(130, 100, 21),
(326, 101, 22),
(131, 101, 23),
(327, 102, 22),
(132, 102, 23),
(328, 103, 22),
(133, 103, 23),
(329, 104, 22),
(134, 104, 23),
(330, 105, 22),
(135, 105, 23),
(331, 106, 22),
(136, 106, 23),
(332, 107, 22),
(137, 107, 23),
(333, 108, 22),
(138, 108, 24),
(334, 109, 22),
(139, 109, 24),
(335, 110, 22),
(140, 110, 24),
(336, 111, 22),
(141, 111, 24),
(337, 112, 22),
(142, 112, 24),
(338, 113, 22),
(143, 113, 24),
(339, 114, 22),
(144, 114, 24),
(340, 115, 22),
(145, 115, 24),
(341, 116, 22),
(146, 116, 24),
(342, 117, 22),
(147, 117, 24),
(343, 118, 22),
(148, 118, 24),
(344, 119, 22),
(149, 119, 24),
(345, 120, 22),
(150, 120, 24),
(346, 121, 22),
(151, 121, 24),
(347, 122, 22),
(152, 122, 24),
(348, 123, 22),
(153, 123, 24),
(349, 124, 22),
(154, 124, 25),
(350, 125, 22),
(155, 125, 25),
(351, 126, 22),
(156, 126, 25),
(352, 127, 22),
(157, 127, 25),
(353, 128, 22),
(158, 128, 25),
(355, 129, 22),
(159, 129, 26),
(356, 130, 22),
(160, 130, 26),
(357, 131, 22),
(161, 131, 26),
(358, 132, 22),
(162, 132, 26),
(359, 133, 22),
(163, 133, 26),
(360, 134, 22),
(164, 134, 26),
(361, 135, 22),
(165, 135, 26),
(362, 136, 22),
(166, 136, 26),
(363, 137, 22),
(167, 137, 26),
(364, 138, 22),
(168, 138, 26),
(365, 139, 22),
(169, 139, 26),
(367, 141, 22),
(171, 141, 26),
(368, 142, 22),
(173, 142, 27),
(402, 143, 22),
(174, 143, 36),
(403, 144, 22),
(175, 144, 36),
(404, 145, 22),
(176, 145, 36),
(406, 147, 22),
(178, 147, 36),
(408, 149, 22),
(180, 149, 36),
(409, 150, 22),
(181, 150, 36),
(410, 151, 22),
(182, 151, 36),
(412, 152, 22),
(183, 152, 37),
(413, 153, 22),
(184, 153, 37),
(414, 154, 22),
(185, 154, 37),
(415, 155, 22),
(186, 155, 37),
(369, 158, 22),
(189, 158, 28),
(370, 159, 22),
(190, 159, 28),
(371, 160, 22),
(191, 160, 28),
(372, 161, 22),
(192, 161, 28),
(373, 162, 22),
(193, 162, 28),
(374, 163, 22),
(194, 163, 28),
(377, 164, 22),
(195, 164, 30),
(378, 165, 22),
(196, 165, 30),
(379, 166, 22),
(197, 166, 30),
(380, 167, 22),
(198, 167, 30),
(381, 168, 22),
(199, 168, 30),
(382, 169, 22),
(200, 169, 30),
(383, 170, 22),
(201, 170, 30),
(384, 171, 22),
(202, 171, 30),
(385, 172, 22),
(203, 172, 30),
(386, 173, 22),
(204, 173, 30),
(375, 174, 22),
(205, 174, 29),
(376, 175, 22),
(206, 175, 29),
(387, 176, 22),
(207, 176, 31),
(388, 177, 22),
(208, 177, 31),
(389, 178, 22),
(209, 178, 31),
(390, 179, 22),
(210, 179, 31),
(391, 180, 22),
(211, 180, 31),
(392, 181, 22),
(212, 181, 31),
(393, 182, 22),
(213, 182, 32),
(394, 183, 22),
(214, 183, 33),
(395, 184, 22),
(215, 184, 33),
(397, 186, 22),
(217, 186, 35),
(398, 187, 22),
(218, 187, 35),
(399, 188, 22),
(219, 188, 35),
(674, 189, 14),
(400, 189, 22),
(220, 189, 35),
(401, 190, 22),
(221, 190, 35),
(301, 191, 5),
(222, 191, 12),
(302, 192, 5),
(223, 192, 12),
(313, 193, 14),
(224, 193, 16),
(354, 194, 22),
(225, 194, 25),
(411, 195, 22),
(226, 195, 36),
(609, 196, 22),
(610, 196, 31),
(611, 197, 25),
(612, 197, 31),
(613, 200, 33),
(615, 201, 22),
(614, 201, 38),
(617, 202, 22),
(616, 202, 38),
(619, 203, 22),
(618, 203, 38),
(621, 204, 22),
(620, 204, 38),
(623, 205, 22),
(622, 205, 38),
(625, 206, 22),
(624, 206, 38),
(627, 207, 22),
(626, 207, 38),
(629, 208, 22),
(628, 208, 38),
(631, 209, 22),
(630, 209, 38),
(633, 210, 22),
(632, 210, 38),
(635, 211, 22),
(634, 211, 38),
(637, 212, 22),
(636, 212, 38),
(639, 213, 22),
(638, 213, 38),
(641, 214, 22),
(640, 214, 38),
(643, 215, 22),
(642, 215, 38),
(645, 216, 22),
(644, 216, 38),
(647, 217, 22),
(646, 217, 38),
(649, 218, 22),
(648, 218, 38),
(651, 219, 22),
(650, 219, 38),
(653, 220, 22),
(652, 220, 38),
(655, 221, 22),
(654, 221, 38),
(657, 222, 22),
(656, 222, 38),
(659, 223, 22),
(658, 223, 38),
(661, 224, 22),
(660, 224, 38),
(663, 225, 22),
(662, 225, 38),
(667, 227, 14),
(666, 227, 17),
(669, 228, 14),
(670, 228, 22),
(668, 228, 33),
(672, 229, 14),
(673, 229, 22),
(671, 229, 35),
(676, 230, 14),
(677, 230, 22),
(675, 230, 33),
(679, 231, 14),
(680, 231, 22),
(678, 231, 33),
(682, 232, 14),
(681, 232, 18),
(684, 233, 14),
(683, 233, 18),
(686, 234, 14),
(685, 234, 18),
(687, 235, 39),
(688, 236, 39),
(689, 237, 39),
(690, 238, 39),
(692, 239, 5),
(691, 239, 13),
(694, 240, 14),
(693, 240, 17),
(696, 241, 14),
(695, 241, 17),
(698, 242, 14),
(697, 242, 17),
(699, 243, 14),
(700, 244, 5),
(701, 244, 7),
(703, 245, 5),
(702, 245, 13),
(705, 246, 14),
(704, 246, 41),
(707, 247, 14),
(706, 247, 41),
(709, 248, 14),
(708, 248, 41),
(711, 249, 14),
(710, 249, 41),
(713, 250, 14),
(712, 250, 18),
(715, 251, 5),
(714, 251, 13),
(717, 252, 22),
(716, 252, 34),
(719, 253, 22),
(718, 253, 25),
(727, 257, 14),
(726, 257, 16),
(729, 258, 14),
(728, 258, 18);

-- --------------------------------------------------------

--
-- Table structure for table `product_app_product_category`
--

CREATE TABLE `product_app_product_category` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_created` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_app_product_category`
--

INSERT INTO `product_app_product_category` (`id`, `created_at`, `name`, `description`, `created_by_id`, `parent_id`, `is_created`) VALUES
(1, '2020-06-20 07:47:53.157096', 'Зочид буудлын өрөө', 'Зочид буудлын өрөөг түрээслэх үйлчилгээ.', 1, NULL, 0),
(2, '2020-06-20 07:47:53.179611', 'Зочид буудлын өрөөг хоногоор түрээслэх', 'Зочид буудлын өрөөг хоногоор түрээслэх үйлчилгээ.', 1, 1, 0),
(3, '2020-06-20 07:47:53.213482', 'Зочид буудлын өрөөг цагаар түрээслэх', 'Зочид буудлын өрөөг цагаар түрээслэх үйлчилгээ.', 1, 1, 0),
(4, '2020-06-20 07:47:53.218485', 'Зочид буудлын MiniBar', 'Зочид буудлын өрөөний хөргөгч болон худалдан авч болох бэлэн бүтээгдэхүүнүүд.', 1, NULL, 0),
(5, '2021-05-29 08:12:48.840836', 'Food', '', NULL, NULL, 1),
(6, '2021-05-29 08:13:03.124653', 'Share food', '', NULL, 5, 1),
(7, '2021-05-29 08:13:14.269291', 'Korean food', '', NULL, 5, 1),
(8, '2021-05-29 08:13:33.945416', 'Salat', '', NULL, 5, 1),
(9, '2021-05-29 08:13:57.403758', 'Soup', '', NULL, 5, 1),
(10, '2021-05-29 08:14:04.641172', 'Pasta', '', NULL, 5, 1),
(11, '2021-05-29 08:14:10.716519', 'Pizza', '', NULL, 5, 1),
(12, '2021-05-29 08:14:24.205291', 'Main course', '', NULL, 5, 1),
(13, '2021-05-29 08:14:36.073970', 'Side dish', '', NULL, 5, 1),
(14, '2021-05-29 08:14:54.154004', 'Drinks', '', NULL, NULL, 1),
(15, '2021-05-29 08:15:08.456822', 'Water', '', NULL, 14, 1),
(16, '2021-05-29 08:15:20.332501', 'Soft drinks', '', NULL, 14, 1),
(17, '2021-05-29 08:15:28.513969', 'Juice', '', NULL, 14, 1),
(18, '2021-05-29 08:17:13.480973', 'Teas', '', NULL, 14, 1),
(19, '2021-05-29 08:17:22.787505', 'Iced tea', '', NULL, 14, 1),
(20, '2021-05-29 08:17:31.478002', 'Smoothies', '', NULL, 14, 1),
(21, '2021-05-29 08:17:43.304679', 'Milk shake', '', NULL, 14, 1),
(22, '2021-05-29 08:20:36.668594', 'Alcohol', '', NULL, NULL, 1),
(23, '2021-05-29 08:20:50.659395', 'Beer', '', NULL, 22, 1),
(24, '2021-05-29 08:21:00.314947', 'Vodka', '', NULL, 22, 1),
(25, '2021-05-29 08:21:09.139452', 'Cognac', '', NULL, 22, 1),
(26, '2021-05-29 08:21:20.804119', 'Bourbon whiskey', '', NULL, 22, 1),
(27, '2021-05-29 08:21:37.995102', 'Single malt whiskey', '', NULL, 22, 1),
(28, '2021-05-29 08:22:01.968473', 'Tequila', '', NULL, 22, 1),
(29, '2021-05-29 08:22:18.618426', 'Gin', '', NULL, 22, 1),
(30, '2021-05-29 08:22:27.240919', 'Liquers', '', NULL, 22, 1),
(31, '2021-05-29 08:22:45.681974', 'Vermouth & Bitter', '', NULL, 22, 1),
(32, '2021-05-29 08:23:00.898844', 'Sparkling wine', '', NULL, 22, 1),
(33, '2021-05-29 08:23:16.050711', 'White wine', '', NULL, 22, 1),
(34, '2021-05-29 08:23:31.572598', 'Rose wine', '', NULL, 22, 1),
(35, '2021-05-29 08:23:40.549112', 'Red wine', '', NULL, 22, 1),
(36, '2021-05-29 09:51:17.610799', 'Scotch & Canadian whiskey', '', NULL, 22, 1),
(37, '2021-05-29 09:57:06.201737', 'Rum', '', NULL, 22, 1),
(38, '2021-07-06 07:56:32.990775', 'Cocktails', '', NULL, 22, 1),
(39, '2021-07-25 03:19:07.512141', 'Бусад', 'Бусад бараа', NULL, NULL, 1),
(41, '2021-07-29 05:34:05.831714', 'Coffee', '', NULL, 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_app_size_type`
--

CREATE TABLE `product_app_size_type` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `abbreviation` varchar(10) NOT NULL,
  `description` longtext NOT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_app_size_type`
--

INSERT INTO `product_app_size_type` (`id`, `created_at`, `name`, `abbreviation`, `description`, `created_by_id`) VALUES
(1, '2021-06-26 02:53:57.803969', 'Ширхэг', 'ш', 'Ширхэгээр тоологдох бараа', 1),
(2, '2021-06-26 02:54:48.346402', 'Грамм', 'гр', 'Граммаар тоологдох бараа', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_app_store`
--

CREATE TABLE `product_app_store` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `store_info` longtext DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `structure_app_client`
--

CREATE TABLE `structure_app_client` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `free` tinyint(1) NOT NULL,
  `minibarFull` tinyint(1) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `division_id` int(11) NOT NULL,
  `clean` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `structure_app_client`
--

INSERT INTO `structure_app_client` (`id`, `created_at`, `number`, `description`, `free`, `minibarFull`, `created_by_id`, `division_id`, `clean`) VALUES
(1, '2020-06-20 07:47:53.009802', 201, '201 өрөө', 0, 1, 1, 3, 1),
(2, '2020-06-20 07:47:53.018296', 202, '202 өрөө', 0, 1, 1, 3, 1),
(3, '2020-06-20 07:47:53.025814', 203, '203 өрөө', 0, 1, 1, 3, 1),
(4, '2020-06-20 07:47:53.033821', 204, '204 өрөө', 1, 1, 1, 3, 1),
(5, '2020-06-20 07:47:53.039483', 205, '205 өрөө', 0, 1, 1, 3, 1),
(6, '2020-06-20 07:47:53.046489', 207, '207 өрөө', 0, 1, 1, 3, 1),
(7, '2020-06-20 07:47:53.053496', 301, '301 өрөө', 0, 1, 1, 3, 1),
(8, '2020-06-20 07:47:53.060798', 302, '302 өрөө', 1, 1, 1, 3, 1),
(9, '2020-06-20 07:47:53.067331', 303, '303 өрөө', 0, 1, 1, 3, 1),
(10, '2020-06-20 07:47:53.082201', 304, '304 өрөө', 0, 1, 1, 3, 1),
(11, '2020-06-20 07:47:53.088212', 305, '305 өрөө', 0, 1, 1, 3, 1),
(12, '2020-06-20 07:47:53.094607', 306, '306 өрөө', 1, 1, 1, 3, 1),
(13, '2020-06-20 07:47:53.102613', 307, '307 өрөө', 1, 1, 1, 3, 1),
(15, '2020-06-20 07:47:53.116234', 3000, 'Зочид буудлын ресефшин', 1, 1, 1, 3, 1),
(16, '2020-06-20 07:47:53.122290', 5000, 'Лоунж агуулах', 1, 1, 1, 5, 1),
(17, '2020-06-20 07:47:53.128296', 3001, 'Зочид буудал агуулах', 1, 1, 1, 3, 1),
(18, '2020-06-20 07:47:53.135307', 3002, 'Угаалгын газар', 1, 1, 1, 3, 1),
(19, '2020-06-20 07:47:53.149090', 5001, 'Лоунж бармен хэсэг', 1, 1, 1, 5, 1),
(20, '2020-06-20 07:47:53.149090', 1, 'Ширээ 1', 1, 1, 1, 5, 1),
(21, '2020-06-20 07:47:53.149090', 2, 'Ширээ 2', 1, 1, 1, 5, 1),
(22, '2020-06-20 07:47:53.149090', 3, 'Ширээ 3', 1, 1, 1, 5, 1),
(23, '2020-06-20 07:47:53.149090', 4, 'Ширээ 4', 1, 1, 1, 5, 1),
(24, '2020-06-20 07:47:53.149090', 5, 'Ширээ 5', 1, 1, 1, 5, 1),
(25, '2020-06-20 07:47:53.149090', 6, 'Ширээ 6', 1, 1, 1, 5, 1),
(26, '2020-06-20 07:47:53.149090', 7, 'Ширээ 7', 1, 1, 1, 5, 1),
(27, '2020-06-20 07:47:53.149090', 8, 'Ширээ 8', 1, 1, 1, 5, 1),
(28, '2020-06-20 07:47:53.149090', 9, 'Ширээ 9', 1, 1, 1, 5, 1),
(29, '2020-06-20 07:47:53.149090', 0, 'ХҮРГЭЛТ', 1, 1, 1, 5, 1),
(30, '2020-06-20 07:47:53.149090', 1, 'Караоке өрөө №1', 1, 1, 1, 6, 1),
(31, '2020-06-20 07:47:53.149090', 2, 'Караоке өрөө №2', 1, 1, 1, 6, 1),
(32, '2020-06-20 07:47:53.149090', 3, 'Караоке өрөө №3', 1, 1, 1, 6, 1),
(33, '2020-06-20 07:47:53.149090', 4, 'Караоке өрөө №4', 1, 1, 1, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `structure_app_configuration_value`
--

CREATE TABLE `structure_app_configuration_value` (
  `id` int(11) NOT NULL,
  `program_name` varchar(255) DEFAULT NULL,
  `program_description` longtext DEFAULT NULL,
  `program_favicon_url` varchar(255) DEFAULT NULL,
  `program_logo_url` varchar(255) DEFAULT NULL,
  `noat_tax` int(11) DEFAULT NULL,
  `capital_city_tax` int(11) DEFAULT NULL,
  `hotel_deadline_time_of_dayService` varchar(2) DEFAULT NULL,
  `hotel_start_time_of_timeService` varchar(2) DEFAULT NULL,
  `hotel_deadline_time_of_timeService` varchar(2) DEFAULT NULL,
  `hotel_minimum_time_of_timeService` varchar(2) DEFAULT NULL,
  `hotel_must_leave_time` varchar(2) DEFAULT NULL,
  `kitchen_bill_number` int(11) NOT NULL,
  `district_code` int(11) DEFAULT NULL,
  `bill_id_suffix` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `structure_app_configuration_value`
--

INSERT INTO `structure_app_configuration_value` (`id`, `program_name`, `program_description`, `program_favicon_url`, `program_logo_url`, `noat_tax`, `capital_city_tax`, `hotel_deadline_time_of_dayService`, `hotel_start_time_of_timeService`, `hotel_deadline_time_of_timeService`, `hotel_minimum_time_of_timeService`, `hotel_must_leave_time`, `kitchen_bill_number`, `district_code`, `bill_id_suffix`) VALUES
(1, 'Tesoro Center PRO', 'Гүн Арвижих Эрдэнэс ХХК-ий Тэсоро төвийн үйл ажиллагаанд ашиглагдах үйлчилгээний болон санхүүгийн програм. Энэхүү програм нь тухайн компаний өмч бөгөөд хуулбарлан ашиглахыг хориглоно!', 'dist/default/favicon.ico', 'dist/default/logo.png', 10, 0, '0', '0', '0', '0', '0', 3, 20, 100066);

-- --------------------------------------------------------

--
-- Table structure for table `structure_app_customer`
--

CREATE TABLE `structure_app_customer` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `register` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `workname` varchar(255) DEFAULT NULL,
  `workaddress` varchar(255) DEFAULT NULL,
  `mobile` int(11) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `discount_rate` int(11) DEFAULT NULL,
  `information` longtext DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `structure_app_customer`
--

INSERT INTO `structure_app_customer` (`id`, `created_at`, `lastname`, `firstname`, `register`, `address`, `address2`, `workname`, `workaddress`, `mobile`, `phone`, `email`, `discount_rate`, `information`, `created_by_id`, `user_id`) VALUES
(9, '2021-06-30 09:14:44.559375', NULL, '', '', '', '', '', '', 99225096, 0, '0', 0, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `structure_app_division`
--

CREATE TABLE `structure_app_division` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `erembe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `structure_app_division`
--

INSERT INTO `structure_app_division` (`id`, `created_at`, `name`, `description`, `created_by_id`, `erembe`) VALUES
(1, '2020-06-20 07:47:52.921963', 'Оффис', 'Оффис', 1, 6),
(2, '2020-06-20 07:47:52.954933', 'Гал тогоо', 'Гал тогоо', 1, 7),
(3, '2020-06-20 07:47:52.962027', 'Зочид буудал', 'Зочид буудал', 1, 3),
(4, '2020-06-20 07:47:52.968033', 'Ресторан', 'Ресторан', 1, 2),
(5, '2020-06-20 07:47:52.973181', 'Лоунж', 'Лоунж', 1, 1),
(6, '2020-06-20 07:47:52.978783', 'Караоке', 'Караоке', 1, 4),
(7, '2020-06-20 07:47:52.986780', 'Саун', 'Саун', 1, 5),
(8, '2020-06-20 07:47:52.991785', 'Агуулах', 'Агуулах', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `structure_app_shift_work`
--

CREATE TABLE `structure_app_shift_work` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `worker_confirm` tinyint(1) NOT NULL,
  `controller_confirm` tinyint(1) NOT NULL,
  `finished` tinyint(1) NOT NULL,
  `controller_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `division_id` int(11) NOT NULL,
  `worker_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `structure_app_shift_work`
--

INSERT INTO `structure_app_shift_work` (`id`, `created_at`, `worker_confirm`, `controller_confirm`, `finished`, `controller_id`, `created_by_id`, `division_id`, `worker_id`) VALUES
(45, NULL, 0, 0, 1, 1, 1, 5, 2),
(46, '2023-02-09 13:22:32.962011', 1, 0, 0, NULL, 1, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `structure_app_user_profile`
--

CREATE TABLE `structure_app_user_profile` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `register` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `mobile` int(11) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `information` longtext DEFAULT NULL,
  `who_are` varchar(10) DEFAULT NULL,
  `near_people_name` varchar(30) DEFAULT NULL,
  `near_people_mobile` int(11) DEFAULT NULL,
  `near_people_address` varchar(255) DEFAULT NULL,
  `school1` varchar(100) NOT NULL,
  `school2` varchar(100) NOT NULL,
  `school3` varchar(100) NOT NULL,
  `citizen_identity_card_copy` tinyint(1) NOT NULL,
  `white_card_of_hospital` tinyint(1) NOT NULL,
  `number_of_white_card` varchar(30) DEFAULT NULL,
  `social_security_book` tinyint(1) NOT NULL,
  `number_of_social_security_book` varchar(30) DEFAULT NULL,
  `health_book` tinyint(1) NOT NULL,
  `number_of_health_book` varchar(30) DEFAULT NULL,
  `first_contract` tinyint(1) NOT NULL,
  `number_of_first_contract` varchar(30) DEFAULT NULL,
  `second_contract` tinyint(1) NOT NULL,
  `number_of_second_contract` varchar(30) DEFAULT NULL,
  `first_salary` bigint(20) DEFAULT NULL,
  `second_salary` bigint(20) DEFAULT NULL,
  `bank_name` varchar(30) DEFAULT NULL,
  `account_of_bank` bigint(20) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_divisions`
--
ALTER TABLE `auth_user_divisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_divisions_division_id_user_id_81068b77_uniq` (`division_id`,`user_id`),
  ADD KEY `auth_user_divisions_user_id_3147b0b1_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `financial_app_budget`
--
ALTER TABLE `financial_app_budget`
  ADD PRIMARY KEY (`id`),
  ADD KEY `financial_app_budget_budget_type_id_52e9422f_fk_financial` (`budget_type_id`),
  ADD KEY `financial_app_budget_coordinator_id_4035d2a0_fk_auth_user_id` (`coordinator_id`),
  ADD KEY `financial_app_budget_created_by_id_c407d741_fk_auth_user_id` (`created_by_id`),
  ADD KEY `financial_app_budget_updated_by_id_83e71bca_fk_auth_user_id` (`updated_by_id`);

--
-- Indexes for table `financial_app_budget_type`
--
ALTER TABLE `financial_app_budget_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `financial_app_budget_type_created_by_id_4489ffd8_fk_auth_user_id` (`created_by_id`);

--
-- Indexes for table `financial_app_currency`
--
ALTER TABLE `financial_app_currency`
  ADD PRIMARY KEY (`id`),
  ADD KEY `financial_app_currency_created_by_id_7d85ca1c_fk_auth_user_id` (`created_by_id`);

--
-- Indexes for table `financial_app_investment`
--
ALTER TABLE `financial_app_investment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `financial_app_investment_created_by_id_2b2535c8_fk_auth_user_id` (`created_by_id`);

--
-- Indexes for table `financial_app_loan`
--
ALTER TABLE `financial_app_loan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `financial_app_loan_created_by_id_dd9b720c_fk_auth_user_id` (`created_by_id`);

--
-- Indexes for table `financial_app_money_transfer`
--
ALTER TABLE `financial_app_money_transfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `financial_app_money__bill_id_f7a288ba_fk_payment_a` (`bill_id`),
  ADD KEY `financial_app_money__created_by_id_bf210879_fk_auth_user` (`created_by_id`),
  ADD KEY `financial_app_money__currency_id_a64e54c9_fk_financial` (`currency_id`),
  ADD KEY `financial_app_money__customer_id_ee9bc234_fk_structure` (`customer_id`),
  ADD KEY `financial_app_money__division_id_3e339b4d_fk_structure` (`division_id`),
  ADD KEY `financial_app_money__fr_budget_id_f38d3c6f_fk_financial` (`fr_budget_id`),
  ADD KEY `financial_app_money__fr_investment_id_12cb331a_fk_financial` (`fr_investment_id`),
  ADD KEY `financial_app_money__fr_loan_id_1cab29c2_fk_financial` (`fr_loan_id`),
  ADD KEY `financial_app_money_transfer_fr_user_id_8e2da13f_fk_auth_user_id` (`fr_user_id`),
  ADD KEY `financial_app_money__fr_wallet_id_8a0ec13a_fk_financial` (`fr_wallet_id`),
  ADD KEY `financial_app_money__money_transfer_type__6a8f8643_fk_financial` (`money_transfer_type_id`),
  ADD KEY `financial_app_money__payment_id_ca3b1657_fk_payment_a` (`payment_id`),
  ADD KEY `financial_app_money__to_budget_id_6f1bd553_fk_financial` (`to_budget_id`),
  ADD KEY `financial_app_money__to_investment_id_5ae94ff8_fk_financial` (`to_investment_id`),
  ADD KEY `financial_app_money__to_loan_id_2a6a069a_fk_financial` (`to_loan_id`),
  ADD KEY `financial_app_money_transfer_to_user_id_140df557_fk_auth_user_id` (`to_user_id`),
  ADD KEY `financial_app_money__to_wallet_id_86a617b8_fk_financial` (`to_wallet_id`),
  ADD KEY `financial_app_money__updated_by_id_6dc4ccfd_fk_auth_user` (`updated_by_id`),
  ADD KEY `financial_app_money__shift_work_id_51bf611f_fk_structure` (`shift_work_id`);

--
-- Indexes for table `financial_app_money_transfer_type`
--
ALTER TABLE `financial_app_money_transfer_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `financial_app_money__created_by_id_98f56baf_fk_auth_user` (`created_by_id`);

--
-- Indexes for table `financial_app_wallet`
--
ALTER TABLE `financial_app_wallet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `financial_app_wallet_created_by_id_65ea1d17_fk_auth_user_id` (`created_by_id`),
  ADD KEY `financial_app_wallet_division_id_503084c8_fk_structure` (`division_id`),
  ADD KEY `financial_app_wallet_owner_id_5c684ad9_fk_auth_user_id` (`owner_id`),
  ADD KEY `financial_app_wallet_parent_id_13c91249_fk_financial` (`parent_id`);

--
-- Indexes for table `hotel_hotel_client_item`
--
ALTER TABLE `hotel_hotel_client_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel_hotel_client_i_client_id_a1d0f045_fk_structure` (`client_id`),
  ADD KEY `hotel_hotel_client_i_product_id_116d2103_fk_product_a` (`product_id`);

--
-- Indexes for table `hotel_hotel_client_item_eelj`
--
ALTER TABLE `hotel_hotel_client_item_eelj`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel_hotel_client_i_client_id_ddce5c0d_fk_structure` (`client_id`),
  ADD KEY `hotel_hotel_client_i_product_id_48626285_fk_product_a` (`product_id`);

--
-- Indexes for table `hotel_hotel_client_log`
--
ALTER TABLE `hotel_hotel_client_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel_hotel_client_l_client_id_796e134c_fk_structure` (`client_id`);

--
-- Indexes for table `notification_notification`
--
ALTER TABLE `notification_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_notification_user_id_e9d6f5f4_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `payment_app_bill`
--
ALTER TABLE `payment_app_bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_app_bill_client_id_324f3af6_fk_structure_app_client_id` (`client_id`),
  ADD KEY `payment_app_bill_created_by_id_05666608_fk_auth_user_id` (`created_by_id`),
  ADD KEY `payment_app_bill_customer_id_b03aa484_fk_structure` (`customer_id`),
  ADD KEY `payment_app_bill_division_id_b6058138_fk_structure` (`division_id`),
  ADD KEY `payment_app_bill_order_id_e712c320_fk_payment_app_order_id` (`order_id`),
  ADD KEY `payment_app_bill_updated_by_id_8886f78b_fk_auth_user_id` (`updated_by_id`);

--
-- Indexes for table `payment_app_order`
--
ALTER TABLE `payment_app_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_app_order_client_id_4aef7351_fk_structure_app_client_id` (`client_id`),
  ADD KEY `payment_app_order_created_by_id_3084aabf_fk_auth_user_id` (`created_by_id`),
  ADD KEY `payment_app_order_customer_id_faf82302_fk_structure` (`customer_id`),
  ADD KEY `payment_app_order_division_id_c69aeecd_fk_structure` (`division_id`),
  ADD KEY `payment_app_order_shift_work_id_5d977164_fk_structure` (`shift_work_id`),
  ADD KEY `payment_app_order_updated_by_id_09096fb7_fk_auth_user_id` (`updated_by_id`),
  ADD KEY `payment_app_order_worker_id_d7f77905_fk_auth_user_id` (`worker_id`),
  ADD KEY `payment_app_order_discount_by_id_0448804e_fk_auth_user_id` (`discount_by_id`);

--
-- Indexes for table `payment_app_order_detial`
--
ALTER TABLE `payment_app_order_detial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_app_order_de_client_id_80f0166d_fk_structure` (`client_id`),
  ADD KEY `payment_app_order_detial_created_by_id_f9327120_fk_auth_user_id` (`created_by_id`),
  ADD KEY `payment_app_order_de_fr_client_id_d1ae850c_fk_structure` (`fr_client_id`),
  ADD KEY `payment_app_order_de_order_id_222c00a6_fk_payment_a` (`order_id`),
  ADD KEY `payment_app_order_de_product_id_e525e18a_fk_product_a` (`product_id`),
  ADD KEY `payment_app_order_de_shift_work_id_1bc5774f_fk_structure` (`shift_work_id`),
  ADD KEY `payment_app_order_detial_updated_by_id_19873e2a_fk_auth_user_id` (`updated_by_id`);

--
-- Indexes for table `payment_app_order_payments`
--
ALTER TABLE `payment_app_order_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_app_order_pa_created_by_id_51392a18_fk_auth_user` (`created_by_id`),
  ADD KEY `payment_app_order_pa_order_id_32a61e1c_fk_payment_a` (`order_id`),
  ADD KEY `payment_app_order_pa_payment_id_6c07d4a6_fk_payment_a` (`payment_id`),
  ADD KEY `payment_app_order_pa_updated_by_id_bdc821a3_fk_auth_user` (`updated_by_id`);

--
-- Indexes for table `payment_app_payment`
--
ALTER TABLE `payment_app_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_app_payment_confirmed_by_id_be1c3f1b_fk_auth_user_id` (`confirmed_by_id`),
  ADD KEY `payment_app_payment_created_by_id_0d702b01_fk_auth_user_id` (`created_by_id`),
  ADD KEY `payment_app_payment_shift_work_id_8be6adf8_fk_structure` (`shift_work_id`),
  ADD KEY `payment_app_payment_updated_by_id_3c71592e_fk_auth_user_id` (`updated_by_id`),
  ADD KEY `payment_app_payment_wallet_id_28a46139_fk_financial` (`wallet_id`),
  ADD KEY `payment_app_payment_division_id_613184a6_fk_structure` (`division_id`);

--
-- Indexes for table `payment_app_pos_account_consolidation`
--
ALTER TABLE `payment_app_pos_account_consolidation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_app_pos_acco_account_id_38596ffe_fk_financial` (`account_id`),
  ADD KEY `payment_app_pos_acco_confirmed_by_id_cb29c4db_fk_auth_user` (`confirmed_by_id`),
  ADD KEY `payment_app_pos_acco_created_by_id_5a2d4e7e_fk_auth_user` (`created_by_id`),
  ADD KEY `payment_app_pos_acco_division_id_1ab6db9a_fk_structure` (`division_id`),
  ADD KEY `payment_app_pos_acco_person_of_charge_id_d1a46c2e_fk_auth_user` (`person_of_charge_id`),
  ADD KEY `payment_app_pos_acco_shift_work_id_5ccbd424_fk_structure` (`shift_work_id`),
  ADD KEY `payment_app_pos_acco_updated_by_id_5497a646_fk_auth_user` (`updated_by_id`);

--
-- Indexes for table `product_app_basic_asset`
--
ALTER TABLE `product_app_basic_asset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_app_basic_asset_created_by_id_4a946f2b_fk_auth_user_id` (`created_by_id`),
  ADD KEY `product_app_basic_as_division_id_7e98028c_fk_structure` (`division_id`),
  ADD KEY `product_app_basic_asset_updated_by_id_53139eb5_fk_auth_user_id` (`updated_by_id`);

--
-- Indexes for table `product_app_basic_asset_count`
--
ALTER TABLE `product_app_basic_asset_count`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_app_basic_as_basic_asset_id_5d7668dc_fk_product_a` (`basic_asset_id`),
  ADD KEY `product_app_basic_as_controlled_by_id_d96a61ec_fk_auth_user` (`controlled_by_id`),
  ADD KEY `product_app_basic_as_counted_by_id_388fe56b_fk_auth_user` (`counted_by_id`),
  ADD KEY `product_app_basic_as_created_by_id_fd9fcee4_fk_auth_user` (`created_by_id`),
  ADD KEY `product_app_basic_as_updated_by_id_ecca7d87_fk_auth_user` (`updated_by_id`);

--
-- Indexes for table `product_app_broken_item`
--
ALTER TABLE `product_app_broken_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_app_broken_i_basic_asset_id_cf88020c_fk_product_a` (`basic_asset_id`),
  ADD KEY `product_app_broken_i_commodity_id_01764d4d_fk_product_a` (`commodity_id`),
  ADD KEY `product_app_broken_item_created_by_id_6f3ea284_fk_auth_user_id` (`created_by_id`),
  ADD KEY `product_app_broken_i_money_transfer_id_cc49be86_fk_financial` (`money_transfer_id`),
  ADD KEY `product_app_broken_i_product_id_3d9a9dd7_fk_product_a` (`product_id`),
  ADD KEY `product_app_broken_i_size_type_id_9cdabc9d_fk_product_a` (`size_type_id`),
  ADD KEY `product_app_broken_item_updated_by_id_1396bab5_fk_auth_user_id` (`updated_by_id`);

--
-- Indexes for table `product_app_commodity`
--
ALTER TABLE `product_app_commodity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_app_commodity_created_by_id_de0d2145_fk_auth_user_id` (`created_by_id`),
  ADD KEY `product_app_commodit_size_type_id_cbd392a1_fk_product_a` (`size_type_id`);

--
-- Indexes for table `product_app_commodity_categories`
--
ALTER TABLE `product_app_commodity_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_app_commodity_ca_commodity_id_commodity_c_f39fd883_uniq` (`commodity_id`,`commodity_category_id`),
  ADD KEY `product_app_commodit_commodity_category_i_1b6bab67_fk_product_a` (`commodity_category_id`);

--
-- Indexes for table `product_app_commodity_category`
--
ALTER TABLE `product_app_commodity_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_app_commodit_created_by_id_b5cc62b6_fk_auth_user` (`created_by_id`),
  ADD KEY `product_app_commodit_parent_id_df5c4e79_fk_product_a` (`parent_id`);

--
-- Indexes for table `product_app_division_commodity_categories`
--
ALTER TABLE `product_app_division_commodity_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_app_division_com_commodity_category_id_di_558e076e_uniq` (`commodity_category_id`,`division_id`),
  ADD KEY `product_app_division_division_id_98f9d28a_fk_structure` (`division_id`);

--
-- Indexes for table `product_app_ingredient`
--
ALTER TABLE `product_app_ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_app_ingredie_product_id_805751b3_fk_product_a` (`product_id`),
  ADD KEY `product_app_ingredie_size_type_id_e3982889_fk_product_a` (`size_type_id`),
  ADD KEY `product_app_ingredient_created_by_id_f34eb4d1_fk_auth_user_id` (`created_by_id`),
  ADD KEY `product_app_ingredient_commodity_id_59a7adca` (`commodity_id`);

--
-- Indexes for table `product_app_ingredient_product`
--
ALTER TABLE `product_app_ingredient_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_app_ingredie_commodity_id_be170202_fk_product_a` (`commodity_id`),
  ADD KEY `product_app_ingredie_created_by_id_989046ea_fk_auth_user` (`created_by_id`),
  ADD KEY `product_app_ingredie_product_id_b48e1bca_fk_product_a` (`product_id`);

--
-- Indexes for table `product_app_item_balance`
--
ALTER TABLE `product_app_item_balance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_app_item_bal_client_id_719d7b38_fk_structure` (`client_id`),
  ADD KEY `product_app_item_bal_commodity_id_8fd3b22a_fk_product_a` (`commodity_id`),
  ADD KEY `product_app_item_balance_created_by_id_6047e5ca_fk_auth_user_id` (`created_by_id`),
  ADD KEY `product_app_item_bal_division_id_65876111_fk_structure` (`division_id`),
  ADD KEY `product_app_item_bal_product_id_ed1397c8_fk_product_a` (`product_id`),
  ADD KEY `product_app_item_balance_updated_by_id_8b911981_fk_auth_user_id` (`updated_by_id`),
  ADD KEY `product_app_item_balance_user_id_df111a6e_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `product_app_item_balance_log`
--
ALTER TABLE `product_app_item_balance_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_app_item_bal_client_id_22be3941_fk_structure` (`client_id`),
  ADD KEY `product_app_item_bal_commodity_id_0bafa465_fk_product_a` (`commodity_id`),
  ADD KEY `product_app_item_bal_created_by_id_49a8b528_fk_auth_user` (`created_by_id`),
  ADD KEY `product_app_item_bal_division_id_e806fbfd_fk_structure` (`division_id`),
  ADD KEY `product_app_item_bal_product_id_ea7a46a9_fk_product_a` (`product_id`),
  ADD KEY `product_app_item_bal_shift_work_id_3ac41645_fk_structure` (`shift_work_id`),
  ADD KEY `product_app_item_bal_updated_by_id_05e147b0_fk_auth_user` (`updated_by_id`),
  ADD KEY `product_app_item_balance_log_user_id_b095ae0a_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `product_app_item_transfer`
--
ALTER TABLE `product_app_item_transfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_app_item_tra_budget_id_ddf5e163_fk_financial` (`budget_id`),
  ADD KEY `product_app_item_tra_commodity_id_2ed02fa5_fk_product_a` (`commodity_id`),
  ADD KEY `product_app_item_tra_confirmed_by_id_bd6cbb93_fk_auth_user` (`confirmed_by_id`),
  ADD KEY `product_app_item_transfer_created_by_id_33594e28_fk_auth_user_id` (`created_by_id`),
  ADD KEY `product_app_item_tra_fr_client_id_2bdabba4_fk_structure` (`fr_client_id`),
  ADD KEY `product_app_item_tra_fr_division_id_bfb5b4ce_fk_structure` (`fr_division_id`),
  ADD KEY `product_app_item_transfer_fr_user_id_ceac7767_fk_auth_user_id` (`fr_user_id`),
  ADD KEY `product_app_item_tra_item_transfer_type_i_d36f5b24_fk_product_a` (`item_transfer_type_id`),
  ADD KEY `product_app_item_tra_order_detial_id_18c41d9b_fk_payment_a` (`order_detial_id`),
  ADD KEY `product_app_item_tra_product_id_4fce5964_fk_product_a` (`product_id`),
  ADD KEY `product_app_item_tra_store_id_0f6f2999_fk_product_a` (`store_id`),
  ADD KEY `product_app_item_tra_to_client_id_45d339e6_fk_structure` (`to_client_id`),
  ADD KEY `product_app_item_tra_to_division_id_b23aa58e_fk_structure` (`to_division_id`),
  ADD KEY `product_app_item_tra_to_product_id_5df4492a_fk_product_a` (`to_product_id`),
  ADD KEY `product_app_item_transfer_to_user_id_fe45c7e7_fk_auth_user_id` (`to_user_id`),
  ADD KEY `product_app_item_transfer_updated_by_id_b81eb934_fk_auth_user_id` (`updated_by_id`);

--
-- Indexes for table `product_app_item_transfer_type`
--
ALTER TABLE `product_app_item_transfer_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_app_item_tra_created_by_id_26676363_fk_auth_user` (`created_by_id`);

--
-- Indexes for table `product_app_product`
--
ALTER TABLE `product_app_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_app_product_client_id_d752b4c3_fk_structure` (`client_id`),
  ADD KEY `product_app_product_created_by_id_d7b45000_fk_auth_user_id` (`created_by_id`),
  ADD KEY `product_app_product_division_id_b57c1dfd_fk_structure` (`division_id`);

--
-- Indexes for table `product_app_product_categories`
--
ALTER TABLE `product_app_product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_app_product_cate_product_id_product_categ_41def102_uniq` (`product_id`,`product_category_id`),
  ADD KEY `product_app_product__product_category_id_f89c95ef_fk_product_a` (`product_category_id`);

--
-- Indexes for table `product_app_product_category`
--
ALTER TABLE `product_app_product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_app_product__created_by_id_b674c56a_fk_auth_user` (`created_by_id`),
  ADD KEY `product_app_product__parent_id_ce8111a0_fk_product_a` (`parent_id`);

--
-- Indexes for table `product_app_size_type`
--
ALTER TABLE `product_app_size_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_app_size_type_created_by_id_ab32afb8_fk_auth_user_id` (`created_by_id`);

--
-- Indexes for table `product_app_store`
--
ALTER TABLE `product_app_store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_app_store_created_by_id_4d6f8afd_fk_auth_user_id` (`created_by_id`);

--
-- Indexes for table `structure_app_client`
--
ALTER TABLE `structure_app_client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `structure_app_client_division_id_number_d6a8cac4_uniq` (`division_id`,`number`),
  ADD KEY `structure_app_client_created_by_id_ebe69d61_fk_auth_user_id` (`created_by_id`);

--
-- Indexes for table `structure_app_configuration_value`
--
ALTER TABLE `structure_app_configuration_value`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `structure_app_customer`
--
ALTER TABLE `structure_app_customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `register` (`register`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `structure_app_customer_created_by_id_1f8e4c95_fk_auth_user_id` (`created_by_id`);

--
-- Indexes for table `structure_app_division`
--
ALTER TABLE `structure_app_division`
  ADD PRIMARY KEY (`id`),
  ADD KEY `structure_app_division_created_by_id_71e53f32_fk_auth_user_id` (`created_by_id`);

--
-- Indexes for table `structure_app_shift_work`
--
ALTER TABLE `structure_app_shift_work`
  ADD PRIMARY KEY (`id`),
  ADD KEY `structure_app_shift_work_created_by_id_bcaab5ec_fk_auth_user_id` (`created_by_id`),
  ADD KEY `structure_app_shift__division_id_0c35644b_fk_structure` (`division_id`),
  ADD KEY `structure_app_shift_work_worker_id_3b016131_fk_auth_user_id` (`worker_id`),
  ADD KEY `structure_app_shift_work_controller_id_7f6f0958_fk_auth_user_id` (`controller_id`);

--
-- Indexes for table `structure_app_user_profile`
--
ALTER TABLE `structure_app_user_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `structure_app_user_profile_register_mobile_d97e105b_uniq` (`register`,`mobile`),
  ADD KEY `structure_app_user_p_created_by_id_38365d24_fk_auth_user` (`created_by_id`),
  ADD KEY `structure_app_user_p_updated_by_id_d2a2bfa8_fk_auth_user` (`updated_by_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `auth_user_divisions`
--
ALTER TABLE `auth_user_divisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=775;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `financial_app_budget`
--
ALTER TABLE `financial_app_budget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `financial_app_budget_type`
--
ALTER TABLE `financial_app_budget_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `financial_app_currency`
--
ALTER TABLE `financial_app_currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `financial_app_investment`
--
ALTER TABLE `financial_app_investment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `financial_app_loan`
--
ALTER TABLE `financial_app_loan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `financial_app_money_transfer`
--
ALTER TABLE `financial_app_money_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `financial_app_money_transfer_type`
--
ALTER TABLE `financial_app_money_transfer_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `financial_app_wallet`
--
ALTER TABLE `financial_app_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hotel_hotel_client_item`
--
ALTER TABLE `hotel_hotel_client_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hotel_hotel_client_item_eelj`
--
ALTER TABLE `hotel_hotel_client_item_eelj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotel_hotel_client_log`
--
ALTER TABLE `hotel_hotel_client_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `notification_notification`
--
ALTER TABLE `notification_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_app_bill`
--
ALTER TABLE `payment_app_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `payment_app_order`
--
ALTER TABLE `payment_app_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `payment_app_order_detial`
--
ALTER TABLE `payment_app_order_detial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `payment_app_order_payments`
--
ALTER TABLE `payment_app_order_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `payment_app_payment`
--
ALTER TABLE `payment_app_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `payment_app_pos_account_consolidation`
--
ALTER TABLE `payment_app_pos_account_consolidation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_app_basic_asset`
--
ALTER TABLE `product_app_basic_asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `product_app_basic_asset_count`
--
ALTER TABLE `product_app_basic_asset_count`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `product_app_broken_item`
--
ALTER TABLE `product_app_broken_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_app_commodity`
--
ALTER TABLE `product_app_commodity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `product_app_commodity_categories`
--
ALTER TABLE `product_app_commodity_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `product_app_commodity_category`
--
ALTER TABLE `product_app_commodity_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_app_division_commodity_categories`
--
ALTER TABLE `product_app_division_commodity_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_app_ingredient`
--
ALTER TABLE `product_app_ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `product_app_ingredient_product`
--
ALTER TABLE `product_app_ingredient_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_app_item_balance`
--
ALTER TABLE `product_app_item_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `product_app_item_balance_log`
--
ALTER TABLE `product_app_item_balance_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1062;

--
-- AUTO_INCREMENT for table `product_app_item_transfer`
--
ALTER TABLE `product_app_item_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=834;

--
-- AUTO_INCREMENT for table `product_app_item_transfer_type`
--
ALTER TABLE `product_app_item_transfer_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_app_product`
--
ALTER TABLE `product_app_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT for table `product_app_product_categories`
--
ALTER TABLE `product_app_product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=730;

--
-- AUTO_INCREMENT for table `product_app_product_category`
--
ALTER TABLE `product_app_product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `product_app_size_type`
--
ALTER TABLE `product_app_size_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_app_store`
--
ALTER TABLE `product_app_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `structure_app_client`
--
ALTER TABLE `structure_app_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `structure_app_configuration_value`
--
ALTER TABLE `structure_app_configuration_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `structure_app_customer`
--
ALTER TABLE `structure_app_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `structure_app_division`
--
ALTER TABLE `structure_app_division`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `structure_app_shift_work`
--
ALTER TABLE `structure_app_shift_work`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `structure_app_user_profile`
--
ALTER TABLE `structure_app_user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_divisions`
--
ALTER TABLE `auth_user_divisions`
  ADD CONSTRAINT `auth_user_divisions_division_id_c82dad61_fk_structure` FOREIGN KEY (`division_id`) REFERENCES `structure_app_division` (`id`),
  ADD CONSTRAINT `auth_user_divisions_user_id_3147b0b1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `financial_app_budget`
--
ALTER TABLE `financial_app_budget`
  ADD CONSTRAINT `financial_app_budget_budget_type_id_52e9422f_fk_financial` FOREIGN KEY (`budget_type_id`) REFERENCES `financial_app_budget_type` (`id`),
  ADD CONSTRAINT `financial_app_budget_coordinator_id_4035d2a0_fk_auth_user_id` FOREIGN KEY (`coordinator_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `financial_app_budget_created_by_id_c407d741_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `financial_app_budget_updated_by_id_83e71bca_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `financial_app_budget_type`
--
ALTER TABLE `financial_app_budget_type`
  ADD CONSTRAINT `financial_app_budget_type_created_by_id_4489ffd8_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `financial_app_currency`
--
ALTER TABLE `financial_app_currency`
  ADD CONSTRAINT `financial_app_currency_created_by_id_7d85ca1c_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `financial_app_investment`
--
ALTER TABLE `financial_app_investment`
  ADD CONSTRAINT `financial_app_investment_created_by_id_2b2535c8_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `financial_app_loan`
--
ALTER TABLE `financial_app_loan`
  ADD CONSTRAINT `financial_app_loan_created_by_id_dd9b720c_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `financial_app_money_transfer`
--
ALTER TABLE `financial_app_money_transfer`
  ADD CONSTRAINT `financial_app_money__bill_id_f7a288ba_fk_payment_a` FOREIGN KEY (`bill_id`) REFERENCES `payment_app_bill` (`id`),
  ADD CONSTRAINT `financial_app_money__created_by_id_bf210879_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `financial_app_money__currency_id_a64e54c9_fk_financial` FOREIGN KEY (`currency_id`) REFERENCES `financial_app_currency` (`id`),
  ADD CONSTRAINT `financial_app_money__customer_id_ee9bc234_fk_structure` FOREIGN KEY (`customer_id`) REFERENCES `structure_app_customer` (`id`),
  ADD CONSTRAINT `financial_app_money__division_id_3e339b4d_fk_structure` FOREIGN KEY (`division_id`) REFERENCES `structure_app_division` (`id`),
  ADD CONSTRAINT `financial_app_money__fr_budget_id_f38d3c6f_fk_financial` FOREIGN KEY (`fr_budget_id`) REFERENCES `financial_app_budget` (`id`),
  ADD CONSTRAINT `financial_app_money__fr_investment_id_12cb331a_fk_financial` FOREIGN KEY (`fr_investment_id`) REFERENCES `financial_app_investment` (`id`),
  ADD CONSTRAINT `financial_app_money__fr_loan_id_1cab29c2_fk_financial` FOREIGN KEY (`fr_loan_id`) REFERENCES `financial_app_loan` (`id`),
  ADD CONSTRAINT `financial_app_money__fr_wallet_id_8a0ec13a_fk_financial` FOREIGN KEY (`fr_wallet_id`) REFERENCES `financial_app_wallet` (`id`),
  ADD CONSTRAINT `financial_app_money__money_transfer_type__6a8f8643_fk_financial` FOREIGN KEY (`money_transfer_type_id`) REFERENCES `financial_app_money_transfer_type` (`id`),
  ADD CONSTRAINT `financial_app_money__payment_id_ca3b1657_fk_payment_a` FOREIGN KEY (`payment_id`) REFERENCES `payment_app_payment` (`id`),
  ADD CONSTRAINT `financial_app_money__shift_work_id_51bf611f_fk_structure` FOREIGN KEY (`shift_work_id`) REFERENCES `structure_app_shift_work` (`id`),
  ADD CONSTRAINT `financial_app_money__to_budget_id_6f1bd553_fk_financial` FOREIGN KEY (`to_budget_id`) REFERENCES `financial_app_budget` (`id`),
  ADD CONSTRAINT `financial_app_money__to_investment_id_5ae94ff8_fk_financial` FOREIGN KEY (`to_investment_id`) REFERENCES `financial_app_investment` (`id`),
  ADD CONSTRAINT `financial_app_money__to_loan_id_2a6a069a_fk_financial` FOREIGN KEY (`to_loan_id`) REFERENCES `financial_app_loan` (`id`),
  ADD CONSTRAINT `financial_app_money__to_wallet_id_86a617b8_fk_financial` FOREIGN KEY (`to_wallet_id`) REFERENCES `financial_app_wallet` (`id`),
  ADD CONSTRAINT `financial_app_money__updated_by_id_6dc4ccfd_fk_auth_user` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `financial_app_money_transfer_fr_user_id_8e2da13f_fk_auth_user_id` FOREIGN KEY (`fr_user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `financial_app_money_transfer_to_user_id_140df557_fk_auth_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `financial_app_money_transfer_type`
--
ALTER TABLE `financial_app_money_transfer_type`
  ADD CONSTRAINT `financial_app_money__created_by_id_98f56baf_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `financial_app_wallet`
--
ALTER TABLE `financial_app_wallet`
  ADD CONSTRAINT `financial_app_wallet_created_by_id_65ea1d17_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `financial_app_wallet_division_id_503084c8_fk_structure` FOREIGN KEY (`division_id`) REFERENCES `structure_app_division` (`id`),
  ADD CONSTRAINT `financial_app_wallet_owner_id_5c684ad9_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `financial_app_wallet_parent_id_13c91249_fk_financial` FOREIGN KEY (`parent_id`) REFERENCES `financial_app_wallet` (`id`);

--
-- Constraints for table `hotel_hotel_client_item`
--
ALTER TABLE `hotel_hotel_client_item`
  ADD CONSTRAINT `hotel_hotel_client_i_client_id_a1d0f045_fk_structure` FOREIGN KEY (`client_id`) REFERENCES `structure_app_client` (`id`),
  ADD CONSTRAINT `hotel_hotel_client_i_product_id_116d2103_fk_product_a` FOREIGN KEY (`product_id`) REFERENCES `product_app_product` (`id`);

--
-- Constraints for table `hotel_hotel_client_item_eelj`
--
ALTER TABLE `hotel_hotel_client_item_eelj`
  ADD CONSTRAINT `hotel_hotel_client_i_client_id_ddce5c0d_fk_structure` FOREIGN KEY (`client_id`) REFERENCES `structure_app_client` (`id`),
  ADD CONSTRAINT `hotel_hotel_client_i_product_id_48626285_fk_product_a` FOREIGN KEY (`product_id`) REFERENCES `product_app_product` (`id`);

--
-- Constraints for table `hotel_hotel_client_log`
--
ALTER TABLE `hotel_hotel_client_log`
  ADD CONSTRAINT `hotel_hotel_client_l_client_id_796e134c_fk_structure` FOREIGN KEY (`client_id`) REFERENCES `structure_app_client` (`id`);

--
-- Constraints for table `notification_notification`
--
ALTER TABLE `notification_notification`
  ADD CONSTRAINT `notification_notification_user_id_e9d6f5f4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `payment_app_bill`
--
ALTER TABLE `payment_app_bill`
  ADD CONSTRAINT `payment_app_bill_client_id_324f3af6_fk_structure_app_client_id` FOREIGN KEY (`client_id`) REFERENCES `structure_app_client` (`id`),
  ADD CONSTRAINT `payment_app_bill_created_by_id_05666608_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `payment_app_bill_customer_id_b03aa484_fk_structure` FOREIGN KEY (`customer_id`) REFERENCES `structure_app_customer` (`id`),
  ADD CONSTRAINT `payment_app_bill_division_id_b6058138_fk_structure` FOREIGN KEY (`division_id`) REFERENCES `structure_app_division` (`id`),
  ADD CONSTRAINT `payment_app_bill_order_id_e712c320_fk_payment_app_order_id` FOREIGN KEY (`order_id`) REFERENCES `payment_app_order` (`id`),
  ADD CONSTRAINT `payment_app_bill_updated_by_id_8886f78b_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `payment_app_order`
--
ALTER TABLE `payment_app_order`
  ADD CONSTRAINT `payment_app_order_client_id_4aef7351_fk_structure_app_client_id` FOREIGN KEY (`client_id`) REFERENCES `structure_app_client` (`id`),
  ADD CONSTRAINT `payment_app_order_created_by_id_3084aabf_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `payment_app_order_customer_id_faf82302_fk_structure` FOREIGN KEY (`customer_id`) REFERENCES `structure_app_customer` (`id`),
  ADD CONSTRAINT `payment_app_order_discount_by_id_0448804e_fk_auth_user_id` FOREIGN KEY (`discount_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `payment_app_order_division_id_c69aeecd_fk_structure` FOREIGN KEY (`division_id`) REFERENCES `structure_app_division` (`id`),
  ADD CONSTRAINT `payment_app_order_shift_work_id_5d977164_fk_structure` FOREIGN KEY (`shift_work_id`) REFERENCES `structure_app_shift_work` (`id`),
  ADD CONSTRAINT `payment_app_order_updated_by_id_09096fb7_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `payment_app_order_worker_id_d7f77905_fk_auth_user_id` FOREIGN KEY (`worker_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `payment_app_order_detial`
--
ALTER TABLE `payment_app_order_detial`
  ADD CONSTRAINT `payment_app_order_de_client_id_80f0166d_fk_structure` FOREIGN KEY (`client_id`) REFERENCES `structure_app_client` (`id`),
  ADD CONSTRAINT `payment_app_order_de_fr_client_id_d1ae850c_fk_structure` FOREIGN KEY (`fr_client_id`) REFERENCES `structure_app_client` (`id`),
  ADD CONSTRAINT `payment_app_order_de_order_id_222c00a6_fk_payment_a` FOREIGN KEY (`order_id`) REFERENCES `payment_app_order` (`id`),
  ADD CONSTRAINT `payment_app_order_de_product_id_e525e18a_fk_product_a` FOREIGN KEY (`product_id`) REFERENCES `product_app_product` (`id`),
  ADD CONSTRAINT `payment_app_order_de_shift_work_id_1bc5774f_fk_structure` FOREIGN KEY (`shift_work_id`) REFERENCES `structure_app_shift_work` (`id`),
  ADD CONSTRAINT `payment_app_order_detial_created_by_id_f9327120_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `payment_app_order_detial_updated_by_id_19873e2a_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `payment_app_order_payments`
--
ALTER TABLE `payment_app_order_payments`
  ADD CONSTRAINT `payment_app_order_pa_created_by_id_51392a18_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `payment_app_order_pa_order_id_32a61e1c_fk_payment_a` FOREIGN KEY (`order_id`) REFERENCES `payment_app_order` (`id`),
  ADD CONSTRAINT `payment_app_order_pa_payment_id_6c07d4a6_fk_payment_a` FOREIGN KEY (`payment_id`) REFERENCES `payment_app_payment` (`id`),
  ADD CONSTRAINT `payment_app_order_pa_updated_by_id_bdc821a3_fk_auth_user` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `payment_app_payment`
--
ALTER TABLE `payment_app_payment`
  ADD CONSTRAINT `payment_app_payment_confirmed_by_id_be1c3f1b_fk_auth_user_id` FOREIGN KEY (`confirmed_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `payment_app_payment_created_by_id_0d702b01_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `payment_app_payment_division_id_613184a6_fk_structure` FOREIGN KEY (`division_id`) REFERENCES `structure_app_division` (`id`),
  ADD CONSTRAINT `payment_app_payment_shift_work_id_8be6adf8_fk_structure` FOREIGN KEY (`shift_work_id`) REFERENCES `structure_app_shift_work` (`id`),
  ADD CONSTRAINT `payment_app_payment_updated_by_id_3c71592e_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `payment_app_payment_wallet_id_28a46139_fk_financial` FOREIGN KEY (`wallet_id`) REFERENCES `financial_app_wallet` (`id`);

--
-- Constraints for table `payment_app_pos_account_consolidation`
--
ALTER TABLE `payment_app_pos_account_consolidation`
  ADD CONSTRAINT `payment_app_pos_acco_account_id_38596ffe_fk_financial` FOREIGN KEY (`account_id`) REFERENCES `financial_app_wallet` (`id`),
  ADD CONSTRAINT `payment_app_pos_acco_confirmed_by_id_cb29c4db_fk_auth_user` FOREIGN KEY (`confirmed_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `payment_app_pos_acco_created_by_id_5a2d4e7e_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `payment_app_pos_acco_division_id_1ab6db9a_fk_structure` FOREIGN KEY (`division_id`) REFERENCES `structure_app_division` (`id`),
  ADD CONSTRAINT `payment_app_pos_acco_person_of_charge_id_d1a46c2e_fk_auth_user` FOREIGN KEY (`person_of_charge_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `payment_app_pos_acco_shift_work_id_5ccbd424_fk_structure` FOREIGN KEY (`shift_work_id`) REFERENCES `structure_app_shift_work` (`id`),
  ADD CONSTRAINT `payment_app_pos_acco_updated_by_id_5497a646_fk_auth_user` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `product_app_basic_asset`
--
ALTER TABLE `product_app_basic_asset`
  ADD CONSTRAINT `product_app_basic_as_division_id_7e98028c_fk_structure` FOREIGN KEY (`division_id`) REFERENCES `structure_app_division` (`id`),
  ADD CONSTRAINT `product_app_basic_asset_created_by_id_4a946f2b_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `product_app_basic_asset_updated_by_id_53139eb5_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `product_app_basic_asset_count`
--
ALTER TABLE `product_app_basic_asset_count`
  ADD CONSTRAINT `product_app_basic_as_basic_asset_id_5d7668dc_fk_product_a` FOREIGN KEY (`basic_asset_id`) REFERENCES `product_app_basic_asset` (`id`),
  ADD CONSTRAINT `product_app_basic_as_controlled_by_id_d96a61ec_fk_auth_user` FOREIGN KEY (`controlled_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `product_app_basic_as_counted_by_id_388fe56b_fk_auth_user` FOREIGN KEY (`counted_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `product_app_basic_as_created_by_id_fd9fcee4_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `product_app_basic_as_updated_by_id_ecca7d87_fk_auth_user` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `product_app_broken_item`
--
ALTER TABLE `product_app_broken_item`
  ADD CONSTRAINT `product_app_broken_i_basic_asset_id_cf88020c_fk_product_a` FOREIGN KEY (`basic_asset_id`) REFERENCES `product_app_basic_asset` (`id`),
  ADD CONSTRAINT `product_app_broken_i_commodity_id_01764d4d_fk_product_a` FOREIGN KEY (`commodity_id`) REFERENCES `product_app_commodity` (`id`),
  ADD CONSTRAINT `product_app_broken_i_money_transfer_id_cc49be86_fk_financial` FOREIGN KEY (`money_transfer_id`) REFERENCES `financial_app_money_transfer` (`id`),
  ADD CONSTRAINT `product_app_broken_i_product_id_3d9a9dd7_fk_product_a` FOREIGN KEY (`product_id`) REFERENCES `product_app_product` (`id`),
  ADD CONSTRAINT `product_app_broken_i_size_type_id_9cdabc9d_fk_product_a` FOREIGN KEY (`size_type_id`) REFERENCES `product_app_size_type` (`id`),
  ADD CONSTRAINT `product_app_broken_item_created_by_id_6f3ea284_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `product_app_broken_item_updated_by_id_1396bab5_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `product_app_commodity`
--
ALTER TABLE `product_app_commodity`
  ADD CONSTRAINT `product_app_commodit_size_type_id_cbd392a1_fk_product_a` FOREIGN KEY (`size_type_id`) REFERENCES `product_app_size_type` (`id`),
  ADD CONSTRAINT `product_app_commodity_created_by_id_de0d2145_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `product_app_commodity_categories`
--
ALTER TABLE `product_app_commodity_categories`
  ADD CONSTRAINT `product_app_commodit_commodity_category_i_1b6bab67_fk_product_a` FOREIGN KEY (`commodity_category_id`) REFERENCES `product_app_commodity_category` (`id`),
  ADD CONSTRAINT `product_app_commodit_commodity_id_17715b53_fk_product_a` FOREIGN KEY (`commodity_id`) REFERENCES `product_app_commodity` (`id`);

--
-- Constraints for table `product_app_commodity_category`
--
ALTER TABLE `product_app_commodity_category`
  ADD CONSTRAINT `product_app_commodit_created_by_id_b5cc62b6_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `product_app_commodit_parent_id_df5c4e79_fk_product_a` FOREIGN KEY (`parent_id`) REFERENCES `product_app_commodity_category` (`id`);

--
-- Constraints for table `product_app_division_commodity_categories`
--
ALTER TABLE `product_app_division_commodity_categories`
  ADD CONSTRAINT `product_app_division_commodity_category_i_5300db6d_fk_product_a` FOREIGN KEY (`commodity_category_id`) REFERENCES `product_app_commodity_category` (`id`),
  ADD CONSTRAINT `product_app_division_division_id_98f9d28a_fk_structure` FOREIGN KEY (`division_id`) REFERENCES `structure_app_division` (`id`);

--
-- Constraints for table `product_app_ingredient`
--
ALTER TABLE `product_app_ingredient`
  ADD CONSTRAINT `product_app_ingredie_commodity_id_59a7adca_fk_product_a` FOREIGN KEY (`commodity_id`) REFERENCES `product_app_commodity` (`id`),
  ADD CONSTRAINT `product_app_ingredie_product_id_805751b3_fk_product_a` FOREIGN KEY (`product_id`) REFERENCES `product_app_product` (`id`),
  ADD CONSTRAINT `product_app_ingredie_size_type_id_e3982889_fk_product_a` FOREIGN KEY (`size_type_id`) REFERENCES `product_app_size_type` (`id`),
  ADD CONSTRAINT `product_app_ingredient_created_by_id_f34eb4d1_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `product_app_ingredient_product`
--
ALTER TABLE `product_app_ingredient_product`
  ADD CONSTRAINT `product_app_ingredie_commodity_id_be170202_fk_product_a` FOREIGN KEY (`commodity_id`) REFERENCES `product_app_product` (`id`),
  ADD CONSTRAINT `product_app_ingredie_created_by_id_989046ea_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `product_app_ingredie_product_id_b48e1bca_fk_product_a` FOREIGN KEY (`product_id`) REFERENCES `product_app_product` (`id`);

--
-- Constraints for table `product_app_item_balance`
--
ALTER TABLE `product_app_item_balance`
  ADD CONSTRAINT `product_app_item_bal_client_id_719d7b38_fk_structure` FOREIGN KEY (`client_id`) REFERENCES `structure_app_client` (`id`),
  ADD CONSTRAINT `product_app_item_bal_commodity_id_8fd3b22a_fk_product_a` FOREIGN KEY (`commodity_id`) REFERENCES `product_app_commodity` (`id`),
  ADD CONSTRAINT `product_app_item_bal_division_id_65876111_fk_structure` FOREIGN KEY (`division_id`) REFERENCES `structure_app_division` (`id`),
  ADD CONSTRAINT `product_app_item_bal_product_id_ed1397c8_fk_product_a` FOREIGN KEY (`product_id`) REFERENCES `product_app_product` (`id`),
  ADD CONSTRAINT `product_app_item_balance_created_by_id_6047e5ca_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `product_app_item_balance_updated_by_id_8b911981_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `product_app_item_balance_user_id_df111a6e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `product_app_item_balance_log`
--
ALTER TABLE `product_app_item_balance_log`
  ADD CONSTRAINT `product_app_item_bal_client_id_22be3941_fk_structure` FOREIGN KEY (`client_id`) REFERENCES `structure_app_client` (`id`),
  ADD CONSTRAINT `product_app_item_bal_commodity_id_0bafa465_fk_product_a` FOREIGN KEY (`commodity_id`) REFERENCES `product_app_commodity` (`id`),
  ADD CONSTRAINT `product_app_item_bal_created_by_id_49a8b528_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `product_app_item_bal_division_id_e806fbfd_fk_structure` FOREIGN KEY (`division_id`) REFERENCES `structure_app_division` (`id`),
  ADD CONSTRAINT `product_app_item_bal_product_id_ea7a46a9_fk_product_a` FOREIGN KEY (`product_id`) REFERENCES `product_app_product` (`id`),
  ADD CONSTRAINT `product_app_item_bal_shift_work_id_3ac41645_fk_structure` FOREIGN KEY (`shift_work_id`) REFERENCES `structure_app_shift_work` (`id`),
  ADD CONSTRAINT `product_app_item_bal_updated_by_id_05e147b0_fk_auth_user` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `product_app_item_balance_log_user_id_b095ae0a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `product_app_item_transfer`
--
ALTER TABLE `product_app_item_transfer`
  ADD CONSTRAINT `product_app_item_tra_budget_id_ddf5e163_fk_financial` FOREIGN KEY (`budget_id`) REFERENCES `financial_app_budget` (`id`),
  ADD CONSTRAINT `product_app_item_tra_commodity_id_2ed02fa5_fk_product_a` FOREIGN KEY (`commodity_id`) REFERENCES `product_app_commodity` (`id`),
  ADD CONSTRAINT `product_app_item_tra_confirmed_by_id_bd6cbb93_fk_auth_user` FOREIGN KEY (`confirmed_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `product_app_item_tra_fr_client_id_2bdabba4_fk_structure` FOREIGN KEY (`fr_client_id`) REFERENCES `structure_app_client` (`id`),
  ADD CONSTRAINT `product_app_item_tra_fr_division_id_bfb5b4ce_fk_structure` FOREIGN KEY (`fr_division_id`) REFERENCES `structure_app_division` (`id`),
  ADD CONSTRAINT `product_app_item_tra_item_transfer_type_i_d36f5b24_fk_product_a` FOREIGN KEY (`item_transfer_type_id`) REFERENCES `product_app_item_transfer_type` (`id`),
  ADD CONSTRAINT `product_app_item_tra_order_detial_id_18c41d9b_fk_payment_a` FOREIGN KEY (`order_detial_id`) REFERENCES `payment_app_order_detial` (`id`),
  ADD CONSTRAINT `product_app_item_tra_product_id_4fce5964_fk_product_a` FOREIGN KEY (`product_id`) REFERENCES `product_app_product` (`id`),
  ADD CONSTRAINT `product_app_item_tra_store_id_0f6f2999_fk_product_a` FOREIGN KEY (`store_id`) REFERENCES `product_app_store` (`id`),
  ADD CONSTRAINT `product_app_item_tra_to_client_id_45d339e6_fk_structure` FOREIGN KEY (`to_client_id`) REFERENCES `structure_app_client` (`id`),
  ADD CONSTRAINT `product_app_item_tra_to_division_id_b23aa58e_fk_structure` FOREIGN KEY (`to_division_id`) REFERENCES `structure_app_division` (`id`),
  ADD CONSTRAINT `product_app_item_tra_to_product_id_5df4492a_fk_product_a` FOREIGN KEY (`to_product_id`) REFERENCES `product_app_product` (`id`),
  ADD CONSTRAINT `product_app_item_transfer_created_by_id_33594e28_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `product_app_item_transfer_fr_user_id_ceac7767_fk_auth_user_id` FOREIGN KEY (`fr_user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `product_app_item_transfer_to_user_id_fe45c7e7_fk_auth_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `product_app_item_transfer_updated_by_id_b81eb934_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `product_app_item_transfer_type`
--
ALTER TABLE `product_app_item_transfer_type`
  ADD CONSTRAINT `product_app_item_tra_created_by_id_26676363_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `product_app_product`
--
ALTER TABLE `product_app_product`
  ADD CONSTRAINT `product_app_product_client_id_d752b4c3_fk_structure` FOREIGN KEY (`client_id`) REFERENCES `structure_app_client` (`id`),
  ADD CONSTRAINT `product_app_product_created_by_id_d7b45000_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `product_app_product_division_id_b57c1dfd_fk_structure` FOREIGN KEY (`division_id`) REFERENCES `structure_app_division` (`id`);

--
-- Constraints for table `product_app_product_categories`
--
ALTER TABLE `product_app_product_categories`
  ADD CONSTRAINT `product_app_product__product_category_id_f89c95ef_fk_product_a` FOREIGN KEY (`product_category_id`) REFERENCES `product_app_product_category` (`id`),
  ADD CONSTRAINT `product_app_product__product_id_e202e393_fk_product_a` FOREIGN KEY (`product_id`) REFERENCES `product_app_product` (`id`);

--
-- Constraints for table `product_app_product_category`
--
ALTER TABLE `product_app_product_category`
  ADD CONSTRAINT `product_app_product__created_by_id_b674c56a_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `product_app_product__parent_id_ce8111a0_fk_product_a` FOREIGN KEY (`parent_id`) REFERENCES `product_app_product_category` (`id`);

--
-- Constraints for table `product_app_size_type`
--
ALTER TABLE `product_app_size_type`
  ADD CONSTRAINT `product_app_size_type_created_by_id_ab32afb8_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `product_app_store`
--
ALTER TABLE `product_app_store`
  ADD CONSTRAINT `product_app_store_created_by_id_4d6f8afd_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `structure_app_client`
--
ALTER TABLE `structure_app_client`
  ADD CONSTRAINT `structure_app_client_created_by_id_ebe69d61_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `structure_app_client_division_id_7ee9effa_fk_structure` FOREIGN KEY (`division_id`) REFERENCES `structure_app_division` (`id`);

--
-- Constraints for table `structure_app_customer`
--
ALTER TABLE `structure_app_customer`
  ADD CONSTRAINT `structure_app_customer_created_by_id_1f8e4c95_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `structure_app_customer_user_id_b7aca266_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `structure_app_division`
--
ALTER TABLE `structure_app_division`
  ADD CONSTRAINT `structure_app_division_created_by_id_71e53f32_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `structure_app_shift_work`
--
ALTER TABLE `structure_app_shift_work`
  ADD CONSTRAINT `structure_app_shift__division_id_0c35644b_fk_structure` FOREIGN KEY (`division_id`) REFERENCES `structure_app_division` (`id`),
  ADD CONSTRAINT `structure_app_shift_work_controller_id_7f6f0958_fk_auth_user_id` FOREIGN KEY (`controller_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `structure_app_shift_work_created_by_id_bcaab5ec_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `structure_app_shift_work_worker_id_3b016131_fk_auth_user_id` FOREIGN KEY (`worker_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `structure_app_user_profile`
--
ALTER TABLE `structure_app_user_profile`
  ADD CONSTRAINT `structure_app_user_p_created_by_id_38365d24_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `structure_app_user_p_updated_by_id_d2a2bfa8_fk_auth_user` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `structure_app_user_profile_user_id_6e579212_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
