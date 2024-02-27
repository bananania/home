#----------------------------
# Table structure for trap
#----------------------------
CREATE TABLE `trap` (
  `id` int(8) NOT NULL,
  `note` varchar(64) DEFAULT NULL,
  `type` varchar(64) NOT NULL,
  `gfxId` int(4) NOT NULL,
  `isDetectionable` tinyint(1) NOT NULL,
  `base` int(4) NOT NULL,
  `dice` int(4) NOT NULL,
  `diceCount` int(4) NOT NULL,
  `poisonType` char(1) NOT NULL DEFAULT 'n',
  `poisonDelay` int(4) NOT NULL DEFAULT '0',
  `poisonTime` int(4) NOT NULL DEFAULT '0',
  `poisonDamage` int(4) NOT NULL DEFAULT '0',
  `monsterNpcId` int(4) NOT NULL DEFAULT '0',
  `monsterCount` int(4) NOT NULL DEFAULT '0',
  `teleportX` int(4) NOT NULL DEFAULT '0',
  `teleportY` int(4) NOT NULL DEFAULT '0',
  `teleportMapId` int(4) NOT NULL DEFAULT '0',
  `skillId` int(4) NOT NULL DEFAULT '0',
  `skillTimeSeconds` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#----------------------------
# Records 
#----------------------------
INSERT INTO `trap` VALUES
(1, 'トラバサミ', 'L1DamageTrap', 1065, 1, 10, 10, 1, '-', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'ヒール', 'L1HealingTrap', 1074, 0, 10, 10, 1, '-', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'ダメージ毒', 'L1PoisonTrap', 1066, 1, 0, 0, 0, 'd', 0, 5000, 10, 0, 0, 0, 0, 0, 0, 0),
(4, '沈黙毒', 'L1PoisonTrap', 1066, 1, 0, 0, 0, 's', 0, 0, 10, 0, 0, 0, 0, 0, 0, 0),
(5, '麻痺毒', 'L1PoisonTrap', 1066, 1, 0, 0, 0, 'p', 5000, 5000, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 'メテオ', 'L1DamageTrap', 1085, 1, 10, 10, 1, '-', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, '針(横)', 'L1DamageTrap', 1070, 1, 10, 10, 1, '-', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 'TOI4Fモンスター', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45348, 2, 0, 0, 0, 0, 0),
(9, 'TOI8Fモンスター', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45407, 2, 0, 0, 0, 0, 0),
(10, 'TOI14Fモンスター', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45394, 2, 0, 0, 0, 0, 0),
(11, 'TOI18Fモンスター', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45406, 2, 0, 0, 0, 0, 0),
(12, 'TOI24Fモンスター', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45384, 2, 0, 0, 0, 0, 0),
(13, 'TOI28Fモンスター', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45471, 2, 0, 0, 0, 0, 0),
(14, 'TOI34Fモンスター', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45403, 2, 0, 0, 0, 0, 0),
(15, 'TOI38Fモンスター', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45455, 2, 0, 0, 0, 0, 0),
(16, 'TOI44Fモンスター', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45514, 2, 0, 0, 0, 0, 0),
(17, 'TOI48Fモンスター', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45522, 2, 0, 0, 0, 0, 0),
(18, 'TOI54Fモンスター', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45524, 2, 0, 0, 0, 0, 0),
(19, 'TOI64Fモンスター', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45528, 2, 0, 0, 0, 0, 0),
(20, 'TOI74Fモンスター', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45503, 2, 0, 0, 0, 0, 0),
(21, 'TOI78Fモンスター', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45532, 2, 0, 0, 0, 0, 0),
(22, 'TOI84Fモンスター', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45586, 2, 0, 0, 0, 0, 0),
(23, 'TOI94Fモンスター', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45621, 2, 0, 0, 0, 0, 0),
(24, 'IT4Fアイアンゴーレム', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45372, 2, 0, 0, 0, 0, 0),
(25, 'IT4Fミミック', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45141, 2, 0, 0, 0, 0, 0),
(26, 'IT4Fリビングアーマー', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45322, 2, 0, 0, 0, 0, 0),
(27, 'IT5Fアイアンゴーレム', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45372, 3, 0, 0, 0, 0, 0),
(28, 'IT5Fミミック', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45141, 3, 0, 0, 0, 0, 0),
(29, 'IT5Fリビングアーマー', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45322, 3, 0, 0, 0, 0, 0),
(30, 'IT6Fシルエット', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45162, 3, 0, 0, 0, 0, 0),
(31, 'IT6Fデス', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45221, 3, 0, 0, 0, 0, 0),
(32, 'IT7Fシルエット', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45162, 4, 0, 0, 0, 0, 0),
(33, 'IT7Fデス', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45221, 4, 0, 0, 0, 0, 0),
(34, 'IT8Fアイアンゴーレム', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45372, 5, 0, 0, 0, 0, 0),
(35, 'IT8Fシルエット', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45162, 5, 0, 0, 0, 0, 0),
(36, 'IT8Fデス', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45221, 5, 0, 0, 0, 0, 0),
(37, 'IT8Fリビングアーマー', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 45322, 5, 0, 0, 0, 0, 0),
(38, 'フランコ迷路ラバーボーン ソルジャー', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 46057, 4, 0, 0, 0, 0, 0),
(39, 'フランコ迷路ラバーボーン  アーチャー', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 46058, 4, 0, 0, 0, 0, 0),
(40, 'フランコ迷路ラバーボーン  ヘッド', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 46059, 4, 0, 0, 0, 0, 0),
(41, 'フランコ迷路ラバーボーン  ナイフ', 'L1MonsterTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 46056, 4, 0, 0, 0, 0, 0),
(42, 'フランコ迷路スタート地点', 'L1TeleportTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 0, 4, 32679, 32742, 482, 0, 0),
(43, 'ディエゴの閉ざされた牢スタート地点', 'L1TeleportTrap', 0, 0, 0, 0, 0, 'n', 0, 0, 0, 0, 0, 32736, 32800, 483, 0, 0),
(44, 'お化け屋敷パラライズ', 'L1SkillTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 0, 0, 0, 0, 0, 33, 0),
(45, 'お化け屋敷ブラインド', 'L1SkillTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 0, 0, 0, 0, 0, 20, 5),
(46, 'お化け屋敷スロー', 'L1SkillTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 0, 0, 0, 0, 0, 29, 5),
(47, 'お化け屋敷ヘイスト', 'L1SkillTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 0, 0, 0, 0, 0, 43, 5),
(48, 'お化け屋敷テレポート', 'L1TeleportTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 0, 0, 32730, 32829, 5140, 0, 0),
(49, 'お化け屋敷テレポート', 'L1TeleportTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 0, 0, 32749, 32813, 5140, 0, 0),
(50, 'お化け屋敷テレポート', 'L1TeleportTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 0, 0, 32747, 32867, 5140, 0, 0),
(51, 'お化け屋敷テレポート', 'L1TeleportTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 0, 0, 32785, 32819, 5140, 0, 0),
(52, 'お化け屋敷テレポート', 'L1TeleportTrap', 0, 0, 0, 0, 0, '-', 0, 0, 0, 0, 0, 32797, 32869, 5140, 0, 0);
