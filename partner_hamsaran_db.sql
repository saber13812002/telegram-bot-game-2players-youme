
CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `chat_id_1` int(11) DEFAULT NULL,
  `chat_id_2` int(11) DEFAULT NULL,
  `answer_1` int(11) DEFAULT NULL,
  `answer_2` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `approved` int(1) NOT NULL DEFAULT 1,
  `published` int(1) NOT NULL DEFAULT 0,
  `rate` int(1) NOT NULL DEFAULT 0,
  `botname` varchar(20) NOT NULL,
  `message_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `from_first_name` varchar(50) NOT NULL,
  `from_last_name` varchar(50) NOT NULL,
  `from_username` varchar(50) NOT NULL,
  `from_language_code` text NOT NULL,
  `pushe_id` varchar(60) NOT NULL,
  `playground_id` int(10) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `chat_first_name` varchar(50) NOT NULL,
  `chat_last_name` varchar(50) NOT NULL,
  `chat_username` varchar(50) NOT NULL,
  `chat_type` text NOT NULL,
  `date` int(11) NOT NULL,
  `text` longtext NOT NULL,
  `command` int(1) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `foaf` decimal(10,0) NOT NULL,
  `caption` text NOT NULL,
  `keyword` text NOT NULL,
  `file_id` text NOT NULL,
  `file_type` varchar(10) NOT NULL,
  `file_size` int(12) NOT NULL,
  `width` int(12) NOT NULL,
  `height` int(12) NOT NULL,
  `duration` int(12) NOT NULL,
  `mime_type` varchar(20) NOT NULL,
  `step` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log`
--


CREATE TABLE `partner` (
  `id` bigint(20) NOT NULL,
  `chat_id_1` int(11) DEFAULT NULL,
  `chat_id_2` int(11) DEFAULT NULL,
  `step` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partner`
--


CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `q` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Publish',
  `chat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `q`, `status`, `chat_id`) VALUES
(1, 'کی بیشتر کتاب میخونه؟', 'Publish', NULL),
(2, 'کی همش لباسای خوشگل می پوشه توی خونه', 'Publish', NULL),
(3, 'کی بیشتر شکوه میکنه', 'Publish', NULL),
(4, 'کی بیشتر دوس داره بره سفر', 'Publish', NULL),
(5, 'کی بیشتر دوس داره بره ورزش', 'Publish', NULL),
(6, 'کی دوس داره بره لباس فروشی', 'Publish', NULL),
(7, 'کی بیشتر توی گوشیشه', 'Publish', NULL),
(8, 'کی بیشتر پیشنهاد میده تنها باشیم', 'Publish', NULL),
(9, 'کی بیشتر نقشه میکشه واسه با هم بودن', 'Publish', NULL),
(10, 'کی بیشتر با بچه ها بازی میکنه', 'Publish', NULL),
(11, 'کی بیشتر به فکر سیر کردن بچه هاست', 'Publish', NULL),
(12, 'کی بیشتر تلفن خونه رو جواب میده؟', 'Publish', NULL),
(13, 'کی حافظه اش بهتره', 'Publish', NULL),
(14, 'کی بیشتر گذشته ها رو مرور میکنه', 'Publish', NULL),
(15, 'کی شبا زودتر میخوابه', 'Publish', NULL),
(16, 'کی مقتصد تره', 'Publish', NULL),
(17, 'کی بیشتر صبحا صبحونه رو میچینه', 'Publish', NULL),
(18, 'کی بیشتر پیگیرهای اون یکی رو لازم داره', 'Publish', NULL),
(19, 'کی بیشتر فکر میکنه کرونا گرفته؟', 'Publish', NULL),
(20, 'کی بیشتر نگران سلامتی مردمه', 'Publish', NULL),
(21, 'کی میتونه زودتر تصمیم بگیره؟', 'Publish', NULL),
(22, 'کی بیشتر برای محیط زیست و بازیافت دغدغه داره؟', 'Publish', NULL),
(23, 'کی بیشتر خوش بینه به مسائل زندگی و اطرافیان؟', 'Publish', NULL),
(24, 'کی روابط عمومیش قوی تره و دوستای بیشتری داره', 'Publish', NULL),
(25, 'کی بیشتر از گفتگو استقبال میکنه؟', 'Publish', NULL),
(26, 'کی بیشتر دیگران رو با خودش همراه میکنه؟', 'Publish', NULL),
(27, 'کی بیشتر با همکلاسی های سابقش از دبستان و راهنمایی و دبیرستان ارتباط داره', 'Publish', NULL),
(28, 'کی بیشتر میتونه دیگران رو قانع کنه؟', 'Publish', NULL),
(29, 'کی بیشتر حرف و صحبت دیگران رو قطع میکنه؟', 'Publish', NULL),
(30, 'کی صبور تره؟', 'Publish', NULL),
(31, 'کی قانع تره؟', 'Publish', NULL),
(32, 'کی مضطرب تره', 'Publish', NULL),
(33, 'کی زود میفهمه اون یکی غصه داره و بقلش میکنه؟ و آرومش میکنه؟', 'Publish', NULL),
(34, 'کی بهتر توی جمع سخنرانی میکنه؟', 'Publish', NULL),
(35, 'کی بیشتر دیگران رو درک میکنه؟', 'Publish', NULL),
(36, 'کی دوستاش راحت تر باهاش درد دل میکنن؟', 'Publish', NULL),
(37, 'کی زودتر میفهمه اون یکی ناراحته از یه چیزی ', 'Publish', NULL),
(38, 'کی بیشتر حال اون یکی رو میپرسه و دوس داره که اون یکی شاد باشه و غصه نخوره؟', 'Publish', NULL),
(39, 'کی بیشتر دلیل ناراحتی دیگران رو میفهمه؟', 'Publish', NULL),
(40, 'کی بیشتر عیادت از بیماران و یا جانبازان یا سالمندان استقبال میکنه؟', 'Publish', NULL),
(41, 'کی بیشتر فکر میکنه همه مسائل حل شدنی هستند و راه حل براشون وجود داره؟', 'Publish', NULL),
(42, 'کی بیشتر توی همه مسائل با دیگری مشورت میکنه؟', 'Publish', NULL),
(43, 'کی بیشتر فک میکنه مشکلات غیر قابل حل زیادی وجود داره؟', 'Publish', NULL),
(44, 'کی دل گنده تره ', 'Publish', NULL),
(45, 'کی زودتر آَشتی میکنه؟', 'Publish', NULL),
(46, 'کی بیشتر بحث ها رو طولش میده', 'Publish', NULL),
(47, 'کی توی بحثا بیشتر دعوت میکنه به آرامش و تموم کردن بحثا', 'Publish', NULL),
(48, 'کی بیشتر از ورود به جمع غریبه ها خودداری میکنه؟', 'Publish', NULL),
(49, 'کی خجالتی تره', 'Publish', NULL),
(50, 'کی کم رو تره', 'Publish', NULL),
(51, 'کی بیشتر به خواهر برادر و پدر مادرش زنگ میزنه؟', 'Publish', NULL),
(52, 'کی بیشتر کنجکاوه', 'Publish', NULL),
(53, 'کی بیشتر فکر میکنه کالایی که تبلیغ میشه مرغوب تره', 'Publish', NULL),
(54, 'کی دوس داره گوشی اپل داشته باشه', 'Publish', NULL),
(55, 'کی بیشتر برای انتقاد کردن مقدمه میچینه؟', 'Publish', NULL),
(56, 'کی بیشتر فکر میکنه کاری که انجام میده میشه بهترش کرد و بهتر انجامش داد', 'Publish', NULL),
(57, 'کی بهتر آواز میخونه', 'Publish', NULL),
(58, 'کی بهتر اتفاقات رو تعریف میکنه', 'Publish', NULL),
(59, 'کی بیشتر درباره شایعه بودن هر خبری تحقیق میکنه', 'Publish', NULL),
(60, 'کی بیشتر با بزرگترا مشورت میکنه', 'Publish', NULL),
(61, 'کی بیشتر استخاره میکنه؟', 'Publish', NULL),
(62, 'کی بیشتر انجام کارهای متنوع رو دوس داره؟', 'Publish', NULL),
(63, 'کی بیشتر اهل صله رحم هستش؟', 'Publish', NULL),
(64, 'کی کمتر اهل دید و بازدید و مهمونیه؟', 'Publish', NULL),
(65, 'کی قوه ی تخیلش قوی تره؟', 'Publish', NULL),
(66, 'کی بیشتر میتونه رمان بخونه و علاقه داره؟', 'Publish', NULL),
(67, 'کی علایق گسترده ای داره', 'Publish', NULL),
(68, 'کی داستان سرایی رو دوس نداره؟', 'Publish', NULL),
(69, 'کی دوس داره بیشتر مشاعره ببینه؟', 'Publish', NULL),
(70, 'کی دوس داره بیشتر کار فرهنگی کنه', 'Publish', NULL),
(71, 'کی بیشتر خشم و عصبانیت ش رو کنترل میکنه؟', 'Publish', NULL),
(72, 'کی بیشتر با آدم های مهربون مهربون تره؟', 'Publish', NULL),
(73, 'کی اون یکی رو بیشتر قبول داره؟', 'Publish', NULL),
(74, 'کی اول عاشق شد؟', 'Publish', NULL),
(75, 'کی بیشتر به فکر همسایه است؟', 'Publish', NULL),
(76, 'کی بیشتر فلسفه رو دوس داره؟', 'Publish', NULL),
(77, 'کی بیشتر آهنگ موسیقی گوش میده؟', 'Publish', NULL),
(78, 'کی بیشتر دوس داره ورزش های جدید یاد بگیره و تجربه کنه؟', 'Publish', NULL),
(79, 'کی دوس داره وقتی بارون میاد بره تماشا یا قدم زدن', 'Publish', NULL),
(80, 'کی دوس داره بیشتر کنار ساحل بشینه دریا رو تماشا کنه', 'Publish', NULL),
(81, 'کی وقتی میره توی فکر هیچی نمیشنوه', 'Publish', NULL),
(82, 'کی زودتر آشتی میکنه؟لبخند میزنه.', 'Publish', NULL),
(83, 'کی وقتی اون یکی آشتی میکنه به روش نمیاره', 'Publish', NULL),
(84, 'کی بیشتر فکر تغذیه ی سالمه؟', 'Publish', NULL),
(85, 'کی بیشتر مریض میشه؟', 'Publish', NULL),
(86, 'کی بیشتر میره دکتر؟', 'Publish', NULL),
(87, 'کی بیدار میشه سرحال تره', 'Publish', NULL),
(88, 'کی بیشتر شبا بدخواب میشه و ذهنش درگیره؟', 'Publish', NULL),
(89, 'کی بیشتر دیر میرسه سر قرار ها؟', 'Publish', NULL),
(90, 'کی در هفته بیشتر از یک بار ورزش و نرمش میکنه و قدم میزنه و تحرک حداقلی داره', 'Publish', NULL),
(91, 'کی صاف و ساده تره و همه چیزو میگه ', 'Publish', NULL),
(92, 'کی میتونه زودتر فراموش کرده و برگرده توی مدار زندگی؟', 'Publish', NULL),
(93, 'کی بیشتر از مصرف بیرویه نمک و شکر خودداري می کنه؟', 'Publish', NULL),
(94, 'کی بیشتر برای اون یکی مینویسه ', 'Publish', NULL),
(95, 'کی منظم تره؟', 'Publish', NULL),
(96, 'کی بیشتر اهل تلویزیونه؟', 'Publish', NULL),
(97, 'کی بیشتر قادر به بیان احساساتشه', 'Publish', NULL),
(98, 'کی بیشتر آلبوم عکس رو میاره و با هم میبینین؟', 'Publish', NULL),
(99, 'کی بیشتر خاطرات شیرین مرور میکنه', 'Publish', NULL),
(100, 'کی بیشتر از چالش و تغییر در زندگی لذت می بره', 'Publish', NULL),
(101, 'کی بیشتر دوس داره خاطرات قشنگ و لحظه های خانوادگی رو ثبت کنه', 'Publish', NULL),
(102, 'کی خط ش بهتره؟', 'Publish', NULL),
(103, 'کی فکر میکنه یارش رو خدا فرستاده و هدیه ی خداست؟', 'Publish', NULL),
(104, 'کی فکر میکنه بیشتر خوشبخته؟', 'Publish', NULL),
(105, 'کی بیشتر به دیگران و اطرافیان امید و انگیزه میده؟', 'Publish', NULL),
(106, 'کی دوس داره هر چی بلده به دیگران یاد بده؟', 'Publish', NULL),
(107, 'کی بیشتر وبلاگ مینویسه و در اینترنت مطلب میزاره', 'Publish', NULL),
(108, 'کی بیشتر توی کاغذ مینویسه؟', 'Publish', NULL),
(109, 'کی دوس داره یک تغییر کوچولویی در زندگیش بده', 'Publish', NULL),
(110, 'کی فکر میکنه توکلش به خدا بیشتره؟', 'Publish', NULL),
(111, 'کی بیشتر به احساسات اون یکی احترام میزاره؟', 'Publish', NULL),
(112, 'کی بیشتر به اون یکی احترام میزاره', 'Publish', NULL),
(113, 'کی فکر میکنه افکار مثبت بیشتری داره؟', 'Publish', NULL),
(114, 'کی بدون تجویز پزشک اصلا طرف دارو نمیره؟', 'Publish', NULL),
(115, 'کی بیشتر توی ماشین قوانین راهنمایی رانندگی رو یادآوری میکنه', 'Publish', NULL),
(116, 'کی بیشتر اصرار داره هنگام رانندگی کودکان را در صندلی عقب و مجهز به کمربند ایمنی قرار می دهد', 'Publish', NULL),
(117, 'کی بیشتر میره سراغ قرآن و نهج البلاغه و دعا و صحیفه و سجادیه ', 'Publish', NULL),
(118, 'کی بیشتر هنگام رانندگی از تلفن همراه استفاده می کنه', 'Publish', NULL),
(119, 'کی فکر میکنه رانندگیش خوبه و هیچوقت تصادف نمیکنه و خطر برای دیگرانه؟', 'Publish', NULL),
(120, 'کی بیشتر لامپ های اضافی خونه رو خاموش میکنه؟', 'Publish', NULL),
(121, 'کی راحت تر با سر و صدا خوابش میبره؟', 'Publish', NULL),
(122, 'کی بیشتر در جنگل اگر کسی آتش روشن کنه بهشون دوستانه تذکر میده', 'Publish', NULL),
(123, 'کی اعتقاد داره اگر ماشینی خلاف کنه و دیوانه وار رانندگی کنه باید بهش تذکر داد و با بوق و چراغ تذکر میده', 'Publish', NULL),
(124, 'کی بیشتر درباره تغذیه ی سالم و مقوی تحقیق و مطالعه میکنه و پیشنهاد میده', 'Publish', NULL),
(125, 'کی بیشتر به دنیای بعد از مرگ فکر میکنه و کنجکاوه', 'Publish', NULL),
(126, 'کی بیشتر اعتقاد داره باید استاد اخلاق داشت و جلسات و برنامه ریزی براش داره؟', 'Publish', NULL),
(127, 'کی بیشتر وقتی که شکست را تجربه میکنه، باز هم میتوانم معنایی در آن بیابد', 'Publish', NULL),
(128, 'کی بیشتر آگاهی زیادي نسبت به جنبه هاي غیر مادي زندگی داره', 'Publish', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `chat_id` int(11) DEFAULT NULL,
  `partner_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=697;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2160;

--
-- AUTO_INCREMENT for table `partner`
--
ALTER TABLE `partner`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`jyvfiltw`@`localhost` EVENT `name` ON SCHEDULE EVERY 1 DAY STARTS '2020-04-11 02:25:43' ENDS '2021-04-11 02:25:43' ON COMPLETION NOT PRESERVE ENABLE DO select * from log$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
