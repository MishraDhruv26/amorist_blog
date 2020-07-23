-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2020 at 01:20 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `the_amorists`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `Sno.` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(20) NOT NULL,
  `msg` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `Sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `img_file` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`Sno`, `title`, `content`, `slug`, `date`, `img_file`) VALUES
(1, 'WILL YOU?', 'Will u come back?\r\nBack to me?\r\nBack to the way things were?\r\nMaybe even better\r\nBut will you?\r\n\r\nWill u hold me?\r\nHold me in ur arms?\r\nJust like u used to do?\r\nThis time I won\'t push u away\r\nBut will you?\r\n\r\nWill you try this again?\r\nFresh strt?\r\nThis time with both of us involved!\r\nEqual halves? remember?\r\nBut will you?\r\n\r\nWill u want to have a future with me?\r\nI\'ll be better\r\nBetter than I ever was\r\nJust like the perfect girl u always wanted?\r\nBut even after this will you?\r\n\r\nWill u give me ur time?\r\nJust a bit?\r\nIsn\'t that all I ever wanted?\r\nI won\'t waste it I promise\r\nBut will u?\r\n', 'will-you', '2020-05-22', 'will_you.jpeg'),
(2, 'THAT MAN', 'But then with a tear in her eyes momma said she can save me\r\nSave me from that man\r\nThat it\'s gonna be okay\r\nThat man won\'t hurt me\r\nI m safe\r\nI just need to be quite\r\nN everything is going to be fine\r\nwith her trembling hands\r\nShe kept the door of the horrors closed for me\r\nEveryday every night\r\nTo protect me from what\'s outside\r\nBut She can\'t protect herself\r\nIf only she had the strength to break through this loop\r\nShe\'s stuck\r\nBut she wants better for me\r\nA better life \r\nBut that night I saw it all\r\nI heard it all\r\nThe yelling the screaming the hurting the hitting\r\nEven after it was all over\r\nIt echoed around the house that whole night\r\nBouncing from one wall to the other\r\nWalls of my head\r\nN they all broke all at once\r\nShattered into pieces\r\nBut the next day Was normal\r\nShe thinks I haven\'t seen it the scars the pain that I haven\'t felt it\r\nshe keeps it normal\r\nShe lives in Denial\r\nThat is what it takes to be from a broken family\r\nShe learnt to cage her troubles\r\nShe lives through hell\r\nBut she not powerless\r\nShe a warrior\r\nAnd\r\nShe bears that man for love\r\nNot the love for him but the love for me\r\nThat man\r\nMy father\r\n', 'that-man', '2020-05-21', 'that man.jpeg'),
(3, 'FOR NAIROBI', 'For Nairobi!\r\nWe wish you would be still alive\r\nWe wish we could get you back somehow\r\nWe feel a void already\r\nWe can just ponder over the fact that the heist will never be the same without you\r\nProfessor was surely the brains of the heist!\r\nBut you?\r\nYou were the heart of it\r\nYou were the only one to keep the first heist intact\r\nWithout you the heist would have fallen apart\r\nYou were all of them in one\r\nU had the leadership of professors\r\nThe impulse of tokyo\r\nThe maturity of Moscow\r\nThe tactics of Berlin\r\nHeart of Rio\r\nYou had that all\r\nU deserved to lived more than anyone\r\nWhen u got hit by the bullet the first tym it broke us but later to see you alive we were overwhelmed\r\nBut at that moment we didn\'t knew we were gonna lose you soon\r\nToo soon Nairobi!\r\nThe first missile of professor to honour your memory directly hit us where it should have been\r\nYour exit  filled the everything with silence\r\nAfter that the streets of madrid were numb and so were our hearts\r\nU finally had everything u wanted a lover a best friend a soon to be child u deserved this happy life more than anyone\r\nWe\'ll hate gandhia and Palermo for this forever\r\nAfter all as tokyo said it was all the domino effect of what Palermo did\r\nU were an influencer a motivator to all those who worked under you and watched\r\nYou never feared to stood up but at the same time u were kind \r\nU made us feel like a fucking boss\r\nEven though u and Berlin never got along\r\nU were ready to risk your life for him\r\nU made Alison parker to fearless\r\nU knew everyone u once said u don\'t need to read mind\'s to understand what is going on\r\nN that\'s true\r\nU knew everyone way too well \r\nU helped everyone through the heist but when it came to u u couldn\'t get all the help\r\nWe know this heist was a tribute to Berlin but now it more it\'s revenge for what they did to you\r\nA war is ragging in Madrid n we stand in support for you\r\nWe still are the resistance but with that we are here for Nairobi\r\nWe love you\r\nÁgata Jiménez\r\nFor Nairobi\r\n', 'nairobi', '2020-05-21', 'nairobi.jpeg'),
(4, 'THE VAMPIRE DIARIES', 'Dear vampire diaries\r\nThis isn\'t a fan letter or an appreciation post instead it is to let you know how much of an amazing and epic series is created\r\nYou have raised the standards of men.In the era where everyone wants a prince charming there are people like me who is looking for someone like Damon,we don\'t want a prince charming we want someone who makes us \"feel dangerous but not in a way that scares us someone who gives us a love that consumes us,passion,adventure and maybe a little danger\".Someone who is as \"selfish\" as Damon\r\nAnd not only love but you have raised the standards of friendship.We want friends like Elena had those who were ready to sacrifice their lives for each other.In the world full of snakes try finding someone like bonnie\r\nThanks for telling us that mean girls like caroline can change and become the most loved person\r\nThanks for telling us that \"it\'s okay to love them both\"\r\nIt all began with \"today will be different.It has to be.I will smile,and it will be believable\" and ended with \"that\'s the promise of peace.That one day, after a long life, we find each other again\" and in between this was an epic ride of friendship,heartbreak,fights,brotherhood,loss n above all love\r\n\"we know that the worst day of loving someone is the day that you lose them and when this all ended we couldn\'t have agreed more\"\r\n\"You made us a promise that this is forever\" but \"you lied to us and we know you didn\'t had a choice baby\" but all we can say is that \"you are by far the greatest thing that has happened to us and the fact that we get to die knowing that we watched not just anything but vampire diaries is the epitome of a fulfilled life it\'s never gonna get better than this we peeked\"\r\n\"We want to thank you for giving me everything we ever wanted.A love that consumed us,adventure, passion,there’s nothing more that I could have asked for,except for it to last forever”\r\nAfter all this is over I think it\'s time for us to say goodbye we can\'t get over this \r\nour lives will always be weird,messy, complicated and we owe it all to TVD  And  it\'s been one hell of a ride and at last we do were feeling epic\r\n', 'vampire-diary', '2020-05-21', 'vampire_diaries.jpeg'),
(5, 'IRRFAN', 'Dear Irrfan\r\nGone too soon\r\nWhen I heard the news I was stuck \r\nStuck in a time loop\r\nI m sure everyone was\r\nI could just ponder over that fact how everything will not be same anymore\r\nIndian cinema won\'t be same anymore\r\nMemes won\'t be same anymore\r\nNothing would be same\r\nYou were an inspiration\r\nAn amazing person\r\nAnd the best actor\r\nYou were a natural talent\r\nYou were supposed to fight this \r\nYou were supposed to live\r\nBut it\'s okay \r\nYou can rest now\r\nYou are in heaven with your mother\r\nYou are at peace\r\nAnd you deserve this peace\r\nTrails of post and stories in your tribute  shows how much of legend you were\r\nYour so sudden departure left a hole in our hearts\r\nWe never expected this\r\n\"I suppose in the end, the whole of life becomes an act of letting go, but what always hurts the most is not taking a moment to say goodbye\"As you said\r\nWe all are taking a moment to say goodbye to you we will miss you\r\nOur hearts can\'t take so much of hurt at the same time\r\nFirst kobe now you\r\nWe are shattered\r\nCompletely broken\r\nThis 2020 sucks\r\nYou will be in our memories forever\r\nYou are immortal this way\r\nRest in peace\r\nWith love and prayers\r\nYours fandom\r\n', 'irrfan', '2020-05-21', 'irrfan.jpeg'),
(8, '', '\"I was playing a game of hearts \r\n\r\nbut you were the master of bluff\"', 'cards', '2020-05-22', 'one1.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`Sno.`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`Sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `Sno.` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `Sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
