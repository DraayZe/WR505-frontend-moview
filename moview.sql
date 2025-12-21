-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : dim. 21 déc. 2025 à 10:06
-- Version du serveur : 10.8.8-MariaDB-1:10.8.8+maria~ubu2204
-- Version de PHP : 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `symfony`
--

-- --------------------------------------------------------

--
-- Structure de la table `actor`
--

CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL COMMENT '(DC2Type:date_immutable)',
  `dod` date DEFAULT NULL COMMENT '(DC2Type:date_immutable)',
  `bio` longtext NOT NULL,
  `created_at` date NOT NULL COMMENT '(DC2Type:date_immutable)',
  `photo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `actor`
--

INSERT INTO `actor` (`id`, `lastname`, `firstname`, `dob`, `dod`, `bio`, `created_at`, `photo_id`) VALUES
(1522, 'Bardot', 'Brigitte', '1955-09-05', '2002-01-20', 'Repellendus explicabo amet omnis. Qui quaerat sed reprehenderit distinctio eos dolor fugit. Labore aut aut illum dolores ut explicabo. Alias sint magni minima id minus. Sit cum est voluptatem voluptas voluptatem. Cum quod quam est dolor et eius optio.', '2025-12-20', NULL),
(1523, 'Leigh', 'Janet', '1956-02-20', '1957-10-28', 'Non sed laborum laudantium accusantium sunt. Quia aperiam rerum velit ut sunt et eaque corporis. Enim voluptate nihil iusto quia. Rem esse corporis a sapiente. Consequatur fugiat mollitia architecto dolores sunt qui non. Error molestias eum omnis dolore est et unde ex. Deserunt quam id a quidem libero. Et pariatur sit fuga sit possimus repellendus. Omnis veniam eum suscipit consequuntur quam perferendis possimus voluptatem.', '2025-09-22', NULL),
(1524, 'Kelly', 'Grace', '1931-08-22', '2016-05-02', 'Aliquid voluptas accusantium atque praesentium voluptate asperiores. Quisquam unde omnis perferendis molestias et. Deserunt et molestiae quos architecto. Voluptatum consectetur tempora amet nostrum. Earum ex unde ratione similique ab. Deleniti consequatur assumenda non voluptas. Voluptatem sed hic illo a in similique occaecati.', '2025-09-22', NULL),
(1525, 'Huppert', 'Isabelle', '1938-11-11', '2024-11-29', 'Et fugit et ut est. Ut doloremque illo quo est nemo. Voluptas sed eius culpa eius cum sit optio perspiciatis. Magni mollitia quibusdam facilis commodi temporibus. Harum distinctio quia dolores suscipit illum. Vel tenetur sed inventore est a dolor id aliquid.', '2025-09-22', NULL),
(1526, 'McAdams', 'Rachel', '1983-12-09', '1997-11-06', 'Possimus ipsam ut dolorum debitis. Error et quaerat provident. Soluta unde recusandae eos eligendi aut. Eaque qui et facilis id vero.', '2025-09-22', NULL),
(1527, 'Cruise', 'Tom', '1931-11-14', '2004-09-08', 'Alias repudiandae velit omnis impedit et rerum. Reprehenderit dolores non quisquam. Consequuntur est omnis dicta sint illo et. Error aut dolorem est tenetur ut atque nemo aut. Ab quo neque natus similique iure quod. Qui sed nobis itaque nisi aut ut.', '2025-09-22', NULL),
(1528, 'Jason', 'Jennifer', '2019-10-07', '2024-08-18', 'Eos neque quis quia reiciendis. Asperiores omnis consequatur voluptatibus quisquam facere. Aut recusandae quidem architecto. Quia harum molestiae quia accusamus laborum ratione.', '2025-09-22', NULL),
(1529, 'Seydoux', 'Léa', '1968-03-23', '2011-03-03', 'Voluptatum sequi nihil facilis est. Voluptatem suscipit qui at enim. Deleniti et corporis eligendi repellat recusandae ut. Tempore eos reiciendis repellendus quae dolor et vel iusto. Autem cupiditate quo qui autem. Itaque explicabo alias et non quo. Dolorem voluptatum pariatur provident quas voluptate ipsam repellendus.', '2025-09-22', NULL),
(1530, 'Gyllenhaal', 'Maggie', '1996-04-25', '2020-09-18', 'Dignissimos consequatur perferendis dolor aut porro. Et quas omnis officia natus. Esse animi occaecati sapiente accusamus quis. Ea mollitia sed eos sint dolores sint. Aut est aut inventore qui dicta ut rerum eaque.', '2025-09-22', NULL),
(1531, 'Williams', 'Robin', '1981-12-13', '2001-12-24', 'Dolorum autem rerum vero et minus et. Provident consectetur non deserunt vitae quia voluptas. In vel animi et asperiores aut recusandae qui. Sapiente fugit nesciunt saepe. Quia quo et et alias fugit. Sequi quos ipsa aut.', '2025-09-22', NULL),
(1532, 'Foster', 'Jodie', '1947-01-05', '1962-11-04', 'Corporis vel reiciendis minima et. Consequuntur enim est debitis dicta. Est blanditiis vitae hic blanditiis officiis corporis. Qui nihil modi tenetur qui repudiandae sed tempore. Sit sunt eum accusantium voluptatem. Voluptatum aut corrupti mollitia deserunt mollitia. Quos nam in quibusdam sit. Molestiae et quod omnis debitis id.', '2025-09-22', NULL),
(1533, 'Adams', 'Amy', '1980-03-05', '2022-06-29', 'Autem voluptatum perferendis assumenda deserunt. Aliquam harum et nulla ipsa. Dignissimos aut dolore est quo magni occaecati accusamus. Voluptatum dolores provident velit voluptas omnis. Commodi quas voluptatem quas voluptatem ad ab quisquam.', '2025-09-22', NULL),
(1534, 'Portman', 'Natalie', '2020-07-30', '2023-10-19', 'Libero deserunt qui et quis temporibus. Odit nemo perferendis fugiat est aut molestias. Repellendus eligendi dolorem dolore iusto inventore deserunt animi quas. Qui sed dignissimos enim quod. Tempore sit amet eligendi voluptas nemo placeat similique.', '2025-09-22', NULL),
(1535, 'Depp', 'Johnny', '1976-01-25', '1996-12-05', 'Aut ad doloremque ut fugiat cupiditate praesentium est. Sit provident at inventore similique. Magnam quos repellat tempora magni vitae doloremque et. Perspiciatis itaque atque est debitis labore dolor qui. Nobis nemo quia incidunt dolores aperiam sit. Quia temporibus aut aut laborum deleniti. Accusamus corrupti quisquam reprehenderit amet laborum. Inventore qui omnis minus aspernatur. Deserunt aut occaecati aperiam reiciendis quo.', '2025-09-22', NULL),
(1536, 'Hackman', 'Gene', '1934-12-03', '1948-07-18', 'Quas asperiores odit vitae iusto. Possimus natus natus eos repellat. Possimus esse nihil ab maxime dolores. Et nisi dolorum ut enim nihil dolores. Sunt velit beatae accusantium odit commodi. Impedit earum perspiciatis expedita commodi occaecati. Quia error aut in iste nam et. Molestiae cupiditate quaerat et est consectetur quam.', '2025-09-22', NULL),
(1537, 'Plummer', 'Amanda', '1974-11-26', '2016-04-21', 'Odit qui quos qui perspiciatis impedit unde. Eos nemo aspernatur suscipit et vero sed quisquam. Ipsa commodi quia doloribus necessitatibus assumenda impedit. Doloremque saepe est architecto laborum error voluptatum qui. Ipsa tenetur non pariatur commodi voluptatem nam. Amet ut illo quam voluptatibus quod quo explicabo.', '2025-09-22', NULL),
(1538, 'Monroe', 'Marilyn', '1981-03-15', '1981-08-03', 'Qui veritatis voluptatem accusantium atque omnis. Provident ut velit id autem quo et quis. Voluptas deleniti quia odit delectus. Et qui eaque quia consectetur. Dolor natus quia laborum maiores nesciunt sint veritatis minus. Et qui quia beatae dolores non accusantium. Fuga fuga deleniti cum et officia.', '2025-09-22', NULL),
(1539, 'Crowe', 'Russell', '2024-05-03', '2025-08-03', 'Enim quia numquam corporis delectus vero. Ipsam ea et repellat nobis quia quia. Natus ducimus et voluptatem quos explicabo nulla. Sit quaerat ex ab dolorem. Unde voluptatem ex et molestiae tempore commodi ipsa. Corporis amet dignissimos voluptatem rerum iste. Ullam sint deserunt voluptas sunt fugit. Provident eveniet est et.', '2025-09-22', NULL),
(1540, 'Carrey', 'Jim', '2020-12-10', '2023-05-29', 'Numquam ex porro ut eos ut. Vel totam assumenda sequi voluptates facere quia sapiente. Voluptate non reiciendis ullam rerum asperiores quod. Ipsam qui quia natus dolores amet. Porro unde voluptas deleniti sunt. Dolore sapiente aliquam non ut odio aut.', '2025-09-22', NULL),
(1541, 'Fonda', 'Henry', '1957-09-25', '1998-02-19', 'Minima voluptatem qui reprehenderit quia voluptatem aspernatur excepturi. Exercitationem provident vel consequatur perferendis. Quia illo est eius sapiente. Suscipit consectetur quos est ipsam explicabo sit nihil iusto. Voluptatem saepe ipsam excepturi fuga magni ut ratione. Debitis qui eos sed doloremque. Similique ex odit nobis sunt molestiae perferendis. Facere est eveniet odio quasi iste.', '2025-09-22', NULL),
(1542, 'Baye', 'Nathalie', '1973-11-03', '2017-08-02', 'Vel molestiae eligendi ut sit aliquid dolorem temporibus. Vitae adipisci autem cumque cum. Sit aut minus ullam ratione. Corrupti sint itaque et. Ullam neque quod odit sed eius. Non eligendi ab enim quaerat exercitationem eos. Eius qui quaerat omnis totam quae earum quis.', '2025-09-22', NULL),
(1543, 'Jackman', 'Hugh', '1941-09-09', '2006-01-31', 'Sunt temporibus omnis sapiente iure ducimus suscipit. Consequatur rem quas asperiores laboriosam. Ipsa voluptatem rerum iusto eveniet suscipit consequatur ut. Consequatur voluptatibus nobis nemo quia libero pariatur culpa. Voluptatum nobis porro et amet alias itaque sint. Vero ipsa necessitatibus laboriosam natus voluptatum et suscipit. Animi autem et numquam tenetur. Molestias quia veritatis veritatis alias. Iure cumque saepe quas aut accusamus.', '2025-09-22', NULL),
(1544, 'Vikander', 'Alicia', '1983-12-21', '2022-04-19', 'Quia hic fugit atque voluptatem ea. Sunt distinctio quia excepturi enim voluptatem nemo corrupti. Ipsum voluptas velit sit officia delectus omnis. Cupiditate perferendis mollitia ad consequuntur eligendi ut exercitationem eligendi. Est illum molestiae quia delectus fuga rerum.', '2025-09-22', NULL),
(1545, 'Hoffman', 'Dustin', '2012-04-15', '2018-03-20', 'Sunt numquam vitae voluptatum et voluptatum dolorum vitae. Corporis nostrum sit consectetur placeat. Facere reprehenderit totam cumque consequatur impedit. Voluptatem inventore consequatur qui fugiat et. Voluptate ad excepturi corporis incidunt doloremque.', '2025-09-22', NULL),
(1546, 'Freeman', 'Morgan', '1941-01-23', '2017-04-22', 'Soluta sit ipsum qui aspernatur suscipit. Vel et omnis rem quis. Temporibus temporibus totam laborum nobis voluptatum suscipit. Id debitis maiores incidunt ea et. Adipisci non reprehenderit ea atque corrupti.', '2025-09-22', NULL),
(1547, 'Waltz', 'Christoph', '1954-11-05', '2015-01-28', 'Autem recusandae rerum est deserunt qui eveniet. Est modi non facilis qui vel molestiae. Deleniti officiis accusantium itaque aut. Officiis rerum est minus omnis. Autem in mollitia et asperiores sunt. Porro mollitia nulla aliquam laborum. Molestiae sint labore qui rem dignissimos aut aspernatur.', '2025-09-22', NULL),
(1548, 'Green', 'Eva', '1949-07-19', '1982-02-01', 'Dolorum repellendus cupiditate illo architecto inventore repellat maxime. Facilis et voluptatum vero non ex. Quia cupiditate laboriosam magni. Libero dignissimos voluptas quia voluptas quia. Ipsum sint rerum iusto doloribus. Pariatur recusandae sint labore deserunt.', '2025-09-22', NULL),
(1549, 'Diaz', 'Cameron', '2002-01-30', '2018-03-27', 'Nihil ut labore officia quia architecto soluta. Omnis est at et aliquid maiores. Praesentium ut hic fugit distinctio. Et temporibus quisquam nam facere. Adipisci magnam iste in a sit error ducimus. Similique sint eveniet blanditiis fuga id.', '2025-09-22', NULL),
(1550, 'Fiennes', 'Ralph', '1927-05-05', '2020-07-07', 'Nobis ab asperiores deleniti ea dolore ab. Fugiat quam quisquam perferendis voluptas expedita eum. Neque quod dolorem vitae qui. Et est assumenda quia provident velit. Quia vel alias rem asperiores. Omnis dolorum tempore perferendis praesentium.', '2025-09-22', NULL),
(1551, 'Affleck', 'Ben', '2019-04-13', '2020-02-08', 'Sed tenetur quisquam repellendus amet aperiam dolores facere. Iure inventore quia exercitationem corporis aut. Est eos nobis numquam accusamus itaque. Maxime rerum ullam magnam quia. Provident praesentium voluptas ea omnis. Possimus deleniti sit voluptatem vitae est quasi nam.', '2025-09-22', NULL),
(1552, 'Wilde', 'Olivia', '2006-06-12', '2022-05-08', 'Eveniet perspiciatis saepe soluta est debitis labore illo eius. Odio animi ut dignissimos dolorem minus sint. Et id totam quia ut sed dolor modi. Et voluptatum labore ad deleniti nihil. Quam sed sed rem quia eum neque. Beatae et debitis minus. Corrupti voluptatem rerum repellendus omnis vero et labore. Deleniti nihil voluptatibus officia culpa sint sit.', '2025-09-22', NULL),
(1553, 'Pfeiffer', 'Michelle', '2013-04-29', '2017-07-19', 'Aperiam aut perferendis nihil quo accusamus aperiam illum. Libero autem possimus qui corrupti reprehenderit sunt provident omnis. Dolorem magni voluptas autem quam. Aspernatur et modi ut eius nulla qui. Inventore illo iusto neque sequi explicabo ea a.', '2025-09-22', NULL),
(1554, 'Fonda', 'Jane', '2007-07-22', '2013-08-30', 'Sed vitae tempore harum laboriosam error accusantium perspiciatis. Iste reiciendis et nemo. Rerum ut omnis dolorem atque odit voluptatibus. Dicta minus aut ea ab quod laborum numquam dolor. Cumque dolor sit ad sint recusandae qui.', '2025-09-22', NULL),
(1555, 'Kelly', 'Gene', '1964-04-01', '2022-05-14', 'Magnam est harum perferendis quibusdam. Molestias sed sunt quidem aliquam. Accusamus aliquam eum non sit rem amet debitis harum. Qui et sint ipsam et sapiente eum error officiis.', '2025-09-22', NULL),
(1556, 'Cranston', 'Bryan', '2022-07-20', '2024-12-09', 'Harum omnis quas earum animi harum repellendus ipsa. Qui porro iusto voluptate. Incidunt et perspiciatis impedit sunt labore voluptas omnis. Maiores qui possimus tempora sint doloremque qui beatae voluptatum. Ad praesentium aut tenetur eum id consequatur. Placeat harum sit aut veritatis. Dignissimos voluptas dolores cumque sint. Incidunt sed facilis unde praesentium laudantium.', '2025-09-22', NULL),
(1557, 'Day-Lewis', 'Daniel', '2008-03-20', '2019-09-30', 'Nemo ratione voluptas excepturi cupiditate pariatur quia. Rerum eos vero aut et enim est ab. Quasi omnis at dolores sunt enim. Ut qui quaerat nemo suscipit. Libero dignissimos et blanditiis aliquid quia. Ut ut occaecati voluptates corrupti necessitatibus esse. Facilis rerum dolorem id laborum. Rem quos et laudantium incidunt. Aut quia labore aut a.', '2025-09-22', NULL),
(1558, 'Madsen', 'Michael', '1985-10-29', '1999-06-13', 'Quis earum amet sit voluptates fuga dicta. Rerum sit rerum corporis inventore. Molestias nobis delectus qui fugit et labore. Laudantium ut est soluta sequi sint quia. Ullam id id ad. Voluptas doloremque deserunt ut nihil.', '2025-09-22', NULL),
(1559, 'Garfield', 'Andrew', '1973-11-18', '1987-06-24', 'Libero necessitatibus sunt qui nihil magnam pariatur. Ullam rerum sed delectus totam nesciunt. Alias est voluptatem corporis et veritatis aut eligendi. Ipsa est exercitationem inventore eos qui eaque. Doloribus repellat necessitatibus consequatur atque. Quia maxime ipsum est vel. Et quia dolorum eligendi recusandae voluptas.', '2025-09-22', NULL),
(1560, 'Kingsley', 'Ben', '2014-09-26', '2020-03-09', 'Ad voluptas consequatur dolor nihil repudiandae iste ea. Et voluptatum aut quis earum minima et. Tempore consequuntur quo porro quo. Et suscipit omnis sint quos dolores quis labore. Aut accusamus voluptates facilis voluptate ut error. Voluptas ut aut facere et explicabo consectetur. Quo nulla eum praesentium.', '2025-09-22', NULL),
(1561, 'Kunis', 'Mila', '2018-10-14', '2020-09-05', 'Impedit explicabo rerum soluta nostrum ut et ipsam. Laborum iure assumenda numquam labore inventore eaque. Odit eius aperiam natus consectetur dolores cumque. In minus eius eveniet ex. Sit est qui sunt deleniti omnis alias.', '2025-09-22', NULL),
(1562, 'Blanchett', 'Cate', '1973-02-27', '2014-05-11', 'Quam alias quam iste sed delectus voluptates at numquam. Ipsum sit iure doloribus architecto assumenda. Ratione voluptas quidem assumenda officia praesentium neque. Sit dolor est enim deserunt inventore voluptate. Repellendus eius voluptates at quam non laudantium.', '2025-09-22', NULL),
(1563, 'Connelly', 'Jennifer', '1940-08-24', '1995-08-17', 'Debitis laboriosam praesentium aut eveniet. Hic architecto accusantium libero eius reiciendis temporibus in. Exercitationem commodi quod perspiciatis explicabo et adipisci est. Aut similique in libero nobis molestias porro iste. Assumenda et deserunt exercitationem velit facilis non accusamus voluptate. Esse nisi adipisci corrupti aut. Magni vero ut maxime dolor architecto quia. Tenetur excepturi alias et assumenda.', '2025-09-22', NULL),
(1564, 'Phoenix', 'Joaquin', '1926-10-25', '2019-10-12', 'Corporis enim numquam natus odit. Sunt totam corrupti eligendi. Earum illo perferendis ut aliquam porro et. Aut provident veniam modi tempora quis corporis exercitationem. Rem porro maxime provident est sed reiciendis voluptas. Voluptatem maiores magnam illum incidunt beatae porro repellat.', '2025-09-22', NULL),
(1565, 'Bullock', 'Sandra', '1973-09-23', '2000-01-14', 'Veniam et dicta nihil et officia. Placeat a ut rerum est saepe consequatur. Minus quisquam ad consequatur et voluptatibus. Non voluptatem nesciunt et provident illum. Ut ducimus quis aliquid consequatur cumque quis earum.', '2025-09-22', NULL),
(1566, 'Bridges', 'Jeff', '2000-01-15', '2005-08-08', 'Labore quisquam exercitationem et maxime eos dolores. Nemo fugit quis dignissimos velit molestiae dolor enim. Consequuntur iure alias nesciunt hic adipisci aspernatur. Qui magnam et sit et omnis minima. Vitae doloremque iure veniam voluptatum. Enim hic quidem odit impedit qui nihil. Sunt assumenda consequatur inventore tempora velit.', '2025-09-22', NULL),
(1567, 'Wayne', 'John', '1957-08-23', '1964-01-20', 'Distinctio qui ullam eos sint dolor neque. Omnis quas quaerat voluptatem architecto rerum. Dolor blanditiis sed magnam. Perspiciatis illo similique quo. Dicta consequatur aut quae.', '2025-09-22', NULL),
(1568, 'Dunst', 'Kirsten', '1980-01-25', '1990-11-02', 'Dolore consequatur voluptatem est autem voluptatem nulla. Sed provident perspiciatis sunt autem. Molestias aperiam laboriosam quo incidunt. Est sed vitae dolorem consequatur fugiat vel recusandae. Quisquam aliquid qui est nostrum voluptas reiciendis id veniam. Dicta est qui excepturi numquam eaque facere.', '2025-09-22', NULL),
(1569, 'Davis', 'Viola', '1949-03-28', '1997-10-11', 'Quaerat et cumque modi modi qui excepturi neque. Ullam ut placeat totam totam asperiores voluptatem. Illum corporis aperiam non quia adipisci. Autem sunt in quod laboriosam aut et. Voluptatibus accusamus dolorem sint neque ratione et. Et quisquam odit quidem magni.', '2025-09-22', NULL),
(1570, 'Firth', 'Colin', '2012-02-11', '2023-02-21', 'Placeat amet odit perferendis autem voluptatem quod. Eum qui quia aut dolorem. Omnis beatae repellendus error occaecati quia enim esse. Corrupti molestiae dolorem accusantium provident voluptatem iste. Accusamus nisi sed quibusdam. Aut voluptates accusamus quas hic. Asperiores nobis alias magnam sed molestiae laboriosam sapiente.', '2025-09-22', NULL),
(1571, 'Belluci', 'Monica', '2006-01-10', '2020-10-08', 'Aut consequuntur natus sit ea odit. Occaecati sint error accusamus in eaque. Omnis labore possimus voluptatem ad esse nihil quasi. Enim mollitia ut corrupti eius reiciendis aut in et. Consequatur tenetur illo voluptates ex. Velit architecto voluptatibus omnis molestias voluptatem eaque.', '2025-09-22', NULL),
(1572, 'Ford', 'Harisson', '1979-08-25', '2012-01-15', 'Iste voluptas tempora maxime est cum perspiciatis provident. Optio nisi et quam numquam vero. Eaque sunt id ut saepe molestias et. Dicta et fugiat sapiente voluptatem ea fugit autem consequatur. Sed quasi ut sed quae veniam maxime.', '2025-09-22', NULL),
(1573, 'Deneuve', 'Catherine', '2000-01-24', '2005-10-29', 'Sunt quia neque quaerat qui saepe qui. Dolorum sint architecto corporis hic. Modi ex aliquid consequatur et. Sequi nobis provident quas ut et maxime facere dolores. Minus accusamus facilis qui dolor magni.', '2025-09-22', NULL),
(1574, 'Larson', 'Brie', '1995-10-09', '2009-07-17', 'Excepturi fugiat minima eligendi dolores quasi. Quia rerum et velit ea distinctio odio qui. Rem labore aliquam occaecati totam. Quae natus et itaque blanditiis id rerum fugiat aliquam.', '2025-09-22', NULL),
(1575, 'Lee', 'Tommy', '1946-10-19', '1987-11-17', 'Esse autem at nihil accusantium et et. Consequatur eius eaque in placeat libero. Atque dolores fugiat molestiae aut sit odit. Qui asperiores voluptates aut ut officia mollitia quo. Est reprehenderit quis laboriosam at aperiam nam repudiandae. Est animi quae maxime voluptatem consequatur voluptatem ut.', '2025-09-22', NULL),
(1576, 'Johanson', 'Scarlett', '2024-08-08', '2025-09-20', 'Aut autem dignissimos voluptate quia laboriosam. Veniam dignissimos beatae quaerat repudiandae occaecati perferendis. Eos consequatur dolorem voluptatem velit. Aut maxime porro quia ea nulla inventore ipsa. Inventore molestias laborum natus dicta eos numquam. Praesentium voluptas ut repellat incidunt deserunt eveniet qui velit. Minima et numquam sit et expedita at voluptatem. Perferendis qui fugit quasi modi.', '2025-09-22', NULL),
(1577, 'Thurman', 'Uma', '2023-02-18', '2024-05-03', 'Magnam quo beatae amet sint eos iusto. Rerum suscipit non eaque eum doloribus ex. Quo necessitatibus quisquam aliquam aut animi praesentium nam repellat. Nemo et autem iusto facilis quidem. Quis fugit repellendus itaque tempore enim ex et.', '2025-09-22', NULL),
(1578, 'Murray', 'Bill', '2011-01-05', '2021-08-20', 'Ducimus recusandae veritatis praesentium est fugiat. Aliquid ex officiis eum aliquid exercitationem aut velit. Omnis sed praesentium facere enim et. Unde nihil et voluptates atque. Voluptatem itaque ipsa ea repellendus.', '2025-09-22', NULL),
(1579, 'Woodley', 'Shailene', '1932-02-27', '1971-02-08', 'Nisi esse odio provident quasi. Sequi amet consequatur illum. Reiciendis voluptatibus quasi laudantium sit. Ab magni accusamus aliquid corporis veritatis ut incidunt. Et quae consequuntur sapiente corporis. Qui rem qui cupiditate earum sit.', '2025-09-22', NULL),
(1580, 'Duvall', 'Robert', '2024-01-30', '2024-04-08', 'Aspernatur error non eum vero. Ad distinctio qui perferendis architecto. Laborum amet maiores non modi consequatur. Et fuga consequatur consequatur vitae et nam. Ut eaque minima impedit mollitia dicta. Voluptatem vel non unde totam aspernatur.', '2025-09-22', NULL),
(1581, 'Farmiga', 'Vera', '1974-11-11', '2004-03-03', 'Quidem aut quia vero. Exercitationem similique aliquam enim occaecati ipsum exercitationem sit eos. Non et exercitationem enim nam. Aliquid necessitatibus id ad qui ab et velit pariatur. Optio pariatur libero quia soluta veniam. Aspernatur non laboriosam eum officiis quibusdam.', '2025-09-22', NULL),
(1582, 'Bergman', 'Ingrid', '2006-09-01', '2022-06-15', 'Explicabo recusandae fugiat exercitationem ipsa magni nihil. Corporis expedita quis perferendis voluptatem ad repellendus qui. Architecto eos quidem voluptatum veniam. Autem sint quia voluptate. Et rerum laborum excepturi. Aut minus repudiandae tempora unde laudantium deserunt laboriosam. Dignissimos non aut ipsum id eaque sed facilis. Deserunt quia fugit optio sed doloribus possimus doloremque. Officiis illum tempora dolores in qui.', '2025-09-22', NULL),
(1583, 'Ahmed', 'Riz', '1965-05-24', NULL, 'Exercitationem magni sit deleniti recusandae nesciunt laudantium quia. Nemo totam et architecto eius et. Neque deserunt minus nostrum cumque. Aut labore aliquam quas voluptas eligendi et. Itaque et aut perspiciatis similique quia. Nesciunt debitis et repellat est veritatis. Ut fugit nulla ut ducimus aut. Nemo deserunt nostrum nesciunt ut aut error labore voluptatibus.', '2025-09-22', NULL),
(1584, 'Spacey', 'Kevin', '1946-07-13', '1993-12-06', 'Non in ab vitae rem in. Tempore et rerum aut quia. Consectetur est soluta natus eaque. Dolores rerum quia optio reprehenderit molestiae cumque voluptatem. Quibusdam aspernatur dolores dolores accusantium ratione aut. Et ipsum qui aliquid amet sit. Corporis fugit nam et sit velit et. Cum amet qui voluptatum sit debitis ea.', '2025-09-22', NULL),
(1585, 'Girardot', 'Annie', '1957-03-09', '1960-10-10', 'Sit amet dolorem et quia. Aliquam dolorum adipisci non alias. Sed et quos et deleniti modi. Perferendis repellendus eum quis error tempora quis. Eveniet tempora molestiae accusamus dolor dicta ipsam molestiae. Dolore impedit voluptatum voluptatum fugit. Ipsum voluptatem quam aliquam officia. Qui mollitia earum magnam ipsum.', '2025-09-22', NULL),
(1586, 'Pesci', 'Joe', '1949-09-17', '1973-11-18', 'Aliquam adipisci consequuntur quaerat laborum cupiditate aut repudiandae. Est quas perferendis provident ipsam. Qui tenetur facere a assumenda. Illum itaque quasi consequatur. Est nobis nisi mollitia error necessitatibus explicabo laboriosam. Est eum repellendus veritatis ab quisquam in. Aut illo ut ab eos porro totam pariatur.', '2025-09-22', NULL),
(1587, 'Swinton', 'Tilda', '1929-05-31', NULL, 'Cumque rerum libero aliquid quaerat atque sapiente. Ut dicta repellendus praesentium. Commodi aut molestias nobis aliquam sequi. Et accusamus iure eum doloremque autem neque. Vel praesentium soluta laborum porro. Minima et praesentium rerum. Recusandae ut dolor natus nihil nobis fugiat quisquam. Nam libero ut rerum aspernatur. Natus quo ex rerum exercitationem expedita ratione.', '2025-09-22', NULL),
(1588, 'Hammer', 'Armie', '1932-09-27', '1941-06-03', 'Rerum necessitatibus laudantium consequatur odit laborum distinctio provident. Maiores necessitatibus consequatur adipisci cupiditate. Voluptatem iste tempore cum rem facilis sed. Autem similique rerum possimus quia qui vitae aut.', '2025-09-22', NULL),
(1589, 'Blunt', 'Emily', '1974-06-23', '2013-04-12', 'Iusto non commodi distinctio accusantium est accusantium vero. Odit sit eius possimus. Aut sed ut occaecati iste quaerat suscipit. Vitae aut atque ut. Eveniet iusto voluptas earum placeat.', '2025-09-22', NULL),
(1590, 'Buscemi', 'Steve', '2013-05-09', '2016-05-12', 'Reprehenderit id eum totam dolores quia. Sunt et repellat in enim. Temporibus numquam tenetur harum sit soluta. Dolorem odio cupiditate quaerat unde est voluptas quae. Accusamus facere pariatur unde quia velit autem explicabo. Et porro consequatur quas quam nostrum sint. Consequatur libero saepe totam labore voluptatem rem.', '2025-09-22', NULL),
(1591, 'Banderas', 'Antonio', '2013-07-04', '2025-09-05', 'Repellat fugiat tenetur consequuntur eum quibusdam voluptatem. Fugiat corrupti sunt sunt nostrum et et tenetur tempora. Similique fuga doloribus officiis et. Sit enim aliquid veniam est itaque quis. Rerum possimus est beatae possimus eius ut tempora excepturi.', '2025-09-22', NULL),
(1592, 'Bernthal', 'Jon', '1936-08-11', '2009-10-18', 'Similique rem et voluptatibus tenetur molestiae commodi. Voluptatem ut aliquam voluptas dicta ut. Eligendi aut et vero fugiat rem numquam numquam consectetur. Quis quibusdam quisquam voluptas voluptates et esse magnam. Autem facilis quia maxime. Iusto culpa magnam sit.', '2025-09-22', NULL),
(1593, 'Affleck', 'Casey', '1969-06-03', NULL, 'Sit quis ut debitis quaerat in. Nam veritatis mollitia consectetur nulla facere ut nobis. Quasi quo sit nesciunt perspiciatis non consectetur. Repellat iusto ullam neque neque. Non mollitia doloribus ut qui ut nesciunt nostrum quis. Ducimus molestias modi praesentium.', '2025-09-22', NULL),
(1594, 'Pacino', 'Al', '1978-03-27', '2014-04-22', 'Exercitationem sed corporis praesentium commodi eum nobis. Molestias excepturi ut similique dolores assumenda voluptates rerum. Error alias autem sint et omnis repudiandae voluptatem. Eveniet distinctio laborum vel ex et ut. Quidem et id non ut at quia.', '2025-09-22', NULL),
(1595, 'Cera', 'Michael', '1957-09-25', '1979-06-24', 'Est nobis et officia deleniti. Optio harum vero occaecati hic. Illum quas culpa omnis ut vel. Saepe magni odio beatae dolores nihil nobis soluta assumenda. Veritatis sit et quae eum similique iste quis. Incidunt mollitia laudantium labore harum libero est numquam. Cumque nostrum ad et cupiditate natus. Aut ratione hic illo aliquid ut illo et.', '2025-09-22', NULL),
(1596, 'Witherspoon', 'Reese', '2016-12-31', '2020-08-09', 'Animi eum est enim non est placeat et. Itaque magnam blanditiis eos qui consectetur magnam. At et provident quae laudantium. Debitis est ipsum omnis commodi delectus consequuntur. Vel velit vitae impedit et porro quaerat reiciendis. Tempora suscipit architecto maiores sed perspiciatis. Unde excepturi quia nemo hic.', '2025-09-22', NULL),
(1597, 'Del', 'Benicio', '1995-10-13', '2005-02-25', 'Fuga voluptatum et magnam praesentium dolorem. Sapiente deserunt ut aut repellat. Dolorum ratione pariatur praesentium est tenetur. Sed voluptas voluptate magnam.', '2025-09-22', NULL),
(1598, 'Leto', 'Jared', '1937-04-17', '1969-04-17', 'Soluta sequi quia exercitationem illo qui. Debitis est velit pariatur laudantium nisi nulla aliquid. Dolor et consequatur voluptas incidunt vel. Qui et est occaecati non nesciunt minus ex et. Ea magni nihil voluptatem dolorem ut. Recusandae qui saepe non asperiores optio. Consequatur esse sit tempore voluptatem nulla. Nobis rerum numquam et ducimus accusamus incidunt neque sit.', '2025-09-22', NULL),
(1599, 'Kidman', 'Nicole', '1929-06-17', NULL, 'Tempore veniam tempora consequatur. Tempore consequatur iusto sit dolores temporibus magnam. Et error nihil pariatur non odio et. Aperiam aperiam iure autem et dolore commodi sit. Eos fugit aliquam aut deleniti at aliquam quasi veniam. Magnam nihil magnam earum in quae iure.', '2025-09-22', NULL),
(1600, 'Alba', 'Jessica', '1963-12-18', '2021-06-18', 'Fugit id ratione perferendis. Commodi amet quae et officiis tempore. Quibusdam aut ipsam ea est. Quod et aut quos rerum. Voluptatem qui sed ut voluptas doloremque eaque qui. Consequatur aliquam qui sed sequi iste praesentium corrupti. Qui voluptatum est sed. Enim laborum a et reiciendis et sint ut. Suscipit nemo minus minus ipsa doloribus itaque sed sed.', '2025-09-22', NULL),
(1601, 'Douglas', 'Michael', '2024-06-11', '2024-07-02', 'Tempore odio corrupti quis. Quasi quasi cupiditate asperiores suscipit. Aut vel commodi dicta omnis nesciunt numquam quia. Optio nobis qui suscipit quia. Eum sint consequatur vel dolorum. Aut illum beatae error et non voluptatem blanditiis. Fuga vel praesentium praesentium. Praesentium corporis repellendus sint aut.', '2025-09-22', NULL),
(1602, 'Brody', 'Adrien', '1951-07-03', '1962-06-04', 'Quaerat omnis quas rerum dolore aut ipsam. Aliquid eum dolore quia non aspernatur tenetur. Odio nisi quis id voluptatem non qui odit. Amet dicta assumenda et vel quod architecto. Unde sunt perspiciatis illo iste consequatur et. Est sed quod non debitis atque quasi libero. Maiores inventore et animi sed et.', '2025-09-22', NULL),
(1603, 'Moore', 'Demi', '2016-09-02', '2019-04-17', 'Corrupti porro sunt explicabo. Molestiae illo repellat maxime aut voluptatum. Voluptas architecto minima sed rerum. Magnam temporibus aspernatur autem aut molestias. Facilis laborum est sequi quisquam molestiae.', '2025-09-22', NULL),
(1604, 'Gadot', 'Gal', '1933-08-25', '2008-09-02', 'Aperiam amet soluta debitis. Quia minima error alias consequatur. Impedit quia temporibus quia quae ut qui. Qui labore dolorem quasi. Quod nemo natus distinctio. Eaque eum quia vitae vero. Odio minus exercitationem laudantium rerum ullam dicta nostrum. Omnis eveniet nulla ex est.', '2025-09-22', NULL),
(1605, 'Jolie', 'Angelina', '1963-05-15', '1981-03-16', 'Voluptatem et et est et et dignissimos qui. Deserunt ipsam aut dolores nam et quam minima. Quas vitae quia alias error recusandae. Ipsa quos aut saepe iste suscipit quas. Magni laudantium quasi quasi velit et eum facilis.', '2025-09-22', NULL),
(1606, 'Wright', 'Robin', '1928-07-26', '1973-10-05', 'Eum tenetur minima veritatis. Voluptatum omnis vel ipsam quidem. Reiciendis qui earum aut sunt. Necessitatibus fugiat provident dolorem aut suscipit occaecati voluptates. Sequi quia et temporibus autem et earum. Aut dolor cupiditate molestiae praesentium temporibus. Harum pariatur dolorem doloribus mollitia velit blanditiis. Doloremque quae deserunt rem. Facilis et consectetur necessitatibus rerum ipsum.', '2025-09-22', NULL),
(1607, 'Knightley', 'Keira', '1994-12-28', '1996-11-02', 'Veniam repellendus veniam officiis iusto dolores quaerat. Ipsa consequuntur iusto suscipit molestiae fuga expedita ut. Voluptas tempore deserunt incidunt numquam voluptatem. Asperiores et aut ut error omnis exercitationem. Occaecati deserunt provident asperiores id a reiciendis nisi. Fugiat qui repudiandae odio nihil et est voluptatum. Sint corporis dolor qui tempora. Ut quis ut quas aliquid blanditiis quidem quas.', '2025-09-22', NULL),
(1608, 'Cooper', 'Bradley', '1995-07-23', '2024-07-29', 'Omnis quas optio non reprehenderit saepe. Ad est odio quod labore aut corporis. Sit nulla sed debitis repudiandae. Velit quia ut rerum omnis. Quo et assumenda aperiam tempora expedita aut quibusdam. Eveniet odit aut voluptas alias repellat adipisci. Illo placeat odio neque et voluptatum necessitatibus. Maxime corrupti et molestiae et. Autem saepe perferendis vel ipsa blanditiis molestiae nam at.', '2025-09-22', NULL),
(1609, 'Dean', 'James', '2003-05-17', '2023-12-07', 'Quasi voluptas itaque qui rerum. Voluptas suscipit enim nostrum rerum dignissimos recusandae. Ipsa minus at laborum est velit. Dolores praesentium aut amet id. Provident tenetur ipsa et ut suscipit. Magni qui ut ex deserunt excepturi.', '2025-09-22', NULL),
(1610, 'Keeton', 'Diane', '2015-10-13', '2017-03-13', 'Quaerat qui impedit fugiat dolorum repellendus ipsa quo voluptatem. In perspiciatis officia et id sit quia praesentium. Exercitationem dolorem et et eveniet nihil beatae at. Commodi quas ratione vel id ut ut et. Velit nobis numquam vel iusto. Libero non autem natus omnis. Quam et qui provident quo culpa est ipsa.', '2025-09-22', NULL),
(1611, 'Penn', 'Sean', '1980-10-02', '2016-11-12', 'Iste eos error sunt consequatur quidem consequuntur porro temporibus. Officia reprehenderit et quis eum aut. Aut hic facere fugit explicabo. Delectus eos quia distinctio voluptate eos temporibus. Pariatur id aperiam itaque id rem qui accusamus. Et qui magni et dolorum sint sed sunt. Ut asperiores sed quos qui sint. Aliquid temporibus ipsam dolor quia aut ab. Natus corporis minus molestiae in cum recusandae minima facere.', '2025-09-22', NULL),
(1612, 'Keaton', 'Diane', '1953-12-20', '1975-10-17', 'Natus officia ut nihil eveniet facere et. Asperiores aut est in iusto rerum est. Reiciendis in nam laudantium aut quidem. Provident aut nesciunt et recusandae maxime. Possimus voluptas maiores accusamus aut est voluptatem. Rerum est nesciunt perferendis et quisquam cumque et.', '2025-09-22', NULL),
(1613, 'Gibson', 'Mel', '1937-01-03', '1979-07-18', 'Doloribus quia quia ut blanditiis voluptas. Eum qui dolores tenetur. Rerum voluptatibus enim voluptatem iusto. Impedit perspiciatis quibusdam ut ut vero vel.', '2025-09-22', NULL),
(1614, 'Novak', 'Kim', '1961-09-04', '2014-04-15', 'Quasi labore explicabo vero accusamus qui aperiam rem. Velit tenetur libero corrupti tempore. Adipisci eos deleniti quas. Nulla et nam in amet. Fuga est qui qui et aut voluptatem veniam. Dolores expedita praesentium incidunt facilis et qui. Non delectus tempore ex quisquam voluptas. Et ut et inventore corporis temporibus rerum.', '2025-09-22', NULL),
(1615, 'Hamm', 'Jon', '1930-11-19', '2005-01-15', 'Voluptates id in inventore repellendus repellendus. Quos et inventore sed quas voluptate ex repellendus. Perferendis eum qui asperiores aut. Perspiciatis sed beatae et omnis quae provident est consequatur. Ut nostrum ut excepturi consequatur amet dignissimos aliquid. Ipsam veritatis aut nam non commodi tempore id sed. Quo illo voluptas itaque animi iusto eligendi quia.', '2025-09-22', NULL),
(1616, 'Tautou', 'Audrey', '1988-06-16', '2014-02-07', 'Quo omnis sit odit praesentium deleniti impedit. Ex non ad explicabo reprehenderit aperiam. Fuga et perferendis fuga quidem reiciendis assumenda sit. Nisi assumenda aliquam accusantium at facere fuga aperiam aut. Accusamus et hic itaque voluptatem ipsum quis. Quo non fugiat qui nobis veniam quam vel. Aliquid et modi eos doloribus. Itaque laudantium odit quos vel voluptatibus. Sint repudiandae voluptatem voluptatem aliquam enim ut.', '2025-09-22', NULL),
(1617, 'Hardy', 'Tom', '1985-01-24', '2000-08-13', 'Eum consequuntur et dolorem quidem quisquam facilis. Quo ab pariatur voluptatem. Amet expedita dolore quo esse natus tenetur. Voluptatem asperiores dicta ex ea eveniet. Rerum et magni asperiores voluptatem voluptates. Quod est natus delectus odio aut.', '2025-09-22', NULL),
(1618, 'Ledger', 'Heath', '1955-01-22', '1956-03-20', 'Et dolorum et alias et placeat occaecati eos cumque. Numquam et similique expedita temporibus repudiandae culpa. Perspiciatis nam aut totam dignissimos unde aut fugit. Exercitationem incidunt dicta ut totam debitis laborum in. Corrupti harum deleniti et necessitatibus reiciendis nam. Quo iste molestiae voluptatibus et. Qui ab est nostrum repellendus quam id et.', '2025-09-22', NULL),
(1619, 'Serkis', 'Andy', '2002-12-29', '2008-11-11', 'Optio aperiam ad laudantium consequatur facere. Sed deserunt est impedit perspiciatis sunt eos est corrupti. Aut aut autem qui nulla. A laudantium placeat labore molestias rerum a amet.', '2025-09-22', NULL),
(1620, 'McDormand', 'Frances', '1988-12-23', '1990-05-14', 'Et consequuntur ad sapiente quisquam. Non pariatur voluptatem veritatis qui error omnis est numquam. Provident quae magni blanditiis voluptatibus iste non. Qui iste eos facere animi. Necessitatibus et et hic tenetur illo facere. Quis totam iure ipsam id aliquid veniam. Eveniet est et in a ipsam quos sed.', '2025-09-22', NULL),
(1621, 'Gosling', 'Ryan', '1970-01-30', '1974-04-22', 'Repudiandae debitis et nostrum non est. Magnam rerum quos voluptatem porro quia ex. Suscipit ut voluptate eum consectetur aut. Fuga aliquid sint voluptas. Rem sapiente non expedita facere debitis.', '2025-09-22', NULL),
(1622, 'Jones', 'Felicity', '1964-07-09', '2003-07-05', 'Omnis omnis omnis quidem voluptatem dolorem. Ducimus illum eveniet illo aut qui qui. Quae sunt earum ut architecto perspiciatis voluptas non. Quo quod omnis molestiae fugiat et minima voluptas. Eligendi qui pariatur iusto alias. Ullam libero nihil repudiandae voluptatem dolorum quidem. Nisi voluptatem eum corrupti et quos dolor possimus.', '2025-09-22', NULL),
(1623, 'Theron', 'Charlize', '2011-10-10', '2023-08-10', 'Quia doloremque vel recusandae ea. Qui rerum omnis quae quam. Aut voluptatem ut qui. Ut tempore laborum neque qui voluptas modi. Adipisci delectus iste temporibus dolorum doloremque aspernatur rerum illum. Voluptatem vitae est voluptas repudiandae aut sequi voluptas voluptatem.', '2025-09-22', NULL),
(1624, 'Walken', 'Christopher', '1971-11-12', '1984-02-26', 'Illum sunt quis incidunt qui. Exercitationem suscipit dicta recusandae. Enim veniam laudantium et nam. Repudiandae est accusantium sit saepe qui dignissimos. Qui doloribus ut illum veniam dignissimos accusantium.', '2025-09-22', NULL),
(1625, 'McKellen', 'Ian', '1940-08-13', '2023-12-16', 'Iusto corrupti praesentium blanditiis enim aut. Modi quo omnis saepe est maxime et. Est nemo odit quibusdam laudantium ut ipsam. Sint blanditiis autem odio sunt ut sequi dolorem laborum. Adipisci ut necessitatibus nemo.', '2025-09-22', NULL),
(1626, 'Carell', 'Steve', '1935-05-22', '2022-02-26', 'Placeat iure nobis mollitia accusantium at dignissimos consequatur. Pariatur in omnis dicta quibusdam ratione voluptatum. Id sit illo minima dolor officia facilis. Sunt totam quia beatae labore. Vel vel cumque eaque iusto eum cum et.', '2025-09-22', NULL),
(1627, 'Fisher', 'Carrie', '1982-12-15', '1999-03-22', 'Sapiente ex dolores quibusdam inventore. Et repellat error voluptatem saepe amet dignissimos blanditiis. Laboriosam ullam aspernatur exercitationem laborum repudiandae qui sint quibusdam. Ex maxime tenetur aperiam et.', '2025-09-22', NULL),
(1628, 'Douglas', 'Kirk', '1942-11-04', '1979-08-11', 'Architecto officiis ut voluptatum. Et non ut sunt provident rerum voluptates. Rerum dolore dignissimos consequatur sapiente expedita. Voluptas magni quo veritatis ea sunt commodi qui.', '2025-09-22', NULL),
(1629, 'Louis-Dreyfus', 'Julia', '1947-12-09', '2004-07-04', 'Voluptatem et nihil quidem nihil et. Omnis omnis recusandae animi hic iste numquam voluptate. Aut repellendus minus error voluptas consequatur. Sapiente omnis repudiandae ratione et earum temporibus. Reiciendis voluptatem nobis et sit. Aut dolor quia explicabo deserunt unde dolorem. Veritatis ut ipsam quia excepturi saepe voluptatem. Dicta nostrum ratione ad ea.', '2025-09-22', NULL),
(1630, 'L.Jackson', 'Samuel', '2024-05-11', '2024-10-10', 'Nisi tempore voluptas et vero. Dolorum hic ipsum ipsum quia laudantium. Culpa dolores quasi neque accusamus autem et odit et. Adipisci voluptates sit ut repudiandae. Pariatur sed quisquam quidem ad dolore qui.', '2025-09-22', NULL),
(1631, 'Pike', 'Rosamund', '1986-09-26', '2006-08-15', 'Voluptatem quos voluptate quisquam neque velit impedit dolor. Distinctio placeat optio repellat eos. Sequi voluptatem eligendi assumenda laboriosam eveniet odio. Repellat et eum cupiditate id ipsam quidem autem. Dolores veritatis eos perspiciatis odit. Et dolorem assumenda dolor eius eaque. Et ipsam sed totam vel consequatur. Corrupti aut ipsa nulla molestiae.', '2025-09-22', NULL),
(1632, 'Redford', 'Robert', '1940-08-17', NULL, 'Veniam veritatis consequatur ut consequatur. Velit officia vel ea sint est dolorem. Sint et est ea excepturi sequi. Officiis et iure omnis corrupti cumque.', '2025-09-22', NULL),
(1633, 'Farrow', 'Mia', '1974-03-16', NULL, 'Reprehenderit mollitia perferendis ut. Aut error tempora adipisci ad. Et dolores eos similique optio eos aut. Fugiat minima molestiae suscipit accusantium. Consequatur nostrum quia quibusdam minima nemo. Quo suscipit nisi quae quaerat rem. Quam natus voluptatem rerum quos hic. Rem nam quia dolorum non nam quisquam.', '2025-09-22', NULL),
(1634, 'Tyler', 'Liv', '1969-02-27', '1996-10-03', 'Voluptas corporis enim quia molestiae sit ratione sint exercitationem. Maxime suscipit odio sint quia. Consequuntur sit accusantium voluptatum temporibus inventore pariatur exercitationem. Nisi optio assumenda facilis distinctio laudantium. Veniam similique blanditiis quae totam. Accusamus fuga molestias corporis eveniet ipsum eaque. Et ad itaque itaque autem.', '2025-09-22', NULL),
(1635, 'Chalamet', 'Timothée', '1952-02-23', '2019-10-17', 'Dolorum eos inventore ut sint et. Quasi et ut sint suscipit voluptatem. Aut minus itaque ea saepe tenetur quod aut aut. Sint autem aperiam velit voluptatem enim officiis. Itaque accusantium sint voluptatibus.', '2025-09-22', NULL),
(1636, 'Seymour', 'Philip', '2004-04-29', '2004-12-03', 'Tenetur enim ea quo est. Laudantium fugit deserunt commodi rerum. Eum dolor perspiciatis unde quidem nostrum dolorum provident laboriosam. Qui amet adipisci in modi. Sed et eos minus perspiciatis et inventore ipsam. Reiciendis quod sint et est quaerat beatae. Repellendus ipsum debitis facere aliquam sit temporibus molestias. Aut fugiat dolorum explicabo magnam dolor. Alias nisi voluptas a est.', '2025-09-22', NULL),
(1637, 'Cotillard', 'Marion', '2006-07-01', '2025-07-13', 'Id voluptatem aut necessitatibus beatae. Iste labore maxime nam. Culpa quasi vel debitis est doloremque totam. Quibusdam pariatur ut aut aut perspiciatis ea quia. Eos sit rerum similique architecto unde exercitationem.', '2025-09-22', NULL),
(1638, 'Robbie', 'Margot', '1933-11-30', '2007-12-05', 'Fugiat facere similique cum eaque ad. Consequuntur atque reprehenderit necessitatibus quas quis aut totam. Eos cumque vel ipsa sequi mollitia. Nostrum iusto totam esse nobis qui quo. Quasi repudiandae numquam beatae perferendis tempora. Qui odit officia officia et laborum natus et veritatis. Adipisci vitae consequatur cupiditate dolore expedita inventore sunt.', '2025-09-22', NULL),
(1639, 'Hill', 'Jonah', '1991-03-08', '1994-06-03', 'Dolorem iure distinctio iste et. Sunt doloribus voluptatem ullam sed. Excepturi quis soluta in. Inventore voluptas vero doloremque nihil sunt dicta. Asperiores eius eos laboriosam sed.', '2025-09-22', NULL),
(1640, 'de', 'Ana', '1987-01-17', '1993-05-29', 'Nobis voluptatem voluptates eos sapiente. Eum omnis reprehenderit ut et dolore facilis. Nobis corporis autem quos aliquid nostrum excepturi ad. Quod enim quidem non exercitationem vel sapiente accusantium. Accusamus dolorem ut est et. Illo provident accusantium quibusdam at enim ab asperiores. Voluptatem ut dolorem aut et aperiam repellat tempore impedit.', '2025-09-22', NULL),
(1641, 'Mara', 'Kate', '1996-08-19', '2015-05-16', 'Neque consequatur iusto est voluptates in assumenda. Minima minima rerum voluptatem ut qui debitis ducimus. Nihil pariatur cupiditate impedit et non assumenda animi. Sunt omnis et nulla. Et molestias ut consectetur. Ipsum nulla dolorem nobis dolor illum et laboriosam. Sunt nihil eos occaecati debitis eos dolorum laudantium recusandae.', '2025-09-22', NULL),
(1642, 'Stewart', 'James', '1998-07-27', '2017-02-04', 'Minima reiciendis est eum aut. Et qui excepturi voluptatum. Hic iste consequatur vero corrupti earum accusantium. Ab rem mollitia distinctio voluptates voluptatem. Distinctio recusandae itaque et.', '2025-09-22', NULL),
(1643, 'Maguire', 'Tobey', '1942-06-01', '1943-09-06', 'Nisi magni excepturi voluptate illum et sequi rem. Ducimus non officia at itaque possimus dolores. Quidem ea sit aperiam dolores. Tempore ex enim adipisci fugiat vel aut. Dolore tempore cumque ut doloremque at laborum quibusdam.', '2025-09-22', NULL),
(1644, 'Owen', 'Clive', '1949-04-19', '1976-10-17', 'Ut et voluptas sed eum similique ea nobis est. Non in saepe quis repellendus ad. Accusantium ut perspiciatis facere voluptas quasi consequuntur. Sit at deleniti enim magni temporibus tenetur est. Dolorum molestiae repellendus porro minima pariatur esse. Totam architecto soluta omnis consequatur exercitationem tenetur sit. Tempore amet aliquid laborum enim necessitatibus. Dolorem id vero id magnam.', '2025-09-22', NULL),
(1645, 'Mara', 'Rooney', '2000-10-09', '2003-01-28', 'Illum voluptatum sint commodi optio. Eveniet qui rerum quas pariatur qui. Iusto sit repellendus ducimus et omnis quos cupiditate. Blanditiis cupiditate ut sunt fugiat sit quasi magni. A vel minus exercitationem tenetur odit quisquam illo. Ipsum similique qui totam eum pariatur dolor.', '2025-09-22', NULL),
(1646, 'Kendrick', 'Anna', '1975-02-01', '1984-03-26', 'Velit tempora earum accusantium voluptatem. Et nam vitae labore eius. Eveniet neque et eaque ratione. Corporis quae animi fugiat suscipit nihil. Voluptatem aperiam quae aspernatur. A quis aperiam in quaerat quia a adipisci.', '2025-09-22', NULL),
(1647, 'Driver', 'Adam', '1948-04-16', '2004-07-13', 'Rem id labore rerum consequatur atque. Culpa in nihil voluptates asperiores dignissimos dolor. Dolore dolores fugit quia et doloremque quisquam. Asperiores ipsam et enim et aut ducimus placeat. Incidunt velit veritatis enim enim saepe est quia. Voluptatem et eaque quisquam quo adipisci et. Veritatis qui voluptatem veritatis optio enim. Eum qui asperiores blanditiis adipisci fuga.', '2025-09-22', NULL),
(1648, 'Keitel', 'Harvey', '2006-03-21', '2017-12-22', 'Qui repellat voluptas est velit sequi. Et ut dolore accusamus voluptas nemo rerum. Maxime ipsa eum eaque repudiandae vero consequatur animi id. Eius soluta esse quo molestiae et commodi. Quibusdam velit commodi qui magnam ipsam quis. Enim et est sint cumque qui odit dolor quod.', '2025-09-22', NULL),
(1649, 'Stone', 'Emma', '1986-11-06', '2018-02-06', 'Iste praesentium quas et hic ea. Adipisci saepe reprehenderit quasi ratione eaque. At ex incidunt blanditiis fugiat assumenda modi recusandae. Rem quisquam necessitatibus at corporis earum qui. Quia esse est deleniti repudiandae rerum. Iusto aut voluptas quibusdam. Eum distinctio magnam beatae. Velit nihil et neque odit dolores asperiores facere.', '2025-09-22', NULL),
(1650, 'Colman', 'Olivia', '1937-08-05', '1973-12-08', 'Nihil eos eum mollitia consequatur culpa nihil cupiditate. Blanditiis voluptatem quo qui eos est porro dolor. Tempora nostrum perferendis quis consequatur sed. Voluptate possimus temporibus et dignissimos. Est rerum esse voluptates ratione repudiandae nisi libero.', '2025-09-22', NULL),
(1651, 'Weaver', 'Sigourney', '1966-01-14', '1984-04-26', 'Pariatur expedita eligendi ut magnam. Error quis nesciunt eum molestiae id quod. Ipsa voluptas tenetur provident odit ipsa. Voluptas tenetur non veritatis. Occaecati odio error laboriosam quas laboriosam vero est. Delectus officia voluptas sed aut. Beatae dolores molestias sit. Voluptas a dolores laudantium et.', '2025-09-22', NULL),
(1652, 'Streep', 'Meryl', '1951-02-08', '1976-12-14', 'Qui excepturi nulla at est. Perspiciatis possimus et consequatur quia est voluptas. Quia nihil ut commodi minus. Incidunt in velit modi expedita.', '2025-09-22', NULL),
(1653, 'Aniston', 'Jennifer', '2025-05-24', '2025-09-13', 'Aspernatur voluptas qui maxime distinctio. Quis et dolorum aliquid exercitationem ea quae ut. Sit voluptates aut facilis aut eligendi sint autem. Voluptas neque ab numquam sit. Aliquid quos provident natus aut assumenda quisquam perferendis qui. Occaecati est ad quam tenetur aut eos.', '2025-09-22', NULL),
(1654, 'Laurent', 'Mélanie', '1967-10-16', '1999-12-28', 'Officia nulla temporibus dolore qui. Vitae nam qui odio et corrupti. Omnis non ipsum rerum ut. Repellendus totam natus ullam minus. Dolor suscipit consequatur molestias eos est.', '2025-09-22', NULL),
(1655, 'Cohan', 'Lauren', '2014-12-13', '2015-09-21', 'Labore mollitia nemo occaecati pariatur eos voluptatum asperiores suscipit. Ipsam fugiat qui voluptas praesentium et ut. Maxime aspernatur quo laborum a iusto ut corporis. Tempora eos reprehenderit non iusto. Corporis eos ipsa voluptatibus repellat aut. Similique animi optio harum aut consequatur natus impedit. Praesentium voluptatum sit et voluptatem. Ut vitae ducimus ipsum quia.', '2025-09-22', NULL),
(1656, 'Russel', 'Kurt', '2005-03-21', '2012-05-21', 'Doloremque eveniet beatae explicabo voluptatibus. Est illum adipisci quasi sed dolor. Quia dolore aperiam tenetur quam. Atque veritatis possimus officiis ratione minus dolorum.', '2025-09-22', NULL),
(1657, 'Shannon', 'Michael', '1998-05-08', '2018-07-10', 'Vitae id officiis error cum. Molestiae possimus odio aut soluta non ipsum voluptates. Mollitia accusamus molestiae minima. Odio sit voluptatem non soluta reiciendis ducimus commodi. Tempora deserunt dolore labore ut architecto tempore est. Saepe laboriosam voluptatem et iste. Aut numquam sunt et expedita.', '2025-09-22', NULL),
(1658, 'Dano', 'Paul', '1929-10-14', '1991-04-10', 'Dolorem eligendi illo dolorem laboriosam voluptatem minus. Non doloremque ipsam deserunt id veniam. Rerum ex ut debitis. Aut ipsa beatae earum blanditiis. Sed delectus nesciunt eligendi dolor. Omnis rerum sunt assumenda soluta aut cumque magni. Laudantium et amet sint enim animi mollitia.', '2025-09-22', NULL);
INSERT INTO `actor` (`id`, `lastname`, `firstname`, `dob`, `dod`, `bio`, `created_at`, `photo_id`) VALUES
(1659, 'Neeson', 'Liam', '1979-06-28', '2017-11-29', 'Nesciunt voluptatum maxime autem dicta repellat nesciunt culpa. Reprehenderit et ipsum sed sit quibusdam. Rerum ullam dolore beatae error libero. Id veritatis quasi a ut.', '2025-09-22', NULL),
(1660, 'Winslet', 'Kate', '1977-03-18', '1986-06-22', 'Quia facilis voluptas ipsum temporibus vero. Ut laboriosam sit vel ducimus incidunt eos dolores. Doloremque et commodi sunt quis et. Cupiditate qui repudiandae optio. Aut autem eos quibusdam molestiae est. Quaerat optio natus voluptatem iusto. Suscipit harum ea ipsum aut. Eius non ut occaecati voluptatem iure nam ducimus tenetur. Culpa enim et voluptas ab quibusdam dolore enim debitis.', '2025-09-22', NULL),
(1661, 'Damon', 'Matt', '1968-10-27', '2020-12-13', 'Qui temporibus magnam nihil quo. Deserunt veritatis a illum voluptatem atque quo. Voluptas est facere vel et. Vel assumenda ut neque harum ut excepturi non. Saepe animi dolor necessitatibus et ex minus doloremque.', '2025-09-22', NULL),
(1662, 'Watson', 'Emma', '1982-04-04', '2018-10-05', 'Aut tempore nulla laborum deserunt sed sit. Porro atque fugiat quia ut repudiandae aliquid deserunt. Saepe dolorem doloremque cupiditate officia. Omnis odio et laborum fugiat facere eos facilis autem. Ducimus provident similique officia.', '2025-09-22', NULL),
(1663, 'Winnick', 'Katheryn', '1939-09-05', '2002-08-04', 'Aliquam est voluptatum delectus neque laudantium exercitationem. Iure autem sit veritatis voluptate debitis qui ut. Rerum rerum alias vero libero. Earum minima voluptate iure. Eius corrupti sequi natus. Est ipsa reprehenderit dicta itaque quas ipsum.', '2025-09-22', NULL),
(1664, 'Oldman', 'Gary', '1944-02-25', '2008-08-23', 'Sit fuga quasi doloribus aut voluptatem. Eum beatae illum blanditiis iusto quibusdam corporis. Similique sapiente eos nemo distinctio velit rerum natus. Nostrum eos et ut et laboriosam esse numquam. Ducimus dolorem id omnis quia.', '2025-09-22', NULL),
(1665, 'Lawrence', 'Jennifer', '1976-03-03', '1983-08-27', 'Iure excepturi tenetur tempora eos iste ipsa sequi modi. Qui aut at asperiores magnam sapiente et. Ducimus accusamus omnis inventore deleniti sint autem. Tenetur minus assumenda illo autem nesciunt. Consequatur nulla quo eos nobis et. Excepturi rerum ea laudantium atque.', '2025-09-22', NULL),
(1666, 'Duvall', 'Shelley', '1996-12-09', '2013-03-07', 'Quos ratione eligendi quo eius quam. Aliquid modi asperiores alias aut accusantium. Nihil reiciendis nam totam placeat repellat. Rerum saepe minima aperiam nulla. Nostrum aut pariatur sequi quo. Unde ea harum optio distinctio non. Porro delectus quam excepturi consequatur. Illo eligendi blanditiis sint rerum at enim dolorem.', '2025-09-22', NULL),
(1667, 'Eastwood', 'Clint', '1950-12-27', '2012-12-28', 'Sunt deserunt qui consectetur. Consequatur quo voluptatem deserunt ipsum. Sunt et id autem maxime qui provident corporis. Sit ipsam officia quo in ipsam. Magni illum assumenda et non. Inventore est fuga iure et pariatur odit. Aut ducimus qui sapiente dolor expedita quisquam excepturi. Maiores veniam sit omnis consequatur dicta voluptatem.', '2025-09-22', NULL),
(1668, 'Ronan', 'Saoirse', '1976-07-30', '1991-05-28', 'Veritatis ut ullam culpa eveniet cumque. Animi rerum incidunt ut doloribus. Ducimus quia at autem. A eos rem labore ipsum et ea nihil. Neque ut nostrum ut amet eum.', '2025-09-22', NULL),
(1669, 'Whitaker', 'Forest', '2001-08-14', '2002-02-11', 'Veniam ut nostrum sit quasi possimus expedita molestiae voluptatem. Repudiandae illum dolore sequi dolorem ipsum sunt. Corporis rerum nesciunt molestiae et. Aliquid aut inventore voluptates.', '2025-09-22', NULL),
(1670, 'DiCaprio', 'Leonardo', '1952-11-14', NULL, 'Magnam aut quia et id et quis. Sequi doloremque voluptatem corporis culpa quia vel. Est unde voluptatibus et natus recusandae id. Temporibus sunt quis natus. Nobis a ducimus provident et rerum consequuntur. Sit ducimus similique molestias perferendis numquam. Perferendis cumque expedita et id facilis non est. Quasi repellat ullam qui ut hic. Enim ut corrupti qui libero quaerat quia consequatur voluptas.', '2025-09-22', NULL),
(1671, 'Hannah', 'Daryl', '2006-11-11', NULL, 'Nihil dolorem perferendis dolorem laudantium sed beatae porro numquam. Eos non consectetur repudiandae porro. Et ut ipsam est velit et. Aperiam ipsum minus eveniet sunt aperiam. Modi voluptate nesciunt sit dolorem hic.', '2025-09-22', NULL),
(1672, 'Roth', 'Tim', '2005-08-18', '2022-11-18', 'Omnis nulla ducimus sit tempore. Quam rerum ut neque inventore voluptatem dolor velit. Ab delectus modi dolorem vitae. Exercitationem qui sint earum debitis quaerat ut accusamus necessitatibus. Tempora autem a nostrum alias. Aliquid et tempore quibusdam minima dignissimos voluptas. At eaque omnis facere fuga libero atque.', '2025-09-22', NULL),
(1673, 'Hathaway', 'Anne', '2023-12-11', '2024-12-22', 'Sunt aliquam vel aut amet temporibus est molestiae. Minima quae expedita similique officia dolorum. Fugiat culpa ut inventore beatae cum iusto. Eos et repudiandae quod reiciendis cum. Dicta sit illum tempora quis officia porro. Nisi sunt quisquam ullam veniam est. Quo beatae quia et.', '2025-09-22', NULL),
(1674, 'Roberts', 'Julia', '1965-07-20', '1967-04-08', 'Ratione consequatur sint in ratione autem aliquam dolor molestiae. Voluptatem aut eligendi molestiae quis sequi omnis. Quis maiores alias molestiae rerum voluptatem eos eos. Corporis saepe possimus voluptatibus velit. Velit tempora qui repellendus. Facere porro odit voluptas sit.', '2025-09-22', NULL),
(1675, 'Goodman', 'John', '1933-10-02', '1954-08-18', 'Blanditiis placeat dolor at commodi dolor sunt rerum. Voluptatem aut repudiandae minima nihil. Excepturi necessitatibus eos laborum odio numquam eligendi. Et natus est dolores et minima. Sed aut ducimus nam quia. Similique similique ullam culpa hic porro et. Eligendi blanditiis placeat repellat. Molestiae exercitationem eius sit iusto a et quis.', '2025-09-22', NULL),
(1676, 'Nicholson', 'Jack', '1992-02-24', '2009-11-26', 'Est est eum fugiat id cupiditate molestiae alias. Voluptatem in omnis et perferendis sunt impedit dicta similique. Eos autem consequuntur quia minima. Dolor quia qui ut veniam. Cum quaerat quo vel placeat. Sit perspiciatis nostrum necessitatibus officia qui perspiciatis. Veritatis odit asperiores aut eaque repellendus sint dolor. Velit aut natus ut fuga.', '2025-09-22', NULL),
(1677, 'Branagh', 'Kenneth', '1943-09-25', '1949-09-29', 'Consectetur quod tempore quam laboriosam. Non iusto qui officia quisquam. Eos quidem occaecati modi aut voluptatibus iusto nulla. Ab iure omnis quibusdam esse. Quia omnis ut enim quo dolor molestias sit ipsam. Assumenda recusandae voluptatem omnis excepturi earum voluptatum nesciunt veritatis. Qui aut eos aut corrupti iste dolores. Quis commodi laboriosam saepe possimus asperiores tempora.', '2025-09-22', NULL),
(1678, 'Irons', 'Jeremy', '1956-03-17', '1982-07-29', 'Voluptatibus aut sit quos sed eaque quis. Excepturi vitae quae quas soluta dignissimos non. Ducimus deserunt optio necessitatibus autem repellat corrupti velit. Cum veniam et rerum expedita consequuntur nisi. Harum laboriosam voluptate aut soluta. Rem iure qui aut facilis id laboriosam. Quisquam tenetur temporibus nam ab fugiat. Inventore eum voluptas sed provident illo ut. Voluptas quas architecto eum quibusdam ducimus et.', '2025-09-22', NULL),
(1679, 'Darc', 'Mireille', '2017-08-01', '2023-02-06', 'Dolorum dolore qui sit atque. Animi iste ullam ut quaerat iure dolore. Cumque id vel quia hic amet nobis. Perspiciatis fuga rerum est est dolore. Incidunt est et est esse ipsam et ut. Praesentium aut eos iure maiores beatae et.', '2025-09-22', NULL),
(1680, 'Reno', 'Jean', '1976-01-04', '2001-08-21', 'Ea ut voluptas voluptatum facilis id. Vitae repellendus repellendus sapiente molestias. Architecto eum ipsa a sit. Qui iure numquam totam et quae neque. Eaque nemo ea iusto facilis dolorem.', '2025-09-22', NULL),
(1681, 'Dujardin', 'Jean', '1997-07-26', '2013-09-16', 'Suscipit saepe ipsum delectus. Ut voluptatem cupiditate eum officia molestiae. Eaque nisi consequuntur eos voluptate recusandae excepturi. Suscipit vel distinctio incidunt sapiente velit voluptatum reiciendis. Hic magnam omnis nesciunt nostrum. Molestias atque quo adipisci in.', '2025-09-22', NULL),
(1682, 'Moore', 'Juliane', '2005-11-16', '2011-10-25', 'Eum neque sint perferendis praesentium. Sunt quasi alias est excepturi iusto sunt. Aliquid ut quaerat consequatur aut quibusdam. Sit quia qui dolores dolor vel. Dolorum non doloremque iusto sunt nobis.', '2025-09-22', NULL),
(1683, 'McConaughey', 'Matthew', '1938-02-19', '2005-08-04', 'Est qui quisquam eos at quia culpa maiores. Optio quis debitis laborum. Amet natus veniam aut. Accusantium quia itaque ut placeat dolorem amet quasi.', '2025-09-22', NULL),
(1684, 'Allen', 'Woody', '2003-01-23', '2023-05-20', 'Rerum quo voluptatum autem dolorem. Est soluta doloremque maiores odio sint vel provident. Laudantium iure veritatis sequi iure. Et sed est itaque illo dolore sed explicabo. Totam placeat et quibusdam earum quia omnis et suscipit. Deserunt tempora consectetur nobis esse laboriosam et.', '2025-09-22', NULL),
(1685, 'Eisenberg', 'Jesse', '1967-11-25', '1968-06-17', 'Sunt velit pariatur dolor et unde quia. Consequatur animi sit et porro sunt impedit ipsa a. Nihil repellat iure illo. Vero voluptates quia voluptates et nesciunt libero. Molestias est consequatur omnis velit enim ipsam. Ut iusto praesentium neque perferendis perferendis quae et et. Repellendus a consequatur ad dolorem ut dolorem. Quaerat sint dignissimos esse animi.', '2025-09-22', NULL),
(1686, 'Fox', 'Jamie', '2018-09-23', '2023-05-17', 'Sunt omnis beatae officia molestiae. A ut possimus dolor non atque voluptas voluptatibus. Ipsum et incidunt quas sit. Neque cupiditate voluptas consequuntur minima. Voluptas itaque placeat fuga et. Quia reiciendis qui reiciendis perspiciatis libero et nobis.', '2025-09-22', NULL),
(1687, 'Mulligan', 'Carey', '2000-02-28', '2006-09-04', 'Eos ut odit et laborum. Nam dolore unde iure ut ut qui perspiciatis. Hic eius tempore veniam voluptas. Et dolorem non voluptates adipisci velit. Debitis eos veniam quia voluptates minima nobis. Et dignissimos est voluptatem est atque vel. Cum magni velit veniam sint corporis ut modi. Magnam blanditiis cupiditate ut impedit sed qui.', '2025-09-22', NULL),
(1688, 'Bardem', 'Javier', '1944-04-18', '1984-06-28', 'In accusantium illo officia amet. Repellendus et harum ad eveniet voluptates quia numquam. Laborum minus asperiores accusantium assumenda. Error blanditiis amet ut voluptatem. Ea asperiores non ipsa sunt mollitia. Ullam et magnam tenetur sequi quae. Dignissimos adipisci tempora ut. Non iste in eius quaerat.', '2025-09-22', NULL),
(1689, 'Spencer', 'Octavia', '2005-03-15', '2022-03-14', 'Illo quibusdam consequatur nulla commodi vel beatae dolores. Consequatur quia quos repudiandae. Consequatur id dolor expedita occaecati. Est blanditiis labore reiciendis quas consequuntur repellat.', '2025-09-22', NULL),
(1690, 'Stone', 'Sharon', '1982-03-14', '1997-05-22', 'Similique eveniet et officiis explicabo sunt minus necessitatibus. Qui occaecati porro incidunt amet. Voluptatibus velit sed aut nihil. Voluptas impedit non velit et vitae. Hic est quam autem ipsa ex. Id iure aut quisquam nulla fugiat dolores molestiae. Minus id natus sint aliquam. Labore placeat sint voluptas excepturi atque. Architecto et nostrum cumque.', '2025-09-22', NULL),
(1691, 'Brando', 'Marlon', '1957-12-27', '1989-08-11', 'Est ratione facilis voluptas repellendus eveniet enim cum. Sequi ut qui sed vel nisi ut esse. Sit temporibus minus laborum amet est. Odit cum esse aliquam eos. Voluptatem voluptate ut saepe et qui architecto cum. Pariatur facilis nam ea eligendi expedita ipsum ducimus. In dolore omnis placeat qui. Veniam magni ut id odio. Quos provident nostrum consequatur sit dignissimos.', '2025-09-22', NULL),
(1692, 'Dietrich', 'Marlene', '2002-06-26', '2023-01-08', 'Fugit itaque odio accusantium qui. Necessitatibus hic quod sit facilis quo ratione. Eum repellat praesentium enim voluptatem non nulla. Vel aliquam dolor ullam sit doloribus ut enim. Nulla aut aliquam est recusandae eligendi.', '2025-09-22', NULL),
(1693, 'Bonham', 'Helena', '2010-03-21', '2017-01-20', 'Autem quis dolores dolor cumque dolor. Non labore dolorem dignissimos ad sit non incidunt. Corporis nesciunt nobis possimus repellat cum earum ea sint. A quidem optio nam excepturi. Rerum aut quam perferendis praesentium magnam optio a aut. Perferendis autem deserunt sed temporibus minima suscipit qui.', '2025-09-22', NULL),
(1694, 'Pitt', 'Brad', '2016-08-31', '2017-10-28', 'Neque nam dolorum ut non. Omnis assumenda voluptatibus soluta nobis quam ut nisi. Ex et suscipit consequatur illum qui. Est cupiditate delectus eos eum atque expedita. Sint saepe voluptatem id.', '2025-09-22', NULL),
(1695, 'Basinger', 'Kim', '2000-04-13', '2012-12-31', 'Velit hic enim molestias nesciunt velit. Commodi fugiat laborum nulla voluptate. Recusandae dignissimos dolorem earum fugiat quae sunt. Suscipit tenetur dolor et et minus. Consectetur autem exercitationem in itaque delectus et maxime. Suscipit quae eveniet quibusdam tempore possimus vitae rerum. Deserunt consequatur cum expedita odio voluptatem necessitatibus corrupti quasi. Quo explicabo nobis eos repellendus reiciendis quia.', '2025-09-22', NULL),
(1696, 'de', 'Robert', '1976-09-16', '2014-07-13', 'Dolor consequuntur occaecati dignissimos molestias est. Voluptas repellat sed id dolores temporibus soluta. Et sunt unde ea nisi omnis. A at dolorum necessitatibus voluptatum aut. Sit quo eos vel natus voluptatem soluta quo.', '2025-09-22', NULL),
(1697, 'Stewart', 'Kristen', '1977-05-23', '1997-01-14', 'Quia accusamus ut quo dolores ut. Eveniet aliquam perferendis nesciunt voluptas recusandae. Dolore sed molestiae ad natus qui. Dolorem ratione perspiciatis dolorem nihil vel suscipit ipsum. Consequatur sapiente nostrum sunt maxime dolor. Est et facilis assumenda enim a. Et distinctio hic molestias assumenda facilis dolores a.', '2025-09-22', NULL),
(1698, 'Pugh', 'Florence', '1965-07-21', '1985-02-16', 'Et quasi rem adipisci. Fugit cumque corrupti pariatur perspiciatis sit. Totam deserunt similique est ipsam omnis. Neque aut veniam accusamus sunt officiis neque dicta quis. Dolores ut dolores eum eligendi. Hic error quibusdam voluptatem in tempora magni.', '2025-09-22', NULL),
(1699, 'Gyllenhaal', 'Jake', '1938-03-11', '1977-01-24', 'Nihil voluptatem cumque assumenda veniam ut et. Maxime ducimus repellat sit voluptatibus optio facere. Eum repellendus molestiae illo autem aut ut. Dolorum similique est aut sapiente. Sed dolores ea et architecto consequatur eos soluta. Veniam reiciendis cumque dolores autem optio.', '2025-09-22', NULL),
(1700, 'Watts', 'Naomi', '1976-07-26', '2022-01-27', 'Sed sed vero nam soluta a. Fuga non sed reiciendis sunt qui. Sunt animi aut illum voluptatum quam quas. Reprehenderit veniam quis officiis.', '2025-09-22', NULL),
(1701, 'Newman', 'Paul', '1936-07-29', '1947-04-14', 'Officia quos deleniti magni laudantium numquam asperiores qui. Maiores perferendis perferendis dolor et laudantium. Assumenda nisi quasi praesentium molestias. At molestiae doloribus est accusantium repellat laudantium vel. Consequuntur illo tempora rerum non cupiditate exercitationem voluptatem. Sunt blanditiis voluptatibus sit illum.', '2025-09-22', NULL),
(1702, 'Caine', 'Michael', '1980-09-26', NULL, 'Dignissimos tempore commodi recusandae est. Accusantium est itaque dolor culpa est nostrum. Non corporis nulla rerum. Consectetur repellendus animi nihil commodi voluptas. Eos autem occaecati repellat labore. Et unde animi aperiam quia qui magni voluptate. Ad laborum facilis voluptates omnis. Sequi quaerat dolorum voluptas officia et aut id occaecati.', '2025-09-22', NULL),
(1703, 'Farrel', 'Colin', '1970-09-16', '2024-09-15', 'Mollitia alias iste molestiae et. Deserunt commodi eveniet repellendus doloremque voluptates impedit quis excepturi. Cumque eos fuga quia. Dignissimos facilis et mollitia numquam maiores sapiente nemo. Quia sed harum aut ab. Eos blanditiis in et repudiandae possimus.', '2025-09-22', NULL),
(1704, 'Hanks', 'Tom', '2006-09-20', '2020-03-17', 'Facilis odio perferendis impedit cupiditate voluptatem iusto fuga. Libero similique eius quis quod. Provident non dignissimos aut eveniet laborum aliquid. Corrupti non sit et accusantium. Quod quia aperiam tempore et assumenda veniam inventore. Dolor odio quaerat veniam magnam. Doloremque porro quia voluptas. Modi dolorem fuga quia enim voluptas et sit ipsum.', '2025-09-22', NULL),
(1705, 'Weisz', 'Rachel', '1991-06-30', '1994-11-27', 'Cumque provident expedita ipsa quo laboriosam culpa qui. Voluptate maiores eaque harum rem. Saepe maiores quia ipsam aut unde exercitationem. Sed dolores voluptate ut iure. Est neque odio sed laboriosam nihil rerum voluptatem.', '2025-09-22', NULL),
(1706, 'Olsen', 'Elizabeth', '2024-12-20', '2025-09-20', 'Dignissimos vel ullam aliquid sunt quidem aliquid qui neque. Architecto eligendi est officiis error quod. Consectetur sunt modi consequatur praesentium iusto rem dolores. Ut et dolorum id doloremque consequuntur quia asperiores et. Numquam aliquid quibusdam fugit iure ducimus. Fugiat voluptas officia aliquam magnam aut.', '2025-09-22', NULL),
(1707, 'Bale', 'Christian', '1979-12-12', '1991-02-04', 'Provident magnam eum qui officiis optio. Molestiae quaerat voluptatem est atque voluptatibus. Quis magnam earum fugiat. Voluptatem in perspiciatis aut impedit natus quas.', '2025-09-22', NULL),
(1708, 'Page', 'Ellen', '1944-02-19', '2004-04-08', 'Dignissimos voluptas sunt dignissimos. Qui quo libero natus voluptas eos aperiam. Ab nisi aut et accusantium rerum hic. Maxime accusamus qui ut hic excepturi voluptas. Illum veritatis consequatur aliquam mollitia expedita.', '2025-09-22', NULL),
(1709, 'Hawke', 'Ethan', '2000-04-18', '2015-01-20', 'Occaecati nam doloremque corrupti impedit et. Soluta et ducimus nisi. Quis reiciendis explicabo voluptatem iste. Incidunt provident et porro facilis et. Atque earum mollitia et et autem dolorem sed. Omnis soluta facere provident quis qui fugit totam. Ut et ut ab facere.', '2025-09-22', NULL),
(1710, 'Johnson', 'Dakota', '1926-03-29', '1939-11-15', 'Accusantium nostrum harum exercitationem quo cupiditate dolores. Quibusdam quod laborum inventore sit. Atque eligendi eum nesciunt doloremque rerum ipsam. Nihil id molestias ut et. Soluta mollitia animi cumque voluptatem labore temporibus perferendis. Exercitationem modi quo praesentium et vitae recusandae. Quo et id molestiae illo et.', '2025-09-22', NULL),
(1711, 'McQueen', 'Steve', '1963-10-19', '2015-05-01', 'Aut iste ut qui eum magnam fugiat nihil. Ipsum quod velit cum. Cumque quis molestias perferendis. Necessitatibus eum dolor reiciendis dolor. Vel illum voluptates laborum voluptas non eveniet.', '2025-09-22', NULL),
(1724, 'fernet', 'lenny', '2005-02-20', '2201-01-20', 'aaaaaaa', '2025-12-20', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `actor_movie`
--

CREATE TABLE `actor_movie` (
  `actor_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `actor_movie`
--

INSERT INTO `actor_movie` (`actor_id`, `movie_id`) VALUES
(1523, 248),
(1523, 255),
(1523, 377),
(1524, 213),
(1524, 321),
(1524, 374),
(1526, 255),
(1526, 256),
(1526, 295),
(1526, 296),
(1527, 257),
(1527, 300),
(1527, 316),
(1527, 340),
(1527, 367),
(1527, 372),
(1528, 223),
(1528, 276),
(1529, 245),
(1529, 246),
(1529, 294),
(1529, 375),
(1530, 211),
(1530, 243),
(1530, 300),
(1530, 302),
(1530, 324),
(1531, 203),
(1531, 340),
(1531, 364),
(1531, 393),
(1532, 236),
(1532, 240),
(1532, 267),
(1532, 398),
(1533, 218),
(1533, 240),
(1533, 309),
(1533, 346),
(1533, 360),
(1533, 389),
(1534, 212),
(1534, 333),
(1534, 358),
(1534, 367),
(1534, 396),
(1535, 285),
(1535, 373),
(1536, 209),
(1536, 241),
(1536, 299),
(1537, 244),
(1537, 246),
(1537, 270),
(1537, 384),
(1538, 218),
(1538, 237),
(1538, 277),
(1538, 306),
(1538, 320),
(1538, 342),
(1540, 236),
(1540, 264),
(1540, 304),
(1540, 328),
(1540, 333),
(1540, 367),
(1540, 388),
(1541, 298),
(1541, 304),
(1542, 207),
(1542, 367),
(1542, 369),
(1543, 256),
(1543, 310),
(1543, 363),
(1543, 370),
(1544, 204),
(1544, 211),
(1544, 222),
(1544, 241),
(1544, 318),
(1544, 380),
(1545, 202),
(1545, 252),
(1545, 306),
(1545, 363),
(1546, 205),
(1546, 269),
(1548, 209),
(1548, 228),
(1548, 249),
(1548, 390),
(1549, 203),
(1550, 263),
(1550, 373),
(1550, 395),
(1551, 294),
(1551, 312),
(1551, 318),
(1551, 346),
(1552, 206),
(1552, 249),
(1552, 254),
(1552, 258),
(1552, 313),
(1553, 246),
(1553, 275),
(1553, 360),
(1553, 372),
(1553, 374),
(1553, 395),
(1554, 290),
(1554, 396),
(1555, 277),
(1555, 327),
(1555, 365),
(1556, 217),
(1556, 242),
(1556, 244),
(1556, 286),
(1556, 353),
(1556, 381),
(1557, 252),
(1557, 361),
(1557, 377),
(1558, 240),
(1558, 245),
(1558, 293),
(1558, 319),
(1559, 378),
(1560, 204),
(1560, 232),
(1560, 287),
(1560, 329),
(1560, 360),
(1560, 372),
(1560, 397),
(1561, 209),
(1561, 244),
(1561, 280),
(1561, 288),
(1561, 316),
(1561, 321),
(1561, 328),
(1561, 338),
(1562, 265),
(1562, 318),
(1563, 254),
(1563, 292),
(1563, 326),
(1563, 341),
(1563, 362),
(1564, 238),
(1564, 260),
(1564, 324),
(1565, 279),
(1565, 294),
(1565, 366),
(1565, 381),
(1566, 294),
(1566, 383),
(1567, 227),
(1567, 264),
(1567, 267),
(1567, 313),
(1568, 224),
(1568, 245),
(1568, 316),
(1568, 334),
(1568, 349),
(1569, 222),
(1569, 246),
(1569, 319),
(1569, 354),
(1569, 372),
(1570, 273),
(1570, 348),
(1570, 384),
(1571, 210),
(1571, 252),
(1571, 278),
(1571, 316),
(1571, 330),
(1571, 385),
(1571, 397),
(1572, 328),
(1572, 337),
(1572, 344),
(1572, 371),
(1572, 380),
(1573, 209),
(1573, 380),
(1573, 389),
(1574, 277),
(1574, 331),
(1575, 215),
(1575, 263),
(1575, 351),
(1575, 400),
(1576, 261),
(1576, 390),
(1577, 202),
(1577, 253),
(1577, 278),
(1577, 346),
(1577, 381),
(1578, 220),
(1578, 222),
(1578, 243),
(1578, 247),
(1578, 284),
(1579, 209),
(1579, 212),
(1579, 268),
(1579, 391),
(1580, 223),
(1580, 268),
(1580, 280),
(1580, 330),
(1581, 256),
(1581, 290),
(1581, 345),
(1581, 399),
(1582, 237),
(1582, 240),
(1582, 265),
(1582, 299),
(1582, 348),
(1582, 356),
(1582, 362),
(1583, 235),
(1584, 241),
(1584, 281),
(1584, 295),
(1584, 320),
(1585, 216),
(1585, 296),
(1585, 334),
(1585, 338),
(1585, 357),
(1585, 395),
(1586, 248),
(1586, 275),
(1586, 282),
(1586, 341),
(1586, 376),
(1587, 203),
(1587, 253),
(1587, 268),
(1587, 301),
(1587, 363),
(1588, 245),
(1588, 281),
(1588, 315),
(1588, 363),
(1588, 386),
(1589, 253),
(1590, 203),
(1590, 266),
(1590, 285),
(1590, 286),
(1590, 341),
(1591, 332),
(1592, 212),
(1592, 274),
(1592, 322),
(1592, 348),
(1592, 359),
(1593, 255),
(1593, 303),
(1593, 371),
(1594, 270),
(1594, 287),
(1594, 299),
(1594, 327),
(1594, 385),
(1594, 386),
(1595, 213),
(1595, 245),
(1595, 273),
(1595, 330),
(1596, 282),
(1596, 291),
(1596, 376),
(1597, 208),
(1597, 235),
(1597, 264),
(1597, 273),
(1597, 396),
(1598, 205),
(1598, 242),
(1598, 249),
(1598, 285),
(1598, 297),
(1598, 388),
(1598, 391),
(1599, 216),
(1599, 346),
(1599, 373),
(1599, 388),
(1600, 251),
(1600, 331),
(1601, 249),
(1601, 272),
(1601, 366),
(1601, 370),
(1601, 371),
(1601, 383),
(1602, 215),
(1602, 258),
(1602, 291),
(1602, 384),
(1603, 280),
(1603, 319),
(1604, 226),
(1604, 261),
(1604, 265),
(1604, 331),
(1604, 358),
(1605, 220),
(1607, 239),
(1607, 302),
(1607, 326),
(1607, 359),
(1607, 368),
(1608, 222),
(1608, 312),
(1609, 206),
(1609, 250),
(1609, 280),
(1609, 313),
(1609, 349),
(1609, 353),
(1610, 344),
(1610, 366),
(1610, 392),
(1611, 211),
(1611, 294),
(1612, 264),
(1612, 272),
(1612, 277),
(1612, 301),
(1612, 335),
(1612, 396),
(1613, 227),
(1613, 253),
(1613, 324),
(1613, 391),
(1614, 243),
(1614, 313),
(1614, 322),
(1614, 334),
(1615, 236),
(1615, 257),
(1615, 298),
(1615, 387),
(1615, 393),
(1615, 399),
(1616, 219),
(1616, 226),
(1616, 256),
(1616, 293),
(1616, 379),
(1617, 249),
(1617, 321),
(1618, 203),
(1618, 258),
(1618, 266),
(1618, 339),
(1619, 282),
(1619, 365),
(1620, 224),
(1620, 225),
(1620, 325),
(1620, 330),
(1620, 340),
(1620, 350),
(1621, 218),
(1621, 262),
(1621, 287),
(1621, 361),
(1621, 386),
(1622, 244),
(1622, 282),
(1622, 303),
(1622, 311),
(1623, 314),
(1623, 350),
(1623, 376),
(1623, 381),
(1624, 226),
(1624, 272),
(1624, 289),
(1624, 292),
(1624, 295),
(1624, 307),
(1624, 370),
(1624, 391),
(1625, 223),
(1625, 292),
(1625, 332),
(1625, 343),
(1625, 392),
(1626, 287),
(1626, 292),
(1626, 332),
(1626, 368),
(1627, 235),
(1627, 339),
(1627, 352),
(1628, 259),
(1628, 307),
(1629, 223),
(1629, 232),
(1629, 352),
(1630, 248),
(1630, 265),
(1630, 396),
(1631, 264),
(1631, 362),
(1631, 378),
(1631, 389),
(1631, 390),
(1632, 212),
(1632, 318),
(1632, 339),
(1632, 343),
(1632, 344),
(1633, 306),
(1633, 310),
(1634, 216),
(1634, 224),
(1634, 241),
(1634, 314),
(1634, 337),
(1634, 366),
(1635, 217),
(1636, 225),
(1636, 232),
(1636, 249),
(1636, 281),
(1636, 344),
(1636, 377),
(1636, 393),
(1637, 271),
(1637, 369),
(1638, 211),
(1638, 225),
(1638, 277),
(1638, 326),
(1638, 356),
(1638, 364),
(1639, 245),
(1639, 400),
(1640, 225),
(1640, 338),
(1640, 348),
(1640, 349),
(1640, 360),
(1641, 232),
(1641, 356),
(1641, 387),
(1642, 232),
(1642, 237),
(1642, 279),
(1642, 286),
(1642, 313),
(1642, 345),
(1642, 357),
(1642, 389),
(1643, 294),
(1643, 299),
(1643, 343),
(1643, 354),
(1643, 356),
(1644, 207),
(1644, 221),
(1644, 368),
(1645, 203),
(1645, 244),
(1645, 371),
(1645, 382),
(1646, 239),
(1646, 347),
(1646, 361),
(1646, 367),
(1647, 232),
(1647, 252),
(1647, 305),
(1647, 317),
(1647, 389),
(1648, 307),
(1648, 339),
(1648, 344),
(1648, 351),
(1649, 218),
(1649, 270),
(1649, 326),
(1649, 384),
(1650, 311),
(1650, 323),
(1651, 209),
(1651, 235),
(1651, 261),
(1651, 312),
(1651, 326),
(1652, 283),
(1652, 309),
(1652, 329),
(1652, 387),
(1653, 210),
(1653, 247),
(1653, 272),
(1653, 276),
(1653, 285),
(1653, 361),
(1654, 280),
(1655, 216),
(1655, 292),
(1656, 205),
(1656, 324),
(1656, 340),
(1657, 269),
(1657, 347),
(1657, 366),
(1657, 376),
(1657, 384),
(1657, 387),
(1657, 398),
(1657, 400),
(1658, 273),
(1659, 228),
(1659, 236),
(1659, 308),
(1659, 374),
(1659, 394),
(1660, 248),
(1660, 332),
(1661, 250),
(1661, 271),
(1661, 369),
(1661, 393),
(1662, 228),
(1662, 238),
(1662, 289),
(1662, 353),
(1662, 363),
(1662, 395),
(1663, 288),
(1664, 379),
(1664, 387),
(1664, 392),
(1664, 394),
(1665, 215),
(1665, 279),
(1665, 297),
(1665, 375),
(1666, 226),
(1666, 268),
(1666, 315),
(1666, 328),
(1667, 214),
(1667, 316),
(1667, 329),
(1667, 372),
(1668, 259),
(1668, 283),
(1668, 284),
(1668, 372),
(1669, 287),
(1669, 351),
(1669, 365),
(1669, 385),
(1670, 217),
(1670, 335),
(1670, 368),
(1671, 279),
(1671, 296),
(1671, 300),
(1671, 315),
(1671, 362),
(1671, 371),
(1672, 276),
(1672, 299),
(1672, 373),
(1673, 212),
(1673, 215),
(1673, 243),
(1673, 330),
(1673, 390),
(1674, 207),
(1674, 208),
(1674, 265),
(1674, 349),
(1674, 383),
(1675, 307),
(1675, 311),
(1675, 335),
(1675, 337),
(1675, 350),
(1675, 399),
(1676, 243),
(1676, 251),
(1676, 260),
(1676, 335),
(1677, 295),
(1677, 359),
(1678, 263),
(1678, 276),
(1678, 292),
(1678, 296),
(1678, 370),
(1678, 388),
(1679, 254),
(1679, 319),
(1679, 349),
(1680, 305),
(1680, 339),
(1680, 392),
(1681, 355),
(1681, 369),
(1681, 382),
(1681, 395),
(1681, 398),
(1682, 223),
(1682, 262),
(1682, 282),
(1682, 312),
(1683, 213),
(1683, 240),
(1683, 275),
(1683, 378),
(1684, 208),
(1684, 219),
(1684, 250),
(1684, 291),
(1684, 322),
(1685, 305),
(1685, 310),
(1685, 377),
(1686, 210),
(1686, 222),
(1686, 225),
(1686, 260),
(1686, 284),
(1686, 297),
(1686, 315),
(1686, 317),
(1686, 325),
(1686, 355),
(1686, 367),
(1686, 399),
(1687, 269),
(1688, 214),
(1688, 240),
(1688, 291),
(1688, 311),
(1688, 352),
(1689, 252),
(1689, 275),
(1689, 308),
(1689, 345),
(1689, 352),
(1690, 206),
(1690, 221),
(1690, 227),
(1690, 357),
(1690, 361),
(1690, 365),
(1691, 285),
(1691, 340),
(1692, 216),
(1692, 220),
(1692, 236),
(1692, 241),
(1692, 255),
(1693, 291),
(1693, 309),
(1693, 346),
(1693, 348),
(1693, 354),
(1694, 250),
(1694, 274),
(1694, 376),
(1694, 385),
(1695, 223),
(1695, 226),
(1695, 253),
(1695, 279),
(1696, 254),
(1696, 266),
(1696, 278),
(1696, 318),
(1697, 213),
(1697, 272),
(1697, 322),
(1697, 346),
(1698, 261),
(1698, 305),
(1698, 318),
(1698, 342),
(1698, 373),
(1699, 211),
(1699, 279),
(1700, 216),
(1700, 219),
(1700, 235),
(1700, 357),
(1701, 225),
(1701, 248),
(1701, 269),
(1701, 307),
(1701, 336),
(1701, 351),
(1701, 383),
(1702, 289),
(1702, 307),
(1702, 335),
(1702, 374),
(1702, 392),
(1703, 213),
(1703, 219),
(1703, 336),
(1703, 395),
(1704, 244),
(1704, 258),
(1704, 269),
(1704, 300),
(1704, 337),
(1704, 366),
(1705, 218),
(1705, 236),
(1705, 268),
(1705, 271),
(1705, 353),
(1706, 228),
(1706, 256),
(1706, 270),
(1706, 345),
(1707, 212),
(1707, 305),
(1708, 256),
(1708, 258),
(1708, 259),
(1708, 305),
(1708, 309),
(1708, 315),
(1708, 363),
(1708, 371),
(1709, 246),
(1709, 261),
(1709, 306),
(1709, 390),
(1710, 206),
(1710, 293),
(1710, 378),
(1710, 384),
(1710, 400),
(1711, 266);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `created_at`) VALUES
(29, 'Action', '2025-09-22 10:20:28'),
(30, 'Suspense', '2025-09-22 10:20:28'),
(31, 'Mystery', '2025-09-22 10:20:28'),
(32, 'Horror', '2025-09-22 10:20:28'),
(33, 'Animation', '2025-09-22 10:20:28'),
(34, 'Western', '2025-09-22 10:20:28'),
(35, 'Thriller', '2025-09-22 10:20:28'),
(36, 'Adventure', '2025-09-22 10:20:28'),
(37, 'Biography', '2025-09-22 10:20:28'),
(38, 'Family', '2025-09-22 10:20:28'),
(39, 'Comedy', '2025-09-22 10:20:28'),
(40, 'Fantasy', '2025-09-22 10:20:28'),
(41, 'Music', '2025-09-22 10:20:28'),
(42, 'Documentary', '2025-09-22 10:20:28'),
(43, 'Romance', '2025-09-22 10:20:28'),
(44, 'Drama', '2025-09-22 10:20:28'),
(45, 'Science Fiction', '2025-09-22 10:20:28'),
(46, 'History', '2025-09-22 10:20:28'),
(47, 'War', '2025-09-22 10:20:28'),
(48, 'TV Movie', '2025-09-22 10:20:28'),
(49, 'Crime', '2025-09-22 10:20:28');

-- --------------------------------------------------------

--
-- Structure de la table `category_movie`
--

CREATE TABLE `category_movie` (
  `category_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category_movie`
--

INSERT INTO `category_movie` (`category_id`, `movie_id`) VALUES
(29, 202),
(29, 219),
(29, 278),
(29, 299),
(29, 307),
(29, 313),
(29, 331),
(29, 334),
(29, 369),
(29, 377),
(29, 389),
(30, 203),
(30, 210),
(30, 211),
(30, 227),
(30, 236),
(30, 280),
(30, 314),
(30, 323),
(30, 359),
(30, 361),
(30, 378),
(30, 388),
(31, 204),
(31, 225),
(31, 270),
(31, 306),
(31, 354),
(31, 375),
(31, 379),
(31, 400),
(32, 205),
(32, 243),
(32, 262),
(32, 288),
(32, 295),
(32, 301),
(32, 320),
(32, 326),
(32, 390),
(32, 397),
(33, 206),
(33, 208),
(33, 218),
(33, 223),
(33, 249),
(33, 254),
(33, 269),
(33, 281),
(33, 319),
(33, 327),
(33, 353),
(33, 395),
(34, 207),
(34, 257),
(34, 259),
(34, 271),
(34, 284),
(34, 289),
(34, 322),
(34, 333),
(34, 340),
(35, 209),
(35, 213),
(35, 244),
(35, 274),
(35, 277),
(35, 293),
(35, 308),
(35, 310),
(35, 342),
(35, 348),
(35, 350),
(35, 352),
(36, 212),
(36, 214),
(36, 232),
(36, 241),
(36, 251),
(36, 275),
(36, 291),
(36, 315),
(36, 335),
(36, 351),
(36, 373),
(36, 376),
(36, 386),
(36, 398),
(37, 215),
(37, 226),
(37, 235),
(37, 252),
(37, 267),
(37, 285),
(37, 312),
(37, 330),
(37, 372),
(37, 380),
(38, 216),
(38, 268),
(38, 332),
(38, 336),
(39, 217),
(39, 248),
(39, 253),
(39, 279),
(39, 283),
(39, 290),
(39, 311),
(39, 324),
(39, 364),
(39, 366),
(39, 381),
(40, 220),
(40, 250),
(40, 255),
(40, 261),
(40, 304),
(40, 338),
(40, 339),
(40, 355),
(40, 365),
(41, 221),
(41, 228),
(41, 237),
(41, 349),
(41, 356),
(41, 360),
(41, 368),
(41, 383),
(41, 384),
(41, 399),
(42, 222),
(42, 263),
(42, 300),
(42, 362),
(43, 224),
(43, 258),
(43, 297),
(43, 298),
(43, 387),
(44, 238),
(44, 247),
(44, 260),
(44, 264),
(44, 273),
(44, 309),
(44, 321),
(44, 328),
(44, 345),
(44, 370),
(44, 393),
(44, 396),
(45, 239),
(45, 240),
(45, 242),
(45, 266),
(45, 286),
(45, 318),
(45, 329),
(45, 337),
(45, 341),
(45, 347),
(45, 382),
(45, 391),
(46, 245),
(46, 272),
(46, 294),
(46, 302),
(46, 305),
(46, 316),
(46, 343),
(46, 346),
(46, 363),
(46, 367),
(46, 392),
(47, 246),
(47, 256),
(47, 265),
(47, 276),
(47, 303),
(47, 317),
(47, 358),
(48, 282),
(48, 292),
(48, 296),
(48, 344),
(48, 385),
(48, 394),
(49, 287),
(49, 325),
(49, 357),
(49, 371),
(49, 374);

-- --------------------------------------------------------

--
-- Structure de la table `director`
--

CREATE TABLE `director` (
  `id` int(11) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL COMMENT '(DC2Type:date_immutable)',
  `dod` date DEFAULT NULL COMMENT '(DC2Type:date_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `director`
--

INSERT INTO `director` (`id`, `lastname`, `firstname`, `dob`, `dod`) VALUES
(1, 'Nolan', 'Christopher', '1998-12-20', '2012-12-20'),
(3, 'aaa', 'aaa', '2005-02-20', NULL),
(4, 'aa', 'aaaaaa', '2005-02-20', '2020-10-10');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250910095017', '2025-09-10 09:50:25', 168),
('DoctrineMigrations\\Version20250930100948', '2025-09-30 10:09:59', 105),
('DoctrineMigrations\\Version20251001063742', '2025-10-01 06:38:00', 29),
('DoctrineMigrations\\Version20251013142106', '2025-10-13 14:21:18', 60),
('DoctrineMigrations\\Version20251013143225', '2025-10-13 14:32:31', 52),
('DoctrineMigrations\\Version20251013143748', '2025-10-13 14:37:52', 156),
('DoctrineMigrations\\Version20251013154238', '2025-10-13 15:42:44', 48),
('DoctrineMigrations\\Version20251013154335', '2025-10-13 15:43:39', 79),
('DoctrineMigrations\\Version20251215092544', '2025-12-15 09:25:50', 52),
('DoctrineMigrations\\Version20251215095809', '2025-12-15 09:58:14', 56),
('DoctrineMigrations\\Version20251215110345', '2025-12-15 11:03:56', 48),
('DoctrineMigrations\\Version20251218211139', '2025-12-18 21:12:14', 49),
('DoctrineMigrations\\Version20251218215705', '2025-12-18 21:57:26', 212),
('DoctrineMigrations\\Version20251219095833', '2025-12-19 09:59:23', 180),
('DoctrineMigrations\\Version20251220173812', '2025-12-20 17:38:38', 76);

-- --------------------------------------------------------

--
-- Structure de la table `media_object`
--

CREATE TABLE `media_object` (
  `id` int(11) NOT NULL,
  `file_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `media_object`
--

INSERT INTO `media_object` (`id`, `file_path`) VALUES
(1, 'tommy-2-68ed0aef57e5a020966758.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `movie`
--

CREATE TABLE `movie` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `release_data` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `director_id` int(11) DEFAULT NULL,
  `nb_entries` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `budget` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `movie`
--

INSERT INTO `movie` (`id`, `name`, `description`, `duration`, `release_data`, `image`, `created_at`, `director_id`, `nb_entries`, `url`, `budget`) VALUES
(202, 'Warrior', 'Hatter began, in rather a hard word, I will just explain to you how the Dodo had paused as if it had entirely disappeared; so the King repeated angrily, \'or I\'ll have you executed.\' The miserable Hatter dropped his teacup instead of onions.\' Seven flung down his brush, and had to ask any more if you\'d like it very hard indeed to make the arches. The chief difficulty Alice found.', 382, '2005-02-20', '', '2025-12-20 20:21:54', NULL, 10, '', 1000),
(203, 'Forrest Gump', 'King and the two creatures got so close to her feet as the question was evidently meant for her. \'I wish I hadn\'t mentioned Dinah!\' she said to herself, \'in my going out altogether, like a wild beast, screamed \'Off with his tea spoon at the cook, and a sad tale!\' said the Dodo had paused as if he had taken his watch out of breath, and said \'That\'s very.', 200, '2000-02-20', '', '2025-12-20 16:46:48', NULL, 100, '', 1000),
(204, 'Star Wars', 'THIS size: why, I should like to hear her try and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the Knave, \'I didn\'t know it to half-past one as long as it was a long way. So she sat down at her for a minute, while Alice thought to herself in the last few minutes, and began to get rather sleepy, and went on in the face. \'I\'ll put a stop to this,\' she said to herself, \'Which way? Which.', 8621, '1998-02-10', '', '2025-12-20 16:47:38', NULL, 1000, '', 10000),
(205, 'L.A. Confidential', 'RED rose-tree, and we put a white one in by mistake; and if it please your Majesty!\' the soldiers remaining behind to execute the unfortunate gardeners, who ran to Alice with one eye, How the Owl had the door and found herself at last turned sulky, and would only say, \'I am older than I am very tired of being such a pleasant temper, and thought to herself in Wonderland, though she looked down at once, with a knife, it usually bleeds; and she could remember them, all these strange Adventures of hers would, in the air. Even the Duchess sneezed occasionally; and as Alice could hear the rattle of the cattle in the schoolroom, and though this was her turn or not. \'Oh, PLEASE mind what.', 10882, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(206, 'Prisoners', 'All on a branch of a book,\' thought Alice to herself, \'the way all the while, and fighting for the rest of the e--e--evening, Beautiful, beautiful Soup! Beau--ootiful Soo--oop! Soo--oop of the birds hurried off to trouble myself about you: you must manage the best of educations--in fact, we went to the jury. \'Not yet, not yet!\' the Rabbit began. Alice gave a little while, however, she waited for a great hurry, muttering to himself in an encouraging opening for a moment that it was a little before she gave her.', 9314, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(207, 'Grease', 'Alice, so please your Majesty,\' said Alice to herself, \'it would be the right size for going through the doorway; \'and even if I might venture to ask his neighbour to tell you--all I know all the other birds tittered audibly. \'What I was sent for.\' \'You ought to speak, and no room at all a proper way of nursing it, (which was to get an opportunity of saying to herself, and fanned herself with one finger, as he said to herself what such an.', 14665, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(208, 'The Sixth Sense', 'On which Seven looked up eagerly, half hoping that they were getting extremely small for a moment like a telescope.\' And so she went hunting about, and make out at the end.\' \'If you can\'t swim, can you?\' he added, turning to Alice, flinging the baby violently up and straightening itself out again, and did not venture to go with Edgar Atheling to meet William and offer him the crown. William\'s conduct at first she would have called him a fish)--and rapped loudly at the picture.) \'Up, lazy thing!\' said the Queen, in a sulky tone; \'Seven jogged my elbow.\' On which Seven looked up and walking off to trouble myself about you: you must manage the best cat in the wood,\' continued the King. \'Nothing whatever,\' said Alice. \'Why not?\' said the King, and the fan, and skurried away into the jury-box, or they would die. \'The trial cannot proceed,\' said the Duchess; \'and.', 6547, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(209, 'The Matrix', 'Has lasted the rest were quite silent, and looked anxiously over his shoulder as she ran; but the wise little Alice herself, and nibbled a little scream, half of them--and it belongs to a snail. \"There\'s a porpoise close behind it was a child,\' said the Mock Turtle drew a long time with great emphasis, looking hard at Alice as she went on. Her listeners were perfectly quiet till she was exactly the right size, that it made Alice quite jumped; but she could not tell whether they were all in bed!\' On various pretexts they all looked puzzled.) \'He must have a prize herself, you know,\' the Mock.', 13420, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(210, 'Once Upon a Time in America', 'I\'ll never go THERE again!\' said Alice hastily; \'but I\'m not the right thing to nurse--and she\'s such a simple question,\' added the Dormouse. \'Don\'t talk nonsense,\' said Alice very humbly: \'you had got its head to feel very queer to ME.\' \'You!\' said the King, the Queen, and Alice, were in custody and under sentence of execution. Then the Queen was silent. The King turned pale, and shut his eyes.--\'Tell her about the whiting!\' \'Oh, as to size,\' Alice hastily replied; \'at least--at least I mean what I should think you\'ll feel it a little now and then a row of.', 11792, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(211, 'Inside Out', 'Alice. \'I\'M not a bit hurt, and she thought it must make me giddy.\' And then, turning to Alice, very earnestly. \'I\'ve had nothing yet,\' Alice replied eagerly, for she had caught the baby joined):-- \'Wow! wow! wow!\' \'Here! you may stand down,\' continued the King. The next thing was to find that the best plan.\' It sounded an excellent opportunity for showing off a bit of the house!\' (Which was very deep, or she fell past it. \'Well!\' thought Alice to herself. \'Of the mushroom,\' said the Cat, \'if you only walk long enough.\' Alice felt dreadfully puzzled. The Hatter\'s remark seemed to Alice for some time busily writing in his sleep, \'that \"I breathe when I get SOMEWHERE,\'.', 11489, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(212, 'Psycho', 'Hatter, \'I cut some more tea,\' the March Hare. Alice was beginning to think about it, so she set to work throwing everything within her reach at the cook, and a fall, and a large cat which was the Cat again, sitting on the top of his Normans--\" How are you getting on now, my dear?\' it continued, turning to Alice, flinging the baby joined):-- \'Wow! wow! wow!\' \'Here! you may SIT down,\' the King and the whole thing, and longed to get dry very soon. \'Ahem!\' said the White Rabbit, \'and that\'s a fact.\' Alice did not at all a pity. I said \"What for?\"\' \'She boxed the Queen\'s ears--\' the Rabbit coming to look down and looked at each other for some minutes. Alice thought she had been all the rats and--oh dear!\' cried Alice, jumping up in a tone of great dismay, and began picking them up again with a sudden leap out of a well--\' \'What did they live at the bottom of a water-well,\' said the Gryphon, with a.', 11378, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(213, 'Prisoners', 'VERY much out of sight. Alice remained looking thoughtfully at the righthand bit again, and that\'s all the time they were nice grand words to say.) Presently she began again: \'Ou est ma chatte?\' which was a table, with a round face, and large eyes like a sky-rocket!\' \'So you think you could see it again, but it did not like to drop the jar for fear of their wits!\' So she went in search of her little sister\'s dream. The long grass rustled at her own child-life, and the March Hare. \'Then it doesn\'t matter which way she put it. She stretched herself up and went down to the end of his pocket, and pulled out a box of comfits, (luckily the salt water had not gone (We know it was.', 8766, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(214, 'Vertigo', 'I don\'t know,\' he went on, \'I must be a person of authority among them, called out, \'Sit down, all of them can explain it,\' said Alice to find her way through the wood. \'If it had fallen into it: there was silence for some time in silence: at last she stretched her arms folded, quietly smoking a long argument with the bread-and-butter getting so thin--and the twinkling of the jury asked. \'That I can\'t be Mabel, for I know I do!\' said Alice in a hoarse growl, \'the world would go round a deal faster than it does.\' \'Which would NOT be an old conger-eel, that used to it in with a pair of the room. The cook threw a frying-pan after her as she tucked her arm affectionately into Alice\'s, and they sat down and looked at Alice. \'It must be the best thing to get rather sleepy, and went stamping about, and called out, \'Sit down, all of you, and don\'t speak a word till I\'ve finished.\' So they went on in the other. In the very middle of one! There ought to be.', 9146, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(215, 'Seven Psychopaths', 'Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse did not feel encouraged to ask help of any good reason, and as Alice could speak again. In a minute or two, it was impossible to say it out to sea. So they got their tails in their mouths--and they\'re all over crumbs.\' \'You\'re wrong about the reason and all her riper years, the.', 6563, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(216, 'Your Name', 'I think that very few little girls of her head down to them, and all the jelly-fish out of a dance is it?\' The Gryphon sat up and down, and nobody spoke for some minutes. Alice thought the whole head appeared, and then raised himself upon tiptoe, put his mouth close to her great disappointment it was written to nobody, which isn\'t usual, you know.\' It was, no doubt: only Alice did not sneeze, were the cook, to see what was coming. It was opened by another footman in livery, with a whiting. Now you know.\' \'And what are they made of?\' \'Pepper, mostly,\' said the Mock Turtle a little pattering of.', 8645, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(217, 'Inside Out', 'March Hare said to herself, \'I don\'t know what to do this, so that by the whole pack rose up into hers--she could hear the rattle of the window, she suddenly spread out her hand, and Alice thought to herself, and fanned herself with one eye; but to get hold of anything, but.', 7750, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(218, 'The Room', 'Alice thoughtfully: \'but then--I shouldn\'t be hungry for it, while the Dodo in an impatient tone: \'explanations take such a tiny golden key, and when she went on, spreading out the answer to it?\' said the Duchess, who seemed too much of it at all; and I\'m I, and--oh dear, how puzzling it all seemed quite natural to Alice again. \'No, I didn\'t,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you know about it, you know--\' (pointing with his.', 12208, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(219, 'Old Boy', 'Dormouse was sitting on a summer day: The Knave shook his head off outside,\' the Queen added to one of the officers of the crowd below, and there was nothing so VERY remarkable in that; nor did Alice think it would feel with all speed back to the porpoise, \"Keep back, please: we don\'t want YOU with us!\"\' \'They were obliged to say than his first remark, \'It was a body to cut it off from: that he shook his grey locks, \'I kept all my life, never!\' They had not as yet had any sense, they\'d take the roof bear?--Mind that loose slate--Oh, it\'s coming down! Heads below!\' (a loud crash)--\'Now, who did that?--It was Bill, the Lizard) could not think of nothing else to do, so Alice soon began talking again. \'Dinah\'ll miss me very much at this, but at any rate: go and live in that case I can find them.\' As she said these words her foot slipped, and in another moment, when she had forgotten.', 14460, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(220, 'The Hateful Height', 'Would not, could not, could not, would not stoop? Soup of the game, the Queen in front of the Lizard\'s slate-pencil, and the procession moved on, three of the accident, all except the Lizard, who seemed to her full size by this time, and was suppressed. \'Come, that finished the first sentence in her hands, and began:-- \'You are not the same, the next verse.\' \'But about his toes?\' the Mock Turtle interrupted, \'if you don\'t like it, yer honour, at all, at all!\' \'Do as I tell you, you coward!\' and at last the Dodo.', 10836, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(221, 'Kill Bill', 'William the Conqueror.\' (For, with all their simple joys, remembering her own mind (as well as she tucked it away under her arm, that it made Alice quite jumped; but she was walking by the officers of the song, perhaps?\' \'I\'ve heard something splashing about in the last few minutes she heard a little bottle that stood near the King sharply. \'Do you take me for asking! No, it\'ll never do to hold it. As soon as there was nothing else to do, so Alice ventured to remark. \'Tut, tut, child!\' said the King; \'and don\'t look at all fairly,\' Alice began, in a great deal of thought, and looked along the course, here and there they are!\' said the March Hare took the hookah out of breath, and said \'What else have you got in your pocket?\' he went on again:-- \'You may not have lived much under the circumstances.', 3914, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(222, 'Unbreakable', 'The baby grunted again, and we put a stop to this,\' she said to herself, \'because of his great wig.\' The judge, by the way the people that walk with their fur clinging close to her, \'if we had the door and went down on one of them at last, and they repeated their arguments to her, And mentioned me to him: She gave me a pair of gloves and a crash of broken glass, from which she concluded that it was written to nobody, which isn\'t usual, you know.\' Alice had been to a mouse: she had peeped into the court, she said this, she came upon a Gryphon, lying fast asleep in the distance would take the roof was thatched with fur. It was the White Rabbit. She was a sound of a tree. By the use of a dance is it?\' The Gryphon sat up and walking away. \'You insult me by talking such nonsense!\' \'I didn\'t know it was quite impossible to say but \'It belongs to the Hatter. \'You MUST remember,\' remarked the King, \'that saves a world of trouble, you know, and he went on in the.', 4109, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(223, 'Memories of Murder', 'ARE a simpleton.\' Alice did not much larger than a pig, my dear,\' said Alice, \'but I haven\'t had a consultation about this, and she crossed her hands up to the Classics master, though. He was an old woman--but then--always to have him with them,\' the Mock Turtle in a sort of people live about here?\' \'In THAT direction,\' the Cat again, sitting on the trumpet, and called out as loud as she could, for the baby, and not to lie down upon her: she gave her one, they gave him two, You gave us three or more; They all made a rush at the Footman\'s head: it just missed her. Alice caught the flamingo and brought it back, the fight was over.', 4809, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(224, 'Mad Max : Fury Road', 'Alice\'s shoulder as she could. The next witness was the only one who had followed him into the air off all its feet at the moment, \'My dear! I wish you would have done that?\' she thought. \'I must be getting somewhere near the door, she found she had been looking over his shoulder with some curiosity. \'What a number of changes she had read several nice little histories about children who had got so close to her to carry it further. So she began: \'O Mouse.', 6613, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(225, 'American History X', 'THE VOICE OF THE SLUGGARD,\"\' said the King, \'and don\'t look at me like a thunderstorm. \'A fine day, your Majesty!\' the Duchess asked, with another hedgehog, which seemed to have the experiment tried. \'Very true,\' said the Caterpillar, just as well. The twelve jurors were all writing very busily on slates. \'What are they doing?\' Alice whispered to the end of his shrill little voice, the name again!\' \'I won\'t interrupt again. I dare say there may be ONE.\' \'One, indeed!\' said the Mouse, frowning, but very politely: \'Did you say it.\' \'That\'s nothing to what I should understand that better,\' Alice said very humbly; \'I won\'t have any rules in particular; at least, if there are, nobody attends to them--and you\'ve no idea what a.', 6501, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(226, 'The Irishman', 'Hatter. He came in sight of the wood for fear of their wits!\' So she called softly after it, \'Mouse dear! Do come back and see that the pebbles were all turning into little cakes as they all stopped and looked at it uneasily, shaking it every now and then said \'The fourth.\' \'Two days wrong!\' sighed the Hatter. He came in sight of the Queen\'s shrill cries to the door, she.', 15114, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(227, 'Fantastic Mr.Fox', 'As she said to Alice, that she began shrinking directly. As soon as there was Mystery,\' the Mock Turtle, who looked at it gloomily: then he dipped it into one of them didn\'t know that Cheshire cats always grinned; in fact, I didn\'t know how to set about it; and as for the end of his pocket, and was immediately suppressed by the way, and the poor little feet, I wonder if I shall have to ask the question?\' said the King, who had been to her, so she felt that she still held the pieces of mushroom in her face, and was going a journey, I should frighten them out again. Suddenly she came up to the cur, \"Such a trial, dear Sir, With no jury or judge, would be the right height to rest her chin in salt water. Her first idea was that she was now only ten inches high, and her eyes anxiously fixed on it, or at any rate, there\'s no use in waiting by the pope.', 11885, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(228, 'The Great Dictator', 'Alice, every now and then, and holding it to annoy, Because he knows it teases.\' CHORUS. (In which the March Hare. \'Sixteenth,\' added the March Hare meekly replied. \'Yes, but some crumbs must have been was not a bit of stick, and tumbled head over heels in its sleep \'Twinkle, twinkle, twinkle, twinkle--\' and went by without noticing her. Then followed the Knave of Hearts, he stole those tarts.', 12575, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(232, 'Fight Club', 'And she\'s such a curious dream!\' said Alice, who had spoken first. \'That\'s none of them bowed low. \'Would you like to go and get ready for your interesting story,\' but she remembered that she never knew whether it was as much use in crying like that!\' said Alice to herself, and once again the tiny hands were clasped upon her knee, and the baby violently up and picking the daisies, when suddenly a footman because he was gone, and, by the English, who wanted leaders, and had been all the jurymen are back in a shrill, passionate voice. \'Would YOU like cats if you like,\' said the Queen, but she did not quite sure whether it would all come wrong, and she went on, \'you see, a dog growls when it\'s pleased. Now I growl when I\'m pleased, and wag my tail when it\'s angry, and wags its tail about in the pictures of him), while the rest of the shepherd boy--and the sneeze of the court, \'Bring me the.', 12540, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(235, 'Paris, Texas', 'NOT marked \'poison,\' so Alice soon began talking again. \'Dinah\'ll miss me very much confused, \'I don\'t even know what you mean,\' the March Hare and his buttons, and turns out his toes.\' [later editions continued as follows When the procession moved on, three of the Lobster; I heard him declare, \"You have baked me too brown, I must sugar my hair.\" As a duck with its eyelids, so he did,\' said the Mock Turtle. \'Seals, turtles, salmon, and so on.\' \'What a curious plan!\' exclaimed Alice. \'And where HAVE my shoulders got to? And oh, my poor hands, how is it I can\'t quite follow.', 11568, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(236, 'Toy Story 3', 'Mouse was speaking, so that they couldn\'t see it?\' So she was to twist it up into the sky. Twinkle, twinkle--\"\' Here the other ladder?--Why, I hadn\'t mentioned Dinah!\' she said this, she noticed a curious dream, dear, certainly: but now run in to your places!\' shouted the Queen. \'Sentence first--verdict afterwards.\' \'Stuff and nonsense!\' said Alice a good deal worse off than before, as the Dormouse indignantly. However, he consented to go after that savage Queen: so she sat down with wonder at the cook, and a pair of gloves and a crash of broken glass.', 15666, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(237, 'Logan', 'Beautiful, beautiful Soup! Beau--ootiful Soo--oop! Soo--oop of the what?\' said the Cat, and vanished again. Alice waited till she heard her sentence three of the table, but it just grazed his nose, you know?\' \'It\'s the Cheshire Cat: now I shall only look up and walking away. \'You insult me by talking such nonsense!\' \'I didn\'t write it, and burning with.', 12562, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(238, 'Shutter Island', 'Alice loudly. \'The idea of having nothing to do: once or twice, and shook itself. Then it got down off the cake. * * * * * * * * * CHAPTER II. The Pool of Tears \'Curiouser and curiouser!\' cried Alice again, in a very respectful tone, but frowning and making quite a crowd of little Alice.', 8333, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(239, 'Psycho', 'As she said to Alice, \'Have you seen the Mock Turtle\'s Story \'You can\'t think how glad I am now? That\'ll be a grin, and she tried to fancy to cats if you wouldn\'t keep appearing and vanishing so suddenly: you make one quite giddy.\' \'All right,\' said the Pigeon in a melancholy tone: \'it doesn\'t seem to be\"--or if you\'d like it very hard indeed to make it stop. \'Well, I\'d hardly finished the goose, with the Dormouse. \'Fourteenth of March, I think.', 8366, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(240, 'Once Upon a Time in the West', 'Alice again, for really I\'m quite tired and out of court! Suppress him! Pinch him! Off with his head!\"\' \'How dreadfully savage!\' exclaimed Alice. \'That\'s very curious!\' she thought. \'But everything\'s curious today. I think that very few things indeed were really impossible. There seemed to be executed for having missed their turns, and she tried her best to climb up one of them with large round eyes, and half of fright and half believed herself in Wonderland, though she looked at Alice. \'It must be collected at once set to work nibbling at the other, and making quite a crowd of little cartwheels, and the baby--the fire-irons came first; then followed a shower of saucepans, plates, and dishes. The Duchess took her choice, and was just going to be, from one minute to another! However, I\'ve got to.', 11886, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(241, 'Coco', 'MILE HIGH TO LEAVE THE COURT.\' Everybody looked at Alice. \'I\'M not a moment to be no doubt that it seemed quite natural to Alice again. \'No, I give you fair warning,\' shouted the Gryphon, \'she wants for to know what \"it\" means well enough, when I got up this morning, but I THINK I can kick.', 11599, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(242, 'Cinema Paradiso', 'Morcar, the earls of Mercia and Northumbria, declared for him: and even Stigand, the patriotic archbishop of Canterbury, found it advisable--\"\' \'Found WHAT?\' said the Hatter. \'I deny it!\' said the King: \'however, it may kiss my hand if it please your Majesty,\' the Hatter hurriedly left the court, \'Bring me the truth: did you manage to do it.\' (And, as you say things are \"much of a well?\' \'Take some more of it had grown so large a house, that she looked down at her as she could. \'The Dormouse is asleep again,\' said the King: \'leave out that one of the Shark, But, when the White Rabbit, \'and that\'s the queerest thing about it.\' (The jury all wrote down all three to settle the question, and they can\'t prove I did: there\'s no room to open her mouth; but she saw maps and pictures hung upon pegs. She took down a jar from.', 9161, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(243, 'The Godfather', 'Gryphon whispered in a tone of great relief. \'Call the first really clever thing the King in a moment: she looked down into its nest. Alice crouched down among the distant green leaves. As there seemed to be no sort of mixed flavour of cherry-tart, custard, pine-apple, roast turkey, toffee, and hot buttered toast,) she very good-naturedly began hunting about for a great thistle, to keep back the wandering hair that curled all over.', 8572, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(244, 'Amelie from Montmartre', 'Fish-Footman was gone, and, by the pope, was soon left alone. \'I wish I hadn\'t drunk quite so much!\' said Alice, feeling very curious sensation, which puzzled her very much at this, but at any rate: go and take it away!\' There was nothing else to say a word, but slowly followed her back to the general conclusion, that wherever you go to law: I will prosecute YOU.--Come, I\'ll take no denial; We must have imitated somebody else\'s hand,\' said the young lady tells us a story.\' \'I\'m afraid I don\'t want to stay in here any longer!\' She waited for a conversation. \'You don\'t know one,\' said Alice, \'and why it is to give the prizes?\' quite a new idea to Alice, and her face brightened up at the place of the bread-and-butter. Just at.', 8584, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(245, 'Kill Bill Vol.1', 'It\'s by far the most confusing thing I ask! It\'s always six o\'clock now.\' A bright idea came into her eyes--and still as she was dozing off, and had no idea what a long way back, and barking hoarsely all the children she knew, who might do something better with the bread-and-butter getting so far off). \'Oh, my poor little thing was to eat her up in her life; it was just saying to herself \'That\'s quite enough--I hope I shan\'t grow any more--As it is, I suppose?\' \'Yes,\' said Alice thoughtfully: \'but then--I shouldn\'t be hungry for it, he was.', 15186, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(246, 'Life is beautiful', 'I THINK; or is it directed to?\' said one of them hit her in an encouraging tone. Alice looked very anxiously into her eyes; and once she remembered trying to box her own courage. \'It\'s no business of MINE.\' The Queen had ordered. They very soon came upon a low trembling voice, \'Let us get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try Geography. London is the reason of that?\' \'In my youth,\' said the Rabbit\'s little white kid gloves: she took courage, and went on: \'But why did they live at the Lizard as she went hunting about, and make THEIR eyes bright and eager with many a strange tale, perhaps even with the Queen said to herself as she had not as yet had any.', 6276, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(247, 'Life is beautiful', 'Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King looked anxiously over his shoulder with some severity; \'it\'s very easy to know what a wonderful dream it had VERY long claws and a scroll of parchment in the kitchen that did not dare to disobey, though she looked up eagerly, half hoping that the meeting adjourn, for the moment how large she had somehow fallen into the air, I\'m afraid, sir\' said Alice, (she had grown so large a house, that she was up to her ear.', 8423, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(248, 'The Dark Knight', 'Dormouse,\' the Queen say only yesterday you deserved to be no use in crying like that!\' By this time she had found her head to keep herself from being broken. She hastily put down the chimney close above her: then, saying to her to begin.\' For, you see, Miss, we\'re doing our best, afore she comes, to--\' At this moment Alice appeared, she was nine feet high, and her eyes immediately met those of a water-well,\' said the Cat, and vanished. Alice was.', 13373, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(249, 'Apocalypse Now', 'Hatter. Alice felt a little pattering of footsteps in the book,\' said the Duck: \'it\'s generally a frog or a worm. The question is, what did the archbishop find?\' The Mouse gave a sudden burst of tears, until there was a treacle-well.\' \'There\'s no such thing!\' Alice was more and more sounds of broken glass, from which she had a vague sort of way to hear the rattle of the creature, but on second thoughts she decided on going into the court, she said to herself, in a moment to be sure! However, everything is to-day! And yesterday things went on all the way out of the guinea-pigs cheered, and was going to turn round on its axis--\' \'Talking of axes,\' said the King. \'Nothing whatever,\' said Alice. \'Exactly so,\' said Alice. \'You did,\' said the Pigeon; \'but I haven\'t had a VERY turn-up nose, much more like a frog; and both footmen, Alice noticed, had powdered hair that WOULD always get into the.', 8101, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(250, 'The Pianist', 'Time, and round goes the clock in a very short time the Mouse to tell its age, there was no more to do THAT in a low voice. \'Not at all,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Hatter: \'but you could only see her. She is such a curious croquet-ground in her life; it was very hot, she kept on puzzling about it while the rest waited in silence. At last the Dodo suddenly called out to her great disappointment it was an old Turtle--we used to it as she had tired herself out with his nose Trims his belt and his friends shared their never-ending meal, and the King triumphantly.', 5817, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(251, 'The Departed', 'Alice, and she jumped up in great disgust, and walked a little of the Nile On every golden scale! \'How cheerfully he seems to like her, down here, and I\'m sure she\'s the best way you have to go nearer till she got to the tarts on the stairs. Alice knew it was addressed to the voice of the gloves, and she ran out of it, and found herself lying on their backs was the King; \'and don\'t look at it!\' This speech caused a remarkable sensation among the people near the right height to be.\' \'It is a raven like a serpent. She had.', 12421, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(252, 'Toy Story 3', 'Alice was silent. The Dormouse again took a great crash, as if she had never left off sneezing by this time.) \'You\'re nothing but the Dormouse began in a furious passion, and went back for a minute or two, it was sneezing on the trumpet, and then hurried on, Alice started to her lips. \'I know SOMETHING interesting is sure to make out what it was: she was exactly three inches high). \'But I\'m NOT a serpent, I tell you, you coward!\' and at last came a little pattering of feet in a court of justice before, but she remembered the number of executions the Queen had ordered. They very soon found an opportunity of showing off a little of it?\' said the Footman, \'and that for two reasons. First, because I\'m on the floor, and a fan! Quick, now!\' And Alice was soon left alone. \'I wish I could shut up like a writing-desk?\' \'Come, we shall get on better.\' \'I\'d rather.', 9854, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(253, 'Memento', 'Gryphon: and Alice called after it; and while she was always ready to make out exactly what they said. The executioner\'s argument was, that you weren\'t to talk nonsense. The Queen\'s argument was, that her flamingo was gone in a pleased tone. \'Pray don\'t trouble yourself to say when I get SOMEWHERE,\' Alice added as an unusually large saucepan flew close by her. There was a dead silence. \'It\'s a friend of mine--a Cheshire Cat,\' said Alice: \'I don\'t even know what a delightful thing a Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'Why, you don\'t explain it as far as they came nearer, Alice could bear: she got to come out among the party. Some of the conversation. Alice replied, rather shyly, \'I--I hardly know, sir, just at first, perhaps,\' said the March Hare will be When they take us.', 6115, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(254, 'Ad Astra', 'Hatter. \'You might just as I tell you, you coward!\' and at once without waiting for turns, quarrelling all the time she went on so long that they were mine before. If I or she fell past it. \'Well!\' thought Alice \'without pictures or conversations in it, and found quite a conversation of it altogether; but after a few minutes, and began talking to him,\' the Mock Turtle: \'why, if a fish came to ME, and told me you had been all the creatures argue. It\'s enough to look about her other little children, and everybody laughed, \'Let the jury consider their verdict,\' the.', 3771, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(255, 'Collateral', 'I can kick a little!\' She drew her foot as far as they lay on the bank, with her friend. When she got back to her: its face in some book, but I can\'t quite follow it as to go and take it away!\' There was a real Turtle.\' These words were followed by a row of lamps hanging from the time he was going to dive in among the bright eager eyes were nearly out of that is--\"The more there is of finding morals in things!\' Alice began to tremble. Alice looked up.', 9437, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(256, 'Saving Private Ryan', 'Alice remarked. \'Right, as usual,\' said the Hatter: \'I\'m on the whole party look so grave that she never knew so much surprised, that for the White Rabbit put on your head-- Do you think you\'re changed, do you?\' \'I\'m afraid I can\'t be Mabel, for I know all sorts of little Alice herself, and.', 8839, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(257, 'The Prestige', 'Alice. \'That\'s the first to speak. \'What size do you call him Tortoise, if he wasn\'t one?\' Alice asked. \'We called him a fish)--and rapped loudly at the March Hare. Alice was too dark to see if she could not remember ever having seen such a tiny little thing!\' said Alice, always ready to sink into the court, without even looking round. \'I\'ll fetch the executioner went off like an arrow. The Cat\'s head began fading away the time. Alice had been (Before she had never left off when they passed too close, and waving their.', 4780, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(258, 'Shutter Island', 'She said the March Hare, who had followed him into the sky. Twinkle, twinkle--\"\' Here the other side of WHAT?\' thought Alice \'without pictures or conversations in it, \'and what is the reason of that?\' \'In my youth,\' Father William replied to his ear. Alice considered a little bird as soon as the soldiers remaining behind to execute the unfortunate gardeners, who ran to Alice again. \'No, I didn\'t,\' said Alice: \'allow me to him: She gave me a pair of white kid gloves while she was in the sky. Alice went on eagerly. \'That\'s enough about lessons,\' the Gryphon at the.', 13589, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(259, 'Ran', 'Oh, how I wish you wouldn\'t have come here.\' Alice didn\'t think that very few things indeed were really impossible. There seemed to be an old conger-eel, that used to come out among the trees under which she concluded that it led into the air, and came flying down upon her: she gave one sharp kick, and waited to see how he did it,) he did it,) he did not at all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was soon submitted to by all three to settle the question, and they sat down again into.', 5652, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(260, 'Blade Runner', 'Alice did not wish to offend the Dormouse followed him: the March Hare was said to herself. \'I dare say you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice, always ready to play with, and oh! ever so many lessons to learn! No, I\'ve made up my mind about it; and the choking of the right-hand bit to try the effect: the next moment she quite forgot you didn\'t sign it,\' said the Hatter. \'Stolen!\' the King said, with a yelp of delight, which changed into alarm in another moment, when she looked up, but it was done. They had a pencil that squeaked. This of course, I meant,\' the King repeated.', 4249, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(261, 'Iron Man', 'March Hare. \'Exactly so,\' said Alice. \'Call it what you like,\' said the Hatter grumbled: \'you shouldn\'t have put it more clearly,\' Alice replied eagerly, for she thought, and it sat for a dunce? Go on!\' \'I\'m a poor man, your Majesty,\' said the Gryphon: and Alice guessed in a deep voice, \'What are they made of?\' \'Pepper, mostly,\' said the Mock Turtle. \'Very much indeed,\' said Alice. \'What sort of meaning in it, \'and what is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must be really offended. \'We won\'t talk about wasting IT. It\'s HIM.\' \'I don\'t know where Dinn may be,\' said the King, rubbing his hands; \'so now let the Dormouse followed him: the March Hare was said to herself, \'the way all the rats and--oh dear!\' cried Alice (she was rather glad there WAS no one to listen to me! When I used to it!\' pleaded poor Alice in a low.', 3745, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(262, 'Finding Nemo', 'ME.\' \'You!\' said the King eagerly, and he called the Queen, \'and he shall tell you my history, and you\'ll understand why it is right?\' \'In my youth,\' Father William replied to his son, \'I feared it might be some sense in your pocket?\' he went on, \'\"--found it advisable to go near the King said, turning to the part about her repeating \'YOU ARE OLD, FATHER WILLIAM,\"\' said the Hatter. \'It isn\'t mine,\' said the March Hare. \'It was the same size for ten minutes together!\'.', 8629, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(263, 'City of God', 'Caterpillar. \'Well, I\'ve tried hedges,\' the Pigeon had finished. \'As if I must, I must,\' the King said to Alice, they all quarrel so dreadfully one can\'t hear oneself speak--and they don\'t give birthday presents like that!\' \'I couldn\'t help it,\' she said this last word with such a curious appearance in the sky. Twinkle, twinkle--\"\' Here the Dormouse said--\' the Hatter were having tea at it: a Dormouse was sitting on a little bit, and said to herself, \'Why, they\'re only a child!\' The Queen smiled and passed on. \'Who ARE you doing out here? Run home this moment, and fetch me a good deal frightened at the.', 11454, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(264, 'Reservoir Dogs', 'On various pretexts they all looked so grave that she still held the pieces of mushroom in her lessons in the middle of her own courage. \'It\'s no business there, at any rate: go and live in that soup!\' Alice said nothing: she had someone to listen to her. \'I wish the creatures order one about, and crept a little timidly, \'why you are very dull!\' \'You ought to go and take it away!\' There was no label this time it vanished quite slowly, beginning with the dream of Wonderland of long ago: and how she would get up and saying, \'Thank you, sir, for your walk!\" \"Coming in a.', 7144, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(265, 'Room', 'Her first idea was that it signifies much,\' she said this last remark. \'Of course twinkling begins with an anxious look at me like that!\' By this time she went on planning to herself what such an extraordinary ways of living would be of very little use without my shoulders. Oh, how I wish you would seem to come upon them THIS size: why, I should like to hear her try and say \"How doth the little--\"\' and she at once crowded round her, about the right distance--but then I wonder what they\'ll do well enough; and what does it to annoy, Because he knows it teases.\' CHORUS. (In which the.', 5868, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(266, 'The Room', 'Alice; \'but when you have just been picked up.\' \'What\'s in it?\' said the Dodo, pointing to the dance. So they went on eagerly. \'That\'s enough about lessons,\' the Gryphon as if his heart would break. She pitied him deeply. \'What is his sorrow?\' she asked the Gryphon, \'you first form into a graceful zigzag, and was going to do it.\' (And, as you go to on the same solemn tone, only changing the order of the house before she had hoped) a fan and gloves. \'How queer it seems,\' Alice said to herself, \'to be going messages for a dunce? Go on!\' \'I\'m a poor.', 15787, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(267, 'American History X', 'Queen put on your head-- Do you think I may as well say,\' added the Dormouse. \'Write that down,\' the King repeated angrily, \'or I\'ll have you executed on the hearth and grinning from ear to ear. \'Please would you tell me,\' said Alice, \'but I must be shutting up like a Jack-in-the-box, and up I goes like a frog; and both creatures hid their faces in their proper places--ALL,\' he repeated with great.', 15972, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(268, 'Incendies', 'Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'Well, then,\' the Cat again, sitting on the floor, as it can be,\' said the Lory. Alice replied eagerly, for she was dozing off, and that if you drink much from a bottle marked \'poison,\' so Alice ventured to ask. \'Suppose we change the subject. \'Go on with the tea,\' the Hatter said, turning to Alice, and she felt a violent blow underneath her chin: it had been. But her sister sat still and said nothing. \'Perhaps it hasn\'t one,\' Alice ventured to remark. \'Tut, tut, child!\' said the Queen. \'You make me giddy.\' And then, turning to Alice, they all quarrel so dreadfully one can\'t hear oneself speak--and.', 8272, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(269, 'Inside Out', 'I\'ll set Dinah at you!\' There was no one listening, this time, sat down again into its face was quite tired and out of the doors of the sort. Next came the royal children; there were three little sisters--they were learning to draw, you know--\' She had not gone far before they saw her, they hurried back to the Hatter. \'I deny it!\' said the Mouse, frowning, but very politely: \'Did you say pig, or fig?\' said the Queen, stamping on.', 15778, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(270, 'A bout de souffle', 'However, on the stairs. Alice knew it was very like having a game of play with a lobster as a cushion, resting their elbows on it, (\'which certainly was not a bit hurt, and she went in without knocking, and hurried upstairs, in great disgust, and walked off; the Dormouse began in a day did you manage to do it.\' (And, as you say \"What a pity!\"?\' the Rabbit noticed Alice, as she spoke; \'either you or your head must be collected at once to eat her up in a trembling voice to its children, \'Come away, my dears! It\'s high time to begin lessons: you\'d only have to go down--Here, Bill! the master says you\'re to go down the middle, being held up by two guinea-pigs, who were lying on the whole window!\' \'Sure, it does, yer honour: but it\'s an arm, yer honour!\' (He pronounced it \'arrum.\') \'An arm, you goose! Who ever saw one that size? Why, it fills the whole head appeared, and then quietly marched.', 13557, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(271, '12 Angry Men', 'Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Soo--oop of the same thing, you know.\' \'Who is it directed to?\' said one of the players to be sure, she had somehow fallen into it: there was no label this time it all seemed quite natural); but when the race was over. However, when they met in the window, and.', 16030, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(272, 'Memories of Murder', 'Has lasted the rest of it had been, it suddenly appeared again. \'By-the-bye, what became of the conversation. Alice felt so desperate that she began again. \'I should like to show you! A little bright-eyed terrier, you know, and he went on, \'\"--found it advisable to go near the centre of the words a little, \'From the Queen. \'I never said I didn\'t!\' interrupted Alice. \'You did,\' said the Dormouse, without considering at all like the wind, and was coming to, but it puzzled her very much confused, \'I don\'t quite understand you,\' she said, \'than waste it in the.', 12650, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(273, 'Lawrence of Arabie', 'Just at this moment the King, and the baby--the fire-irons came first; then followed a shower of little cartwheels, and the little door: but, alas! either the locks were too large, or the key was too slippery; and when Alice had never been so much contradicted in her life, and had to leave it behind?\' She said the Caterpillar took the thimble, looking as solemn as she could not remember ever having heard of one,\' said Alice. \'Why, you don\'t even know what \"it\" means well enough, when I breathe\"!\' \'It IS the fun?\' said Alice. \'Who\'s making personal remarks now?\' the.', 6839, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(274, 'Warrior', 'For instance, if you only kept on good terms with him, he\'d do almost anything you liked with the Gryphon. \'I mean, what makes them so often, you know.\' He was looking at them with large round eyes, and feebly stretching out one paw, trying to find that her flamingo was gone in a coaxing tone, and she swam about, trying to find that she had drunk half the bottle, she found a little different. But if I\'m not myself, you see.\' \'I don\'t see any wine,\' she remarked. \'There isn\'t any,\' said the Cat. \'I\'d nearly forgotten that I\'ve got to grow to my jaw, Has lasted the rest of the guinea-pigs cheered, and was delighted to find that the Queen in a voice she had gone through that day. \'No, no!\' said the Mock Turtle to the garden at once; but, alas for poor Alice! when she first saw the White Rabbit returning, splendidly dressed, with a.', 9575, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(275, 'Stalker', 'Alice, with a teacup in one hand and a fan! Quick, now!\' And Alice was only the pepper that had made her look up and went to school in the pool a little quicker. \'What a pity it wouldn\'t stay!\' sighed the Lory, as soon as it happens; and if I fell off the top of the sense, and the baby joined):-- \'Wow! wow! wow!\' \'Here! you may stand down,\' continued the King. The next witness was the first minute or two, she made out the verses the White.', 12070, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(276, 'Ghostbusters', 'Alice. \'Then it ought to go from here?\' \'That depends a good deal frightened by this time). \'Don\'t grunt,\' said Alice; \'I can\'t go no lower,\' said the Duchess; \'and most things twinkled after that--only the March Hare. \'He denies it,\' said the King, and the roof of the court,\" and I never knew so much frightened that she had but to open it; but, as the Rabbit, and had to double themselves up and saying, \'Thank you, it\'s a set of verses.\' \'Are they in the other. \'I beg pardon, your Majesty,\' said the.', 7588, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(277, 'Silence', 'Queen, and Alice, were in custody and under sentence of execution.\' \'What for?\' said Alice. \'Exactly so,\' said the King, and the blades of grass, but she knew that were of the Lobster; I heard him declare, \"You have baked me too brown, I must be on the hearth and grinning from ear to ear. \'Please would you like to be patted on the stairs. Alice knew it was good manners for her to carry it further. So she called softly after it, never once considering how in the trial done,\' she thought, and it set to work very diligently to write out a new kind of sob, \'I\'ve tried every way, and the sound of a globe of goldfish.', 12580, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(278, 'Batman Returns', 'Dormouse: \'not in that poky little house, on the shingle--will you come to the heads of the court. \'What do you know what a dear little puppy it was!\' said Alice, (she had grown up,\' she said to herself, \'to be going messages for a few yards off. The Cat only grinned a little bottle that stood near. The three soldiers wandered about in a great deal to ME,\' said the Caterpillar. Alice folded her hands, wondering if anything would EVER happen in a bit.\' \'Perhaps it hasn\'t one,\' Alice ventured to ask. \'Suppose we change the subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse did not get hold of this rope--Will the roof of the lefthand bit of mushroom, and her eyes filled with cupboards and book-shelves; here and there. There was not a mile high,\' said Alice. \'You must be,\' said the.', 4482, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0);
INSERT INTO `movie` (`id`, `name`, `description`, `duration`, `release_data`, `image`, `created_at`, `director_id`, `nb_entries`, `url`, `budget`) VALUES
(279, 'Mary and Max', 'Hatter, \'you wouldn\'t talk about wasting IT. It\'s HIM.\' \'I don\'t think--\' \'Then you shouldn\'t talk,\' said the young Crab, a little bottle that stood near the looking-glass. There was a little door into that beautiful garden--how IS that to be talking in a trembling voice:-- \'I passed by his garden.\"\' Alice did not see anything that had slipped in like herself. \'Would it be murder to leave it behind?\' She said the March Hare. Alice was beginning to see what the name of nearly everything there. \'That\'s the first figure,\' said the Mouse, sharply and very soon found an opportunity of taking it away. She did it so VERY much out of its voice. \'Back to land again, and that\'s all I can do no more, whatever happens. What WILL become of me? They\'re dreadfully fond of beheading people here.', 4951, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(280, 'Drive', 'For instance, suppose it doesn\'t mind.\' The table was a very difficult game indeed. The players all played at once took up the fan and gloves--that is, if I fell off the fire, and at once in her hands, and was going to begin again, it was perfectly round, she came rather late, and the Panther were sharing a pie--\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Panther were sharing a pie--\' [later editions continued as follows When the procession moved on, three of the March Hare said to herself, \'after such a pleasant temper, and thought it would be the right size, that it would feel with all her knowledge of history, Alice had no pictures or.', 8883, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(281, 'The Social Network', 'Laughing and Grief, they used to come once a week: HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, I meant,\' the King hastily said, and went to school every day--\' \'I\'VE been to the three gardeners at it, and on both sides of it, and finding it very much,\' said Alice; \'I daresay it\'s a very curious.', 10860, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(282, 'Casino', 'But she went on: \'But why did they live on?\' said Alice, a good many little girls eat eggs quite as safe to stay in here any longer!\' She waited for some time in silence: at last came a little timidly: \'but it\'s no use denying it. I suppose Dinah\'ll be sending me on messages next!\' And she went hunting about, and shouting \'Off with his nose Trims his belt and his friends shared their never-ending meal, and the Gryphon as if he thought it over a little different. But if I\'m Mabel, I\'ll stay down here! It\'ll be no use their putting their heads down and make THEIR eyes bright and eager with many a strange tale, perhaps even with the birds hurried off to the.', 4449, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(283, 'GoodFellas', 'King; \'and don\'t look at the March Hare had just begun to think about it, you know--\' (pointing with his knuckles. It was so full of soup. \'There\'s certainly too much overcome to do THAT in a deep voice, \'are done with a soldier on each side to guard him; and near the King repeated angrily, \'or I\'ll have you executed.', 9968, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(284, 'Elephant Man', 'As soon as the hall was very likely true.) Down, down, down. Would the fall NEVER come to the porpoise, \"Keep back, please: we don\'t want to go! Let me see: four times six is thirteen, and four times seven is--oh dear! I wish you were or might have been a holiday?\' \'Of course you know I\'m mad?\' said Alice. \'Why not?\' said the cook. \'Treacle,\' said a timid voice at her.', 10461, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(285, '12 Years a Slave', 'I am so VERY nearly at the sudden change, but she saw in my kitchen AT ALL. Soup does very well as she could, for the moment they saw her, they hurried back to the garden door. Poor Alice! It was the only difficulty was, that anything that looked like the right way to change the subject. \'Ten hours the first minute or two, they began running when they met in the world she was not a mile high,\' said Alice. \'Come on, then,\' said Alice, \'we.', 10457, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(286, 'Django Unchained', 'The Queen\'s argument was, that you have to turn round on its axis--\' \'Talking of axes,\' said the Footman, and began bowing to the beginning of the Lobster Quadrille, that she was peering about anxiously among the party. Some of the wood to listen. \'Mary Ann! Mary Ann!\' said the Gryphon: and Alice rather unwillingly took the opportunity of showing off her knowledge, as there was generally a ridge or furrow in the other. \'I beg your pardon!\' said the Mock Turtle. \'Very much indeed,\' said Alice. \'Anything you like,\' said the Mouse, getting up and picking the daisies, when suddenly a footman because he taught us,\' said the one who had meanwhile been examining the roses. \'Off with his nose Trims his belt and his friends shared their never-ending meal, and the little.', 10091, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(287, 'City of God', 'COULD! I\'m sure I can\'t understand it myself to begin with; and being ordered about by mice and rabbits. I almost wish I hadn\'t quite finished my tea when I sleep\" is the use of this ointment--one shilling the box-- Allow me to sell you a present of everything I\'ve said as yet.\' \'A cheap sort of life! I do hope it\'ll make me grow large again, for this time the Mouse replied rather crossly: \'of course you know about it, even if I shall be punished for it was getting very sleepy; \'and they all cheered. Alice thought to herself, \'whenever I eat or drink anything; so I\'ll just see.', 7321, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(288, 'Apocalypse Now', 'Dormouse. \'Fourteenth of March, I think you\'d take a fancy to cats if you hold it too long; and that you had been anxiously looking across the garden, and marked, with one finger, as he spoke, and added with a great thistle, to keep herself from being run over; and the Queen said to herself how this same little sister of hers would, in the house till she heard her sentence three of her age knew the meaning of half those long words, and, what\'s more, I don\'t take this young lady tells us a story.\' \'I\'m afraid I am, sir,\' said Alice; \'I can\'t go no lower,\' said the King, who had got its head to hide a smile: some of them at last, and managed to put it into his plate. Alice did not like to hear her try and repeat something now. Tell her to carry it further. So she tucked it away under her arm, and timidly said \'Consider, my dear: she is such a pleasant.', 5056, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(289, 'The Irishman', 'So she swallowed one of the tail, and ending with the lobsters, out to be otherwise.\"\' \'I think I should think it was,\' said the Mock Turtle yet?\' \'No,\' said the Gryphon. Alice did not get dry again: they had a pencil that squeaked. This of course, Alice could bear: she got up and down, and nobody spoke for some time in silence: at last it sat for a minute or two, they began solemnly dancing round and look up in a shrill, loud voice, and see that she was quite out of the accident, all except the Lizard, who seemed to have finished,\' said the Caterpillar. \'Not QUITE right, I\'m afraid,\' said Alice, and looking anxiously about her. \'Oh, do let me help to undo it!\' \'I shall sit here,\' he said, \'on and off, for days and.', 4833, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(290, 'There Will Be Blood', 'As soon as look at it!\' This speech caused a remarkable sensation among the branches, and every now and then; such as, \'Sure, I don\'t want to stay with it as a last resource, she put her hand again, and said, \'It WAS a narrow escape!\' said Alice, rather doubtfully, as she could not taste theirs, and the whole party at once without waiting for the next thing was snorting like a sky-rocket!\' \'So you think you can have no sort of knot, and then raised himself upon tiptoe, put his shoes on. \'--and just take his head sadly. \'Do I look like it?\' he said. \'Fifteenth,\' said the Cat, and vanished. Alice.', 7628, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(291, 'Apocalypse Now', 'White Rabbit, jumping up and ran off, thinking while she was in the pictures of him), while the rest of the door that led into the way out of its mouth again, and Alice looked round, eager to see what was on the trumpet, and called out in a tone of great dismay, and began an account of the table, but there was generally a frog or a watch to take out of their hearing her; and the sound of a procession,\' thought she, \'what would become of you? I gave her one, they gave him two, You gave us three or more; They all returned from him to be afraid of it. She felt that it led into the air off all its feet at the top of his great wig.\' The judge, by the carrier,\' she thought; \'and how funny it\'ll seem to be\"--or if you\'d rather not.\' \'We indeed!\' cried the Mock Turtle in a tone of the trees had a wink of sleep these three little sisters,\' the Dormouse fell asleep instantly, and Alice guessed in a trembling voice to a farmer, you know, this sort.', 8218, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(292, 'We Own the Night', 'And she\'s such a long argument with the next verse,\' the Gryphon went on. Her listeners were perfectly quiet till she shook the house, \"Let us both go to on the bank, with her friend. When she got into it), and handed them round as prizes. There was nothing so VERY nearly at the cook, to see the Mock Turtle, \'but if they.', 13892, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(293, 'Fargo', 'For really this morning I\'ve nothing to what I should frighten them out of a tree a few minutes, and she crossed her hands on her hand, and made a snatch in the air. Even the Duchess said in a day or two: wouldn\'t it be murder to leave the court; but on the other queer noises, would change to tinkling sheep-bells, and the bright eager eyes were nearly out of its right ear and left off sneezing by this time, and was just saying to herself how she would gather about her repeating \'YOU ARE OLD, FATHER WILLIAM,\' to the.', 6887, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(294, 'Zodiac', 'Alice! when she was now only ten inches high, and her eyes anxiously fixed on it, or at least one of them bowed low. \'Would you tell me, please, which way you can;--but I must have been ill.\' \'So they were,\' said the Cat. \'I don\'t see any wine,\' she remarked. \'It tells the day and night! You see the Queen. An invitation for the garden!\' and she was getting quite crowded with the game,\' the Queen said to herself, \'I don\'t think--\' \'Then you shouldn\'t talk,\' said the Gryphon. \'It\'s all his fancy, that: they never executes nobody, you know. So you see, so many tea-things are put out here?\' she asked. \'Yes, that\'s it,\' said Alice to herself, in a very little way.', 8323, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(295, 'The Great Dictator', 'She had already heard her sentence three of her knowledge. \'Just think of nothing better to say it any longer than that,\' said Alice. \'I\'ve read that in about half no time! Take your choice!\' The Duchess took her choice, and was a little glass box that was said, and went on: \'But why did they draw?\' said Alice, in a hurry. \'No, I\'ll look first,\' she said, \'for her hair goes in such a neck as that! No, no! You\'re a serpent; and there\'s no use denying it. I suppose it doesn\'t matter which way she put her hand again, and the whole window!\' \'Sure, it does, yer honour: but it\'s an arm for all that.\' \'With extras?\' asked the Gryphon, the squeaking of the tail, and ending with the tea,\' the March Hare had just upset the milk-jug into his plate. Alice did not like to have no answers.\' \'If you please, sir--\' The Rabbit Sends in a furious passion, and went stamping about, and called.', 10597, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(296, 'Django Unchained', 'I do,\' said Alice desperately: \'he\'s perfectly idiotic!\' And she began thinking over other children she knew, who might do very well as I do,\' said Alice indignantly, and she crossed her hands on her toes when they saw the Mock Turtle to the table for it, you may SIT down,\' the King triumphantly, pointing to Alice severely. \'What are they made of?\' \'Pepper, mostly,\' said the March Hare and his friends shared their never-ending meal, and the other paw, \'lives a March Hare. \'I didn\'t know that Cheshire cats always grinned; in fact, a sort of idea that they had to be ashamed of yourself,\' said Alice, and she was now about two feet high.', 4511, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(297, 'The Wolf of Wall Street', 'The Queen turned angrily away from him, and very neatly and simply arranged; the only one way of nursing it, (which was to eat the comfits: this caused some noise and confusion, as the White Rabbit cried out, \'Silence in the lap of her skirt, upsetting all the arches are gone from this morning,\' said Alice sadly. \'Hand it over afterwards, it occurred to her that she looked down into its face to see anything; then she had grown in the last concert!\' on which the wretched Hatter trembled so, that Alice quite jumped; but she got used to it!\' pleaded poor Alice in a.', 11004, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(298, 'Once Upon a Time in the West', 'King, and the three were all crowded together at one end to the garden at once; but, alas for poor Alice! when she had found the fan and the procession moved on, three of her head impatiently; and, turning to Alice, and tried to beat them off, and found that, as nearly as large as the March Hare will be much the most confusing thing I ever heard!\' \'Yes, I think that there ought! And when I was a large caterpillar, that was lying under the sea,\' the Gryphon whispered in reply, \'for fear they should forget them before the trial\'s begun.\' \'They\'re putting down their names,\' the Gryphon repeated impatiently: \'it begins \"I passed by his garden, and marked, with one finger; and the King.', 11457, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(299, 'Trainspotting', 'I think?\' \'I had NOT!\' cried the Gryphon. \'The reason is,\' said the one who got any advantage from the sky! Ugh, Serpent!\' \'But I\'m NOT a serpent!\' said Alice very meekly: \'I\'m growing.\' \'You\'ve no right to think,\' said Alice timidly. \'Would you tell me,\' said Alice, rather alarmed at the other side of the mushroom, and crawled away in the direction it pointed to, without trying to touch her. \'Poor little thing!\' said the King replied.', 14634, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(300, 'Batman Returns', 'So Alice got up in a deep voice, \'are done with blacking, I believe.\' \'Boots and shoes under the circumstances. There was a table, with a T!\' said the Mock Turtle, \'they--you\'ve seen them, of course?\' \'Yes,\' said Alice angrily. \'It wasn\'t very civil of you to death.\"\' \'You are old,\' said the Mock Turtle. \'Very much indeed,\' said Alice. \'Then you should say what you would seem to see its meaning. \'And just.', 11331, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(301, 'Mission : Impossible', 'What happened to you? Tell us all about for it, you know.\' He was an immense length of neck, which seemed to think this a very poor speaker,\' said the Cat. \'Do you mean that you had been jumping about like that!\' \'I couldn\'t help it,\' said Five, in a languid, sleepy voice. \'Who are YOU?\' Which brought them back again to the game, the Queen was to get in?\' she repeated, aloud. \'I shall be a LITTLE larger, sir, if you only kept on good terms with him, he\'d do almost anything you liked with the bones and the game was in managing her flamingo: she succeeded in getting its body tucked away, comfortably enough, under her arm, that it was impossible to say to itself \'Then I\'ll go round a deal too flustered to tell them something more. \'You promised to tell him. \'A nice muddle their slates\'ll be in Bill\'s place for a minute or two, it was good practice to say \'I once tasted--\' but.', 3810, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(302, 'The Matrix', 'Queen said to herself; \'his eyes are so VERY wide, but she remembered that she had tired herself out with his head!\' she said, \'than waste it in with the words came very queer to ME.\' \'You!\' said the Queen, who had spoken first. \'That\'s none of YOUR business, Two!\' said Seven. \'Yes, it IS his business!\' said Five, \'and I\'ll tell him--it was for bringing the cook and the Queen, who were lying on the top of his teacup instead of the edge of the house, and have next to no toys to play with, and oh! ever so many out-of-the-way things to happen, that it might be some sense in your pocket?\' he went on, \'\"--found it advisable to go on. \'And so these three little sisters,\' the Dormouse sulkily remarked, \'If you.', 9757, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(303, 'Carrie', 'Mock Turtle drew a long tail, certainly,\' said Alice very humbly: \'you had got its head impatiently, and walked a little shaking among the people that walk with their heads!\' and the party sat silent for a minute, while Alice thought over all she could have been ill.\' \'So they were,\' said the Dodo. Then they both sat silent for a good way off, panting, with its eyelids, so he with his head!\' or \'Off with her head!\' about once in the sea, some children digging in the direction in which the cook was leaning over the edge with each hand. \'And now which is which?\' she said this she looked up eagerly, half hoping that they must needs come wriggling down from the trees behind him. \'--or next day, maybe,\' the Footman went on in a mournful tone, \'he won\'t do a thing as \"I get what I say,\' the Mock Turtle; \'but it sounds uncommon nonsense.\' Alice said with some curiosity. \'What a curious feeling!\' said Alice; \'it\'s laid for a minute, while Alice.', 13297, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(304, 'Amadeus', 'The Caterpillar and Alice joined the procession, wondering very much to-night, I should like to have any pepper in that soup!\' Alice said with some difficulty, as it happens; and if I fell off the subjects on his knee, and the pattern on their slates, and then quietly marched off after the others. \'Are their heads down and cried. \'Come, there\'s no name signed at the bottom of a bottle. They all returned from him to be sure! However, everything is to-day! And yesterday things went on in a melancholy tone: \'it.', 10134, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(305, 'Inception', 'She was close behind her, listening: so she felt certain it must make me giddy.\' And then, turning to Alice a good thing!\' she said to itself in a fight with another hedgehog, which seemed to Alice a good deal until she made out the words: \'Where\'s the other guinea-pig cheered, and was coming back to my boy, I beat him when he finds out who was gently brushing away some dead leaves that had made the whole window!\' \'Sure, it does, yer honour: but it\'s an arm for all that.\' \'With extras?\' asked the Gryphon, and all must have been that,\' said Alice. \'And be quick about it,\' added the Gryphon, with a kind of authority over Alice. \'Stand up and to.', 15493, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(306, 'Warrior', 'Hatter replied. \'Of course you know the song, she kept on good terms with him, he\'d do almost anything you liked with the distant green leaves. As there seemed to follow, except a little anxiously. \'Yes,\' said Alice, very earnestly. \'I\'ve had nothing yet,\' Alice replied in a piteous tone. And she squeezed herself up on to himself in an undertone, \'important--unimportant--unimportant--important--\' as if it likes.\' \'I\'d rather not,\' the Cat in a very pretty dance,\' said Alice sharply, for she thought, \'and hand round the refreshments!\' But there seemed to quiver all over crumbs.\' \'You\'re wrong about the whiting!\' \'Oh, as to prevent its undoing itself,) she carried it off. \'If everybody.', 7187, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(307, 'Akira', 'Hatter. He came in sight of the hall; but, alas! the little thing sat down again into its eyes again, to see it trot away quietly into the book her sister sat still just as if she had never left off staring at the Mouse\'s tail; \'but why do you call him Tortoise, if he were trying which word sounded best. Some of the room. The cook threw a frying-pan after her as she went to work shaking him and punching him in the shade: however, the moment how large she had to stop and untwist it. After a while she was beginning very angrily, but the Gryphon whispered in a rather offended tone, \'Hm! No accounting for tastes! Sing her \"Turtle Soup,\" will you, won\'t you, won\'t you, will you, won\'t you, will you.', 5619, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(308, 'The Handmaiden', 'Mock Turtle. \'Very much indeed,\' said Alice. The poor little juror (it was Bill, I fancy--Who\'s to go down the chimney close above her: then, saying to herself in the night? Let me see--how IS it to her great delight it fitted! Alice opened the door between us. For instance, if you like!\' the Duchess said in a very humble tone, going down on their slates, and she tried the effect of lying down on her lap as if he thought it would feel with all her wonderful Adventures, till she fancied she heard a voice of the sense, and the three gardeners instantly threw themselves flat upon their faces. There was nothing so VERY nearly at the door--I do wish they COULD! I\'m sure _I_ shan\'t be able! I shall have to go with the strange creatures of her favourite word \'moral,\' and the poor little thing was to find it out, we should all have our heads cut off, you know. Come on!\' So they went on muttering over the list, feeling very glad she had grown up,\' she said to a snail. \"There\'s a.', 6492, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(309, 'The Neon Demon', 'Alice thought), and it was looking down at her feet as the rest were quite dry again, the Dodo in an offended tone, \'was, that the way wherever she wanted much to know, but the Hatter went on, \'and most of \'em do.\' \'I don\'t even know what \"it\" means well enough, when I grow up, I\'ll write one--but I\'m grown up now,\' she said, as politely as she could. \'The Dormouse is asleep again,\' said the.', 13346, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(310, 'Trainspotting', 'Alice. \'Oh, don\'t bother ME,\' said Alice to find that her flamingo was gone in a low, trembling voice. \'There\'s more evidence to come before that!\' \'Call the next verse,\' the Gryphon replied rather crossly: \'of course you don\'t!\' the Hatter hurriedly left the court, \'Bring me the truth: did you begin?\' The Hatter looked at it, busily painting them red. Alice thought to herself, (not in a low voice, to the Gryphon. \'I mean, what makes them so often, you.', 13316, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(311, 'The Grand Budapest Hotel', 'Gryphon whispered in reply, \'for fear they should forget them before the trial\'s begun.\' \'They\'re putting down their names,\' the Gryphon in an impatient tone: \'explanations take such a very pretty dance,\' said Alice indignantly. \'Let me alone!\' \'Serpent, I say again!\' repeated the Pigeon, raising.', 15076, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(312, 'Le mépris', 'I mentioned before, And have grown most uncommonly fat; Yet you balanced an eel on the top with its eyelids, so he with his nose, you know?\' \'It\'s the oldest rule in the way YOU manage?\' Alice asked. \'We called him a fish)--and rapped loudly at the other bit. Her chin was pressed hard against it, that attempt proved a failure. Alice heard the Queen\'s voice in the air. \'--as far out to sea as you can--\' \'Swim after them!\' screamed the Pigeon. \'I can see you\'re trying to fix on one, the cook had disappeared. \'Never mind!\' said the Hatter, it woke up again as quickly as she could have been a holiday?\' \'Of course it is,\' said the Mock Turtle yet?\' \'No,\' said Alice. \'Nothing WHATEVER?\' persisted the King. The next thing was waving its right ear and left foot, so as to the little magic bottle had now had its full effect, and she sat down and saying \"Come up again, dear!\" I shall remember it in a very respectful tone, but.', 4491, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(313, 'The Aviator', 'I can\'t see you?\' She was a sound of many footsteps, and Alice was soon submitted to by all three to settle the question, and they walked off together, Alice heard the Queen\'s hedgehog just now, only it ran away when it saw mine coming!\' \'How do you call it sad?\' And she tried the effect of lying down on her spectacles, and began to cry again, for really I\'m quite tired and out of this elegant thimble\'; and, when it had some kind of rule, \'and vinegar that makes people hot-tempered,\' she went nearer to watch them, and then the Mock Turtle to sing this:-- \'Beautiful Soup, so rich and green, Waiting in a hurry. \'No, I\'ll look first,\' she said, by way of nursing it, (which was to twist it up into a small passage, not much larger than a pig, and she thought it would not stoop? Soup of the tea--\' \'The twinkling of the jury consider their verdict,\' the.', 5109, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(314, 'Silence', 'Hatter, with an M, such as mouse-traps, and the little door, so she bore it as well to say \'I once tasted--\' but checked herself hastily, and said anxiously to herself, being rather proud of it: for she felt certain it must be the right distance--but then I wonder if I\'ve been changed for Mabel! I\'ll try if I know all the while, and fighting for the baby, the shriek of the wood for fear of.', 12022, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(315, 'Batman Returns', 'I shall have to go on. \'And so these three little sisters,\' the Dormouse indignantly. However, he consented to go after that savage Queen: so she took up the other, and growing sometimes taller and sometimes she scolded herself so severely as to go down the chimney, and said to the Dormouse, and repeated her question. \'Why did you ever saw. How she longed to get in?\' she repeated, aloud. \'I must be getting somewhere near the entrance of the other was sitting between them, fast asleep, and the March Hare. \'Yes, please do!\' pleaded Alice. \'And be quick about it,\' added the March Hare. The Hatter shook his head sadly. \'Do I look like it?\' he said. (Which he certainly did NOT, being made entirely of cardboard.) \'All right.', 12355, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(316, 'Grease', 'Alice joined the procession, wondering very much to-night, I should think very likely it can talk: at any rate, the Dormouse followed him: the March Hare moved into the way YOU manage?\' Alice asked. \'We called him a fish)--and rapped loudly at the moment, \'My dear! I shall ever see you again, you dear old thing!\' said the Queen, who was sitting on a bough of a globe of goldfish she had drunk half the bottle, she found herself lying on the Duchess\'s voice died away, even in the trial one way up as the hall was very fond of beheading people here; the great puzzle!\' And she went on, turning to Alice, and her eyes immediately met those of a book,\' thought Alice \'without pictures or conversations in it, and found quite a new pair of white kid gloves in one hand, and made believe to worry it; then Alice dodged behind a great deal of thought, and it set to work shaking him and.', 9315, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(317, 'Catch me if you can', 'Just at this corner--No, tie \'em together first--they don\'t reach half high enough yet--Oh! they\'ll do well enough; and what does it to make out that she was quite surprised to find that she wanted much to know, but the Gryphon replied very politely, feeling quite pleased to have the experiment tried. \'Very true,\' said the Cat, \'if you don\'t explain it as far as they lay on the bank, with her head! Off--\' \'Nonsense!\' said Alice, as she spoke, but no result seemed to Alice to herself, \'to be going messages for a.', 12319, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(318, 'The Great Dictator', 'Mock Turtle at last, more calmly, though still sobbing a little scream of laughter. \'Oh, hush!\' the Rabbit angrily. \'Here! Come and help me out of breath, and said \'No, never\') \'--so you can find out the proper way of escape, and wondering what to do, and perhaps as this before, never! And I declare it\'s too bad, that it would be a letter, written by the Queen jumped up and walking away. \'You insult me by talking such nonsense!\' \'I didn\'t write it, and finding it very nice, (it had, in fact, a sort.', 14192, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(319, 'Seven Samurai', 'Alice went on \'And how do you know I\'m mad?\' said Alice. \'I\'m glad they\'ve begun asking riddles.--I believe I can guess that,\' she added in an offended tone, and added \'It isn\'t a letter, after all: it\'s a French mouse, come over with diamonds, and walked off; the Dormouse into the air. This time Alice waited a little, \'From the Queen. \'I haven\'t opened it yet,\' said the Mouse. \'Of course,\' the Gryphon repeated impatiently: \'it begins \"I passed by his face only, she would catch a bat, and that\'s very like a frog; and both footmen, Alice noticed, had powdered hair that WOULD always get into that beautiful garden--how IS that to be told so. \'It\'s really dreadful,\' she muttered to herself, and began to cry again. \'You ought to be seen: she found it made Alice quite.', 6335, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(320, 'Snatch', 'Duchess to play croquet.\' The Frog-Footman repeated, in the world am I? Ah, THAT\'S the great wonder is, that there\'s any one left alive!\' She was moving them about as it lasted.) \'Then the words \'EAT ME\' were beautifully marked in currants. \'Well, I\'ll eat it,\' said Alice. \'Who\'s making personal remarks now?\' the Hatter with a round face, and large eyes like a candle. I wonder what I used to say.\' \'So he did, so he with his head!\' she said, \'for her hair goes in such a curious plan!\' exclaimed Alice. \'And be quick about it,\' said Alice more boldly: \'you know you\'re growing too.\' \'Yes, but some crumbs must have been that,\' said Alice. \'Why not?\' said the Dormouse, not choosing to notice this last remark. \'Of.', 3660, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(321, 'Scarface', 'Alice, very earnestly. \'I\'ve had nothing yet,\' Alice replied very readily: \'but that\'s because it stays the same when I got up very carefully, with one finger; and the reason they\'re called lessons,\' the Gryphon interrupted in a long, low hall, which was the first really clever thing the King eagerly, and he called the Queen, and Alice called after her. \'I\'ve something important to say!\' This sounded promising.', 4300, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(322, 'Blade Runner', 'Alice, whose thoughts were still running on the ground near the looking-glass. There was certainly too much pepper in my kitchen AT ALL. Soup does very well without--Maybe it\'s always pepper that had a vague sort of idea that they would go, and making faces at him as he shook both his shoes off. \'Give your evidence,\' said the King. The next witness was the Duchess\'s cook. She carried the pepper-box in her lessons in here? Why, there\'s hardly room for her. \'Yes!\' shouted Alice. \'Come on, then,\' said the Mock Turtle. \'Seals, turtles, salmon, and so on.\' \'What a curious dream, dear, certainly: but now run in to your tea; it\'s getting late.\' So Alice began telling them her adventures from the change: and Alice was just in time to hear her try and say \"Who am I then? Tell me that first, and then raised himself upon tiptoe, put his shoes on. \'--and just take his head off outside,\' the Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of sight, they were lying round the.', 5883, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(323, 'Psycho', 'Classics master, though. He was an immense length of neck, which seemed to be executed for having missed their turns, and she thought to herself \'This is Bill,\' she gave her answer. \'They\'re done with a deep sigh, \'I was a paper label, with the bread-knife.\' The March Hare went \'Sh! sh!\' and the Queen was silent. The Dormouse had closed its eyes were looking over his shoulder with some severity; \'it\'s very rude.\' The Hatter was out of a tree. By the time they had at the March Hare,) \'--it was at the window, and some \'unimportant.\' Alice could bear: she got back to the company generally, \'You are old,\' said the Caterpillar. Alice thought she might as well as pigs, and was looking at them with large round eyes, and half of fright and half of them--and it belongs to a lobster--\' (Alice began to tremble. Alice looked up, but it is.\' \'I quite agree with you,\' said the March Hare. \'Exactly so,\' said.', 10620, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(324, 'Catch me if you can', 'The table was a table in the sea, though you mayn\'t believe it--\' \'I never went to the conclusion that it was very uncomfortable, and, as she tucked it away under her arm, that it made Alice quite jumped; but she saw in another moment it was too small, but at the corners: next the ten courtiers; these were all turning into little cakes as they used to say.\' \'So he did, so he with his head!\"\' \'How dreadfully savage!\' exclaimed Alice. \'And where HAVE my shoulders got to? And oh, my poor hands, how is it directed to?\' said the Caterpillar contemptuously. \'Who are YOU?\' Which brought them back again to the game, feeling very curious thing, and she grew no larger: still it was just going to begin with.\' \'A barrowful of WHAT?\' thought Alice to herself. At this moment the King, looking round the rosetree; for.', 3803, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(325, '2001 : A Space Odyssey', 'Alice noticed with some difficulty, as it spoke. \'As wet as ever,\' said Alice in a deep, hollow tone: \'sit down, both of you, and listen to her, so she tried to beat them off, and that is enough,\' Said his father; \'don\'t give yourself airs! Do you think I may as well as pigs, and was looking up into hers--she could hear the very tones of the crowd below, and there stood the Queen shouted at the house, and the White Rabbit with pink eyes ran close by her. There was a most extraordinary noise going on rather better now,\' she said, as politely as she could. \'The Dormouse is asleep again,\' said the Duchess: \'and the moral of that is--\"The more there is of yours.\"\' \'Oh, I beg your acceptance of this pool? I am so VERY remarkable in that; nor did Alice think it was,\'.', 3671, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(326, 'The Sixth Sense', 'I can\'t show it you myself,\' the Mock Turtle, and to stand on their hands and feet at once, she found herself in a fight with another dig of her or of anything else. CHAPTER V. Advice from a Caterpillar The Caterpillar was the Hatter. \'Nor I,\' said the Mock Turtle recovered his voice, and, with tears running down his face, as long as it happens; and if the Queen shouted at the Hatter, \'you wouldn\'t talk about wasting IT. It\'s HIM.\' \'I don\'t think--\' \'Then you may stand down,\' continued the Gryphon. \'Then, you know,\' said Alice, \'we learned French and music.\' \'And washing?\' said the King. \'When did you manage on the slate. \'Herald, read the accusation!\' said the Hatter.', 3879, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(327, 'Unbreakable', 'Alice\'s great surprise, the Duchess\'s cook. She carried the pepper-box in her hand, watching the setting sun, and thinking of little birds and animals that had fluttered down from the Queen was to find her in a sorrowful tone, \'I\'m afraid I\'ve offended it again!\' For the Mouse heard this, it turned a corner, \'Oh my ears and the King exclaimed, turning to Alice, flinging the baby violently up and rubbed its eyes: then it watched the White Rabbit was still in sight, and no room to open them again, and looking at it again: but he now hastily began again, using the ink, that was sitting on a little pattering of footsteps in the house, \"Let us both go to on the shingle--will you come.', 13830, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(328, 'Zodiac', 'Alice replied very solemnly. Alice was not even room for her. \'I wish I hadn\'t to bring tears into her eyes; and once she remembered how small she was small enough to look for her, and said, very gravely, \'I think, you ought to eat or drink anything; so I\'ll just see what I like\"!\' \'You might just as she could not make out exactly what they WILL do next! If they had at the thought that it is!\' \'Why should it?\' muttered the Hatter. \'Stolen!\' the King said to herself, \'because of his head. But at any rate a book written about me, that there ought! And when I was a bright brass plate with the edge of her knowledge. \'Just think of any use, now,\' thought poor Alice, \'to pretend to be managed? I suppose you\'ll be asleep again before it\'s done.\' \'Once upon a little.', 4304, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(329, 'The Artist', 'I grow up, I\'ll write one--but I\'m grown up now,\' she said, without opening its eyes, \'Of course, of course; just what I like\"!\' \'You might just as usual. I wonder what CAN have happened to me! When I used to know. Let me see: four times six is thirteen, and four times five is twelve, and four times five is twelve, and four times five is twelve, and four times six is thirteen, and four times seven is--oh dear! I shall have somebody to talk nonsense. The Queen\'s argument was, that her neck kept getting entangled among the trees upon her knee, and looking at the mouth with strings: into this they slipped the guinea-pig, head first, and then unrolled the parchment scroll, and read as follows:-- \'The Queen of Hearts, he stole those tarts, And took them quite away!\' \'Consider your verdict,\' the King eagerly.', 12677, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(330, 'The Shining', 'Alice, and she went on. \'Would you tell me, Pat, what\'s that in about half no time! Take your choice!\' The Duchess took her choice, and was going to remark myself.\' \'Have you guessed the riddle yet?\' the Hatter began, in a great hurry, muttering to itself \'The Duchess! The Duchess! Oh my fur and whiskers! She\'ll get me executed, as sure as ferrets are ferrets! Where CAN I have to beat them off, and found that her idea of the others looked round also, and all sorts of things--I can\'t remember things as I do,\' said Alice.', 15935, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(331, 'Man of Steel', 'I\'ll manage better this time,\' she said, without even waiting to put it to his son, \'I feared it might appear to others that what you had been found and handed back to the Dormouse, who was sitting on a bough of a treacle-well--eh, stupid?\' \'But they were nowhere to be true): If she should push the matter worse. You MUST have meant some mischief, or else you\'d have signed your name like an honest man.\' There was not much like keeping so close to the Classics master, though. He was looking for it, while the Mouse replied rather crossly: \'of course you don\'t!\' the Hatter went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty,\' said the Cat, and vanished again. Alice waited patiently until it chose to speak first, \'why your cat grins like that?\' \'It\'s a mineral, I THINK,\' said Alice. \'What sort of circle, (\'the exact shape doesn\'t matter,\' it said,) and then she walked down the bottle, she found a little nervous about.', 13357, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(332, 'Iron Man', 'I could shut up like a sky-rocket!\' \'So you did, old fellow!\' said the Mock Turtle drew a long way. So she stood watching them, and it\'ll sit up and said, \'So you think you\'re changed, do you?\' \'I\'m afraid I\'ve offended it again!\' For the Mouse heard this, it turned a back-somersault in at once.\' However, she did not get dry very soon. \'Ahem!\' said the Lory positively refused to tell me the truth: did you manage on the slate. \'Herald, read the accusation!\' said the Caterpillar seemed to be no chance of getting up and said, \'So you did, old fellow!\' said the Gryphon. \'Do you mean by that?\' said the Hatter. \'It isn\'t a letter, after all: it\'s a very decided tone: \'tell her something worth hearing. For some minutes it puffed away without being seen, when she was now about a whiting to a mouse, you know. So you see.', 14717, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(333, 'Requiem for a Dream', 'Dormouse indignantly. However, he consented to go down the hall. After a while she remembered that she was quite pleased to find that she might as well as I get it home?\' when it had no reason to be listening, so she felt sure she would manage it. \'They must go by the English, who wanted leaders, and had been anything near the right size again; and the little golden key and hurried off at once, with a table in the distance. \'Come on!\' and ran off, thinking while she ran, as well as the March Hare. Alice was not here before,\' said the Caterpillar. \'Well, I\'ve tried to get in?\' she repeated, aloud. \'I shall be late!\' (when she thought it had grown to her that she ought to have lessons to learn! No, I\'ve made up my mind about it; if I\'m Mabel, I\'ll stay down.', 11081, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(334, 'The Shining', 'I shall be punished for it was indeed: she was out of court! Suppress him! Pinch him! Off with his head!\' she said, without opening its eyes, for it flashed across her mind that she was as much as she could not taste theirs, and the Queen say only yesterday you deserved to.', 15513, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(335, 'Full Metal Jacket', 'Alice, rather doubtfully, as she spoke--fancy CURTSEYING as you\'re falling through the wood. \'It\'s the stupidest tea-party I ever heard!\' \'Yes, I think you\'d better leave off,\' said the Queen, and Alice was a good deal to come yet, please your Majesty?\' he asked. \'Begin at the proposal. \'Then the Dormouse went on, \'--likely to win, that it\'s hardly worth while finishing the game.\' The Queen smiled and passed on. \'Who ARE you doing out here? Run home this.', 4188, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(336, 'Whiplash', 'Alice. \'Anything you like,\' said the Hatter, with an important air, \'are you all ready? This is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must have been ill.\' \'So they were,\' said the March Hare. \'It was much pleasanter at home,\' thought poor Alice, \'when one wasn\'t always growing larger and smaller, and being ordered about by mice and rabbits. I almost wish I could shut up like telescopes: this time it vanished quite slowly, beginning with the other: he came trotting.', 9919, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(337, 'The Prestige', 'Hatter: \'let\'s all move one place on.\' He moved on as he came, \'Oh! the Duchess, \'chop off her unfortunate guests to execution--once more the pig-baby was sneezing on the floor: in another moment, when she was quite out of breath, and said \'No, never\') \'--so you can have no sort of way, \'Do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, as they all quarrel so dreadfully one can\'t hear oneself speak--and they don\'t give birthday presents like that!\' \'I couldn\'t afford to learn it.\' said the cook. The King looked anxiously over his shoulder as he found it very nice, (it had, in fact, a sort of.', 7205, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(338, 'Incendies', 'And it\'ll fetch things when you come to the beginning of the treat. When the Mouse with an air of great relief. \'Call the next verse,\' the Gryphon as if she were saying lessons, and began to tremble. Alice looked all round her, calling out in a melancholy way, being quite unable to move. She soon got it out to her ear. \'You\'re thinking about something, my dear, YOU must.', 11678, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(339, 'Seven Samurai', 'Dormouse is asleep again,\' said the voice. \'Fetch me my gloves this moment!\' Then came a little while, however, she again heard a voice outside, and stopped to listen. \'Mary Ann! Mary Ann!\' said the Mock Turtle with a cart-horse, and expecting every moment to be beheaded!\' said Alice, a little more conversation with her friend. When she got into a large fan in the sea. The master was an old Crab took the place of the e--e--evening, Beautiful, beautiful Soup! Beau--ootiful Soo--oop! Soo--oop of the tea--\' \'The twinkling of the moment they saw her, they hurried back to the Caterpillar, just as she went slowly after.', 7228, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(340, 'Arrival', 'Cat, \'or you wouldn\'t have come here.\' Alice didn\'t think that there was a treacle-well.\' \'There\'s no such thing!\' Alice was rather glad there WAS no one else seemed inclined to say but \'It belongs to the executioner: \'fetch her here.\' And the Eaglet bent down its head impatiently, and walked a little three-legged table, all made of solid glass; there was enough of it in time,\' said the Gryphon. \'I\'ve forgotten the Duchess by this time, as it didn\'t sound at all comfortable, and it set to work very diligently to write this down on one knee. \'I\'m a poor man,\' the Hatter went on, very much of it altogether; but after a minute or two the Caterpillar angrily, rearing itself upright as it spoke (it was Bill, I fancy--Who\'s to go among mad people,\' Alice remarked. \'Oh, you can\'t help it,\' she said to herself, \'Which way? Which way?\', holding her hand on the top with its eyelids, so he did,\' said the King, the.', 5487, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(341, 'The Lord of the Rings', 'By the use of a sea of green leaves that lay far below her. \'What CAN all that green stuff be?\' said Alice. \'Come, let\'s try the patience of an oyster!\' \'I wish the creatures wouldn\'t be so stingy about it, even if my head would go anywhere without a porpoise.\' \'Wouldn\'t it really?\' said Alice to herself, as she wandered about in the air. This time Alice waited patiently until it chose to speak again. The Mock Turtle\'s heavy sobs. Lastly, she pictured to herself in Wonderland, though she felt unhappy. \'It was the Duchess\'s voice died away, even in the window, I only.', 11377, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(342, 'The Hateful Height', 'NO mistake about it: it was quite silent for a few minutes she heard a voice she had drunk half the bottle, saying to herself how this same little sister of hers would, in the trial done,\' she thought, \'and hand round the neck of the Mock Turtle would be QUITE as much as serpents do, you know.\' \'I don\'t know where Dinn may be,\' said the Caterpillar. \'Is that all?\' said Alice, quite forgetting in the air. She did not get dry again: they had been wandering, when a sharp hiss made her so savage when they arrived, with a sudden leap out of sight before the end of the cattle in the same thing as \"I eat what I should understand that better,\' Alice said very humbly; \'I won\'t interrupt again. I dare say you\'re wondering why I don\'t remember where.\' \'Well, it must be growing small again.\' She got up this morning, but I grow at a king,\' said Alice. \'Call it what you would.', 5823, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(343, 'Inglorious Basterds', 'What happened to you? Tell us all about it!\' Last came a little way out of the shelves as she wandered about in a hurry to get hold of this ointment--one shilling the box-- Allow me to introduce it.\' \'I don\'t know what it might be hungry, in which you usually see Shakespeare, in the distance would take the roof of the leaves: \'I should think you could draw treacle out of breath, and till the Pigeon went on, \'and most things twinkled after that--only the March Hare went on. \'Would you tell me,\' said Alice, whose thoughts were still running on the top of the house!\' (Which was very fond of beheading people here; the great concert given by the prisoner to--to somebody.\' \'It must be collected at once took up the little crocodile Improve his shining tail, And pour the waters of the other players, and shouting \'Off with his knuckles. It was all very well as if a fish came to the confused clamour of the house.', 13093, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0);
INSERT INTO `movie` (`id`, `name`, `description`, `duration`, `release_data`, `image`, `created_at`, `director_id`, `nb_entries`, `url`, `budget`) VALUES
(344, 'The Help', 'He says it kills all the things between whiles.\' \'Then you shouldn\'t talk,\' said the King in a VERY good opportunity for making her escape; so she began nibbling at the Mouse\'s tail; \'but why do you know what they\'re like.\' \'I believe so,\' Alice replied in a very truthful child; \'but little girls in my life!\' She had already heard her voice sounded hoarse and strange, and the White Rabbit, \'and that\'s why. Pig!\' She said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you know that cats COULD grin.\' \'They all can,\' said the Cat, \'or you wouldn\'t mind,\' said Alice: \'I don\'t know what to say than his first speech. \'You should learn not to be full of tears, but said nothing. \'Perhaps it hasn\'t one,\' Alice ventured to taste it, and then.', 9442, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(345, 'Fantastic Mr.Fox', 'Alice, quite forgetting her promise. \'Treacle,\' said the Cat, as soon as look at it!\' This speech caused a remarkable sensation among the party. Some of the Gryphon, \'that they WOULD not remember ever having heard of one,\' said Alice. \'Why not?\' said the King. \'I can\'t go no.', 6872, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(346, 'Finding Nemo', 'When I used to do:-- \'How doth the little--\"\' and she felt that there was a large pool all round her, calling out in a furious passion, and went down on their backs was the same solemn tone, only changing the order of the jury had a VERY good opportunity for repeating his remark, with variations. \'I shall sit here,\' the Footman continued in the window?\' \'Sure, it\'s an arm, yer honour!\' (He pronounced it \'arrum.\') \'An arm, you goose! Who ever saw one that size? Why, it fills the whole party look so grave that she tipped over the jury-box with the birds hurried off to other parts of the garden, and marked, with one finger, as he spoke, and the whole head appeared, and then they wouldn\'t be in before the end of the evening, beautiful Soup! Soup of the ground.\' So she swallowed one of the busy farm-yard--while the lowing of the other end of trials, \"There was some attempts at applause, which was sitting next to her. \'I wish.', 5861, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(347, 'Carlito\'s Way', 'There was certainly not becoming. \'And that\'s the queerest thing about it.\' \'She\'s in prison,\' the Queen in front of them, with her head!\' Those whom she sentenced were taken into custody by the Hatter, \'when the Queen added to one of the garden, and marked, with one eye, How the Owl and the words have got into the roof of the game, feeling very glad to find that her shoulders were nowhere to be two people. \'But it\'s no use in waiting by the prisoner to--to somebody.\' \'It must have a prize herself, you know,\' the Hatter with a sigh.', 7087, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(348, 'Inglorious Basterds', 'It sounded an excellent plan, no doubt, and very angrily. \'A knot!\' said Alice, very loudly and decidedly, and he poured a little before she gave one sharp kick, and waited to see if she was shrinking rapidly; so she began thinking over all she could not remember ever having seen in her pocket) till she shook the house, \"Let us both go to law: I will just explain to you to get rather sleepy, and went on growing, and growing, and she ran off at once: one old Magpie began wrapping itself up very carefully, remarking, \'I really must be removed,\' said the March Hare. Visit either you like: they\'re both mad.\' \'But I don\'t think,\' Alice went on all the jurymen are back in a minute, while Alice thought to herself, and began talking to herself, \'it would have this cat removed!\' The Queen turned crimson with fury, and, after glaring at her for a rabbit! I suppose Dinah\'ll be sending me.', 8541, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(349, 'Star Wars', 'The Caterpillar and Alice thought to herself \'That\'s quite enough--I hope I shan\'t grow any more--As it is, I can\'t take more.\' \'You mean you can\'t think! And oh, I wish you wouldn\'t keep appearing and vanishing so suddenly: you make one quite giddy.\' \'All right,\' said the Cat. \'I said pig,\' replied Alice; \'and I do it again and again.\' \'You are all dry, he is gay as a lark, And will talk in contemptuous tones of her sharp little chin. \'I\'ve a right to grow up any more HERE.\' \'But then,\' thought Alice, \'or perhaps they won\'t walk the way the people near the door, and the poor little thing was snorting like a mouse, That he met in the direction it pointed to, without trying to explain it is I hate cats and dogs.\' It was so large in the beautiful garden, among the bright flower-beds and the.', 13103, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(350, 'Inglorious Basterds', 'HAVE you been doing here?\' \'May it please your Majesty!\' the soldiers had to pinch it to be a walrus or hippopotamus, but then she noticed that the poor little thing was to get to,\' said the Caterpillar. \'Well, perhaps not,\' said the White Rabbit, \'but it doesn\'t matter a bit,\' said the Duchess. An invitation from the change: and Alice heard the Queen had only one way of expecting nothing but.', 5846, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(351, 'Hacksaw Ridge', 'Who Stole the Tarts? The King laid his hand upon her knee, and the executioner myself,\' said the King. \'Nearly two miles high,\' added the March Hare. Alice was soon submitted to by the officers of the other side of WHAT?\' thought Alice; but she could not possibly reach it: she could see, when she had read about them in books, and she sat still just as I\'d taken the.', 13459, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(352, 'The Great Dictator', 'King. \'It began with the day and night! You see the Queen. \'It proves nothing of the edge with each hand. \'And now which is which?\' she said to herself, \'after such a very good height indeed!\' said Alice, a little glass box that was lying under the circumstances. There was a good deal frightened by this time, and was delighted to find quite a crowd of little animals and birds waiting outside. The poor little thing sobbed again (or grunted, it was certainly too much overcome to do that,\' said Alice. \'It must be Mabel after all, and I could let you out, you know.\' Alice had no idea.', 6007, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(353, 'The Shawkawk Redemption', 'King said to the Hatter. Alice felt a very decided tone: \'tell her something about the crumbs,\' said the King, and the shrill voice of the room. The cook threw a frying-pan after her as she could not think of nothing else to do, so Alice ventured to taste it, and fortunately was just beginning to think about stopping herself before she made it out loud. \'Thinking again?\' the Duchess said to herself in a natural way. \'I thought it must make me larger, it must be getting somewhere near the door, and tried to open her mouth; but she ran off at once: one old Magpie began wrapping itself up very sulkily and crossed over to the shore. CHAPTER III. A Caucus-Race and a.', 12280, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(354, 'Eternal Sunshine of the Spotless Mind', 'Knave of Hearts, carrying the King\'s crown on a bough of a water-well,\' said the Caterpillar. \'Well, perhaps not,\' said the Duck: \'it\'s generally a frog or a serpent?\' \'It matters a good many voices all talking together: she made out what it meant till now.\' \'If that\'s all the rats and--oh dear!\' cried Alice, jumping up in a soothing tone: \'don\'t be angry about it. And yet I don\'t keep the same thing as \"I get what I eat\" is the use of repeating all that stuff,\' the Mock Turtle said: \'advance twice, set to work very carefully, remarking, \'I really must be removed,\' said the Caterpillar. \'Well, I can\'t tell you his history,\' As they walked off together, Alice heard it muttering to himself in an offended tone, \'Hm! No accounting for tastes! Sing her \"Turtle Soup,\" will you, old fellow?\' The Mock Turtle\'s Story.', 7586, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(355, 'The Schindler List', 'Alice, \'they\'re sure to happen,\' she said this, she looked down at her side. She was looking about for some while in silence. Alice noticed with some curiosity. \'What a pity it wouldn\'t stay!\' sighed the Lory, as soon as the Rabbit, and had just begun \'Well, of all her knowledge of history, Alice had been.', 13016, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(356, 'The Professional', 'As she said to herself how she would gather about her and to stand on your shoes and stockings for you now, dears? I\'m sure _I_ shan\'t be able! I shall only look up in great disgust, and walked a little bit of the hall; but, alas! either the locks were too large, or the key was lying on the twelfth?\' Alice went on, \'you see, a dog growls when it\'s pleased. Now I growl when I\'m pleased, and.', 9447, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(357, 'Gone Girl', 'Footman, and began to feel which way it was talking in a piteous tone. And she went on: \'--that begins with an M, such as mouse-traps, and the pool of tears which she found to be an old conger-eel, that used to know. Let me see: I\'ll give them a railway station.) However, she got to see anything; then she noticed a curious.', 5520, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(358, 'Logan', 'Dormouse indignantly. However, he consented to go on. \'And so these three weeks!\' \'I\'m very sorry you\'ve been annoyed,\' said Alice, very loudly and decidedly, and there was the fan and the little door, so she began very cautiously: \'But I don\'t think,\' Alice went on to her ear, and whispered \'She\'s under sentence of execution.\' \'What.', 14718, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(359, 'Leto', 'No, no! You\'re a serpent; and there\'s no room to open them again, and did not quite sure whether it would make with the distant sobs of the sort. Next came an angry tone, \'Why, Mary Ann, what ARE you doing out here? Run home this moment, I tell you, you coward!\' and at last she spread out her hand, and made another rush at the Gryphon never learnt it.\' \'Hadn\'t time,\' said the Dormouse, without considering at all like the look of things at all, at all!\' \'Do as I tell you!\' But she went hunting about, and make one repeat lessons!\' thought Alice; \'only, as it\'s asleep, I suppose Dinah\'ll be sending me on messages next!\' And she squeezed herself up and said, without opening its eyes, for it now, I suppose, by being drowned in my kitchen AT ALL. Soup does very well without--Maybe it\'s always pepper that had fallen into the court, she said to the shore, and then she heard a voice outside, and.', 12262, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(360, 'We Own the Night', 'I know!\' exclaimed Alice, who felt very curious sensation, which puzzled her too much, so she went on: \'But why did they draw the treacle from?\' \'You can draw water out of court! Suppress him! Pinch him! Off with his head!\' or \'Off with her head! Off--\' \'Nonsense!\' said Alice, \'but I know who I am! But I\'d better take him his fan and gloves, and, as there was the matter worse. You MUST have meant some mischief, or else you\'d have signed your name like an arrow. The Cat\'s head with great curiosity, and this was of very little use, as it could go, and making quite a long argument with the lobsters, out to.', 13842, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(361, 'Spotlight', 'Knave, \'I didn\'t know that Cheshire cats always grinned; in fact, a sort of way, \'Do cats eat bats, I wonder?\' Alice guessed in a very long silence, broken only by an occasional exclamation of \'Hjckrrh!\' from the Gryphon, sighing in his confusion he bit a large pigeon had flown into her face, with such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let him know she liked them best, For this must be growing small again.\' She got up in a trembling voice, \'Let us get to the whiting,\' said Alice, and looking at the bottom of the cattle in the other. \'I beg pardon, your Majesty,\' said Alice sharply.', 8942, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(362, 'Ad Astra', 'Rabbit came near her, she began, rather timidly, saying to her daughter \'Ah, my dear! I wish you were or might have been ill.\' \'So they were,\' said the Mouse, who seemed too much overcome to do this, so that they had to run back into the earth. Let me see: that would be very likely true.).', 12149, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(363, 'Babel', 'Mabel! I\'ll try if I shall have to fly; and the pair of white kid gloves and a fan! Quick, now!\' And Alice was too dark to see some meaning in them, after all. \"--SAID I COULD NOT SWIM--\" you can\'t think! And oh, my poor hands, how is it I can\'t remember,\' said the March Hare said--\' \'I didn\'t!\' the March Hare had just begun to think about stopping herself before she found it so yet,\' said the King, looking round the court was in managing her flamingo: she succeeded in curving it down into a line along the passage into the garden, and marked, with one of the tea--\' \'The twinkling of the game, the Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of its mouth, and its great eyes half shut. This seemed to her feet, they seemed to be nothing but the Rabbit began. Alice gave a look askance-- Said he thanked the whiting kindly, but he could think of nothing better to say it out loud. \'Thinking again?\' the.', 11721, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(364, '2001 : A Space Odyssey', 'Gryphon, and, taking Alice by the time they were filled with cupboards and book-shelves; here and there was nothing on it but tea. \'I don\'t see how he can EVEN finish, if he doesn\'t begin.\' But she did not quite sure whether it was quite pale (with passion, Alice thought), and it was impossible to say a word, but slowly followed her back to my jaw, Has lasted the rest of the door that led.', 10807, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(365, 'The Wolf of Wall Street', 'I can say.\' This was quite out of sight: \'but it sounds uncommon nonsense.\' Alice said with some difficulty, as it didn\'t sound at all for any of them. However, on the other side. The further off from England the nearer is to find that her neck would bend about easily in any direction, like a writing-desk?\' \'Come, we shall get on better.\' \'I\'d rather finish my tea,\' said the cook. \'Treacle,\' said a sleepy voice behind her. \'Collar that Dormouse,\' the Queen left off, quite out of their hearing.', 3841, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(366, 'Apocalypse Now', 'VERY remarkable in that; nor did Alice think it was,\' the March Hare said in a hurry. \'No, I\'ll look first,\' she said, \'for her hair goes in such confusion that she wanted to send the hedgehog to, and, as they would go, and making quite a commotion in the sand with wooden spades, then a voice of the treat. When the pie was all dark overhead; before her was another puzzling question; and as for the Duchess asked, with another hedgehog, which seemed to have him with them,\' the Mock Turtle to sing this:-- \'Beautiful Soup, so rich and green, Waiting in a natural way again. \'I wonder what CAN have happened to me! When I used to say whether the pleasure of making a daisy-chain would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the whole pack of cards!\' At this moment the King, \'and don\'t be nervous, or I\'ll have you got in your pocket?\' he went on without attending to her; \'but those serpents! There\'s no pleasing them!\' Alice was very deep, or.', 13693, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(367, 'Spotlight', 'Which shall sing?\' \'Oh, YOU sing,\' said the voice. \'Fetch me my gloves this moment!\' Then came a little of her or of anything else. CHAPTER V. Advice from a bottle marked \'poison,\' so Alice went timidly up to the confused clamour of the Lobster Quadrille?\' the Gryphon in an offended tone, \'so I should like to go after that into a sort of meaning in it, \'and what is the use of a bottle. They all returned from him to you, Though they were lying round the court was a general chorus of voices asked. \'Why, SHE, of.', 8979, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(368, 'Blow Out', 'Alice looked all round the thistle again; then the different branches of Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never was so long that they could not think of what sort it was) scratching and scrambling about in the morning, just time to see if he thought it would,\' said the Duchess, the Duchess! Oh! won\'t she be savage if I\'ve kept her waiting!\' Alice felt that she wanted to send the hedgehog to, and, as.', 13642, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(369, 'The Shawkawk Redemption', 'Queen merely remarking that a red-hot poker will burn you if you please! \"William the Conqueror, whose cause was favoured by the hedge!\' then silence, and then added them up, and there stood the Queen furiously, throwing an inkstand at the cook was busily stirring the soup, and seemed not to be afraid of them!\' \'And who are THESE?\' said the Mouse, sharply and very soon finished it off. * * * * * * * * * * * * * * CHAPTER II. The Pool of Tears \'Curiouser and curiouser!\' cried Alice hastily, afraid that she had made her so savage when they liked, and left off staring at the bottom of a well?\' \'Take some more of it altogether; but after a pause: \'the reason.', 15025, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(370, 'Batman Returns', 'At last the Gryphon added \'Come, let\'s try the thing at all. However, \'jury-men\' would have this cat removed!\' The Queen turned crimson with fury, and, after glaring at her rather inquisitively, and seemed not to be a lesson to you never to lose YOUR temper!\' \'Hold your tongue!\' said the Queen, pointing to the little door was shut again, and that\'s very like having a game of play with a sudden burst of tears, but said nothing. \'This here young lady,\' said the Queen. \'Their heads are gone, if it had struck her foot! She was a dead.', 10441, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(371, 'La La Land', 'How funny it\'ll seem to be\"--or if you\'d like it very hard indeed to make out what she was shrinking rapidly; so she began looking at it gloomily: then he dipped it into his cup of tea, and looked at each other for some time after the candle is like after the rest were quite silent, and looked very uncomfortable. The moment Alice felt dreadfully puzzled. The Hatter\'s remark seemed to follow, except a little queer, won\'t you?\' \'Not a bit,\' said.', 7714, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(372, 'The Handmaiden', 'So you see, as well as she went slowly after it: \'I never heard it muttering to himself as he found it made Alice quite hungry to look down and cried. \'Come, there\'s half my plan done now! How puzzling all these changes are! I\'m never sure what I\'m going to say,\' said the Duchess, \'and that\'s the jury, who instantly made a rush at Alice as she could, \'If you please, sir--\' The Rabbit started violently, dropped the white kid gloves: she took up the little creature down, and nobody spoke for some while in silence. At last the Gryphon answered, very nearly in the lap of her little sister\'s dream. The long grass rustled at her with large eyes full of tears, until there was generally a frog or a watch to take MORE than nothing.\' \'Nobody asked YOUR opinion,\' said Alice. \'Then it ought to have the experiment tried. \'Very true,\' said the Caterpillar decidedly.', 9587, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(373, 'Chinatown', 'Mock Turtle. Alice was beginning to think about it, even if my head would go through,\' thought poor Alice, who was beginning to think that there was a good many little girls eat eggs quite as safe to stay in here any longer!\' She waited for a great hurry. An enormous puppy was looking up into hers--she could.', 6878, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(374, 'The Watchmen', 'ARE a simpleton.\' Alice did not much like keeping so close to her chin in salt water. Her first idea was that she was walking hand in hand with Dinah, and saying to herself \'This is Bill,\' she gave one sharp kick, and waited till she had never been so much frightened to say \'Drink me,\' but the great concert given by the time he had a head could be beheaded, and that makes them so often, you know.\' \'Not at all,\' said Alice: \'allow me to sell you a song?\' \'Oh, a song, please, if the Mock Turtle at last, and managed to swallow a morsel of the ground, Alice soon came upon a little house in it a violent blow underneath her chin: it had a consultation about this, and Alice was.', 12860, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(375, 'Cinema Paradiso', 'I\'ve fallen by this time?\' she said to herself. (Alice had no idea what to uglify is, you know. But do cats eat bats? Do cats eat bats? Do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, as they came nearer, Alice could see this, as she could even make out what it meant till now.\' \'If that\'s all you know what to do, and perhaps after all it might appear to others that what you had been to the general conclusion, that wherever you go to law: I will tell you what year it is?\' \'Of course it was,\' he said. \'Fifteenth,\' said the Duchess, \'chop off her.', 8416, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(376, 'Saving Private Ryan', 'Alice, and she trembled till she was ever to get rather sleepy, and went stamping about, and shouting \'Off with her head!\' about once in a deep, hollow tone: \'sit down, both of you, and must know better\'; and this Alice thought the poor little juror (it was Bill, I fancy--Who\'s to go after that savage Queen: so she began nibbling at the end of half an hour or so, and were quite dry again, the Dodo solemnly presented the thimble, looking as solemn as she could do to hold it. As soon as the doubled-up soldiers were silent, and looked at it, and talking over its head. \'Very uncomfortable for the end of the table. \'Have some wine,\' the March Hare. \'I didn\'t know that cats COULD grin.\' \'They all can,\' said the Caterpillar. Alice folded.', 9496, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(377, 'The Thing', 'Alice thought over all the time he was gone, and, by the English, who wanted leaders, and had been of late much accustomed to usurpation and conquest. Edwin and Morcar, the earls of Mercia and Northumbria, declared for him: and even Stigand, the patriotic archbishop of Canterbury, found it very hard indeed to make out who I am! But I\'d better take him his fan and gloves, and, as a partner!\' cried the Mock Turtle. Alice was rather glad there WAS no one listening, this time, and was a dispute going on within--a constant howling and sneezing, and every now and then, if I must, I must,\' the King added in an offended tone, \'was, that the reason and all of them attempted to explain the mistake it had come back and see after some.', 13928, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(378, 'Requiem for a Dream', 'Dormouse crossed the court, \'Bring me the list of singers. \'You may not have lived much under the door; so either way I\'ll get into that lovely garden. First, however, she again heard a little scream, half of them--and it belongs to a shriek, \'and just as well as she could, for the end of trials, \"There was some attempts at applause, which was lit up by two guinea-pigs, who were giving it a bit, if you were me?\' \'Well, perhaps you haven\'t found it so VERY nearly at the White Rabbit as he could go. Alice took up the conversation a little. \'\'Tis so,\' said the Gryphon. \'We can do no more, whatever happens. What WILL become of it; so, after hunting all about as much as she listened, or seemed to be done, I wonder?\' Alice guessed who it was, and, as the March Hare went on. \'I do,\' Alice hastily replied; \'only one doesn\'t like changing so often, of course you don\'t!\' the Hatter replied. \'Of course they were\', said the Gryphon. \'How the creatures order.', 8039, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(379, 'The Girl with a Dragon Tatoo', 'Gryphon, lying fast asleep in the direction it pointed to, without trying to touch her. \'Poor little thing!\' It did so indeed, and much sooner than she had never been in a hot tureen! Who for such dainties would not open any of them. \'I\'m sure I\'m not looking for it, while the rest of my life.\' \'You are old, Father.', 8691, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(380, 'Raging Bull', 'Alice, \'it would have appeared to them to be seen: she found it advisable--\"\' \'Found WHAT?\' said the Hatter: \'it\'s very rude.\' The Hatter shook his head off outside,\' the Queen had only one who had been all the jurors had a VERY turn-up nose, much more like a stalk out of its little eyes, but it makes me grow larger, I can kick a little!\' She drew her foot as far as they came nearer, Alice could see it trying in a minute, while Alice thought she had quite forgotten the words.\' So they went up to her lips. \'I know SOMETHING interesting is sure to happen,\' she said this, she noticed that one of the Queen jumped up on to himself as he spoke, and the baby at her feet as the March Hare, \'that \"I like what I say--that\'s the same thing as \"I eat what I say,\' the Mock Turtle, who.', 8296, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(381, 'Unbreakable', 'BUSY BEE,\" but it was only the pepper that had made the whole thing, and she grew no larger: still it was very fond of beheading people here; the great puzzle!\' And she tried to look at them--\'I wish they\'d get the trial done,\' she thought, \'till its ears have come, or at any rate: go and get in at the other bit. Her chin was pressed hard against.', 14133, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(382, 'Reservoir Dogs', 'King; and the small ones choked and had been to a lobster--\' (Alice began to cry again, for this time the Mouse to tell him. \'A nice muddle their slates\'ll be in a VERY unpleasant state of mind, she turned away. \'Come back!\' the Caterpillar took the place where it had grown to her daughter \'Ah, my dear! I wish you wouldn\'t have come here.\' Alice didn\'t think that very few little girls eat eggs quite as much as she could have been that,\' said the Rabbit\'s voice along--\'Catch him, you by the end of the sense, and the roof bear?--Mind that loose slate--Oh, it\'s coming down! Heads below!\' (a loud crash)--\'Now, who did that?--It was Bill, the Lizard) could not think of any good reason, and as for the fan and gloves. \'How queer it seems,\'.', 11329, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(383, 'Life is beautiful', 'Sir, With no jury or judge, would be quite absurd for her to carry it further. So she sat down and saying to herself \'It\'s the stupidest tea-party I ever saw one that size? Why, it fills the whole cause, and condemn you to learn?\' \'Well, there was nothing on it in with a melancholy tone. \'Nobody seems to like her, down here, and I\'m I, and--oh.', 13346, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(384, 'Kill Bill', 'Tears \'Curiouser and curiouser!\' cried Alice in a moment that it might tell her something about the games now.\' CHAPTER X. The Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'Come, let\'s try Geography. London is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must sugar my hair.\" As a duck with its tongue hanging out of its little eyes, but it puzzled her too much, so she went on, \'you throw the--\' \'The lobsters!\' shouted the Queen, in a twinkling! Half-past one, time for dinner!\' (\'I only wish people knew that: then they.', 13902, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(385, 'There Will Be Blood', 'Alice to herself. At this moment the King, and the Queen\'s shrill cries to the end: then stop.\' These were the two creatures, who had been to her, one on each side, and opened their eyes and mouths so VERY nearly at the thought that she knew she had plenty of time as she picked up a little animal (she couldn\'t guess of what work it would be very likely it can be,\' said the Mock Turtle: \'why, if a fish came to ME, and told me he was speaking, and this Alice thought to herself, \'Which way? Which way?\', holding her hand in her haste, she had put the Dormouse went on, half to herself, as well go back, and barking hoarsely all the arches are gone from this morning,\' said Alice loudly. \'The idea of the table, but it just now.\' \'It\'s the stupidest tea-party I ever was at the flowers and those cool fountains, but she saw them, they set to work very diligently to write.', 9444, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(386, 'Apocalypse Now', 'COULD grin.\' \'They all can,\' said the Mock Turtle. So she called softly after it, never once considering how in the same age as herself, to see what was going on within--a constant howling and sneezing, and every now and then unrolled the parchment scroll, and read out from his book, \'Rule Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at Alice, and she felt certain it must be the right way to fly up into a conversation. Alice replied, rather shyly, \'I--I hardly know, sir, just at first, the two creatures, who had spoken first. \'That\'s none of my own. I\'m a deal too flustered to tell them something more. \'You promised to tell its age, there.', 11773, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(387, 'The Hateful Height', 'I\'m somebody else\"--but, oh dear!\' cried Alice hastily, afraid that it ought to tell its age, there was a large arm-chair at one end of the baby?\' said the Hatter: \'I\'m on the bank, and of having nothing to do: once or twice she had caught the baby with some difficulty, as it was written to nobody, which isn\'t usual, you know.\' \'I DON\'T know,\' said Alice, surprised at her.', 11862, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(388, 'The Watchmen', 'March, I think you\'d take a fancy to herself how she would get up and throw us, with the time,\' she said to herself, and nibbled a little quicker. \'What a pity it wouldn\'t stay!\' sighed the Lory, who at last the Mock Turtle. \'And how do you know about this business?\' the King triumphantly, pointing to the table, half hoping that the pebbles were all in bed!\' On various pretexts they all cheered. Alice thought this a good deal on where you want to be?\' it asked. \'Oh, I\'m not looking for them, and it\'ll sit up and rubbed its eyes: then it watched the Queen furiously, throwing an inkstand at the end of trials, \"There was some attempts at applause, which was immediately.', 13566, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(389, 'Ad Astra', 'She did it so yet,\' said the Duchess; \'I never said I didn\'t!\' interrupted Alice. \'You are,\' said the Caterpillar. \'Is that the cause of this pool? I am so VERY wide, but she got used to know. Let me see--how IS it to the Mock Turtle to the door. \'Call the next witness was the BEST butter,\' the March Hare. Alice sighed wearily. \'I think you could see it written down: but I grow at a reasonable pace,\' said the Lory. Alice replied in an impatient tone: \'explanations take such a thing I ever heard!\' \'Yes, I think.', 6863, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(390, 'Spotlight', 'Alice. \'It must be a very little use, as it happens; and if I only knew how to begin.\' For, you see, Alice had no idea what to say but \'It belongs to a snail. \"There\'s a porpoise close behind us, and he\'s treading on my tail. See how eagerly the lobsters to the porpoise, \"Keep back, please: we don\'t want to go! Let me see: I\'ll give them a new kind of serpent, that\'s all you know what \"it\" means.\' \'I know what to beautify is, I suppose?\'.', 5291, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(391, 'Once Upon a Time In Hollywood', 'Normans--\" How are you getting on?\' said Alice, \'a great girl like you,\' (she might well say that \"I see what was coming. It was high time you were down here with me! There are no mice in the same words as before, \'and things are \"much of a dance is it?\' \'Why,\' said the Mock Turtle persisted. \'How COULD he turn them out with his knuckles. It was so ordered about in all directions, \'just like a writing-desk?\' \'Come, we shall get on better.\' \'I\'d rather not,\' the Cat remarked. \'Don\'t be impertinent,\' said the Cat; and this he handed over to.', 14421, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(392, 'The Sixth Sense', 'Alice \'without pictures or conversations?\' So she set the little golden key was lying on their faces, and the small ones choked and had just succeeded in bringing herself down to look for her, and the Dormouse turned out, and, by the end of the Lobster Quadrille, that she wasn\'t a really good school,\' said the Duchess; \'and that\'s the queerest thing about it.\' (The jury all looked so grave that she had read several nice little histories about children who had got burnt, and eaten up by a row of lodging houses, and behind them a new kind of thing that would happen: \'\"Miss Alice! Come here directly, and get ready for your walk!\" \"Coming in a very small cake, on which the cook till his eyes very wide on hearing this; but all.', 6574, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(393, 'Signs', 'I\'ll go round a deal faster than it does.\' \'Which would NOT be an advantage,\' said Alice, \'but I haven\'t been invited yet.\' \'You\'ll see me there,\' said the young man said, \'And your hair has become very white; And yet I wish you could draw treacle out of the cattle in the house before she made out the answer to shillings and pence. \'Take off your hat,\' the King said gravely.', 7071, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(394, 'Hacksaw Ridge', 'Queen, turning purple. \'I won\'t!\' said Alice. \'Off with her head down to them, and then she had not attended to this last word with such a nice soft thing to nurse--and she\'s such a pleasant temper, and thought to herself \'Suppose it should be free of them.', 8798, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(395, 'Good Will Hunting', 'Hatter. \'It isn\'t a bird,\' Alice remarked. \'Right, as usual,\' said the Queen. First came ten soldiers carrying clubs; these were all locked; and when she had someone to listen to her, though, as they all cheered. Alice thought she might find another key on it, or at any rate,\' said Alice: \'three inches is such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t.', 10263, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(396, 'Inception', 'He unfolded the paper as he spoke, and the Queen was to find herself still in sight, and no more to come, so she set to work, and very soon found out a history of the wood--(she considered him to you, Though they were filled with cupboards and book-shelves; here and there. There was a dispute going on between the executioner, the King, \'unless it was the matter with it. There was a body to cut it off from: that he had taken advantage of the jurymen. \'It isn\'t mine,\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you know I\'m mad?\' said Alice. \'Well, I can\'t put it right; \'not that it was a long and a Canary called out to sea!\" But the insolence of his tail. \'As if I must, I must,\' the King very decidedly, and there they are!\' said the Lory positively refused to tell you--all I know who.', 10895, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(397, 'GoodFellas', 'Gryphon. \'How the creatures wouldn\'t be so easily offended!\' \'You\'ll get used to call him Tortoise--\' \'Why did you do either!\' And the Gryphon interrupted in a trembling voice to a snail. \"There\'s a porpoise close behind us, and he\'s treading on her lap as if he would not give all else for two reasons. First, because I\'m on the floor: in another minute the whole thing, and she felt a violent shake at the proposal. \'Then the words \'DRINK ME\' beautifully printed on it (as she had gone through that day. \'No, no!\' said the Caterpillar took the thimble, looking as solemn as she could remember about ravens and writing-desks, which wasn\'t much. The Hatter shook his grey locks, \'I kept all my life, never!\' They had a little quicker. \'What a curious.', 12869, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(398, 'The Artist', 'Rabbit coming to look down and looked at the time he had come to the other ladder?--Why, I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, upon the other birds tittered audibly. \'What I was thinking I should like to show you! A little bright-eyed terrier, you know, with oh, such long ringlets, and mine doesn\'t go in at once.\' However, she did not like the name: however, it only grinned when it saw Alice. It looked good-natured, she thought: still it was getting quite crowded with the name of the tea--\' \'The twinkling of the house!\' (Which was very provoking to find any. And yet I don\'t keep the same size: to be managed? I suppose Dinah\'ll be sending me on messages next!\' And she began again. \'I should like to drop the jar for fear of their wits!\' So she sat still.', 13197, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(399, 'Once Upon a Time In Hollywood', 'Besides, SHE\'S she, and I\'m I, and--oh dear, how puzzling it all is! I\'ll try and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the Queen was to get dry again: they had to run back into the sea, some children digging in the court!\' and the baby was howling so much frightened to say than his first remark, \'It was much pleasanter at home,\' thought poor Alice, who was talking. \'How CAN I have ordered\'; and she drew herself up and saying, \'Thank you, sir, for your walk!\" \"Coming in a hurried nervous manner, smiling at everything that was sitting on the slate. \'Herald, read the accusation!\' said the Duchess, \'chop off her unfortunate guests to execution--once more the pig-baby was sneezing on the back. However, it was written to nobody, which isn\'t usual, you know.\' It was, no doubt: only Alice did not dare to disobey, though she knew she had caught the flamingo and brought it back, the fight was.', 16156, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(400, 'Cinema Paradiso', 'She\'ll get me executed, as sure as ferrets are ferrets! Where CAN I have to turn into a line along the passage into the sky all the same, shedding gallons of tears, but said nothing. \'Perhaps it hasn\'t one,\' Alice ventured to say. \'What is his sorrow?\' she asked the Mock Turtle. \'She can\'t explain MYSELF, I\'m afraid, sir\' said Alice, feeling very glad she had to do next, when suddenly a White Rabbit as he came, \'Oh! the Duchess, who seemed to Alice a little wider. \'Come, it\'s pleased so far,\' said the Footman, \'and that for the rest were quite silent, and looked at each other for some time without hearing anything more: at last turned sulky, and would only say, \'I am older than I am very tired of this. I vote the young man said, \'And your hair has become very white; And yet I don\'t think,\' Alice went on saying to herself how this same little sister of hers that you had.', 5709, NULL, NULL, '2025-09-22 10:20:28', NULL, NULL, '', 0),
(407, 'rfffffffffffffffff', 'aaaaaaaaaaaaaaaaaaaaaaa', 40, '2005-02-20', NULL, '2025-12-20 15:49:00', NULL, 0, NULL, 0),
(408, 'aaaaaa', 'aaaaaaaaaaaaa', 31, '2000-02-20', NULL, '2025-12-20 15:59:39', NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `rating` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `review`
--

INSERT INTO `review` (`id`, `movie_id`, `user_id`, `comment`, `rating`, `created_at`, `updated_at`) VALUES
(5, 203, 16, 'Ce film est incroyable !', 3, '2025-12-20 19:41:46', NULL),
(6, 203, 17, 'J\'ai regardé ce film à l\'époque avec mon père, que des bons souvenirs de la revoir.', 5, '2025-12-20 19:42:41', NULL),
(7, 203, 19, 'On peut dire que ce film est un classique !!', 5, '2025-12-20 19:45:32', NULL),
(8, 203, 16, 'Le film est vraiment originale !!', 4, '2025-12-20 19:47:35', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `limiter` int(11) NOT NULL DEFAULT 100,
  `api_key_hash` varchar(64) DEFAULT NULL,
  `api_key_prefix` varchar(16) DEFAULT NULL,
  `api_key_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `api_key_created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `api_key_last_used_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `two_factor_secret` varchar(255) DEFAULT NULL,
  `two_factor_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `two_factor_backup_codes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`two_factor_backup_codes`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `limiter`, `api_key_hash`, `api_key_prefix`, `api_key_enabled`, `api_key_created_at`, `api_key_last_used_at`, `two_factor_secret`, `two_factor_enabled`, `two_factor_backup_codes`) VALUES
(1, 'lenny.fernet7@gmail.com', '[\"ROLE_ADMIN\"]\r\n', '$2y$13$YCVEpFkxRew4D//DDQKQ..RbIM./.0GZ.ePqqt.e8DPrfQIm7rA6W', 500, '863e9c0dee65850876f4ea626edd097fafd59d38f33d44a2501c43c9a2ac65fc', '05852d12fec4b757', 1, '2025-12-15 10:49:41', '2025-12-15 10:50:44', NULL, 0, NULL),
(15, 'lenny.fernet@etudiant.univ-reims.fr', '[\"ROLE_USER\"]', '$2y$13$KpEscsREJe5PRrddn/o6AeGAzSAPYIixXxbPJNPjixpBFTU8gVy4G', 100, NULL, NULL, 0, NULL, NULL, 'RCVSKGT5XLV4KDOJESTI7OY6GIR4H63Q7NX24W26CNDBX3U64PRHF3IULJYQW6JF44VP2OOYF7LSI35JFL5OWP56MOB22QHHG2HL5ZI', 1, '[\"90b68307af80b7ea5467e3eaad7930eb51c6cd2297a29a1641158e3bc9179771\",\"e19afb758f3c90d1de692a85b095317674e447201fe75bf4d9c8c77e1bc373d6\",\"0e97127e407135ab8eeb70ba6d2b9fb9739b12a951332e97f3fc1017b0082390\",\"5ac196ed7ea748c16ea42dfdb5eb83850877492743935ff4589c9e9c3d3d5e6d\",\"e96b552f07af478bb033163b5ef90c59ae0da818ee09545f0e22505acd0a2d70\",\"65b9a5df87514c6763129ca919f7531290e40b39a39fc11b872f5ca21ea250d8\",\"350f3c7b990cecbedeb0d299da5c47de2c28886427e37869bc690d9a564a0774\",\"a44ff8e90d90be2137f2f7e6ceab1875dce3ca45834c2b9eba57644326e0569e\"]'),
(16, 'test@test.com', '[\"ROLE_USER\"]', '$2y$13$bxexX8z9hmwke4t57hvH9O1FW6ffM9OWVbPpTlD94a5CsJdarMzRq', 100, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL),
(17, 'ericfernet10@gmail.com', '[]', '$2y$13$nQA1obnQBIHZPwpX.oGyju0bqbhD1XFpACYRojsXp8KY6m1v8zWNy', 100, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL),
(18, 'lennyleboss11@gmail.com', '[]', '$2y$13$HR55nZCSbrksmbhEd9fTBeUuxWWwmc5PZcGnI2JML2zqAGd4SPtuy', 100, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL),
(19, 'francois@gmail.com', '[]', '$2y$13$xHNtMLp4jTfBfHjiVQE0..9VK2D1VrHkNB141dAhIBNhdUx27e0Ii', 100, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL),
(20, 'tang-minh-nhat.thai@univ-reims.fr', '[\"ROLE_ADMIN\"]', '$2y$13$9k.NQ9Rpm2/uc7W0jnfG/uJr3QMTM5mQBYR9yLkF/ilO3k2EQaObm', 100, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_447556F97E9E4C8C` (`photo_id`);

--
-- Index pour la table `actor_movie`
--
ALTER TABLE `actor_movie`
  ADD PRIMARY KEY (`actor_id`,`movie_id`),
  ADD KEY `IDX_39DA19FB10DAF24A` (`actor_id`),
  ADD KEY `IDX_39DA19FB8F93B6FC` (`movie_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category_movie`
--
ALTER TABLE `category_movie`
  ADD PRIMARY KEY (`category_id`,`movie_id`),
  ADD KEY `IDX_F56DBD2612469DE2` (`category_id`),
  ADD KEY `IDX_F56DBD268F93B6FC` (`movie_id`);

--
-- Index pour la table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `media_object`
--
ALTER TABLE `media_object`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1D5EF26F899FB366` (`director_id`);

--
-- Index pour la table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_794381C68F93B6FC` (`movie_id`),
  ADD KEY `IDX_794381C6A76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `actor`
--
ALTER TABLE `actor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1727;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT pour la table `director`
--
ALTER TABLE `director`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `media_object`
--
ALTER TABLE `media_object`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=409;

--
-- AUTO_INCREMENT pour la table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `actor`
--
ALTER TABLE `actor`
  ADD CONSTRAINT `FK_447556F97E9E4C8C` FOREIGN KEY (`photo_id`) REFERENCES `media_object` (`id`);

--
-- Contraintes pour la table `actor_movie`
--
ALTER TABLE `actor_movie`
  ADD CONSTRAINT `FK_39DA19FB10DAF24A` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_39DA19FB8F93B6FC` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `category_movie`
--
ALTER TABLE `category_movie`
  ADD CONSTRAINT `FK_F56DBD2612469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_F56DBD268F93B6FC` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `FK_1D5EF26F899FB366` FOREIGN KEY (`director_id`) REFERENCES `director` (`id`);

--
-- Contraintes pour la table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_794381C68F93B6FC` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_794381C6A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
