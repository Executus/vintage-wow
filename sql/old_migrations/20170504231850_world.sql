INSERT INTO `migrations` VALUES ('20170504231850');

-- Added missing spawn of NPC 5981 (Portal Seeker) in Blasted Lands
SET @GUID := 159993;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO creature (guid,id,map,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,curhealth,curmana,MovementType) VALUES
(@GUID, 5981, 0, -11351.9, -2754.5, 7.95043, 2.103, 430, 7, 2131, 0, 2);
UPDATE creature_template SET MovementType = 2 WHERE Entry = 5981;

DELETE FROM `creature_movement_template` WHERE `entry` = 5981;
INSERT INTO `creature_movement_template` VALUES
(5981, 1, -11351.9, -2754.5, 7.95043, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(5981, 13, -11370.7, -2855.8, 4.71995, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(5981, 12, -11396.9, -2926.05, 3.04129, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(5981, 11, -11331, -2986.1, 3.21401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(5981, 10, -11380.8, -3012.74, -4.27558, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(5981, 9, -11444.1, -3037.88, 1.11443, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(5981, 8, -11500.1, -3041.02, -0.783425, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(5981, 7, -11444, -3037.98, 1.11936, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(5981, 6, -11380.8, -3013.05, -4.29948, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(5981, 5, -11330.8, -2986.01, 3.24732, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(5981, 4, -11396.7, -2926.03, 3.05246, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(5981, 3, -11370.9, -2855.73, 4.67282, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(5981, 2, -11358.7, -2797.01, 5.45784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(5981, 14, -11358.6, -2796.98, 5.47431, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);
