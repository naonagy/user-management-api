-- MySQL dump 10.13  Distrib 8.4.3, for Win64 (x86_64)
--
-- Host: localhost    Database: crud_app
-- ------------------------------------------------------
-- Server version	8.4.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_03_11_185309_create_personal_access_tokens_table',2),(5,'2025_03_12_205411_add_role_to_users_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',2,'John','dce73f0ca157fe9d73a4ce0043bde5a2cae4f8bbd36b1414a23fdd785ae59b08','[\"*\"]',NULL,NULL,'2025-03-11 18:57:23','2025-03-11 18:57:23'),(2,'App\\Models\\User',2,'John','783c5ccca4ecd19fcb628956868727fda29c5f67a5b9cb1f87d49066afd77569','[\"*\"]',NULL,NULL,'2025-03-11 19:07:17','2025-03-11 19:07:17'),(3,'App\\Models\\User',2,'John','d087ff72217f59611c68a982cf6f1380ae38e495686b6eb2c5be9926db83eb70','[\"*\"]',NULL,NULL,'2025-03-11 19:07:54','2025-03-11 19:07:54'),(95,'App\\Models\\User',9,'Johnny','23d59b71eaeadaa73d28c965ce4f4292e59c01d6da3de0e8dd80e8c049088bfc','[\"*\"]','2025-03-13 17:24:49',NULL,'2025-03-13 17:23:54','2025-03-13 17:24:49'),(138,'App\\Models\\User',10,'Maria','578f5cd409fd0b5922a45a66ac59e2368efe150ae06b4839cb4d4b33a9ef692d','[\"*\"]',NULL,NULL,'2025-03-13 18:29:32','2025-03-13 18:29:32'),(139,'App\\Models\\User',10,'Maria','8d8a8d5f5b685edeefa9822855ecf2d21b806a0732d6d52ebb06f0ad57a762cd','[\"*\"]',NULL,NULL,'2025-03-13 18:31:54','2025-03-13 18:31:54'),(140,'App\\Models\\User',10,'Maria','6f443fd2ec637d91e156e0a63797c469edae28d7248b0bd306eb13937cb10df3','[\"*\"]',NULL,NULL,'2025-03-13 18:38:29','2025-03-13 18:38:29'),(141,'App\\Models\\User',10,'Maria','a92952629d225c7c0f3f493cdd4fa3c31fe6d2a4ef08f91d9671df00307a1941','[\"*\"]','2025-03-13 19:47:00',NULL,'2025-03-13 18:43:08','2025-03-13 19:47:00'),(142,'App\\Models\\User',10,'Maria','85cba5bb1978a26f3b6145634c33a9ae1f76b8ace88050784fe0aa6226c8a00e','[\"*\"]',NULL,NULL,'2025-03-13 18:52:21','2025-03-13 18:52:21'),(143,'App\\Models\\User',11,'Daria','3554bd32916801bd3d39e03cc4b671a21148ecec5b74e957fac18cd3f530b0c3','[\"*\"]','2025-03-13 19:47:06',NULL,'2025-03-13 18:53:56','2025-03-13 19:47:06'),(147,'App\\Models\\User',13,'Ana','f5e867bb8c755ca2f35e6b84a794bae971849736e8ec73c0fc6d755ca9886efa','[\"*\"]',NULL,NULL,'2025-03-13 19:34:47','2025-03-13 19:34:47'),(148,'App\\Models\\User',14,'Mihai','f93328ff51b6f6eda95698ab00b62fde9c0fde98169fc808dc97a273d8c24364','[\"*\"]',NULL,NULL,'2025-03-13 19:35:45','2025-03-13 19:35:45'),(149,'App\\Models\\User',10,'Maria','a711952017d1b8e8f57c63460c0ff3b1818ff3bc20b8a44655fe78f2700799f2','[\"*\"]',NULL,NULL,'2025-03-13 19:41:22','2025-03-13 19:41:22'),(150,'App\\Models\\User',16,'Mihaela','b7d4124401d37be9b5cde48d9d341af315f9f31038d895f9d4490750d0d09427','[\"*\"]',NULL,NULL,'2025-03-13 19:42:22','2025-03-13 19:42:22'),(151,'App\\Models\\User',17,'Mircea','1323e11be736ca05447b3eb1fa30c82dc577682a4309e561fe770191da12b026','[\"*\"]',NULL,NULL,'2025-03-13 19:42:42','2025-03-13 19:42:42'),(152,'App\\Models\\User',10,'Maria','206f0e3bb2bcfd142d44cbc3a5f8a05f9b0525c1884aa17a1d5fca38212004b7','[\"*\"]',NULL,NULL,'2025-03-13 19:45:27','2025-03-13 19:45:27'),(153,'App\\Models\\User',10,'Maria','825cce72f92b125d12d73c6ababe96cfecf6dce14a87c942eb9c33f52320ef0d','[\"*\"]',NULL,NULL,'2025-03-13 19:47:00','2025-03-13 19:47:00'),(154,'App\\Models\\User',19,'Dana','d22a1c647fde77b76e8504c851b56f11218a92d0740081f9cbc7a0fb953158ec','[\"*\"]',NULL,NULL,'2025-03-13 19:48:38','2025-03-13 19:48:38');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('8yZmw6oWrvOUq26r2oOsOUt1GDicbjwFAz162Wq7',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUFHanpvQWQ2dmpPUnpGdHJBMEpHRFA1TUFtVTRlYVQ1dzBwUlFxbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1741720273),('hF25IRyESTW7uuJ2MrPTABbh88HAgv4eGNdlXmVG',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmNHZHg4NWdYTlphbFdFTmNEVXgyM3I1RUF6NmlYTVhhMzc2Zmw0YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1742063021);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'NN Updated','naomi24@email.com',NULL,'$2y$12$.rty32GdMu2UVWUexQVELOqzECg51T1AEsA2tEY.iXwQ5qcEGWa.G',NULL,'2025-03-11 17:19:43','2025-03-13 19:47:05',0),(2,'Admin','admin@example.com',NULL,'adminpassword',NULL,NULL,NULL,1),(3,'User','user@example.com',NULL,'userpassword',NULL,NULL,NULL,0),(5,'Admin','admin@admin.com','2025-03-12 19:04:18','$2y$12$llW6vEpq5LeBZDyr8h/5/e66HzZ8vuX8eGFi5/9B1.4E60gNGX2T2','ocnO4ENlOd','2025-03-12 19:04:18','2025-03-12 19:04:18',1),(6,'John','jon5@email.com',NULL,'$2y$12$rZk.KvjwIlw3Ps1zbQlQRO1.5qZ1hegNY/WTHeDEVlzmxAnHpSt8W',NULL,'2025-03-13 13:36:32','2025-03-13 13:36:32',1),(8,'Andrei','andrei@email.com',NULL,'$2y$12$hf/Zcu3RpgI318R.fptZQOz1T/CTjDjmM7fumvkld67Dde5y4Qc1.',NULL,'2025-03-13 16:58:45','2025-03-13 16:58:45',0),(9,'Johnny','jon55@email.com',NULL,'$2y$12$QpJ0Ninyqf1eOWDniFkXW.PTq7hx5E9HSEmFmRknQqRHI09RCRSF.',NULL,'2025-03-13 17:23:54','2025-03-13 17:23:54',1),(10,'Maria','maria@email.com',NULL,'$2y$12$4F/o7RHyGLseJSMCUxyaxOp8jJuEz4AksmkOt0tmxc9O9lWuVqQtu',NULL,'2025-03-13 18:29:32','2025-03-13 18:29:32',0),(11,'Daria','daria@email.com',NULL,'$2y$12$SRDiOgTsgqxcuJ45l0M1Ce2DsKdRq0tuwP6TgogpCukLlDi5Wt01C',NULL,'2025-03-13 18:53:56','2025-03-13 18:53:56',1),(17,'Mircea','mircea@email.com',NULL,'$2y$12$TcbCObDNeVn/O9Vw0FBB0OOl2tCB6KuwLd0pI3DHiPDuCxxYkQfTy',NULL,'2025-03-13 19:42:42','2025-03-13 19:42:42',0),(18,'Alina','alinae@example.com',NULL,'$2y$12$.XGugv9abag/OPHmenOFoORd4wIe5pO2qL7al.5z36aIPdg4RqazK',NULL,'2025-03-13 19:47:04','2025-03-13 19:47:04',0),(19,'Dana','midea@email.com',NULL,'$2y$12$iUGkiamvNF7dK2gsVyYJJ.8P2Y8Lmv9iwFUi4ho7oNd51h4UZJ.J6',NULL,'2025-03-13 19:48:38','2025-03-13 19:48:38',0),(20,'David','davidd@email.com',NULL,'$2y$12$M.baD8gnNX9wyMoyHvUWOerlYOR44TvtZ1etQJTTMRZK5lKYvVG7K',NULL,'2025-03-13 19:48:51','2025-03-13 19:48:51',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-15 20:36:00
