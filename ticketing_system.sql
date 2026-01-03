-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2026 at 02:11 PM
-- Server version: 11.8.3-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ticketing system`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(25, 'Can add ticket', 7, 'add_ticket'),
(26, 'Can change ticket', 7, 'change_ticket'),
(27, 'Can delete ticket', 7, 'delete_ticket'),
(28, 'Can view ticket', 7, 'view_ticket'),
(29, 'Can add django job', 8, 'add_djangojob'),
(30, 'Can change django job', 8, 'change_djangojob'),
(31, 'Can delete django job', 8, 'delete_djangojob'),
(32, 'Can view django job', 8, 'view_djangojob'),
(33, 'Can add django job execution', 9, 'add_djangojobexecution'),
(34, 'Can change django job execution', 9, 'change_djangojobexecution'),
(35, 'Can delete django job execution', 9, 'delete_djangojobexecution'),
(36, 'Can view django job execution', 9, 'view_djangojobexecution'),
(37, 'Can add client onboarding', 10, 'add_clientonboarding'),
(38, 'Can change client onboarding', 10, 'change_clientonboarding'),
(39, 'Can delete client onboarding', 10, 'delete_clientonboarding'),
(40, 'Can view client onboarding', 10, 'view_clientonboarding'),
(41, 'Can add payment pending client', 11, 'add_paymentpendingclient'),
(42, 'Can change payment pending client', 11, 'change_paymentpendingclient'),
(43, 'Can delete payment pending client', 11, 'delete_paymentpendingclient'),
(44, 'Can view payment pending client', 11, 'view_paymentpendingclient'),
(45, 'Can add client feature progress', 12, 'add_clientfeatureprogress'),
(46, 'Can change client feature progress', 12, 'change_clientfeatureprogress'),
(47, 'Can delete client feature progress', 12, 'delete_clientfeatureprogress'),
(48, 'Can view client feature progress', 12, 'view_clientfeatureprogress'),
(49, 'Can add employee', 13, 'add_employee'),
(50, 'Can change employee', 13, 'change_employee'),
(51, 'Can delete employee', 13, 'delete_employee'),
(52, 'Can view employee', 13, 'view_employee'),
(53, 'Can add payslip', 14, 'add_payslip'),
(54, 'Can change payslip', 14, 'change_payslip'),
(55, 'Can delete payslip', 14, 'delete_payslip'),
(56, 'Can view payslip', 14, 'view_payslip'),
(57, 'Can add monthly target', 15, 'add_monthlytarget'),
(58, 'Can change monthly target', 15, 'change_monthlytarget'),
(59, 'Can delete monthly target', 15, 'delete_monthlytarget'),
(60, 'Can view monthly target', 15, 'view_monthlytarget'),
(61, 'Can add sales entry', 16, 'add_salesentry'),
(62, 'Can change sales entry', 16, 'change_salesentry'),
(63, 'Can delete sales entry', 16, 'delete_salesentry'),
(64, 'Can view sales entry', 16, 'view_salesentry');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$IGRErLXB5iDSPH9FtDEfNK$DxOWZBCoc0RSFjG8ZS1FwEfL32Vi+xdxebFsmRkVeLM=', '2025-11-28 05:22:27.133547', 1, 'Nithi', '', '', 'nithi@soulcreationz.com', 1, 1, '2025-11-28 05:13:14.250592');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `who` enum('bot','human') DEFAULT 'bot'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `user_id`, `messages`, `created_at`, `who`) VALUES
(1, 1, 'hiii', '2025-08-07 05:36:10', 'human'),
(2, 1, 'Hello! How can I assist you today?', '2025-08-07 05:36:17', 'bot'),
(3, 1, 'candidate name', '2025-08-07 05:36:25', 'human'),
(4, 1, 'The candidate\'s name is Tawheed Yahya J.', '2025-08-07 05:36:29', 'bot'),
(5, 1, 'phone no', '2025-08-07 05:36:38', 'human'),
(6, 1, 'The phone number provided is +91 9994780436.', '2025-08-07 05:36:43', 'bot'),
(7, 2, 'Hi', '2025-08-07 05:39:49', 'human'),
(8, 2, 'Hello! How can I assist you today?', '2025-08-07 05:39:54', 'bot');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_apscheduler_djangojob`
--

CREATE TABLE `django_apscheduler_djangojob` (
  `id` varchar(255) NOT NULL,
  `next_run_time` datetime(6) DEFAULT NULL,
  `job_state` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_apscheduler_djangojobexecution`
--

CREATE TABLE `django_apscheduler_djangojobexecution` (
  `id` bigint(20) NOT NULL,
  `status` varchar(50) NOT NULL,
  `run_time` datetime(6) NOT NULL,
  `duration` decimal(15,2) DEFAULT NULL,
  `finished` decimal(15,2) DEFAULT NULL,
  `exception` varchar(1000) DEFAULT NULL,
  `traceback` longtext DEFAULT NULL,
  `job_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'django_apscheduler', 'djangojob'),
(9, 'django_apscheduler', 'djangojobexecution'),
(6, 'sessions', 'session'),
(12, 'ticketapp', 'clientfeatureprogress'),
(10, 'ticketapp', 'clientonboarding'),
(13, 'ticketapp', 'employee'),
(15, 'ticketapp', 'monthlytarget'),
(11, 'ticketapp', 'paymentpendingclient'),
(14, 'ticketapp', 'payslip'),
(16, 'ticketapp', 'salesentry'),
(7, 'ticketapp', 'ticket');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-08-05 04:56:58.567534'),
(2, 'auth', '0001_initial', '2025-08-05 04:56:58.702200'),
(3, 'admin', '0001_initial', '2025-08-05 04:56:58.740405'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-08-05 04:56:58.745819'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-08-05 04:56:58.751415'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-08-05 04:56:58.772075'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-08-05 04:56:58.788971'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-08-05 04:56:58.797268'),
(9, 'auth', '0004_alter_user_username_opts', '2025-08-05 04:56:58.803976'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-08-05 04:56:58.817767'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-08-05 04:56:58.817767'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-08-05 04:56:58.825765'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-08-05 04:56:58.832980'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-08-05 04:56:58.840195'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-08-05 04:56:58.847473'),
(16, 'auth', '0011_update_proxy_permissions', '2025-08-05 04:56:58.852374'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-08-05 04:56:58.859340'),
(18, 'sessions', '0001_initial', '2025-08-05 04:56:58.869038'),
(19, 'ticketapp', '0001_initial', '2025-09-08 08:26:43.497821'),
(20, 'ticketapp', '0002_ticket_is_escalated_ticket_sla_due_at', '2025-09-09 10:09:43.051433'),
(21, 'django_apscheduler', '0001_initial', '2025-09-10 03:19:11.399162'),
(22, 'django_apscheduler', '0002_auto_20180412_0758', '2025-09-10 03:19:11.435323'),
(23, 'django_apscheduler', '0003_auto_20200716_1632', '2025-09-10 03:19:11.456252'),
(24, 'django_apscheduler', '0004_auto_20200717_1043', '2025-09-10 03:19:11.897785'),
(25, 'django_apscheduler', '0005_migrate_name_to_id', '2025-09-10 03:19:11.911345'),
(26, 'django_apscheduler', '0006_remove_djangojob_name', '2025-09-10 03:19:11.923895'),
(27, 'django_apscheduler', '0007_auto_20200717_1404', '2025-09-10 03:19:11.976407'),
(28, 'django_apscheduler', '0008_remove_djangojobexecution_started', '2025-09-10 03:19:11.986869'),
(29, 'django_apscheduler', '0009_djangojobexecution_unique_job_executions', '2025-09-10 03:19:12.007565'),
(30, 'ticketapp', '0003_ticket_updated_at', '2025-09-10 08:50:11.920820'),
(31, 'ticketapp', '0004_ticket_assigned_to', '2025-09-16 06:26:59.216778'),
(32, 'ticketapp', '0005_alter_ticket_assigned_to', '2025-09-16 06:38:38.946525'),
(33, 'ticketapp', '0006_ticket_assigned_phone', '2025-09-19 05:24:24.742950'),
(34, 'ticketapp', '0007_clientonboarding', '2025-09-22 03:49:15.988115'),
(35, 'ticketapp', '0008_remove_clientonboarding_client_email_and_more', '2025-09-22 04:34:32.150391'),
(36, 'ticketapp', '0009_clientonboarding_assigned_phone_and_more', '2025-09-22 04:40:40.747950'),
(37, 'ticketapp', '0010_clientonboarding_status', '2025-09-22 06:35:44.485921'),
(38, 'ticketapp', '0011_paymentpendingclient', '2025-09-26 09:16:33.681080'),
(39, 'ticketapp', '0012_alter_paymentpendingclient_assigned_to', '2025-09-26 10:06:09.002933'),
(40, 'ticketapp', '0013_paymentpendingclient_status', '2025-09-26 10:26:25.991754'),
(41, 'ticketapp', '0014_clientonboarding_client_phone', '2025-09-29 02:56:16.357766'),
(42, 'ticketapp', '0015_paymentpendingclient_duration_and_more', '2025-10-10 04:55:56.376583'),
(43, 'ticketapp', '0016_paymentpendingclient_alert_sent', '2025-10-14 07:22:58.224895'),
(44, 'ticketapp', '0017_paymentpendingclient_client_phone', '2025-10-14 10:05:25.083686'),
(45, 'ticketapp', '0018_clientfeatureprogress', '2025-10-30 04:53:01.456280'),
(46, 'ticketapp', '0019_clientfeatureprogress_complaint_text', '2025-11-03 08:38:54.294815'),
(47, 'ticketapp', '0020_clientonboarding_client_business', '2025-11-03 08:51:12.134320'),
(48, 'ticketapp', '0021_ticket_client_phone', '2025-11-24 05:23:07.810455'),
(49, 'ticketapp', '0022_employee_payslip', '2025-11-26 04:42:47.977588'),
(50, 'ticketapp', '0023_monthlytarget_salesentry', '2025-11-28 05:04:59.907156'),
(51, 'ticketapp', '0024_remove_monthlytarget_created_at_and_more', '2025-12-01 05:23:26.170060');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('6znyyu95bqe32rh387mdskfu4bb1xfgc', '.eJwNz01PgzAAgOH_0rMHoFCHt5ZSFhhIYRuzF6MURmF8bBIQFv-73N88yfsEY98UHXgDLsY-TTgc2yonsSeckL7HAl-jlAiS1EfTiGILHeZYkCOWJz_n5cL98F7Lr99MZR4nsXR2D7o-BjNl68SWXdcZs79vsvH7FaqW5r0g0xi0vbpNAi-Sp9rKZJf2bFBJe47mFVdzPcoP5qJGkYsc7FVggeFZ4Lb2Erfjl_IWpYFZsHvJ0E84WBsp9_BkeluCnQAerOYqqKDgBQxV3xWfSm5vyLJ1ZGiGhnRbhyb4-wcOSVCj:1ujZI8:HZSc7tmokl8Hd7gcbqIBiL1G9KUic4nb5aKejCFfu94', '2025-08-20 08:14:32.023899');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('az5hekx3oecu7stqbk2sp6idw5147fpg', '.eJzsvcuuLdtxXfsrBsuGkDlememi6i65eHFB5NOiTR0KJGWAMPzv7q2NdWTyXqnugiSROmfvtebMHI949OjR43_-5rfnP__5H377z396__jb3z2_-U-_WX_zH__6z67z_u_vL_zF89_OX_7rH_7u_sMvf_7j766_40f-7udv__R3__kPz_v7v__52b_5gH84__QP-e17OZbn_npZ-jfOsrdjf77jusYx7laWY33u49ru77nv73zrUWtpy7utV7_vdZw81T-df_nT73_3T799zj-fv_lP__M37z_-0-__8Jf39blX_z5_95c_5dsqP3_--c95mvOX-_3t-cc_vucf8xdL_vx3v9x_fP_x_eXPf_vHv3_P__G7X_4rH__mj_In-btf8id_4st-Of_xzT_8P7_5-_NPv7v_w385f3_-8S_5mf_y5_PP__znP_zxL__h7__wyz__6Tf_73_8zR_zAf7oWvMDC3_0j1m0f_j97_72j__X_8ozP99vWdE8Tb6z9L601kZ56lre2paz9KPu934dbxaujL4t49vK1to91lHK0rbRx5s_L2PdWv45a_nzGcto4xt16-PhZ7b8zdi3lv9d6lm-8m3-T3m3v_rcMT_3HTW_-yxnnmOpS37zG2Wc-fe73nmqrw3_psy_7fn__hn_3n79s_z0W9_l9Anbv3xC-Tc-kTeoo7eRv_Fp82d7fvfeRp6v5aDUsfqnfB7Px5-9Y-PP-sY_tzW_Wcfxr_1Ee_NmWYmfJ_WTOquTt96OvL9_03_--efv_-pvfn2uf-Ot6r_5Vkc-v_aFPWquKmvNns23rLufzt_c7EGeacmT1p9vzZ7m_Xn33ks272eluTbs95Z_75d_tvbaajtaDkzt_N7PCvz69Pc8IX_7N_35l3U-xsb5YAfzCYt_fvuWW35v98-3-Z9_fe3akfVd8yn5t7z78v9dwb43V4fvn_vrrrV_-fR866-ru-UnOJfs2XLmlJf8z5MvrPXrR4lFyNu--b2j9jpYj7aMMZ6y9l5rP9uXT1jzp_c429GfrcfsjNyOs2y1tpYT-4w3n7HWkuP15CHWceXTr1rq17Z8yN52L1TeNw_81Dx3zd61vZ7Zzbx6f3yXe9T83Wiff3NzTvKtJd_-tqfXfrWzujVjz81cchZa7t5S8m6l5Sn2_G7NKpes-ZFXzt3Pk_VS-YpxtdGyMu2p_NGed86Ryg48Wc2t5W_H1vb81TViPPicUv23M9-YB8vn8qz__hv__hv__hv__hv_V_9G7OdWX6xsYp-zHuXsWNRt4OFqvfsVy4rVbhjHWOg67tjqeL74la_fNVFC-0qJRf1iZM98Z4vdrmWt-YnY-Sc-IP4pHhefEzsbO9_am--7es8_PrHAb11if2Nx42tG_u0tVxzR22p_-hs_sdQ-NoKU_uX3Rn5uL9u29C3PhzfNf8dTJerIz3393ZbY8Ddf98TuH_GzR-LaLV4Iax9THk-SeK3zKcQ4b37_K1mTPOead7h7j3dY80z5vHaxJonNjnzKV6_8RB1Lw5fEmeTdt3zOmxU4WlYuIfaTL7jz5gM_lO-68mz57Xq1vG186JI46Mge7BVfGk-Uv0mUkO8j-kzc2K549S_R6B6_mj-Pj12zh3mbBOitL1ndPEO-o-VzCt8Y58RaXfFUd9b2yJNd-ayEKfm7Pd_xlCPr2LL22elEAFe9-ptoCS-59DM7mpXM3zx1fvs9rpycnnVfsoZrHvyoeZusU5KEPFVeOr79yfp_Za9Z3-xMvjVePOFD6dmJuPr43pyF-HLOQVacCDHng1gp_1S37FH8dsu5SLS2lq--2f2rJbrOqeKNRt665ylz-ogXGm_Qc_bunnh2W_mbdg7eIbuQk5B9zWlcSWMS1ZRfVwg_zn4RiyTu7vmfrE3isjWrdxbWfsuTEgtd-c07sUXio-xy5SRmFxMH9bNzLpIY5MWMCdijrEoik5H95Z_zfVmvPFX2Nb-VmCPniSgn8Vq9sipbVn9UI852Z50SiBSuz9XyI4Re7c475jezdLxb_igxY54tv3Xmnr5Z9HzGll8iisuJfftdOH1b4q0z75EIOLFM3jun6EkEtid2yi_l3Oa-JJZN7JNPy0EkVsqeJNKpWZG65jOOfPKKnci-JSLLPU5MVo0Cx52nv3Jfr5zSUdbYhTPmgDfNGemJ8fP7eQJiqKwqd6Lkre788-IO3eXKupJ25g5zePJ_yXjylrFPuc0LUXZOUuLEvnoSv6z_mVOc28xJ9VbkHube5PzlvdfYiORjWf8ra5Tz7HfGAuV-xl7laWrOAbHvlW_KtnIqcsq6wSVvwUnbcx4Lpz5nYmzkbmci3diDQbjKzWWbWKm9cvb3ym0kpuz558EJT6B6zH8uuV3ZuUTcsayxAG3JJ_PmOW85zbGC-b41pzonIzckp8A7kM_L-pfc2h2bHUs7Ekm33NGWn8p-Z4exlFiLD7tSl41TlqvViG3JQVqsXM5V5UTtWbcYhLx1rgs_HxtyZ11jHbOLicvLVpId5Y6xznf-lpCXN-q52w1LmJXYuSXeSbKstaxZ3g37lrW4c_ZiA3N3rtwL7hI7fef8dzxB4zv2nJ47P8-9PfNmOT_5k6xuHjHZWHbj67GFiey_RPSJ3vO-sV3xRMklcw_yFFm73NI8wRXrVLTHOq-cSLKEnN2cgyV7yv3It8fc4anW_HznzeKs3nKy9dncE9uT3csu5pnj-bgh-KW8fX5wkI_nxGPj8mU5HbGxeeB4itOzyNsseqhkL_m5nPjswEeGk_c4ySnKuXGynpF7l5yOVz_jtPi5tX9ZoZza2JT8VOMbc4M3vQA2Mmc2uVXWYck9jCeMTSYni6XLE9VYoS378OWsf1hzb3VeKN7kydrGtsSC4PvP7Ms9yHY-811WLJltbFBOZc4NeWRsafZqx992vMaC1WWtYzdiSfMMrEDNfTziNS6eLHt_5Y5wJlZAjtiDt5G1HvkTvExuLScsP_U2_unMSW35TTxhPspdSa6Vs1XLzunPKmf3S45iPikrn_Vjo5asRjaCE8knZI3zsEnFbixflmdPDLBodTmB-Lozz_XkbOdpOVHl5gZyI_LmZ84K9pmdzolLCpp9Kex88tbcqfyv_nrtJ-c3u8ufXFz47EieK3ckD5BbGFuce5hljkVctBBbzvir7c_Ny6ngbhaz3uToWOP88ME6ZXuP3NIDlInTiF-PPzvz6b7jwCaBEKzxncQ6W_blyj3NPW_YvT1ehdir567EyuZMNb1IDFne5cUqJxPOKnWQoAf_m_PNXUusEzOGTyO6iJnPucUWYZ2wpFe-AUsU_5eNwJ7fOc9vvmtLVBC7kM843a2Yp9xS8vQ1xzpeJ--dJ85b8u8N72R8eA1M7eV3PDxQdiBmBevUsyuDSAK0pRDDsRrZl2F0k8ivsYN9eoE8Ku_IeXy5wPm7WOWs5sWFzR4lJhCnqXj2duQ_ecZ43RdrILoWb40VizeqsTj5nQHUtuXMr3kerPXDHuZcHcaLPFnHD-a_9ZXEwBv2Jqcz9_oynk0UmaN6EbXkhC1YI7x_ib1qYEU3NiGnac8O4EcSQ8f_fVmkvRF73Hm7N--c8zj3rq8iFbFP2fsTuIoTzi3Ip8cn-5_sdCwdiA44YU571pE4MLcyK5U7pIXdcxaJZPJGRHQ5CTe4SnwlsUmivVjdZwBuPtjbfIp2Ld-aHcg-c7uI5a-KkyTiaaBHwMa50fnOnL2sSixy_iyfnYWIryGCzYnLWh7ZjSOxYc5t0RbnC965le5Ztit_h23Dy7Ryie5gYbfcUz6vEy3kzy69HJ6kaeHipzlI8QaglU8HP8o6cv5yqxMN4pPGo23OjoG25hBnn41Pv8RQoIH5vDxJzmW-B8x3i6XmjXI_8gTY953Qxyxq5wzkqMUn82z5uxzF2KwrFn3_P3eQGCXfGfuQqPgEF8u9zEqKL_F-Dzcxn_piaXJv8uRZeaCuhUwp9jB7iBfKruecJ2tKvFyw9ImzYuTjTdoaj8E9TF6Vd3yxzANsjQwr0X5WKYuZ85o75lNzQpdEH-RDOZnEuvnUzknNfuZ5BnYm_iV3Pbcnf5_4G_-aRTq9z9w4Ygh2OLFHTrHnJH_x9oPMh2iI6CLnMX4ka3wT6-DB85xE-znGsWt4fjC9RMfxZCc5AHY8S8xdzglJ7rbhrThBvF0l2xzGXAKtZCdkcInWErPk25KP5sHi2cAZs7Z8XnK-xs99eqlYTD6PW5JjnNjkbyzmle9rIO0Y89yCkSeJ5d48hbnbnJdOzpZbF_tYsPuDDCsre2W_dp4YzDsWoxMjglQ2ouM7f7B6B_LciQBi52JhWZmVKGfwRvn5rOWXByEe51q8iTPIjhPN5jmzrlm2rRIfLZj8bMGS7-VdMZrxsfis6iZl3Te8Vb6XHC3xRe4CmTcY50GWmtV_Ygc2cjmMf-zNR2ZBFmSkkRObPckO5enPvH3ubbz8QjRLLJQzaUTf-Xm850l8RkiR1SJDIdZ5iGXz3ycREPlJTh45dT4He1uwVESk3vd8t8i0GT0RTU53IhLcBOcvkWd2PLePLAJcoOEP1vxeI9L0_jw505cYQmwcMYf5YiJRqjLE8TkhNXeDsxsrVLmT8R7ZEVZvwUbknIGG1zw_FpK9WvBMeau8K2cvO9f0KDdxbVYmgTXRKBkwsV_Hwq7c306MmFORlU32lV3AW2NZEhFi_bIGOX-c5HjXxKr8XAN_XsynyTPxcbFR-e7d-01uuIPimKkvuRPNMsaWxYzVZx3IbHlHfF08RTxIzl5sbM5XJy6ItRk4xywT355PAdOu5FD5__mRm2wln92AyBtAxZl8JzE-n9aI1rLWeSI8XbIavTSZKdlMx4c18mRWNWtY9Gmc7fzcRT0k77kSkSbmzYoNPPNOVG0sBPJwkkuTV4rqV6LG3APef-XTspfsbVY9tndlNfI5hJL467nfxGQrfiRLSC6J_emcg-qT5r7sRMqFfDD7WrFiWUP2aiQOHdxicrlkpbHUFB3yRFjZjsXcjJA-4_2L7CGWmqfOzuEhqWkQGxA3x18Qg2alNtASPEXLm5nX5DRgi3uy13xzbs9FTKa_OCuZKzbH4lDW9uNu4AVyG3JaGqsgoDfInbHJlWSe-BXzxc4T0HQQlRWfYqZ9mxtVTj9GH_wqpwc0QSs1QAPWSmQk5pZ3HP5mnr7znCeFSTKQrOHB_xY8z1apV2FNdrLL_NGH3eGZEz-Vzv15WZ-YjUbGPaj9fTlLOU1ETzkDi_7izvqSBZHDxqIMbmEiwZyPrGJOGTgbln7Fm2D78h3Zlq4PwG8TvebdRhFnBJfKJ8eHxhfzx3kaUIFYntv8smY9SmE_yCXBpHbQTrLnYc6cU_PkbTljWVDWhjA5f54oLm-FJz7BRvLaOWzge_nbgd_snKtzZhVZk9gKfDC5TbKHu3FbuBVH1qERQ3ZXJLYeHwVAdk6_LIpyZPVyNhtZyMZOtLyCOOjJk2vdv1jAK94I293EfOIx2dVKDE01rDVQzdy7_Cxx_5kYJc-OTers_mA3Gpka96WS4YmHfNjikUg9tzKHPet-8CS5moWMMOuTCyUSCjIJCkdkG09FrNOpZL8cSepvsTYk4Nw0TuCb50yuVxd9013cU7HiL_kAeW_Dn-VNyBn3seo18D05813kFGsSTwoSlxPCMwzOLvbh5JjHa_HkIMjgCXE5-febGG4jDxp4WCp8hZMbz5U9JF7g9BPrxg_leRLdZ4WwIGvig2-wMkSFN6hFniJXHnQ0u7caw4LRkTWerF_j88mmB9lbfvMe2OfsITFA7v5Cekv8DJoUO9ONnL4NVKNhUyrRYqVO3YlEdo5aDs0Bppmn3TnXOZY3OBcofJ6BmiU1adBcoqT4Am4otfjCJ978fPYzty6nKzHNAMVeqKcOchjQM84QuDae5KNaLEB25D-xVkU0r4JMgN8dfPHgzl3kQGDrWFf8bc56viPLfhfsBc-FU1ni4bbsHIcofkxbjWfC15AfFFEOMNDYYOKGrM60XAs3OXEAt5TPyZ8A0VUQqVKs9HMO-ioiRvYYq53vh8SSPS3gW1tu_mHmnUMXv4PfB2HC78RLZC1jjbPb5LygYie4Y2z7lTOcWA3PHpu2xIbmNGUHQI-erMbJTuCLsceDjH0hf835BasEoQfvW0AQsobJi_LvvPOW05O7ToiSJ8xNy5qCx-bTyVDI9WJLibbwiWSK-TdPJt74zulYqGRgfAdhHih6LBsnoPHs1wbmfeMtOT95fpAGfNiK9yHnIIcR1WmeM9191nIhCm_gP7HCWbxvoy7EukNdiL3Mb-U3852xT_GmeauR9883sWGJanJi-I7CPhWq5fnT7Ev-IT-78l0NvBGsUU4BmfugenGSKWVv885Zhd5Bi1nH_IeqVMd3kKuPQt2_EUht-TyQHb4nMRubPasYoCHJWhPnEqG1mTXES8RuVSzckacDkTWmjhXt3kxqYfmh2ODHOhaIa3a3JwaFB5ET-2G8s0KwSvC21egsmRvvsIEZk70eZAT5Pf5f8hGQF9aKfIlYl6NNMJwocGngBLUTExAx5cPztFj-ZHYxotxasoShXYpfwCfxvznjiTlA0XISstuN-JYMAjcC7pv8H1vXrIjBn4iNo5ICRhR_FO8UX8cngVRk7eKT8w6v8Qk3a2_k4NydNZYsMSqfWXg_6h6xA_y-0eWTs8OOHzgWclpwo_jpx7pSJwgYvLmVxsQnRAGzAnST9YCDJwKH1xF7ks99jfCH-Fi8UgMXT-7WQMcSiVBNxA_nbclKH3wdKU3R6uU5yIRi-_BC-X1rbhW-Dblk4sUCtgrKklvf8eueqdzFnZok1YpYmlguGCc5--x77kjWK_fqB588qMRlV3di3oo9y7MS7-UGUnkgMyLyuTfWlmyWLCzeOX-OFQUXpXoAJg7WjMcf4JYbPpYT1sjIN1CreI5uDWdsVtMa1cPs10YWXnmnDr5VtER4s4036eA_xlYFX5RzDoqeW4RdytqCCJPr9Kx__EC8I6dpxe5l_zve37fES7GCePEjt4z70kGijYrvBs76dKKCC6JcYkNOJqhd4pSNvUqmRGRXZyZ5E9_lVFFfI3fPKuS5qZBQDbw5crEPu5n0RsZiHJ_d6mCSRBRUechRN3DMvEN-W-y5U-PpRHEg2tRBiZlapQYzcyLsIQimd6DvYpobxZpBjH4kAjmyu4l3YsNjDTcjoniBLF8sajLHnBdq5fi1nYxExhT-5zHOAY2jamWAlzeJ5crb4PcLVqbC6lvJy_I8OTmV6mTO7kbskRuzUUWPncr6gGxxa_LM4zP-xFpkHYxTibFi-4pYIc-djQZp4m9BJKyg5XzFv8BhxIbqRTfQpQET4KW-2UVqswK5Dfi8rOuTkwbuCl5GhHFaWY89qmAjrROR5zY0ahzJXzpnNlGdOMlKBpA3_7Ev-vgbzwjEpgegUkOlcs0KkzPkTlNTp1pOZFxhM8IYWHu3znNQCB3gzNgKfGP-NKegJ0a6YJ8VUC4qXQBU5MJ8AjHvav76YQez_09-Iv41_h9uwE6cIoKSm0H-uIGOEPGU2GqqJYlowT7yzU--_0vET5xUmnlSnj15YD9n5bBSZUxcWcy1wU_AUsBEiYAaEfnawQNvTyP4B8hazW9Q8wAJGnAn8pnxADOfjWV8iDuIB-LLQUEWsG5qvY36NWsNxgPu85AIw27Myc8JAXEA284b9DpvCV4cV7uzb823tGpCcAdqDAKeHQT3znUh_iEuHyIbycK4U_rCxFOEUtRWROmIgCr2CS9HDWAAK3FfiI1jg-AfcCvzBDs1rg1kQfCIlbBKBjJKpmdtSzvPbsUqZx3ixTrp70n-ZrEPuwJD4om9yD3N0xFJUEOh0rHlRr14klgX0IVK7TZeh7tec7dzHmKH7o2zgs9LpAX-h72v1CNiw0j_yA7zPXH1IBdkF1nJ25iAu_BWknLOL7gzMc5JpA9wEl_IHXyt9D7khZXfJvjiDiSKi8fZjEiA_4g5E4WQeRMdYA3kEgysGwyGRlR4GRIcZaLLeJpDnIBo8DSar5vYHrhkvoeIj6iwmlGB7udKjtuqOrlAhTlCFs3dAlzI6idjJteKR5TvStRcOCGPHoaTeWJ1YxPydg0Pnn3bZm3-gRwJZsou5m-yNrFjV1aJSgFlkKcbjRfQWfBh2ENnJaahUp4YFvxHTIDaUlawgu3FJ2aPsdYXdhscfNawjD1W_wl87oOZWz6uFFUK1j3WCR9DnROOLiewyIultkWu30Ay8VGcPnKdRm6-iFFmH1gJPI3YDhwI0NobPmqyJkzt2Kb_XXjKPAmYP1EgTJ8Ti8CtqbhyTs2KtSqwTtYN2EqMhYq1dSQsEYf75nLkycEwYGORJ1G9AZG1ihXrRchIbJXMIytwmU0mV-QUmTvlHfnCCrMYnBlCE24Ba3OCzZOdVWymyAKcgkSNZE0XNQTsBlm8SBcZN7HR2URI8r3EZOBWH_eCp9rIY2GYPDl3ItjG0FXkBUQBFv0AnoZIPEA0Z8xaSfJzk8kuQXc_7ORGlgf2BmoMf-gwHqWuQC0SXk6hDm-OzAkFqx965AYNB19JPYNcoFKb4ZOsGlvv-6ilDhCRle-Ej0B2kD3jHXIbqI958xNBkHODjVBVyZMSAeVkyZggfjvNUQtMGyxp1iz_3V8jK74XGzLAa7O3jZhtIyYfRho5gex6l1tBFgwzelAj27Av1N9ihVZP44X9JavZqvWdZBsgA8LVr_W-zXzmo3YL1orfzenbwKeoQg1YQTkzGwy8gb0wn4Q58MZpJGKjPlCJDnNrOsg6tUnYf9SqsoOyQj7K9oWsd5O_j1-inp-fyv8OsiMZ87dByFPgcj-JHR_vNLtzD9g1ZCqbTHt4exCG8sa5Jius9ywU3IqcbK5DnpsKE59CxN_wP0W2HSeV-D53gXwHllQi86wqdgQvm9gatmA8APU3dmwBaxlwvtmzJg4HmkDOrw0EiQFvzCnC01did2_xKtMBdgVnJt9Edk1skOeq1gL3jm84c3rB7LiJkOsToyRy2yuYaYPqqD_AdpMHv1QrG37gIeOnBJafTlwE2gLeQjzO6QADy0lcKOZnAWCwUN2Wacd-ySn49IJgMB3OE-9j7YPog1wIv7kkk0nExTNbhxzwiBLBxdP2KvqXmEX-YWOPcf9g3FqZ5I5kKnh_sm7QjNyiO58TPyJGmFgHXgFrOqj2i00NagpUMysnGPpRfBbZNQz6t1nDMdtsRFwscY5DVoAKbznsFYDz0kToGlgIuSzVsKwP8WLyZWggsULEYDdxHJWurgWCA9nwHLGWsYdgOh1blewmu8Lpig0hZyVqJeYf5p7J9YwdGpUI7CDXEkaDzz7kADzGjdQVkj1kxeMJsjMHbJ9qxkHe3qy7xxff1sLZLTIAEFhuL3VsKmRc01XMiEyITIy6Ym53zsevVRRrmlbysCnwU8E2qMCeRDb5TWp2BxY4p3KT2ACXEeuenQFTzf6QY4Oww5cEITtn7p9nfGJrKjEeeHbuHO8kUySrcogB3PAovA2JKkFhZNM2EQvzk8FNumV_PaByOfWcfaw68DUxIaw6fhsTc8suI3uj9sza42dX47lkjHoJkJyVAkeOzN7EcAdJKLkWXNwXpsjgHoB5cILJQ-leOpqNGlShKlHK7klq4vEdRgGxgtj-i02Wg7MT49NN8v-v5ed8UOU8ZBokquVWcr64J7HznF_eiroMiOknmkJ-kOi1YFO4m_HdcEqppoPs8UnZJDgmleo89X3ySzL77MILAkHJfGBx7w6AusC0woLMfSZbo7aRO0yt9fIm87Q7lW9zck6NeETeiueJJylgCMP4wZNmlRkOUzwvyLwo2is-zFmD_7FC3c1JhK29QN_o4MNUXpKFwU8EgaD6mHtIJl6pyhTqNBUe0UY2d4IVxBuSc1un2chrGxXeBht5J7KlNmmtD2t-k10TnWGhYTcU4sWi7cUW4lBj1WPN8qzbKsICe5VKweGfcv_J-15YU6xgTnghJ84doFab_ZEfRVyJtTlgC_VDS0J8Ij90mzbJ3LWCmFM1PNki885lcl879agHrgWcS9go8uc5M_jOE2yJlR0EP-z9Oaz6DW4dbBoS2EtE9oGLmRNS9Kvyp3LbupXm5DebzJj8bvwOLpk6UyGdBOuh_sP9fsS99yZXGrSNcyazLW9QsSdgVjaS6WuOvAkmE4QNTPQTli4iNFzXQy7pKo4qRwv_k5vHM2CZWQWqfxdMFDIpfFmHSQJNKH6VvWlkMLili1o5NffCjsUn0flYsFuLWeotosDtbVR9qb2A-hP5lmK9HfSEDAI-EP2GRDp0I2wimh9co7xHbi9nB3QkywhryuTMGhcdY9KtQagrn0qlGgwN_jisiB1MbyPHq3LI4IskE2PPxVjh21xUK7ODXRRkgysm9wsk7SYFzdrTNAizvlpDActbYCfnv63_yjUSvx2TH3GCaTUKCsmHzfTiXdw9_NawNv3kZFIfTbzZiLjx-g2mmVVAzu9EMOiMfAg46VzIe-P7iPio9BFTwbG-wXfzSWA8nNUsfAOFL9rLRD2gXyB_1EqswBBbf14Mbg2cbjjjEOSJ-6zpkGfRB0L2WeS4gisZg2tIgNXFFxPzD5B0TuIFSJbzHUsiz427RCfBDuvUvScnzj2PDwHjyi2uu9HhZz3lnElV9wpadXvoAxDXtTexXXYBwOs9RZVhNZIrY4mwCE9Zs1YXFZBKTSprbF9HfBRnJZYkT0f3X8USbVRAsodkDeTopzyp4qXcZZ0k5iswHLLDZnh4y53eBvE14tNVf0wF9wXBHKCU2V1WBDSV3YMTAy5DNkbEQ00RTu-wT2PDea7sec4ONeIqerZgWwcI4-KTZA-KhUIYOTKnn0YdusB-LMTPnOfFLlPIPnhacfMKk4IM8DP-uvBW5MBt_2GNvwXcQETICvhnV0eHtUFOKtryUvckK883wCkHcaESlhMNCxdMLmsMVoUbzV40PF-zaxpkF78EU7WUWeu85EuPPMlj3MipH2a_xP_UDvizT3bjZU3pwp6Q7cO3khuIZ9j0hbCvjGZBDiv4n9iGNVQwc6It7GpNpLEbTScGoCZOLy95WVaPLhdOOz_bPLWg6EfO1gHfkQpOhQP-xMMnApfXkX3I6uebNrpMFzJ6uDE_se0OX4V62VhkAIGNYpXj2bPKOAZisHlau9axkGtUI_74VJAPItNLbKKA_eepwYvXiSPJgIKRxkmEwr9TP01ELQsYXLRQM4utyNqAKEJ4fmF9NrJwTj57ACcHq4115dYk1qYawN2m36W6ruYx5FYVO6_dTi5L0ZTKTyfGoGoARkC6UEQxsPGchNwm0KnGSYShdduhBBsYpLSQW5A3iSwWycTxZqBVcDBHl9VIVP_KOKpl1vEfa9c5HXJYdxh_Ri3k1qdZA7kjaUGiBjucYSd6Mrn9Rll0d3wicFR3YXXwjQeRIEyN8Wkd4mHj0cmN-CYYuImAyA3hH4BFEyFs1E3JCOlRggGDxRrebTz_zgkH9YIjJXuQPG7yT4hfzX6J0vL-oGtwjsg48GZUGOE90sG_xDrBJ9nxJaNYIxsgINQ86DXq9A2Zl-RvyDrBL5voKfUeLA71yyr_ik5pgo_cOtrxCn3Xk_WABgJ8vE3OA9U66nd0rRHLUq0orIEdGhOHBFvg2WGXNTJdMO6czgPWD_mVO8a5OOxRuuAYJqftVr84zXCA7DDMvYGXmjUwG7bOoo1Z--46Y3nhWXV76fQwYxG5ryBasUR1gGmZ-f3c_pw18qZ8MlcBWBMvuPMsZMDk8rDAN2qXubMd7AkLC6JLPgLnMjsKk86o_hCvh39LRETUi2UHCeZWxGZlp84Ozs2_k1O-W5MbSA3d_r08AXUQPPHCWsEVJIPIUyauk-vivW0wHcnf8IAf9zdxCRwUqizYRrBS2Efk83QzDS03CATKDY91yk4vHXxwslQeJ7abZG5QJ6Xiz-kl4-hkvCAV4PywBcjZL-oWsQaHZ4l3esRKi54Rbz_5tJ-deZwVeOWJwKmtwYGHkYRlx-8TY9Fn1chp6I-KTSRmLadu9ZKTDisumwB6Q4cFfDCwzgobdYhd__juRpVqExnatQP0L-YzSHvBxvrUjGj0I9TTqEOrA2OEDhfq_fL-6YHFk7BOsMYqOMhGVEcNmDgdpsAg99XWw6iAYQ1z54FxWeXnyiA4JxZJfZIcLPsyRHDhOeZMUAEjd56ZypjoD0_O_cQv0DeVmJFMQ_4XzCK6cBYiYyphVI9EU7FOdrxuPg14x4ilHOCIh7ExOAuderCb7Lu0A424a8g3Xe2JGHTP0ntHlyroEr06KFRY9bDeIpK5WJXBO9C9QvV4MRvgpi7Yrko3FjnZReebqBytj3SNrGpusC7w-BLLgfDKwyBitLqdpwZPJ_tjtYh8UVOh25Y-xceOR2qYXCl2sNDYmXegS5Lq8MH5so8CwIUcAgZoYjMYTeijxFpvg04l2FcLCE_b4QXDjbMD-SP_JHwmRjTjv_TNeIFLTB_k7UALhf2wB6_CKPM2Yo_hMg-Rt1ds-yUKarNqucv-aXZGUCmD7VW0qvTRwnQUI2aPGuv_6BF3O2aeIfuK1lPQo9LsPdpULAG9TA4Hr9L-SuI6yA70Hi6wqUAbfzjMRAUXOfpmX5hsELDpBkYNrgDGXuE3cRKMouhrbNWTD2OSjHYnG-jwUZKfg6HRF9zgoMC9SqySVYGxJXG7FGOBZ3akgnDD8NFqYIfoaaCHYceTwBjldFG1JljGv9gjRKQ7-06vWU-NLwDNiCWHe0DNh24Z-o60_KB31JG58eSB1APo6gM0IlAhj3vhU9OXjH-eMSLVZ-Kpzv3C7qwsMVyQJqoE6onrht9M1RhuAJzJPMHN53EfaA4v1sro9LL_stCRLzJ7Dyq9u0yTTWZGchQ7GnxPO4vooQZsSuyY6DmRD_h6kyHOOex0IdJBd8o63WT3YNcfO23wpLtZDD5y8pLgP92iViAWg5qWlf7JS6P7yfI2des8UawD2E0n3YPzAFti2B-Q_B7MxBSQnmRwpzLUy6kgMzcM1URiiTo5iVgjILmcy_gAcgw4T8mB4XWsNhdT_lF9APpZbmBy7_w7logcjogEnwGzlnryx8oUMOkORyzfDwrF2XusNw7rMtjTBXtTiRCbd-lUBwCMkVo3PpK-3R0eX8Vqb2g9Wcut1C7F-btI6WKH4WrmhG9btGEPHfd4-o0KbqGyUbHuidEBoMZnHdknxNTSc9eJrec3gu3xuAv8xCJLIDtGjk6t-aT-AgdwgMtqw-gyxO50auzEGvQHrmZy5LZwG4nUdte5Vjz9Y8U-yZNMBM4xfDg6xDYrYVTy5E6LJWMt0BJaqMtg56kM0WVW4RwTZcEYlnYhNxS21Q0LWeZ3gXmCv8Qe05cFpxE-epfn7jtsdgwQ31KvqdpHTiYYF1k4WMBlHwNHnWocEdDjzVt_MG7ONNVEOlNswx_wF7sYRe4jFfTKWjZ93C53c4hb4jnpUSPleeS2kvu5Q9QMjFfhUciUaGP2m8EKp3ZLpF94JtjA1f5SOGY3OA9epnG3wNgv9TrmiideyhsrdwBjWrwC3sdNd0vW2jrAEA8UrceXrjJJ-JySmHXIXuP8HcUKRqzcNe0DkQ1hOxyzQn5lTFzdCbugb6Ib457bVSFu3mVWwdIC4_u4fCh-wTRo9f_wUMpkglgDir2jX0DOWs7eY2chffJkunQbsINwbeh_wdI99oh5C-ish79SHuqzDeSGqhjnHU8w5s1pMjTlLZDZlMkuxGzEghEJUJmkfnbDQqKaiI-0noFWAJpZZPToGoA67Y2butNVtnEGH1QawMTJcoy1Z92NmGcrMuQa3e9oFxBnv1qFHW-mZwQxI3ZILAurJidtUQDsBPOhbgwyRs3Q7prcCOIWei7M26gXTzE-zlmZP21PJFzu7AW6bNQjyZHpb5PDCYcEbi5VL9jY4JEbTAjws-xJ0n7OFOgXkXzs6iO7OScVbQs6oAaqINWOBnroORsfjLIOpzkRJ8-HZ-tizdTAyaBkvMLzN5bWQ4DtJDqGM05PA1k6FRSYRlSN6em3xmDhS34imAmKI1TyQE0XkAfPL56DCmZsP9APiGDh--1GhrdqtzSYkzwVcGe7-7nvcArFojlls7-kGNVQkoOzKZp9817YWliRxuOJQ-U4oJNBVwnV5cQDsN6SWc1eA248XAE8_mUNgrsJEAUvgn4Jejd3GURVthuqKi_nFyXBvOFp5_Jq3mSNgMOWe1qs8BSxvlPGiQna6JO3ULEEaMWA5OYk5LOXRk4Kp5WVgfWwi83A-Lyo6nrBibFix1Br67PqcKKhYN8m_IBhVo9mS5Vj2clC6CtjzzZ02KrROJUa8sfbThE6Pqkzm52KlX1SFe8h233IAilibxVu4qmHAHfPnWt8x47KiP2qcJlO2PSFjhrQulVPT5VsN9axXlXgvntCiYEaDJ7beORCo86IxiejUxLuIkxkO6tzBqgewA_Fv1rNR62Qk0GUAO-fzG4fVc9CD8XBeUIZCQzcLOIaxNigM9R7VuyHnbkV3m9DGwAtDXixBx2oYE50ysECoyGPOu1G__FHB3juC_WvlXtHX-tQX88eP04qJfKRt7-4a1QnqEqTk4FEgYZ0xSr1jSq1eF4PeL5WfakvQ1oDmbPDIvcXaulkQu9iaXAsT_cYP4yDOK2Pd9UO6JRprAjcJhWkTuOq-HORkYIqC5oVaoeAQs9KWdYEJmnVRiZbL2obYeGNecl98P2oPoIPJe7f7UOzXknXOz1FftJlffawswO0eQUGJY1LJMJN5ecXNVsI1VFXsXLY8cgwahZuHEgpbGq5riteH00K-DLkbKhooF0AM8KaIRkXeOlpfkCEhOLHKs8JBjUegltI3zmspdd642EfGvZ09nvQJUTow42kzviACboiVHRVSUSvpMG3IA7mkMKkxD-e9mnRAXjBFeyrcRc6L9TyyTHtCss5Artscr02eXTsww0rGNQaNN-uDSJceBzUxQ97-zY7Bx9q0TJdYVEu8iBvOANw4ZqqOETYdP3ybOhVUN0l-qBGRk8emDFWFjQRBNMOnuLp5rCBNppA84cx-HiShq4KmAGdkoX-O1i3tN3AH5tWj3cCOb-RBMH0d5ifgJ4nCkuo59BSAc6FegPaY_mNrrYQKD6k88WujwNMyejnE-9p6AioAEYOhLpUt36OZiudsQWMnj5ze6fBF09qb2iX0AOC_wIJwL5hfGj6wBpXTQwdTW21J_ou5CN-J4o-7AmHFGUhK310sjZ7WWD8w3RA6QDFIqNX-_vh0T6yF4daF_hV-r2Jfro9Dqi3dcDQyamU_32aQjXV2UgLqZ8nN0hO8uW2vHgwznSD7239DH5jLaqXgJuDPxDeEe8eahdYEac6RWzaFovJE1_hay6VI-x0IqfJ_tz2hH5Kl9AreWm16Lz6UMYAWy-vmmbbZqXZHIwYoHAb7ZYE-6NIAGoIw5M-oAqLkJ5tu0IbnSHUZhqnnPLzVBwaZrGgRo8atImtVLWZ7APIZTCZdjKSKlsVTlnhnIuMce7GZENTT-EY480u0SrLmdxpdVc4FStRXBYkz2gX96ZSKbp6oJuXPZ7VXhU6F9nybViTAmmAuZ71PdThedEnofJg5feGf4b1B3-mb9i7BX4a_yEz9ZhdkA0ds0rHUyV-H6D--AxVow7YoKjUgKwMNP5UH8nxUycHwA4st8Es7fS6TEUZWQdoGeGEOD3dCkUhp6taMVDI-CFypgu0FxZLW4x8OYvw8uTGcr-oW83enx81D9TasBer2lUI6YGqwrRCzyl5OewM4iK4RCrl1THL_mRLYCQnjL2CrR7ol-CrCr8pC6nRyw7Pm658VGKJ516ZToA9Vt-zA6eVj1omOkV9jjxVPVl7htUwkuGyo8tAlEENFeKu7AB6_We2DU8I8gOVY_jV_EtXV46IAQxrV2vhE1chV-RlmtxMa7JoNMHJ6XTvegdFX4q6Pmg1oZYLe_NQCe2EbZzTLDpD3YTuTmMImPMLFTm6whqfiX1c7f-Sn0WMSBZHbjaZ52BL7CA9R_CcqWQPyRzUT_AGoiTgqlQVYRxc5PAgMPiDRv7zqClEZkmNcbV3CxbeZ4f-wf00A7rp-xPLIUu2YwKtDpT6StGfntqcZtWNyJ0ekXPIuIcJAWMDbi49_nLQPnJz9RYb6BjZjT2viiIRx8BbbasKRvDcYGJIGeuTLYF-XUGjgN4G6sigMtXmJTqHO-znNrkmdIiVnxUlIt-Mo-gkRnUIZTBiePy7JwE_x114zOKpVcAmvemaAxVv59QJIJqEPy1Le_NSog3Q-9RLI0oBM0QvAw1Csi-YPHaJ0f8EllNedcWonfSCmrJ5CF289Nqq0vDhdToqAV9_5ehUlRqJfci62BkiPCzBKh7Ku-ywZmL7rO_RhddhTYP4cDNnLgh3AH0TPNbgFOJvqFyDfNnzvGzrRCHhgZMQkoGZs8D_wCfBDLpkZsCHJw8V_4KXI7ILY-8R_7q9RzzvKwOZszKMcXCK8U56Rzi4eGoVnnIbZPyKDdKrvXlPNrNo-j0OYzjqK_SXgoK9RJgofm5GBGqfvdZTGzqIs18Ve0zGP7Q4IFAbTC9UoOyatBMLBsai7X2Ni4sVX2q-dEJCjqkqfv6V9gn8TisWaB3gUXBu1CZeO6OJduirBw3Fe9LGQgevtXaxP3gKqOGA_VIDwsOeUIR_XfGsJyc4u0i0Jf_htDYB39V8X83OjyeCz0SNBj8n10K-CHU0-P9EpXTkAVqRI0x9C3pvGozEEwawDL7dviiYPgt-D7YErBxQf1iJ1s-PWe2XtaLeTFV9jJ8DhaKnGiQYnLXoAVCDoqaUXJuAAOzDu0eclThlpy8A3jlvi631jFKdr_RlFGw0ERbJN1fuk29QRRK578SKxayk2rWFPiGdEeTAl7xv_Dh1a7hOi9Xmj9qm_vpGi6rRVbbgaRr98p9cVmI5vPrBv6tK8am_O9kKryjJJr9Chqu3Q1Y0yIG44qPmAig0N_2x1x1fQXcL3gjGGfrvCxEKHeVUn7MWhzo35KEwXrCc1G7iJ81ViFTpKqCCeKmRe4lFwAAHquCzsRddtBQEG9sD5vhAlWn083d5O8Yt9NJVOc_5jkXEnv5mqkRUH6o9Ka-Kp4TRrwpt3PKbduiC8hGIwILur2jlNqil8fQgY2STnzwJejjoIIDDXYlDiX5g1NkxalRrb7d2FWaTqsR2SOFxQAZA3-jwH_S-QbZgFelyrfIhbriV6FnQRwwTHsxJztUnJsvz5qzZce73oSSnUga1JNjGG0r6RFtgAvSJgoNW3RY6Kh01imqP4TB_mV0FH4hboX5NPRaNilO9Q7obX3YFlAO0RN4V2rK36mDkLUXmSzw9uRFVe_gGcuh5VmId1utCUUb91xcxwvhv-MTnpDmjTLJR9zzq1H7gWeixY_GweR9oHXYMJWBjefzDMJ5BZWeoZ3zB-oWZh7YJlkzF_k0W-Pqjj8NKEHftdh2Q9l0qp11U4ci16uzifaiRmclc5KLxnUJP4M05FVSTX9l7qhFQ70Nz1N4bRj0kAlF9t6m_-MoPu-1mg2v6odZMx6M8YRgOuasVgd7kuawdvTpqW7afnAr1OUCEG-ZmZSLEIzPxoINUru1BXClHX54Mp4CqPYj8QPUFfBA-BixfWWxm4uRbF4KYVvBABUHjh0wx1CzoyLxhchn1U3GmHg4zFI1DogxiO2oidC3A78LfLZRwUQeU3dDUBqLzfJO3C3mSDuFDDt2nGhlG40Y5As261tRqPgDiURBumsmpHwA6uImIElGpFmslGjWKaX3YXViIdiWjLUGPSvu5M6-Fpw_WFPUFNLQgn3PH7JZd6R61RshpgpdBnR4rj-IFmZ4asbACJ_sHw2ltaFMrmgoO7NtilxJZGweY9FhBWzsE6OLcrBjCzYDxgPLGg-oiJ0PlrAYSbcVIfGxox2GBUivfrIRuGMEd_7RZbUGBjP4V-rRyokUFqbGSlagMJM6DAjluHv5Jg4UGj6LO-qeaCLILwTmxAijyZtmo2OGBYXJ0lT9QM8BSnw0UlRwKvXEUvNEIoF52zr4ceWkH3hH2Oro3YG6bnI4GxqVuDreCeBhuhmqGXT3WqoD1zd4Qw_vURB7Jm_FOxWx5TB7bZq2euGiVYbcbyT5lMooOVYpUghnyn5v31n7FIs8Ev9tlPpPr3PodeB30vcN9QWlZpalGB9srRt1VPQS3OkFO7W5cjAPpy3jpaVHxD7zAHFOFJ6N1KlqobsFiaHRGNHWawBRU29lELgo8J2J4OhDoiv5-vkWstsF4vagJiS9jVZgYtIidMfdFvUJspDG7CiuT7yPzgdiB4wJ68Mk5hQN9TAUde9JhkMICkakxNaDkF1Lj5WmAZ_i8Zu8KeL4NXlXGG3-Hxq1sp8mFoS7zGdNgosEtK5ou6Htb85BtD0qiSjc3pOXsYYXgvdEnUOXEPJ0pO5y-Wdkyk0ZFvVaVdZafSghQ-urJA80ldkChidg70RI6Jj4svbyo78tnoHOLei66izJr4cmAYtHZU1QNP8VAPp5CTVO6dOA8odhEx0giJxneB3gDChVMQ0BZqmLgYe-rtIXSx2b9kKhzgPLDlVns1kKb4ractYtaKBVEH8mso5hJmOGiSmJ1ni51rD0niLr4OWbUN-vZ8JcPO77R5aHXssqWIs8GSbzYsQG6BM5HFAvtnaqE4Ws_p947_DI5MlRaUersalydUwNOTmOzOkpdFo3DmZ1vcktv-_NPq850CNH_av8jlkw1rNwp-iTK51QC-K6wylHDWkRlQeXmXAj73OBvoSMhe7haATpVC-JNRK7zHbf1i64eMu-CXUOhAkx8s6sRjg6dz128ecY9VcR8sVP9slq6yZ1Sj001rM0aIZzmv8mouA9o7Kht-KmNxCQHu1CtPr5qwKqXgf5XV-mgTX0GYitYeLHFMpbPSq7xTCp0M3clT0AVfcDGqlbdL-VoH5hYWQNuvbwmunaLrHOzVzRNOcW79UwqUzd8Iftk4f2Tj6MCjloaXTPwJ9Uir5wS2ITEW6f5M5Eo_I4LfJygiM5N-tyIk8GLUVQcwntMWKDXwur1kGtytEvF_dNsP_827G2E0T2YV8XZ-NR24xRhH0Zd_barXNOWkvHP2UlgQnOYE7KKdObgL61Erk47uEUaFj3ZR-yIx2CCwxh27OGhQK8XNSxhCNFHTI_yZKCh153fRyOFzFR1ndPP4VzA4WtUL2E-ooxM5yBKvuIIwzo--rZoT9CX9KroMGcSoHiDwhmddaf9JXbswcsyAyLrZlV2eZ0gl6_YNHw3ugO4ZTtqnPgTLCH928S7RAWdOiW99IeKy8R3XUwrXl5N5o9_BuNAbwc1dZi6agzBd526NOj3ED1uqroN2R-7-u0wztBpJJY5VBKr6vJSQoFNSIQM2kl-eYOdbcZd3Rldw-q-SgjE4LusXzpTqAVvDmHBM39aVvgURNnd9-VUfdYHX7j1KNMYomBBOUWqIE97oU88ZyeuuCAc50_139fbs6O9RbZoj-oyOx8b6iVo6LPnsCeP_jjkq1LnG3LawCtjtbkVF3GnGfMtQxa0EJwFNRz47KodydimnmnXADcYK0dHBsojTBdTL0VhenV2b8_-Yu8B1buh_g1V0-QeVHzg_dmd1pxbQCSzqap-qmxMf8inOvshwirKzQwKWGLORaF6ZjdAn17IqSHoFtAJpjImPBA1gsZU-3nVnbipJqoC0WE2ap939fexhiB2Q41ien31ZsTJ1MPJsAfzZmRMq6ZJ3ndNTyXaDbcwMaqqDGTlw25gfmaIbN9lcvjpbOG9V5UNY0XUbJxKu_gpuspQTiAbhHEtG0o1uk3-4gLoi_byVDQnc5_2R2_GWtp7aKSPa8Imcb-NjbjlTRK6VWFObPupSmBi6IrPOoKzETMa0olGGrnCbqvyRZYy1YPoTYI3PPXIYFWqcsZZRicSTBnmBhMFtZP4U_vR0c6hPgEGULXIMPXQMzILpxdtk99NlPmqq0yflVpOVLM3UUyRAvDnDa_Kzzucjs4a7gueCBbsPjtPidLVET-5q3aXUeM4JtKHWiPGGS13cITsIuwWrCk8X3TaQTTQkyF_HWKcZKT0KODJi1HeIV-eegWsKFhC8Lxhq-O3F_Xp0FFhHiWVCJSZ6INl0gu9iSDEKMgQd54ib8T8HHLq7p-8djoNqUWccD6opm9V7ZF9s9tgM_Ml053TlOhMUeH8UgtwoZMDlpfMtabaBdrjnzr6S5n1qc9eWvNQvL6RN1GcLAm7MZ3dAQPGjJk-PRjLnV4eOOv0SxSUq1XuIMs29nKSBzadOoX6N6guJEOEmUNvhzp95JPW4rqpAOwIlD9FmcC4cmNRH8mtJf9pziU85QXsUpFB_A73Gjv_yRn7bAiDo7LIMCM32eWosuPkriAjzmZCe9K5Fp_9n1YJQNrQz2EuFhgRKpZUqcBPOx3QIHW8z8Wknzzvoz5os0sDXRZQe7QQQRIYLLDYtQirHqZ5kWX4zHfGu6DbX3ZV8xuKYWg_0Z-0GSGqBnLYIYbyXdFz0e93_mSZ6w9ftNmf3tU-OMRg8PCnb8Z0hZPqpL0Dwwjus47Kc6HvA0rF-pMTq-Hu_AZqpDdZEtOA8D7bogq06nvsCjMqOqY935JVQAuLgACvTNc5fOzdKB9uJpWTTy4c3fBVpuGrf8L70wtBZnyhPYdhoeLIR7Ofks6dSykidClZj7F87BOCe5bc0D5UYu9YGz0AswqYDHSqpwOC8C8KBzAl6QzHJ2LtxpzLWa3EqvHWVQizilZURmd6zFCNFkzdHkRqbqLSTlelNuNcCRA0K2DcKaaCyTTne8y7VF0qWp_d6ZooF8kISmzqDBG09ekyct4Wtn8xw6HiTdcnFk32vPjWYjf5AcORSExNEHrqBrUL5pvBCqYPgsrgxqyYIUqJ1tLUj_tmnOEsgmfOW2pzshr9AFk5p4Hc6FLRe8P_xyQyXaA9enQRW9U9XjHLVcbNbU1-6sOh7APOAYyFtiydIxSTVzuAC5GkHbLo0pA3YrubzHHUr6gpUs3ijMn2dAYTHaCq2fTqpLebWk1hdsJX5JX7bK98eXB0eFUEtsaWqD4xj4j-OabUOecH1hXWhgZZIvlXhlmyNfAW4kHY6IBPTfaVedmrBjrIMzf3kyMOY5ieFHqN4IfR5cLta9r35kym127I80eN1I5FomrnsYBOwkWkn9xRTOhLDD2tPWDP7L2lo5UKCnbTU02HFzbDanqRRUpfgbyg1TkRcH9UtKKrg1hfNR9UlrDHru3PvLrLmhdx6Su7Hr58dxLJtk0WMJ-HCgYRGF29RJH09sC8wp6SuFHPh7lAFbOrfNtUCueZyUvx7bd9CqD0t9icEZeTA5nlwSKDdm7Od1qtOFHLRWz1MTOnxvmhM6LyLZod4BRUzaYK6gUZScwMBXumuzzUyaBmQFMgvnI2EbxRsOFXVhtZHXaOX6V_CG57lemI3yXnBE0dttg8qs9MhBSUi44POnFWNW8X9b6cIknXJ-yWyR3kdMJ2qdSzUWNirh7vciibxJSg6p-rCYKmLywguGvuDt0NO9a9TAXuOjn9spKcROgUiSanYMh0k8dM_d9ZUzC-hipb4BPaCzhKVR0wYVw1dlEfpRqEsh49I1YzCaZW-_OKVSifQhQIuk93VgRTHroMsIoSndoFH_pa9plnpejQaqBwqJSAYcFOVBENpMjpObCDnzmjRXUe5yTSp4Od9zoxH9quO2ZQDTWFZaUy-6qri03sgQaW_E2qiYO-bPPgLhdwKoU7U4ApTkP-bfJjeC_q_2e71MJCsLLMmYvymagewpNfqc2LrsDBYMKh7AMUJNA2UVX-lI032btMT4F5WWWMDnVF4zGoTxfnjHW6RpyAxfQ8lQey46rN_Oi95jwz6fowJ1hVq7hFrG9mfU7L1Z1VaL3iVenn0DOvZSrBEKR95jvov4CC0EnEZNNbPOO0XkzFkQlIUxsG1BeO58P5huNK7kE3iL1EEMSrrH76YuhxNmO1CnLKkCDihpexOLnwQL7b2YN4E-pbyAqAP4KCwe-6xN5Byay4FpiEm-rSCl442wYkh7urWJQdV-IIoFzMmWxG_qgEwUuB9Vb3n_gZvQZyyldkG4CqOnWnzglk9vd9zqCRf2DfO3qCH511Tun81DQqMl_QSe722q4qBtKpcuvh6UJ_qHeD3ImbfCreHLCKmG4h_wjlSLqr6AYhPjvVMkBN5mGCJxNU7f5D-w3dxdtOqCHi-xT7Xq3-nL_Wk1XTuK2fg3IzmYHS2y5KTMb9wfUCfydbSXYABmolNnbcyGRGuTkVIJVtKlLB7YaxhIaK6sWDngk10RmbsjhVxZxPdJ5uOoDPU3_7Ottgspzl9FbidrQ-XycmTq7h7sAO8VsVphZVJz71SR_n-KIoDlthmAHeMmFOZ9PpbyFm8LhlclpnrkMkAN3mANGl8gG7UTMHz7E4O5aeInwQvZzFFnIq3ZUOGKbytWIXhxNG7OyAI4jDRKV4cybBpvq3al8gKvCmft4SbvPURSHnovrO3OGfqYait7tqUBc1FbpZqdpAJIFhxcFDwYHJm3YZoaDsFCDOPFmDnGTms4Jb1Tlxl44XpiKq2HPq12783FRMhMPWVNSz_5lVYtQSaNumQhve8yPk446ZYdvlIht80SftU29g40-JDxbukBNZ4DoMO0qLWiuomjIPjk4Z6shDJTwQnNwS2bTMIlGNjjKr3XFqPlBRKs7M-6m7wnuHZX9SJcEPyiB-0PsUG7P_AuZvAb1vzq0BzaVriqopPlhlLiYnVKfuDDRc8KDydEDT1PRA32EqT1DxOWTuLfBXxmfXyLA_bKO7yWwdvaup6uvEW5QNOygUaCXK2Z_zDHZ1KbArWNtLBQIrHGNOLerO-5hIwmuVs6lru01dLubVVlRtixMp7MKHUe2k6t25osRqaB2BpcrKnXU2NC-rnMJmB7I9PyuGQJ2bwwnD6P51-6PxfHikZncWbAxZ2_w7avHghM7NgD02-4acl-rMP3Qbd5XwUM_4pFlQX7m6ZAbn5cAwXM1vyW4uPT0qqEZD-DdEUcgxwH9kjNL3wmw_qiswEmDZEd2yP0Yj4Nqq7KBQ-einXsdXUVV0Wiu8cm4xHa_4qoklky-hG0ONk3qGfVVM0_Au0SOpNvhHzlthYljP4L7Z34pyB9My6ZWASgPWpbeH8WT39qJqCHphzp8BAaQDzWk51crop77ZUHU2vwN3rs4boJwAuh_w5WDA0Tmoz3amIXVPGqlVIwLZn0q2GzNqnIZXrY-iLlV-ulFsTdZSkCqgJ0pkflixA08e8WKwA3kvYkfY_9Dcsa3cLe4y3UDVeWbcC_vusOP2WzLY9RKJOJxLxG_AdEFjk1ozWKQ7DRLClHXv4LCvcFM1gVzh7GXqFTDLhVmadJTKr3d-LJPgZsUd9EXkCs47FQ89rl3eYPSL-rZEW6BTTK66_b7VdwONu9WIudXBu8ikBybe6q4q-NjS1em13VlX8gQsG9Vfsw6mcxAxkb0XTl8iR2qXrJpaIFhCzjFsiEfW1IZ34YgzG5k7DwnDKH93JhiTRGhoQCuQrk442ru5_U43hLraPPcC72VO5wILBHfBv4kBUV8DHQdBQ6uh292AQotnldPuvIv4KGZyOi3rldNsdbbrMTZieCpEu52wc9bzqyYYsRvTumCjMfmDedL4LCrYzLjkJFGPvEH9tE39p5tzbVPRmHOlzpoV-zYhL6e_DTG4zZkZxr7OzmGG0SuHqTgn-mMKRwGLIM8GcCTugP_HLQH3u51yiAZLcfJOb_bu5mxSHQVPnp0R9AkXY9fbdTw4i6ICnyyUj8kvqISTfza4U6p30RMzFcWYlcycenjCdi40Y0dLCKLBVKI2rQCT3GlmRJmOWBGsBkYTU9exAWiZQNbIDac6QiUNRA_mSJ9cAqoaeE5kwVAMpj9BfJbbpaI2FnD8MH9WM_1ldl9r128jNTVaYSlixcC066VmJ7y-WubsDOqXHzgM80bQiyFuYT4F03pgh01NLbgWTlAiBjo9j_vPnBBtqvMzLaLD2wStgaFIHA_WrYL85UQaug4MHrCedjchp0mWv1Py07cZJcMFNqZY7O8bzteaug-ovzJZCW9PFcNu6sIUTap0cP_Jr6hZU1U_J0ZEZwN5fHU6JhYWPjteIqcHHAzcTP5nEWVkUrY4CDUNWP6vcS288CP2E76mnsDOV3Evp3kMlUQX8RsqePGmbdY86NSjJ5SpM9TxQX9Oe44_0e6qFgndRdz-TaXxVRUQgnOzDGeydDVTpggpPaicexhbKC7TJQR_a_Zd05E97OymLsX_oElHjduJz-qSNqd0DrUnDztw0KXChkz8BTybaulDl9aYnM-TqMLImWl4Im3ERuB1sjqItnanep-qfzV1XYpzRg8VLU4zUUozxSwXhnaj9jpVq4ma6aFjQovz48C7YLl_DICAizrgkO34IUbebOo3y2EBF2QtxkSUnVK9ybynBA07GkdCHHyL7xY5NrbRgFhv1embjt2ghyC7tjgFuv94E-aULsZ6lTzeKdbKGqqxih-M5QZRkkmBSg9oA_OoivPHReOYkEo3AXAdulZ6OtfQ_pMid9KoilpjAY8jr2bquDoCMsfp92YWaNUiL2afBduC3jxTsYjrYOzQq2i9Cx35zz7cWxutVimTh9S_2i23XXMeGStXQUEquujcPSPq4Uwf6k-l_-jrk9HwflSOVRQB1SabmBQf6lHctGov6iXuhU7MVH8-9bzE48WuOsd3w4sgJ3H861S940YfP3pGaDEjj4Llf2QJq8VgNz_x-qcey62qJip11JzJjoy0rA9_xo3ECLlvxPld_pUdP4tTE1e1iFBZoMelYEvQO7I7HRYf1wdVWOpir72XTh11Vg4qZcRq6Py9c-YheWU9ze-HUp6g7osZDhgkUGW3A4YqsWsKxxAUL2-uWiuVXoRD0PpQX0gGvXjz5xRISODE2AeMBjjK8ElF0DfVaDeZ31Qoqeg9jpuAv7Iw9QcmAFaPvhdmBaOnphIx3Y_0YnLJ4LKD-HNuCt31TnPhBOdd8RegvFZ-mirnqMLDhSXrgYfF3JXhJHoiTxSIjuqcKvq41YLarJ-8ICLd-YoMqsS-09mOjgiewqyAuS_EpzTGrlSxmJ-jjic9tkTDKuLYB4BS8CMTqKmjR42lzdn08PFUjNntAST7kiHT58QzuxyqCrhywphoXkSkQIiJRz5vxm2XeVeH1z7EQsZKJnPY4eusa6olTgtHI8c0AsXDZkRBxZQKK5ORYf_aD0NvCHwhMHCelDPHtGFqBOSmRFayqukCI2oCc1eLeHP-IgzqT30kpvrSmjmVZGHSDpUX4TDicYYzqu4ugkbdgSqUnFQnuQ46KNBz5ZDCaAOZU-UGCYmptEYzRUMvjS40ZlgzYWxxXv0bawnHi4rs4xxnGBfcUNC_Pr3LrEw6J-azR3tXwxJLunT7KZj1YlvxKnMHBhzdaypKoRMKEzerNJXe6f3qTpAFlulTh6mrLwh3CqSMDrfKnYNpjZaB-9I4hWC8xbmQlGdOsF4z4EeOguxWciH4k_bOgUbxVGp8ODee-ipM7d2OwcO8-hSJblYpVTOuE2uha7v7XouK3SAOnka7Zi4niKJ3Q3R7qN8PYntYueBckWdy8z41bg-qW3i3_v0gM-icDDm8xM90ENHr_qiUe3pbmTbQ4EdBI2MNtRvg0M0onG99UP5MlMV8Abg26L5j8qlOkXvfRhLMxmKi8Q3MO-CBdLVwCnOeHfwFdgluBVf5sW5knAi_q1M_JpOheQZm6OVMBOIbmBqX9SanGIF6_ChBg3vTx4piJ7yh4WQM0NXLTwXfPGTQfOLvKBqdirESXLOvM48CxEERDiYDPXicHJWw0URiMjg1UjlynklV9waZHzacXhzuPb3R9LA4AZ357IvR3JidUfD5RANPriy8E3V7UYMGev7UczQ6nBNWVSemMkP-SMXCSd0__UzNyX-gqXO2On0cZcyp38oZVioGeAfmnYvddviFnO76ryobFVBJip7kdlSF0RxrzMM7Zh-GuN0pINrlFzWnFxzO5MS5UgfgLn9tKhucTj2jdwiF_U2FG1WXqMyLR9Ct3NQOZQpmN6ejEvOp0rlqex4ydJBRlDppSgfzp-pm5W5TgU2mqDPW-T3mzNMb8sI0YDIV-AI5B3PniGnQuMBDMkWUbheweDrBwOPQuJUpBJsFPRRUAeBk5BzTwUNttdmuAiebHi2UfKj3DBho3UiOc_yqALPYBfzAEsKSQ3skVzPP32c_3lCTQ0V3RGYKFTBmajC5zC7dFS1M-_PBZY0FNro1aU1SRLIc9q3ObonhDEbQkCLLDDTAKQPOf8EGTyVg-qoGU14bNVIaOOqsQdlSCvI0nOD8OTuRAeAomqEK4hROVaJO4FwVGpkFQoK_TivppHLYh-rUqOsNX5g65yV3MG-4Tf1hcm18En2glwxLzybe64edBTsVrjK6UYu9TSinEz3Tq7bZY6s2KzMP6dYGUxDj7yKcRHo_PAp657t8RbIItLOdogEafti_BD_psu7yslJ02FCpZlpVt3cG7iDMRrQji9PQ7Hix-mCGW0X4mWGCW2pyUJ0iYF_l4hQ_NBNWlVSxbLNfkDvenNQEgo6aUFV_nyolZ5LeQkoLm3pT-PxDzfvPvl6YGEbT9jXf4KXWovjMk5VRe_NSDWvIdkUxi5Lu4STOYe2QniuUtja_pzmf-5WVidYESLvzHJ09g_IrXGvwG54Az1LpalTnALt5y8GH7YhCJTw1uJROd1N_mI6Yhc2zR4G-FlhkoDFg-SolUY9XuXUbuyfN-9nQwV35XWabwGYXwZ0zZome4LdVZ8NUGd_vrJAzUUdlVZWHVb-wFiWW3O1O-eytjZejb6Yp3A725-7s1GuLPUiKKYBhrExyHXOCp8ia1huciy5DOti6tUNgXbrx76mwNfWUZv9il9u4OSmJDmz5VI_6KMan6odoafEy1blC2EzUP1WdK_ZrrJO1pQwqtf9uD8rj5Hjbt0GvqpG26q1zPtxLnxDE_oGqMhUHOGvDGWlk-nD0qkpLsAW4THCCT5SSYLJiA1AtLqJ94nCcMtjEdGd7yuy8ZNahKg5OLm3OUKWoSy_KKbfWqVuoz6KZZV-uDDv64tG9JAad2hOb3fXcYmjnTlgxORrM68ZPcj9vu83RisZ3wXndVScrcnsUJFdzk2lkIPOvDBmmUh52BLOvaJvuahyvejS4IKfTgrmHABREypwKpojgK7AgdBiydsXJEWT3KPChsLWoUnbYsbqb0TWnR5EDoijIDC600lQaqzKX0cqhbEd9GgUjYglm6zRntKBCBqbW6BVv9vq0WZUbn_HYaf-aqmFWyVViRe1MFOpRv51J86tc0Y9OpKla4_xY-kFIMqmarvRSMr-C-qcap85slSlHvPio3qVkE7ZtXHLnSYWantnuaKqwk4tsVxY604vTPJhcDOdRtSj7dVZ6UZ3TflKJRoWSu6yyGl3K05dhR6mjP8z8kon3Gtm9ogb0vm9qUDup2mnDcANPcxYwm9f6ZxeVcC7vnOlA5bjjudFNMJfenA3sBAMyw0uxEvusndFc1EaCv0pGBh749OI8VNiAi5rT1OROdUPU5Y-X7nLM7zlcQ62d03lisG5Pp8dTFTpmHGj38CdiTDcS6NVhbLhYO0_AjZ6iosKqY9pWAvOSWCo_R8yJ7pFxIr2_F9EG7f58kvMAmIT7OrcVf6hyNF2ZxWkCZHeVnkK6pJsaDZNFdqlB8thD_siF3K2KgEGqLsb0ATgg5jG8C7XNJnAF47jl05mc3pxm4sS5DrcSpVemnH5q5IDEcKussjTn-lZ5HuiUqaz4qee8Oq9oqgNu6kHLxJEBAvuSeRvc1U3dtK7ypqDnplrapvQrFHvilR8-PHq4Q3-2OLP9djzA6tzlzo3F1zDLB1K-848urKOMptVZFmjsEenfs1vAmSWf2PmOyqZ4NdkEVV2qLc0ZokR1n7GS0VxxwqUT7IE_iNDQeL6N1Zi-M1RvY34WWoxot6h7SexYQGaTpdrdTZXYbB1UTc0H8kR7OtWVJC6Yyq0r2mVyWND3vexapyPudo7Fpj7fi3-lrgsrBqCJjlxZ0O-Qn0gHPnPfVV9B61Rah1n-5ZRDuoVQg4GXSGc4UQ0ZCJPBV1l1He0GekDgF6NKzRwyOatMK0b1SuYXM2OpW-CPqYtyPtFHsEKSvI88HZRsTqRDrbvPyZTwSEABF_ARPAYVLiesnk5boBKIbt9BrZL8Dr69DAvYdNdGVFP6VG-AD0hlE4UjLAHd6kXVALoxsLegKHD1iNmoaKKlAsr80PfSF9mH8HVXUGlzdGy9c717tR5GRkqchJIL3THqejr1-nPglRqSPKmcTjRKqOKsKqDBLKFb75X_806tP3vYb_mt3Hjna6kqTpp8UmGny3o4Td5Mmtmh6Mwwm_1Tc_2yBx49-cveHPhHi6q0wzrgKTvqFpMRA6WXfVNKHtS-0eG1Oeetorag2gYxQFFHBvYgOiFkviQasIELXCMjZOoA6pwoPkDvUVHVmYhoVREBb4ruAV2oxm3YG_sF6BucU_no1qKH1qkf9HKgg07_V_ZEQWEV0x_V6qu6ELAb5txoFX7VM4DfIUKnajyV7iFzH68IT6jYpfZYF7rVMKSDAZyOHudVNQoqvo-THJha8vz00j7qLNpxNrBEaOKjeYinxao_qqVP7b7dkgd1nd35CbtdiHT5OK2p7koCwFSnV9lZXiraYptQ3lLdEv24n0mOl0xu6huoNtKTgir8p1VQi1EfjvL_rSIMWBMTGA4nTDxGbqAtsBVWO3WK_YfM-TvsrllgDDaU6l47VVGkPorayWPqOaFyBgL8qkVLXZsutkf29kYeVZzYDfIP_XeASZPFPNgw55PDZVn04MUOAidJoUDgbLnqaXidMXSbjzKDhCynqVy-yjMDbYYTTSwHCgHajj6cCqMDG0GXcTXeFYhx5vUxWWjwHpidRdWYLm_sodrpAE23rIrZxW6IDhtm9vrCFsPFu0aPnb1oBDA9BQbSp0YsvZqcwsl8wE-g0L67AyLaVBrRY7X13U4G-Fo0qBWY8VZw6MbpxkzogshfJ1LmzDHJgn5RVSRQ6FHTepneE--Pkg5sWPYbX6wOwq_zPg6VCz47AKljng43hqXX4evjj5n1jY0Eoa9O4CGCmgArzH4VQ-jHLbINsppjEfWgnabKZYwNKTAqJAFbsaLmgMoVfYxzmnm-o7CK4ERTQdrJI2rfoGv6Oudu8TZSm3N2FYiS-scgaJdK1PQufHbDbs4FV6lgo3vvNYaja4JaBv6hihBOzAacY7e_-J2qeAPdr0vGtFMgUC2HYbl5vsgVZ087gABZsOqPVKqpFRJnfOq9X1MLGSVu-5OJAm95Ctz85jQbUElQqs0-H7g25l_Aps3ZwnDmVKj7RPqLXQ6Pd_abJ2iqOFkLK-oz40NpCGAaKj1SzOODr9bhOYFHOTN5EZ8BtWTWd2E-A7W1YW-A09TQq6NzWXYEuI_zZMCk0dkjs2BqIlxlaobdSXbb7ELQE6KljTLxJ4vWuiAY_lSdhitfHditTjCIlaz-MruclXqq6uQ1J70wOXA43g7f1plNsTtZY5ezRFcpTVrot6NVdVhNQz_GeV7ESAAHGGx4uiqyNTkCt2g7uaRTrWdG6sSY7kwTCm_w2ZxdqfIP98r2DNGn1Z4v54uAEzFVVgVx4l_QhoW2PrJ053kR69LDiDIxcytguZHJMUt8zidt4pjMBKUPeplIoTcM_22_uJVderUfvIUwYbObyrmncpCLHXPJDkETy23M2TzZHx36eAYnQhBZXsbt-GnwjgVWKroJ6kpv1LhVJKf2SLbmDBRROeoqq5M_6TidOgZUZ6h3MKWh-c0-nb17z-wUJY8SGUAjm7mWxJfcDO4GucQyJueOiGyfWadzIED20IOio-Lq4jlFXW-kRKtCajmRbBqI9KEmAig3OVtVQ_-VH0QHFVlvafPUnXbXYvJ51_WnalzUHIBfan0NG4z1rY9Y_O2spzrmPMvN6RifGCkwI5Va6r1MQR127jUJsxRAJ4cKlkpuPTeScqx6NI9zaUCOqCpv1vPh88nspi7uzKUujnoy0xIdDKBvmQfYzdcZGigbkJ1j08h9sAF2oev9nHuh3grZ_aOeIS6EwM9pegXWHP1jq2pJRib1lU9Itzw2lt7ITwstcsQqo07j9A36y0BPF6uO6EDCyIT7ou-mp4Y8mfnIrf5k9t9Umqjin_7MQ2ZVyF-ZiHIpPlJksDoLkhoD-jdkcdxKcgi05IeeXSwPnSz73blX6lc_5mRqJ8L7cjY9-Qg9keiEwDV--lRy_MSiyWzsJEeFdGZo4FLZeyZhf6oPv3Vq-ayqjoHTfXIYxaNBOUBQ1LBfVeShx5PeGbgVu9rHq2jebfYpMlZVuoFuj7aACtNouTz2L4KyV-f1YbPAfnexbNSLap-8VfmPybpRmpf-TlMx9plKgxNTF-czzuk-3HHm7Az6tWXWd4lIixNqqTs4q708qJdQrRQBRo82ERJWwoopuves2qrF-xSAdhZoIY-c6lJoOKA5S20ETUL0Ah4pqvtPHXVHbZpbqP4cuQIaw6rjwvokI4PtSYwGL5L5hOqE4MvIrkGp6dtES44s7XASmVzbMpx1vpFJjcnKRime9bjVp4V5s1vBOJzeysbKiRw_2mnE8lVlQPqEqXjI0aBQA-oAP-hwpgncoEvMyTqweO0rG5UJpWKyzf4ef2qoDHnNSYXo-DJdDKaMuAPMTCwuHVKxJqjKY-UGdphZeqzCO6z45WaQ7dL_sal8wKkEXUVPpsqtAKEmKmUmY3HyxglPmEqiN83-d2ut8F2cn0knM7MRZU_xKZPLVKx2Uwvl8z9RONhBB5VF2ZpDVivoFnqAffb309-kYhiMxm7Uj-3Z7ZYiGgFtxsZfVpXQTruZWaXmPdn-pl4wfYrMdVvJ9fVYMNzxwuru4W_qjERM3r3TTJqgTs18UmoVqxoZVNxuovmqGpZswlNPSq2ScONWh-zAE7bxk12gCgprZYjgO4cUxpNrZgqvv6IxjP1-Z6-AXZmbzM7dIbNwnFF0l_NhBQ6sk1mixQhOb20ee1iZZq7NovYcFxorSP3iQlsdp4CuSGPvDhEM4gU-FWVHTvGuWupiBz0sUThmRa16NOjxd4uxTpeRO1T9tx9LTi63vqlvNuPwn8lDBFjWV1VnZ0Voi8xvrTIKYPYCPPMUVG5BbD9rC5c51ucM36bSP5PnNrub6Hsc9gIs5tN0T8Nzu-xgAw9r9jVv1PFh0pg_z-mfZBeqJnbtS7dx0Vng0PCgI3bekh5ANbLV6GJa4ZzOSVVvMEMFfZRmA_FAmxfUk_u0VblK4POPKIQTKdUwZUXRkMAvPfoNThQoAVpV1diCastL_QQ8D_zUuiR9FbJymdYDx9kTTlByqZ3gUFxUIUQJPlFbmPxdbfZhJyQs7b3M7FYZZ6dbwnMi4zjtIeMoqXBtvZo-qaYiwCPyh76NjMkBHr8a6Tb1XokkqKoW5-EeMhN3J-DQrlSdjEnkhedFsb3Y1bNtU6mJqiT6aZfzSlY6y8wqD7XRUBF87Jmxq48Oc5XNh_pysIzxEhcZFbMtEhN83MZ4YqI4JrAzUcZIxbkIi12pl8oXO8qp8QlMigZJnRq1m5USOqqoj8OyIvpFj2By7chbPxW98KKUJOF-o2XFdHDnRU4WE9gtPZvjE0_FitETuandQ8y9yKMfsiDnOXzFSYgBie82VU3BrLX6oBnDgr5VajUPrEdXu_tup0OuTuXMM9OByNRaanKkPkyQ7k6lIALM135Oe7TDBY5XU80dBWl10cjL0AxezSmcXdlQZnA2Apk3E5NhKsi-nqo4oMBMs3mwMuiTyxN0Wm3W_FCPGwzpFDco3gEXyhmSxtTMikJZjS4qmjuqnDx5iMQZaDjDC2iz8xA2C-glnICGpt3qJEKgRM48MQXEPbKVxfiRbHfyecjmX9T6RcKeifZAN5f5hQ6PIvL0mTMTYVPj0J4c1G_RLqJnhRnAVBypUsBoPtQlkcKm2jdr2ug0Jq4UiWfuY5c8o_c3qmKG_aI6E_6SaVBVzb5e545dMF-LHdHqpb4q-tOZjbA5XDq7zvNT1F9WsyWyYxgPRBpgl6w51PY6MzUrHa8zP18rlk0WI7eCXHSRKbqC6AzvHEzRNjU34Lq9zkvEmnd5mLd6olZZ6KGXg4qlowti4zTboUUltZU5VeEYkxm1GkczAWEqE1zOW6BTHD7Z9FNDtTgQht1K42LEssqhO7UMTDB6nBJFBEFGTC82GoW3E0uqE76tksJgRfu7MQHdaLuopiWHApWM3U6Omz4iOCs2kaI1jm0h0jjgsqsl9OBJuWHUypPdUZ9y4giqQqpBgNA_os33tLKygxZJxHBe5Er3WX0q7gUTmorakOvkksf6bvJJYdORQynBzP2kE8Dt5JCTFy0yZqgCNDH0UeW_T5RTrIHvX6xKqNWAhlpT5cBpe-BxYCzoJDLBzEgAxpSon1qkYPhOt7tVTAGBh_GJfwfNcqiiOTCMZJSsbrpb6ZOnPisKwTQLq9QqIthFKhJGB-JprGsDbe92PdBJARPTmQPOGNnV-oXTQ_8ASqUo3BbVasmc4BN0VbuOOfdrUy3UuSVkJkS-YPQr6pWCPlPdjaQmp189k8eeFd6ZLsrm-1zySg9QBfjs6jHcYljEaOCNvPPrfUBNg-iTlYGYUvyNzYohLDFyCfrpq7O9joY-S6eX58cHoIBBf9OjknNBUU9lhtf5Y5_dsWRdUr2rKweiy6mX50n1eXZFU-c6RQ2dAUve1OznaJb4yclkKTvBwdmCeNjHmahE0FQV1V_3-3aV16hEgIh0PTo9KlSwhkjfDKHQkuFPPiv1xMPgSHhiKi1ErOdPnwAdBCgibG162k1UeXOIkXoV4C_2nFdmIMmzWZjcBf8aaSu5FKfT5A7VQ-hp45ygApz7IFMT_u5qrzKRGbUyuhuYlvfZuysdQGSCSXmHcSSI6kXXEbk6z90kWvEOVCvA6mmDrbddE0z9PlV0hQN4yQO47IvZVfmY-n2xe1tX5-FTr-_58QSXmpysMt0jViTpGVcDhPpOV48J7iXVhKJyRS3yb8Q-weJu7zNvc6vTTj8gXfeqWTkvZFcr_pS7UvXTTF7uTp5c1V5Fb50-U_pJ5ABTuQEFlTmBo128g1hbWGl7sWtZkUlU2W52nZgW1Rb5v8yWHXZgkpGjw0HfDZwQKtinWs5EHfB-X0XXXmoesN36aj4N05UqC8gcMzYOdbRRU9hV996Nqi2PMe849wp0j6lYVRVB5kYlN4Xtt6mEiTIeQJf4NVW76gQRYMIpwa7mC_kbfAZiSVW5m3OAmPj4Or_7nt1_qJ3KuCa2qDJIbvuKdsou6iN_nupPNcsbNij8ssngoAvOrk7053b4s0SlRQUj4oDxzhF38sTgYjDza_bSn2pyvipmAlLTC0g8uVkJgxZGweZlBbk5-A_mKTFtWX7Iqfok3WXfVBGws_O2xk7GOrQlj7bxdRRrcgD6OspkMJMhM6n7duLnOfM2azrMhNidccikT5AcpoHxlMBx5D4oFEyVGLB1LCs66WNqLnanK1MWpyRBFdq5GPCJYDQ6DIAZcmDNpIHOs2dVmMVO9zPe93Ceyz5hX1mTn7Od6-SgoZBIZjpUPRsKEGW9b1p-ihqCdYoTLm2ya0HToK4y8YkbLMpAbQotvibi5Nl8VZBf7UlB2wVVWnQw4YITux1ykpn8Y_fgYCYIPS7ZfXpdneXzqQxK_ftUTcspGswSgwFK9Zn-a3BeeDGyI9U6IEMSBaL_jTzoVfmJ6oRddKgZoKpkxd0a-tQ278Y5tlBzPqnYsmd0K1e0gSw42pPBtCyycTA8cW21kJ1MAM8NZjW5UTUSYKYt3b7YEbIE587aLwAi_5kzDxld1N4nC_CevYXgTPT-2ccIzwL8hxNql0CfmBVVe-ubzMxSnZOurk8VRDBZdNlBncgsUKAi6_-s1CVHpU-Dm0ctUOSRzFWGJ9OGmujukNWBh4ABSFWL3mUnaQ0zMTYA5u-uXieohzwNFL_RfoOJz1RnJjnDJ81nrCpYjKl3Q7QPUw4fSSYpNrPKZWZ6GVqki8osu1M80Wn7zCesvHhS6pz5XKpKZUMlUE8DSuP4YnVn0L-iPoWVQK3j82TLyVU7jlsGSsj1oAMdYdJT_BgNs5tuamvYjW5Fc3iqKI-qrDIfhp2XVJyMUM7q5BJ4c86HpI4DJ5as_nEmNTZwR62wg807KRciGx1uVHPpKCCzJyOEXdaxeqt9j1gQql7vNjUEFnOHRbECekXsihLfecyHyVHo1KQ0gpd74Rs2VKtQngF7u3wqr5FYAuUZeFro-dERRHTZJvLUi53CdL5h2cnV4blyr-gW-GQksZd3sQ-YmQVqpTZ6hGDQ01mE-omNl_QY5raWKkoPQ7ehUTIncKF-7zw_Shuv85V3-1PVtilTL-Ux5sUSY3vR_TrsZkar3hqo6ino6Rw_egRFRv4Odk8nNPUwMy3wN9RbrvFMbUh5WE2O_6Z9RkcWfbQiv_ZxhszphDKjILVWmDzB6QAZo3r5OrPmsk65Oj0WJIRulNeaDVov1EqGLAzRM3gB-U5S0qlLf5nXw0Kjz7WjwEDFMGerOo1zKhU9cqLg3R3UD8E-iL3RBu8ofanjrIYzjNpTdczHfFxGmJP15lStxZ4iOleJm8AwX36zeYRUQ3G2ufgmJ2fqBICRgevu0qfmJDlmMqyqqoGxiebDzIepBsdWLIc5VId9ZHTSM6d2dTD95pQo-u5ULYJfYEWanhLupM188I_aT_Sskh596kd38iJ1BDQSUQWiDxhk33iYidp0V1QQk8nRYnZbTuShSaP_DVY-me9N_aOfs7-Q2ZhdNRD0Qbo4bocpy8zoJoJiXx4MKXlmt3nh8VP1AOC-5G8zkaEws0c9Gpxa17qSvYIENfVn6XlZncpEHmJdkswPa2jmRu-FTITqKEiU3sFMwUC21X4poplTNgoRBfjfysQq1N2KqvtyDi67X-Gm-Hbsnxp8GPjzx9LA1SbGHShVlRPcwFnJOzxBKjMoscFOZ_JHQennUhmTLA12rcrqxLjcCSwzNevYuG_mmHYpwGuh8-1tRjnonHKq5fb55iq84_2nQp4MIpgMRaVsp9sy9RDLC3sLRioZJN1XcOWAGCCpgCjtnAJ6qIt2l_MkwZcJ48V5n5Uu1So7Go-5WZMFM0EjYHSRl9deLJhbKxoF8GGGdNH6owitbb-3OQ_-VYkYldgPXF2dVrS5hyqBMxrcZmVqKsxuTqDFM1hVAn2hTvmJbRZnLg7nzsHioX9Tag8MQKroaB0zYUo1VDvpsYobOD33BgTSGeiwbAktqbE1p_nIu2-eCTgf96ymOX0STW90XEHsut_B99GRf8pgfJ2nDMZg3zU1aWRc7NOhY2GgZ2s-XOwcdTYOngIFH1kTDxozKvHQU7PJM_DJ4AnbVQ8Qeqq9NGtuTfWXyxt529emfgmcmmpvX3UCI1Nz6QQSY7-clMDkChBCFPlX-9KwPOjIstuvOpswsKnzxebICjiI_cfUz99URj5FWxPFOgOSyeHk35fzdoB6mB6xA_SrAfGSm6HaRI-L09CpIO5WAeh-eURLVJNGZ2l2xdplcbom_qI8aU50dQ7pybTiIWY-leHmVDLnAVfnNKwq73_-NNUJ4kxiGjRcQQ3IUi5V-VVxmup89jov9o7AMOWpwOQvJ7E8U78Tfg28Se5DOxQMKKqqMudcRIkulWnd6TaBbWTeRo6Hjk2bmtjMJxGh3a0GPfZWHEYAfKcIZ5s-j-ivOVXB-u340W0c6PU2pxDTI8lP0KGBcgE8BbieVVYR6iSwDanoL04T2K1Ag5s01d0f5wsVFWxhPJLLfXY-oIJxOpc8HhCvZfSH-UbzH5yGMa2HyD19uqcnDp05lAxv1Q1t0UGfCDW86mwNJ67-3G6U7eBKle4Eo5NOc5jFdkvsKuhyR1H0Kc53sc6iwhg0HyrpIPdiEnDi4JrXofYHHPTbKTHw-OIHxEwXcYVNbJw4G07t7SyOQX9knfvOZ4PGokF_qZsGdkaWiN-A5y_3tsHeVJGBflWrT_C1HW5ED4bMRid3oJjoLKIHPqaTc-lip9ccVtZrvxP6rwP8YciUh3-lLlNXe-w0IosdgmFBL5x1RWa9bhCuOujnrk-l_3Cz1-9V6-vokxUm_EbVktoyXbXO8Xm1yWrHwAkl9Qa5sJK9mrHYrV5Up2AOU56EI8ezfbNWKnp1Ot0BjJgaLfOkiQcvFWPAEplLCBLFOj3OwCGTu61moVMN8wT1xE_2CJrccpid-W4vbCwvs7H2v1o_uAt3c4ogKCG5wIDHwR2khoG-59SxoypGrREG2DrRTPkfeCoK7OBxtTjNZ6zbZJ6dsjtQc1-bdLUKf3pTp_Bz9enccob6UGtetg8Ke3AWJu7BHCV6MFHZoyuOutmqzgca_pfYJHNn0L-67cVhGi8VPxixh9EQ-33anb4b1RLRMqMY7ESlrzbZBFghDisz05kwBLJH9_YL0q7y8u3Uk6oCNUkJbPnTaQdMCSHim3GN6j90a6nygc96p-oOPQJtE0nC3stEorqp4hQdb5ycTz0fPv2z6-rSHl8qMe1K6cu_G87Nplt91h5BItTu_OgpdXLmWtXb6W5egQEJb50ZNtNq0n-7atmYTsdNpWOUqsNL_aJRj4e7TC2miqRXhy7P6ZM7Wnowc2BGGinTcQhfS9awXEZwPmfZwlFG_QbFLKff6amMmA8CLYXRnTnmTLNTDApdplPVErJ0KmaqvNfFc073TNbAKUp08FI1cy6kGCkViYOOJHrwKmvV65zusf3o5jOVCvS-qAwGv_Nq0x-v02rnZlHjoXXjktNDrb2hikyfPUgTFnqsP1N4sXm7aktMwZhVLnh6hyhFcl7q7H4vNbLZC1rnfEr5sK8ZJyqzqwgiMyJ4vgVuE_Ph4B_lLu0qMtsjnlNJVXYnqiRaQoEKhIu3AiPiLjhlvjvFnXzUyUAwyssta7GpHEfIsainSpUPTPLS2sKBQiVut7vsFAG8Zb1-2kUVqNCGgV-JjzLDusxYQatXldgu-w5gXdCfWKxyX-rgw-uaLGwiQ7jo9NWr7q1npYVgnfPrqCuBalinP0lxxqNtlItZ0TfFl6pq50wa7PLEd1kvVXxV5v78XSW-nUNlWO0EXQCTzQ5nYtMdtrsYEVy57sRnap0H3EUYWE2MHv4qtOQGU7SJ9XxOnfy5zR0MygncA8bna78T6AIWm-mp9NfDliJzpBP3dqo2NR0iL_-mYsvgsE3-tIqAMJcHmDixN9ABeM9UJSF-39QtxL6g6AHKvk2VNFUbqXyDMNK_8qCwI87aE5UtTGkAgbIb-FD7nCr1kJHeYMJhBPDnajVV8TZsBQxClIZA1k_07djJKsKGCglVbdWPYaDcZjo_lUM72KkhbXYyogbT1Gwljyvqq4MnbLNgJuu1zTPL6Syv3WX4g3ebc6Zn_ghWMGf-VVVQ5NGjlYx6LLkVnlgV3Muqlz4Jehs9TaIUh_wJID9iJpiMl3riszvS6AH1FjRUnEiPZYTd0lRZR3UIjkkzT9n_N3t3luTIli5Xekqw3jAcgwGY_xAK39oeSd4i-cCXEimRKxSS2ZyMcAfM9v4b1aXjbmrH-yoT1D0Xu6Ttl52NvW3v-n5GjDXBpGjQY9jtn7kstrKI9CG64GaunWMeQVfH-_cEfnqPkPNV6N5IDz3lBg2ludHRtumdvsi3uI8xtxmQeXNTWP-BqruNuQ2UOsXTbOZgGYG7YnpMpD3bmeCn-cwvHQNnVOiIrS6kHUM5CqbGTnRbKeQR3oNPaijfiZnYPjIzSqTBmpRjQPvtpzVBVN89ULRUQktuSm--yQgHhS-Rm74kSfpZ9LtXagYMUB2Sv9XZJs1Xb2YbbEXLMPIqfcZUTIXsvZratr1Rzbd0C82oMABUsyborxZi6BRLW39vGxqQNIElJZMKS2nE01LKh92EJAT7uSWdp7N-GdPpvcw_PBDavucR467Zxqc3DMP4PZyh8mG4SeLrbnnoH-2rpLV9y7pAAmvTxsGUQwajknHL9rnsAlsBP5M8njm-vm_BOT1CCFOxUdaWTok82-3amb_Tb7adQvK1La5OTH299qlUi19pvK9udsSQKPTaGvexyZs9tXlSLsJ375JCa-3GGV9PDkrzDWQMqerD1ZzTYMrDRI-qEuUp5l2nzMAme0mrjB-jX9-PscGbitVTi-FGuduPcvFe7b-pyt5lEvkN-L15la5Ok09UrSkiHIqpHVdPUZoIu-jfKYtYhSG4I9gt0Y1pd0wU7pTmZnN4ap_IIa95kBG39molt-d1esecNIeXG0n39agCpNqgxDF3HESuOvB56C7WdPNXjmA-9GXwz-amrm5TxMmFCql84QiX-chM6qPkPtu2c43QXJgUlGhch8Sb3N597RmJyDy1gzXZz6ZBjbTWcaF7IG5t5UhitusgTVzpa2Kolb0VeW9vu7d7a-PEXm3rmo-V6hymkKc7rYjJwHt8gvTOhr0zpR4A1GmSu307n_NtlNY0NVssZdGAQwfAi-uMKpfI_Bpnl3PKtv2jdrN7oA6MxutvGbrr-Elp-UzGTTp4xl-xxMf8dWqSeKU-Rmy1y9v6hOQwcDLY2M6xXM6t6nekCu1ylDAidFYrDVioz76hoZYq13goktUEz9S3vmHz4We90P0vNtgcFDE6LqlpHQ-pPT1NVcTEksT4XChLDMKkAJQl0Syi-UjqQFXcFrVmb95IS2zUFEfahVAq20iGWONw7D1vpq-yep5lU5VU4HflLtkpP27z3rkpUyT5O0_yWtpNWUM6BzVcPKolEuQ7DtKv-uOo2UdihncyxvI2HKDnMKhur6FkRFJoD0BH50nhklLRG1BSdO3hdlRFjxKDvlXonsUTl6tZt-xTt_IjNxYWhAmvf-Yu9fekjtwGA5C2qfQFxMuGkk7sO-6F83-LlXyP_dNW3hxe51Ii4-87poTyNT9iXNu12-Q9SodXFKLM_bp6cyMIVsnEy7v0d8pTitV3jL25dHF8WLTZNaKgXAqTePW-nGVuK33qJ_17hC-7Lp9l5-TU-2E_2TNhi1Jqgv6snOB6aP3PxFna0_QuIY4-y3bozlHWlC1NCs2ePcEU98MpRO91lxLgjlT3LIPAr5ZtlkQfeC8jZ9mk6Fy7xSnX6m8ekphLgqCQ9dTzDlzlqOZxPHy4hWJVxyFqTPOg6m7lD-99clszafqbY2SNd6ocI5ml2O-0QvNdapnfxApBQusc1bo8ar02JoJK9I8whrs5Uh2OFDqeh1dJoeiad47OZ4nuz1JA3vlzUOlNfp4-8bR_eo8l90l5D5QHvzvl23ymmZW6c57zOC1pZka-hokU98Rgg7e-dw7AqpXZMDVXarVm_0oJ5aaMAD_loT8jndoL2gA-Dyd_jMByL22g-R-XtmwIM2Pu-Kt559j5McM_g7O9pkrkm8hnhb7iU8vXsI8EiSN9nLk21sAW5OqZWzFF4V_FaCo7x_G50k6q-JbcNPsgYfx-Yt9zPpyVAwhnZc7T6YZ4lsR992k-o7YvaW-f4Jz9Zuoc-vMrBgYXzCNtCNrO73M_ePNe5Zo5XTZVj1plGY5aDgaULyQtOxTq4S2wEG_P3pDsrKr6lCZ4u8q2vyyjJSpP02U9VqZ7O46SjLZBK81N7dd69Nk-oumPOfez7LVn04Zc6PtwVbmB9d64cuOW4gRQG8mTWkuvfmzx0tNfqTvc6sgD-x6xVC9CPeeai87zkbODPqJetBfbq_LpNI45L3bZemuufM4Gf6rpotoEZyNCkN-ICqKs6lJVTLAkpeX5Hbkg0kzN13j0Sh86-f1-38BRkpW_06T2d2Ko46mibMeol9qp7rGfSr33njfFiCKzNFX5_e1rnF0OBtVNHXsO5TO3-1xaiNmtPVYs4Jlv6-O3iMlm-nUVBfktSe8cdO7q-7bVTW1wZj9_WwokBElS3Pry5Y68lc7BV--ixC5KFDuk0qMluszlNkapUiSo6xyPNEQWofoHT9JpE7vZ9Hsz0dOXODVkYletr55FdroNQKjdZiJqxitm_llO3ZauRTOjSqaci4xjm9K8lKvtnYJGqvRRkF3Ezngefps_w4FdPD4PXSZvCo6akwlRACM2Fky5ar9KBGd149_KY3bSmVtFzJFm4xrEbEgbgn5hssVv4Za6yozyp-ztcOmKpB9izjy2bvPmE5zmug2szqM8RCn1UwkGtUZWEvWTF22bmYoTYp-3oeKMtrDqX6RU-34ptL8958kiZDuto_4p2YKjRbKKuXv995RqwH0tDwF1sWQMikJUA8naFaKvSOSmNvxAw__jPrOMqV7NZ2weQuOtulJknvGg8ElNuG10TbgmHuiymxEMlhJA1dX6B96dV4QoiUt2CFe12NYcHLOIa-JT_TtLWuCBpaTNU_5oi--Usvv_pj16pN9cqs6iW3Om5y5EleGs-cZnzm1lI8S5u1bDYAOYpmB58ji2v3-n5x7uAQ4DtZ8uAt_T7_Gr4bqp3tSY1YF8mAglZLpXqa-ycZsKt6egcbPnOvqcXzEn-K5oMzm3FVPIik7Rh96CRrkcOPov7HksoI_Jdxv7O3KhO2CPyqsIxHr0hlF78aN15NMDxZ4aJ6aK0NlRNl5UzlwUOq3ljjS5lGdrp_6KW3KU2ej7jVlQP_2iTU4Lozef8mt641ATfA-Pcjzvsuw_Y7_DZ2giiVMxJyhP37n1iciNMukaZ8onKv2jhN_HUJGYKjQRe5fhuw7nRcpaXpBzPOtOJhvufnfUURupx3BMReVakY_4OXHA0QbTSDxK4CwXKWKV08UzqWMsVzgWEdbax7MgQXrjNzlVTGV2-9jPWM_f3vduw4Uu5S5DnbZRFfL7p7Y9YngZ1_kAnqWtSbX4nXmHyUmKEm5U-s6U4HQDbhLOxG_Za1LD_Ga5fWxt253R39hNYUGhZcjO2toxjVwf1bmEIP3ZXM7ywzd9FKTom6Awx4jGQjRfb-PwqgY54vyfkW15bqSZmhV_bNg8SdYgVAaoAmgvqrm-o4kSnRY_7w7FY3RROQT959defVX67TtXgL6otM-S59ecj1NK3t_NYdK0LOVYnXE85MfR3qlDq4OiXag4ZZVQjEqmfZVHpALhGTjnGGdldst88edHfUgPIl0AadfLQhd2lguC9jKlj77MpmlNcypw05XDvfWbpoEp96C8J9pE86scVP5DZ6DJJx6FJ9N3wZ9mC79TdhRcO_znsu0HF7Q55KvMNRoE04fBQSZ5HhlC8h3NLKlNR0Z4ySHDWbBS2vF7n82dDz6AMgx-tbkJf9vkT1UvHuZeOie_4ciZNTNYejf9U1fzduQg3OgR1DCIkphM9Hqo-fnBB_VkJCd7x5ZyV6THcq7mt_HdqfJ29XKfnwTkD8Y-rQ9vdc7id4SkKQpzCZTb0Yz4kbr1QZ5ddXOXw8al8ASM8k_r-FXVKMTRnbqRqVh1i05Z6UNGstFDpTzLEV6OsdMZ6brpCGlEotrYluBumTybca8R4v5IJit2zNBlSNY-wjeVpkg9ER_ukQaJfjIFV8FPd4mt3XdH7A1zspQGklz0QVe8kyb5Jn_uf5vRiKwIsLJ011Q_pkmm33PJ8RrITyfdWZW0dDbpVO3C7USwH1ga7TrX1Nn6-qPZr1zbo_TKo9mNefK0Dx3FI04hH8SVBtg3ZX7jf8n1zfm1RqtNH0JjGNFqzSvGq48EEHsivdMroh3NUqwlGo_2UK1ofGJNPigYKVeQy49y8NpYmPPIijM3M1mR3x2nJDqTE95GyZ69rLy1TfBiQ8oJR0HQwL6queSndzSuc9Qy-USp5UalZjD1wmMqURumBR1B_6U3QIpcyohF9rz3HPQF9rxiEPIlXfFXvqmvzT4oCfdOfl4qDBx9kptkLn1BLh_HkC70UapIbsmooBaQdz6_BXWYo8_nKCFt_JSxC-M89_8OdrhMInMghJL3v47Pt2djlL5SlXbnOIzl_5d2tjePSElG28Y574Yrj8sTy0FzRtvX4aQQw93zXWyp6ma7AL2n5NG8oyrKP1JoCTzoxpQx6526QD74lacER2oroXP2m-No2fpQHOTW7LsiKzB7w3rSA_hWzU5sYpqvIphMeQC9HJ_Az7ZcOh2KAHV1n3JnrneVVkKStrReT4vjwdvkUUehpYRU9Y3JkcH73CHtdskRLgNIysGsi_UjuK1FedkBP2klcgBQlYysQNxC7_NU9t6eKzR6HJddVWCaw7SYSx4PIzUVEEXNVcLqIEH7HewtkCDS5NAFbPQYdGB8_Cgl2Jc4CTju8lX8pnJbzmpyabUSfpAZOOD5OtFq8kZ6S1RdenUctjwqW4mke-TDJdfX3cmjwqU_VFd9h8YB9Za7p3NfYsSFsf7rx2EK3qWj4cTYTUmnv0pg5UbjhNtTu-7VckcnoVNmK1n8FUlVN0YPjkL6GskQv78PUTROXsl49uznnHM-yszd_pWve82lqIud9XIlWKl24s2j-MuN8g9FXJiaI1LGmGLaUrYDByuzkcsdp8D6dnaYzdtYlHMp0fx3l555rT9to9Q-335SM--zXFXun6e6zmQJdUiCOr82HVGMdLpuTNRFh14-kSJ8H0Re21hZnVu-rq3tdnWTueN4FzhHp2aXZ_pH5xVd3YxKtETT_1OuTENN9_vsrljV9C_52nCzqVqH93hW8TxLg-IoMnGV3FJULWVCk3e62pvaaI53bEJqqg8uL4_GlketShG3yQc1pYqrlxfiKQ2i7Dh8TumiOCP-yneefDNinJu7UD2gBj3Rt501bixag7P2nR9UfRKtSzuw9XvUTJ1qAHJriobxuXi6Rh6zrnwbWFmUFF6Tx6YGLZsPbSDnm2mrdB17wyn1h5qybXLUG7bU3tdUHT2J-B_tRNp0UjjPR_o3E3hd3dhwPyJ9UsSUYeB3K4mJK9hE4471L7n2bmYw9FoFwsS00ou80m-ZFeqc9EymeE53dI9PQXm8HsgO36bfo7O5uqLrxNEHUk_wN-xtD9uvmOua3TcPSsdbzv2rpBeX9NEdKsVquEU1tupyCtJBDXtHPfU2POp6KG2kXpyDD2h3lKuRZvaZq6ZcR2cjgpDtxN-G-e1GETyx--b8exNpDMlPpR--CAX3O7LzmR7nzRGRotcOfGvCi5H5iU7x3dKSSEJyalDbNmHZcjarX4cOzAqav2PGAe5-eQxltA0GlUIahBL0pLnsVWxUsk6CkUAlewDpWmZMuZtpUZ3r0sTdEhHBSj3FYFvn0XLqyDZO9CmfyDUI-ZlWp5K2P_WKVCg0p68SVtYyPQkC7pK0OmljYn-WtOvOK0nZahUuj9InbAWvHB_cgLZ4a1lwfMx36tm9XTxHzGQC6x5t8r7Ea62-KVkparnXPsob7_DZxmkqj20tw8luAInpKE-eDsPTnxdBnSlynHbDKi4FDnWYam3KVXinBeEUpiSmMfimwFvTm3F7yRaARrDZ--a24uTnzXr9qSYpCu54x9KTOVkP21m7QCS0mDZnjIQzZ8lI5pboiLZPezR2DZxX9uCfem81FC7reaQj9X_KaOYV7Tx1ev7uAnTqs0jNvWRNJIq2WLHPdOix4X5_v0Qj9bKJNjXtp_xVFdWnarcqOhrANzr0HR9mi2UkFUzdcZbkcaXkebWh3Utffpb3nD6tfiAKoaRIN5Ktho1SqajzP5VK78RrcT6YHj0lq0b19QxSux7NVszlSz-yNreJ2aR0jdlhel3uf5vSeEe4rjhC9CZ32TI6ojOO_s0tSfeZHvrovPu4IZqnTd1z7sKzvuKZIymJQ1wQE0nf15GLufS4Y8TeL5SMqYSwIgYrtCTefdRNqKBu3PdgsZb3cKWE0kuXUzzPwyWCZFzNrJu3QVvLOLOfe5dtsufB0DO_It2iGKpzbRZsDtDszLnTHrYpG05t8w_7QizT4ZVz9v6qT-o6vT4_rg6SXqsctJaSREBx0XNo6PlNytue4EtxQtkLfcslSDVNcfT7VndE6JHVNNQeJWPEG9iaXkdA_OLQR7s085iq-wdl3rn7Stnyym14DyKwjVu8nqQbM78TlVneSCoKv7PN1_LIq-WVt2FCIpxRgqTfLlOapOc6UoKHU50_2PlvWvuK0axMgsN4U8E4MqkqMTTnEAeUfe58CiybOEPXP32EudaUJscegCugtNBmxDaunvBmZe6AeI5ctjYe_lSbgyvV05zi6LvjOptVROT6m07b1_E0rrmM73xbWwxSnPApLvG7TXwJA7QtbQx-JV0baFyXR1moj_hvdi5BwvAluD5tiqUqdONSNE9xmHVvzuG5tPH1j3KFjlcGZaw2TxR_pl4JO80m1Jz0PXz6NAtS6LozELPXKPB2JLRcw115LIOT47lDBLTblCXrt_um37cIlZKoB8GOwpqmrF2aIZd-K7uBFH3t3Vud9FuftuliOUHGN4fqqezgMlzULkgSKrx8nL_nxjf9lFfxH8eDbFWbKenH5tKBOmjD1qNp5m0zv25_tRl641amni9peNXvFGWes_eYoLsTvcH1vrhZdOaSxkbnr7emjF6r9BHpfXN32cgvAAXnWgrpWNh7uygshNmsjWM6Sk-3c4yGX63w-y6gGSg0uP0Hq73sASkNkrQjoOJZLOmI137LQVHFGbNPwVhL40SXNpWbslRLSx1ZU6hzq6pGcj7ao0UKnculeMXVyahq7jMfg50q-8achQ7cnf03o1jyXrzjzX94lJtbuNV0VynfVU7INKX40MA5lTwjzhwVrgFQiwlT10VCNWqZvsrzbqJ7xX_4tLUyRXb322rQdQzHpM-IGui5V6-gIlaZ6rAQqb5NYPPejtTFdHUcFfS5V2emt16dgCL77hv2qVNGeA35nL5VeZzgV7oGtwhqq17I37REa3ct3CmGbCgCClex9A1J3cHKjaSCENuM0oR9T6dvZrHk9j4a9PK2cg6bfq5jzuBbXAfrlKecDo2mzJmd4-ejC7Wj8k1wiOD9cEZVqepHv3WkWxXSSIC3V0NZsNv7tlX7RNK0SZVwMxTcHMXeONr49EDUtpIsTJW6OT1C6KWKn7v9pT5QbtAdK5Gu9FkSddtMn7wMY4ToPPrbOtwe3-7bv3xX6jYnBD1CacoSj0tW8nhSMuux8yIkoR_eYtsM0qJc7HfqHp3J1xwYz7TFnKd0yiM6OGjfqhR16BSNM8r-8GmWVLfki31FTrCF9jscpZPn3yrhi8JNZarh-8ZNM0EfO5LvyGfnoJOu1WzajTG3wVtztevtvu1vpDtvcTy2umwpsVtzVUpfz5Pu9rGPjcSZZg4Tw_61fJn6CdMf39E7N9lNaxXj1ptuf1aeZv6z7CLSUwyCyjlBTz1iav--pyMSh5lB-pypHF85i2ieV8T-Ozr6d8gvUw5gTXiyPzG0nrEF6k1xMUoHvNsLILI9y1XZyoMiC7vj-9BFUNhZC6goSiDjbJOn5H1tgobSuA0qyHh20d-d-ZEeniNJ2E0zV62UojmVF-qspxzihWpHUpXEMaAT_JZNuURv4SiXOn2mX8FduKQJ2uyPlGS3ylbOg9zBFLx32_oVp44mn1ZWzV2-WBlMvwpa9ri7jJifjonySo-KYKGmnngJ8j3k41lx7l-5Y8fcW639PbqZqqxNfqfSf7lazbXLLl5j6qyc-rIfev7Kjf24y9P0b-XtOhls-IYybY_1a56vUnm1k5BubcLo-aEafknsoFXk2uKi-P1tupNXtGWVeWEAaY0pbRjfN5vomEF2DdEszIuoSGc9yZouwaTy25h5-MTVggcVWLhd34esCI4Y36izBM1dE-SE19V-cxjZDBzNSt6UCVn5EAT3pmUlQdKA5Vp49zbum8xKbsx9JPCaxq02qo8mzLamr7iOZu4mtb97dy8Rea4LKIMhR5Qt6tJcXlZJ_j1bnjj-5VTc4xwp-fql6k-5-cqj7701TsAB3ZuUvEpnwzGisULzpqbidVhKqFxSNag5-JvM_nPwDueXPALPODqJJ1PfXUVC4yIRwe3qHH6ppSVLrZXeZUI9QhUMxx1iszJHtUAl-IrcVAZtMdvUZmtcl3VMeMc-HP3SpomTpi2UaeuHW2pwWcsIlq75KKfT84jmuzVvmWmOq_aX8hU_qaC5ff8yL_Qg3FV6zqW7fkszvbjRP03Q5v6Z9E7mELhuunG9Syn3pZXSMpmn2XjP00g1aP79pi6X2DmPhMwpFl-JzyhQOjvaD6nb7kIz8N_3cLblRdZa2n7LyPqW0Xb8R-Fyxl9aOW81Y87s7Zl7rXppTynbrse2d44FMDUBSithNu52letqJFa4O9WZdEKueZTu55Al8vzLOc7lTBfyce84e3aTO5XazbOHyUH52xacsMDtXNbvwt2a4tlkfdZPvuLx3CWyOoXfEbOeyV_WdMbnOqjMZ54CG7nRyarAc-rka5_zeiARSDHl-X7lrdL44ARdJbaoYqgLqhCrTp5m6Tz7NDFNLsy21z-_KVWsoTXlN8VXJ2_ZAO4ySuxnnOcPsvMgSajP6QF1HEPP2qe4jRtvfIslpVB_f3sn_N3PUhMzL-760Fe5DS-7tq3hKToQgl-6i3csRb20-somuO2beYB0mXgBU5k8O1bM-k1h4XaLtbi-ylF1EvIex-GYRyyyneUp35pqoXy7jWKESgEnYLCI_7S6NjTeL_N6dOw54ou-QzlEi-JEnfoT1Qqo2O5Fz6YZ0qPpyhSjdB-1jm53t8l6HUPxicFRBtBIddlULHs8vojkHDl7ScmxLekBfR7fnIdmZBHMTZiPte29fbF5wNDr6Hb5h_Y0_M8ISp451djUNzycymWno7oo2_1vojpsY5s8r0MztvOwmglJUTcpLSkkbTrfvY363t5nfL8S2ihZOI1G0jIN9FUdOmFIU__hrFGYLnk7qRajYP2qWPsYerMSJd7dBSnufrevibpNpX3NXd6Jnab7HK_QblJupIzNL85SGRxnqQH74OYzsKic21fv3RF3ihjzCQkpTqLq7DKlqfs-fUMjy-4Vr8u5upXeigbF7Sop6BU999ksrB3KYUun4j9KUN9yC1w5o5Z6h6UNxWrzGN9y8Mak25SZRVlRepVdYu9I2YYzDWPqjLmtpp_lnYbK7U9fe_Xe4mWpRH0zn0DrO61u1N3S6COIX5EQpjJA7xyhaJ9LU7EtpwGKCtfYNBx2218-1MbRVnpd6o07XdMRpcET6HjE-o6LtpT-YYcZDY7HLv8RHZvp1zLqCOy3O8eK58ScT4_5jmd-lFAc9SN_j4vgE99fYTn3jbArrHoY20G0fwmc5scsj_PINL37s9xfe4NVhBS8FOr4NS3NrdsfmcTxzebUS5-2PDS9uHjmn69YqObOc5_fS-ozFwy25yb75MkBXzIYdarTlVtp6673nEgD39pF4c2r5JXcY4N_yE92xehjY4Nc-eMOzDCcyHIYX3E9Pv3OkTj5MuJ4SnfrnaCko9IpueKVJmu4mz39UnaPKLeK3NPvxg30e-ZSGCJ_qZHVMnSyvSmpgbeljGJuTtymp5uIr5i7uiQeCcpjo-KSj7tvF4xuN9yETcIp2zwjW9r0R1Rm849H1dqVJoDijm7pdNKnBvwE93LHT6mzse2o22hoPB_6JQ5e98lVbnvm0t8nmpZ25D9sg9cVkyrmJX2_egsjgj5haXtn7jVF39Yv-cTlQKFCvUZkcBlFqoj8rFJ09vK7I6bZR2PQz5Gm6Dm3WERbDFUMk60T89l0RpupEF3Syz-jgaq3TBHtqbeoX8gbZSdhq6zp66k_Obv9feYsPV89ASb5e44EPb26bBlaVnoCcyajAbuhOT6AYvfuLV7T69Ngx8STBNZ-6VrTzPnBzbpnR9Vd6MXhjsJmjPgbLHMP2h35cmmS_Fls546cLF8UFjXziqDy5kIlAY4dJWf209baPnMqJXzhKPW72IR4UpGzSlt4dLK83JYUWbS2fKwU1Iczll7Dc2c_QqMxcSXLBipqfWr_bRbpjdxjtth7Ojfn8gvRCnJ6Q5MUURT3fSlTNKff3lySanNo_mjbv84l6kF70Bw58uaXlIJyvIf-xFRoy337Kf3hTul1_-ljv2XXvMpQrd9Mrz-IvMvop_aoJoeftEynPGzervhHEqSRHnWUvKWqbOlwKdimqBxTqvmFPsN0AfWTlkXqQ5oVriX7cIoGO7Aj5ycV2jeX9jwy95qhlz-Vu1xWAZ-yupzPV17iayRwlkjv__1u8YnKWnCufaN5D_dPg0tqxrqsZxkdbjNngztnaR99jNlv3mSnoB2y6uvOfarTwC-hOjMVuvghzTBx22LfmYRNVVlbrupfhbyUrT5uH35Uc6zfM0VN8Bq8bP2xTAFzxK1EtPmdvu6M76abWsfcjbslEgBdQ6cBsrUUMQfCHsF_xT7gHzB9ttneq7l-z7bdKF20KWG3tW3T0Dml0MafL1tK1tPe1L-qIXWjLKM-Uye6HUJ06BIlObAWWQduTPSJqdpgEBbpCF6xf-Yq6Tv2jW7_KAXkWP7SdPGpnSO0pnsJUj7Eeaga33V_W3qyA30zcr9NNFYUrRK1NCr3t674ucTPH3wO9byTe1DEj7rkdmanXAa1e7ckjp9Jgy3EVL-QJtafSDNXHsxz_B37-28C9fBsl0tjkqezMeaT_kWd48nyrKb6Ld3o1TfHj3SUyDSytjFVvzFDzJVvjZlfzbf0-5P4nsz4EQWPkjEfcSOkD8753-c4kJyPzg-Zat805GUs2hlFwp6jIU7tVL8lHLtVr9JbsJg-Zdc_hGf8eR907mNaSx-Jb23GcZbGOfLfBm3R3IzO7OlSrOL3lu6xuTmdXqVPqOc5DUeaxJE-5yO9Vp-1cBkhpj_yi065NX-_YdMnszEn9lwtfvgO834_ZIbPfB-IO3YXCQRjp-pwkC6Gg-S5RRa3r8McLSsMBZcGjxdYqCQlVLvPJeq8JOCjuqLsXLUv5fLd1tL0SV7aEkPFrJZCbQu3QuJCcWl-YF409o5L3piRpWkqZn9gIobVpzp85lZe0iZ4-m8_uQT7OSJwaSfcELx4XBISgc1j40xhsDU_P9pa2hxeed2kV325CDj2cs-mhk8td6XnO8tRoDqfSvilFKajn9BM0ts82sfZuZrZq6pvG_F10AHtbgd16OHWkFlBrbLoH83SKSJtxq5cAI_2p1yqa1PFY3QisT5Ie-SN0hbQNYTwo1P9fZLSx-3WML2XSP0VA7ak1blnJyiHpnnzoDOEi21PkdJZt83Pwt9dnWjW4s86_vHqTWb0HFKF_rMJNoe9Uv3uvRVr9Mqp3J61tBReqm9awVd8NLWI80M67vg9bI1ygGN3lOxw_GXFcF9Mx-i51II2JknwUqj7SWlI7mZer95JeVHLyMOV2x2O9Kh-ddbz-j3q8fee6yMN_l7uz1o65akXDVHziK6nMXyXPIUJgYeJYhPt2mycx9sT558pb-JZtb-3HSjBqHRJ6QhmiLZr5YzaAJkcUtvOdkjPCEZzLL0ntw9aa4z0MQHJVxtJw1Jld96Vn5YnqZ5XRsUn9SHdzpFLcKJ32KMSmSToKPNVHc33TTbsVJugmljmWnym0nnlep3bluhNMTKiwTqpbWf3MSXfSzmj6rGjyGlGKbp3dlJQ9e2bpqq4UTppzDfVwMpPVgJjfqw5hZbnHiGGioK6Yc0PfeROe0eLuXNtP1PNy1c667k2z7W5tfm1HePaPrCN2BXH4ak2yXG0N53Z472y6KMRlnkvjWJ0se6mXIVLc_o1DQftjmR3rLevaqS9_J0zQWowepyn9YyU5kydYsLYn5hl0hTZT36bQpFS3fHQ85W6L9FFN1q5KUJHlFDkSL9ZNIArNsm7xB0cnmhJfl-vKT9L8zRjHWRAuhIsXKmxEeO46UrTPQa5YD9TMH9zh6inTPXHbvNXfaLJ5KX7_W4lqN3uJ15b-6S-afstt_R4s2U87f1G73ooufdudG4P9DkKxSmPj52qx5gL0M_FY31H5D2xgKMIbLEqjly8nqIyNPcWTAtlpTpSNlCTA-lx6YJlI-o0cojgArm1Dp7V3AWq8xTp6cA7PdoScc-pKTZz3CMWuQzKO6_aJ23mRyYNTUlsopGDYkb1pZD__RbcW05fmhsM_28nnm3vMpTKJlBmvDbqa5SSKnpUkltarnoJCXQviUW94qZxalQX8S1c6nTExbWcklKlrqUTtft6SskpEW5K0ePvsXVDfpg4-KiU23vf_Zx3iWt2V3aQNHLu1iBotuS2i_VF2EKekXg4uaWk-LkRZTTStf0qHCmtHF-mYxLT0yrfzRKn7pi1HKKyy_LVrGV6rVGdqThQGKMUd-08ItOkZPt9Pk1FN11omoutrAu5NPGgkXry7iqs29uLMHX-0dXYAcjhucptItHby3abIu9_m3mgwtqvWT6ZYtEqyVp3Gz1KSIg0agqsI0jOYZvMf2-jWNVaY6MX8kZO6YXKaSnl71vS6pKzllxLxoun7R1taG__pp-mQGpCalLc8l9zw6OND8XXflflzuUE-J6wdPSWNHq6njXfHH3IswwQ8-fd_GGJCVK6km-Cal816XSnluOSwz1662wockobldkgr2mtdq81xtFajiqNqXwubhPMuCmtrPol8U5kLqUAZ9Fg2K9lsJsGInEvsbNwuROZhczi1HzkW0lTg0ds1HyYCvBFXmVFfNt--gbprkzR1hLkj8gq8uM-FGRt8WJDpcXey4TTdUlr_9XQngY3vPkET3LZT5IaOFOKsreLi6_3KZ-Xtppz0I6Kfw1H29bqEwniWVJE1IuYmWKDjijHMlDaEagXfWvryAdec7C9nZD70PE-u2lw956chrTyueH9_0MxYB7BgWIVoBKeo7x985NLlrQwGBkHlL7P3hobc6os2kzVsX8oNlt_x0dCyz50Ss_YwHvvFdVAQUzOdx3uSt_PuX025dQ1xv7ITTf385Xy4FTg5cl5aQbdLj8Vp4m5aj8V6JLSzQ6w59VtOmynSwlJY-9vPvX7_Nxq6fiPuL6p_Ff31j4IwfMgY73-KGtXySyjh4txgNkQqcO0mpZlkBCu_GbvuOSpqvOxeILmuvpnWThU7e7-Kzb9JyVMyXL2XqZnOiQ6JrXgUTJLqig-kh5rFZ-9VBnVW9wdFeM3rZbMohTzDnuMMG69tFxug-rBCI5n0zj872pUVTE2nr8Xl0EncLQTioxEP-1t8MSakT62wcDx9nkaaNY_kV5R8lR2_MX04481HoCZov00bVpV7ySbMf6X7lw3_Jfxu3mDbVQ_pa37jrsXzF2jsczlc0592wiy2zxy7e4cFXb09qfv3PtkkfVLy9hPzdGcqOePcpnyQO5VbqYdbq-jBJB43fSTn8Ey1RXsmPqPFH3qbzRkGnzU_nobvkwcNu-ts1BK8SbD_Pf9pkdCw7YVvkruXZ2fpYjOZU686In9jNzk3Lx-TrWZ30ASzF5WrW84j9pXkl67_zOaNwtlb0ZTnMHsvlM5IOs-c5-9m6o-SxkoKam8Rx3VlGfvk2vocqpFlDUTsrOMZ21iuVURRu_65Dr4plSSg3V1CjxlXOk9cXTwlzv17JakTEr4TpWQMu60CzXv3FN8UfPSgqMjUMZS3_DnmETZ9Zi3mtmU-PR7-_QZKwrSs5o8YsWRQ56DxZ2_Jv60F9EV22odS-mU9ZqYl9TjimKPx95PFzv8nU7gauN6xVmRx4DRi6WpR_jop23nbTzNVaJFvVMjmQfse_WdXUj8cXnL5VJ3Dtn3UMt-Y7rG6u-zsxW2WSrh1k5hpZ5AAqHMq4T2HSzvNireRwyokr2PLTqIXV0_b_kma--5-1ymU_Ul73l0OlpKNT5vCu_bNy9gN3l-aAu0Ja_j4jNSEzDh0rLSzkpblyJnd0H_xi2bU8Y7c_WmTeoHmgCt5p6eI-6-u_OOPH6kkkcqnNJhI8WcDSjM-z8pD472p1zwqGH11NVEESzL_BvavRWBPk0Zzew3lcwUIY0mJZV9pEIzwInDfH3-sfSks8j2MvMduYzbmF-OVKtqIk2EDZkJSzy-KCpj4lDWlrGw2iXVmGn1u63Fc0_tPnfuS2JTwM9lh-VfLL8VAXOvjrJ10MUhjcVU2WLpPPPV_RkE9twMyRrTglPAm29ECcF8GdIYP4F020gNzcfvUrge_M64udIhTYrjcqxVk2ehNJ9cx3JkD9NtuZC_h-33DC75U0sJRCIuOSTTlZH0uxDzK44I0hCdjX0F1_bDPdozP0kTkCpmhlBiqAnzsYxcnimHI-2kOZ8Bx9SUzDT9k75pXseuEvdjrvPE6vJ8x-0pYhCnmYbZyU4P72dfKMXrOlDlv-Uy6N7SXZg3pXl45b17ptbATHNLvFNwUU-fw6FW1iUJut3ISFWjNG2YVHqo1PtedFmQvycZNfd3C1KAoSqO9JM5XZ_mApHCduQv291bdJdeJJUTl07_-o4aJjHsMwjnC5eU_YDKGf_DFIegNEdYO-vHMRQyJ_8-olcJfksk6cdfZtI7DcvH1sfWmqJVCqWpGj9GNdgndjO97zMe_5sfZvlP7oM6xnQhN9EVBeKR_4r28zXmHLowydXmlr9PnzLxaJNsL4-v5XnWKc88we2C8bimslUfNG9-CltKOvCy6vxs9B1uiu_fkqJpHMdvgcOGLo_2-VyXtJ1nLs2pn2OzDz4e7YXPElhQ3ryTvAZNoqL7v9z1qW11HqaKpZfHqr9KAKuzMC_bbNVy4u9NXmIh4uQi8MlnlXIUGygOx8gkRCGNkOAdpmKmiUsD8BhuG75ncjHzEJ0xuhAf5vyKWE2GS-XXTA2p-8gYb28fTcWWSvkRPSL6ktRYeD56b_UJ_jEHP0H-sz8dZgup6ts2jyJI74jyNo10U0wx78waSz9F8KvM6SsiAQL8HUkNFcnUoh45PRTtxCBMvKNArykpzz-ay6AM4WLFZTET653eBuegXse5v-fOs6WfY_XzuPt9XnklfudLM2QUGpOSNwJyuiuKbgmvnyYSjzgAZ30hduwWk_YZZmFJT-yTthE7aQ-24oz-sZ65OLHGvO9LgYxp6bbILxmYkHZsGYw8UHVQNeiHm8yqutHbzX3eWcG3stvKOXE6HdsfR8e0-kj1TY3hVPr1WPY86qPRz27Db2Szd_eMpQay88WJGJ2TnUtpjuqPpgLbqH8l21GQSH19NAexLf_mP_QzIiQ6Ec3fn5QHpfONRFIeiZPauCk5F8K5pw0xiUzhnIYFC1kFt33bfzoMl3R7NDexrnYdXVq0TcdQIpC5O8ZFGYZznsMPwhYdWsnKVzxphFEn5zeidXlT1Ls6qlzzCNHfUuuvwQHJd_BIk4yYjSae4hgpIydJuYulCdx4sFs56VzY9PackUcyXemqXHFohWFuhrOOQpez9nZF7I82GP636R3_PFDme9-2YIMLsZVSZsuDyY2mYfNCwSE3WlVNh8ZdYvIY_7GkZ4swHQbeplP9kzPupiGPnlKaXz8cXaRKngg8FQymI51ZmuuT4rWKNT6X7tZkt7TwOfVWnvaogOqcNe0yrZpjjJ9UtiKtvE1GE8B84HPJKyqJrRuUAsELbQJOP0ubpdrCy6IB1XXdZa8AdXCY6XNl83rSxjNxD4rdX574eP7y8flG_EnusJwEm97gUM202aYvGRm2dpaObdNz2yT6Ydnc6rMI3EseIntEXns6itKEd3pY_l5VyFrik35b14UdbjbyxTgw52ifebQbOaXc1P2fdm7D8UrZNSYLKr6_beOchg7DbSv9B-WKJ3mkwRunuBdtUDhAy3kvlar3aJv-sYtY9ra65MVZg_w-0YbsdrU5DHlK1RAjj4V-fewWTRd1rz1VmPLuGyqu13B5cpiUiIaa43O-1uFNnCP2ufe4xUxwTANf7Vu6U__SZMam_JEGSCY3yk6K_6ogGjNvPOeXPfuzZ807ispoEs3ZRpxEmWlau8Yd9FRgs9txv5ok32mgzBDyd2PM44hssUvmdnq7ab6OYSmlLlUmOkp_l2rTtIOf0X4VdeGKwHQOenkMZWcIxjIF55HuyVaao8Ge8WxnLSd-LeMJE8VE7S6fy4ltml9uiqzznR6C4tNPR889nsTzP6Q4RGEEKj22WgCN685pPTcHeOeIVMmssYU9LCPJaoso5YT3fCuh1OPmXUukmXe-REpAGyQTDCSxZ8qFu5w-Vcs1p3emw9kkRypNy4fAiNJXdwps0Wev4Zc1JaP4R1PpUza0Mi8o62Qb-ggqkrd8zbytKl75iL1VCGRlu-lz9iaPuBmPRRqbuahduF90Lo3-EUUFlUunQGuA4M1jIzFvyxc95QoHPu0MiD93lTky5X6lSvzGtFYV_nGP1lKO9jOvqCnqnJ_pTj1yyxPOFewEMGSmDn03_zQftuWpC1U7xl3ghJcu_Vxi_drdph-8dALVzXHfOgGmyB6RZ1aE7_JvsHdj033LBjL_c7aaZS1_qpKrPaw9g2ynVJFHnBBbcyxKR8nOG7nXjXzkFGzSGEyUrvjkZupqamwmSoai35tcoX9MEfGobfLSrZxNa0kL_IFXtDP18qc0YGSS2ZZBMSROQOtfVF8sNRUSJczc2W8mPvPVuPfSENjsqgd-v_srb-TN-4pDuTnX9vLevAVu-StKqnNmOO9e5Zti4Vg6IHCY8Zr1mWYWQ5lzcMwQpk5_lM_0pbbeCz05F_o1vsG5fy69xFQe1SPus1qQitcpYiJ25ow2FZAbqNabh9dJLeApWl-p15wKzSNSA07RVVMTSGNru75HYULJVJVw8a89DW4cCqGml6nebduv_O51vxRbdqH9kiPJ4C6r2KxNfXhEPMSUS0natzoy7wYnwelzpvrLBkVFqpcze2rXbXuLlInkR9G4yoTdPiU-Kpg747dmxO2VTSYPuxZazU4E1YNT49VGDiU-LbuOe3_GxhuePCqBZ4rfI1UAdv8zM40nTpqRva2trY3ikorOrrB8aoRyDrKtc39GqDhikZQzNQ_do8rOLomg5W7aMUdnHDW_WYnG8tYK0HG5_Wm2PH3s0MhEpRlpYM1pl_zR6TrV9U0FXu2tcyrQsCFC7LYzgzW-taXJi2wrkgpDDe77soM0OzlSHkRrj5xyxzhK2GeD_zvX7nWJw4m5MmbYHI-vkSCYQqwshsXMYZJHLgcv_1YZscsS2-wzq7ztp7_OCDT-nBIjTfC5xBneh9P_LPl5Knnt-3fO8Ns5gZrceeKru6IA_Z6Ct9qMa9TWwHdnwykJSj2_BNXZTN_Mg3XGpB5mDaVGULmXOuht8Nu_8xdL7vtw7e2DtbsPVotahrTl4Ju81cm6sNXcwok-Nm4Uw6aUplg44DwinWxpt3KU6gp1Y3qKch3WeKRrvKWzHX7BaCngHTRbJC8U8KF7bWrTk39uuf7xkrF34n_ncCtr8ZUO3X09GAEUcmPbNjxgVG8qIN_-Mo8q48xtZT-W24vqFjsyJ2TnY54N96eKi77Z_LE3n546jXiZQbzuNG8piTg7dBf44akiqtCGI_lKR6xCogXlMJ3bu5n8b3mN3z6sJcZgKfNIOnOZy--CEB9pfTyRj7I8bKq3kgxdNHu97DRcd5EOTK_1gGFFf1-yM8N08Gzav7ZHnXN0maU-4oPttKSm40Tle1M92NxlJPyhnm1xIB5pcVD4r6Y7PH9yUO1_7X34ADnK7iAPNibotToE7K3P0CHbk7Ub5zU221pLu9lK9fbmnLlKjBGm9LSfcurRCnGZMD_5Ge_YiWG81TClRNjr0wbfbQvf8XlsWb0_JLRzLiu7BTObUUWtgxmyp2rsrsN6wGmgclEZy__jGvHnODXWZkdrXIRnvimzTvrYKZ6h9LeZVmROp-5ej-O8_DmUTG5jn1Khx1enmvzsZcXxkI7dtT2LihNBnz-8b_Vb3exZkloUVMAcm4pry80weBFlFn0jlEkAeZSt9SoD-XcOqPJ-T-jgPaR_pijYIhRxvkQ8e7RZjrolpWKcW5xh20i22EoDm9sKvZ3yvyfnzeGmdo1H_MjlpyLZeYbb2n8wbFNbPcphQsOlT1PPb0u-0l_1aOpiznB217xScD-2wV33LH5L-WkGNnxwS-6vHBdzpInLzIbPqyzKdHy2K23S5qafNhtvmeNR_ib5iCpmnPL58zef-EZCLE-7vptD8Uqt_o1I_YyDuqRwMDHlIDiiCOHVf2j1TYPQRX5vmU_KXf1JB0rt8zCzwO0pf3UvUTAvW5RX59M7H_XYT29L8-19JBS-NkS1qbpiQ9hWSeb-I6Y4ewf2wTwqD2UfHQrPYfvuoTukr9dxUt2v5hzH4MXxtJZzN0e8bQllr2pmyh-0lj_1ivdlxn63GXByP0ulxrD4NuV4pRdH08XjcGeFAUMio0qgH27ijdNAIaMi4A3h-8aQfI08MNQ_ZDEZ5bFDhxpl_UsRd8brSrZoBc9YctwCqSX0ics3jynn765ir_rjfpcdiTmE3PtoIryNrAw5m2sVw_7ISz-2lHorzt-rBeAnXyqFJE8DV5PbUAfieP_m8rAJMklde27NxtQ8GCnm0_wrPMrDp3bEbnOmWRnRR-vMykAqM-7m2UVg2N2AzyYywwv47n3khTdL9afb8X17uu0jpkA_3xIwJO99nMcUgRQM_He9KXooiUJ6OV3UF_ehhJmlfoEScPmbyNlblGhZtDQKm55FhWsyp95w1tn0-g7npkvP0kFOVQtPAYqrzaopZd5688Mnxdi2lveqd2nGQhnH9a6H96aXvmhrdR95_6X0xH_BWLm2Ut31c5RHqsPfzbk1w20ehw8a34r-QnbXt4xKp6ZMtNdIBfCGI-y0LzNHtfdCfFNnvJqaNbHplLTJpgbcI1D8Ps815f7vdzjtt9yMqXnRILH6brsp29Wo2r_-2vzf7eh52OXvIHIM4t67fpTbR--p71V909epQfXW0QooxdQgKGBN3_39PHjfsose5TpzuK-xzO0qr8ihPR-0du2NSmwvR8JJ8s7hSBffzrq98yJpA2c13SOCz1VakmoT4fqzz-VJcQSZA5Q9gMfR5vnIzzKnLJ3T-3xy3dP9jKzDKYX472yXhpc__Co56RWLP3c4RuFWEtleLx0J7Oinfitj62x56TmKp34qewCV3VFmO10wPg8tIvXRWnLDNywrv94rdq858JVj7sEpYAYZLzfWt52TaotDqc5cN6Evc26rU-_SefG55ZmkjjKzjcZ1xfoYWQGDSc8RbcZY_qqt-h4FXLXIvkiVHS_3iu7wzfWo26GkqIKMfmHWe6aTU-nY0T4jc6g3rhJptwgxS_ucd0Rld9-rLMGrbX2aM5T4-TnyRFPyPIZ_OzZTm8-SK2zNU7Xn9_3y0berO-N-XaW92XfnUcoj5d5FBTKuvv52fu98359D0hxy7accssE-fKVB0GmuzZLsZL99gqg5ZjL6Vx0M_dA_N1G0Bz66LW7MqoIck7mRPoNJlMCZH3wxpIljM9-lOM55nJ1VapwPvzznv-mBWQOfpu1vzpq0lSYA5v-0Ew1QHiWtxol27pRGPfdUfrqxgwb9_rs2Pvk8tzbnZ9T5pVkiJwDNX0_wUTSYu8_GqwTF_Gfuh3J4pSZhJyNeTc2V3UZfWtelfPatRAI7K--a5EM3q62fZCMK0hiYc9Vg7sa0Tf_SfMfMfGm67jtdyzN7_Jul-ekj-vL82Yc4WWcMFH5iDMyIT4Oxa-JBcfCrv3J5_lUHewrT-Z9Cr3RofmEJ5qUuzn_UYh7zg3M49evOayMhtvdvKiH6SilxYXSUIM8v_egz5v_Jl2T5UNXkNZIoHU2yZM8jyrdUC6yxSwG5DKb9p7vxMOnIIXM1t37ltI712_6bGm9NLfvKPyM1prREewozsOp1Y9A1Z4dn6VXa1jpcRamG4yqoPZyT6_BkPqtd1cdnsqzFObS-SxJyu2Ihjrd0SUeGbTGm0XO7C7tjc9kzN_6r9AZMQjakdzMBO51rbKvT1-R8dm6mHPDk_HUg5FOYxZt8FXoa3tK5P3Psc96UtCkNIw4v_ul5f7dB5z2WnsDv_R7cqcO-aC5XQB1BV-BZpPfbhyIsjiTPEsePwuTd_FkvcQ_1VEQOzvytXTQyxouhe88nsstdM22lfHk1J_J0pZlNu2tW9Y5L9orB9Kuz9eSRsUZStZ6bDigVUKE-qVS276C0DZI-nWA_pS5GJ4GqrhJfc9YeSw51TYnZWMW2TL05Kln84ejdOXDyjG7V2WjFE1oRztrcpogawpQbx7i8mehD40_duCC_vflTU1ez8jllt6rmVb-N9Pbsvs1P14zeNsG9WxXPIEmlGkvP9xmJJj7q-afjX_q9SyFAZ5EAVX2EesgvqVPWZ3uf-fiW3oQ594k8KJquO1UIfvE3Tyqa03sw9nRI7kZz12Zj3AvIHt4ubhgqZFNc6m8zTPORo_z255hJUNzwY5uelMWm__jUDQ-_xt2u61kCVJ6f1E4pz2Y1t-rDlGKJmMLbr9ZQo4boWI58f3t6Um_x75P2JNgi2MWbjjGgutNNIXg3Ug3_7s28RhQbHWSYYuXhcNtOsRO2eOO0wozj7Vf3qeTOvNgpan1OMik_PNclhKuoceX2_DNz-oEjfcUebdSwr_qNsuVYBkMaGYJSYB-zADXxN7fCVppd-cvIySqCnEy-dc3KXx-Q_8S0tIi9389EbXBwdfN5oNE7Nc1jseSPyM7VrIhW761U1TIKvmaoW3OVJX2_rCaH3aIKoLq58sE_8MMMEiNzl4tlWjeSnEtz29JZpzhOjXmXH8Y9rYJZBp3RAoTmp6prynP1GUoK7U4sdf2qz2mJa-eWKysOtcFGdSThpgz-lMrJXXO3oXw2E6DVWqttvnlX3vW_Vyw8Xo0zDkAbuRxn6q5yNtd3zMKtevIV3WLNZexnL2QmQipP2Jo2w0apFGePE05Uqs2Pzrc840cOMG_5699NHLlUQt40NjomTt6YmBfvzpDHiOoqd-xRfmhpFGaB9fKP2J98tHSGVKee2rqD1c_96hyf05CYVzahQ5uqWzcId9LVf0YTOqt09UnuZ9xjU9vyfXZ7lVfbxbN3ycM21d1cPCY8-fzunhxkr9gQd-cwz-IzT_orLgRHt7Tzx8gQ-D1pV9vHV5rER_mKrzQh0hG3nG7Ds-g2p0V51-Hd3aYj-ZxDh3PvLMvBBM5baXdd8m85oltbom_mTnuFnWLwGB2mNLuRf2CexUmn9110ytv4E7Z891vzoavd-I5bHzjbCdt7nExOiur8j4o6R2QVB7SNZ7wJvvtm6BetxXQgKjfqbIS80vVysZt58pwcc3tObOFPHBmnRI7r_MlXmUdLiim5hnyPr7KP2tH_bgpavohmO1dnRAB6Up8BradJhymeKWFJMFeMWQpIKji9Z-77vRslbgcN49zEo_gA84coj_qI_W-rz7RJwZyKSpZw7r-rSVa1ibwTjM1UJ_TWb47oKALPEq_PvNUKJds3GUpuSN-9J11twgtmU3HXm3Wyt13KsYE2J0UWGcZkbYtEh_2wmpRwWdklx7CkneLVWu6yxuxv9NRmQHhAZzNHNMe0JRFHtpSRZqS6GB2jufAzBfKZRvEZZY4xK66ZnF472B6f0iTWK3q1N_GKSeLzepWXUfLr1oyt-R5dJJc1coiEwrJSou-4F82t3n9ucR0kv6Esjjveom_WW9fT6DyVGliOuBnrRzWhujRfQr3AY3Afu5cBoGQ-0K_lB0sXupbhLO90Me_R_TSw9GvOZvKrbLjuj0E7Rpcu3bikp2Soe5udNAa_52puN77YUOu4dlyiUj3RrLoNI5tNKQU22qD4JriUaJJTXqfXMvgUaqAyJvtGKAdsaj-jM8HVa2NZWivqnLuqlPIqY13MQvuloy49gq4I_zs6D93gWfeXhF8X4IxCNB5Bt3gW5vE22lF-9pTiS_Wk9BnpvGUYo6XSvPyex0--OWf6p22UHfKJzJTihQaIjuGdlvUcCRUl3s4lvG8-mzaJ818StO9NBTzF58W81l379tB27FXMiuzRL8o9bkM5g_nSnm15HXefesNjJIRxi2PhzTZUmibzdNPlozSUvdnmu5uZfmDK9X_lYzUf2SM0S954lYT7LkmoDRRtXzSWyJS2KUtP2JYa9ffPeItMMYZHYm9Pas7yyKfg33zKn3ljxS3U6J_43C4yrhqqYPrmqXSDoX0ErEET5jdztsWpo4tjadmjsOn69Oee5Dq6pQT6xzYcsTyLFCOmQFtbs1VC9pYSli62t8a98G0umdtjz6mnVjcTFpGO1pY_3LCrLX0d-t3M96DyjvjFEvctzXQqY5wf56zTxSpKF6cKo3rPz_mIH0Rfv0cQ1nvJz8ptaraA7TN4_VQqNG206TZqKnJ7_5VqztPtm6Qh5A7kcy2tslrR5O1cBrsGwUEZOpW4tXs9diytOYe43dxIHeaxU9W8DU60c0umTppvfF3XL85ztbXrxRyfM40G5Jsi-Olt0aHlDvZm0tHYCTsLnnnmTVy8aRdlkkpCb9KNMpKZoz0vQ7F2DL_lMVhNW3qeqT3YqwQAkwynpbrcP-DOLRXYrZe6RS7cXn7x3mnGrjacVdGNN0QME0D58Y-SsrEJ4k1TJWT7f6SBtSfB-I3P27zqkzrkW6Y2DY5HIZpVwyGT1YWHv02rLsWWgE5Lv-q3d6pIlznj69ydgJy0uALG1Hq4T6cBoMSr597Ez3ZEFb1QUNJlljDJsUdvgsEukZ376jVYbMZjETPOOAxjYlhmidVavKm9Te_Umf2u50kL5u52KlKbmem1dXmmqfK8_P5_f-vWnhaPfS17RA9ram3SxL_JEx1RQp9WTnMsyG0dDhme_U_kGEqpLS3ZUWKvLeQrUuxW-pTPY8nDsqXVN9lT01C3o3PMHMgSM6tLdWNzJ_VUtfit9uiuLsXCvPtZ2sm7mJyRmIlV3ZYJXy6GZ6oj35QTd9Z3Y-3EwY30rUrk-KiuRPnCwLC34y8wQ8x_5ux65DZ6D_-2jsDOV8ZD1PkzhqXniTb3Oeewbe70aU91lIdlf-Zk8zyNjHipgsgwh658NjR7mAt7NuIZvSKbu-1QTHmVr1R8h70OAyCFYWlieHnpQdDFeMEWns2HSaYMgXKR6AdtZb-RAbH71rjiU5RDTPOL85bvyXTL9DRN7ztV-qdJLiXMp8xkCkb54mt09q-bylyLRsMeAJ0y2ofphhR4-7ChuHtXh0qm_xbvdZam6r4gNfWT6TbUL2dZNfpPk-cP5dGOqmYj-yrDk3LW_PeUMYoUZaqJoU_LTyvvQ1UTNUfb4qlMEYPNcfx0aO-0EXo7f_fvzx2pZmrrkqZKvt4rO2SBlj8ybY-RNuUKs-X1nZZ9_pxV7RwYvKT4sOjO1i8mKKaHCAjYNnS2WIxbJLAX9-9Q0RSjrUaZtQa77A6nzUEPQYWVuuuq4n2VmGTDqvvg2sRwoD7PiYbNn0JBYkbMB545_ycf2aep0Nm-_fe3rM4HZwq2pbk67Qwa-FaytLthb97oPy9HZzBy6HL_uBLc_zZaL1pb9TAq7k73zO01UjC_NjtrM2v0RYpRYxkXLsacT7E8Ux15WrnyheSUUz0_YqKjEbzzLaCWlXqBMuDO3-wt8VvuNqdb_G1T39xLvaPEos7j2Oapp-7BSWlvsuS3kI925_LZoq5cZXPExU2J8Gi3qI8VBbqOW546s8mATaht3GpeNX_bXpZ-1ruBd2aHW7oMgdTS_bX6Sd5bxhlbJspHRO2cuY1Bfm_u0CCnFnKUto9dorDR83yb92PsyJ957oMrWTr5yDqpcxTUcefgKOmIi5VqYOb0VzdL15mqmtcyfJ1WcxrNu8_oWU0yRVgyQZjip16lhNnBPFOujvltOj-6S9QIE6mlWbX5cp_bI-6LXvGi_G7_sUiyiNSmWrbrt23jErKXHsnf0Zb3cuW3kQbhvTb7-YwZP9fl-peOfQxQADrclnarc5Pj3jZynYaWZxtOZzv4iJ7eiMFwhlUs4OrZnbvkhDXPoWfFo3P64PFRv74VPHu--LETt6lXA0UiDB65tHvhoCvHQGaZDM5n-cx7Hu8jhZ7-zFmnWokFEvfjVCFFLsht23zyLrly752hR_9Usm2dbH0vY2O_p2eLM6weMI1FoFzyDH7lxETyOqqipJ1wlp65Fee06_pE-05edlRyk6B3LPWtG0hV8Ur7a4-9tWNxtkuN-uYOcsocaTXsFTyniJ_TnMMxJ7Zq6BWHxfnM28S97n5fazNI4hANMJc4DViNyvfOizdO109KE-8kJot7gYODYrT8WhtBM4A5RLo8Dn9P1IpXM5hfVzJ8k_HKeXo-5fnaZL1yrtIBLIW9ezN23IUtqAK6iE83Kl0baeRTPUJ0Sr3Eq6cmn7qKuvrczHcrBfRbxsk6j-QCrBEMpM10iA4nLYmtC9fh1jZfaswWNcMT8jv7cr35zNsItNEQY4JsZqjt0MLntgXec2OWSpLm5jgoAsZuYK6u3-O1OdU8Za-yDP0TOc_iZXAaOg2fzRLMR2dOpygz7-ig__3f_vd_-9__7X__t____W9pFuZSRKIB2sRRtB_qXLdoqI4j7fH-flzjP9sleV4PPitbwMd__v293A_Ey3nv7nTPNJGXhUR7eB-KJ7fMqNDm0kXHf-9PTmHcLvnwn5Xt_iktCSX3f_NPmIPuHKH-NcmQ_1Xxu7-f-pmuzH_y969_v-H_9O_G_2b8hA_KgM__8vtt_8ff7xkm74GXTOlRurFqcBu_76-K8Kcv_X7tFandXOvzyIUC8PIpRCxe57-f5VmWmM5VN-s_44zH5TdRLKzn7xP4-3NoU__rf_qrZP592irls59G37j0n99D53zYQT8C_0-SU__3n9s63DaHf_f7vR__709P9eOT8fePb7lvbP3703FRl3-f7H99jhQYv9-qzeY850S_87U9StueJGIsHKUqRQ6YeCR5YR8leNBVnIMda9s1D587Suz4V1eKeP1PdTR1gw4uqltKQ1rH-F-f_tUjNe9WOvhdriA1zKN553CI0NbHDdxNU0rcLo16LVtbn5be52guG6MJYOYThz-tTPSSpWSqpXReNuu5hNq_LNtj-v_-X6V14qLQiWGGPKMsOyX40O0ddO6UgAZ3vLwmIDgY5mHPOMcmcTR543sjP0PjGv9Hz3HEO8a3lRIxMjHXVJVoB_pX3u4JZzJP92QTYJbSJFFGxac_S435Gn9eE3HTtTlvO5IEb8CRfiAnHlY8_0A65hEPdy3ZbTlp7UAlAOtl9NGaBt-NHVV-SP0hJsW7bGhUYo5-WzEO3kfJvfRH9evpJHAcpCnSIZ57yUiyGjcbpEf6nU_Kz3XMfDD78Bo8Vcjr-GDouPx1iDRmkX5uHG4ODPW2yRZapJlL6b1TdTRexrm1R5VjuP2l-dllriY4xknfuItfVMMcyBiD61Dg5ufbcIk4Q3gOcR7SVpp0Do_flG8S-yD6rj2k_QF_F2qWqbNnAh26_JLxJGz_9V95bjwR_1fPBv3I9JeTMnLil7GH-R_PRr7QkeB7D77OeOeP_oFIiLz4-Hl7Y3GaAbtPU9m7zG_voVkgxjwngZk41xGVjDROM8DX_mj3N5WW7InfU-nxfaRvprPzZOYyWDi_bOJ0WDFuEM_u9WoveKfzLP8LjRtHwE1H8RARvRn78okmMcXdMcv5fa9y3vbosWZCeVilHXDxcg4Qd64lML-8287U33lEV1UyN-2YjqmJl0y7pRRlFLSpk2sCh-XtygdjpoLNRDO2ldTX6Vz2SPM3CpY1f93_8dmghrQju6Lu5OBxAq1225JCryb4czT3HY1tH333nnuTEySemSRELuctAxblyoLvFoHB3LekszuS6p9yWo-al8rfPcdWWQatuz2nHNF4HqYMv9vH7vTZd0mRtkfGNNyLBp_2jCyXO_jx64t5U5qZEeOU8_MtkaMwJGl_29KG9-C04biULmNJzsMk09kkD1eVtk0WwVrY-B7NnkNn7g20wdybAvu557BhcUORz4f3OzrobrtnI7VGFvXIRZCI2Ewv_rbTWpFBuWOPwWFPgXuXyPIpePbR3gCn06a_HKbS836frb0rVdMx3Fh8-N6PKRXGozPmsaKB0Qx88xbxWLuVy86OrTalYjBr--QqN6r4xIS-jsGkoWvxDph12iOH2esUlcTKec4DyofzaN7J-WtacZYie_fG-dSm9PaDllpqeXoj9Iq1hNJvU-VPCUHPv6eJJokuTTZ4ZBCTOB4_rO3ov8qzex-c6ovmzvavTKe2rr5L2XhmHNtg7I5c6UeUakMa5-RxDHe5is0JbOH6jOjTdm4dyoRvlDd66vgeikfsm_hcZ7ysZjV-TnedzDpfXRs1xx5tyN3ua4_vRUt1l7e69qa8JKyKAqVZlR6MCUl_XjQLcoTn6x3FVHLk8I3_vs18kHfJCZ6ard_MLOgVGXMvQfuRRc-eg8_fPIg3jzK2lEvvegmy7V6p3cpcm8LRp0ZFdJtzDC-lQNgQ5TQoMe73Nr8jf_m_yAB7b8qrfOlXk3cuv2f1Fd9UmMNI7vmuzHxxjVJL0Ca5830rZbqqFvFhD4omZGRvyNTPh3HjzfbG8qCzLWEKm6rLRbO1WCIOp65aI55FL7njBX_azNu3KlARoV45h6L68iPNsq6cwegMVzscPoSF0q0z_d1GruSBFBORujsZqS7eccCuqIyvNYT1mkLfzH17_KUs-JVvZL3fM-YufI3zQA6wz5PmxqrPVn2m3qAE8p_QG_yqJrPH8ufbd-OUrZ7fbHRxj7jgqYepQJZ4ItfY5eR88H4_h_YX-2QrzVo3ZSc5KvVl6PGUZblTj7kMY1t02iX0QDsLW5g04kfE6hKbH3GWEHckFW25HfKcrdFJqmTniKnqwfff_b1HQ3_mUvDcfeKeuBMH11kn8OxpLYN8HW9S7h0zxJUHF_HiaCN1DYaVPc_KAfhMJ4fy5bTUYyyDW9gZOJXbnqe8P9JP57Uvt_fvG_QTfDrBHGBtsuxlEeiOKSxZ7296BTrkV2nK8Ra2v_uvXCSn31wO1btkzzttFAXwknrAjB0lwJ57Xa6x-8eCWfVfSH-0ZqjQGADn1i5HBsv4zLgC_z6FzzbUCuXU2Lr_7rM7nYbd0H2MfE35XK_SaoQ2IJTjc2IQLWUN4mnz0L2kwajtyqA8ilH6SBq0Sz8KO_99o_aBePuX992n2WZ38dnR65Zzh4Cfmn8bjsQPEgLdwvpPj0BlxlvqRHilr_muZVu4V6JlXLFLRkLJVHoYZeyU0m7PEUc9deXW5-5EiEG--PVVtCTloX62z59S-Wlb7m9qjblTRm_x42OvlvtrrC1PiRrDebyc6bPlIC9l4-XJmWUkriUUUDlSULuxIqXFojlzIlFW8dFTlGHK9mlEBPMnuoP0w50f-SI4Tjz2nrM6RTx7taReDVk7jY3N15FHJz0qFoRtCq-IJxPloPn9jP4QtYmOZS1fcQmD-ar2utLIYIo9ywfFF-fk601T5SJqDh9rlRUaH_3Ls9Dla6Wa2VNKb2WUfvLIRHovdftcIkrFqHJrr5FfTwQom-FUpxKLH9GdptTe9Ee5kaMZxemiFPPQjd8DOycP1GsQ5dQH7RnpbDPZ5gysj6Qt4RxgeHUz4DWXwYGofuR0d2tKH9xVktJjj7yX7UFfUTAsjGzJeK2uiLM0Z1xk8iLs9CceNfTHebAz0K95eJGL7ur5I0KMbM0jP4ez-EK37B2eSoJ1W_Um52qxtUM_euSOsTWT0_xeo5TbWdkvbamN-HvX-LbYrnRdejZKAvom_Z8khX2qY7TxvKP3yEvlWpPohNPhzaFO-90pccTfNua_t4NDn59sw6KYS-ZpR02_hmz-yS2YJn0dDFYOFpR9J6jZ17uE7FIx8iBtaTbOrXRA_RFvAX-6HeyI_-SfUcmkXuFpkqmIK4N1IxmRAqEav8TXa6kbjhlgS-Z2PMqykZx2l5VDl2H7jJypslpKxB2wTfr66R_v1k6RWyEekiqFPoYWaW1q4pm7ii24cdH3qmRqBhWaLMl1-LQfaw4I_Ss18Yasglw2dEVu4dO0QGr6NqUkvkrJeA2txlrkZecK3cMVK-FB57UM-hKP210ttJWBKJn5m1svCnSdmz162lDf0O9OpK77ltjzUkfOiVoiYGOYP92TKz7xVs3wqzwoc_y46Gs5TSKJ6RPUCnwuFJi8AyZ8vOq_T2wqSY2ukMKz3oRrb89RYRiScsL86ypP4pVCA6HoXS0mfzmeMz2qRDSZB381F94eVTI_8jMV2tXp6VOQlnXm43uZXpKacYfTqXkD0FYikcefcb4UUU6vJm0Sz6eSI_Kxz5XKKderPIW4_vpBdfyZhtZ37nR-bh1S4yQuP46HInrWge-RBrJ67ZHSxW4W40kKL5rUXR-gU7drfkfL5evbc4xd_1OlcB1DQaue6LREWOekHMk3a37h0hlOnhm8vNk5OZWVZhr1HMmueDxSkmJJ3TLh5m9asb1MhqjatAjhH_rUECzSI_sPpZpeOQqcIOjiSxSPKZ7F5y99jNIPifZCDm2CwjtxdWJeJU0sEW3eW7RL33c3n3xfZTv2wKMK4FNXrt98mhOVM-zUoNHBXbIrSHZTJ4yiPg1rKUri0rQ4DsfoSZb537-C5P1XkaHeYhGsY1K-0tydaRllNn0ANtohmC9SQu8l3Lz5EQfpaXWCNuFqgjflYnsNug-rwcYPe8Uk_abJlHpkjy_PT4q8itspWTiobthcMTVeaTmCikrXParuDhMCCspZNkTl4-_WQ4zpWdYdlfy70R9R2-Hcrs0IqmO_Tnl8EQ5AOW5l7k1b-gjfuzn9Xnasym-17ecLusrKlHnLB7eOvhVNGMm2JDS5BxfVi4pnLWDI3FVtvuRbTY-CTPt0tpathv38UnekVnxXVaj98TAfZVti6GDg5S2T3Pqrw0wxYwtj30njxETS88WyvkuB-2odSmo6ZV7lKDnymHJ9k6chbnnGh2JqGxskDAI9r_d2OJvpX7Z8PRyaqTGdyk12ZVYoVUyJ1LCd-mvaoTs3qk2RxMVDZ6KKsCdUi-6jZ_W70zTRZJignZJoJWXld8c32mNT8xZ8m2kgG0sqSD-SD5C3aCulFw_-qz4p3Rczbym_ak91_Y5so8_x7_ZOOv6FRbWxtn_BZpg9DU4lp7xO_INSukZRx5CKE-jMLrGOC9Cdv-BFuhkQeaHVvuVS-N_KcClZVop8qXR3Vf002DYRGWUqlBZB67sP94rby71qM1f7MZsMULrixi1lJL3LcFvrRLaU7p35dLb2jH7OfSoR1z6WSkoXSut4lLT6SMlkZvYdVBq5tFFQ_a5Hjs-ohTia-dG_ozSVakWZTH_mBYwR-OJKo_3K1UybjxcqB40z1iRDRqMuf07DdpY5-_vPjtLx_E5pZb6dOtJmSyJ0BlDUzKZvpbv4HOKtYnaMM1xNoO4fyVnxaX-f_k03xyWlW9T_7LrVYyRa8wHiKyKF2ijP3dVcjpy55gT8IL-a9pz5pvEg7CrRTaYqNDuAdSQozTjoSirT9hKZdnpGrvK1pEVaZ7OvbRuTzOeYF8tmSfd2RycqOXQv6dEMfHnXn1wlMM1V96rJX3Xl3Jztl1If_keFv-fJm9OWcquXokZvZl6kdjqkr68jjJNwKj6Nt46KzLde9z8cGLLIIqDIVIyh1Y4rj0Xx8_hATaP4rFCJTTpjXlx1eaXI8y7Frpij0DrTKG4RYzlmMAYfZdmUcTv02Kr_TgB5uVcbQ2yWvMwx9I947Ka1X_ukFMy8GsjPOSyXI5dDFZYzEi2xnslGN8fqns61BB6bVgQHhDxKef8L-TBnz6QkqqV-911u6cOOLE09KlasSHUJRu7W-d2kdRoTqvmTOWGPtz7lQE4MWQVgepr7YiRMlvgxKFatTeRTlPmUysLflC9CauwZBdfGznMysrslwNs53aFueZlo0s4qq_dfYvrZ5ghOQTVEC22Wnp0kj_ZtE64PnDHOvp6s5iBtQNSseh9cG7OuELXctd4M9w9F5m5mWoa8-eybhxZJj_DeNIOjuJ5Ets1nj4ISs1EH51O943mMXCZENRpSJ0oM7_2MLDecRUs7UN6jaa-q41OUgcMj30SVGhkjRXbNOKtou3-nWJ8FLtyc_tND806lb5M6m8Q3j_jI2a5j9eQ96JTtkiLRouEUKBQr8x6p1bGS3_m1iSa_ETFxRKf5bxLFdyqZaS2dcxvMff_tHZ0WB-nR82Rje-pRzS7NkPKS8LPxIz2lCqclzvcbPZytw6yI0vRuLtHOrRnoyDJFNjN7OEtfR_uMqDW2t-5OcCa7J9V_FIY1FiQ3pj1fGeG-w4OrEgvozp2C8rJGwI1c5-xOL9kWJ84JreU5nKXu58Eq9XfqkX5HwhMJdJdINZxMsijMpX6fNGR6bmKTEhPLM366Qw7D_VsVoM6wO4vftpWVtJbTI5tzm2LCvUoCUjO_Yxk_9BDLtxGZu8rvJCPDU4BafFaVnqNHl0TQRvLIfc11c5c_qmeWm4H2hOB89L4-s5R9ZslrRxsK-nxd01SO46cEa5Ts-BFyLw7rP_-vqt2G52UeIulibb655SKoC1Wjh5SM2UfpMuhOTsZvvGAf4ZQDBQXKJmHZbStzUq5jir2W4kqFSznwGnM9v2vOSOYN_TDO3RoF2K5m8Ay2OBZLU9dn-fWU53Ymc6nejXuqqaygXoNqX7Lu2GjwdkwMGerDNdaA-biNwbxFBHUCq9O93c8yhPYSVeaqY1PzOQaennEvT-XqFpfb7nf7xmFo0r2VvIqcqpRQY5mlUy2UMYGMtTYVekW0cD9I9eCinPLoYyV8mp2Y5y8jr3k-Sn5AacAfk9D1HLkHTTTPMqoxRn4d2xyhmguRZ6x3i_PFLeEmj4aEB5BcHAGOjgEL8Rh77xX7_Ch_daYEi2hEq8_NNRIw9_bz3xIp5uaXj3YEuDrtA6jzsMp23hKD1CVl2Uht5Qmc4xIiDOGunPFs4gzjA0bW109FGEodN_39q1cb0Vf_hCxm7Pmx6T1HipeOdsnV5j9b_fe_cz1FwyAU6R72Pw5IORYqGQ9Hu3V6IHnZ451Y2-FyT65RCb8ljqd3kq9YPh5e2QcBwmxh_rRly8W4RxmO3ahFPJrlvNoa8FMhT9Il6VIwOtSpUY7cLoOs4b4u5UOlk4P3d6JKW8zNY_KNEOpEj9iKrElVMq-l5KRwMB5F5PtE-zKWVqkekezibs6oTkiqUVhJyY44RnGQ5CjSBvEybENZ4qfb53bicwkWfEMgK1t54_zOn0hFaEkn08iY4eI1NOdQMUbndgpLScHF2sZ-y-F-BzuNKkWxYhs_GEu2qd4wu_Xlz--GNl2FOJX_x0HIgWAyNMeSGYkJzhlcGgyoZ04eyddUAc9oYegwqRhQZNWteLPpEBwbd8nqTtCtSAEb31wEqP8cyvszkoLE0uYz9r8bPxykuK2OGTCi3CPg_lcG3Bzph3qkfC29dV2W0xxb-BjKwGkZmV82hmtJeZ_cNI88jLws6F3tzpyjsR6pzTbnL7bBoU_xjdwplZ5OnqjAdBYjhUbv_4hAzQ0mP0L38s7Y_8llYSf9rudF29ibj-HQv0rl3VN-qpKepW-9xknYfTe3s7ryIMkPUAOxYDjb7j_twj3crJH2j789p-ePXsN0vD17yXD8eegpUnRWqUs4TnyY-WQ44kwyRjaE6WvvFlWnLGfzgRy5XzNciRHDCTgPPn-3VUo9t5rpsL0Rl4ezZx98EDfYMRx6v7-pGeV7VOHHoDGWs8bf0a7Ni3-l6Sw3r2zmGJG2CxZI7iZqi5gX7l9EK6eEU5IqqpTUJSWouWMV0Z0STxV4pSF0Y-pUtzje_r8rbxD32yMVwRbvmsK3eexfppgTxfGnH3LWI0uhcR-NbHV0g-dn9sGdehRli7RVfhJ_k9uZr3f0_lFwTMgprWkizF0ocsuELHn31Cuv8o7OZoz33FbdP7dJocU9tZ98_C9TxPGvuJepV_92x-Y8v3vyzgd28I7NUzeOWcLdTVz-n91x03p0UFtz3Mepe7_5ZfnTz3KQEcR5mrzRJk66MPkKa9y8q-fXe-9kftQ5exqpZaZBaYsVdkRtZpp8xrd61OPRCizdyW4x5AbkWjMtp8F7prqaylr9xjMzYVnjFS_oFPWKUg8vt8LvnSnUfCs7N9o6f-8UD8RXhxH5iY609KkVuD5XgcbJcp-t-fxlN1xtOKiPf7ccJv5etztff26uI_UhV-uUaxkryH7FrA6DT2fuBou8HaHAToOmQn-HzMeJ_a6fweYt_4p_1XscLULtM5Vq8sonhvmxNhUvm5l_ME4Fn_-_LBh6oDMb3VARHBF9fWbclKU00dPtFGXL4Ce2y6Aq-_3ZXL2cmCqqvGhTDKmp_HnaSLPOQ8dsIr0liN2Psp4n2YolA8_Rnt_r0HPP40bYix-omscfLauBZuyIh1FK5TPH2F1Wrr7QJPCiIC2ZbiSKqKPOf0-7v7nZ1d0E3r1nAkMrY8J8_XX-j_SVR-lz2d7Q1fQqTuqtwVw54yZJGhFZcvtfPRn_I_3mt1mW_dnHqd0OyFzbkf77nqOWXFEcz6YV1cBb-5KoAsvwyO5b599Zoq930vlgz_IuNUq-XbmU2-DuNseRCIfD0xlF1XhS7VB586GmJ6SQuQc2XXbogtZH-7v87Y7n6EbO4LwgKetMYz45QmhLhmaMRsDT7QXacZxmJ1zORhknh3kuprH5uk3k0tOKOWDS4Ux0k3ybzMtrpDZyZlvnud-XZiDQkL713hKZxLnuyYivMq0vud9VgtILdJ1XWwocFh5Cp9E1JoFbFX1TXWzWznt6k7LXnuVqmTjVWQdrout-leB3j3zJ5jt80Oadz5Esv0is2b13pUJhphz9jZLep__8q709drwV816zD7wgc-k4fuNPHtWGvYYptCfzHX_nu8Qdwu-TccJxMWabtkZ-1gjRn78pGO2xpJujje2gKNm63lWqZ4zKtuyp3VR_yDaXT1pyUVQpXlGqNHPTI2qIufn-lwGBvKomNynPPa4aad5eAvvvbbALNzfbOqV8U1O9ADINvZF9GJKpLu9TXjb9ty2YeX3caFzEhe_3aT-9j8nPkqpa9Sr9-JuSXqaRpHHTABNvrmBv5bfAZyo-aqUPDVc7axWwP_sFQ82Fn8vfZCDacL_f3e4G_8NnbKIU0xkLvFvYu6JyB_LmdC3xfN2b-_AiyMjYKKFcZXSG-ojtKE8brefTSKqxq5oa-2gfCU-2ju9IvX6LOQ6MNPBnXoPPIABQJv5OCIrpKT7yJze77VsUJLtxHc428kqPNI1vnuMIMzofGwknrcJcBjxVoX340GM-oyOPE-vdxkyDuM_y4SRIXFKAnazbeyi2TI7-53N3wY6K7LNY_ak_pdjTbmBvUBnMObZoNl5pv-nCXgngxk1e1oXv0B7JNIdCwBwY_6PAtDXF7WNsw5djEMSxwT0ZMejOaKhqdDzw6HNpDqom29qC7xxtHfDOdIpLsxHv7dk5eUq2IdUoc_oVb-npKatirGpKmbWWt7qXM_HojpLZXnAPFlgUNuyB8EvOrKj6zaVjjtLs2Gvkov-7IZ5_-slHcGm0lSdvNPr01g4QaxarjZoNI7vv7tEOkprvm5rD1MEm38xO_cOf5X8zfOhHEtTDZtNccMv1knLt0Q7SHoratCnmvLeFMN8_jTbt_8cewZ9k89k28sYSGzSI39urTzW3iABtjIcxQp0cG2cuOTO5w_ofdb70ELwouh-bhvkeZEDMw9Jp0afLHPeUNgF9LONkURN3J6i_ozPi7tJQ8RBs4yYzlV6rA23-Yndy-JyLnEIsoN5Hd2mn4vdPd2l7tpQwgRKis5pzUY78QrfwUOUkBkYfZEjXqes3KUOWG2dncZZ_8jzqmyi97xI9PikB8p7h7EgVnmWqHuXXpW-g3lWVRWT55iNAIalziihAnW_38cC6VSdy_PiKdXr0ynKwByM0jVasnbwNU7l15l7umEfvzVIlO0V3T_VG_-V-7cQ1tlbn24a5iz3D2U2QnbFdVtrXpVn-WjorFx7_0SduZRTL9VnihrrbCcUP8R0MxQhwpuLPPZfcjIfGtBeKoCSbHfvBvDKP1Nb23o3QpmaLi9pLPaq-UgTS2HuifZtUY8_yLumvtv8xSytr1uaJvuKyiDeT8p00G27bJ7BJ9U7vT9dod-7QLNtuTWPxP87T1IJH7z94hbntUJBwKmLt7cMfs5R4TsepfshJuautEYHe-dVoduJGpF9QvYzp2zOa5jr_5xTlYmq3IkOTXoBrh-PQd_CuK_hXeex_b-Mx3pTq0rvJF4YIds4ZtZ-az7v2arpNlYrXfq_jtJRURYv0rH7OX0X7w8_k6XBWlBr9iMUeldD2apNvW0rq7q56ayxLN6RMNA3kY6LeUxv-6Q7nPyqofYZqZUsM0W5SBfE74_REqRNefzdYqWvlCMg__dWrefNsTNZyTdrhuJ1TpSN1l2AaXWgaeW_oaBgge3Up_Rb9ABYPlrqzNUKYnxonSv33jWL5p9R2njYtuG365aXS_6hKl3K1xhRC9V-vgaQ8NtqUTCUImpa0BT7H-az2lVsq7yegsBGqzeMzNtojHlrONC9I87BpaFDKt1ezub6GimROz0MV4RRLDYleMpyFcxkeUd6ndMe-fXPSL5LPdvW3y0X2Pps4l_1VvSwP-pve5F0_OZfJd8UP6ok1ObWNcEW39frk5ftUaR9bCpCh_qMKt035vfdcB5TUOkpuo3FXfppOvRH-5NyVfnkOspoZ6O9z_6YhlOKYTj0W2NnMGpPEK-T3rsM27Z4H0VoWt_79iqI_UtofJhwYPcGKYqjacDWJf-dz7vOUNfQ7x-Z8SSZmJcXa1fCWDh4gVYF-8BjIcuTE4PEcf2VOnGXcoyx_Sx3DVqI5MfHmmTyGRljX8nsmvhhHZSNS6PukqE9fpeC6bJ_HIKNRu1FnT0VdlmBjbug1_ese9ZmlLR8j5dl7_5Ee-nuuppLASig00z16GVXtO9ItxVDNTI4td7V5-LnpjD_dT1Rk3kjPMJsrn3sZnjbOv7dB0ooTH1Hx02T_yh2XolTmRvsfuulv-o-SMeST80Vya25qf1uLZ9RCQGJ1xZtOl9tqhCKhdaXdH0kWKNGq_cZ8dDh5RZ0JeJ-vvD97ewW7e3weAo3Ls7_mK6Gm0FmmFslVs-VCzOt6DQbSMqdbaZWS-_7R9tDZoj59xtAriy8Nl02OagwhSS1lbfbryo5qyjIHaW4_vpXcOsc2Mpp-99tqKrdldTehtb3Z83Wi85ly0pm-ShxM5RADWaKC6cP7dz-tOU3LlSjwds-pMCq_V9loZjP26GtkPRv7E5JHHUirLj_P-CcCvTdbIioaq7si2mY0oS1Vx1y9T0z1rkN-xkZ7l-hg-36g6ssh3qf8afcg1bbPNNZ45G80Myfzrw4t4Q7nKPeoXA4KBu2X3ntX473KR_39EWVjTMOTY3sa4e5TZjanAMfJy95nDohO97er11Rpe_mGk6m4bbxN_T7mZGY2nv8nX2o69RsjwVag5_nc5YdfzQWc_Fed33vwfLlwcd1_z_mcsvv3DKu5VWPru0_0bELTLvegE1zibHJjHynacB-XkWbAR2GHGkXDzxIJvNRuNyBK3TcFQTivNARrHLq27J3XvEq_ToUzUCX8l8ytW1MkOc35y3Cq9nLRp_5VtDCfOT2WzIANlWLJgW1DQwFg308JueYr2koT_0QRX-3kEyxwu9m9f71BRvd6wKFAQgWmexzZB_LkWK4prtUWpddvpT_49ukTRtYElc-3zZObbOwIrrZT15-iiZ6KJ-SVL972oAX4oi_pHrGz-lUa3GeUgkdZLnwLw8PJGSOh2ry6OWVcZ4p5P3tks7KHvTFLO5MS0KMg2D8kFSqtxi2xlN7-HQzSvKfbyv06lfgpB8Gnc7d9-URxd7-a7Nvmlsm6lO3nwncTeb7ijamWk1NuZzswpNW4ltuWywQ34BPxcYp8uqfnLTFtyzdW6s8W-b-sAv0Duun2KsXaXlpdJQdE3VBCUVmBdPnOcbVDxOreBiRQnf1RAA4_D3rAoy0jtn65CXYhbY1Um-qWMXm8S17VqS8lr5pby6kx2UeO2XxiuCX-d78niraDK3UqZ-9ZJUu7df_5W0oOlYFnpDV8Ln2jR-RzzZfOo3xgWiMTnd83WOpDU-RlcFr2q_3pXebZnKvNVME5bGpn_qcTmss4neze9vS6TW7kE1FRSNxQx3hu6215EvYUHtugBXNO4RRIKH6WceVWlIC5lipp4m3qY_8lZ4w__BuFYCjITYnoLMz1UDU6kIe3gjLm9058nO114ydqbxuVloBtQiWqveog0HX3PPVO6-Z3Ze3xa6kg6fcuffqaXiA2dlOBtfyiSHrnfznR97bBz795Ewb4FCpyMDr8eUooG0p1ibmcHAG53nV16xXmw53FYZq70N7Pn9q584yN94ina7amg9MD0Yi-Sns5sVQXZA5z3G66fMEbLatqhX9C6sFSjlo572cbDHl9v1qGukk1wnlAYx2fuvzKZRB9bw4xapBOj2NEiQz_nUmKDe8cw882iVc1x99pH5uzyZSL_5PmaB2JAirh5f2X87bW0yUAEz-m2iuzla-7I6AckDLallKLuX_i8K8pgX6nF9VUr7iZkrmt6Y9-emnO5Hl1luEOY37_o9NK3Xvk0KAL4-JdSgEyJ1MVzEMBSEGRdw-F-r96VYfm2olFvfj-21x4msztSmAxgUTEUM1LTLZpUi1lwbITXyMc3qVH03RSz6ra9FkcO793l8ak22B4iB4p-Ny8e6QZ9dndyREZ3P7lyOe8P0tUuiMHvwaHwJOgDsMqaH4indAEM9ZsWwg6pZZkMvOoeeeYO6ZTvTcRus2ifs9n6b6LKszkUzfyTo9YNmYuHhN4rmj0B2nxPMApkvvmPyV1uHee7jl18NbEsCfQ3x5uyX96_CV7c_3r1H6dWOGE6RfO2PfP6OvVDe1Bx8aChzBP2FxCLD6EBJ2cuPYMpp-R_-2T9zklBffwuY7ccwf0UO2HFpVI0lTNHfXOg2-TJiPoU972lTd3alvoNNfZIjLtqdmmtl9mbwulAMKPjK_he9o_I2Pj91M5S145ZbFn8KcpMUtOLaFNVcEVQ9fx5AM7Hv18-TfXceZ_hi9na5aGFB37Fkv2LIelPO2SrU2yzXnknq3N4cyDMXLOdpomeU_1tCyNv9RNs-DOWx2oOQUUSkTSO7anyeBc1fiXx_S7lfduJB6N_AC5Q_SMSwl7pndUgq-RBmhPh7e2LO0Z7zHHTDVEH7hWf02e7tKt9TfvFOu_f-_OdgCYedtWpoMqIFi6sk2D7Yo-feXzlP8jq4FmwnTHRG7PS_qrKGgIdI1140uZPRyHO152XA9ssnn493k1KY22MSc39XrGUqejMGKP9OMTi3s7V_3bEZiXupgp9aSv3VIDu5Ofq_6khFKpi6oaijZTS_k3v9_u41ujcWq3t5aArf49qWa4gNMXT7GhOZZzlvv8lz3tgq2ujGJ6aue53eDr72l6Vx3cfR9towqy8IZGFouyil7BuvRJu5_PWUaeO9OkvO0r_asy-3cu5Fl5RaOZYsueTtacN6r50kTL7DlRUvPc8fz6xO6_uYytsW2v6qLEnlRUc-7uV9kF5YjQ4yzYWXvKUDnQ9lQYHVqmudS9EgPj1Cp2x3T72czy0SSXs_ERudWld5bZeMaO5kt4NB3TF3NzumiiPBxD20tZRFvD5X7lX9tLH5axfFOqlIHt5veZrRRmTm91k4rid6qbr0QFy7CjWr_r5kbykiRqm7jSQnlw0mfyztudzNW5a55NCqGzPZhtoXn1lK90itP7dw7lrqbBpvdZUuqvgyPyO10-_7YyLus1Zr1Nz14211airqwfJ5BpI02ViaFpRjXroC5c6Q6eTeSP3FqmGXcp5XbH80gkjoaUZoCzaUdcwPfrd5WNsw81w9J2cfdT2yaWTUnH94ROaea6phLbcgfTxLY90rFL7ssfxOezlwYmY-DonBge6bnULhM489d3aZFEZHepCTI3JTg5qz06KH_lNEsvUD-hD6XNbMpimLbrQmxDKQvdXsc66lHjJrpjtSci95UG7IqYtMTHMUGUgcGNesVspnR558bncXhQXmSKeeeaM_XNuZ2H0RTJm4m0vTTVetWZqcx-vyMPGvWioVq5ECb0oE2vhL97TuIt0uTaPnQZ6T_lMm-DpGj_pC6KonDHM6nvXqLv2HzlGzCZ_-bVpVtq5_CPf0U3OufiaHY_jy3RqJUW_e6D9jlWnHplwr-jMpRygWBSTuDpFKM7R7XBGKBUo9aRlIIivlM7feLVxMX6_ZPfP-6Fk4sKbB35C-Xa05DLP4syTb_YzVmyJGaKs6hcERs7tScHjd7vmaJyiUT3q2hlhhX9Su_nVMCr4mt8RZwx0_UsIlyWdVj-sJrAZHzQAX3IpStv-aq2cap90-K8UoDd-ZvGCdJ2oFnbldpRnl0Eo5I9jcS_28jzerU52vLhYsLf3eLFApZC53SR5WeaJElRfpakaOQ4Ci9pe1sdCc6g9CAyw6E7jnmkUqD2qr5P1e-534aqVa-UqzRtnxocof_sVj-WOkMaSdkhu_3zVdrWUe_0tEVFOEI-ic5v-HOkN_OffVOefrulKZApl0yw17pMbrSmWojqW-52M-WysrZB5qFe7mxbmwx2avv2OhMjpc3yqq95ZH6YW3xp8-Y9_tT2p1GKt5l-_o4yt0cFmez2l_-nvXvZdWVNs_N8L9kWDMaZVNdw0y1dQIFkkEABslGAW2r43h3P-8-1986qnZUp2DJgo1TI1Mq15pGM-OM7jPGOPfqjZ_qS5pHT5REDscxxp4eJhGl4M6W2BnQy8XEXswJXsrQHrpXCcUzSP2UgRm40DW5qTiEp0XgxP6aHadqiiogklYvr8ds-xTPe1uBRqguqntNVF-V-iDZQNvqYxsToW6YyyUc2Jm-3z0MdVbma1Djnvq78MvdoUt8UOOvQxWzxidyvn9IV3_H093L-ZgqF5gu5KrgQ6oWe7eGkrfLUbtLaSuPgNDKnenM_UcQ3J2nNLOlgo-CjddzLIYmBry_hY1SV2QscY2vgTLFr_-RIp-DkH9d_efI9qc_iOcrTnNoPryoylDfuw5QRvVbXO1SQCW4AdXvuQ7TAW2mX32rmYyuH1YyKp3gfzpw1ioaeQ04bus7IWS6hRApEW4Girbi8VchOwbS_T7nr139o6_DD8m6rOpvBf1tH2vfpa_QLZxn29C5X_eldqHZ8UBNtueJL8PjZQZmULYO_wJ3CpaBT3bB6KRZSR-ypetJ062HbTGP5U5hTqT7ax5zpCPSEfgZ9CoXAMadrdafv-nIdkb-XdGD--MphFwFx5vNNw2cmVV_iK-_dW2d6vrPN8-QUpwQzL7qucJvGq3NbpijQlDbLIDoq_vZHnYWrgU1K9eYko4xo4V_KHQfRJy5n0ycNIr-I51WbJXVd2mW8vNLiHyWVS1Z9lZH-_NFX60Kk8K2FU6iWe7KkmzrHK0D70YzbVKWmgUvRGeOuHAo7RLzrtfnWXS7p02mqpqHUVpONzQBG4PDP5CdYy7NSnfEfclO8aNRpwVXJtgBrGjRskhLvXEHqI5PVc9xzS3SvvHPUresaaTCHqkLpFo0ikGI1usxyKggatne0DTjd01khPzAVrOPqMfIyV65Jg6FHjok0D1ieOnc8t3RMlCI8HS_N1lV1LPkv3z1BnEkPeffYBjaOXK3lx1H9fUolxdZ5RFTZf7pWtaV7KW2spEuTU171mAN5cVxpaoDyTAYf48z1omdswnPdz3vOXIQwnDJPkHf1t2fkp-6Oxu4e0zBVHweEPfpShlXXptk7p6OEKF3s56fLWm0g8iQ880zLL-G25JUa8z8Pfu_mK26Uzc3UtPjdpMTcILSLraakMmggCh7cI3VoHBd9-TLcfHuVweJd0B8clCD82lrE_H-eTMgbSFU24jTOj_g_G72O7Z8ugleTDi7igwrMZy7tBSS4vNu6dt03C7gPOk-7W1OupY02v6e79fnLXWO_i9zn9CYlaQ9monnOaAA8HYhDt1KRnW1vc600718aL3OMuYxLnET9q-cHxRtNWClre9cGjX_nYE9TSdxXF46d3j5cp84nYLvTTM1EKE-l3suMfXBo2gGXL6L_4IWJTkeDRqtBqXv9RBQ8S701gsunO1T-q-nDLfISnaMN0qOKl4dAPY7YdFXg0m9M1-IzH5GbZ69jXkB1y70Npl6HszsxEWKA5CmTxV2ycT8FekUe40dbps_WXHzNE1wK3CfO0FEKjj-dTYy8u9iFprptKulJtGZtB3Rq0zDAU5_qoDZnNyJh5-TWVHGzwaTVfCMsrboO99ha0pYaeqXVybf1Gel-jA_lv-uNKeu_5Xq_KJByZVBMbCO7JjLdDziXV9nJtgWM8yTMqU2NgAZM-6oXxcVbIwKp07_SjZqKpQbIcWgIJ11TAvDZ_aPOi16bYu11JK0u8UqPzYb7RccTneMqTR-Eu72k2PnEI_v253un4klmLF1wzkXhOne6po61MVob7X3zGpnJ2pvMS3mbyPBmqzFcdY3Dl4g76L8pW9fUGU2nYmillfTeeo7-ppx6lx2r6qGe2jvL_Z2JlDretNGccIvBepTSrQ4x2dExz1E5ehCZe-td5k_K5nRGa3PXfWovYb9K7UV91b8ifcYf9hyZPQm9xvkVz3j57zToh-koR7X5-ZaSHbV7G8Y2WZqf_JuqBsSGoZTyZDBZ6gmRttHEwBT27OqRUn5G2nKC02ZUt3j7chWr9vUZXLbSlzBPXD2qazwp0z7v91y2th2L-ZZz91P3aMft1D_irOl8PMEiIfKtm4bqid31HAt5y22lXu3ZimOyGqyeWgexlXeQji46z1aKl_UsUrJ9PG-NHMxb2aBwik8kvX3UL1PqVvzwmCPYNjTku5xZ10vgb-rB6_eeWjHo6e7y9HoCL-W2-6hvk078Q4R8bPBHTzJX0y1--qBH3hF2tvZhEWamo61iPg9Px1cnMHqnRVUkC3fvEtMsx0J6mybqFF7Peti0zDgY_B9Wbwvf6bPo6aOU3LPX_lPq6UpLfb2u7_LASwFEYti-y082SO4kTxG65nvKqzsCSw7rb6SHd34NNiMWfrvyQVJco__O88g5n0z0O6U4I00W7xtX9hbW9pOSeeRSc8TRJ4ynGmWQ6_WRwnKir9ddVGGkaigHF9nNdTw4f7z-VLCo9qb0Us9PVQt1FtJzykJzYVvJabxPkfKKsXel5hOmUz5KtZryxXydarlt5-hVJ3WA_WlUQF9rzRdhB4CJWtox6nD5hc-25XaJJo54HJ4_J6aJDaR3BrXz-jwLlEe1WrkQnuomgYfN56OJ7NUb5NKfud5NYVmx1Ie5IfMTN21_xiB91VU921LKQH7nNt_ieV_nShvLqdOY1qjkkUwYL3N0Ls_O6FsEhl9c6E9ZiFiwr1-56DaH0RHGbH8qt_eM2uNxY_6uIvzEZ8cFeZQQTa9ULW8jZJKxr6UzcyuZdnGQfbkaKfTQPVZsAKrAe4ymuc04_dib6rY8bHWjeh-X4BxqxKUGMOLw2RaHIIjzYe58XPLJ7hgQVjE7N8Kr9OCRPUHnKgh5QyDPpfrujlmi2T6izHHAJo3Hhve1uaXLeHdKIh1QQK4jgXC2NTEd_cQpesWWX-PMI8h8y_mQwnEiNZRHbT_5yPPIX2926qqKAuU0L82Ou_wRbeXZzP1Trfqu65X1eIsq1Xwor1tBrvMrSpV992BPHDTd1KlL1Xzeyp13Bc3YHC594BkNyazlmf_8m3Zwja5GCWOn-i0v1vGp9x_eFarde78X7eFzZLlWJyJM410PW1bLbjqjjfauzpJ-UWRz7MA1z9tUJrgzuXTcPV7RdQXg95RNsbeT6m47PMP7WamVXw2j1V9GmdKHnzLG6Z1kARpDj95la_xOSyADk_NDPzk82s3Eb9G113b3Rf5RyF_vwqseArIdU41ybGpOFeOArrfngOrySBn8XYc78Kg3-7TdLQP6eid0M05Hza3TgnLFXMiE65WvjcaKV4IXweyewv8dw5BXy5PzWdVh4v5MO2Uebof-yrVzq2amPtDH7HFIJ3W5SnTPv5Aa522DR9fNT9xutC7FdMt1oVszN-cNLUmwFIj0SU-z15-pPWWqs9TG-2heRDF_1EvTe-j1584pLcyzs-DoZw8fansgfyl3_Tu1iruU-gNR5qx_W3InxyrGnlLb-EoxJ50JlOV7frvrfN9pHteIhJSS6jvkXzrEHcUvFsOz2YgzDtvttFMbTvQSdh_lFFNZcWA7z84YdHs767OMSnu6Z--HK-3TFFRCxZwY7dx_pd9KDTDDkEPTjl7mZ_z4W162D7-_9shkMr3dWUY0Ncsy9NtlX6IL23huNnPLkItuKVvc6c2-zYwEmnvKHrwUt59M5YnsUfAjCvzSRn3TF-xdt3aepZEhl9KnkQ2rXk1lOJD3ofp279RVxR1NpOdcqEqM7rqU1k22gyUliTkk655eroxgVKEmKzyV5szvdgDfeDYPvVHuKZ04dXUJ7e0zNI8f63hpN4WSm4FjT9C_v5st32Nxepqd_WycFE4x-wzXeg4TJxqu2vJOv4FM7qpTlZk7eHK-0HxWTCCaOpSJnqtb3CsQkw4RZ9LaT29uEROke_C7jOSVhk80klsD3nzPFBbfUKTvlCU45VPTj-uM3iLXIPJKhFmbzYy0CB0Glvye4w57385QpdMG9qQx5dxcctxXX2FruN4sh-NFe55wq_KSb9lM0EOCCpoVjV5BlT5xGXH9pvV1lz7b_R_D8o5EBBvu6eSF2OheJOienX17xKkVj3KLZaly1maaTZXfYa-vGtxyvq9pSyYV9Va6rQl5KtjJaavzo_hCtzTLzJ-uIbPx2OMPnEOOHT1At7HlUDc5bpvXNN0V8Kn61QVQFr-b5ZkL26u-zK2clbYA3JpOa2dDJGscFN4Mv95wF9tl37nCBxk8R2q6arX75lqJqO6pjuOzDc_Nvddh647B_6f-_vxSwvBYmGcP2lbjrmUE3-mqBncQOWT-_rhHX2kcmtS43EwJj1gxP1O7rclHzLbffPlIgE067YavP_NA2GbxeVOZ28CMOmfqdN5KjuMY0Gjx2ujXPX8HfolvmpLjmxPBRNWz394SL8cUvko2_u1WfpR9i_xdFdsr-rW6j6rTkwVvSq98TzNsIzhHq1I9oj-gYeVPvv6EsYguNpeR3aZVorxTYfCCZNilDNGRPPwIqWudVTfqk54e3_hBU4yrdCslFzxT133zVWx5jCjkMG4CleZ-uQfcYJV7R9pLCRFdTQK62uqBeyGfew5QiSlnrj5m8umqERToxdIkUUtENDSbPkqioRnTxcRC5ZS0QaPuk1qNSZgncPH8mkei-OBiY15iKebKorjouYV3IJMqijHVRabBxT7b_FO3YUpg_lS-TRovJ0S_FT2JuzFdWRvoRykkiCdzXDDJaCNVak0PR3nAUUC3vpVP9u5O5Nt4VqtsqF4mJer-OdpUqR5UrbqHta0ZhYFcDc4Lr311fPp9JJOjjAlT_m8Z9dWj-0jUuHfqjBnHEV1_l4mwnrGJuub7jKvTlBqh3HPC7FMc9q1t4yO88rcu-mtszyesek2j2VY2DD21lh29OsamfxpsPpQJiYd1AFs6G13ZUaZz1cBRB-NulTsw5jgR_g1ZJU8_27WZlBIrolnqTDgSPim73k5lShkXQ5uKPT2wU32lQd9uTbOrGOJrn0gCw6zU88ZwdGr14Y4f1NtnG1t97SEZQGfE8-Gq5gHnvzHbzsKuP8WnoPtVCSyZtI722ypHExOZR-bWFFX2eBQznrbPriD9_Hf0O_Earp6STz7FRrne18e2Q4va9gwsqk_13qhE7lF3F7sxU0mHtTu03ejNrp3KWmoKWcoylLVlzlCf5IJgjZzTS6GQTIPygsAzJ5unbo7kaJZlTqjTezXlHR6ZpZw1ix2aEDxJ7qYpevwag94TiQLTNm0xvzhM7B8xhO42ESYQrsh2d5xduiG9KwWSk9Hv9jVr2Mq6kA0WsXzN56yv54O-a6x8KR6zg1bUjINiY0vL_kz_qeKkmDeUjSdwvTs0HpPpinnalq6hvRo3vlUNv7ddvfvbZO1c80r6miZouUI-cTXW8YzJRYfPgg9i4im9qkL86ln5Lm3RTWuctyWj5ApLW9hUDpX8nUvRb363YdqbQSqGN0yrd5p_d7z9jmrHCcfXzbJroidHEOd1idj1AE1BDjvWUs4O-qDru5oae3fpo85cKnKo4qQZD9M8lNZHZUUfjZxOU74M1m-b25-cCh1uSYieitvinax9SgEvv0aNrE7SF5s3pGXFn8-p6eihF3s2iz9dnVSyvPBdK0GhYz-hxThjIsSqCZcyIsxXNtzGsbdefjSApvCuwyXPDA7C2S7ItWaiiO7OyyCNk4rolYcpRXxOD0m61PuUsE6Mj4nvrkvG5cqz7PNT9EiwxNA-uhvuUUc4cF1HiAGP-Cu221IZn9kn9Au3mHp7WR_m7aaH5kHqYCww0_fPeGqVVfGg-ua8j3eOPIpkrRb8RF6TuyvXwa5PhujTPICFTNIRBVv1M__3XG7Dy7NM3l_wEl2d5w4SjxPriLuDwxGxfrv90JBu9XJTKR9PQxP8BxlYdokmxnkgv1F2eENXVx9Vkl7DPBvh73rHKTp2GisJp4u8AE8UW4TnMv3o1q6rBLXMhGsd-UE3dYhqBV2zFCbuKh6R5pM5KDyPqsIP-hWwA1PvV--uuiznhcq6J9u9o3CJwk80ELNO7Xckex-ba1N4utDrs_TI_Eg2IHgiMnA-ZVJ7knlFbQO_ZVjR13q6xs71cSv10dY1do__-M4V1oaTX0InSjXvd1i3lE96pqEhqB68Tkjn0Flqzzr_POmX1M_RBZ_NmEzOSzhQxOEgeFbkEl-p8W0bIt2V_moqrECK_kn08C1nxSSSL8_OxnMEr_cdd6LVwjGPuXtaITNKlSAvrX0I_6fpI83KI01YfUA0ONO-lyeLKzofCPUjQqtN3ZzOxSyYLGbKS8pFIN3D9zMnoLBe0k3y2X1KV4xi8JPwOZU8UJVnwklNqyCI8P1OhxbpccnJcayR6KFX5ujBUxWiRL5WSWURS4dEm7pFm64HqwrXx5zl9N75qmyFq8PKNsvpWAXHt213mUYD7_jcfzjqIyk5b8QeV4oCZW7e9C2f85P24iiFit9grfvTv-xShHF02206NabS8Y5oJOr8VJ9V4s-jpXAaOUCL3MT0qGWv6Bu8ih439b9x-9W4qoAIUuqX9hF8QDrXjzQcLscckUsMo3c1oM38feRlV1t4UqwRmErlofWj3opCQEFkn3NUfX88hbZSab3LnSiYUPPP88CG0M5Kp0Khj9iAJXbkdKKvfHnSpu_0o7ywQOKCjCth0ifQWNU928_5aQY5PVInonlPdw4dXS3-uxmpZxbi5F5CAE-hKYjnr8RwZf_e1jWJOLUin7S8nBTd6k3SuTOf2pkCPI1slEvPf88UvYap-zf6xrOEJTulc-TalPYWVbEt0eY97R60EdUXP9PZfqvcjRVeow6krOiam8vq5Ya5tWW-pdr7lMBobn1vitAOlAuJDnZsLoO4mNOgOprlTts8aIHOy53nVLMyIhl_NjXyG34YyVD1r7xWzi45zGv7KM_fp_tpfcQQfspjlNogbZKuvfzAXJa0m3lPn-7ANOrP4HjYNHv0N6nKVNuyBSJFz_PImfKsSUSBrYcVwNvGF5GDz9czc0Usa6r4i7L5jn18b2uvVne2ee5LnMPB0wfi2qD1NNT0p1wf39jy8mJTwHMNl5yXMK2k3DO37S29kxTrka--5jCwITtGxrRnvH5azVPOwTSYdWhw0T-fbRSWNpiScT0D-dWeXt31VdbYMn4LJLctv46pWtQtKnnkGE9ifCE--pLTStJh-7o1TZQKe3at0SmZHEq2fDqn6d2HAkKiQSQuTj-d0bdKQcrIGZuMkqensQxlak2T_DycV69vCnW9D6numh7roeQmUlGUx8Bz1r7z2c6juhqjKC7Yp0ygqUNIWcE9ii3ABYz-J71Nh91ih6Ig3tLWeRDFWXbBdZfYddAj22G9MdbzgehiuXa-ZXLQPDxMw6_TR4Vgi5tqLjoNkistYaT2Pd6ZybB8riODLM83nnNTPX3Ct4TxZwTWiA6RetVHZuHP3D-fCE9HpIdbVK-q_shAuK4f01-d3nC1cGiaB_TsGTlqtuPupH1QqLcmcLSKuQZzsuh-TIVs6TcbLWySR_R41zjv3uCi3HIwGUjm388HQSU6be1XmzPVC0eE2Duv3Y3fEnTnqkozC1v1Tuk2GbfyKFZP8IZLdWGR-VZXWsS_R7uaxn2y2nee-p6UpQAiGaAx3yWdpcmYXNFVp2oaNGxebRQfzqBbqpiznJx3nKa7vJN5sNKdaGev9nXnxay6D3hZuuAp3oVZ4K1koFuZhlIm_GylGdW9v2LJnhFte2RDSMwm1JLIPDBo6u4IjPJ8-GQ2ysay9jg88ku4cx82DUeGJjVWTKWp7Jtbu9LrKcvlbcJb8m3JmpH3n3kVPjk2rie9-U16kfbbh3fEDO5bCmvTlyiF1EH0AD19KeM84BB1XMRlIKEk2OBOcdZo8RC57V_39MlLDg334GtwAvII3svJdY3KAOY8eukbJEZzHcdgl0mHFdpdBorinNhLBiixql0G3UJ0Zjm391K37PL4x7FXF_wD3lvcYGdc2T1PtV2VNQ_tEfP0nZ46fawrYufNM4PHpjVweZbItMT6K-tEvb6VmkepoiO-zmoZLxN1frxuSi4d7t0ePUXF257APUBP4HV3FM7rTy17tl96lsVxNvUsN9HMZewRaL7sB_Sw_Vu0H-69ULfeRDWdTvDBV65PzJXDPXDWKsxt3OwgkfDOpijmwKYsFHn38unflPPNYbYSXHTTqNlTvAdzGDOveR4qOX2t-dz5a741p4zpeexnuN6TI7JtVD67D76L5vyDQzu3xNOLmv_au6zcxNRCdKF8afTr-jVS2DrJfDtUwjiF8lCdzmuOAz6H5z60o9EJt5FZMI2pPF0PXrxs7Xkqq3HnsWgbNg8X-w8R7dGrE3XYlP565-ju6MXfcylPu_OxjGM-sDh-8hXMSKT44EZQJX9yj9C0XFXk0jOA95j-Jee1_BluTy7Ye766d5MnyrXGrXVpzlQ023e7BkoG3Dy-ElXPkmLtSAf8bP6jJzBNk-Zz_S-zD4mTZQVwx9zb7L57Ws_tQyiJssmtWM9l7pqp7YUElkYwmHj0-88ihKP3HnIxTJLNgL36L0kUqzntfaQ7705_roMX2sjMY0sv6Xcc9KQlTr9-0Pkwx4pI162dLnGb6_BRNUO5e9Wye4Q96Y6-G-fR9do9rnvcXGcav0f50mrUu3-vxn2n8pqiA6ApIKXcB6cvb4VnjiyxNzVWCblnKXy3EgcNjClAvVpz5NPBtnbXIT-ZiZy9SBHtet4tbexNu-RKU_GVe0m8IQXi-m5OiWroLUXP-mqm19w5-jX_MteBWck7qrR50_vIaUztZT4Ydwg55BYj45X7dW1XHBXTfWaWFRdb5fwpQdYzcokeY1NJd3v13eZy0SKXKKw8Tw8aBOfknK--3_3rO67UR-W3UmnZ1VMw16-94uzreG4xdFWoeztDm9c1pzFdvmlpW41mTiaR8kDnnM-MBBIHsP-eqcs8q89qsOPoY5oq36KV8KUNDb3Nwc2EK0K0O-0VS8kkomTgn2Rnz48sx127MYKxk9Yyqr13nufXNRmr91h6XizllnAdmdRL93l3nTjTTRe39G6Uxrp_xcrYHaEkulZjbtscYjP5KhQQcWA5Jx5tDke-wCIf_rC9euR6pe_6cIVeJ87S9Vz3aA_sN6GWoKug6Fibn5RjNjqaofVwTpqbj0T1NX0V5u09j-Zw_FO4TFG11QhRftF60fvGSEfuRUzdsmyc06UNvWlPMQDSWTzzY7hebUrkenln7vHDOBbv7eC0rWryb5uBbVQKwxfCzZnKokWNuXPMCdOdoXq6D2UNGed1_t_3kXDIg07FMEf8XLt3qGYx5vElPdvsq7c0ct-xc-jdeI9d30hEKQ-8ChoriJvfBDcS3FAYmQzf00h7_3hu9Fye_fLRzmafpqbXz27LxHO3I6i5GWmFHxj-ZtJz_OzIUnonGXPPkdRgy5gzFWWaXyxQoRmHTginbn4OV6m9a5macttNcjgC50icGIKmZ_roV9dlro46tW_LlCbsdaW8rWbeug879Puox6v1j3XovFe9uXm0ZL68m1RML35lxDLqMD2C___6yTx9f7j76_PHFbUvI73PKXjEp92jApnLnCN5wr3ptqQ79But0hnazvZRsQEoG9IGorFtXUFLdQ0Cydn9QodkUna2WfzkT-KC_MqJUtN7ZbsP5piY3PDfQerz0285P6lN8ZG52H6ISGWrx6q5p_R_lteE9kSfcSvzq3kLAQ6H0L43zR-cVBoU95onys_XKH_9HNuhfdkGqaLqjNmGJlJ-aTwDVdSalvuR-8rGblCel8EGQBeTSnBkoUeAQo2RUWQ-td6rRakvh8P8EW2MsU5-gmvkUz0n20t3mLaVU1O7HW1_y72Pc0xBYt_-LHtz4xDx4B1pZNvgzl-da74xAyEzOn0GR-wWE--Z76lEm-gVU-xj8_EtJ9gyNBmRzp5Hu35deeosksZXs-B71wJC2cxzw09pQpYzr-zLbajA5aUazbnpthKVbPkpNuw-5oj5KaOpF8vHoGzlH3Gu7JGfnbclhu4jVwir5Fta1VSGgr_7Vnl-5papdAiSPUpe53k709OkLzniypr85hl7xM36ps_As37R8jsLe9JyvHol7A6Xrdx3p8VSPUWDh0F7XT-DpticRTJsGYGp7NWyI0VXVkgEYQzfMqhVf6rVvCnNMK-PnnOndp22LaEJeJe-8QkY6nSVNPxue_3FuIoYfJSPiYTE7XbU29OYr-0O2ltF4JxLvXrFEtGZmaBv5haqOpIAOvbc_bY997ZY0TiXkTnlrpxTBNBFPixapXLpPRd981YCKr5ZGS0cTSRAZfaoAMbExEzs0Suy1gL6GbgRthKy8vh7LttQlq7d1ljnpyda3ceImCYNr73sArlhuE6u5jhCeWvqxnkC-wkowqXUxLU3STCx_JSLO5Xj8fHqN7t9jnvZ5IHv8frJN4pHtao-Zs3btDxjTaLSD_7fLU0Lrhxfpx7k5T2h9Dtyeu1DX7m0M7NVQ2XGazATv3UNesLSU_HGTVGaUKj6rfFYrivqKEWa96LQxOtqkeODoP2WFovE4ftzRJjNjZ2gabxKU52AY-d_cXTYT9EgcM6st-jI1DFjUqHmb9pm45dmUyX4tF8cmS8tmMwQ5qq7pYk9fufWHUKPlDqJxqqZ0_uoY4mdzadII3eYj6bzHdN2fnsadjN5FTldPi2E-x8B4hhU5WXdhjtPGtO3EREuHn_OjaL3kLxZ3G8p36ava70v3_7dPeOMaCKlEnmMLLHuiXE68npRgfEd3jpZB69MwgdeWXkIUSfWqDmqbblwsTNKuPmWjCBBqD8d5RqViplikEpsVa-921x-ooK9y_h5lSpLX6-nQBEnQnzrVvkq23RpeGRC5d-Uvjp8-EtpDc07z-aZj8jmXhvg1leb2bKx6ie5ZGwnT4orbCZeXZSFXrxvtcked_OIZlKfWK_qYeBrplbGVafX2OrRvK75uSWC3ku_nKLCn-i3-610Soqa8l9_9udHaXB7U2v5CSpDE9BniaptcU1K9l6FbfQB95Isv90LTcdXO-Prjm82--mJNH4q18WbqsW-Tg8nFfeqSR9RiEy07tFYzNWm8hu_ZRE5EZ2aqv9n9BBqzjY1lBIRvMcu6pmXkn_vdAKWJmJAh9Cscv1GJPyUXOMetWU1IUNV2vODIaWQrKs3PQPVrc4k-848-iPzsvdkS0t21Yp7KmH9aIkxVdVcVZwxiCz5PGw59QGSXeZBvTd_2c_633FX_Oj2ZNDQkNLgYBiaMezv9L1Uu4TPH7UnXu6OfC4H-BtWKlmy-9OUNFUYh98tutTRE2ali0Xi8gxXSZrJd-85E17xg17lkSBB6Sa2Zhc2kGi8Je-laeUSnEq3KAW8pKy5Om9vRK4_lnC7bmM_T2U3R-xd606pum2p5-j25vTLr_p-JKJJ6h1cvhLaPa_4568uZp-il6D_4V7G_J2bWLlXcLtQZFNmxyWLzHfPI0mNg9HwyWd1TwlvnhhJqU3iJ_W8g_X5o52z6dtKFPf-NvOIUn91qDy7K_2Ou-fHFRrH9dNEa7eTkkyIMtzcc--KpcLncD1zna_R4e2Fse7U_LeciWbfNgKvoWfnaqAJtk63RZMkI2U4V1dnjh6eujM_-ahhkbdkc_VqjC0eRZUcNVrkvP60t94S794tbY80CSpWVTzl0JirnpEaM_O36aFSGdrZabhhTDlS-7l-9hhEHB1nrNxnTA934a3p0ytH1qN5L60hhxO_8eoOdZKUFI5k_Al7eo_6qrrZo6Eu8ZzmPKLmzLSS99zPynUa2nvaWkoHPdYnvReVCvU_htdTzz2XREuPtj-HoqeMrYQcSHYYMWvJLds-cgvUQTaEByebXfxSXWsOQVk8l-9TBrryd-nORGRx_dPqH-UwrVFaOSB4XlK8e4fw_j_05rkeT7kV9tUSnHRsJQcc8yAoUwSrdbvLDM14Vk0Z9tJIVCoHivajqRVi040XauV_-JbM8kpNuHdXfBT_IyOyTFnOE9u_aWwkLHFwMLnrqCMA-ykQRrqHmmz-LZtU7bf9uM1s3VbzdU8obmRc4b2dqOdqbqmFBqfF4VKl4RmKQ5Cq1nRI0ona1zYrolBKU3oo3hq8lRTEnhOm27Yqyzt-RJS0sofwnN801G359vZSJlKUa1i9n6ZUOWzTtPtO58j-zFGlnxyK87OUj8_Y4u0xKfaqzJTVyLN0qvcccHan3zGsMa1uz9WzBsfP-8Dhk0-BK_4s8eOWFvQYtAY1JdptuS1rLJEzd-lZhmDJWxpzm0s7LITK8jzU7Xmoo7K-6z6kZkg8nWwKKD7MCHjT5UY7W9L8KlrpIG2AnAJ-y3s0N7cSFdjR1ReatSRljJpXCleKJM50tdcZWe4ZFXBP5-0u1D-hmiwplraY5hI11EjP-HxjfnCLc02T8Xaex1OZ28WqetVoaV0j9QxFovr1_pMmcfT1JqgJ2yZ9Ci9lqYtmObK-HylPj20os7hrrjNczguH_0C8uibGjL6EYcpbFd2SiuDETfMdfJPrX3iinZuPNAgSFW6pQm95yd7l-5hKIdqY2XvSUE-odnW46X-adN3jXfmZ83Ds1evR7uwkTOeuGuq45dn3WRS35lW3fSQGoIKskVaW9jXY77IxIgbGs5fUbYNMrTK2cHYG3KHSD-km1vo79xKNczmCi_O4KYaTzaYiv_sbyypN5HcbuzUadNdoZBH0Y6TEjeLEHADpcs31M6WBemBaUArmoOd3-aiueNzjS5hz7jgtZfLe8p5N5TCgm5hGPEsqeuAClRI-9zQo79B8yzz9F0V__6TWmZqtreVNjPwEVc8thn66G2pV202pcmni39UmNE2cRe5PKRVHnkzehn0Zbvhi0uY6qK4mU52upfIqzpx93zktVZV__L05InAZ9M0zODJSyXNacufuNB-e9FRJRx1476_5DHXWGV9Uv0ZxPIhLaMlH3LjVPalGMbOz3e1KKKW6bsQWkesSO_HZPHczEVvNbXhezXSkXdrimQZ_U2S_R06INAGTc_svVwENS4rL-O02ZfbT1zV0Q6EtEURWc5TXfNtzXnRBgZ-SwD-_zYaVto_6LFuYySRSvzPq2K0agGLbmdR1r4gsuXb0TM52hGVT2n4HHnGTVVpr5mJTQjs_98LePk6n6lnDq8eRbMN6NzfCZcRXUjk3F-XGl0RANfour-TVnJCz5eUMR9jOWYN5fPtDGrLVt6zFexReOUw01fbKW5zFrRRYk88ykLezuhMVLA7LnLuEQ-gYiMjBcHYiRSriV-rpm6rNPDuW9ZavaImU4TR-4wmokrc67BKwzcDfzf_bHXeN0yo_y6e7maeaSpVRNZVXS8uzjBiQ9Phq4T1X0pzPE4V4HglOGUwpu9-RBfYtJzmFV5xbPRheRD4haeP8kXXBn1JtUtrMmGZTnF7O6_cxur_BDDbtsGW4teF-7yODmlYLc-EetesWW_tOSWnpy7hK4RZ3bk5bRvtn2_0o52Qd-87mAYOXKcNtJKKWe93s4GHzVQquHFX90TQX0F1_Qqdvh4X1i25q0Or740k86rryhKdL_EWvQcnTu6DHq8mfPJmlvH4p_W2vcDj4RVve41Lat-BcfHOHqsa2n75sGT9ZDmnTF6oFQodmDEezQDuD60mI6qu6em7FS-oiPSsQe23w0OW582gWURH4SVIlfCnI62q2XM4mdR9mmzRyozuVy_Aa70k2uk-zBlPLadRMeKl9PVWL-ptizqw6f0SppGdnHemgbK4orHRsZhFlgP-e63vHtKbs31PH5pPOFuuU7E_SVdQnsSpyApjIuPrQ3PFItvylZl1neRR2F_pjWrilU3qJIOYgfpTbUqJQOdYTfVvqc2lrd0uC9fnz9bxvE9e86Q9lzdBNDOVF-bGToqLNptrvU5ZxVpYowzS1r5jPElbtkt7doVMAJv4w1NMp9_47GbPOYxn5IXo2OgjndPTNY1Do6EXlo_5GKl9HQpkj0kxrK4VQqiNmUXsNykQJ9mspeGr7b9ks5dlQrJr8r_g4nsTmrPl35VDl--_MdjK4eu3lU48-ox-4-8s1QFUlv7UbxEc5bqnh5WTpXs7efZ7QW4zfNCzlsJ31te7NV-6oNWLgfR3nfJ5PhHSqHw_syN3rMmYoXmmujKXnqmrTKcOjql7_5Jn-Q7pPinA_hS_gFv-ZBiB0UHK7GqoPWEun34nW5q-z-aVxh_mb2tiZ_-weejbJtICiFMJ3w9U73PLX93ypfdI-fJr2etZ93F5zU6zfPMYcu6V2pSeUdHOkG-fFuY-0pDhynjJ7_Nct9w6Cj2bl1U7YnB2D4VX28tYVq-bERqCnbq-8lK9nYVNGNEIGy8T04298xxXCEbLZRXFRUzWtmEM3cpVGVqJWjfUWNQRhb20maN6AUaGgOnMhpZNbejfbcFFN3Usj4pCLWiiRftZRv-sdqZsfUY_JfLCBSui2IOgz5Ewiv-gsCYWOSPD0IVi6KuGm8-qbsmo6c0IGyJb_NP1IV2H20L8OHrknDq8T3bhrk6dgvPseRduPW_1dzHpBzGnJRuI2pUVXA4agiqrczXgoHGhybktK5yLnj5p7Ir4D6eG5mg3tdHPmoc4hbE7X7KiBPdH2wYak7h9VYykm1kcpuL9HiWnx3h459csKTZ_3SoP1QHpyZxxLLnvv-dWpXd_SaepfPjIiecDkLXhFUmo9f9LQaUcke9kU2s_Yg1KzuuoNcn-73wYVO5aLrhQN5fXzhDAHK3G008D87FHZTzUz5UmiDvOkGKRR_K-3BB79xfZbLp7qIwIcxm2K77Xxj_5Cwdb8wjm8RznE-_n-JOfY_ebNk3oUleSMqoJztcbzvcVQARPmGNn1cmb3u466VIU9oru7OK80t9szgN23O-jV3HbLf03x80tr_-jrFwlYuitnFG8414FqUOeilrWhjCUjZ8uE5roXjxKwXd_v2NaD-0Hh94nGX3bNHNW_PTw6mN-yHGmspVUf-Rypq9f1dTOazAe6lZnr8eP8cz83V_hF-f_Jh5Vyd4vpTR2W86UdW1oNPgb-AVcWnaVZ_Eo97Lfa8gCbKqW_HyzQMZsaU05z6pJgzHjVZT5zcLTfcQDpYvc2p3T5X6ys8VtGZn-l3sG99Awt0aUZ4h53FllAqvwnDemWA1-6vDOCB2ZvNv9vrsktxeZI4C63dxBHm3aPmj8e5Q3Lof0IUpn7lxfP1NS-75Y7uuwslErOSmyESHgvbi-OebqBPau4qhE1rtpijbR0LPc0ju_OybupKXavKQT3tQlvehgaquhSuXKNK16GP_Vdr5HQPY-PNQzb0nfGd7UXpEk7hkqJq8pOYllS-_cdrruCAuuno89gs-fFmff4vV-TjgWXliPSxo7O3gN7b4ofEW7JE5oEMU80N1SpqKYyKpQSOhHTvbZ1Ht41Wpzoj54q4XRj0eVocl0_zfnVE-UbeD7l0k_XoG98xZK41Y_b8ZofPOJYdHjZOgzCurnvmuaUNmsdMWFmz1TGxMB65mX4DMgy8_Odbbz40nf00Zm_SHr8UTJzHAWTkf0ZDXlWT47kE-lN9pqyQMsGxvjL_bQ0XUl7MdjYaBHH79fp_vP-2BpVPcyx3NRiaykobuujfL4vrex4BqQQjZ9mHnZdC2s9aN7DSC1n2_4neklOFiwrWv9ITpQ2CA8ySFLGf9v57mM2IPnEfierIgJ2xU8JZY8tm_CeahEZMq9azKtdd1uHQvtfD6ey5_ip_eaQFikRyfwsYRuTY22C5ZynyrzzbtKCxWbmjf-2g3Hmv9rDX8_irsZz7WSfe130c0tuDrtNCnx9gr_fS7ynBdrfMc3vpaYfmciWHPXOy7On_ZFbsrrkZx_lhDmb7g8-AZ4C8dTT7Noeyn7EBGge_Oa5Ciotrx1ac7PrKo0KuralS7ccfwHzxq7jUX23pJvfIkXZiaeoSQ94jj32HLicnqSny71z3vQ_t6B3o-fxSenVPZamb0-5PiaVOiiqmA1ftyqN8mgw8mwcnH2oUkupHOmsPrEoONGXkfxBCXp7jr_bo8Dc7BLcQ7ff_vd7ed-eMW7MatUeW4kIX24yE1Cff52HlOL2Bf6lWig_pg5q6-_VrOYLA9mDYupv_Q31MGmQTaG_Q5OmP3yUTlz0TVr3n6-zFlrxx7-9rgT_Qs2pw7r301Ba7f39u9_QVvf6Ccdk-bpn0R-LXb5-q2ZFfeyjbZsu6nb91rc-6g__vt3Trkbb9l3k3clX__naJtv3G_XY5_b861f5WMqTsyl1ztAVULx-67xpZ99V7SYfr6LT3j5DFlj9licXZae7vE7jj39SdevFMNqp8EwllvSdTtqSk-c60DRMVHDbPPLuS6jZcmaWgpiSlXr6KDFuKxPAc3avn6TA3SMS2Qcdsv02abp7nd5TuSJdBn_eTyU52mmIlbhg56FSxL-ZSxcYRLX_1_-Ey9vmu3t_OBu89lUv0dH2fiPsB72XOaotChY1gn6TO_5rqqfeN8_0Z47dkdAsr-aqGWm_uMpUnmQHJcLd6GFzhzeVa8bp3bzPg0tEMeD0-PS1pM68xtfrvUZ1nNO120ZQO9HLYFNKOze1Vz3xZv_aue_tltWFKWciQU15Iebqy1NGwK6XxtTbrp9qpGDaVn6akeqcUUau17BtpwrhtgxaKKoeta9zyrt8ptWUOETZKymtHbP9_f796fBQJmh4txzwr1KqyjtRlVfNyQp55fbyTJpyl84xf-nnCnn4IaFTUtzL1uSUM1l_N2-a26DZlccqiJzYYd8OVUqLZ68J8lkir3f8W5W-ee1soXBKUrR6yvCCmUXZ68myHHqT3TVx5I7_7UrY_vpPrpvq5v-ea6M9j2tDZk73coOIP14bpdvf60mRL79U1NJVjz6Au8U-rSzvvfTx8uuwV2UE5xcoDTIf6VWH2Vmhx6-34SKWWkmxzW-CrFfaqCt-LynJ7sJeirWwK9PbhgcSP1jiC6WwLEWkaax1u7qhT3vV--a2Q7FAnW4fuSAEe3Kb_sWoxW45Ki2pJedSxM7qAkyUm96kJFITk2d-sFKE9zZ6HF-eQSoSxGndLVZmZCSkqMdPvsekJ7U_jjcs-SKjqERr7IqSR9R5JBmeDs7kU9X6N68NnF46IWxsCR-0n6qce0RgtM17e85jqBNNPKQeXaf1V82uRpvp5u4lvT5tn5e2HykKt21kAS1tTOxjTGP0Obv-G8Vczas3py7JiQ6piGHMiWPqfIS6mmM-P5vC3qoHzSUp1rjoyZk58KbIsbadDUEI80wrTduXM172kXObN4Mq5sCcxhOzO73uYOLpuWnTC0-vGpCa_hH5NofcdelQgfHRuuue-Ysfg-E-2-fmBqpHM0HGVppLfaRu1ue5FuRiPOL9nuYUkbHn_Pum7BTau6eqRLX65UcEPXMfXsu4y86oFGd4VbeRdZx25F6Tg9pQikKn5NChc6Se6Y2wqtTPn9HFeaaUGfOIuKen-ppQILk1UrbZUAvTs3Dz6DzkyHdlmvxI3M1Z_Uo_4yqI3-8MjJNvF4zycCCDUpiboKypOHOyPVLgdy2reyitXSVDyy6ZaFlLQkOf8hRfbThQYGhhygKKlqsGjxI0UgbnQYWs-1_7Xb3FWwqbKZpdNZgMkzYj5W0fkR3mWGpY7irEn2R4zv9bdGGnlm5sX8b7saeSQNuUAZH__voN1R72oeroez4Pc1Pq4HNwEOxgyovA3S4vIm09xo7907R3_jsLfC-q2Hb0Zsa2nYCBn8iw-2YzdsuvauaB9fyNqraU-Gs272HEhc4zg9diLuUduUUdURHOdXaANaV-I3aozZLofse8rqpJ5eG90yPY_6wRqSbcq_g_vAkqhbWJxa16cE2xtO85BtHG6p9zOTcTtYXDqTETiUVh9yw7D4UG69gzXp9DW3e9srjYJqMpzHrnHiVSG8o_SjV6RPLvjafnQU9bIxKXTii9CtPVU2dLN7V3Pw4FKycAF7JTFR-ab50zYCljEz-ASm0vm8bkhQ5IAXPrXp_ihNL-LCWsDVbJ2hb4vpcY184JkWnw2Q2gp7go72bQHNKYoks-Vpwbd5QT8sivz7MndeaRqxE7-yhBjwekgUmvFH7C2pyNayZFfZx_s5FBm6GQPdrYRbqoMkMpOZrCj9PO-0ZJFOc3b5AelZurvFPZVJgupQW5H9oDcQ1vUdTsQOwW0apUpClV5TIM0HletrQNfNNj-ILo0L4RuwehxHYRzwWxhlqMi6vD-j7_TOudgHEV1KhbebXcqdQmFM6cxCZuno1yYhCJsCkexSTIFfA8vK7Xw-_4KVtz6XtTT9PCHT0Rp63faB9pz6-cekus768niyHM0DQ39d_0tBLssJpoCbGCR06TjIO1lIxl9Iq4TFtu-vf2PXiGZRYdbekwb_RYNvcvuisT9t297SlES-LspKG6lXtBUfrpK3_yzFLHYgjpuscq_KpFu588bikibTZPagrq80hc5uVTjpSrlsaQoUHlt0U75i6OtZPbr_vBXP6d0umVskILrtlPE7uMnpa-bUyWPFcp39d1pCakyPercksj1poW4BjMTYm3Kmtq2rxIqrZnZLlSQ9vTexq_-jtprq82AVPOZnzjqYwo3JBPWU_Dx4g68Ip5cvyc8tHsu_b3eNOPnHV2hmi0S_vmM3y2DPYyMhZcC1zLuy1KMzjT-G8VsqffVA71rVfMdm5klTAlKwed69YCjBRqfNcLZZ_ayKZkLuuceo_HXCrJY_yk8hIQ9CVRRJWYOQHNJfH-uFqW_mx-M5ft0iqcrsl0cPLsik9LUZjGpLSXvd-MAueINHfL68VlKL1iQuvIL-KJsPUb6adP5-42sp3UtZ41R9yyceW-osrPaeFesU2cSelcro-mZbKLf5dsNA2FsL5nlpoxRyrkIj_SO3pmYMLRXCEoudEwQSS5R22KWyszx9Xn3osAbj9LRbmplXRhU04R9fbZ09Pq6IMJYc88NoRrROjk7t7DZy5LPB4IaVT3OLxHZGj5XrqtNht6S2evzddaxuKZU1diJ8X2tAzX4BR63TSVesxeWJLQ111wvWvTj1J1j8X3LEMXYdLOBceY_N69f4vKc5Rs-Y79gKij9EQC3EojcV7eI5Yg6jzrpe-le_hNdFq3_OfrMhJbv0vvLi8C_Xv-Yf6-JqbmMOVx5jikI11tp23M7Wc_0s5jgvEyUaXe4k1haE7Ntco9jeD3SUtN9bd1hZvLRCXS0Xk0z-W6L8Vj6TXmXr_ij71-05xzZG4r47HkGoihifGxpmuy8LXpfdHYoY9jecdj9NvL5HmhuZX5ofmkU6HIyokXmR_fauq3xOCjmnFXHiVQ31PCmRlTj9vP4L5810HZWdO1YmKPBJC8S_NSTnEpgksZVcscSd3kR6_MUfBII0_rNudkot0ra5jfQIooj-ZOcRSxAUXI1sRVSHXB8_CL5tkQ8PxJrI3FTp27pJrlraOBUAtc3-csAX5Pzdl8KRKm3_yWDgod-xtZXuVGo8Nza3-LxBTHNS36PC8__e5ZLpSzYMk3a7c0lyx-X8pm2cpoXPKUuuf8fjmMrnscO4aHKwrJ1HunonAq3M3pbeE5Ce2dc4jjWVJ2RvspYXtNW0N4gT63mxcfXuVj9DA4wTklzHRu3TNSM5BlnuoGW_ScEG0EaUTzc3rfbaHPEoPSUR_D0-4o5BvMSeNMmm29vbcq7wi69jZzW5WSuK0ajmr-OT2YwYLElaV7DyUGb-JV12UO8I29fT33XJs09u6Uo6D77RNpa0udJZNkbL6o-u9xjeYcGs-Ro4iaJB8lvoY-9EGlJSUExXKzI6MA0zpcz4o44W5OG4StGRC2fj9-NHwEyNz_O0-xdIgUPWVifm0Q-XPaXcgn-Fp0z_EE5BdhU-5pLrfvSCHx9CoJmrdi9Pev4ZjsTDfTee2NpEbW9PrJCXPjlupQuLfEv_e87L7SqI1ZSGwdypU9Z_-eK5r_Rd-HST_RMOroy7AZrrPBcDrq8Sgzygs9ePR-7lrjGK7KUlWuk6sJrdkI8uc91uOBAlyNo4Y_0GXMuKJ8yyjC81VgPPJTKws-5TDt1JX78PxtEdu29uo4OTiLPtu-ce25ffVX9tX6T08WySQyz8peKCGsisqE5tbJGvNB57yXVZ479owdbUu9pTKl0uOLR_6659Df4klfdeNRtq3UmzSs2AB2Y1fviamSc2K4_W7DJlo98zDfkYOiMhoKJ2497t18bHNKW2vwe69Q5MY1h3yEFLmOnzmpt-cEpp9JUFlY1FvPcoW2PD9lutkc6uv0qioAG_SyF3FfOcsH4xVZ_l666afaGmXFFJTOsjDc9RZP7Ow5oISjVf-oDPd7M0GaUbthg3tX3ZYfYK2jcRX7jTxDy14qV60nF4apzR9utMns9YNiOsy9p8m7SlqKxl2OAhpkuoQyQuyxPZWudyO1iORiI7o1jchgq8gHPPPkqSDersMFM4iuDCPIyTwUYnbRT3lhNCkLxrdn0zF8uVFP8tHzBZc8cUt27dUqLxdH43r_3qmPPqV9nuVy5iaos6M0cGLc6Xaalqhl5nLSUXc5LnXDsjnXSKV4lE3PN12s73VEST3is1Eb0t_IVFrixmA_H2UBzakUolijY1z38qNsc-qez49C8ZVu_9G2xFlYbjW-koljDicKbZ4T1MJ73G9KWApGBnZ5OyY3W191sp0-4pzlJZbn983HM8iUiH7lqvCm2k_lHr4NcrMUHXxQKoCITvE6dMPuqqUcl-agpaJZDqp0-fba1ucEifWNXlRqZ57jueeWV0A1iR6HjeFKniP0mZuVyLimv-JCTp0zR2He0qV88o7pDaU8DErgjXex2uMt28vGNffVK-82el11Kq3Z9s0dHAt7sKx5QNbS9lb5VPhDSj0uwnYO-mE7ZnoQdactJAdPMxwzj2eJUUN78aWa6il34iLPqJpdp7kWTz-7k9ATdXBc6DzpFnUYqR73-DBcH6_YxzTUzMko0nmJ89eqgSym1AdLaadcFu553Ak-uEf50mWGDvaCWslUuaxgu0ykniMe1CcHQ2vwMDV7TBpn0LtkTrMxjjgkJske7zwfU8483Lowi9w1KrSRQ-cJHIE0bk9adu6iexnon7RiS3pu56c9xOOHtitVj5t554ywAacYiLzxyd8x6qn4Laof6Ri9Xj5u6fuX22UvkwrB_S2DPA71OtIyvUv9DD2Qh19K1YjP-4yNsEXdmYbStKAm9AjPUuTB9zr2ZIhzb96MH3CTVpo7vtOEzxeHqDQoLodvjCB1nNdIsoeybM4ngv_wzPdG60GdZRZyb9ajU7WxsbFDu7fnppq0x06pmIbcNu4oe6dnZ68DBx1VnDH2K5qCiZ3q2OsifZ5fDD_oTg08lLZLNHY6j-2IWIyg6itJQU2hscejXvP1daK-EWAXqg1I3s82ZiQm7ibFkprfqUO4BAblBoGEx8ldceuVp8XH2P10tjwjy9l7fbeRUjS0Zu94-21JaPZNThYzrG8aLL3dFFPQtFRaQzthE9fN9lbuyqAHfOMevWNA2N4fEZKQMtbq0nhjnkptiXQNMfR5I10Q1zN-LuQXy0Rab56dKo1nGxv8X0qGT_4uG0QurUIpKOpLC8Qjc19YnknV9F6aMCyx5OiAJt7BeoU2XTyIiMiUW-Ean7m63u2Kjq5983-qjR8fWCl5sltQ5vjSeDLSCFJmrE3O7Hwpa0vXw9kcXNMz4Qi_hL7f2vcstf4lP7VnzKPd1rnGhvy1Y3AlpFHn8nTmcwmcUVyla9RDmt1iA1COYj3aPbc1o-Jxv575RlXvz1K16SiPdGxnCS6aq5tt1WKuVs5FfrF7KaA3bBlLLAyperNbJ_89StlqQ7fizj6b6CKmllTo3fKsnD3Vr-8vF9ZUeWRGtx2XhH7VDznwKfYo2vyWagO14Ke7aE9v7G5sBMsMtsQYpq_iNcFOM8lwZ-bewCGOflKRxZvpQJFxPEsw2G0RcWo5cTBhbDz5Mr6lCemWtwh_R4lU7oWR2cZtPFfjvUyW17gp-8iC1YcR9diePSXz5IY8y2jP3VVm4KffbYk4k2uTurXd01kXarbQdsrqebHxilHo-YHi0t1hADg1BzOBQKte1dCllTzz9hxDt5sHdM0LboLJw-w6ebWBppK9O_VTUFxPStrlMgTNlEymn83tnl3ZD5NjlJFSq795arK0SzTaU7ptI-EaP1UuG7f6nFvhjG9Bs-l3NOemKtJDqkSmZSQUfnG-vUoYV_oCtU4EjAzDZgN5yl6FUJ_cLXH1r3qlebsR5UiU-9JG7zHRy8Y9qGxtk6Qu6clMk_Fyqoa-I49obb_rtVoRLr85PE0hUUw99amjPtugS91AuXrfjvRIJRs1_bRpoExc0o3ccm0hMVdFNQVCGfNU49Ufjko18qNp2Kj9lxQ3x0idtCOTN0JzmloY7VySfKcJaFys9FcJOem3TZm8bzTUOKPLoI8_2hJ_24zOZUO4L-05VtlHduKmHmkbywRI37o0o9zKVvoOMlccFmq8JfI9apm8Mykd7xiSRs5PukmMwaj93_4zUh45Ot7txs4mQBuP_NKOPG0n_5Jdnab5FWMmKqktw6G2_DYvPXsHbyhMbUyW6AvIr56qj7KndD-v0uXfNoqmej2ZPlHsx9zrm9bjbbMVsf49diftbfUveA2kxFNKJ9mnZka0ZXNuc8kYfPyv-ia5O-7YvU0PNx-XjJ2Aq7uo0Otr0sjqSk2iO0yO4Uh3siwxpZYmhBQsr2Mkfb8pfQhdUFvLWsG7-MROdN_NY16LrlGK8XASo9O9zNB0t7GvXN3UDc8gLc9ShdWfEU-jDqfpcT9fzw_7FqQ1VNXqsbTgKt_m_xQqqNtrCbBR0UFjcQemculNcLidvj7XMz0FWBlFat45CpkhsKi-dk8657RaKVCnaBfXa6PK1Dk0-1opx_C8UJxME-jn1jNnWL6BZnd8xtie71i095wgORSxwtGLTKaOH-8YBcGS9oFSuEym1ZYaZ6RdBBLa8UMTp6j9xjaV3v3ifFnn4bzgPil3kGsSMf96jg8vFoXuyA6jRO0OUOdSV3zWQYV85Xo073inwHmXLLOMfEBFUq5qL4Aqjx_X67WUboYcYOZwX1IIzmvZNkNfnQ86whW9Lkas9vod58jvULL2P6jRPf5_otG9rqc_UehK4Xaq_o9R6F5PrP9Q6P5_S6HLHat252n4D4Xufyh0_0Oh-x8K3f_hCt1XexF6i1ePQ5SzT1Pbb3nXc9uWo3ms8_hGKRoL4Cyt3D7VfH8q18nGzW8djrXJg94cQ5ffekxzZfbKlThLjTCdIQH09IpvaoNaavBpz75-U1zYyH2qfOl9byWa2KZuXae8Q8Fa7VNHkkhOcypBDkp5pnViTQA6kMqIn3PF39PMSrGZyqMf-QgvOQnyz_alHL0n-p6Zm2cSvaCeqPRXqwteT2z9e1__k5Lz3bSCyuQo31DOw8gMlnYhEWFvGtJ0HT-n9Nu1Gr8UqfyOnn8UD48qvKouQGxOf34uTKCoIO_OFAwQs-mtPLO1_ZErxZPXK3wvsd50wUnk_17t-nnYj2ZyUbBkouNX7vdqXt3DM1rksDVP5Tnz1MlBV_RRmjx7QtuUzFFEbf_a9EYWw47o3cL1il662pSm1o5WNLLGzfz3XMWodB579vvl_9zzw1Go6ddQDz1v3PiTfExVoq6DV2xpTlBnvPceb2Uvmc5XXbsL7cJKi8NXjOcwe7edZKPqtltXn2hevE9LeuoUOdG50SptO01tVRedqZ7lXZ1c7Z8freBg5k34BxghNurVymIIrp_La9T01jzQe0YFgnXwTSmobvlQ3amrkNvsS9up4lGYnH8iOijGqapsZTsdaIexrzme_YRrgEqvvilDk9MXRTENSKp2PYU5wjNSzlW9xpUaqVS0la9Sprz21xlihxqF0T3xG6_BE1GGHH-mUymaid8G-c2ZghF0UExiguL8O5Pb19F3UopxsTvXUmrjfMY0_sR6NzHSR9sN2-pxEH9Lx7ulTuEvV-6eI-u5j7-nyLOTPPbS2kzr06XZw3WClRv8TJkaAdaMFz-OdsiccovHmE6trB5aU055k5X27qbTOIiSVHUgNvC8vupLd-xnjSMQFdlkyqbL9t4TLP90uparltrsxo-eaaVnbTg9Vkh2OhJRp3KGKGmplq__rLEA6UxL3ijfPP4v7uG3-dBJk6TLG36JNV6u1I4UyKYonzJXt5TvSwpw6X9heerkFEnyJspm1A3He9GZptmw11ii50erkfMtJYaKJ75dSTAyoXLjLmV7YLG3A5I69Cjnz55ZF_Bt5qq6NM_MT1AaNe7op4mJhAJf9WzDXAIONSLiy2Clpjxy5dBjz6mveWRtFstv3I40vrb2g3WmBbn13JvqPx77cCfP7Y_SpcdtNKmZaQ9K8dxGJk1Kb9yfZbA8Xf2erHbU6CSzu4Db_zWmP-lYVImp0nYsjdPWpkwqO66Sk8v3teV4jzmGmpaCzdln_k3eEWHx3rv6KhVWd-uFePfs0MG9u1K8J9f9yqO95eZOx_sevpx65SOG3QudwcSPxrz0DqwwonCvxqtN9Cs1Xvv3lc4NRXz6SSWIzIZRViIhOg6VjzrpFrWvXM0t9nazWtqEyQCZ_k-dGTOJPj-kH_7jNlSwiI6eu2t3mleb7oAjIv3i1k9EZUvpUE4RNZlZu6qIaisNgGXuSL-040OExBRq77i2GSvZ3NYiTiRil43zIy5vBLOUt7dm4--ySO7biHZ_rD8YFFkU6qY2rqlEFu4Akywpquhe78i1j1jyt3QykuPpsugfrqtVBV2m4nsfm893Krc4jAjbtkxbDiSaWTzI60woX2ilxpbXKsdsa8KGV2ZXhtbkNGwGvj1TOGBWmEbJy4izKBcDXb19J-35VKYg5fIdUwJ_lq6oZ4mdpLP4FjdUb-_1-o6plX0ZGponoGtSah9uvZ_FfrNp8kn3TY66lzAWq2YkceS4cpXsbaTLJp9_sfclXpcL8YlW-q46_JbOwVH-kOuBhtOol4OsxJiysyQnqmX3fOyvch-mMZfZns0yqAqOcZ-1i4_i3ilVnlQ87Ec9hfd7d2Zst5-8r3dagFs9pPvlnNt8ql1KO_ZskB2w1_V_y3edokO8nWdlRXHqP6j4XJnlnW2pJahvvv2mW6R8M3oTy7SPzpT9PbJhKI0RbeO_v0qf2ONP6qxs7tY0fZZUNGHOJoTuF_WWiXd4KMQXOiqzhmfdyFk--FRvMMfXSj8dQ_5ZesQdh24rR6Cri0tHDg9KyrOEkr1u8DTbSE2SCjs40m2NoB_xfy7RRkX9ioDp_jMRn1S19CRUE-aMa1pBZ635cYwDr7krgx-GjkB97-TWr9rEqmivGgqDr_zgb3s2jp-JWrNQLPNn78YUT_bEuR200b0Ui616nJNEmn01jt969m7kI1xKIqcgKTvGvKsZrr5298T2lEshcR_b4vw67_SSuEZzmiXVFJeS4eArbSCVsKdxZKA8H0ckxTOONiXPWWLzt3k1KsOrmjhHQTlaHI2ucHr_DbNUupce3ewjypbO4chraA5shvasRkdocjI9GufhX2D9vbehZgGPu2cJ5PdzHch-OdQd-c9jRJgUryo5DsrovTH_trR4HAePeECSraa6oMN8IveERaPd01GmBp6YkRDSutqNf8Mew1NJ8vie3urRRj4u2ZoGeNM7j1X-o37FU-0cvkCq3Darr1xFklkfKTglfm-RzuYo6J8IQA-EXzQru7nObw4fSs9bXcJDoZve4lQ1RH56lN-ETiSLhNJkMREsv_aRsrsFTgnNMV0o8tR0Swr8EjtwwFWhPvbJD5KyBvXEq9Y1oW6jwD2wr45IbftBlW5Lihc-CKl3ZRLHaiovkz9Uj6qIUsU4Y_iZ3t7Vdkb0vmZztoPySqZejW-dmq6Lc-5edhsdfeohSSa5rGhApOq9VIOU2-326ASw5Z-2tle1YPvNl-ldOOm8uPJ-sQojPTkZXtseCWqiq-l9p12YxnWz-DpUBe_8fm5oTqhXme-exN_ov2djrJMC0-hQ_mVZmjYws6f7XkZvp6kKjanj0xUvh5SiHsX61k9BpHlSpc6pKd0PxlBSBCgDJXMxeDZxG9y44fUsqx4Xa5Hb9ynZ9NMG_5ta8qyr3HlzrmeNW4ei82jeQ8XNkfxJabGXantLxWwPJt9sK6WFu9Xxau6G_-e3PdaROj2XRojDPhTQsnam0hNYaqVUSmrgrx65kDkW0sBe1wsCGRuFQ2cfU6p70efGiGa41MU2W12tNCxH_ucSwXM346GnBJmb3tn-j1zWlarenuIf3BTd_8amyF5Gql17oetb2IzM42O3sfUxo1r3PATXT3Mfmx__3n_0urwKc7_z3i5njW91TyN1_7Xx2dIR_bZ_onD7w3cBcor-HpnTn-fbbz_jPn5Gn_VXn0NZxQvl49dfG6mci_vYBl1_fx-7n9-3RT-7rN__9_Kv_vfjt5_4X22Q_vjz8GCgz5kFRpgx8UJRupfOaXFzixm-l222lBlDhjcVPV6oA5mSz_Iq_tUr_q-_fksOfDNUmWWs5nUeeRq9xvvIv_Fz3Kkyysa6hY3jrZXk8O99fVR2P9ejn9psUlt6KxXR7zL1lTiqlxjZ_m0uKbLk9utrH__e11fGjEjAWAU-Ey-QS8BX8L9u8ct8-dnPvYxoxzIo-_r7r6__a2Pnv3-uG27WqYCaPqYt4Jy3-7dr6NfH_-me8Dbe919f-V_dN48_v29-fdZ6_r7tZHTUTYw96x-_9s999ddX7x93mUu_wZS29_gbP8n06577N_ewbPhVaoC9LKWErfvez3G4rt1VajEEgr7bOCUOd_W3Luzn9eNVsU_y_rpWr_-e-l_Hb_e3imTL43jTG_6rr_eHn8A2u-5yG7xTzMsyZX_9FFJmH0fO0HiLN2qTnxPnm2nz_9ZP9XM62KovY2M93ztlbnlRuQZRIW6_zgs0h3J8aYh9hesMOPp_VCS_f94-Pu_TRlsl-ftV1Y76Dxvnf-h1kEfUV93-kfduXNs5Im2ex91murv8zSv4t-vuz87-Y_v9ZO09GezLccbff79ef07EP7lvrhf9b33f-W983_9-HcGeCtRi4s-0BH-tGugsvh6vf7rb5wtp94lrx7FdispaCnB5oRjLLzuJrZzUZXi1qd_xF6i25RtMeb9RPHkzph_mu75moE1f6Q7PJqjfXGBmz7RTFNUmXR_bC_0fX83wtNnqWVxwwcfcu0tqjmKIgMpbjILwKYfom_daB2nKrOrSs328nyodCQCrXsxUB1cYjWQqj-iZ8vy1ltJEDWxjNqchGjMBDEdqg71M6CYrfMdT6Ouj7OZlEPRmOn_6xm_12xblYEq1yW--_1RUEs_m5g5uMPxQ3RXn_FJ1Q5t701PsUWR9j71Qz-pLU196K8-IHNi0XblyX3FitrYZslJk3ZzqY50D37afC9dBt8jFYDunn5Llna9030rW1q_KEbuqfv0NF7FN8xm8T-af7dqzzznzfNAs3Tdu1n1UyQj0tnGUXub0vG5XDUqj8Ez_dzaZpnT9pFzl7cX81MO9Ry8hX8uTkmeG8uiqOlWSnqTeORs7ZNR3OcZtiPUeW7nsEsBL-Nl7vcl3JE4kGSwXg_abOiEa3moePvLiDDruXcvvtO6YPOZd6cG3knW9aWv0gDVldt4PHiue2Oparzd1RERmtOX4yvyl6hTJyVzvw10kS7M0AGrXOqblnqrt3Y76GzuI78PGZi5ztkzWtay98lp5rOZI60Y20x5Z2p7JzoCr207HZ2Lm5mj62KnvNl3PusY1WuRU7uEnXvs9pcGzpOhbJMd7i0Aq5kcpkXKZaU_cV6qsZzloa3SMs1QSmpWzbdFnzJq6G3Uza3lY9FWUf1FEdJvzURoUJcSEN283zH0fg1QntGO1YG_KsKJyoOjngva1Upcig6Ouftbhce-ni5Kqpznz6PKym54hBvAy-GjvK6-KP0vv5S04oy0tzfi8EzTK_Ae8pBT4XF9pY-NXpxylOMCrLOcIOdhEpDtCTnKJS3FHEBpSn9jtxe9d1xJGvWZcm3oaudJ2zTmvdEloobZUrgbkkLltAXrrWuKcZ6082dISdbuf1BL8vOgF3LD3voPaiBfCPgrR5imnym9a1-udeMX2diWmtaWaT8O6lJGxxhNYYp3rneVmvuLe2il7Vtyba1HwULrIovxygW1UIfcclVE889Ldy4Onyxs1tcwgKlhTMc0sJUx1fcT4RuqoKxQ4HCRU1CmykYuxiRTYdqD4NnySngtSg566X5muu-zbV2kUn63E3OtLqtqXSNvfklfpWu4BS6f2wC95v80gJCesJXwxW5pKOVDXPHp21uaSe4m6ebMoAOTM2artGlnaDApw3jyqLkbhkUtpImp6Sxsj08HvcUfF6Er_0hov3L3cEupAVHFOvi3XPmrwjP1P1ZvbOPUbj1JalWceVbOHe7uao4S6UgfjW53VYmeJDS_7rrQC1428peju1TGLIfLb1_KATauu7xMDhIJ-oU9tAiq1t-vn6Kl9NoagnDJDXSJGL7mev5E2prwd5uv3tuyfwYpSB8iIu_69vYMMQcqZEoWcUFxeS1kDnzJ2kD3KrlSbun-WePWRd8_ug2Np7ko1n2LX9N8I8Ixfwo9dsrf-z-W8qyaeJZo-yn3vPEEhoPLNv_xKp-RhfpPiZ7ITp4j2xLWLE_OZhyoDaRlFAAfO2tRdRGc1ZhxLGO9HJ7G73TPD6TMSXtV4TypWOfDIIdgPKJ20GWXgvktlkcH0jiAwN1k8SxbZ4zg9Yp9sQ_tph2Na6BkCmu20yxdoP2_yF8ccGW-RH8IUPsYLiLtbXcN53b0oOTbGvo9RzkhbRgc2_5_ytu37mevF084ejAaAe97Z-CmJmEO4BE13Pj8M_kK-cT4AWxkUOrfadaLZjg0SoHvAO7dKF5ibj8vl5GyYOsPGiYmEcKeuo33c8_1yCpfYZbLrbLQBtgEzlUaRkHk2l3o5_FhbCSs8Jp7SpmhrzyjX7N6u8Nv-6mvaJ6O-4ZuZGzXJSsdu3r3nZC0znNv0Q49f9oMe_4F-JhfdySkdggorhRKh0K1MTtXYw0Urqc3U2DQi8nrp8aWJ3_LMo8dJ6KPGPKggol6_8ktIp5NIaDfte9Gp6cyv-rskm5dT2RYkik5knl2GnyQP960T0yR7HwmZ2EBVFQpVyWY8o1xw19M6mB2Oj-27JG8Djbh8_PhUXmn4eF3L8OUpXcezc-5-14dwElHTeT-ORUbpFnFR9UOFaa_8KXhMkpF97me4c8pgaLtbgqRp6bMd-LO6yns3fMD8IfSopiT3I6dQPLx7CU23Ep2GOgxf8BVH_RPNSCV2_mOTx-Pev-y3Z_OL647zp3_7f6Y8S5Mf0zBTsT_5uGNMsn7_nP3zJx-nxl3_gY_TTk1_5-Mctvdc6X__4zyZHn_n447Bhv673xdu5FHS3r__cShUyyBc_92PMy-5_0Mf9_gHvu80_vsf-LipifCffNwxJnWPvYyxP0wI1B3Xv2-DdrA3gV7TBrvPjuY_aYV75b2PdweeU6gZZYGN-5gifv6f-BrbdV3PJg5_MkEqxcdZMo8ZhbnMr6lS98GSz-Rn0sLj2d8_xvRkTIr4IMpyxL3__iNzJ1PN5taegN_haPh9Sjomo2aj8-3XDPPn769n8PFsWjruxd-mJE2-1j_cr2NCazHhd5fzdVW4t-df_tNf_uX8_tP3n__r539__m-fv_znv_zL87_9H__1n__ln_6X__W__M-32235p-tXuuru_-n6MB_886__fP7lPz_-z_8L-8uUzA:1vTsPs:q3pufgH2fqbSnN7UiVNP7_vor6A1rZXhNCMeCeHZhyk', '2025-12-26 01:57:56.802171');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('g1xuarc2lsiuefuthhp1re9ythwcnhfk', '.eJwNz01PgzAAgOH_0rMHoFCHt5ZSFhhIYRuzF6MURmF8bBIQFv-73N88yfsEY98UHXgDLsY-TTgc2yonsSeckL7HAl-jlAiS1EfTiGILHeZYkCOWJz_n5cL98F7Lr99MZR4nsXR2D7o-BjNl68SWXdcZs79vsvH7FaqW5r0g0xi0vbpNAi-Sp9rKZJf2bFBJe47mFVdzPcoP5qJGkYsc7FVggeFZ4Lb2Erfjl_IWpYFZsHvJ0E84WBsp9_BkeluCnQAerOYqqKDgBQxV3xWfSm5vyLJ1ZGiGhnRbhyb4-wcOSVCj:1ujDFf:hZ0DZL0aiiL3sSX4RmOzWf1MTfO2PxN2dp5Psym-KY4', '2025-08-19 08:42:31.391852'),
('lhd5wzwcy153z9rt955a9hcja6yghgtj', '.eJwN0E1ygjAYANC7sO6CgCB0lx9FwVIBEfg2HUEQBA2NtBPi9O71BG_mPbWJ9_Vde9dWGPssjszp1lZkj5vKHgfTYjv1nYpT6XNPxD1Xj8Fr2aJIrCqLgdzkGWiNts1v35rliYt2zIagOjLJgcxhfpTWpmgGAQQoEkWJIuLsOdBgy1m7psXjekvqgYRERlOEAkmRkvXmMi6uH-bU6BnfsCznPtDOEC7QEPA6TY8-s51CdF663quZrFRQxp9eOAElu2X3ciPA_YEBroSa89hgrrVMDyngBIihculE4-XnUI0PneYYGDDtTRtbfq-_uvPrwbZcZBu6odvIReZC-_sHOzFfhA:1ujA2D:qXKvzPxLQl21oeeBfGk8WfyzHEGbWLRLcyjWsYpsXKk', '2025-08-19 05:16:25.186192'),
('oxlrj9kxlv09c5y0vdsejk4i6huq9wvd', '.eJwNz01PgzAAgOH_0rMHoFCHt5ZSFhhIYRuzF6MURmF8bBIQFv-73N88yfsEY98UHXgDLsY-TTgc2yonsSeckL7HAl-jlAiS1EfTiGILHeZYkCOWJz_n5cL98F7Lr99MZR4nsXR2D7o-BjNl68SWXdcZs79vsvH7FaqW5r0g0xi0vbpNAi-Sp9rKZJf2bFBJe47mFVdzPcoP5qJGkYsc7FVggeFZ4Lb2Erfjl_IWpYFZsHvJ0E84WBsp9_BkeluCnQAerOYqqKDgBQxV3xWfSm5vyLJ1ZGiGhnRbhyb4-wcOSVCj:1ujdiF:WH_9TW9II-PAhKnA4V9eWD_ovcpGrQ463gfiHYP7jZg', '2025-08-20 12:57:47.387263'),
('qq6hs0krzvwujbmpc1bwn9yexusi6e1v', '.eJwNz01PgzAAgOH_0rMHoFCHt5ZSFhhIYRuzF6MURmF8bBIQFv-73N88yfsEY98UHXgDLsY-TTgc2yonsSeckL7HAl-jlAiS1EfTiGILHeZYkCOWJz_n5cL98F7Lr99MZR4nsXR2D7o-BjNl68SWXdcZs79vsvH7FaqW5r0g0xi0vbpNAi-Sp9rKZJf2bFBJe47mFVdzPcoP5qJGkYsc7FVggeFZ4Lb2Erfjl_IWpYFZsHvJ0E84WBsp9_BkeluCnQAerOYqqKDgBQxV3xWfSm5vyLJ1ZGiGhnRbhyb4-wcOSVCj:1ujD5O:sSz7QlvwaoxfR5NdXXJqHRSiDwOwPLH3tR8sMJVQ_1U', '2025-08-19 08:31:54.356449');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `employee_code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `bank_account` varchar(30) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `joining_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `employee_code`, `name`, `designation`, `bank_account`, `location`, `joining_date`) VALUES
(1, 'EMSC0003', 'Abinav A D', 'System Developer', '048612010000028', 'Coimbatore, India', '2025-07-01'),
(2, 'EMSC0004', 'Tawheed Yahya', 'Software Developer', '048612010000039', 'Coimbatore, India', '2025-07-14');

-- --------------------------------------------------------

--
-- Table structure for table `ticketapp_clientfeatureprogress`
--

CREATE TABLE `ticketapp_clientfeatureprogress` (
  `id` bigint(20) NOT NULL,
  `feature` varchar(50) NOT NULL,
  `completed` tinyint(1) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `complaint_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticketapp_clientfeatureprogress`
--

INSERT INTO `ticketapp_clientfeatureprogress` (`id`, `feature`, `completed`, `client_id`, `complaint_text`) VALUES
(1, 'Onboarding Brief', 1, 11, NULL),
(2, 'Overview Brief', 0, 11, NULL),
(3, 'FAQ Improvisation', 0, 11, NULL),
(4, 'Calendar Integration', 0, 11, NULL),
(5, 'E-commerce', 0, 11, NULL),
(6, 'Invoicing', 0, 11, NULL),
(7, 'Tagging', 0, 11, NULL),
(8, 'Follow Up', 0, 11, NULL),
(9, 'Image Analyzer', 0, 11, NULL),
(10, 'Ads', 0, 11, NULL),
(11, 'Remarks', 0, 11, NULL),
(12, 'Complaints', 0, 11, ''),
(41, 'E-commerce', 0, 22, NULL),
(42, 'Invoicing', 0, 22, NULL),
(43, 'Tagging', 0, 22, NULL),
(44, 'Follow Up', 0, 22, NULL),
(45, 'Image Analyzer', 0, 22, NULL),
(46, 'Ads', 0, 22, NULL),
(47, 'Remarks', 0, 22, NULL),
(48, 'Complaints', 0, 22, NULL),
(49, 'Onboarding Brief', 0, 20, NULL),
(50, 'Overview Brief', 0, 20, NULL),
(51, 'FAQ Improvisation', 0, 20, NULL),
(52, 'Calendar Integration', 0, 20, NULL),
(53, 'E-commerce', 0, 20, NULL),
(54, 'Invoicing', 0, 20, NULL),
(55, 'Tagging', 0, 20, NULL),
(56, 'Follow Up', 0, 20, NULL),
(57, 'Image Analyzer', 0, 20, NULL),
(58, 'Ads', 0, 20, NULL),
(59, 'Remarks', 0, 20, NULL),
(60, 'Complaints', 1, 20, NULL),
(61, 'Onboarding Brief', 1, 25, NULL),
(62, 'Overview Brief', 1, 25, NULL),
(63, 'FAQ Improvisation', 1, 25, NULL),
(64, 'Calendar Integration', 0, 25, NULL),
(65, 'E-commerce', 1, 25, NULL),
(66, 'Invoicing', 1, 25, NULL),
(67, 'Tagging', 1, 25, NULL),
(68, 'Follow Up', 1, 25, NULL),
(69, 'Image Analyzer', 1, 25, NULL),
(70, 'Ads', 1, 25, NULL),
(71, 'Remarks', 1, 25, NULL),
(72, 'Complaints', 0, 25, ''),
(73, 'Onboarding Brief', 1, 26, NULL),
(74, 'Overview Brief', 0, 26, NULL),
(75, 'FAQ Improvisation', 0, 26, NULL),
(76, 'Calendar Integration', 0, 26, NULL),
(77, 'E-commerce', 0, 26, NULL),
(78, 'Invoicing', 0, 26, NULL),
(79, 'Tagging', 0, 26, NULL),
(80, 'Follow Up', 0, 26, NULL),
(81, 'Image Analyzer', 0, 26, NULL),
(82, 'Ads', 0, 26, NULL),
(83, 'Remarks', 0, 26, NULL),
(84, 'Complaints', 0, 26, ''),
(85, 'Onboarding Brief', 1, 27, NULL),
(86, 'Overview Brief', 0, 27, NULL),
(87, 'FAQ Improvisation', 0, 27, NULL),
(88, 'Calendar Integration', 0, 27, NULL),
(89, 'E-commerce', 0, 27, NULL),
(90, 'Invoicing', 0, 27, NULL),
(91, 'Tagging', 0, 27, NULL),
(92, 'Follow Up', 0, 27, NULL),
(93, 'Image Analyzer', 0, 27, NULL),
(94, 'Ads', 0, 27, NULL),
(95, 'Remarks', 0, 27, NULL),
(96, 'Complaints', 0, 27, '');

-- --------------------------------------------------------

--
-- Table structure for table `ticketapp_clientonboarding`
--

CREATE TABLE `ticketapp_clientonboarding` (
  `id` bigint(20) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `plan` varchar(50) NOT NULL,
  `assigned_to` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `description` longtext DEFAULT NULL,
  `assigned_phone` varchar(20) DEFAULT NULL,
  `onboarding_deadline_days` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `client_phone` varchar(20) DEFAULT NULL,
  `client_business` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticketapp_clientonboarding`
--

INSERT INTO `ticketapp_clientonboarding` (`id`, `client_name`, `plan`, `assigned_to`, `created_at`, `description`, `assigned_phone`, `onboarding_deadline_days`, `status`, `client_phone`, `client_business`) VALUES
(11, 'Aravind ak', 'basic', 'aravind', '2025-10-09 04:19:44.416817', 'dfsgsdf', '(\'919600321566\',)', 7, 'pending', '919600321566', NULL),
(12, 'Aravind ak', 'pro', 'aravind', '2025-10-09 04:20:25.310987', 'sery', '(\'919600321566\',)', 7, 'pending', '919600321566', NULL),
(20, 'Aravind kumar ', 'pro', 'aravind', '2025-10-29 09:46:03.259493', '', '(\'919600321566\',)', 7, 'pending', '919600321599', NULL),
(21, 'Aravind kumar M', 'pro', 'aravind', '2025-10-30 04:39:38.433662', '', '(\'919600321566\',)', 7, 'pending', '919600321599', NULL),
(22, 'Aravind kumar akm', 'pro', 'aravind', '2025-10-30 06:46:29.586847', '', '(\'919600321566\',)', 7, 'pending', '919600321599', NULL),
(25, 'Aravind kumar akm', 'pro', 'aravind', '2025-11-03 08:59:28.104294', '', '(\'919600321566\',)', 7, 'completed', '919600321599', 'property management'),
(26, 'Abinav', 'basic', 'abinav', '2025-11-24 06:07:47.259002', '', '(\'918248111060\',)', 4, 'pending', '919042218418', 'AI Automations'),
(27, 'Abinav', 'pro', 'suva', '2025-12-04 15:00:06.131339', '', '(\'60125805024\',)', 1, 'pending', '918248111060', 'AI Automations');

-- --------------------------------------------------------

--
-- Table structure for table `ticketapp_employee`
--

CREATE TABLE `ticketapp_employee` (
  `id` bigint(20) NOT NULL,
  `employee_code` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `bank_account` varchar(100) NOT NULL,
  `location` varchar(200) NOT NULL,
  `joining_date` date DEFAULT NULL,
  `salary` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticketapp_employee`
--

INSERT INTO `ticketapp_employee` (`id`, `employee_code`, `name`, `email`, `designation`, `bank_account`, `location`, `joining_date`, `salary`) VALUES
(1, 'EMSC0003', 'Abinav A D', 'adabinav@gmail.com', 'System Developer', '048612010000028', 'Coimbatore, India', '2025-07-01', 18000.00);

-- --------------------------------------------------------

--
-- Table structure for table `ticketapp_monthlytarget`
--

CREATE TABLE `ticketapp_monthlytarget` (
  `id` bigint(20) NOT NULL,
  `target_amount` decimal(12,2) NOT NULL,
  `month` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticketapp_monthlytarget`
--

INSERT INTO `ticketapp_monthlytarget` (`id`, `target_amount`, `month`) VALUES
(1, 150000.00, '2025-11-01'),
(2, 100000.00, '2025-12-01');

-- --------------------------------------------------------

--
-- Table structure for table `ticketapp_paymentpendingclient`
--

CREATE TABLE `ticketapp_paymentpendingclient` (
  `id` bigint(20) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `assigned_phone` varchar(20) NOT NULL,
  `payment_amount` decimal(10,2) NOT NULL,
  `due_date` date NOT NULL,
  `assigned_to` varchar(150) NOT NULL,
  `status` varchar(10) NOT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `end_month` date DEFAULT NULL,
  `end_year` int(11) DEFAULT NULL,
  `months` int(11) DEFAULT NULL,
  `start_month` date DEFAULT NULL,
  `start_year` int(11) DEFAULT NULL,
  `years` int(11) DEFAULT NULL,
  `alert_sent` tinyint(1) NOT NULL,
  `client_phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticketapp_paymentpendingclient`
--

INSERT INTO `ticketapp_paymentpendingclient` (`id`, `client_name`, `assigned_phone`, `payment_amount`, `due_date`, `assigned_to`, `status`, `duration`, `end_month`, `end_year`, `months`, `start_month`, `start_year`, `years`, `alert_sent`, `client_phone`) VALUES
(5, 'Aravind kumar', '919600321566', 100000.00, '2025-10-11', 'hari', 'completed', 'monthly', '2025-12-01', NULL, 2, '2025-10-01', NULL, NULL, 0, NULL),
(6, 'Aravind kumar ', '919600321566', 100000.00, '2025-10-11', 'hari', 'pending', 'yearly', NULL, 2027, NULL, NULL, 2025, 2, 0, NULL),
(7, 'Aravind kumar ', '919600321566', 100000.00, '2025-10-11', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(8, 'Aravind kumar ', '919600321566', 100000.00, '2025-10-31', 'hari', 'pending', 'monthly', '2025-11-01', NULL, 3, '2025-10-01', NULL, NULL, 0, '919600321566'),
(9, 'Aravind kumar ', '919600321566', 100000.00, '2025-10-11', 'hari', 'pending', 'monthly', '2025-11-01', NULL, 2, '2025-10-01', NULL, NULL, 0, '919600321566'),
(10, 'Aravind kumar ', '919600321566', 100000.00, '2025-10-14', 'hari', 'pending', 'monthly', '2025-11-01', NULL, 1, '2025-10-01', NULL, NULL, 0, '919600321566'),
(11, 'Aravind kumar ', '919600321566', 100000.00, '2025-10-13', 'hari', 'pending', 'monthly', '2025-11-01', NULL, 1, '2025-10-01', NULL, NULL, 0, '919600321566'),
(12, 'Aravind kumar ', '919600321566', 100000.00, '2025-10-13', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321566'),
(13, 'Aravind kumar ', '919600321566', 200000.00, '2025-10-13', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321567'),
(14, 'Aravind kumar ', '919600321589', 100000.00, '2025-10-13', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321534'),
(15, 'Aravind kumar ', '919600321589', 100000.00, '2025-10-13', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321566'),
(16, 'Aravind kumar ', '919600321589', 100000.00, '2025-10-13', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321566'),
(17, 'Aravind kumar ', '919600321589', 100000.00, '2025-10-13', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321566'),
(18, 'Aravind kumar ', '919600321589', 100000.00, '2025-10-13', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321566'),
(19, 'Aravind kumar ', '919600321589', 100000.00, '2025-10-13', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321566'),
(20, 'Aravind kumar ', '919600321589', 100000.00, '2025-10-13', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321566'),
(21, 'Aravind kumar ', '919600321589', 100000.00, '2025-10-13', 'hari', 'completed', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321566'),
(22, 'Aravind kumar ', '919600321589', 100000.00, '2025-10-13', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321599'),
(23, 'Aravind kumar ', '919600321589', 100000.00, '2025-10-13', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321599'),
(24, 'Aravind kumar ', '919600321589', 100000.00, '2025-10-13', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321599'),
(25, 'Aravind kumar ', '919600321589', 100000.00, '2025-10-13', 'hari', 'completed', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321599'),
(26, 'Aravind kumar ', '919600321589', 100000.00, '2025-10-13', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321599'),
(27, 'Aravind kumar ', '919600321589', 100000.00, '2025-10-13', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321432'),
(28, 'Aravind kumar ', '919600321589', 100000.00, '2025-10-13', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321432'),
(29, 'Aravind kumar ', '919600321589', 100000.00, '2025-10-13', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321432'),
(30, 'Aravind kumar ', '919600321589', 100000.00, '2025-10-13', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321432'),
(31, 'Aravind kumar ', '919600321589', 15000.00, '2025-10-12', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321431'),
(32, 'Aravind kumar ', '919600321589', 15000.00, '2025-10-12', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321566'),
(33, 'Aravind kumar ', '919600321589', 15000.00, '2025-10-12', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321566'),
(34, 'Aravind kumar ', '919600321589', 15000.00, '2025-10-12', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321566'),
(35, 'Aravind kumar ', '919600321589', 15000.00, '2025-10-12', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321566'),
(36, 'Aravind kumar ', '919600321589', 15000.00, '2025-10-12', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321566'),
(37, 'Aravind kumar ', '919600321589', 15000.00, '2025-10-12', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321566'),
(38, 'Aravind kumar ', '919600321589', 15000.00, '2025-10-12', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321566'),
(39, 'Aravind kumar ', '919600321589', 15000.00, '2025-10-12', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321566'),
(40, 'Aravind kumar ', '919600321589', 15000.00, '2025-10-12', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321566'),
(41, 'Aravind kumar ', '919600321589', 15000.00, '2025-10-12', 'hari', 'completed', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321566'),
(42, 'Aravind kumar ', '919600321589', 15000.00, '2025-10-12', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321566'),
(43, 'Aravind kumar ', '919600321589', 15000.00, '2025-10-12', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321566'),
(44, 'Aravind kumar ', '919600321589', 15000.00, '2025-10-12', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321566'),
(45, 'Aravind kumar ', '919600321589', 15000.00, '2025-10-12', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321566'),
(46, 'Aravind kumar ', '919600321589', 15000.00, '2025-10-12', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321566'),
(47, 'Aravind kumar ', '919600321589', 15000.00, '2025-10-12', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321566'),
(48, 'Aravind kumar ', '919600321589', 15000.00, '2025-10-12', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 0, '919600321566'),
(49, 'Aravind kumar ', '919600321589', 15000.00, '2025-10-12', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321566'),
(50, 'suva', '919600321566', 10000.00, '2025-10-14', 'hari', 'pending', 'monthly', '2025-11-01', NULL, 2, '2025-10-01', NULL, NULL, 1, '919791717643'),
(51, 'nithi', '919600321566', 10000.00, '2025-10-14', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '+60125805024'),
(52, 'nithi', '919600321566', 10000.00, '2025-10-14', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '60125805024'),
(53, 'Aravind ak', '919600321589', 10000.00, '2025-10-14', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321566'),
(54, 'Aravind ak', '919600321589', 10000.00, '2025-10-14', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '919600321566'),
(55, 'Nithi ', '60123523880', 700.00, '2025-10-16', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '60123523880'),
(56, 'Dhivya Jaipur Mahal', '918807874355', 700.00, '2025-10-16', 'hari', 'completed', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '60126151167'),
(57, 'Ayu', '918807874355', 1111.00, '2025-10-16', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '60122902171'),
(58, 'Aravind kumar M', '919600321566', 1000.00, '2025-10-14', 'hari', 'pending', 'monthly', '2025-11-01', NULL, 2, '2025-10-01', NULL, NULL, 1, '919600321566'),
(59, 'Nur Ain ', '918807874355', 1111.00, '2025-10-16', 'hari', 'pending', 'lifetime', NULL, NULL, NULL, NULL, NULL, NULL, 1, '601127634371');

-- --------------------------------------------------------

--
-- Table structure for table `ticketapp_payslip`
--

CREATE TABLE `ticketapp_payslip` (
  `id` bigint(20) NOT NULL,
  `pay_days` int(11) NOT NULL,
  `attendance_arrear` int(11) NOT NULL,
  `increment_arrear` int(11) NOT NULL,
  `leaving_date` date DEFAULT NULL,
  `pdf_file` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `sent_at` datetime(6) DEFAULT NULL,
  `employee_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticketapp_payslip`
--

INSERT INTO `ticketapp_payslip` (`id`, `pay_days`, `attendance_arrear`, `increment_arrear`, `leaving_date`, `pdf_file`, `created_at`, `sent_at`, `employee_id`) VALUES
(1, 31, 0, 0, NULL, '', '2025-11-26 04:58:47.947066', '2025-11-26 04:59:05.131488', 1),
(2, 31, 0, 0, NULL, '', '2025-11-26 07:56:02.053624', '2025-11-26 07:56:17.694795', 1),
(3, 31, 0, 0, NULL, '', '2025-11-26 08:13:23.509649', '2025-11-26 08:13:34.998735', 1),
(4, 31, 0, 0, NULL, '', '2025-11-26 08:26:21.508140', '2025-11-26 08:26:31.800035', 1),
(5, 31, 0, 0, NULL, '', '2025-11-26 12:53:29.697753', '2025-11-26 12:54:02.993003', 1),
(6, 31, 0, 0, NULL, '', '2025-11-27 05:52:50.273573', '2025-11-27 05:53:02.290987', 1),
(7, 31, 0, 0, NULL, '', '2025-11-27 10:14:06.618927', '2025-11-27 10:14:22.049387', 1),
(8, 31, 0, 0, NULL, '', '2025-11-28 04:43:23.054555', '2025-11-28 04:43:35.446806', 1),
(9, 31, 0, 0, NULL, '', '2025-12-12 01:57:56.738241', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ticketapp_salesentry`
--

CREATE TABLE `ticketapp_salesentry` (
  `id` bigint(20) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `entry_date` date NOT NULL,
  `notes` varchar(400) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticketapp_salesentry`
--

INSERT INTO `ticketapp_salesentry` (`id`, `amount`, `entry_date`, `notes`, `created_at`) VALUES
(1, 1200.00, '2025-11-28', '', '2025-11-28 05:09:00.064889'),
(2, 100000.00, '2025-11-28', '', '2025-11-28 05:09:22.995858'),
(3, 6000.00, '2025-11-28', 'onboarding', '2025-11-28 07:13:23.935624'),
(4, 500.00, '2025-12-01', 'TSR ', '2025-12-01 06:14:24.944784'),
(5, 7000.00, '2025-12-01', '', '2025-12-01 08:08:09.884823'),
(6, 12000.00, '2025-12-12', '', '2025-12-12 01:58:51.667079');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_list`
--

CREATE TABLE `ticket_list` (
  `id` int(11) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `requester_name` varchar(100) NOT NULL,
  `requester_email` varchar(254) NOT NULL,
  `requester_phone` varchar(20) DEFAULT NULL,
  `priority` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `status` text NOT NULL,
  `is_escalated` tinyint(1) NOT NULL,
  `sla_due_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `assigned_to` varchar(50) DEFAULT NULL,
  `assigned_phone` varchar(20) DEFAULT NULL,
  `client_phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_list`
--

INSERT INTO `ticket_list` (`id`, `subject`, `requester_name`, `requester_email`, `requester_phone`, `priority`, `created_at`, `status`, `is_escalated`, `sla_due_at`, `updated_at`, `assigned_to`, `assigned_phone`, `client_phone`) VALUES
(1, 'Onboarding Failure', 'Abinav', 'adabinav@gmail.com', '+918248111060', 'High', '2025-09-03 13:51:06', 'Completed', 0, '2025-09-03 17:51:06.000000', '2025-11-20 04:46:21.408790', NULL, NULL, NULL),
(2, 'Onboarding Failure', 'Qwerty', 'nithi@soulcreationz.com', '+9182467765467', 'High', '2025-09-03 13:51:51', 'Completed', 0, '2025-09-03 17:51:51.000000', '2025-11-20 04:46:18.497501', NULL, NULL, NULL),
(3, 'Onboarding Failure', 'Qwertyyy', 'adabinav123@gmail.com', '+91824677527', 'Medium', '2025-09-03 13:53:35', 'Completed', 0, '2025-09-04 13:53:35.000000', '2025-11-20 04:46:15.929022', NULL, NULL, NULL),
(4, 'Flow not working', 'Tawheed Yahya', 'tawheedyahya0@gmail.com', '9994780436', 'Medium', '2025-09-04 03:56:36', 'Completed', 0, '2025-09-05 03:56:36.000000', '2025-11-20 04:46:11.731479', NULL, NULL, NULL),
(6, 'Custom field', 'Suva', 'suvalakshmi@gmail.com', '9946123456', 'Medium', '2025-09-08 02:39:55', 'Completed', 0, '2025-09-09 02:39:55.000000', '2025-11-20 04:46:09.024154', NULL, NULL, NULL),
(19, 'the chatbot memory should be cleared when chat is closed', 'Ulink', 'digital@soulcreationz.com', '+91 88078 74355', 'Medium', '2025-09-12 08:31:47', 'Completed', 0, '2025-09-13 08:31:47.756957', '2025-09-12 08:32:35.656913', NULL, NULL, NULL),
(22, 'Development plan', 'Suva', 'suva@gmail.com', '919791717643', 'High', '2025-09-15 03:41:10', 'Completed', 0, '2025-09-15 07:41:10.535889', '2025-09-15 03:41:15.265405', NULL, NULL, NULL),
(23, 'Follow Up Flow for Ulink ', 'Galvin', 'nithi@soulcreationz.com', '+60123523880', 'High', '2025-09-15 04:20:32', 'Completed', 0, '2025-09-15 08:20:32.789599', '2025-09-15 04:20:38.352829', NULL, NULL, NULL),
(24, 'test', 'suvaaa', 'suva@gmail.com', '919791717643', 'High', '2025-09-15 04:23:28', 'Completed', 0, '2025-09-15 08:23:28.338998', '2025-09-16 07:04:24.710241', NULL, NULL, NULL),
(25, 'sales', 'Nithi', 'suva@gmail.com', '+60125805024', 'High', '2025-09-15 04:25:35', 'Completed', 0, '2025-09-15 08:25:35.650860', '2025-09-15 04:25:39.637216', NULL, NULL, NULL),
(26, 'test', 'Nithila', 'suva@gmail.com', '60125805024', 'High', '2025-09-15 04:31:25', 'Completed', 0, '2025-09-15 08:31:25.765591', '2025-09-15 04:31:29.985223', NULL, NULL, NULL),
(27, 'flow not working ', 'nithi ', 'nithi@soulcreationz.com', '+60125805024', 'High', '2025-09-15 05:03:13', 'Completed', 0, '2025-09-15 09:03:13.521956', '2025-09-15 05:11:16.305696', NULL, NULL, NULL),
(28, 'flow not working ', 'nithi ', 'nithi@soulcreationz.com', '60125805024', 'High', '2025-09-15 05:16:41', 'Completed', 0, '2025-09-15 09:16:41.532491', '2025-11-20 04:46:34.127406', NULL, NULL, NULL),
(30, 'flow not working 3', 'suva', 'aravindkumarpro012@gmai.com', '919600321566', 'High', '2025-09-16 06:43:12', 'Completed', 0, '2025-09-16 10:43:12.067359', '2025-09-19 02:51:58.184833', 'aravind', NULL, NULL),
(31, 'Ulink follow up', 'Hariprasath', 'digital@soulcreationz.com', '8807874355', 'High', '2025-09-18 05:48:44', 'Completed', 0, '2025-09-18 09:48:44.404822', '2025-11-20 04:46:30.674743', 'abinav', NULL, NULL),
(42, 'flow not working', 'suva ', 'aravindkumarpro012@gmai.com', '919600321566', 'Medium', '2025-10-09 03:30:02', 'Completed', 0, '2025-10-10 03:30:02.272028', '2025-10-09 03:30:26.678499', 'aravind', '919600321566', NULL),
(43, 'OpenAI Key failure', 'Abinav', 'adabinav@gmail.com', '9042218418', 'High', '2025-11-20 04:34:33', 'Completed', 0, '2025-11-20 08:34:33.206124', '2025-11-20 04:46:27.179929', 'abinav', '8248111060', NULL),
(44, 'OpenAI Key failure', 'Abinav', 'adabinav@gmail.com', '9042218418', 'High', '2025-11-20 04:34:37', 'Completed', 0, '2025-11-20 08:34:37.930889', '2025-11-20 04:35:15.927001', 'abinav', '8248111060', NULL),
(45, 'Your Payslip', 'Abinav', 'adabinav@gmail.com', '919042218418', 'High', '2025-11-20 04:38:40', 'Completed', 0, '2025-11-20 08:38:40.646526', '2025-11-20 04:42:37.619910', 'abinav', '918248111060', NULL),
(46, 'Website issue', 'Abinav', 'adabinav@gmail.com', '918248111060', 'High', '2025-11-20 04:41:22', 'Completed', 0, '2025-11-20 08:41:22.520943', '2025-11-20 04:55:36.905170', 'nithi', '60125805024', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone_no`, `created_at`) VALUES
(1, 'user', '919994780436', '2025-08-07 05:25:27'),
(2, 'user', '918608141593', '2025-08-07 05:39:49');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_apscheduler_djangojob`
--
ALTER TABLE `django_apscheduler_djangojob`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_apscheduler_djangojob_next_run_time_2f022619` (`next_run_time`);

--
-- Indexes for table `django_apscheduler_djangojobexecution`
--
ALTER TABLE `django_apscheduler_djangojobexecution`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_job_executions` (`job_id`,`run_time`),
  ADD KEY `django_apscheduler_djangojobexecution_run_time_16edd96b` (`run_time`);

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
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_code` (`employee_code`);

--
-- Indexes for table `ticketapp_clientfeatureprogress`
--
ALTER TABLE `ticketapp_clientfeatureprogress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticketapp_clientfeatureprogress_client_id_feature_937c707a_uniq` (`client_id`,`feature`);

--
-- Indexes for table `ticketapp_clientonboarding`
--
ALTER TABLE `ticketapp_clientonboarding`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticketapp_employee`
--
ALTER TABLE `ticketapp_employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_code` (`employee_code`);

--
-- Indexes for table `ticketapp_monthlytarget`
--
ALTER TABLE `ticketapp_monthlytarget`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `month` (`month`);

--
-- Indexes for table `ticketapp_paymentpendingclient`
--
ALTER TABLE `ticketapp_paymentpendingclient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticketapp_payslip`
--
ALTER TABLE `ticketapp_payslip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticketapp_payslip_employee_id_ed1553d8_fk_ticketapp_employee_id` (`employee_id`);

--
-- Indexes for table `ticketapp_salesentry`
--
ALTER TABLE `ticketapp_salesentry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_list`
--
ALTER TABLE `ticket_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_apscheduler_djangojobexecution`
--
ALTER TABLE `django_apscheduler_djangojobexecution`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ticketapp_clientfeatureprogress`
--
ALTER TABLE `ticketapp_clientfeatureprogress`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `ticketapp_clientonboarding`
--
ALTER TABLE `ticketapp_clientonboarding`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `ticketapp_employee`
--
ALTER TABLE `ticketapp_employee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticketapp_monthlytarget`
--
ALTER TABLE `ticketapp_monthlytarget`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ticketapp_paymentpendingclient`
--
ALTER TABLE `ticketapp_paymentpendingclient`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `ticketapp_payslip`
--
ALTER TABLE `ticketapp_payslip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ticketapp_salesentry`
--
ALTER TABLE `ticketapp_salesentry`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ticket_list`
--
ALTER TABLE `ticket_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

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
-- Constraints for table `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_apscheduler_djangojobexecution`
--
ALTER TABLE `django_apscheduler_djangojobexecution`
  ADD CONSTRAINT `django_apscheduler_djangojobexecution_job_id_daf5090a_fk` FOREIGN KEY (`job_id`) REFERENCES `django_apscheduler_djangojob` (`id`);

--
-- Constraints for table `ticketapp_clientfeatureprogress`
--
ALTER TABLE `ticketapp_clientfeatureprogress`
  ADD CONSTRAINT `ticketapp_clientfeat_client_id_f753d300_fk_ticketapp` FOREIGN KEY (`client_id`) REFERENCES `ticketapp_clientonboarding` (`id`);

--
-- Constraints for table `ticketapp_payslip`
--
ALTER TABLE `ticketapp_payslip`
  ADD CONSTRAINT `ticketapp_payslip_employee_id_ed1553d8_fk_ticketapp_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `ticketapp_employee` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
