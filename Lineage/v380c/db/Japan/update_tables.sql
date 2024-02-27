# テーブルのうち静的なテーブルのみを更新する

use l1jdb;
charset utf8;

#DROP TABLE IF EXISTS `accounts`;
DROP TABLE IF EXISTS `area`;
DROP TABLE IF EXISTS `armor`;
#DROP TABLE IF EXISTS `ban_ip`;
DROP TABLE IF EXISTS `beginner`;
#DROP TABLE IF EXISTS `board_auction`;
#DROP TABLE IF EXISTS `board`;
#DROP TABLE IF EXISTS `castle`;
#DROP TABLE IF EXISTS `character_buddys`;
#DROP TABLE IF EXISTS `character_buff`;
#DROP TABLE IF EXISTS `character_config`;
#DROP TABLE IF EXISTS `character_items`;
#DROP TABLE IF EXISTS `character_quests`;
#DROP TABLE IF EXISTS `character_skills`;
#DROP TABLE IF EXISTS `character_teleport`;
#DROP TABLE IF EXISTS `character_warehouse`;
#DROP TABLE IF EXISTS `characters`;
#DROP TABLE IF EXISTS `clan_data`;
#DROP TABLE IF EXISTS `clan_warehouse`;
DROP TABLE IF EXISTS `commands`;
#DROP TABLE IF EXISTS `connection_test_table`;
DROP TABLE IF EXISTS `drop_item`;
DROP TABLE IF EXISTS `droplist`;
DROP TABLE IF EXISTS `dungeon`;
DROP TABLE IF EXISTS `dungeon_random`;
DROP TABLE IF EXISTS `etcitem`;
DROP TABLE IF EXISTS `getback_restart`;
DROP TABLE IF EXISTS `getback`;
#DROP TABLE IF EXISTS `house`;
#DROP TABLE IF EXISTS `letter`;
#DROP TABLE IF EXISTS `log_chat`;
#DROP TABLE IF EXISTS `log_enchant`;
DROP TABLE IF EXISTS `mapids`;
DROP TABLE IF EXISTS `mobgroup`;
DROP TABLE IF EXISTS `mobskill`;
DROP TABLE IF EXISTS `npc`;
DROP TABLE IF EXISTS `npcaction`;
#DROP TABLE IF EXISTS `pets`;
DROP TABLE IF EXISTS `pettypes`;
DROP TABLE IF EXISTS `polymorphs`;
DROP TABLE IF EXISTS `shop`;
DROP TABLE IF EXISTS `skills`;
DROP TABLE IF EXISTS `spawnlist_boss`;
DROP TABLE IF EXISTS `spawnlist_door`;
DROP TABLE IF EXISTS `spawnlist_npc`;
DROP TABLE IF EXISTS `spawnlist_time`;
DROP TABLE IF EXISTS `spawnlist_trap`;
DROP TABLE IF EXISTS `spawnlist_ub`;
DROP TABLE IF EXISTS `spawnlist`;
DROP TABLE IF EXISTS `spr_action`;
#DROP TABLE IF EXISTS `town`;
DROP TABLE IF EXISTS `trap`;
DROP TABLE IF EXISTS `ub_managers`;
DROP TABLE IF EXISTS `ub_settings`;
DROP TABLE IF EXISTS `ub_times`;
DROP TABLE IF EXISTS `weapon_skill`;
DROP TABLE IF EXISTS `weapon`;

#source MyISAM/accounts.sql;
source MyISAM/area.sql;
source MyISAM/armor.sql;
#source MyISAM/ban_ip.sql;
source MyISAM/beginner.sql;
#source MyISAM/board.sql;
#source MyISAM/board_auction.sql;
#source MyISAM/castle.sql;
#source MyISAM/character_buddys.sql;
#source MyISAM/character_buff.sql;
#source MyISAM/character_config.sql;
#source MyISAM/character_items.sql;
#source MyISAM/character_quests.sql;
#source MyISAM/character_skills.sql;
#source MyISAM/character_teleport.sql;
#source MyISAM/character_warehouse.sql;
#source MyISAM/characters.sql;
#source MyISAM/clan_data.sql;
#source MyISAM/clan_warehouse.sql;
source MyISAM/commands.sql
#source MyISAM/connection_test_table.sql;
source MyISAM/drop_item.sql;
source MyISAM/droplist.sql;
source MyISAM/dungeon.sql;
source MyISAM/dungeon_random.sql
source MyISAM/etcitem.sql;
source MyISAM/getback.sql;
source MyISAM/getback_restart.sql;
#source MyISAM/house.sql;
#source MyISAM/letter.sql;
#source MyISAM/log_chat.sql;
#source MyISAM/log_enchant.sql;
source MyISAM/mapids.sql;
source MyISAM/mobgroup.sql;
source MyISAM/mobskill.sql;
source MyISAM/npc.sql;
source MyISAM/npcaction.sql;
#source MyISAM/pets.sql;
source MyISAM/pettypes.sql;
source MyISAM/polymorphs.sql;
source MyISAM/shop.sql;
source MyISAM/skills.sql;
source MyISAM/spawnlist.sql;
source MyISAM/spawnlist_boss.sql;
source MyISAM/spawnlist_door.sql;
source MyISAM/spawnlist_npc.sql;
source MyISAM/spawnlist_time.sql;
source MyISAM/spawnlist_trap.sql;
source MyISAM/spawnlist_ub.sql;
source MyISAM/spr_action.sql;
#source MyISAM/town.sql;
source MyISAM/trap.sql;
source MyISAM/ub_managers.sql;
source MyISAM/ub_settings.sql;
source MyISAM/ub_times.sql;
source MyISAM/weapon.sql;
source MyISAM/weapon_skill.sql

