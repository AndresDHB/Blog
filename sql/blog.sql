-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-07-2024 a las 03:16:37
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blog`
--
CREATE DATABASE IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `blog`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('0715fa6687770655dd7c214ac0df2479', 'i:1;', 1720328362),
('0715fa6687770655dd7c214ac0df2479:timer', 'i:1720328362;', 1720328362),
('89e6ff71ad8f341dbc172afd5f65daef', 'i:1;', 1721077439),
('89e6ff71ad8f341dbc172afd5f65daef:timer', 'i:1721077439;', 1721077439),
('admin@admin.com|::1', 'i:1;', 1720328363),
('admin@admin.com|::1:timer', 'i:1720328363;', 1720328363);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` tinyint(4) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `nombre`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Programacion', '2024-07-05 04:12:13', '2024-07-05 04:12:13', NULL),
(2, 'Diseño web', '2024-07-05 09:58:22', '2024-07-05 09:58:22', NULL),
(3, 'Bases de datos relacional', '2024-07-05 10:00:00', '2024-07-05 10:40:22', NULL),
(4, 'Mysql', '2024-07-05 10:00:56', '2024-07-05 10:00:56', NULL),
(5, 'Base de datos no relacional', '2024-07-07 10:17:11', '2024-07-07 10:17:11', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `commentable_type` varchar(255) NOT NULL,
  `commentable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `imageable_type` varchar(255) NOT NULL,
  `imageable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `links`
--

CREATE TABLE `links` (
  `id` smallint(6) NOT NULL,
  `name` varchar(70) NOT NULL,
  `url` varchar(70) DEFAULT NULL,
  `icon` varchar(100) NOT NULL,
  `active` varchar(100) DEFAULT NULL,
  `tipo` varchar(5) NOT NULL,
  `tipo_nombre` varchar(70) NOT NULL,
  `orden` varchar(3) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `links`
--

INSERT INTO `links` (`id`, `name`, `url`, `icon`, `active`, `tipo`, `tipo_nombre`, `orden`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', '/', 'fa-solid fa-gauge-high', 'request->routeIs(\'admin.index\')', '1', 'sidebar', '1', '1', '2024-06-28 01:49:37', '2024-06-28 01:49:37'),
(2, 'Categorias', 'categories/index', 'fa-brands fa-stack-overflow', 'request->routeIs(\'admin.categories.index\')', '1', 'sidebar', '2', '1', '2024-07-05 03:21:57', '2024-07-05 03:21:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_06_26_233119_add_two_factor_columns_to_users_table', 1),
(5, '2024_06_26_233155_create_personal_access_tokens_table', 1),
(9, '2024_06_28_013646_create_links_table', 2),
(10, '2024_07_01_162835_create_categories_table', 3),
(11, '2024_07_01_163018_create_posts_table', 3),
(12, '2024_07_01_163913_create_tags_table', 3),
(13, '2024_07_01_164049_create_taggables_table', 3),
(14, '2024_07_01_164951_create_comments_table', 3),
(15, '2024_07_01_165229_create_images_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `cuerpo` mediumtext DEFAULT NULL,
  `resumen` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `publicado` char(255) NOT NULL DEFAULT '0',
  `category_id` tinyint(4) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `publicado_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `titulo`, `slug`, `cuerpo`, `resumen`, `image_path`, `publicado`, `category_id`, `user_id`, `publicado_at`, `created_at`, `updated_at`) VALUES
(1, 'laborum', 'deserunt-sunt-eligendi-quibusdam-dolor', 'Voluptatem quisquam odio odio provident. Soluta minima pariatur eaque nihil. Reprehenderit vero est et sed molestias voluptatem. Rem dolorum odio atque a. Minus ut velit consequuntur facilis. Ut nam dolor illo optio.', 'Voluptatem quisquam odio odio provident. Soluta minima pariatur eaque nihil. Reprehenderit vero est et sed molestias voluptatem. Rem dolorum odio atque a. Minus ut velit consequuntur facilis. Ut nam dolor illo optio.', 'posts/imagen_post_id_1.jpg', '1', 3, 1, '2024-07-15 14:21:59', '2024-07-07 10:58:14', '2024-07-15 14:21:59'),
(2, 'nobis', 'ad-laudantium-nulla-esse-suscipit-placeat-nesciunt-sint-itaque', 'Voluptatem cum ut atque aut saepe voluptas numquam in. Similique nulla voluptas aut et animi tempora dolores quae. Earum est dolorem facilis totam. Mollitia debitis soluta sunt et eum. Rerum pariatur placeat recusandae vitae. Quia laudantium cupiditate rerum et reprehenderit et. Molestiae sit nihil ipsam. Non praesentium laborum aut vel qui vel.', 'Voluptatem cum ut atque aut saepe voluptas numquam in. Similique nulla voluptas aut et animi tempora dolores quae. Earum est dolorem facilis totam. Mollitia debitis soluta sunt et eum. Rerum pariatur placeat recusandae vitae. Quia laudantium cupiditate rerum et reprehenderit et. Molestiae sit nihil ipsam. Non praesentium laborum aut vel qui vel.', 'posts/imagen_post_id_2.jpg', '1', 4, 1, '2024-07-13 03:14:00', '2024-07-07 10:58:14', '2024-07-13 03:14:00'),
(3, 'et', 'eum-quae-optio-laudantium-aut-voluptas-tempora-omnis-amet', 'Dicta enim velit dolore et ratione. Sed alias est error quia eos. Sunt architecto non qui minus. Suscipit maxime nihil quia laboriosam. Minima non fuga quisquam ad. Delectus fugiat ut eos inventore vel blanditiis aut. Eum sunt voluptatem corrupti sed aliquid. Et et voluptatum sed quia omnis dolores. Harum natus alias ut at.', 'Dicta enim velit dolore et ratione. Sed alias est error quia eos. Sunt architecto non qui minus. Suscipit maxime nihil quia laboriosam. Minima non fuga quisquam ad. Delectus fugiat ut eos inventore vel blanditiis aut. Eum sunt voluptatem corrupti sed aliquid. Et et voluptatum sed quia omnis dolores. Harum natus alias ut at.', 'posts/imagen_post_id_3.jpg', '1', 3, 1, '2024-07-13 05:14:50', '2024-07-07 10:58:14', '2024-07-13 05:14:50'),
(4, 'voluptatem', 'quos-nemo-quis-neque-quia-enim-impedit', 'Et aut et et excepturi. Pariatur tempore necessitatibus saepe amet dolor temporibus blanditiis dolorum.\n\nEst ratione qui quasi delectus corrupti. Veritatis est odio consequatur omnis et assumenda culpa. Dolore et minus voluptas a quae est.\n\nPossimus sunt error nostrum. Quia quibusdam et quam dolorem molestiae et perspiciatis. Laudantium culpa porro suscipit.', 'Facilis exercitationem ea inventore doloremque voluptatem. Libero enim et dolores ut quia sit. Minima maxime enim maiores cum ut rerum. Tempora eum qui dolorum ut et similique. Aperiam laudantium quibusdam et ducimus est. Voluptatum adipisci omnis velit eaque quaerat vel. Qui vel consequuntur quod ipsum esse velit natus natus.', 'https://via.placeholder.com/640x480.png/0044ee?text=deleniti', '1', 1, 1, '2024-07-07 10:58:14', '2024-07-07 10:58:14', '2024-07-07 10:58:14'),
(5, 'quibusdam', 'incidunt-qui-voluptatem-voluptatum-molestiae-inventore-ut', 'Facilis dignissimos minima repellat modi asperiores nam similique. Praesentium eum illum sunt ad.\r\n\r\nEst consequatur aut id est. Corrupti esse perspiciatis qui id temporibus. Odio temporibus illum est sapiente deserunt delectus eum dolore.\r\n\r\nQuisquam laboriosam qui autem omnis labore delectus eligendi laboriosam. Velit dolor perferendis sed placeat.', 'Mollitia voluptatibus autem molestiae delectus sapiente. In quia earum occaecati et est saepe molestias quia. Vel quo praesentium aut necessitatibus perferendis. Dolorem porro quaerat nobis iusto magnam ut sunt.', 'https://via.placeholder.com/640x480.png/00aa77?text=atque', '1', 4, 1, '2024-07-09 20:18:51', '2024-07-07 10:58:14', '2024-07-09 20:18:51'),
(6, 'nihil', 'laborum-quod-cupiditate-fugit-culpa', 'Reiciendis ea velit suscipit et ipsa autem quisquam. Consequatur autem totam qui aut. Alias labore soluta omnis dolorem quis distinctio.\r\n\r\nVero aperiam consequuntur saepe quos id omnis eligendi maxime. Nulla consequatur consequatur eos explicabo molestiae nam. Aspernatur quia cumque tenetur quo sunt culpa sit facere.\r\n\r\nNam ea et tempore corrupti cumque illum atque. Ut corrupti molestias reprehenderit adipisci incidunt veritatis. Quasi corrupti illum quis officiis qui necessitatibus voluptatum. Qui qui aspernatur ea voluptas et quis ea qui.', 'Et dolorem omnis vel aut. Fugit cum unde necessitatibus ut. Sit quod commodi tenetur ut. Delectus atque voluptatem non est. Numquam placeat dolores itaque tempore hic. Officia et et repellat sit. Veniam eveniet molestiae explicabo ut quam. Atque et et tempora sit. Dolores qui repellat facilis quos porro et.', 'https://via.placeholder.com/640x480.png/00ccdd?text=optio', '1', 2, 1, '2024-07-09 20:19:29', '2024-07-07 10:58:14', '2024-07-09 20:19:29'),
(7, 'consequuntur', 'reiciendis-voluptatem-error-perspiciatis-non-unde', 'Tempore corrupti sed aspernatur et suscipit cumque reiciendis. Minus mollitia quia natus esse. Cum et corrupti cupiditate debitis cupiditate autem dolorum. Alias adipisci tenetur ut aut occaecati cupiditate eveniet.\n\nSuscipit sit itaque et veritatis quae in excepturi. Vitae ullam aspernatur aut qui. Repudiandae in non culpa nihil omnis.\n\nIpsa ipsum sint sit voluptatum sequi laborum expedita. Assumenda esse asperiores ab eveniet. Autem et ratione quis sed. Ut voluptates ab id repellendus maiores. Tempore tempora rem cumque quod ratione.', 'Aperiam placeat corrupti dolorum. Omnis tempore beatae quo qui quisquam enim eligendi. Nobis sit consectetur id autem. Commodi nobis veritatis hic temporibus itaque ratione quam ut. Est sint sunt et et voluptatem numquam sunt. Doloribus deserunt ad rerum voluptas. Voluptas consequatur consequatur non non consequatur id.', 'https://via.placeholder.com/640x480.png/008844?text=quae', '1', 1, 1, '2024-07-07 10:58:14', '2024-07-07 10:58:14', '2024-07-07 10:58:14'),
(8, 'voluptatem', 'rerum-aperiam-animi-est-qui-aperiam', 'Quod quos suscipit architecto. Maxime nobis architecto sit sequi molestiae consequatur iure. Molestiae eligendi dolorem eos et quia.\n\nUt corrupti incidunt et reprehenderit eius iusto fuga fugiat. Sit eligendi praesentium alias suscipit. Illum placeat eos dolores quia perspiciatis iusto nobis. Aut dolorum harum voluptatem aperiam.\n\nQuaerat neque architecto est et omnis ut dolor et. Nihil molestiae dignissimos eveniet tempore tenetur veritatis dicta. Ipsa incidunt beatae dolor sint. A culpa et praesentium temporibus sunt incidunt sit ab.', 'Delectus et rem amet. Eveniet quidem ex provident eligendi nesciunt. Qui ipsa est maxime architecto ex. Occaecati iure veritatis consectetur neque asperiores. Quis unde quod voluptatum quam ducimus. Nostrum omnis est unde eos qui in. Ad et et nihil officia impedit perferendis quos.', 'https://via.placeholder.com/640x480.png/00ccaa?text=ea', '1', 1, 1, '2024-07-07 10:58:14', '2024-07-07 10:58:14', '2024-07-07 10:58:14'),
(9, 'quos', 'et-distinctio-voluptates-laboriosam-aut-ut-expedita', 'Hic temporibus omnis aliquam maxime sit voluptatum enim. Odio exercitationem quo a exercitationem culpa. Nemo deserunt animi provident laborum veritatis alias quia.\n\nAccusantium error illum commodi ex aut corrupti dignissimos ullam. Minus voluptas qui consequuntur amet voluptatem dolores.\n\nAccusantium iure soluta nihil. Necessitatibus vel at saepe doloremque. Voluptas reprehenderit non repellendus aut expedita quasi.', 'In enim aut suscipit velit asperiores quia nihil blanditiis. Enim ut est nemo ut totam. Officia aliquid iure recusandae. Labore occaecati similique tempore eum quibusdam eum. Eius eveniet sed dolorem non. Dolore nobis reiciendis et sit placeat. Omnis quis id impedit exercitationem consequatur hic. Pariatur et rerum laboriosam esse qui velit. Molestias rem quaerat eos animi quia.', 'https://via.placeholder.com/640x480.png/002266?text=consequuntur', '0', 1, 1, NULL, '2024-07-07 10:58:14', '2024-07-07 10:58:14'),
(10, 'perferendis', 'alias-quas-est-laborum-assumenda-et-odio-sit', 'Sunt non officiis quia sapiente rerum. Quidem consequatur vitae qui et. Deserunt dolor impedit dignissimos rerum officia sint. Ut est nobis deleniti.\n\nEveniet harum nihil temporibus ex numquam voluptatem. Aliquam adipisci dolores quisquam consectetur impedit laudantium. Velit adipisci delectus eveniet qui occaecati. Temporibus odio consectetur quo.\n\nReprehenderit at doloribus aliquam sit consectetur saepe ut. Qui beatae id enim ad voluptatibus. Quos sit et tenetur est quis. Magni quo ut similique vero tempora voluptatem.', 'Est accusamus iste aut eveniet eaque. Voluptatem nulla qui voluptatem maxime nihil esse. Quia nobis sunt iure neque dolor consequatur excepturi cum. Quis et officia vitae consequatur. Qui illum nemo autem et sed. Assumenda distinctio veritatis dicta explicabo non omnis.', 'https://via.placeholder.com/640x480.png/00eeff?text=rerum', '1', 5, 1, '2024-07-07 10:58:14', '2024-07-07 10:58:14', '2024-07-07 10:58:14'),
(12, 'perspiciatis', 'consequatur-laudantium-molestias-et-animi-non-possimus', 'Similique ut praesentium voluptatem animi nostrum. Et ea ad dolor illum expedita. Sit autem alias necessitatibus voluptatem voluptatem in sint. Illum voluptatem eum nihil quia dicta.\r\n\r\nNobis provident illo et quia eos. Illo aspernatur itaque facere vel omnis commodi. Est dolores consequatur alias nihil et nobis. Eaque ut odit veritatis non.\r\n\r\nEst inventore aut aut et quia voluptas nesciunt aut. Ipsam ab saepe voluptatem nihil. Adipisci at officiis quisquam delectus nemo molestiae. Aspernatur veritatis repudiandae nostrum dolores atque voluptatem voluptatem in.', 'Incidunt doloremque non accusamus sit asperiores ut est cumque. Aut consequuntur suscipit sint quia. Non veritatis est eligendi. Harum quis accusantium maxime ab sint. Maxime facilis possimus dolorem mollitia quidem. Vel qui quasi natus est. Optio dolores sed vel consequuntur qui. Ut ut corrupti quibusdam qui a vel provident.', 'https://via.placeholder.com/640x480.png/00bb66?text=consequatur', '1', 4, 1, '2024-07-09 15:23:23', '2024-07-07 10:58:14', '2024-07-09 15:23:23'),
(13, 'et', 'et-aut-accusamus-veniam-iure-id', 'Et architecto nihil ipsa aut ut aliquid. Maiores delectus est maiores repudiandae quasi illo. Nobis officiis et cupiditate quia illum porro.\n\nNemo qui velit non. At temporibus pariatur sit cum voluptatem harum laborum. Minus pariatur excepturi quis vel.\n\nNesciunt consequatur laboriosam nihil et adipisci numquam. Sequi dolor nemo repellat incidunt fugit. Error ipsa reprehenderit sed sit inventore fugit sed. Tempore est blanditiis totam.', 'Ut voluptatem ut nisi. Porro saepe omnis blanditiis repellat doloremque. Dolorem vitae non impedit voluptatibus sed quia odit eligendi. Id exercitationem voluptatem amet voluptatum numquam quisquam sunt. Doloribus odio optio sint explicabo. Vitae tempore sunt saepe odit dignissimos aspernatur fuga. Impedit autem natus eveniet fuga et.', 'https://via.placeholder.com/640x480.png/00bb22?text=enim', '1', 3, 1, '2024-07-07 10:58:14', '2024-07-07 10:58:14', '2024-07-07 10:58:14'),
(14, 'dicta', 'vero-asperiores-et-autem-quasi', 'Beatae iusto quis minima eius laudantium. Voluptatem est quo numquam. Esse quia ducimus unde doloribus tempora deleniti dolorem.\n\nAut omnis maiores et non qui soluta. Alias quod dolore veritatis necessitatibus ab. Cum quas est commodi debitis recusandae.\n\nVoluptates reiciendis dolorem voluptas reprehenderit dolor vel maiores. Voluptatum velit et sunt quisquam. Doloribus numquam et ea corrupti voluptatem perferendis atque. Mollitia eaque natus quod exercitationem autem.', 'Quia corrupti ipsam quam quia. Quo cum labore blanditiis libero. Consequatur perferendis totam quia quis architecto rerum. Dicta molestias aut sapiente facere quia harum. Nesciunt vel unde quis quisquam eaque vitae eos. Commodi fugiat quia consequatur nam.', 'https://via.placeholder.com/640x480.png/00eedd?text=ea', '1', 1, 1, '2024-07-07 10:58:14', '2024-07-07 10:58:14', '2024-07-07 10:58:14'),
(15, 'voluptate', 'eligendi-sit-laboriosam-temporibus-ut', 'Neque consequatur accusantium repellat et velit architecto. Nostrum libero sit omnis quod dicta voluptatem. Est fuga suscipit fuga nisi. Deleniti sapiente rerum officiis ratione.\r\n\r\nNumquam quos ducimus repudiandae ea voluptas repellat dolores voluptatem. Et fugiat laboriosam ducimus quam. Nostrum aut deserunt illum assumenda voluptatibus sint enim.\r\n\r\nEt id voluptates voluptate sed enim a suscipit labore. Et atque aut similique est autem sequi.', 'Accusamus aliquid tenetur amet. Itaque tempora omnis ut ut ea. Possimus dolor perspiciatis vel repudiandae quo voluptatem. Eius ea veritatis et fugit. Repudiandae provident reprehenderit dolores. Est corporis explicabo aperiam tempora aut aut vero. Eos temporibus et quo quis esse asperiores repudiandae. Debitis aut nisi qui ab quia sapiente. Neque ea temporibus dolorum laudantium.', 'https://via.placeholder.com/640x480.png/0055ff?text=est', '1', 3, 1, '2024-07-09 15:24:09', '2024-07-07 10:58:14', '2024-07-09 15:24:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0YS7VcpznOuONjEZhIlQqMFmZ0RjLcuTQzKE1nLX', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVHVTMkFyZE1wbE5yVXpYOUdZTktwcHFTU3Rvb0JldWlxY3IzdUVCZSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM2OiJodHRwOi8vYmxvZ3MudGVzdC9hZG1pbi9wb3N0cy8xL2VkaXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1721053319),
('E9ZHy2k9oQMNjxFm6mTVq3LQhchuy3Sqa6cfknKq', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUnlaQzZwek9oQnFSMDlpNDFDZnZESldpZ3NlVE0xZFFqMWNZYVhIaSI7czozOiJ1cmwiO2E6MDp7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM2OiJodHRwOi8vYmxvZ3MudGVzdC9hZG1pbi9wb3N0cy8xL2VkaXQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1720848681),
('En1t3r3W8nmOu1tmzuR8pHoL5ebZ7bwFjnGsCOCD', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRDA1czVQSk5zelJXVE1CUnBtN1M0YzE3b3JsSzQ0eVFLV3lXY0hKMiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI5OiJodHRwOi8vYmxvZ3MudGVzdC9hZG1pbi9wb3N0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1721065374),
('pxxeEKLgMvH0MgdkpcqsNkAHzKgcbImiHt4Umjoi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQmc3UEduYTRGd0xhdmkxOGN6NjBMd2Q2aVYxdWpXMDNVSnF1RzV6bCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMzoiaHR0cDovL2Jsb2dzLnRlc3QvYWRtaW4iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMzoiaHR0cDovL2Jsb2dzLnRlc3QvYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1720839971),
('VjS2dwSwM60GWUs69sp8kZyCOGNWcJxw8hn09Cqc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0FzY2xMTFVtNU1qbk5HN3V2WVpjVDRLTGtXYnN1eUVkOGd3NmlmYyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyOToiaHR0cDovL2Jsb2dzLnRlc3QvYWRtaW4vcG9zdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721051999),
('xyi4q1IqMeos7HVNMlyYkrAED3ixpaPNFLTP56TS', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiM2VrNVZwbnRLY1lReVIzbmMySWdYTHZZNUdIM3IxZmliSXV5bEtZayI7czozOiJ1cmwiO2E6MDp7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9ibG9ncy50ZXN0L2FkbWluL3Bvc3RzIjt9fQ==', 1721077713);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taggables`
--

CREATE TABLE `taggables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` tinyint(4) NOT NULL,
  `taggable_type` varchar(255) NOT NULL,
  `taggable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `taggables`
--

INSERT INTO `taggables` (`id`, `tag_id`, `taggable_type`, `taggable_id`, `created_at`, `updated_at`) VALUES
(3, 9, 'App\\Models\\Post', 1, NULL, NULL),
(4, 8, 'App\\Models\\Post', 1, NULL, NULL),
(5, 2, 'App\\Models\\Post', 2, NULL, NULL),
(6, 1, 'App\\Models\\Post', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tags`
--

CREATE TABLE `tags` (
  `id` tinyint(4) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tags`
--

INSERT INTO `tags` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '#DesarrolloWeb', '2024-07-09 16:15:28', '2024-07-09 16:15:28'),
(2, '#Programación', '2024-07-09 16:15:28', '2024-07-09 16:15:28'),
(3, '#Backend', '2024-07-09 16:15:28', '2024-07-09 16:15:28'),
(4, '#Frontend', '2024-07-09 16:15:28', '2024-07-09 16:15:28'),
(5, '#DevOps', '2024-07-09 16:15:28', '2024-07-09 16:15:28'),
(6, '#FullStack', '2024-07-09 16:15:28', '2024-07-09 16:15:28'),
(7, '#JavaScript', '2024-07-09 16:15:28', '2024-07-09 16:15:28'),
(8, '#Mysql', '2024-07-09 16:15:28', '2024-07-09 16:15:28'),
(9, '#OpenSource', '2024-07-09 16:15:28', '2024-07-09 16:15:28'),
(10, '#Tech', '2024-07-09 16:15:28', '2024-07-09 16:15:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Andres Herrera', 'correo@correo.com', NULL, '$2y$12$2dZLb6KsLcsKZUWS9RJMEeuIk5xDI.hpuiSQTlN4oPKOW7djewM1u', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-27 07:02:42', '2024-06-27 07:02:42');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_commentable_type_commentable_id_index` (`commentable_type`,`commentable_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_imageable_type_imageable_id_index` (`imageable_type`,`imageable_id`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_category_id_foreign` (`category_id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `taggables`
--
ALTER TABLE `taggables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taggables_tag_id_foreign` (`tag_id`),
  ADD KEY `taggables_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`);

--
-- Indices de la tabla `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `links`
--
ALTER TABLE `links`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `taggables`
--
ALTER TABLE `taggables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tags`
--
ALTER TABLE `tags`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `taggables`
--
ALTER TABLE `taggables`
  ADD CONSTRAINT `taggables_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
