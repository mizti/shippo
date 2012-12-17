-- phpMyAdmin SQL Dump
-- version 2.11.4
-- http://www.phpmyadmin.net
--
-- ホスト: localhost
-- 生成時間: 2008 年 11 月 10 日 18:25
-- サーバのバージョン: 5.0.51
-- PHP のバージョン: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- データベース: `shippo`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `cid` int(11) NOT NULL auto_increment,
  `eid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `istext` tinyint(1) NOT NULL default '1',
  `text` varchar(255) collate utf8_bin NOT NULL,
  `fname` varchar(255) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- テーブルのデータをダンプしています `comments`
--

INSERT INTO `comments` (`cid`, `eid`, `uid`, `istext`, `text`, `fname`) VALUES
(1, 11, 3, 1, '11番につけたコメントです。', ''),
(2, 10, 6, 1, '10 - 番につけたコメントですよー。', ''),
(3, 6, 5, 1, '- 6 番につけたコメントですよっと。', ''),
(4, 16, 0, 1, '16 -番につけたコメントなのだー', '1219642434-3936.png'),
(5, 13, 3, 1, 'uid込みのコメントテスト。', ''),
(6, 10, 4, 0, '', '1219651238-5953.png'),
(7, 15, 4, 0, '', '1219660299-8527.png');

-- --------------------------------------------------------

--
-- テーブルの構造 `entries`
--

CREATE TABLE IF NOT EXISTS `entries` (
  `eid` int(255) NOT NULL auto_increment,
  `title` varchar(255) character set sjis collate sjis_bin default NULL,
  `uid` int(11) default NULL,
  `fname` varchar(255) character set ascii collate ascii_bin NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`eid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=18 ;

--
-- テーブルのデータをダンプしています `entries`
--

INSERT INTO `entries` (`eid`, `title`, `uid`, `fname`, `created`, `modified`) VALUES
(8, '罪障消滅と懺悔罪滅', 6, '1219594870-8303.png', '2008-10-29 01:54:34', '2008-10-29 01:54:34'),
(6, 'バックベアードの怒り', NULL, '1219571145-5472.png', '2008-10-29 01:53:55', '2008-10-29 01:53:55'),
(7, 'お咎めなし', 4, '1219760563-4124.png', '2008-10-29 01:53:55', '2008-10-29 01:53:55'),
(12, 'はらたいらにぜんぶ', 1, '1219641614-1443.png', '2008-10-29 01:57:56', '2008-10-29 01:57:56'),
(10, NULL, NULL, '1219582371-1900.png', '2008-10-29 01:56:23', '2008-10-29 01:56:23'),
(11, 'たけしのかがやくみぎてのこゆびのつめ', 5, '1219593721-3062.png', '2008-10-29 01:56:23', '2008-10-29 01:56:23'),
(13, 'Magnus Mirabilis in Oz', 3, '1219642434-3936.png', '2008-10-29 01:57:56', '2008-10-29 01:57:56'),
(14, NULL, 7, '1219586233-5106.png', '2008-10-29 01:58:28', '2008-10-29 01:58:28'),
(15, 'persona non grata', 2, '1219675119-1470.png', '2008-10-29 01:58:28', '2008-10-29 01:58:28'),
(16, NULL, NULL, '1219660299-8527.png', '2008-10-29 01:59:24', '2008-10-29 01:59:24'),
(17, NULL, NULL, '1219771461-8985.png', '2008-10-29 01:59:24', '2008-10-29 01:59:24');

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(11) NOT NULL auto_increment,
  `uname` varchar(255) collate utf8_bin NOT NULL,
  `prof` text collate utf8_bin NOT NULL,
  PRIMARY KEY  (`uid`),
  UNIQUE KEY `uname` (`uname`),
  UNIQUE KEY `uname_2` (`uname`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- テーブルのデータをダンプしています `users`
--

INSERT INTO `users` (`uid`, `uname`, `prof`) VALUES
(1, 'miz', 0xe381a6e38199e381a8e381a7e383bce3819fefbc81),
(2, 'みずち', 0xe381a6e38199e381a8e381a7e383bce3819fefbc81),
(3, 'mizti', 0xe381a6e38199e381a8e381a7e383bce3819f33e381a4e79baeefbc81),
(4, 'nekoita', 0xe381a6e38199e381a8e381a7e383bce3819f34e381a4e79baee38082e3818ae5908de5898de68b9de5809fe38082),
(5, 'ir5', 0xe381a6e38199e381a8e381a7e383bce3819f35e381a4e79baee38082e3818ae5908de5898de68b9de5809fe38082),
(6, 'deskull', 0xe381a6e38199e381a8e381a7e383bce3819f36e381a4e79baee38082e3818ae5908de5898de68b9de5809fe38082),
(7, 'もこ', 0xe38386e382b9e38388e38387e383bce382bfe38082e3818ae5908de5898de68b9de5809fe38082);
