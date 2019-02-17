INSERT INTO `migrations` (`id`) VALUES ('ELYSIUM_107');

-- AQ GATE EVENT PLEASE
UPDATE `game_event` SET `start_time` = '2015-01-01 00:00:00', `end_time` = '2025-01-01 01:00:00', `length` = 999999999 WHERE `entry` = 83;

UPDATE `item_template` SET `patch` = 0 WHERE `entry` = 21546; -- Allow Greater Firepower to remain in-game

-- Enable world buff removal for ZG
UPDATE `instance_buff_removal` SET `enabled` = 1 WHERE `mapId` = 309;

-- Cold Forged Hammer available earlier than retail since 1.5 release was
-- borked and the Korrak quest had no rewards associated with it
UPDATE `item_template` SET `patch` = 3 WHERE `entry` = 20648 AND `patch` = 6;

-- Likewise with the Hero of the Frostwolf/Stormpike quests
UPDATE `quest_template` 
    SET `patch` = 3, `Method` = `Method` & ~1
    WHERE `entry` IN (8271, 8272) AND `patch` = 6;

UPDATE `creature_questrelation` SET `patch` = 3 WHERE `quest` IN (8271, 8272);
UPDATE `creature_involvedrelation` SET `patch` = 3 WHERE `quest` IN (8271, 8272);

-- Remove base level Korrak rewards
UPDATE `quest_template` 
    SET `RewChoiceItemId1` = 0, `RewChoiceItemId2` = 0, `RewChoiceItemId3` = 0, 
        `RewChoiceItemCount1` = 0, `RewChoiceItemCount2` = 0, `RewChoiceItemCount3` = 0
    WHERE `entry` IN (7181, 7202) AND `patch` = 3;

-- Disabled food and oil spells due to accidental formula release, re-added in 1.9

REPLACE INTO `spell_disabled` 
    VALUES  (24800), -- Smoked Desert Dumplings
            (24801), -- Smoked Desert Dumplings
            (25117), -- Minor Wizard Oil
            (25118), -- Minor Mana Oil
            (25119), -- Lesser Wizard Oil
            (25120), -- Lesser Mana Oil
            (25121), -- Wizard Oil
            (25122), -- Brilliant Wizard Oil
            (25123), -- Brilliant Mana Oil
            (25660), -- Dirge's Kickin' Chimaerok Chops
            (25691), -- Smoked Sagefish
            (25704), -- Smoked Sagefish
            (25722), -- Rumsey Rum Dark
            (25804), -- Rumsey Rum Black Label
            (26276); -- Greater Firepower

-- This sql will replace the 1.7 battleground rewards with the new marks of honor added in patch 1.8.

-- Alterac Valley - Always reward marks of honor (they were added in 1.8 on retail).
UPDATE `battleground_template` SET `AllianceWinSpell`=24955, `AllianceLoseSpell`=24954, `HordeWinSpell`=24955, `HordeLoseSpell`=24954 WHERE `id`=1;
-- Warsong Gulch - Always reward marks of honor (they were added in 1.8 on retail).
UPDATE `battleground_template` SET `AllianceWinSpell`=24951, `AllianceLoseSpell`=24950, `HordeWinSpell`=24951, `HordeLoseSpell`=24950 WHERE `id`=2;
-- Arathi Basin - Always reward marks of honor (they were added in 1.8 on retail).
UPDATE `battleground_template` SET `AllianceWinSpell`=24953, `AllianceLoseSpell`=24952, `HordeWinSpell`=24953, `HordeLoseSpell`=24952 WHERE `id`=3;

-- Change minimum patch for mark turn in quests to 1.7 (added in 1.8 on retail).
DELETE FROM `quest_template` WHERE `patch`<6 && `entry` IN (8080, 7876, 7874, 7873, 7872, 7871, 7789, 7788, 7875, 8123, 8154, 8155, 8156, 8160, 8161, 8162, 8291, 8292, 8293, 8294, 8297, 8298, 8299, 8300);
UPDATE `quest_template` SET `patch`=5 WHERE `entry` IN (8434, 8433, 8432, 8431, 8430, 8429, 8428, 8427, 8426, 8407, 8408, 8406, 8405, 8404, 8403, 8402, 8401, 8400, 8399, 8398, 8397, 8396, 8395, 8394, 8393, 8392, 8391, 8390, 8389, 8388, 8387, 8385, 8386, 8384, 8383, 8375, 8374, 8372, 8080, 8371, 8370, 7876, 7874, 8369, 8368, 8367, 7873, 7872, 7871, 7789, 7788, 8435, 8436, 8437, 8438, 8439, 8440, 8441, 8442, 8443, 7875, 8123, 8154, 8155, 8156, 8160, 8161, 8162, 8291, 8292, 8293, 8294, 8297, 8298, 8299, 8300);
UPDATE `creature_questrelation` SET `patch`=5 WHERE `quest` IN (8434, 8433, 8432, 8431, 8430, 8429, 8428, 8427, 8426, 8407, 8408, 8406, 8405, 8404, 8403, 8402, 8401, 8400, 8399, 8398, 8397, 8396, 8395, 8394, 8393, 8392, 8391, 8390, 8389, 8388, 8387, 8385, 8386, 8384, 8383, 8375, 8374, 8372, 8080, 8371, 8370, 7876, 7874, 8369, 8368, 8367, 7873, 7872, 7871, 7789, 7788, 8435, 8436, 8437, 8438, 8439, 8440, 8441, 8442, 8443, 7875, 8123, 8154, 8155, 8156, 8160, 8161, 8162, 8291, 8292, 8293, 8294, 8297, 8298, 8299, 8300);
UPDATE `creature_involvedrelation` SET `patch`=5 WHERE `quest` IN (8434, 8433, 8432, 8431, 8430, 8429, 8428, 8427, 8426, 8407, 8408, 8406, 8405, 8404, 8403, 8402, 8401, 8400, 8399, 8398, 8397, 8396, 8395, 8394, 8393, 8392, 8391, 8390, 8389, 8388, 8387, 8385, 8386, 8384, 8383, 8375, 8374, 8372, 8080, 8371, 8370, 7876, 7874, 8369, 8368, 8367, 7873, 7872, 7871, 7789, 7788, 8435, 8436, 8437, 8438, 8439, 8440, 8441, 8442, 8443, 7875, 8123, 8154, 8155, 8156, 8160, 8161, 8162, 8291, 8292, 8293, 8294, 8297, 8298, 8299, 8300);

-- Disable old PvP reward turn in quests (on retail available from 1.5 to 1.8).
UPDATE `quest_template` SET `Method`=1 WHERE `entry` IN (8081, 7925, 7925, 7924, 7924, 7922, 7923, 7923, 7921, 7922, 8001, 7888, 7888, 7921, 7886, 7887, 7887, 7886, 8081, 8124, 8124, 8157, 8157, 8158, 8158, 8159, 8159, 8163, 8163, 8164, 8164, 8165, 8165, 8266, 8266, 8267, 8267, 8268, 8268, 8269, 8269, 8289, 8296, 8565, 8566, 8567, 8568, 8569, 8570);

-- Always spawn the Warbringers and Brigadier Generals (added in 1.8 on retail).
UPDATE `creature` SET `patch_min`=5 WHERE `id` IN (15350, 15351);
