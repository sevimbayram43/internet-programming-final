-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 04 Oca 2023, 08:50:10
-- Sunucu sürümü: 10.4.27-MariaDB
-- PHP Sürümü: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `opd`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `categorieId` int(12) NOT NULL,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(1, 'VEGAN PIZZA', 'Sebze sevenler için bir zevk! Çok çeşitli lezzetli vejetaryen pizzalarımızdan birini seçin, daha yumuşak ve daha lezzetli.', '2021-03-17 18:16:28'),
(2, 'SEBZE OLMAYAN PİZZA', '\r\nMenümüzden sebze olmayan pizzaları seçin. Seçtiğiniz  taze sebze olmayan pizzanızı alın', '2021-03-17 18:17:14'),
(3, 'PIZZA ÇILGINLIĞI', '\r\nPizza çılgınlığı serisinin ağız sulandıran tadıyla kendinizi şımartın. ', '2021-03-17 18:17:43'),
(4, 'YAN SİPARİŞ', 'Pizzanızı yan çelişitlerle taçlandırın.', '2021-03-17 18:19:10'),
(5, 'İÇECEKLER', '\r\nPizzanızı çok çeşitli içeceklerle tamamlayın', '2021-03-17 21:58:58'),
(6, 'HAMUR SEÇİMİ', 'Pizaalarımız taze yapılmış tavada pişirilmiş pizzası; lezzetli yumuşak, tereyağlı ve çıtır çıtırdır', '2021-03-18 07:55:28');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contact`
--

CREATE TABLE `contact` (
  `contactId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT 0 COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contactreply`
--

CREATE TABLE `contactreply` (
  `id` int(21) NOT NULL,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `pizzaId` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `orderitems`
--

INSERT INTO `orderitems` (`id`, `orderId`, `pizzaId`, `itemQuantity`) VALUES
(1, 1, 1, 1),
(2, 1, 6, 1),
(3, 1, 8, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders`
--

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `orders`
--

INSERT INTO `orders` (`orderId`, `userId`, `address`, `zipCode`, `phoneNo`, `amount`, `paymentMode`, `orderStatus`, `orderDate`) VALUES
(1, 3, 'vgtyrtdrt, hfgdr', 123459, 5552235683, 617, '0', '0', '2023-01-04 09:51:13');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pizza`
--

CREATE TABLE `pizza` (
  `pizzaId` int(12) NOT NULL,
  `pizzaName` varchar(255) NOT NULL,
  `pizzaPrice` int(12) NOT NULL,
  `pizzaDesc` text NOT NULL,
  `pizzaCategorieId` int(12) NOT NULL,
  `pizzaPubDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `pizza`
--

INSERT INTO `pizza` (`pizzaId`, `pizzaName`, `pizzaPrice`, `pizzaDesc`, `pizzaCategorieId`, `pizzaPubDate`) VALUES
(1, 'MARGARİTA', 99, '\r\nSon derece popüler bir margherita, lezzetli ', 1, '2021-03-17 21:03:26'),
(6, 'LÜKS SEBZELİ', 319, 'Tam bir vejeteryan pizzası mükemmel lezzet ', 1, '2021-03-17 21:24:38'),
(8, 'PEYNİRLİ VE MISIRLI\r\n', 199, 'peynir ve mısır', 1, '2021-03-17 21:26:31'),
(10, 'SEBZE CENNETİ\r\n', 299, '\r\nMısırLI, Siyah Zeytin, Kırmızı Biberli\r\n\r\n', 1, '2021-03-17 21:28:06'),
(14, 'TAVUK SOSİSLİ', 249, 'Tavuk sosis ve peynirli', 2, '2021-03-17 21:35:31'),
(18, 'BİBERLİ BARBEKÜ SOĞANLI\r\n', 249, '\r\nBiber Barbekü Tavuk Soğan', 2, '2021-03-17 21:39:49'),
(21, 'DOMATESLİ', 99, '\r\nPeynir ve sulu domates', 3, '2021-03-17 21:44:44'),
(22, 'BOL SEBZELİ', 149, '\r\ndomates Izgara Mantar Jalapeno Mısır Taze bir tavada fasulye', 3, '2021-03-17 21:45:34'),
(23, 'PEYNİRLİ', 99, '\r\nPortakallı Çedar Peyniri ve Mozzarella', 3, '2021-03-17 21:46:21'),
(25, 'SOĞANLI', 99, 'SOĞAN', 3, '2021-03-17 21:47:51'),
(29, 'SARIMSAKLI GALETA UNLU', 99, '\r\nMükemmel bir şekilde pişirilmiş galeta unu içindeki sarımsağın çekici kokusu.', 4, '2021-03-17 22:01:33'),
(34, 'PEYNİR SOSU', 35, 'kremalı peynir soslu mükemmel lezzet', 4, '2021-03-17 22:06:59'),
(35, 'LAV PASTASI', 99, '\r\nİçindeki lezzetli erimiş çikolata ile dolu\r\nbir pasta', 4, '2021-03-17 22:08:13'),
(37, 'Lipton Ice Tea', 25, ' 250ml', 5, '2021-03-17 22:12:53'),
(40, 'Pepsi\r\n', 52, '500ml', 5, '2021-03-17 22:16:29'),
(42, 'PEYNİR PATLAMASI', 249, '\r\nİçine doldurulmuş nefis sıvı peynir ile oluşturulmuş kabuk.', 6, '2021-03-18 07:57:27'),
(43, 'KLASİK HAMUR ', 249, 'Geleneksel elle gerilmiş hamur, dışı çıtır çıtır, içi yumuşak ve hafif.', 6, '2021-03-18 07:59:52'),
(45, 'TAZE TAVA PİZZA ', 299, 'Şimdiye kadarki en lezzetli \r\n taze yapılmış tavada pişirilmiş pizza; lezzetli yumuşak, tereyağlı.', 6, '2021-03-18 08:01:29');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sitedetail`
--

CREATE TABLE `sitedetail` (
  `tempId` int(11) NOT NULL,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `contact1` bigint(21) NOT NULL,
  `contact2` bigint(21) DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `sitedetail`
--

INSERT INTO `sitedetail` (`tempId`, `systemName`, `email`, `contact1`, `contact2`, `address`, `dateTime`) VALUES
(1, 'SEVİM PİZZA', 'Admin@sevim.com', 5475825868, NULL, 'cumhuriyret mah', '2021-03-23 19:56:25');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(21) NOT NULL,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `joinDate`) VALUES
(1, 'admin', 'admin', 'admin', 'admin@gmail.com', 5419179744, '1', '$2y$10$iSrgWlVe1MnM4VnEhABdTOi7KStEQq.HL8Z/srlICohYNyufyA0CK', '2021-04-11 11:40:58'),
(2, 'sevim', 'sevim', 's', 's@gmail.com', 5334758966, '0', 'bayram123', '2023-01-03 18:00:48'),
(3, 'sevimmm', 'sevim1', 's099', 'bosnaksevim43@icloud.com', 5555555555, '1', '$2y$10$iSrgWlVe1MnM4VnEhABdTOi7KStEQq.HL8Z/srlICohYNyufyA0CK', '2023-01-04 09:35:30');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `viewcart`
--

CREATE TABLE `viewcart` (
  `cartItemId` int(11) NOT NULL,
  `pizzaId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `viewcart`
--

INSERT INTO `viewcart` (`cartItemId`, `pizzaId`, `itemQuantity`, `userId`, `addedDate`) VALUES
(4, 1, 1, 2, '2023-01-04 09:18:32'),
(5, 6, 1, 2, '2023-01-04 09:18:34'),
(6, 8, 1, 2, '2023-01-04 09:18:35'),
(10, 1, 1, 3, '2023-01-04 09:57:50');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorieId`);
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

--
-- Tablo için indeksler `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Tablo için indeksler `contactreply`
--
ALTER TABLE `contactreply`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Tablo için indeksler `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Tablo için indeksler `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`pizzaId`);
ALTER TABLE `pizza` ADD FULLTEXT KEY `pizzaName` (`pizzaName`,`pizzaDesc`);

--
-- Tablo için indeksler `sitedetail`
--
ALTER TABLE `sitedetail`
  ADD PRIMARY KEY (`tempId`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

--
-- Tablo için indeksler `viewcart`
--
ALTER TABLE `viewcart`
  ADD PRIMARY KEY (`cartItemId`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `categorieId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Tablo için AUTO_INCREMENT değeri `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `contactreply`
--
ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `pizza`
--
ALTER TABLE `pizza`
  MODIFY `pizzaId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Tablo için AUTO_INCREMENT değeri `sitedetail`
--
ALTER TABLE `sitedetail`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
