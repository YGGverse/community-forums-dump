BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "discussion_tag" (
	"discussion_id"	integer NOT NULL,
	"tag_id"	integer NOT NULL,
	"created_at"	datetime DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("discussion_id","tag_id"),
	FOREIGN KEY("discussion_id") REFERENCES "discussions"("id") on delete cascade on update no action,
	FOREIGN KEY("tag_id") REFERENCES "tags"("id") on delete cascade on update no action
);
CREATE TABLE IF NOT EXISTS "discussion_user" (
	"user_id"	INTEGER NOT NULL,
	"discussion_id"	INTEGER NOT NULL,
	"last_read_at"	DATETIME DEFAULT NULL,
	"last_read_post_number"	INTEGER DEFAULT NULL,
	"subscription"	varchar CHECK("subscription" IN ('follow', 'ignore')),
	PRIMARY KEY("user_id","discussion_id")
);
CREATE TABLE IF NOT EXISTS "discussions" (
	"id"	INTEGER NOT NULL,
	"title"	VARCHAR(255) NOT NULL COLLATE BINARY,
	"comment_count"	INTEGER NOT NULL DEFAULT 1,
	"participant_count"	INTEGER NOT NULL DEFAULT 0,
	"created_at"	DATETIME NOT NULL,
	"user_id"	INTEGER DEFAULT NULL,
	"first_post_id"	INTEGER DEFAULT NULL,
	"last_posted_at"	DATETIME DEFAULT NULL,
	"last_posted_user_id"	INTEGER DEFAULT NULL,
	"last_post_id"	INTEGER DEFAULT NULL,
	"last_post_number"	INTEGER DEFAULT NULL,
	"hidden_at"	DATETIME DEFAULT NULL,
	"hidden_user_id"	INTEGER DEFAULT NULL,
	"slug"	VARCHAR(255) NOT NULL COLLATE BINARY,
	"is_private"	BOOLEAN NOT NULL DEFAULT 0,
	"is_approved"	tinyint(1) NOT NULL DEFAULT '1',
	"is_sticky"	tinyint(1) NOT NULL DEFAULT '0',
	"is_locked"	tinyint(1) NOT NULL DEFAULT '0',
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("first_post_id") REFERENCES "posts"("id") on delete set null,
	FOREIGN KEY("hidden_user_id") REFERENCES "users"("id") on delete set null,
	FOREIGN KEY("last_post_id") REFERENCES "posts"("id") on delete set null,
	FOREIGN KEY("last_posted_user_id") REFERENCES "users"("id") on delete set null,
	FOREIGN KEY("user_id") REFERENCES "users"("id") on delete set null
);
CREATE TABLE IF NOT EXISTS "posts" (
	"id"	INTEGER NOT NULL,
	"discussion_id"	INTEGER NOT NULL,
	"number"	INTEGER DEFAULT NULL,
	"created_at"	DATETIME NOT NULL,
	"user_id"	INTEGER DEFAULT NULL,
	"type"	VARCHAR(255) DEFAULT NULL,
	"content"	CLOB DEFAULT NULL,
	"edited_at"	DATETIME DEFAULT NULL,
	"edited_user_id"	INTEGER DEFAULT NULL,
	"hidden_at"	DATETIME DEFAULT NULL,
	"hidden_user_id"	INTEGER DEFAULT NULL,
	"ip_address"	VARCHAR(255) DEFAULT NULL,
	"is_private"	BOOLEAN NOT NULL DEFAULT 0,
	"is_approved"	tinyint(1) NOT NULL DEFAULT '1',
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("discussion_id") REFERENCES "discussions"("id") on delete cascade,
	FOREIGN KEY("edited_user_id") REFERENCES "users"("id") on delete set null,
	FOREIGN KEY("hidden_user_id") REFERENCES "users"("id") on delete set null,
	FOREIGN KEY("user_id") REFERENCES "users"("id") on delete set null
);
CREATE TABLE IF NOT EXISTS "tags" (
	"id"	integer NOT NULL,
	"name"	varchar NOT NULL,
	"slug"	varchar NOT NULL,
	"description"	text,
	"color"	varchar,
	"background_path"	varchar,
	"background_mode"	varchar,
	"position"	integer,
	"parent_id"	integer,
	"default_sort"	varchar,
	"is_restricted"	tinyint(1) NOT NULL DEFAULT ('0'),
	"is_hidden"	tinyint(1) NOT NULL DEFAULT ('0'),
	"discussion_count"	integer NOT NULL DEFAULT ('0'),
	"last_posted_at"	datetime,
	"last_posted_discussion_id"	integer,
	"last_posted_user_id"	integer,
	"icon"	varchar,
	"created_at"	datetime DEFAULT CURRENT_TIMESTAMP,
	"updated_at"	datetime DEFAULT CURRENT_TIMESTAMP,
	"is_primary"	tinyint(1) NOT NULL DEFAULT '0',
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("last_posted_discussion_id") REFERENCES "discussions"("id") on delete set null on update no action,
	FOREIGN KEY("last_posted_user_id") REFERENCES "users"("id") on delete set null on update no action,
	FOREIGN KEY("parent_id") REFERENCES "tags"("id") on delete set null on update no action
);
INSERT INTO "discussion_tag" VALUES (2,2,'2025-08-24 20:20:35');
INSERT INTO "discussion_tag" VALUES (2,4,'2025-08-24 20:22:02');
INSERT INTO "discussion_tag" VALUES (5,2,'2025-08-24 20:29:58');
INSERT INTO "discussion_tag" VALUES (5,5,'2025-08-24 20:30:43');
INSERT INTO "discussion_tag" VALUES (1,4,'2025-08-24 20:37:19');
INSERT INTO "discussion_tag" VALUES (3,4,'2025-08-24 20:37:27');
INSERT INTO "discussion_tag" VALUES (6,2,'2025-08-24 20:50:52');
INSERT INTO "discussion_tag" VALUES (6,5,'2025-08-24 20:50:52');
INSERT INTO "discussion_tag" VALUES (7,2,'2025-08-24 20:55:27');
INSERT INTO "discussion_tag" VALUES (7,5,'2025-08-24 20:55:27');
INSERT INTO "discussion_tag" VALUES (8,2,'2025-08-24 20:57:43');
INSERT INTO "discussion_tag" VALUES (8,5,'2025-08-24 20:57:43');
INSERT INTO "discussion_tag" VALUES (9,2,'2025-08-24 20:59:46');
INSERT INTO "discussion_tag" VALUES (9,5,'2025-08-24 20:59:46');
INSERT INTO "discussion_tag" VALUES (10,5,'2025-08-24 21:01:57');
INSERT INTO "discussion_tag" VALUES (11,3,'2025-08-24 21:39:58');
INSERT INTO "discussion_tag" VALUES (11,1,'2025-08-24 21:39:58');
INSERT INTO "discussion_tag" VALUES (12,5,'2025-08-24 22:14:57');
INSERT INTO "discussion_tag" VALUES (12,3,'2025-08-24 22:14:57');
INSERT INTO "discussion_tag" VALUES (13,1,'2025-08-24 22:31:25');
INSERT INTO "discussion_tag" VALUES (13,2,'2025-08-24 22:31:25');
INSERT INTO "discussion_tag" VALUES (14,5,'2025-08-24 22:33:46');
INSERT INTO "discussion_tag" VALUES (15,5,'2025-08-24 22:47:56');
INSERT INTO "discussion_tag" VALUES (16,1,'2025-08-24 23:02:06');
INSERT INTO "discussion_tag" VALUES (16,2,'2025-08-24 23:02:06');
INSERT INTO "discussion_tag" VALUES (17,5,'2025-08-24 23:51:13');
INSERT INTO "discussion_tag" VALUES (4,1,'2025-08-25 00:04:38');
INSERT INTO "discussion_tag" VALUES (18,1,'2025-08-26 04:51:08');
INSERT INTO "discussion_tag" VALUES (19,5,'2025-08-26 07:55:14');
INSERT INTO "discussion_tag" VALUES (20,4,'2025-08-26 08:49:39');
INSERT INTO "discussion_tag" VALUES (21,5,'2025-08-26 18:44:36');
INSERT INTO "discussion_tag" VALUES (22,5,'2025-08-27 05:11:50');
INSERT INTO "discussion_tag" VALUES (23,1,'2025-08-27 07:57:35');
INSERT INTO "discussion_tag" VALUES (24,2,'2025-08-27 09:21:05');
INSERT INTO "discussion_tag" VALUES (24,5,'2025-08-27 09:21:05');
INSERT INTO "discussion_tag" VALUES (23,2,'2025-08-27 09:43:08');
INSERT INTO "discussion_tag" VALUES (23,3,'2025-08-27 09:43:08');
INSERT INTO "discussion_tag" VALUES (25,2,'2025-08-27 12:48:32');
INSERT INTO "discussion_tag" VALUES (25,5,'2025-08-27 12:48:32');
INSERT INTO "discussion_tag" VALUES (26,5,'2025-08-28 02:40:54');
INSERT INTO "discussion_tag" VALUES (26,2,'2025-08-28 02:40:54');
INSERT INTO "discussion_tag" VALUES (26,3,'2025-08-28 02:40:54');
INSERT INTO "discussion_tag" VALUES (27,5,'2025-08-28 07:35:52');
INSERT INTO "discussion_tag" VALUES (28,1,'2025-08-28 09:57:45');
INSERT INTO "discussion_tag" VALUES (28,2,'2025-08-28 09:57:45');
INSERT INTO "discussion_tag" VALUES (28,3,'2025-08-28 09:57:45');
INSERT INTO "discussion_tag" VALUES (29,3,'2025-08-29 12:28:20');
INSERT INTO "discussion_tag" VALUES (29,2,'2025-08-29 12:28:20');
INSERT INTO "discussion_tag" VALUES (29,1,'2025-08-30 06:18:44');
INSERT INTO "discussion_tag" VALUES (30,4,'2025-08-30 09:03:33');
INSERT INTO "discussion_tag" VALUES (31,5,'2025-08-30 09:08:28');
INSERT INTO "discussion_tag" VALUES (32,5,'2025-08-30 12:59:27');
INSERT INTO "discussion_tag" VALUES (33,4,'2025-08-30 13:54:55');
INSERT INTO "discussion_tag" VALUES (34,1,'2025-08-31 04:12:15');
INSERT INTO "discussion_tag" VALUES (35,5,'2025-08-31 06:37:21');
INSERT INTO "discussion_tag" VALUES (36,1,'2025-08-31 09:47:24');
INSERT INTO "discussion_tag" VALUES (37,1,'2025-08-31 16:25:40');
INSERT INTO "discussion_tag" VALUES (37,3,'2025-08-31 16:25:40');
INSERT INTO "discussion_tag" VALUES (38,5,'2025-09-02 09:27:16');
INSERT INTO "discussion_tag" VALUES (39,1,'2025-09-02 12:54:57');
INSERT INTO "discussion_tag" VALUES (39,2,'2025-09-02 12:54:57');
INSERT INTO "discussion_tag" VALUES (40,1,'2025-09-02 18:22:08');
INSERT INTO "discussion_tag" VALUES (40,2,'2025-09-02 18:22:08');
INSERT INTO "discussion_tag" VALUES (40,3,'2025-09-02 18:22:08');
INSERT INTO "discussion_tag" VALUES (41,1,'2025-09-05 10:33:32');
INSERT INTO "discussion_tag" VALUES (42,1,'2025-09-07 11:57:29');
INSERT INTO "discussion_tag" VALUES (43,4,'2025-09-07 12:34:22');
INSERT INTO "discussion_tag" VALUES (44,7,'2025-09-07 12:43:11');
INSERT INTO "discussion_tag" VALUES (42,2,'2025-09-07 13:20:39');
INSERT INTO "discussion_tag" VALUES (45,2,'2025-09-09 10:45:21');
INSERT INTO "discussion_tag" VALUES (45,1,'2025-09-09 10:45:21');
INSERT INTO "discussion_tag" VALUES (46,4,'2025-09-11 12:39:49');
INSERT INTO "discussion_tag" VALUES (47,1,'2025-09-11 19:13:30');
INSERT INTO "discussion_tag" VALUES (48,5,'2025-09-11 20:52:27');
INSERT INTO "discussion_tag" VALUES (49,1,'2025-09-11 21:41:14');
INSERT INTO "discussion_tag" VALUES (50,4,'2025-09-12 00:54:25');
INSERT INTO "discussion_tag" VALUES (51,1,'2025-09-12 12:43:06');
INSERT INTO "discussion_tag" VALUES (52,5,'2025-09-13 13:02:31');
INSERT INTO "discussion_tag" VALUES (53,7,'2025-09-14 15:47:21');
INSERT INTO "discussion_tag" VALUES (54,4,'2025-09-14 17:29:49');
INSERT INTO "discussion_tag" VALUES (55,5,'2025-09-16 20:49:13');
INSERT INTO "discussion_tag" VALUES (56,2,'2025-09-17 17:43:10');
INSERT INTO "discussion_tag" VALUES (56,3,'2025-09-17 17:43:10');
INSERT INTO "discussion_tag" VALUES (56,5,'2025-09-17 17:43:10');
INSERT INTO "discussion_tag" VALUES (58,5,'2025-09-18 20:32:50');
INSERT INTO "discussion_tag" VALUES (57,2,'2025-09-18 21:17:57');
INSERT INTO "discussion_tag" VALUES (57,3,'2025-09-18 21:17:57');
INSERT INTO "discussion_tag" VALUES (59,1,'2025-09-21 00:14:55');
INSERT INTO "discussion_tag" VALUES (60,1,'2025-09-21 17:41:58');
INSERT INTO "discussion_tag" VALUES (61,7,'2025-09-21 20:17:01');
INSERT INTO "discussion_tag" VALUES (62,7,'2025-09-21 20:41:52');
INSERT INTO "discussion_tag" VALUES (62,2,'2025-09-21 20:41:52');
INSERT INTO "discussion_tag" VALUES (62,3,'2025-09-21 20:41:52');
INSERT INTO "discussion_tag" VALUES (63,7,'2025-09-21 21:20:41');
INSERT INTO "discussion_tag" VALUES (57,7,'2025-09-21 21:58:12');
INSERT INTO "discussion_tag" VALUES (64,4,'2025-09-22 13:13:36');
INSERT INTO "discussion_tag" VALUES (64,2,'2025-09-22 13:13:36');
INSERT INTO "discussion_tag" VALUES (64,3,'2025-09-22 13:13:36');
INSERT INTO "discussion_tag" VALUES (65,4,'2025-09-22 16:31:31');
INSERT INTO "discussion_tag" VALUES (66,3,'2025-09-22 16:35:12');
INSERT INTO "discussion_tag" VALUES (66,1,'2025-09-22 16:35:12');
INSERT INTO "discussion_tag" VALUES (67,5,'2025-09-24 01:30:01');
INSERT INTO "discussion_tag" VALUES (68,1,'2025-09-24 15:59:02');
INSERT INTO "discussion_tag" VALUES (69,2,'2025-09-25 05:19:07');
INSERT INTO "discussion_tag" VALUES (69,5,'2025-09-25 05:19:07');
INSERT INTO "discussion_tag" VALUES (70,1,'2025-09-29 03:36:31');
INSERT INTO "discussion_tag" VALUES (70,2,'2025-09-29 03:36:31');
INSERT INTO "discussion_tag" VALUES (71,5,'2025-09-29 12:43:12');
INSERT INTO "discussion_tag" VALUES (71,2,'2025-09-29 12:43:12');
INSERT INTO "discussion_tag" VALUES (71,3,'2025-09-29 12:43:12');
INSERT INTO "discussion_tag" VALUES (72,4,'2025-09-30 16:49:08');
INSERT INTO "discussion_tag" VALUES (72,8,'2025-09-30 16:49:08');
INSERT INTO "discussion_tag" VALUES (73,5,'2025-10-02 01:39:06');
INSERT INTO "discussion_tag" VALUES (73,8,'2025-10-02 01:39:06');
INSERT INTO "discussion_tag" VALUES (73,2,'2025-10-02 01:40:12');
INSERT INTO "discussion_tag" VALUES (64,8,'2025-10-03 16:59:46');
INSERT INTO "discussion_tag" VALUES (74,7,'2025-10-04 03:03:06');
INSERT INTO "discussion_tag" VALUES (75,8,'2025-10-04 03:48:28');
INSERT INTO "discussion_tag" VALUES (75,3,'2025-10-04 03:48:28');
INSERT INTO "discussion_tag" VALUES (75,1,'2025-10-04 08:50:10');
INSERT INTO "discussion_tag" VALUES (76,5,'2025-10-04 13:21:12');
INSERT INTO "discussion_tag" VALUES (76,8,'2025-10-04 13:21:12');
INSERT INTO "discussion_tag" VALUES (76,2,'2025-10-04 13:21:12');
INSERT INTO "discussion_tag" VALUES (77,3,'2025-10-05 14:13:05');
INSERT INTO "discussion_tag" VALUES (77,8,'2025-10-05 14:13:05');
INSERT INTO "discussion_tag" VALUES (77,1,'2025-10-05 14:21:09');
INSERT INTO "discussion_tag" VALUES (78,1,'2025-10-07 04:45:04');
INSERT INTO "discussion_tag" VALUES (78,9,'2025-10-07 04:45:04');
INSERT INTO "discussion_tag" VALUES (78,2,'2025-10-07 04:52:59');
INSERT INTO "discussion_tag" VALUES (79,1,'2025-10-07 11:55:54');
INSERT INTO "discussion_tag" VALUES (79,9,'2025-10-07 11:55:54');
INSERT INTO "discussion_tag" VALUES (79,3,'2025-10-07 11:55:54');
INSERT INTO "discussion_tag" VALUES (79,2,'2025-10-07 11:55:54');
INSERT INTO "discussion_tag" VALUES (80,5,'2025-10-07 12:02:25');
INSERT INTO "discussion_tag" VALUES (80,9,'2025-10-07 12:02:25');
INSERT INTO "discussion_tag" VALUES (80,2,'2025-10-07 12:02:25');
INSERT INTO "discussion_tag" VALUES (80,3,'2025-10-07 12:02:25');
INSERT INTO "discussion_tag" VALUES (81,5,'2025-10-07 15:39:18');
INSERT INTO "discussion_tag" VALUES (81,9,'2025-10-07 15:39:18');
INSERT INTO "discussion_tag" VALUES (82,5,'2025-10-08 15:24:28');
INSERT INTO "discussion_tag" VALUES (79,8,'2025-10-08 21:53:10');
INSERT INTO "discussion_tag" VALUES (83,5,'2025-10-09 00:09:55');
INSERT INTO "discussion_tag" VALUES (84,5,'2025-10-09 20:33:29');
INSERT INTO "discussion_tag" VALUES (84,8,'2025-10-09 20:33:29');
INSERT INTO "discussion_tag" VALUES (85,7,'2025-10-12 14:59:02');
INSERT INTO "discussion_tag" VALUES (86,1,'2025-10-12 21:17:22');
INSERT INTO "discussion_tag" VALUES (86,9,'2025-10-12 21:17:22');
INSERT INTO "discussion_tag" VALUES (87,7,'2025-10-17 23:22:55');
INSERT INTO "discussion_tag" VALUES (88,7,'2025-10-18 15:00:11');
INSERT INTO "discussion_tag" VALUES (89,7,'2025-10-18 15:44:12');
INSERT INTO "discussion_tag" VALUES (90,1,'2025-10-19 23:10:59');
INSERT INTO "discussion_tag" VALUES (90,8,'2025-10-19 23:10:59');
INSERT INTO "discussion_tag" VALUES (91,2,'2025-10-20 04:52:45');
INSERT INTO "discussion_tag" VALUES (91,3,'2025-10-20 04:52:45');
INSERT INTO "discussion_tag" VALUES (91,8,'2025-10-20 04:52:45');
INSERT INTO "discussion_tag" VALUES (91,1,'2025-10-20 04:53:16');
INSERT INTO "discussion_tag" VALUES (92,5,'2025-10-20 06:03:01');
INSERT INTO "discussion_tag" VALUES (93,1,'2025-10-20 12:12:11');
INSERT INTO "discussion_tag" VALUES (94,7,'2025-10-20 14:51:46');
INSERT INTO "discussion_tag" VALUES (95,7,'2025-10-21 11:41:00');
INSERT INTO "discussion_tag" VALUES (96,5,'2025-10-24 02:57:24');
INSERT INTO "discussion_tag" VALUES (96,8,'2025-10-24 02:57:24');
INSERT INTO "discussion_tag" VALUES (97,1,'2025-10-24 03:11:30');
INSERT INTO "discussion_tag" VALUES (97,8,'2025-10-24 03:11:30');
INSERT INTO "discussion_tag" VALUES (98,1,'2025-10-27 13:37:38');
INSERT INTO "discussion_tag" VALUES (98,2,'2025-10-27 13:37:38');
INSERT INTO "discussion_tag" VALUES (98,3,'2025-10-27 13:37:38');
INSERT INTO "discussion_tag" VALUES (99,1,'2025-10-28 02:29:22');
INSERT INTO "discussion_tag" VALUES (100,2,'2025-10-29 19:05:57');
INSERT INTO "discussion_tag" VALUES (100,1,'2025-10-29 19:05:57');
INSERT INTO "discussion_tag" VALUES (101,5,'2025-10-31 00:04:01');
INSERT INTO "discussion_tag" VALUES (101,8,'2025-10-31 00:04:01');
INSERT INTO "discussion_tag" VALUES (102,1,'2025-10-31 04:13:31');
INSERT INTO "discussion_user" VALUES (1,1,'2025-08-24 23:16:40',2,NULL);
INSERT INTO "discussion_user" VALUES (1,2,'2025-08-24 20:21:30',2,NULL);
INSERT INTO "discussion_user" VALUES (1,3,'2025-08-25 06:56:50',3,NULL);
INSERT INTO "discussion_user" VALUES (1,4,'2025-08-24 11:53:00',1,NULL);
INSERT INTO "discussion_user" VALUES (1,5,'2025-08-24 20:30:50',2,NULL);
INSERT INTO "discussion_user" VALUES (1,6,'2025-08-24 20:50:52',1,NULL);
INSERT INTO "discussion_user" VALUES (1,7,'2025-08-24 20:55:27',1,NULL);
INSERT INTO "discussion_user" VALUES (1,8,'2025-08-24 20:57:43',1,NULL);
INSERT INTO "discussion_user" VALUES (1,9,'2025-08-24 20:59:46',1,NULL);
INSERT INTO "discussion_user" VALUES (1,10,'2025-08-24 21:02:00',1,NULL);
INSERT INTO "discussion_user" VALUES (1,11,'2025-08-24 21:39:58',1,NULL);
INSERT INTO "discussion_user" VALUES (1,12,'2025-08-24 22:14:57',1,NULL);
INSERT INTO "discussion_user" VALUES (1,13,'2025-08-24 22:31:26',1,NULL);
INSERT INTO "discussion_user" VALUES (1,14,'2025-08-24 22:33:46',1,NULL);
INSERT INTO "discussion_user" VALUES (1,15,'2025-08-24 22:47:56',1,NULL);
INSERT INTO "discussion_user" VALUES (1,16,'2025-08-24 23:02:06',1,NULL);
INSERT INTO "discussion_user" VALUES (1,17,'2025-08-24 23:51:13',1,NULL);
INSERT INTO "discussion_user" VALUES (1,18,'2025-08-26 06:10:35',1,NULL);
INSERT INTO "discussion_user" VALUES (1,19,'2025-08-26 07:57:47',1,NULL);
INSERT INTO "discussion_user" VALUES (1,20,'2025-08-26 08:51:42',2,NULL);
INSERT INTO "discussion_user" VALUES (1,21,'2025-08-26 18:44:36',1,NULL);
INSERT INTO "discussion_user" VALUES (1,22,'2025-08-27 05:11:50',1,NULL);
INSERT INTO "discussion_user" VALUES (1,23,'2025-08-28 15:11:28',2,NULL);
INSERT INTO "discussion_user" VALUES (1,24,'2025-08-27 09:21:05',1,NULL);
INSERT INTO "discussion_user" VALUES (1,25,'2025-08-27 12:48:32',1,NULL);
INSERT INTO "discussion_user" VALUES (1,26,'2025-08-28 02:40:55',1,NULL);
INSERT INTO "discussion_user" VALUES (1,27,'2025-08-28 07:35:52',1,NULL);
INSERT INTO "discussion_user" VALUES (1,28,'2025-08-28 09:57:45',1,NULL);
INSERT INTO "discussion_user" VALUES (1,29,'2025-08-30 06:18:50',1,NULL);
INSERT INTO "discussion_user" VALUES (2,25,'2025-08-30 08:38:08',1,NULL);
INSERT INTO "discussion_user" VALUES (1,30,'2025-08-30 09:03:33',1,NULL);
INSERT INTO "discussion_user" VALUES (1,31,'2025-08-30 09:08:28',1,NULL);
INSERT INTO "discussion_user" VALUES (1,32,'2025-08-30 12:59:27',1,NULL);
INSERT INTO "discussion_user" VALUES (1,33,'2025-08-30 13:54:55',1,NULL);
INSERT INTO "discussion_user" VALUES (1,34,'2025-08-31 04:42:42',2,NULL);
INSERT INTO "discussion_user" VALUES (1,35,'2025-08-31 06:37:21',1,NULL);
INSERT INTO "discussion_user" VALUES (1,36,'2025-08-31 09:47:24',1,NULL);
INSERT INTO "discussion_user" VALUES (1,37,'2025-08-31 16:25:40',1,NULL);
INSERT INTO "discussion_user" VALUES (1,38,'2025-09-02 09:27:17',1,NULL);
INSERT INTO "discussion_user" VALUES (1,39,'2025-09-02 12:54:57',1,NULL);
INSERT INTO "discussion_user" VALUES (1,40,'2025-09-02 18:22:08',1,NULL);
INSERT INTO "discussion_user" VALUES (1,41,'2025-09-05 10:33:32',1,NULL);
INSERT INTO "discussion_user" VALUES (1,42,'2025-11-01 20:54:10',2,NULL);
INSERT INTO "discussion_user" VALUES (1,43,'2025-09-07 12:34:22',1,NULL);
INSERT INTO "discussion_user" VALUES (1,44,'2025-09-07 13:20:21',2,NULL);
INSERT INTO "discussion_user" VALUES (1,45,'2025-09-09 10:45:21',1,NULL);
INSERT INTO "discussion_user" VALUES (1,46,'2025-09-11 12:39:49',1,NULL);
INSERT INTO "discussion_user" VALUES (1,47,'2025-09-11 19:13:30',1,NULL);
INSERT INTO "discussion_user" VALUES (1,48,'2025-09-11 20:52:27',1,NULL);
INSERT INTO "discussion_user" VALUES (1,49,'2025-09-11 21:41:14',1,NULL);
INSERT INTO "discussion_user" VALUES (1,50,'2025-09-12 00:54:25',1,NULL);
INSERT INTO "discussion_user" VALUES (1,51,'2025-09-12 12:43:06',1,NULL);
INSERT INTO "discussion_user" VALUES (1,52,'2025-09-13 13:02:31',1,NULL);
INSERT INTO "discussion_user" VALUES (1,53,'2025-09-14 15:47:22',1,NULL);
INSERT INTO "discussion_user" VALUES (1,54,'2025-09-14 17:29:50',1,NULL);
INSERT INTO "discussion_user" VALUES (1,55,'2025-09-16 20:49:13',1,NULL);
INSERT INTO "discussion_user" VALUES (1,56,'2025-09-17 17:43:10',1,NULL);
INSERT INTO "discussion_user" VALUES (1,57,'2025-09-21 21:59:03',2,NULL);
INSERT INTO "discussion_user" VALUES (1,58,'2025-09-18 20:32:50',1,NULL);
INSERT INTO "discussion_user" VALUES (1,59,'2025-09-21 00:14:55',1,NULL);
INSERT INTO "discussion_user" VALUES (1,60,'2025-09-21 17:41:58',1,NULL);
INSERT INTO "discussion_user" VALUES (1,61,'2025-09-21 20:17:01',1,NULL);
INSERT INTO "discussion_user" VALUES (1,62,'2025-09-21 21:03:25',2,NULL);
INSERT INTO "discussion_user" VALUES (1,63,'2025-09-21 21:20:42',1,NULL);
INSERT INTO "discussion_user" VALUES (1,64,'2025-10-03 17:20:21',1,NULL);
INSERT INTO "discussion_user" VALUES (1,65,'2025-09-22 16:31:31',1,NULL);
INSERT INTO "discussion_user" VALUES (1,66,'2025-09-22 16:35:12',1,NULL);
INSERT INTO "discussion_user" VALUES (1,67,'2025-09-24 01:30:01',1,NULL);
INSERT INTO "discussion_user" VALUES (1,68,'2025-09-24 15:59:02',1,NULL);
INSERT INTO "discussion_user" VALUES (1,69,'2025-09-25 05:19:07',1,NULL);
INSERT INTO "discussion_user" VALUES (1,70,'2025-09-29 03:36:31',1,NULL);
INSERT INTO "discussion_user" VALUES (1,71,'2025-09-29 12:43:13',1,NULL);
INSERT INTO "discussion_user" VALUES (1,72,'2025-09-30 16:49:08',1,NULL);
INSERT INTO "discussion_user" VALUES (1,73,'2025-10-02 01:40:46',1,NULL);
INSERT INTO "discussion_user" VALUES (1,74,'2025-10-04 03:03:06',1,NULL);
INSERT INTO "discussion_user" VALUES (1,75,'2025-10-04 08:50:21',1,NULL);
INSERT INTO "discussion_user" VALUES (1,76,'2025-10-04 13:21:12',1,NULL);
INSERT INTO "discussion_user" VALUES (1,77,'2025-10-05 14:20:34',1,NULL);
INSERT INTO "discussion_user" VALUES (1,78,'2025-10-07 13:20:35',2,NULL);
INSERT INTO "discussion_user" VALUES (1,79,'2025-10-08 21:53:18',1,NULL);
INSERT INTO "discussion_user" VALUES (1,80,'2025-10-07 12:02:25',1,NULL);
INSERT INTO "discussion_user" VALUES (1,81,'2025-10-07 15:39:18',1,NULL);
INSERT INTO "discussion_user" VALUES (1,82,'2025-10-08 15:24:28',1,NULL);
INSERT INTO "discussion_user" VALUES (1,83,'2025-10-09 00:09:55',1,NULL);
INSERT INTO "discussion_user" VALUES (1,84,'2025-10-09 20:33:29',1,NULL);
INSERT INTO "discussion_user" VALUES (1,85,'2025-10-12 14:59:02',1,NULL);
INSERT INTO "discussion_user" VALUES (1,86,'2025-10-12 21:17:22',1,NULL);
INSERT INTO "discussion_user" VALUES (1,87,'2025-10-18 02:07:07',1,NULL);
INSERT INTO "discussion_user" VALUES (1,88,'2025-10-18 15:00:11',1,NULL);
INSERT INTO "discussion_user" VALUES (1,89,'2025-10-18 15:44:12',1,NULL);
INSERT INTO "discussion_user" VALUES (1,90,'2025-10-19 23:10:59',1,NULL);
INSERT INTO "discussion_user" VALUES (1,91,'2025-10-20 04:54:01',1,NULL);
INSERT INTO "discussion_user" VALUES (1,92,'2025-10-20 06:03:01',1,NULL);
INSERT INTO "discussion_user" VALUES (1,93,'2025-10-20 12:12:11',1,NULL);
INSERT INTO "discussion_user" VALUES (1,94,'2025-10-20 14:51:46',1,NULL);
INSERT INTO "discussion_user" VALUES (1,95,'2025-10-21 11:41:00',1,NULL);
INSERT INTO "discussion_user" VALUES (1,96,'2025-10-24 02:57:24',1,NULL);
INSERT INTO "discussion_user" VALUES (1,97,'2025-10-24 03:11:30',1,NULL);
INSERT INTO "discussion_user" VALUES (1,98,'2025-10-27 13:37:38',1,NULL);
INSERT INTO "discussion_user" VALUES (1,99,'2025-10-28 02:29:22',1,NULL);
INSERT INTO "discussion_user" VALUES (1,100,'2025-10-29 19:05:57',1,NULL);
INSERT INTO "discussion_user" VALUES (1,101,'2025-10-31 00:04:01',1,NULL);
INSERT INTO "discussion_user" VALUES (1,102,'2025-10-31 04:13:31',1,NULL);
INSERT INTO "discussions" VALUES (1,'Відкриваємось!',1,1,'2025-08-24 09:44:25',1,1,'2025-08-24 09:44:25',1,1,1,NULL,NULL,'vidkrivajemos',0,1,0,0);
INSERT INTO "discussions" VALUES (2,'Yggmail у якості поштової скриньки для авторизації',1,1,'2025-08-24 10:27:27',1,2,'2025-08-24 10:27:27',1,2,1,NULL,NULL,'yggmail-u-iakosti-postovoyi-skrinki-dlia-avtorizaciyi',0,1,0,0);
INSERT INTO "discussions" VALUES (3,'Політика конфіденційності',1,1,'2025-08-24 11:16:50',1,3,'2025-08-24 11:16:50',1,3,1,NULL,NULL,'politika-konfidenciinosti',0,1,1,0);
INSERT INTO "discussions" VALUES (4,'Session',1,1,'2025-08-24 11:53:00',1,5,'2025-08-24 11:53:00',1,5,1,NULL,NULL,'session',0,1,0,0);
INSERT INTO "discussions" VALUES (5,'Yggmail - месенджер з поштовим інтерфейсом',1,1,'2025-08-24 20:29:58',1,8,'2025-08-24 20:29:58',1,8,1,NULL,NULL,'yggmail-mesendzer-z-postovim-interfeisom',0,1,0,0);
INSERT INTO "discussions" VALUES (6,'Yggdrasil - мережа з децентралізованим роутингом',1,1,'2025-08-24 20:50:52',1,12,'2025-08-24 20:50:52',1,12,1,NULL,NULL,'yggdrasil-mereza-z-decentralizovanim-routingom',0,1,0,0);
INSERT INTO "discussions" VALUES (7,'Alfis DNS - реєстрація домену в блокчейн',1,1,'2025-08-24 20:55:27',1,13,'2025-08-24 20:55:27',1,13,1,NULL,NULL,'alfis-dns-rejestraciia-domenu-v-blokcein',0,1,0,0);
INSERT INTO "discussions" VALUES (8,'Налаштування Fediverse-сервера Snac для мережі Yggdrasil',1,1,'2025-08-24 20:57:43',1,14,'2025-08-24 20:57:43',1,14,1,NULL,NULL,'nalastuvannia-fediverse-servera-snac-dlia-merezi-yggdrasil',0,1,0,0);
INSERT INTO "discussions" VALUES (9,'Безпечний перегляд сайтів Yggdrasil з Yggstack',1,1,'2025-08-24 20:59:46',1,15,'2025-08-24 20:59:46',1,15,1,NULL,NULL,'bezpecnii-peregliad-saitiv-yggdrasil-z-yggstack',0,1,0,0);
INSERT INTO "discussions" VALUES (10,'Встановлення BitTorrent трекера Aquatic в Linux',1,1,'2025-08-24 21:01:57',1,16,'2025-08-24 21:01:57',1,16,1,NULL,NULL,'vstanovlennia-bittorrent-trekera-aquatic-v-linux',0,1,0,0);
INSERT INTO "discussions" VALUES (11,'Каталог сервісів Mycelium',1,1,'2025-08-24 21:39:58',1,17,'2025-08-24 21:39:58',1,17,1,NULL,NULL,'katalog-servisiv-mycelium',0,1,0,0);
INSERT INTO "discussions" VALUES (12,'Встановлення Mycelium',1,1,'2025-08-24 22:14:57',1,18,'2025-08-24 22:14:57',1,18,1,NULL,NULL,'vstanovlennia-mycelium',0,1,0,0);
INSERT INTO "discussions" VALUES (13,'Альтернативна реалізація роутера Yggdrasil на Rust',1,1,'2025-08-24 22:31:26',1,19,'2025-08-24 22:31:26',1,19,1,NULL,NULL,'alternativna-realizaciia-routera-yggdrasil-na-rust',0,1,0,0);
INSERT INTO "discussions" VALUES (14,'Встановлення останньої версії Go в Debian/Linux ',1,1,'2025-08-24 22:33:46',1,20,'2025-08-24 22:33:46',1,20,1,NULL,NULL,'vstanovlennia-ostannyoyi-versiyi-go-v-debianlinux',0,1,0,0);
INSERT INTO "discussions" VALUES (15,'Встановлення останньої версії Rust в Linux',1,1,'2025-08-24 22:47:56',1,21,'2025-08-24 22:47:56',1,21,1,NULL,NULL,'vstanovlennia-ostannyoyi-versiyi-rust-v-linux',0,1,0,0);
INSERT INTO "discussions" VALUES (16,'Оновлення Yggdrasil месенджера Mimir',1,1,'2025-08-24 23:02:06',1,22,'2025-08-24 23:02:06',1,22,1,NULL,NULL,'onovlennia-yggdrasil-mesendzera-mimir',0,1,0,0);
INSERT INTO "discussions" VALUES (17,'Встановлення і налаштування Flarum v2 (beta)',1,1,'2025-08-24 23:51:13',1,23,'2025-08-24 23:51:13',1,23,1,NULL,NULL,'vstanovlennia-i-nalastuvannia-flarum-v2-beta',0,1,0,0);
INSERT INTO "discussions" VALUES (18,'Живлення побутового роутера Wi-Fi від пауер-банку',1,1,'2025-08-26 04:51:08',1,25,'2025-08-26 04:51:08',1,25,1,NULL,NULL,'zivlennia-pobutovogo-routera-wi-fi-vid-pauer-banku',0,1,0,0);
INSERT INTO "discussions" VALUES (19,'Налаштування поштової скриньки для локальних мереж без DNS',1,1,'2025-08-26 07:55:14',1,27,'2025-08-26 07:55:14',1,27,1,NULL,NULL,'nalastuvannia-postovoyi-skrinki-dlia-lokalnix-merez-bez-dns',0,1,0,0);
INSERT INTO "discussions" VALUES (20,'Посібник з користування форумом',1,1,'2025-08-26 08:49:39',1,29,'2025-08-26 08:49:39',1,29,1,NULL,NULL,'posibnik-z-koristuvannia-forumom',0,1,1,0);
INSERT INTO "discussions" VALUES (21,'Локальний форк рушія Flarum від YGGverse',1,1,'2025-08-26 18:44:36',1,31,'2025-08-26 18:44:36',1,31,1,NULL,NULL,'lokalnii-fork-rusiia-flarum-vid-yggverse',0,1,0,0);
INSERT INTO "discussions" VALUES (22,'Блокування вихідних з''єднань BitTorrent по діапазону IPv6',1,1,'2025-08-27 05:11:50',1,32,'2025-08-27 05:11:50',1,32,1,NULL,NULL,'blokuvannia-vixidnix-zjednan-bittorrent-po-diapazonu-ipv6',0,1,0,0);
INSERT INTO "discussions" VALUES (23,'Локальний сервер Half-Life',1,1,'2025-08-27 07:57:35',1,33,'2025-08-27 07:57:35',1,33,1,NULL,NULL,'lokalnii-server-half-life',0,1,0,0);
INSERT INTO "discussions" VALUES (24,'YPS - утиліта для сканування портів Yggdrasil',1,1,'2025-08-27 09:21:05',1,34,'2025-08-27 09:21:05',1,34,1,NULL,NULL,'yps-utilita-dlia-skanuvannia-portiv-yggdrasil',0,1,0,0);
INSERT INTO "discussions" VALUES (25,'βtracker - локальний BitTorrent трекер',1,1,'2025-08-27 12:48:32',1,36,'2025-08-27 12:48:32',1,36,1,NULL,NULL,'vtracker-lokalnii-bittorrent-treker',0,1,0,0);
INSERT INTO "discussions" VALUES (26,'Мій файл PAC для Yggdrasil та Mycelium',1,1,'2025-08-28 02:40:54',1,37,'2025-08-28 02:40:54',1,37,1,NULL,NULL,'mii-fail-pac-dlia-yggdrasil-ta-mycelium',0,1,0,0);
INSERT INTO "discussions" VALUES (27,'Завантаження відео з сайтів Rezka HD через плагін yt-dlp',1,1,'2025-08-28 07:35:52',1,38,'2025-08-28 07:35:52',1,38,1,NULL,NULL,'zavantazennia-video-z-saitiv-rezka-hd-cerez-plagin-yt-dlp',0,1,0,0);
INSERT INTO "discussions" VALUES (28,'Думки стосовно TLS в мережах Yggdrasil та Mycelium',1,1,'2025-08-28 09:57:45',1,39,'2025-08-28 09:57:45',1,39,1,NULL,NULL,'dumki-stosovno-tls-v-merezax-yggdrasil-ta-mycelium',0,1,0,0);
INSERT INTO "discussions" VALUES (29,'Про сервер Fediverse в альтернативних мережах',1,1,'2025-08-29 12:28:20',1,40,'2025-08-29 12:28:20',1,40,1,NULL,NULL,'pro-server-fediverse-v-alternativnix-merezax',0,1,0,0);
INSERT INTO "discussions" VALUES (30,'Статистика відвідувань форуму',1,1,'2025-08-30 09:03:33',1,44,'2025-08-30 09:03:33',1,44,1,NULL,NULL,'statistika-vidviduvan-forumu',0,1,0,0);
INSERT INTO "discussions" VALUES (31,'htcount: кнопка-лічильник відвідувачів сайту на базі access.log',1,1,'2025-08-30 09:08:28',1,45,'2025-08-30 09:08:28',1,45,1,NULL,NULL,'htcount-knopka-licilnik-vidviduvaciv-saitu-na-bazi-accesslog',0,1,0,0);
INSERT INTO "discussions" VALUES (32,'Мій пресет LibreWolf для навігації в локальних мережах',1,1,'2025-08-30 12:59:27',1,46,'2025-08-30 12:59:27',1,46,1,NULL,NULL,'mii-preset-librewolf-dlia-navigaciyi-v-lokalnix-merezax',0,1,0,0);
INSERT INTO "discussions" VALUES (33,'Дзеркало форуму на Інтернет',1,1,'2025-08-30 13:54:55',1,47,'2025-08-30 13:54:55',1,47,1,NULL,NULL,'dzerkalo-forumu-na-internet',0,1,0,0);
INSERT INTO "discussions" VALUES (34,'NomadNet на базі Reticulum',1,1,'2025-08-31 04:12:15',1,48,'2025-08-31 04:12:15',1,48,1,NULL,NULL,'nomadnet-na-bazi-reticulum',0,1,0,0);
INSERT INTO "discussions" VALUES (35,'Інтеграція бінарних форків Firefox з GNOME Desktop',1,1,'2025-08-31 06:37:21',1,50,'2025-08-31 06:37:21',1,50,1,NULL,NULL,'integraciia-binarnix-forkiv-firefox-z-gnome-desktop',0,1,0,0);
INSERT INTO "discussions" VALUES (36,'Музичний сервер MPD',1,1,'2025-08-31 09:47:24',1,51,'2025-08-31 09:47:24',1,51,1,NULL,NULL,'muzicnii-server-mpd',0,1,0,0);
INSERT INTO "discussions" VALUES (37,'Альтернативна гілка Alfis DNS з підтримкою Mycelium',1,1,'2025-08-31 16:25:40',1,52,'2025-08-31 16:25:40',1,52,1,NULL,NULL,'alternativna-gilka-alfis-dns-z-pidtrimkoiu-mycelium',0,1,0,0);
INSERT INTO "discussions" VALUES (38,'Misfin - поштовий сателіт Geminispace',1,1,'2025-09-02 09:27:16',1,53,'2025-09-02 09:27:16',1,53,1,NULL,NULL,'misfin-postovii-satelit-geminispace',0,1,0,0);
INSERT INTO "discussions" VALUES (39,'Локальний хаб U.F.M',1,1,'2025-09-02 12:54:57',1,54,'2025-09-02 12:54:57',1,54,1,NULL,NULL,'lokalnii-xab-ufm',0,1,0,0);
INSERT INTO "discussions" VALUES (40,'RSS дампи для мереж Yggdrasil та Mycelium (Nex)',1,1,'2025-09-02 18:22:08',1,55,'2025-09-02 18:22:08',1,55,1,NULL,NULL,'rss-dampi-dlia-merez-yggdrasil-ta-mycelium-nex',0,1,0,0);
INSERT INTO "discussions" VALUES (41,'Думки стосовно оформлення торентів на βtracker',1,1,'2025-09-05 10:33:32',1,56,'2025-09-05 10:33:32',1,56,1,NULL,NULL,'dumki-stosovno-oformlennia-torentiv-na-vtracker',0,1,0,0);
INSERT INTO "discussions" VALUES (42,'Закриваю свій федіверс інстанс',1,1,'2025-09-07 11:57:29',1,57,'2025-09-07 11:57:29',1,57,1,NULL,NULL,'zakrivaiu-svii-fedivers-instans',0,1,0,0);
INSERT INTO "discussions" VALUES (43,'Нова рубрика "Файли"',1,1,'2025-09-07 12:34:22',1,58,'2025-09-07 12:34:22',1,58,1,NULL,NULL,'nova-rubrika-faili',0,1,0,0);
INSERT INTO "discussions" VALUES (44,'Чужий: Земля - 1 cезон, серії 5-8 [HDrezka] [yt-dlp]',1,1,'2025-09-07 12:43:11',1,59,'2025-09-07 12:43:11',1,59,1,NULL,NULL,'cuzii-zemlia-1-cezon-seriyi-5-8-hdrezka-yt-dlp',0,1,0,1);
INSERT INTO "discussions" VALUES (45,'βtracker для Gemini Protocol',1,1,'2025-09-09 10:45:21',1,62,'2025-09-09 10:45:21',1,62,1,NULL,NULL,'vtracker-dlia-gemini-protocol',0,1,0,0);
INSERT INTO "discussions" VALUES (46,'Тусовка FTP',1,1,'2025-09-11 12:39:49',1,63,'2025-09-11 12:39:49',1,63,1,NULL,NULL,'tusovka-ftp',0,1,0,0);
INSERT INTO "discussions" VALUES (47,'Україномовні Веб-ресурси в сегменті ІТ',1,1,'2025-09-11 19:13:30',1,64,'2025-09-11 19:13:30',1,64,1,NULL,NULL,'ukrayinomovni-veb-resursi-v-segmenti-it',0,1,0,0);
INSERT INTO "discussions" VALUES (48,'Гео-локація пірів для Transmission / GTK',1,1,'2025-09-11 20:52:27',1,65,'2025-09-11 20:52:27',1,65,1,NULL,NULL,'geo-lokaciia-piriv-dlia-transmission-gtk',0,1,0,0);
INSERT INTO "discussions" VALUES (49,'Мої перші враження від Flarum',1,1,'2025-09-11 21:41:14',1,66,'2025-09-11 21:41:14',1,66,1,NULL,NULL,'moyi-persi-vrazennia-vid-flarum',0,1,0,0);
INSERT INTO "discussions" VALUES (50,'Децентралізація форуму',1,1,'2025-09-12 00:54:25',1,67,'2025-09-12 00:54:25',1,67,1,NULL,NULL,'decentralizaciia-forumu',0,1,0,0);
INSERT INTO "discussions" VALUES (51,'Браузер Yoda відтепер постачатиметься з Flatpak',1,1,'2025-09-12 12:43:06',1,68,'2025-09-12 12:43:06',1,68,1,NULL,NULL,'brauzer-yoda-vidteper-postacatimetsia-z-flatpak',0,1,0,0);
INSERT INTO "discussions" VALUES (52,'Зміна PeerID / User-agent в Transmission',1,1,'2025-09-13 13:02:31',1,69,'2025-09-13 13:02:31',1,69,1,NULL,NULL,'zmina-peerid-user-agent-v-transmission',0,1,0,0);
INSERT INTO "discussions" VALUES (53,'Налаштування поштового сервера на базі Postfix, Dovecot та RoundCube (Якимчук С., 2016) [PDF]',1,1,'2025-09-14 15:47:21',1,70,'2025-09-14 15:47:21',1,70,1,NULL,NULL,'nalastuvannia-postovogo-servera-na-bazi-postfix-dovecot-ta-roundcube-iakimcuk-s-2016-pdf',0,1,0,0);
INSERT INTO "discussions" VALUES (54,'Реставрація українських Веб-архівів',1,1,'2025-09-14 17:29:49',1,71,'2025-09-14 17:29:49',1,71,1,NULL,NULL,'restavraciia-ukrayinskix-veb-arxiviv',0,1,0,0);
INSERT INTO "discussions" VALUES (55,'Організація гостьового сервера FTP',1,1,'2025-09-16 20:49:13',1,72,'2025-09-16 20:49:13',1,72,1,NULL,NULL,'organizaciia-gostyovogo-servera-ftp',0,1,0,0);
INSERT INTO "discussions" VALUES (56,'Мій пресет Alfis DNS на роутері Yggdrasil / Mycelium',1,1,'2025-09-17 17:43:10',1,73,'2025-09-17 17:43:10',1,73,1,NULL,NULL,'mii-preset-alfis-dns-na-routeri-yggdrasil-mycelium',0,1,0,0);
INSERT INTO "discussions" VALUES (57,'Параметри підключення до гостьового сервера FTP',1,1,'2025-09-17 17:58:59',1,74,'2025-09-17 17:58:59',1,74,1,NULL,NULL,'parametri-pidkliucennia-do-gostyovogo-servera-ftp',0,1,0,0);
INSERT INTO "discussions" VALUES (58,'Копіювання Веб-сайту з обходом анти-бот захисту через wget',1,1,'2025-09-18 20:32:50',1,76,'2025-09-18 20:32:50',1,76,1,NULL,NULL,'kopiiuvannia-veb-saitu-z-obxodom-anti-bot-zaxistu-cerez-wget',0,1,0,0);
INSERT INTO "discussions" VALUES (59,'CDMA в Україні - всьо?',1,1,'2025-09-21 00:14:55',1,78,'2025-09-21 00:14:55',1,78,1,NULL,NULL,'cdma-v-ukrayini-vsyo',0,1,0,0);
INSERT INTO "discussions" VALUES (60,'Колізії SHA1 в BitTorrent v1 можуть використовуватися з метою відстеження',1,1,'2025-09-21 17:41:58',1,79,'2025-09-21 17:41:58',1,79,1,NULL,NULL,'koliziyi-sha1-v-bittorrent-v1-mozut-vikoristovuvatisia-z-metoiu-vidstezennia',0,1,0,0);
INSERT INTO "discussions" VALUES (61,'Український дубляж гри Portal 2 (2011)',1,1,'2025-09-21 20:17:01',1,80,'2025-09-21 20:17:01',1,80,1,NULL,NULL,'ukrayinskii-dubliaz-gri-portal-2-2011',0,1,0,0);
INSERT INTO "discussions" VALUES (62,'Локальні трекери BitTorrent',1,1,'2025-09-21 20:41:52',1,81,'2025-09-21 20:41:52',1,81,1,NULL,NULL,'lokalni-trekeri-bittorrent',0,1,1,0);
INSERT INTO "discussions" VALUES (63,'Буров Є.В. Комп''ютерні мережі (2003) 150dpi (djvu)',1,1,'2025-09-21 21:20:41',1,83,'2025-09-21 21:20:41',1,83,1,NULL,NULL,'burov-jev-kompiuterni-merezi-2003-150dpi-djvu',0,1,0,0);
INSERT INTO "discussions" VALUES (64,'Радіо Підпільне - не формальна радіо станція нашої спільноти',1,1,'2025-09-22 13:13:36',1,84,'2025-09-22 13:13:36',1,84,1,NULL,NULL,'radio-pidpilne-ne-formalna-radio-stanciia-nasoyi-spilnoti',0,1,0,0);
INSERT INTO "discussions" VALUES (65,'Розсилання пошти тимчасово вимкнено',1,1,'2025-09-22 16:31:31',1,85,'2025-09-22 16:31:31',1,85,1,NULL,NULL,'rozsilannia-posti-timcasovo-vimkneno',0,1,0,0);
INSERT INTO "discussions" VALUES (66,'Реліз Mycelium v0.6.2',1,1,'2025-09-22 16:35:12',1,86,'2025-09-22 16:35:12',1,86,1,NULL,NULL,'reliz-mycelium-v062',0,1,0,0);
INSERT INTO "discussions" VALUES (67,'Веб-радіо в Linux: встановлення сервера Icecast та базове налаштування ротації з Ezstream',1,1,'2025-09-24 01:30:01',1,87,'2025-09-24 01:30:01',1,87,1,NULL,NULL,'veb-radio-v-linux-vstanovlennia-servera-icecast-ta-bazove-nalastuvannia-rotaciyi-z-ezstream',0,1,0,0);
INSERT INTO "discussions" VALUES (68,'Потенційні витоки з''єднань на Інтернет в qBittorrent',1,1,'2025-09-24 15:59:02',1,88,'2025-09-24 15:59:02',1,88,1,NULL,NULL,'potenciini-vitoki-zjednan-na-internet-v-qbittorrent',0,1,0,0);
INSERT INTO "discussions" VALUES (69,'Ізоляція Linux від прямих Інтернет з''єднань на базі QEMU / Virtual Machine Manager з VSOCK',1,1,'2025-09-25 05:19:07',1,89,'2025-09-25 05:19:07',1,89,1,NULL,NULL,'izoliaciia-linux-vid-priamix-internet-zjednan-na-bazi-qemu-virtual-machine-manager-z-vsock',0,1,0,0);
INSERT INTO "discussions" VALUES (70,'Вузли Monero для підключення через Yggdrasil',1,1,'2025-09-29 03:36:31',1,91,'2025-09-29 03:36:31',1,91,1,NULL,NULL,'vuzli-monero-dlia-pidkliucennia-cerez-yggdrasil',0,1,0,0);
INSERT INTO "discussions" VALUES (71,'Обмеження вихідних з''єднань на Інтернет з ufw',1,1,'2025-09-29 12:43:12',1,92,'2025-09-29 12:43:12',1,92,1,NULL,NULL,'obmezennia-vixidnix-zjednan-na-internet-z-ufw',0,1,0,0);
INSERT INTO "discussions" VALUES (72,'Форум спільноти в мережі I2P',1,1,'2025-09-30 16:49:08',1,93,'2025-09-30 16:49:08',1,93,1,NULL,NULL,'forum-spilnoti-v-merezi-i2p',0,1,0,0);
INSERT INTO "discussions" VALUES (73,'Встановлення роутера i2pd з підключенням до мережі I2P через Yggdrasil',1,1,'2025-10-02 01:39:06',1,94,'2025-10-02 01:39:06',1,94,1,NULL,NULL,'vstanovlennia-routera-i2pd-z-pidkliucenniam-do-merezi-i2p-cerez-yggdrasil',0,1,0,0);
INSERT INTO "discussions" VALUES (74,'The Elder Scrolls: Arena (Steam App ID #1812290)',1,1,'2025-10-04 03:03:06',1,97,'2025-10-04 03:03:06',1,97,1,NULL,NULL,'the-elder-scrolls-arena-steam-app-id-1812290',0,1,0,0);
INSERT INTO "discussions" VALUES (75,'Інтеграція мережі Mycelium з роутером i2pd',1,1,'2025-10-04 03:48:28',1,98,'2025-10-04 03:48:28',1,98,1,NULL,NULL,'integraciia-merezi-mycelium-z-routerom-i2pd',0,1,0,0);
INSERT INTO "discussions" VALUES (76,'pyseeder: підтримка екосистеми I2P в мережі Yggdrasil',1,1,'2025-10-04 13:21:12',1,102,'2025-10-04 13:21:12',1,102,1,NULL,NULL,'pyseeder-pidtrimka-ekosistemi-i2p-v-merezi-yggdrasil',0,1,0,0);
INSERT INTO "discussions" VALUES (77,'Ресід I2P для Mycelium',1,1,'2025-10-05 14:13:05',1,103,'2025-10-05 14:13:05',1,103,1,NULL,NULL,'resid-i2p-dlia-mycelium',0,1,0,0);
INSERT INTO "discussions" VALUES (78,'Reticulum MeshChat з підключенням через Yggdrasil',1,1,'2025-10-07 04:45:04',1,105,'2025-10-07 04:45:04',1,105,1,NULL,NULL,'reticulum-meshchat-z-pidkliucenniam-cerez-yggdrasil',0,1,0,1);
INSERT INTO "discussions" VALUES (79,'Локальні піри Reticulum',1,1,'2025-10-07 11:55:54',1,107,'2025-10-07 11:55:54',1,107,1,NULL,NULL,'lokalni-piri-reticulum',0,1,0,0);
INSERT INTO "discussions" VALUES (80,'Reticulum / MeshChat з підключенням через Yggdrasil',1,1,'2025-10-07 12:02:25',1,108,'2025-10-07 12:02:25',1,108,1,NULL,NULL,'reticulum-meshchat-z-pidkliucenniam-cerez-yggdrasil',0,1,0,0);
INSERT INTO "discussions" VALUES (81,'Публікація сайту в мережі Reticulum',1,1,'2025-10-07 15:39:18',1,110,'2025-10-07 15:39:18',1,110,1,NULL,NULL,'publikaciia-saitu-v-merezi-reticulum',0,1,0,0);
INSERT INTO "discussions" VALUES (82,'Налаштування вихідного проксі на базі squid',1,1,'2025-10-08 15:24:28',1,111,'2025-10-08 15:24:28',1,111,1,NULL,NULL,'nalastuvannia-vixidnogo-proksi-na-bazi-squid',0,1,0,0);
INSERT INTO "discussions" VALUES (83,'Підбірка довідкових каналів на YouTube / PeerTube',1,1,'2025-10-09 00:09:55',1,113,'2025-10-09 00:09:55',1,113,1,NULL,NULL,'pidbirka-dovidkovix-kanaliv-na-youtube-peertube',0,1,0,0);
INSERT INTO "discussions" VALUES (84,'Публікація капсули Gemini в I2P на прикладі сервера Agate',1,1,'2025-10-09 20:33:29',1,114,'2025-10-09 20:33:29',1,114,1,NULL,NULL,'publikaciia-kapsuli-gemini-v-i2p-na-prikladi-servera-agate',0,1,0,0);
INSERT INTO "discussions" VALUES (85,'Українська локалізація Half-Life 2',1,1,'2025-10-12 14:59:02',1,115,'2025-10-12 14:59:02',1,115,1,NULL,NULL,'ukrayinska-lokalizaciia-half-life-2',0,1,0,0);
INSERT INTO "discussions" VALUES (86,'Reticulum в контексті Geminispace',1,1,'2025-10-12 21:17:22',1,116,'2025-10-12 21:17:22',1,116,1,NULL,NULL,'reticulum-v-konteksti-geminispace',0,1,0,0);
INSERT INTO "discussions" VALUES (87,'Піринг eQtv українською мовою',1,1,'2025-10-17 23:22:55',1,117,'2025-10-17 23:22:55',1,117,1,NULL,NULL,'piring-eqtv-ukrayinskoiu-movoiu',0,1,0,0);
INSERT INTO "discussions" VALUES (88,'Піринг X-Quantum_Quest',1,1,'2025-10-18 15:00:11',1,119,'2025-10-18 15:00:11',1,119,1,NULL,NULL,'piring-x-quantum-quest',0,1,0,0);
INSERT INTO "discussions" VALUES (89,'Піринг Digital Nomad',1,1,'2025-10-18 15:44:12',1,120,'2025-10-18 15:44:12',1,120,1,NULL,NULL,'piring-digital-nomad',0,1,0,0);
INSERT INTO "discussions" VALUES (90,'RSS censor.net для Gemini (protocol) / I2P',1,1,'2025-10-19 23:10:59',1,121,'2025-10-19 23:10:59',1,121,1,NULL,NULL,'rss-censornet-dlia-gemini-protocol-i2p',0,1,0,0);
INSERT INTO "discussions" VALUES (91,'Ретрансляція eQtv українською мовою для локальних мереж',1,1,'2025-10-20 04:52:45',1,122,'2025-10-20 04:52:45',1,122,1,NULL,NULL,'retransliaciia-eqtv-ukrayinskoiu-movoiu-dlia-lokalnix-merez',0,1,0,0);
INSERT INTO "discussions" VALUES (92,'Проксування потоку m3u8 засобами ffmpeg в Icecast',1,1,'2025-10-20 06:03:01',1,124,'2025-10-20 06:03:01',1,124,1,NULL,NULL,'proksuvannia-potoku-m3u8-zasobami-ffmpeg-v-icecast',0,1,0,0);
INSERT INTO "discussions" VALUES (93,'Yourserver.se - лояльний VPS для стрімів, ігор, приватних мереж',1,1,'2025-10-20 12:12:11',1,125,'2025-10-20 12:12:11',1,125,1,NULL,NULL,'yourserverse-loialnii-vps-dlia-strimiv-igor-privatnix-merez',0,1,0,0);
INSERT INTO "discussions" VALUES (94,'Splinter Cell: Deathwatch [HDrezka Studio][1080p_Ultra][Ukr]',1,1,'2025-10-20 14:51:46',1,126,'2025-10-20 14:51:46',1,126,1,NULL,NULL,'splinter-cell-deathwatch-hdrezka-studio1080p-ultraukr',0,1,0,0);
INSERT INTO "discussions" VALUES (95,'Linux Essentials - Українською (Version 1.6) [PDF]',1,1,'2025-10-21 11:41:00',1,127,'2025-10-21 11:41:00',1,127,1,NULL,NULL,'linux-essentials-ukrayinskoiu-version-16-pdf',0,1,0,0);
INSERT INTO "discussions" VALUES (96,'Анонімний піринг BitTorrent з I2PSnark та i2pd',1,1,'2025-10-24 02:57:24',1,128,'2025-10-24 02:57:24',1,128,1,NULL,NULL,'anonimnii-piring-bittorrent-z-i2psnark-ta-i2pd',0,1,0,0);
INSERT INTO "discussions" VALUES (97,'Стек I2P на Rust',1,1,'2025-10-24 03:11:30',1,129,'2025-10-24 03:11:30',1,129,1,NULL,NULL,'stek-i2p-na-rust',0,1,0,0);
INSERT INTO "discussions" VALUES (98,'Реліз KevaCoin / Kvazar Edition v1.4.0 з експериментальною підтримкою меш',1,1,'2025-10-27 13:37:38',1,130,'2025-10-27 13:37:38',1,130,1,NULL,NULL,'reliz-kevacoin-kvazar-edition-v140-z-eksperimentalnoiu-pidtrimkoiu-mes',0,1,0,0);
INSERT INTO "discussions" VALUES (99,'Реліз Alfis DNS v0.8.7',1,1,'2025-10-28 02:29:22',1,131,'2025-10-28 02:29:22',1,131,1,NULL,NULL,'reliz-alfis-dns-v087',0,1,0,0);
INSERT INTO "discussions" VALUES (100,'Актуалізовані трекери Yggdrasil відтепер доступні в "Updated list of public BitTorrent trackers"',1,1,'2025-10-29 19:05:57',1,132,'2025-10-29 19:05:57',1,132,1,NULL,NULL,'aktualizovani-trekeri-yggdrasil-vidteper-dostupni-v-updated-list-of-public-bittorrent-trackers',0,1,0,0);
INSERT INTO "discussions" VALUES (101,'Реєстрація домену в мережі I2P',1,1,'2025-10-31 00:04:01',1,133,'2025-10-31 00:04:01',1,133,1,NULL,NULL,'rejestraciia-domenu-v-merezi-i2p',0,1,0,0);
INSERT INTO "discussions" VALUES (102,'Список VPN (OpenVPN) без смс і реєстрації',1,1,'2025-10-31 04:13:31',1,134,'2025-10-31 04:13:31',1,134,1,NULL,NULL,'spisok-vpn-openvpn-bez-sms-i-rejestraciyi',0,1,0,0);
INSERT INTO "posts" VALUES (1,1,1,'2025-08-24 09:44:25',1,'comment','<r><p>Вітаю перших відвідувачів з відкриттям української спільноти адміністраторів альтернативних мереж!<br/>
Yggdrasil, Mycelium, CJDNS та інші технології комунікації. Даний проєкт, на момент заснування 24 серпня 2025 року, є частиною спільноти <URL url="https://github.com/YGGverse"><s>[</s>YGGverse<e>](https://github.com/YGGverse)</e></URL>.</p>

<p>Згодом планується створити локалізовану вікі, можливо у форматі mdBook, але спочатку маємо довести до ладу ядро - форум на базі рушія <URL url="https://flarum.org"><s>[</s>Flarum<e>](https://flarum.org)</e></URL> v2 beta, який наразі в процесі налаштування та адаптації.</p>

<p>Створення нових акаунтів доступне за запрошенням користувачів форуму; для гостьового запиту, будь ласка, зверніться до відомого вам користувача для отримання додаткової інформації.</p></r>',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (2,2,1,'2025-08-24 10:27:27',1,'comment','<r><p>Чого мені дійсно не вистачало на інших ресурсах - можливість авторизації без прив''язки до Інтернет пошти. Але поки не знаю, наскільки це складно перелопатити Flarum під новий формат Yggmail і чи є в тому сенс, адже теоретично, поштову скриньку можна почепити на будь яку з підтримуваних форумом мереж.</p>

<p>Трохи поклікав, бачу що без мила цей форум не вміє нічого: скидати пароль наприклад, який генерується інвайтером. І його треба якось оновити + мати контроль над відновленням облікового запису.</p>

<p>Якщо хто забреде - то пишіть що думаєте, поки не зробив по-своєму.</p>

<p>UPD. після тестування Yggmail, в ньому було виявлено <URL url="https://github.com/neilalexander/yggmail/issues/41"><s>[</s>проблему<e>](https://github.com/neilalexander/yggmail/issues/41)</e></URL> при надсиланні пошти засобами <C><s>`</s>sendmail<e>`</e></C> / Symfony API, також рушій Flarum потребує додаткових розширень для фільтрації псевдонімів хосту цього месенджера. Тому через деякий час було організовано повноцінний поштовий сервер Postfix/Dovecot з опцією "сирих" адрес IP без DNS за стандартом <URL url="https://www.rfc-editor.org/rfc/rfc5321#section-4.1.3"><s>[</s>RFC 5321<e>](https://www.rfc-editor.org/rfc/rfc5321#section-4.1.3)</e></URL>. Подробиці читайте тут:</p>
<LIST><LI><s>* </s><URL url="/d/20-posibnik-z-koristuvannia-forumom"><s>[</s>Посібник з користування форумом<e>](/d/20-posibnik-z-koristuvannia-forumom)</e></URL></LI>
<LI><s>* </s><URL url="/d/19-nalastuvannia-postovoyi-skrinki-dlia-lokalnix-merez-bez-dns"><s>[</s>Налаштування поштової скриньки для локальних мереж без DNS<e>](/d/19-nalastuvannia-postovoyi-skrinki-dlia-lokalnix-merez-bez-dns)</e></URL></LI></LIST></r>','2025-08-30 09:49:43',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (3,3,1,'2025-08-24 11:16:50',1,'comment','<r><p>Від початку не планувалось, але оскільки ресурс планується зробити не просто черговим сайтом, а своєрідною інформаційною базою і суспільним надбанням, потрібно продумати систему реплікації даних.</p>

<p>Наразі рушій використовує SQLite, оскільки в такому форматі (і з поточною кількістю користувачів) простіше робити бекапи (хоч можна використовувати для цієї мети реплікацію чи просто дампи MySQL).</p>

<p>Власне кажучи, я думаю надати доступ до повної копії бази даних декільком першим адмінам, щоб ті могли відновити роботу ресурсу у разі форс-мажорної ситуації, яка зараз має високі шанси.</p>

<p>Таким чином, користуючись даним ресурсом, варто мати на увазі, що такі дані як:</p>
<LIST><LI><s>* </s>e-mail</LI>
<LI><s>* </s>хеші паролів профілю (стандарт хешування рушія Flarum ще не вияснив, але схоже що тут використовується актуальна альтернатива солі md5 - <URL url="https://www.php.net/manual/en/function.password-hash.php"><s>[</s>password-hash<e>](https://www.php.net/manual/en/function.password-hash.php)</e></URL>)</LI>
<LI><s>* </s>IP в БД та системних журналах включно з Nginx / access log (ресурс доступний виключно для mesh)</LI></LIST>

<p>можуть бути частково або повністю опубліковані в рамках певних обставин, тому користувач повинен вжити відповідних заходів з проксування, якщо його з''єднання чутливе до подібних випадків, шляхом використання наприклад додаткового вузла <URL url="https://github.com/yggdrasil-network/yggstack"><s>[</s>Yggstack<e>](https://github.com/yggdrasil-network/yggstack)</e></URL> та відповідної конфігурації <URL url="http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:network_connection_variants#pac"><s>[</s>PAC<e>](http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:network_connection_variants#pac)</e></URL>.</p>

<p>Приватні повідомлення, з цієї причини вимкнено, але можна буде увімкнути, якщо буде потрібно вести подібні переписки, наприклад по темам офтопік.</p>

<p>Я не бачу жодного сенсу робити якісь часткові бекапи таблиць. Просто орієнтуємось на той факт, що база даних є умовно публічною і її поширення залежатиме від волі адміністраторів та конкретної ситуації.</p></r>','2025-08-24 11:31:26',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (4,3,2,'2025-08-24 11:18:12',1,'discussionStickied','{"sticky":true}',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (5,4,1,'2025-08-24 11:53:00',1,'comment','<r><p>Сабж P/M. Давно знаю про такий месенджер як <URL url="https://getsession.org"><s>[</s>Session<e>](https://getsession.org)</e></URL>, колись навіть ним користувався.</p>

<p>Але останнім часом, уникаю різних "мутних" і тим паче відомих широкому загалу протоколів типу Tor вузлів I2P, щоб в поточних умовах не привертати до себе зайвої уваги без на те реальної потреби.</p>

<p>Утім, якось недавно просив мене один юзер вийти з ним на зв''язок, пояснюючи що там якась власна мережа, яка тільки емулює поведінку маршрутизації Onion, а сервери - інші.</p>

<p>Які думки, та який взагалі відсоток адекватних користувачів цього месенджера, чи актуальний він взагалі?</p></r>','2025-08-24 11:58:43',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (7,2,2,'2025-08-24 20:22:02',1,'discussionTagged','[[],[2,4]]',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (8,5,1,'2025-08-24 20:29:58',1,'comment','<r><p><URL url="https://github.com/neilalexander/yggmail"><s>[</s>Yggmail<e>](https://github.com/neilalexander/yggmail)</e></URL> - це дочірній проєкт від розробників <URL url="https://devzone.org.ua/post/yggdrasil-mereznii-protokol-z-decentralizovanim-routingom"><s>[</s>Yggdrasil<e>](https://devzone.org.ua/post/yggdrasil-mereznii-protokol-z-decentralizovanim-routingom)</e></URL>, написаний на Go та має відкритий код. Дозволяє в декілька простих кроків розгорнути сервер для підключення будь якого поштового клієнта, сумісного з протоколами IMAP / SMTP. Працює без залежності від центрального серверу та виділеної адреси IP.</p>

<p>Для транспорту даних використовує вбудований вузол Yggdrasil, не потребує його окремого встановлення а також може ізольовано працювати поряд з ним. Трафік, що передається - захищений і не потребує додаткового шифрування TLS.</p>

<p>З коробки, являє собою сервер, підключитись до якого можна через поштовий клієнт типу Thunderbird або <URL url="https://delta.chat/uk/"><s>[</s>DeltaChat<e>](https://delta.chat/uk/)</e></URL>. Утім, від класичних поштових серверів відрізняється протоколом транспорту, тому не є сумісним зі звичайними скриньками і працює у власній мережі. Yggmail варто сприймати саме як месенджер, оскільки він має тільки спільний поштовий інтерфейс IMAP / SMTP але іншу модель транспорту.</p>

<H2><s>## </s>Встановлення</H2>

<p>Yggmail знаходиться на стадії розробки, тому для встановлення будемо збирати з початкового коду на останній версії Go.<br/>
Про те, як встановити останню версію Go в Debian читайте <URL url="https://devzone.org.ua/post/vstanovlennia-ostannyoyi-versiyi-go-v-debian"><s>[</s>тут<e>](https://devzone.org.ua/post/vstanovlennia-ostannyoyi-versiyi-go-v-debian)</e></URL>.</p>

<p>Збірка Yggmail виконується наступною командою в теці і користувачем, від якого планується робота з поштою:</p>
<CODE><s>```</s><i>
</i>cd ~
go install github.com/neilalexander/yggmail/cmd/yggmail@latest<i>
</i><e>```</e></CODE>

<p>Так як я користуюсь <C><s>`</s>systemd<e>`</e></C>, встановлюю бінарний файл до системної локації:</p>
<CODE lang="bash"><s>``` bash</s><i>
</i>install go/bin/yggmail /usr/local/bin/yggmail<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>після цього, теоретично, теку <C><s>`</s>~/go<e>`</e></C> можна видалити</LI></LIST>

<p>Наступним кроком, ініціюємо новий профіль:</p>
<CODE><s>```</s><i>
</i>yggmail -password<i>
</i><e>```</e></CODE>

<p>Записуємо згенеровану адресу в полі <C><s>`</s>Mail address<e>`</e></C>, на неї будуть отримуватись листи і вона вказується при підключенні поштового клієнта.</p>

<p>Профіль користувача буде збережено до файлу <C><s>`</s>~/yggmail.db<e>`</e></C> - його можна використовувати для резервного копіювання пошти.<br/>
Щоб вказати альтернативний шлях, вказується атрибут <C><s>`</s>-database=/path/to/yggmail.db<e>`</e></C>.</p>

<p>Довідка доступна командою:</p>
<CODE><s>```</s><i>
</i>yggmail -help<i>
</i><e>```</e></CODE>

<H2><s>## </s>Запуск</H2>

<p>Запуск відбувається однойменною командою, утім декілька слів про режими підключень:</p>

<LIST><LI><s>* </s>Мультикаст</LI>
<LI><s>* </s>Підключення через певний <URL url="https://publicpeers.neilalexander.dev"><s>[</s>публічний пір<e>](https://publicpeers.neilalexander.dev)</e></URL></LI>
<LI><s>* </s>Обидва варіанти</LI></LIST>

<p>Відповідно:</p>

<CODE><s>```</s><i>
</i>yggmail -multicast
yggmail -peer=tls://...
yggmail -multicast -peer=tls://...<i>
</i><e>```</e></CODE>

<H2><s>## </s>Автозапуск</H2>

<p>Yggmail отримує пошту тільки тоді, коли він працює та підключений до мережі. Якщо вузол отримувача не досяжний, лист переміщується в до черги очікування і буде надіслано як тільки зв''язок між вузлами відновиться.</p>

<p>Тому зручно створити системний сервіс з автозапуском:</p>

<CODE><s>```</s><i>
</i>#/etc/systemd/system/yggmail.service
[Unit]
After=network.target
Wants=network.target

[Service]
User=yggmail
Group=yggmail
Type=simple
WorkingDirectory=/home/yggmail
ExecStart=/usr/local/bin/yggmail -peer=tls://...
StandardOutput=file:///home/yggmail/debug.log
StandardError=file:///home/yggmail/error.log

[Install]
WantedBy=multi-user.target<i>
</i><e>```</e></CODE>

<p>Активуємо сервіс:</p>
<CODE><s>```</s><i>
</i>systemctl daemon-reload
systemctl enable yggmail
systemctl start yggmail<i>
</i><e>```</e></CODE>

<p>Перевіряємо:</p>
<CODE><s>```</s><i>
</i>netstat -tulpn | grep LISTEN<i>
</i><e>```</e></CODE>

<H2><s>## </s>Підключення поштового клієнта</H2>

<p>Yggmail прослуховує порти:</p>

<LIST><LI><s>* </s><C><s>`</s>1025<e>`</e></C> - SMTP / TCP</LI>
<LI><s>* </s><C><s>`</s>1143<e>`</e></C> - IMAP / TCP</LI></LIST>

<p>В залежності від поштового клієнта, при створенні нового підключення скриньки, вказуються наступні дані:</p>

<LIST><LI><s>* </s>Логін - адреса, наприклад <C><s>`</s>123abc@yggmail<e>`</e></C></LI>
<LI><s>* </s>Пароль - пароль, вказаний при виконанні команди <C><s>`</s>yggmail -password<e>`</e></C></LI>
<LI><s>* </s>SMTP сервер - <C><s>`</s>localhost<e>`</e></C></LI>
<LI><s>* </s>SMTP порт - <C><s>`</s>1025<e>`</e></C></LI>
<LI><s>* </s>IMAP сервер - <C><s>`</s>localhost<e>`</e></C></LI>
<LI><s>* </s>IMAP порт - <C><s>`</s>1143<e>`</e></C></LI></LIST>

<p>Якщо сервер працює на віддаленому VPS, на ньому потрібно відкрити відповідні порти, а <C><s>`</s>localhost<e>`</e></C> замінити на його IP.</p>

<p>Єдиною рекомендацією можна додати, що не варто відправляти пошту самому собі для тестування, наразі це не працює.<br/>
Щоб перевірити роботу Yggmail - відправляйте пошту з іншого вузла або залиште вашу адресу в коментарях - можливо хтось вам відповість!</p>

<H2><s>## </s>Посилання</H2>

<LIST><LI><s>* </s><URL url="https://github.com/neilalexander/yggmail"><s>[</s>Проєкт на GitHub<e>](https://github.com/neilalexander/yggmail)</e></URL></LI>
<LI><s>* </s><URL url="https://matrix.to/#/#yggmail:matrix.org"><s>[</s>Канал в Matrix<e>](https://matrix.to/#/#yggmail:matrix.org)</e></URL></LI></LIST>

<p>Оригінал даної статті також написано для Веб-проєкту DevZone:<br/>
<URL url="https://devzone.org.ua/post/yggmail-mesendzer-z-poshtovym-interfeysom">https://devzone.org.ua/post/yggmail-mesendzer-z-poshtovym-interfeysom</URL></p></r>','2025-08-25 01:34:48',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (9,5,2,'2025-08-24 20:30:43',1,'discussionTagged','[[2,4],[2,5]]',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (10,1,2,'2025-08-24 20:37:19',1,'discussionTagged','[[],[4]]',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (11,3,3,'2025-08-24 20:37:27',1,'discussionTagged','[[],[4]]',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (12,6,1,'2025-08-24 20:50:52',1,'comment','<r><p><URL url="https://yggdrasil-network.github.io"><s>[</s>Yggdrasil<e>](https://yggdrasil-network.github.io)</e></URL> - експериментальний протокол для побудови само-організованої локальної мережі з шифруванням трафіку та підтримкою оверлейного підключення через Інтернет.</p>

<p>В своїй основі використовує приватний ключ для генерації постійних псевдо-адрес IPv6 в діапазоні <C><s>`</s>0200::/7<e>`</e></C></p>

<p>Має різні сфери застосування, зокрема: автоматизована побудова локальних мереж, маскування IP (як транспорт I2P), обхід блокувань та обмежень віртуальної адресації NAT (наприклад, для організації відео-спостереження без наявності виділеної адреси, розгортання домашнього веб-серверу, віддаленого керування інфраструктурою підприємства тощо). Завдяки простоті встановлення та здатності до саморозгортання підключень, здобув широку популярність зокрема серед користувачів CJDNS.</p>

<H2><s>## </s>Встановлення</H2>

<p>Yggdrasil написаний на Go, початковий код доступний в репозиторії на <URL url="https://github.com/yggdrasil-network/yggdrasil-go"><s>[</s>GitHub<e>](https://github.com/yggdrasil-network/yggdrasil-go)</e></URL>.</p>

<p>Бінарні збірки можуть бути встановлені зі штатного репозиторію командою:</p>
<CODE><s>```</s><i>
</i>apt install yggdrasil<i>
</i><e>```</e></CODE>

<p>або використовуючи останню збірку з релізу:</p>
<CODE><s>```</s><i>
</i>wget https://github.com/yggdrasil-network/yggdrasil-go/releases/download/v0.5.5/yggdrasil-0.5.5-amd64.deb
dpkg -i yggdrasil-0.5.5-amd64.deb<i>
</i><e>```</e></CODE>

<H2><s>## </s>Налаштування</H2>

<p>У разі підключення до мережі Yggdrasil через Інтернет, необхідно додати до файлу конфігурації щонайменше один географічно близький <URL url="https://publicpeers.neilalexander.dev/"><s>[</s>публічний вузол<e>](https://publicpeers.neilalexander.dev/)</e></URL>:</p>

<CODE><s>```</s><i>
</i># /etc/yggdrasil/yggdrasil.conf
  Peers: [
    tls://xx.xx.xx.xx:xxxx
  ]<i>
</i><e>```</e></CODE>

<p>Також, зручно вказати назву для інтерфейсу Yggdrasil - щоб потім не плутати його наприклад з VPN:</p>
<CODE><s>```</s><i>
</i>IfName: ygg0<i>
</i><e>```</e></CODE>

<p>Після цього можна перезапустити сервіс, щоб застосувати зміни:</p>
<CODE><s>```</s><i>
</i>systemctl restart yggdrasil<i>
</i><e>```</e></CODE>

<p>Якщо все зроблено правильно, можна спробувати відкрити будь яку з адрес в <URL url="https://yggdrasil-network.github.io/services.html"><s>[</s>каталозі сервісів<e>](https://yggdrasil-network.github.io/services.html)</e></URL>.</p>

<H2><s>## </s>Додатково</H2>

<p>Перевірити наявність нового інтерфейсу можна командою:</p>
<CODE><s>```</s><i>
</i>ifconfig<i>
</i><e>```</e></CODE>

<p>Отримати власну адресу:</p>
<CODE><s>```</s><i>
</i>yggdrasilctl getself<i>
</i><e>```</e></CODE>

<p>Можна легко створювати маски підмереж для окремих сервісів - стріми, вебсайти, пошта, та інше:</p>
<CODE><s>```</s><i>
</i>ifconfig lo inet6 add 3xx:xxxx:xxxx:xxxx::xx<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>де <C><s>`</s>3xx:xxxx:xxxx:xxxx<e>`</e></C> - адреса з <C><s>`</s>yggdrasilctl getself<e>`</e></C></LI></LIST>

<p>Якщо підключення відбувається через власний публічний вузол, на ньому відкривається довільний порт.<br/>
У разі необхідності обмеження доступу для невідомих динамічних адрес, починаючи з версії 0.5.0 можна вказувати пароль:</p>

<LIST><LI><s>* </s><C><s>`</s>tls://[::]:12345?password=123456abcdef<e>`</e></C> - сервер</LI>
<LI><s>* </s><C><s>`</s>tls://a.b.c.d:12345?password=123456abcdef<e>`</e></C> - клієнт</LI></LIST>

<p>Початківцям важливо встановити мережний екран, наприклад <C><s>`</s>ufw<e>`</e></C> для <C><s>`</s>iptables<e>`</e></C>, інакше такі служби як принтери або локальні веб-сервери для розробки (що стандартно прослуховують <C><s>`</s>0.0.0.0<e>`</e></C>) можуть стати доступними для інших учасників локальної мережі. З цієї точки зору, буде зручним організація окремого роутеру наприклад на базі OpenWRT.</p>

<p>Важливо розуміти, що Yggdrasil не має на меті захист від ідентифікації користувача в мережі, порівнюючи з анонімайзерами Tor чи I2P. Іноді, може використовуватись як додатковий канал, але походження його пакетів може бути встановлено, якщо не використовуються такі засоби маскування трафіку як Shadowsocks та інші.</p>

<p>Yggdrasil - перш за все альтернативний маршрутизатор, який дозволяє автоматично створювати перманентні IPv6 адреси в середовищі IPv4 та є корисним інструментом для швидкого розгортання інфраструктури локальних дротових, лазерних та радіо мереж.</p>

<H3><s>### </s>Посилання</H3>

<LIST><LI><s>* </s><URL url="https://yggdrasil-network.github.io">https://yggdrasil-network.github.io</URL> - офіційна сторінка</LI>
<LI><s>* </s><URL url="https://github.com/yggdrasil-network">https://github.com/yggdrasil-network</URL> - проект на GitHub</LI>
<LI><s>* </s><URL url="https://yggdrasil-map.cwinfo.net">https://yggdrasil-map.cwinfo.net</URL> - орієнтовна мапа вузлів</LI></LIST>

<p>Оригінал даної статті написано для Веб-проєкту DevZone:<br/>
<URL url="https://devzone.org.ua/post/yggdrasil-mereza-z-detsentralizovanym-routynhom">https://devzone.org.ua/post/yggdrasil-mereza-z-detsentralizovanym-routynhom</URL></p></r>',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (13,7,1,'2025-08-24 20:55:27',1,'comment','<r><p><URL url="https://github.com/Revertron/Alfis"><s>[</s>Alfis DNS<e>](https://github.com/Revertron/Alfis)</e></URL> - децентралізована система доменних імен з реєстром в блокчейн.</p>

<p>Резольвер та клієнтська частина написані на мові Rust. Системою використовуються зони <C><s>`</s>.anon<e>`</e></C>, <C><s>`</s>.btn<e>`</e></C>, <C><s>`</s>.conf<e>`</e></C>, <C><s>`</s>.index<e>`</e></C>, <C><s>`</s>.merch<e>`</e></C>, <C><s>`</s>.mirror<e>`</e></C>, <C><s>`</s>.mob<e>`</e></C>, <C><s>`</s>.screen<e>`</e></C>, <C><s>`</s>.srv<e>`</e></C>, <C><s>`</s>.ygg<e>`</e></C>, де <C><s>`</s>.anon<e>`</e></C> та <C><s>`</s>.ygg<e>`</e></C> - зарезервовані для адрес мережі Yggdrasil, що виключає випадковий перехід з таких адрес на хости клірнет.</p>

<p>Для запобігання кіберсквотингу використовується модель PoW і частково - PoS, генерація нових доменів також обмежена добовим інтервалом, а на один персональний ключ можна згенерувати не більше 10 доменів (що насправді має досить спірне підгрунтя).</p>

<p>Тим не менше, система досить зручна для локальних мереж, оскільки дозволяє створити безкоштовний домен на один рік без необхідності реєстрації персональних даних та залежності від центрального серверу. А розмір блокчейну при поточній кількості близько 1000 доменів складає приблизно 7 Мб.</p>

<p>В середньому, на комп''ютері з процесором i5, новий домен генерується від декількох до 12 годин; утім спочатку потрібно згенерувати персональний ключ, до якого потім цей домен буде прив''язаний. До закінчення року, потрібно змайнити домен повторно, використовуючи існуючий ключ, раніше робити це не має сенсу, бо пролонгація рахується від часу створення блоку.</p>

<H2><s>## </s>Встановлення</H2>

<p>Встановлення відбувається досить просто, є готові бінарні пакети та репозиторії. При збірці, з початкового коду, доведеться встановити останню версію <C><s>`</s>rustc<e>`</e></C> що зручно використовуючи пакет <C><s>`</s>rustup<e>`</e></C>.</p>

<p>В іншому, виконується стандартна процедура <C><s>`</s>cargo<e>`</e></C>:</p>

<CODE><s>```</s><i>
</i>git clone https://github.com/Revertron/Alfis.git
cd Alfis
cargo build --release<i>
</i><e>```</e></CODE>

<H2><s>## </s>Налаштування</H2>

<p>Запускаючи клієнт з графічною оболонкою, буде автоматично налаштовано резольвер. Для систем типу Ubuntu, ймовірно доведеться вивільнити зайнятий порт <C><s>`</s>53<e>`</e></C>.</p>

<p>Утім, графічний інтерфейс зручно використовувати виключно для адміністрування доменів та майнінгу, а сам резольвер розмістити десь на VPS та вказати до нього конфігурацію:</p>

<H3><s>### </s>В системах з systemd-resolved</H3>

<CODE><s>```</s><i>
</i>#/etc/systemd/resolved.conf
[Resolve]
DNS=IP
Domains=~.<i>
</i><e>```</e></CODE>

<p>після змін оновити кеш командою:<br/>
<C><s>`</s>systemctl restart systemd-resolved<e>`</e></C></p>

<H3><s>### </s>В системах без systemd</H3>

<CODE><s>```</s><i>
</i>#/etc/resolv.conf
nameserver xx.xx.xx.xx<i>
</i><e>```</e></CODE>

<H3><s>### </s>FireFox</H3>

<p>Браузер нічого не знає про діапазон імен Alfis DNS, тому при введені таких адрес, буде відправляти користувача в пошук.<br/>
Щоб виправити це, потрібно додати в <C><s>`</s>about:config<e>`</e></C>, наприклад для зони <C><s>`</s>ygg<e>`</e></C> - наступну опцію:</p>
<CODE><s>```</s><i>
</i>browser.fixup.domainsuffixwhitelist.ygg = true <i>
</i><e>```</e></CODE>

<H3><s>### </s>Особистий досвід</H3>

<LIST><LI><s>* </s>Alfis DNS хоч і працює з типовими адресами, але вимагає наявності встановленого або підключеного вузла для клієнтів. З цієї ж причини виникає і проблема сертифікації, наприклад засобами Certbot / Let''s Encrypt.</LI>
<LI><s>* </s>В намірах зменшити розмір блокчейну, автор явно перегнув із захистом від зловживань сквотерами, від чого іноді доводиться чекати випадкові вузли, що підпишуть блок. А сама модель захисту явно грає на руку тим, хто в сквотингу зацікавлені (володіючи відповідним обчислювальним ресурсом). Під час останнього такого "зависання" частина користувачів була обурена бездіяльністю автора у відповідь на повторний інцидент і вірогідно відмовилась від цього і до того непопулярного рішення.</LI>
<LI><s>* </s>Внутрішньої монети блокчейн немає, утім потенційно може мати деякий економічний потенціал з використанням бартеру (засобами трансферу)</LI>
<LI><s>* </s>Наразі проєкт варто сприймати виключно як експериментальну альтернативу централізованим сервісам для ентузіастів, який фактично виконує ту само роль, що й <C><s>`</s>/etc/hosts<e>`</e></C></LI></LIST>

<H3><s>### </s>Посилання</H3>

<LIST><LI><s>* </s><URL url="https://github.com/Revertron/Alfis"><s>[</s>Репозиторій проєкту на GitHub<e>](https://github.com/Revertron/Alfis)</e></URL></LI>
<LI><s>* </s><URL url="https://viewer.alfis.name"><s>[</s>Веб-експлорер<e>](https://viewer.alfis.name)</e></URL></LI>
<LI><s>* </s><URL url="/d/37-alternativna-gilka-alfis-dns-z-pidtrimkoiu-mycelium"><s>[</s>Альтернативна гілка Alfis DNS з підтримкою Mycelium<e>](/d/37-alternativna-gilka-alfis-dns-z-pidtrimkoiu-mycelium)</e></URL></LI></LIST>

<p>Оригінал даної статті написано для Веб-проєкту DevZone:<br/>
<URL url="https://devzone.org.ua/post/alfis-dns-reyestratsiia-domenu-v-blokcheyn">https://devzone.org.ua/post/alfis-dns-reyestratsiia-domenu-v-blokcheyn</URL></p></r>','2025-08-31 16:39:38',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (14,8,1,'2025-08-24 20:57:43',1,'comment','<r><p>Невдовзі, після своїх <URL url="https://devzone.org.ua/post/hrabli-p2p"><s>[</s>роздумів про p2p<e>](https://devzone.org.ua/post/hrabli-p2p)</e></URL>, вирішив спробувати підняти власний експериментальний інстанс <URL url="https://uk.wikipedia.org/wiki/%D0%A4%D0%B5%D0%B4%D0%B8%D0%B2%D0%B5%D1%80%D1%81"><s>[</s>Fediverse<e>](https://uk.wikipedia.org/wiki/Федиверс)</e></URL>. При чому, зробити це засобами оверлейної мережі <URL url="https://devzone.org.ua/post/yggdrasil-mereza-z-detsentralizovanym-routynhom"><s>[</s>Yggdrasil<e>](https://devzone.org.ua/post/yggdrasil-mereza-z-detsentralizovanym-routynhom)</e></URL>, оскільки я не планую купувати для цієї іграшки виділений IP чи VPS, натомість буду хоститись з модему, одноплатника або взагалі з ПК, коли буваю онлайн, з динамічною адресою за NAT.</p>

<p>Пишу цю нотатку в першу чергу - для себе, а також, вона може бути корисною для тих, хто як і я тільки починає свої експерименти у сфері адміністрування власного вузла Fediverse і цікавиться альтернативними мережами, в контексті Linux.</p>

<H2><s>## </s>Що таке Snac</H2>

<p><URL url="https://codeberg.org/grunfink/snac2"><s>[</s>Snac<e>](https://codeberg.org/grunfink/snac2)</e></URL> - це мінімалістична, JS-less, написана мовою C альтернатива серверу <URL url="https://joinmastodon.org/uk"><s>[</s>Mastodon<e>](https://joinmastodon.org/uk)</e></URL>, яка також не потребує інсталяції PostgreSQL, натомість зберігає усі дані профілю у файлах JSON. Нещодавно, до цього серверу було <URL url="https://codeberg.org/grunfink/snac2/pulls/256"><s>[</s>додано підтримку IPv6<e>](https://codeberg.org/grunfink/snac2/pulls/256)</e></URL>, а отже - він буде працювати й з діапазоном Yggdrasil <C><s>`</s>0200::/7<e>`</e></C></p>

<p>Оскільки Yggdrasil дозволяє безкоштовно генерувати не обмежену кількість статичних IP (на базі приватного ключа <URL url="https://en.wikipedia.org/wiki/EdDSA#Ed25519"><s>[</s>Ed25519<e>](https://en.wikipedia.org/wiki/EdDSA#Ed25519)</e></URL>), тут немає звичної потреби в DNS. Хоча, можна опціонально прикрутити <URL url="https://devzone.org.ua/post/alfis-dns-reyestratsiia-domenu-v-blokcheyn"><s>[</s>Alfis<e>](https://devzone.org.ua/post/alfis-dns-reyestratsiia-domenu-v-blokcheyn)</e></URL>, але особисто я цим ділом не користуюсь (зокрема, й через досі не вирішену проблему <URL url="https://github.com/Revertron/Alfis/issues/364"><s>[</s>#364<e>](https://github.com/Revertron/Alfis/issues/364)</e></URL>) тому також не хочу нав''язувати його в рамках протоколу ActivityPub - буде просто формат <C><s>`</s>username@IPv6<e>`</e></C>, який мені не потрібно а ні оновлювати, а ні майнити потім.</p>

<H2><s>## </s>Встановлення</H2>

<LIST type="decimal"><LI><s>1. </s><p>Точний перелік пакетів для Debian я не знаю, оскільки моя система не нова і вже має встановлені раніше пакунки. Як вказано в <URL url="https://codeberg.org/grunfink/snac2#building-and-installation"><s>[</s>README<e>](https://codeberg.org/grunfink/snac2#building-and-installation)</e></URL>, я тільки встановив <C><s>`</s>libssl-dev<e>`</e></C> і <C><s>`</s>libcurl4-openssl-dev<e>`</e></C> (для Fedora має бути приблизно те само з постфіксом <C><s>`</s>*-devel<e>`</e></C>)</p></LI>

<LI><s>2. </s><p>Далі, створюємо окремого системного юзера, щоб ізолюватись від потенційних вразливостей:</p></LI></LIST>

<CODE lang="bash"><s>``` bash</s><i>
</i>useradd -m snac<i>
</i><e>```</e></CODE>

<LIST start="3" type="decimal"><LI><s>3. </s>Змінюємо для зручності середовище на <C><s>`</s>bash<e>`</e></C> у файлі <C><s>`</s>/etc/passwd<e>`</e></C></LI>
<LI><s>4. </s>Логінимось через <C><s>`</s>su snac<e>`</e></C> і переходимо в домашню директорію цього юзера: <C><s>`</s>cd<e>`</e></C></LI>
<LI><s>5. </s>Завантажуємо останній вихідний код: <C><s>`</s>git clone https://codeberg.org/grunfink/snac2.git<e>`</e></C></LI>
<LI><s>6. </s>Заходимо в робочу директорію <C><s>`</s>cd snac2<e>`</e></C></LI>
<LI><s>7. </s>Компілюємо <C><s>`</s>make &amp;&amp; sudo make install<e>`</e></C> і встановлюємо з відповідними правами</LI>
<LI><s>8. </s>Ініціалізуємо серверне сховище: <C><s>`</s>snac init /home/snac/storage<e>`</e></C></LI>
<LI><s>9. </s>І додамо до нього нашого першого юзера <C><s>`</s>snac adduser /home/snac/storage<e>`</e></C></LI>
<LI><s>10. </s>Далі продовжуємо від <C><s>`</s>root<e>`</e></C> виконавши команду <C><s>`</s>exit<e>`</e></C></LI></LIST>

<H2><s>## </s>Налаштування</H2>

<p>Я вже маю встановлений і налаштований вузол Yggdrasil, якщо комусь цікавий процес встановлення, скористайтесь <URL url="https://devzone.org.ua/post/yggdrasil-mereza-z-detsentralizovanym-routynhom"><s>[</s>попередньою публікацією<e>](https://devzone.org.ua/post/yggdrasil-mereza-z-detsentralizovanym-routynhom)</e></URL> або <URL url="https://yggdrasil-network.github.io/documentation.html"><s>[</s>офіційною документацією<e>](https://yggdrasil-network.github.io/documentation.html)</e></URL>.</p>

<H3><s>### </s>Адреса підмережі Yggdrasil</H3>

<p>Можна пропустити цей крок і використовувати основну адресу <C><s>`</s>2*<e>`</e></C>, якщо порти <C><s>`</s>80<e>`</e></C> чи <C><s>`</s>8001<e>`</e></C> не зайняті. Але зауважте, що в рамках API протоколу ActivityPub, сервер Snac надаватиме вашу адресу хосту іншим нодам, а ті - її кешуватимуть, як частину ID і оскільки локально адреса хосту зберігається по файлам, а не в БД, потім буде важко її замінити. Тому краще виділити окрему, особливо - якщо це продакшн:</p>

<LIST type="decimal"><LI><s>1. </s><C><s>`</s>yggdrasilctl getself<e>`</e></C> - дізнаємось свій айпішник, зокрема вивід <C><s>`</s>IPv6 subnet<e>`</e></C></LI>
<LI><s>2. </s><C><s>`</s>ifconfig lo inet6 add IP<e>`</e></C> - замість IP вказуємо довільну адресу для отриманого діапазону, наприклад <C><s>`</s>3xx:xxxx:xxxx:xxxx::fed/64<e>`</e></C> , де <C><s>`</s>fed<e>`</e></C> - така собі гра слів в рамках "словника" IPv6 (0-9A-F).
    <LIST><LI><s>* </s>варто зауважити, що дані маршрутизації <C><s>`</s>ifconfig<e>`</e></C> не зберігаються після ребуту системи, для цього потрібно додати відповідний запис (команду з пункту 2), наприклад до <C><s>`</s>/etc/netplan/01-ygglo.yaml<e>`</e></C>, <C><s>`</s>/etc/network/interfaces<e>`</e></C>, або безпосередньо до systemd <C><s>`</s>yggdrasil.service<e>`</e></C> (секція <C><s>`</s>ExecStartPost=<e>`</e></C>) - залежно від операційної системи.</LI></LIST></LI></LIST>

<H3><s>### </s>Проксі Nginx</H3>

<p>На моєму сервері вже встановлено веб-сервер <URL url="https://nginx.org/"><s>[</s>Nginx<e>](https://nginx.org/)</e></URL>, який займає порт <C><s>`</s>80<e>`</e></C>, я поки не хочу нічого змінювати, а також не хочу мати публічні адреси Snac з його стандартним портом <C><s>`</s>8001<e>`</e></C>. Тому, оскільки вже маю виділену адресу підмережі, просто запроксую API на <C><s>`</s>80<e>`</e></C> порт через новий віртуальний хост, частково використавши <URL url="https://codeberg.org/grunfink/snac2/src/branch/master/examples/nginx-alpine-ssl/default.conf"><s>[</s>оригінальний приклад конфігурації<e>](https://codeberg.org/grunfink/snac2/src/branch/master/examples/nginx-alpine-ssl/default.conf)</e></URL>:</p>

<CODE><s>``` /etc/nginx/sites-available/default</s><i>
</i># /etc/nginx/sites-available/default
server {
    listen [3xx:xxxx:xxxx:xxxx::fed]:80;
    server_name 3xx:xxxx:xxxx:xxxx::fed;

    location @proxy {
        proxy_http_version      1.1;
        proxy_set_header        Upgrade $http_upgrade;
        proxy_set_header        Connection "upgrade";
        proxy_redirect          off;
        proxy_connect_timeout   90;
        proxy_send_timeout      90;
        proxy_read_timeout      90;
        proxy_set_header        Host $host;
        proxy_set_header        X-Real-IP $remote_addr;
        proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header        X-Forwarded-Proto $scheme;
        proxy_set_header        Proxy "";
        proxy_pass_header       Server;
        proxy_buffering on;
        tcp_nodelay on;
        proxy_pass http://[3xx:xxxx:xxxx:xxxx::fed]:8001;
        proxy_set_header Host $http_host;
    }

    location /.well-known/webfinger {
        try_files $uri @proxy;
    }

    location /.well-known/nodeinfo {
        try_files $uri @proxy;
    }

    location / {
        try_files $uri @proxy;
    }

    location /fedi/ {
        try_files $uri @proxy;
    }
}<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>systemctl reload nginx<e>`</e></C> - застосовуємо зміни</LI>
<LI><s>* </s>можливо, захочете створити окремий конфігураційний файл для Nginx, замість <C><s>`</s>default<e>`</e></C> - в мене він один на всі хости.</LI>
<LI><s>* </s>опціонально, засобами Nginx, можна закрити окремі локації по IP</LI></LIST>

<p>Як бачите, на прикладі вище не вказано порт <C><s>`</s>443<e>`</e></C>, а також немає сертифікатів SSL. Це зроблено спеціально, оскільки Yggdrasil вже має захищений канал, і я не хочу створювати тут зайвий шар.</p>

<p>Оскільки клієнтські підключення Yggdasil також мають статичну адресу, я вирішив обмежити доступ до адміністративного API (адмінка усіх акаунтів + <C><s>`</s>oauth<e>`</e></C>) по IP. Наскільки це ефективно і чи не забув про інші адреси - я не знаю, але додам свій приклад регулярного виразу для <C><s>`</s>location<e>`</e></C>:</p>

<CODE lang="default"><s>``` default</s><i>
</i>location ~ /([^\/]+/admin|oauth) {
    allow ADMIN_IP;
    deny all;
    try_files $uri @proxy;
}<i>
</i><e>```</e></CODE>

<H3><s>### </s>Конфігурація Snac</H3>

<p>Відредагуємо раніше згенерований командою <C><s>`</s>snac init<e>`</e></C> файл <C><s>`</s>/home/snac/storage/server.json<e>`</e></C>:</p>

<CODE><s>``` server.json</s><i>
</i>{
    "host": "[3xx:xxxx:xxxx:xxxx::fed]",
    "prefix": "",
    "address": "3xx:xxxx:xxxx:xxxx::fed",
    "port": 8001,
    "layout": 2.7,
    "dbglevel": 0,
    "queue_retry_minutes": 2,
    "queue_retry_max": 10,
    "queue_timeout": 6,
    "queue_timeout_2": 8,
    "cssurls": [
        ""
    ],
    "def_timeline_entries": 50,
    "max_timeline_entries": 50,
    "timeline_purge_days": 120,
    "local_purge_days": 0,
    "min_account_age": 0,
    "admin_email": "",
    "admin_account": "",
    "title": "",
    "short_description": "",
    "short_description_raw": false,
    "protocol": "http",
    "fastcgi": false
}<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>звертаю увагу, що протокол у моєму прикладі змінено на <C><s>`</s>http<e>`</e></C></LI></LIST>

<H3><s>### </s>Доступи iptables</H3>

<p>Конфігурація у прикладах не передбачає доступу до ноди з мережі Інтернет, тому я відкрив порт тільки для Yggdrasil, щоб інші вузли в рамках цієї мережі могли взаємодіяти між собою на івентах типу фоловінгу (обидва вузли мають бути онлайн для транзакції):</p>

<CODE><s>```</s><i>
</i>ufw allow from 0200::/7 to any port 80<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>якщо не користуєтесь Nginx, або сервер має стандартний чи інший порт, просто замість <C><s>`</s>80<e>`</e></C> вкажіть актуальний, наприклад <C><s>`</s>8001<e>`</e></C></LI>
<LI><s>* </s>якщо обмежуєте трафік по діапазону <C><s>`</s>0200::/7<e>`</e></C>, також зверніть увагу на зауваження щодо приватного режиму, про який описано нижче</LI></LIST>

<H3><s>### </s>Налаштування systemd</H3>

<p>Є готовий <URL url="https://codeberg.org/grunfink/snac2/src/branch/master/examples/snac.service"><s>[</s>офіційний приклад конфігурації<e>](https://codeberg.org/grunfink/snac2/src/branch/master/examples/snac.service)</e></URL>, але я його трохи доповнив:</p>

<CODE><s>``` /etc/systemd/system/snac.service</s><i>
</i># /etc/systemd/system/snac.service
[Unit]
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=snac
Group=snac
ExecStart=/usr/local/bin/snac httpd /home/snac/storage
StandardOutput=file:/home/snac/debug.log
StandardError=file:/home/snac/error.log

[Install]
WantedBy=multi-user.target<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>systemctl daemon-reload<e>`</e></C> - оновлюємо конфігурацію <C><s>`</s>systemd<e>`</e></C></LI>
<LI><s>* </s><C><s>`</s>systemctl enable snac<e>`</e></C> - автостарт при запуску системи</LI>
<LI><s>* </s><C><s>`</s>systemctl start snac<e>`</e></C> - запуск</LI>
<LI><s>* </s><C><s>`</s>systemctl status snac<e>`</e></C> - перевіряємо статус</LI></LIST>

<H3><s>### </s>Резервне копіювання</H3>

<p>Оскільки база даних Snac зберігається у файловому форматі, досить просто бекапити профіль по лише одній локації.</p>

<p>Я роблю це засобами <C><s>`</s>rsync<e>`</e></C> для різних часових інтервалів наступною командою <C><s>`</s>crontab -e<e>`</e></C>:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>@daily /usr/bin/rsync -av --delete /home/snac/storage /path/to/snac/daily
@weekly /usr/bin/rsync -av --delete /home/snac/storage /path/to/snac/weekly
@monthly /usr/bin/rsync -av --delete /home/snac/storage /path/to/snac/monthly<i>
</i><e>```</e></CODE>

<H2><s>## </s>Користування</H2>

<p>Після запуску Snac командою <C><s>`</s>snac httpd /home/snac/storage<e>`</e></C> або через сервіс  <C><s>`</s>systemd<e>`</e></C>, можна спробувати відкрити у браузері <C><s>`</s>http://[3xx:xxxx:xxxx:xxxx::fed]<e>`</e></C>.</p>

<H3><s>### </s>Тестування взаємодії (API)</H3>

<p>Щоб перевірити взаємодію з іншим вузлом Yggdrasil, повторюємо для нього ті само дії і робимо тестовий фоловінг чи переписку між користувачами через Web UI або підключений зовнішній клієнтський застосунок.</p>

<H3><s>### </s>Тюнінг браузеру</H3>

<p>Якщо вперше користуєтесь сайтами Yggdrasil у Firefox, можливо знадобиться оптимізувати обробку "сирих" IPv6 адрес в <C><s>`</s>about:config<e>`</e></C>:</p>
<LIST><LI><s>* </s><C><s>`</s>browser.fixup.fallback-to-https<e>`</e></C>:<C><s>`</s>false<e>`</e></C> - вимкнути редірект <C><s>`</s>http<e>`</e></C> -&gt; <C><s>`</s>https<e>`</e></C></LI>
<LI><s>* </s><C><s>`</s>browser.fixup.alternate.enabled<e>`</e></C>:<C><s>`</s>false<e>`</e></C> - викнути автоматичну обробку префіксу <C><s>`</s>www<e>`</e></C></LI></LIST>

<H3><s>### </s>Теми Web UI</H3>

<p>В <URL url="https://codeberg.org/grunfink/snac2#incredibly-awesome-css-themes-for-snac"><s>[</s>README<e>](https://codeberg.org/grunfink/snac2#incredibly-awesome-css-themes-for-snac)</e></URL> є перелік посилань на CSS теми, за допомогою яких можна кастомізувати веб-інтерфейс Snac на власне вподобання.</p>

<p>Спочатку я не зрозумів, як підключати нові теми, і додав посилання на умовний файл <C><s>`</s>/theme.css<e>`</e></C> до <C><s>`</s>/home/snac/storage/server.json<e>`</e></C>, а також створив на нього аліас локального шляху в Nginx (щоб задовольнити браузерну політику CORS):</p>

<CODE lang="default"><s>``` default</s><i>
</i>location /theme.css {
    alias /var/www/snac/theme.css;
}<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>цей приклад я лишаю на випадок, якщо ви захочете підключити додаткові <C><s>`</s>cssurls<e>`</e></C></LI></LIST>

<p>Але згодом виявилось, що при створенні інстансу, генерується стандартний файл у теці <C><s>`</s>/home/snac/storage/style.css<e>`</e></C> який буде конфліктувати з новою темою (адже він підключатиметься окремо від масиву конфігурації <C><s>`</s>cssurls<e>`</e></C>).</p>

<p>Таким чином, потрібно просто переписати вміст стандартного файлу <C><s>`</s>/home/snac/storage/style.css<e>`</e></C> обраною темою, а масив <C><s>`</s>cssurls<e>`</e></C> потрібен тільки для тюнінгу поточної теми, без правки її оригіналу. Щоб повернутись до оригінальної теми - достатньо видалити цей файл, після чого згенерується стандартний файл Snac.</p>

<H3><s>### </s>Специфіка клієнтських застосунків</H3>

<p>Особисто, я встиг перевірити тільки <URL url="https://tuba.geopjr.dev/"><s>[</s>Tuba<e>](https://tuba.geopjr.dev/)</e></URL>. Як виявилось, даний клієнт має захардкожену обробку схеми HTTPS, тому якщо користуєтесь цим застосунком, доведеться налаштувати окремий інтерфейс Nginx на порті <C><s>`</s>443<e>`</e></C> з використанням сертифікату, хоч у випадку з Yggdrasil - це зайва "капуста" і мабуть поки що лишусь на веб-інтерфейсі або зроблю і викладу потім патч.</p>

<p>UPD 1. розробник виявився супер-оперативним і вже створив <URL url="https://github.com/GeopJr/Tuba/tree/refs/heads/experiment/ignore-dom-secure"><s>[</s>гілку з патчем<e>](https://github.com/GeopJr/Tuba/tree/refs/heads/experiment/ignore-dom-secure)</e></URL> (Flatpak в <URL url="https://github.com/GeopJr/Tuba/actions/runs/14965019143"><s>[</s>Артефактах<e>](https://github.com/GeopJr/Tuba/actions/runs/14965019143)</e></URL>), єдине що - тільки поки не "завезли" валідацію IPv6 у вікно авторизації, тому я тимчасово користуюсь аліасом в <C><s>`</s>/etc/hosts<e>`</e></C> і вказую у якості URL авторизації <C><s>`</s>http://alias<e>`</e></C>. Можливо, у наступних випусках додатка це вже буде не актуально.</p>

<p>UPD 2. Наразі, гілка об''єднана з <C><s>`</s>main<e>`</e></C>, тому замість аліасів для IPv6, можна просто додати при запуску <C><s>`</s>TUBA_SKIP_STRICT_VALIDATION=1<e>`</e></C>, наприклад:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>TUBA_SKIP_STRICT_VALIDATION=1 ''builddir/dev.geopjr.Tuba''<i>
</i><e>```</e></CODE>

<p>UPD 3. Особисто я користуюсь <URL url="https://github.com/YGGverse/Tuba/tree/multiprotocol-address-support"><s>[</s>окремою гілкою<e>](https://github.com/YGGverse/Tuba/tree/multiprotocol-address-support)</e></URL>, де ця нубська валідація HTTP випиляна, і жодних додаткових флагів для запуску не потрібно:</p>

<p>Для збірки з форку:</p>

<LIST type="decimal"><LI><s>1. </s><C><s>`</s>git clone https://github.com/YGGverse/Tuba.git<e>`</e></C></LI>
<LI><s>2. </s><C><s>`</s>git checkout multiprotocol-address-support<e>`</e></C></LI>
<LI><s>3. </s><C><s>`</s>make &amp;&amp; make install<e>`</e></C>
    <LIST><LI><s>* </s>або для Flatpak:
<CODE lang="bash"><s>``` bash</s><i>
</i>flatpak-builder --force-clean build\
                --install-deps-from=flathub\
                --install\
                --repo=repo\
                --user\
                build-aux/dev.geopjr.Tuba.Devel.json<i>
</i><e>```</e></CODE></LI></LIST></LI></LIST>

<p>Також, в мене є ще одна, окрема гілка, де я форсовано застосовую українську локаль для постів, адже сервер Snac має <URL url="https://codeberg.org/grunfink/snac2/issues/388"><s>[</s>певний недопил<e>](https://codeberg.org/grunfink/snac2/issues/388)</e></URL> по синхронізації даного API.</p>

<p>Скачати All-in-One збірку можна <URL url="https://github.com/YGGverse/Tuba/tree/ps"><s>[</s>тут<e>](https://github.com/YGGverse/Tuba/tree/ps)</e></URL>, виконавши для встановлення кроки вище (з <C><s>`</s>git checkout ps<e>`</e></C>).</p>

<H3><s>### </s>Моніторинг трафіку</H3>

<p>Оскільки сервер Snac не передбачає користування JS інтерфейсом, а поточна конфігурація використовує Nginx, можу по ходу справи також порадити <URL url="https://goaccess.io/"><s>[</s>goaccess<e>](https://goaccess.io/)</e></URL> - CLI утиліту для зручного моніторингу статистики користувацького трафіку, якщо такий буде:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>goaccess /var/log/nginx/access.log<i>
</i><e>```</e></CODE>

<H3><s>### </s>Приватний режим</H3>

<p>Yggdrasil дозволяє маскувати реальний IP, якщо ви користуєтесь власним <URL url="https://publicpeers.neilalexander.dev/"><s>[</s>вихідним вузлом<e>](https://publicpeers.neilalexander.dev/)</e></URL>. Звісно, таку можливість не варто розглядати в контексті анонімізації окремо без додаткових шарів, оскільки використання протоколу Yggdrasil без наприклад таких проксі, як <URL url="https://github.com/shadowsocks/shadowsocks-rust"><s>[</s>Shadowsocks<e>](https://github.com/shadowsocks/shadowsocks-rust)</e></URL> - легко виявляється.</p>

<p>Ця тема виходить за рамки матеріалу, але зверну увагу на деякі аспекти, якщо ви плануєте користуватись збіркою Snac + Yggdrasil в режимі "інкогніто". Протокол ActivityPub передбачає "спілкування" між серверами для обміну івентами. Тобто потенційний фоловер може відправити запит підписки на на дозволений у фаєрвол інтерфейс <C><s>`</s>0200::/7<e>`</e></C>, але вказати в заголовках події ActivityPub - зворотній DNS на вузол в мережі Інтернет. Таким чином, ваша система здійснить транзакцію з білого IP через системний резольвер або без нього, використовуючи локальний Curl API від Snac.</p>

<p>Потенційних сценаріїв витоку можна придумати багато. Я переглянув вихідний код Snac, та не знайшов у ньому жодних фільтрів взаємодії на вихідні підключення. Тому, як і для іншого не спеціалізованого софту, для цієї мети бажано використовувати ізоляцію роутера з контейнера <URL url="https://uk.wikipedia.org/wiki/Docker"><s>[</s>Docker<e>](https://uk.wikipedia.org/wiki/Docker)</e></URL>, <URL url="https://uk.wikipedia.org/wiki/LXC"><s>[</s>LXC<e>](https://uk.wikipedia.org/wiki/LXC)</e></URL> або віртуалізуватись засобами <URL url="https://uk.wikipedia.org/wiki/QEMU"><s>[</s>QEMU<e>](https://uk.wikipedia.org/wiki/QEMU)</e></URL>.</p>

<p>При використанні клієнтського API, окремого аудиту потребуватиме обробка віддаленого вмісту постів, аватарів та іншого. У цьому напрямку, є перші кроки, зокрема по частині Web UI (<URL url="https://codeberg.org/grunfink/snac2/pulls/394"><s>[</s>PR#394<e>](https://codeberg.org/grunfink/snac2/pulls/394)</e></URL>, <URL url="https://codeberg.org/postscriptum/snac2/src/branch/enhanced-webui-privacy"><s>[</s>гілка<e>](https://codeberg.org/postscriptum/snac2/src/branch/enhanced-webui-privacy)</e></URL>), але я не впевнений, що буду пиляти це довгий час, адже з цих причин, давно користуюсь протоколом <URL url="https://devzone.org.ua/post/protokol-gemini-iak-alternatyva-http"><s>[</s>Gemini<e>](https://devzone.org.ua/post/protokol-gemini-iak-alternatyva-http)</e></URL>.</p>

<p>Можна, в принципі, додати правило на "останній рубіж" <C><s>`</s>iptables<e>`</e></C>, наприклад заблокувати вихідні пакети в Інтернет:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ufw default deny outgoing<i>
</i><e>```</e></CODE>

<p>Якщо користуєтесь Yggdrasil в оверлейному режимі (тобто через публічний пір), важливо додати його до білого списку:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ufw allow out to PUBLIC_PEER_IP<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>якщо вузлів декілька, додаємо їх послідовно</LI>
<LI><s>* </s>перевірити поточні правила <C><s>`</s>ufw<e>`</e></C> можна командою <C><s>`</s>ufw status verbose<e>`</e></C></LI>
<LI><s>* </s>можливо, для тесту конекту варто перезапустити сервіс <C><s>`</s>systemctl restart yggdrasil<e>`</e></C></LI>
<LI><s>* </s>також, не забудьте про системний DNS резольвер та інші служби, що залежать від вихідних з''єднань!</LI></LIST>

<p>На останок, дозволяємо локальні запити для взаємодії між вузлами:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ufw allow out to 0200::/7 from 0200::/7<i>
</i><e>```</e></CODE>

<H3><s>### </s>Багато-мережевий режим</H3>

<p>Можливо, згодом (коли розберусь) окремо опишу, як запустити інстанс у різних мережах одночасно, наприклад Інтернет + Yggdrasil, але наскільки бачу по коду Snac, його файлова реалізація сховища дозволяє працювати тільки в рамках однієї мережі / хосту.</p>

<p>Думаю, тут можна буде погратись з проксуванням з авто-заміною, організувати реплікацію або використанням "білого" DNS і записів <C><s>`</s>A<e>`</e></C>/<C><s>`</s>AAAA<e>`</e></C> відповідно до типу з''єднання клієнтського резольвера. Так чи інакше, це - вже зовсім інша історія!</p>

<H2><s>## </s>Посилання</H2>

<p>Інших вузлів я поки не зустрічав, тому підписуйтесь на мій - для тестів і спілкування:</p>
<LIST><LI><s>* </s>http://[302:68d0:f0d5:b88d::fed]/ps</LI></LIST>

<p>Можливо, колись сформується нове локальне сузір''я <E>:)</E></p>

<p>Оригінал даної статті написано для Веб-проєкту DevZone:<br/>
<URL url="https://devzone.org.ua/post/nalashtuvannia-fediverse-serveru-snac-dlia-roboty-v-merezi-yggdrasil">https://devzone.org.ua/post/nalashtuvannia-fediverse-serveru-snac-dlia-roboty-v-merezi-yggdrasil</URL></p></r>',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (15,9,1,'2025-08-24 20:59:46',1,'comment','<r><p>Враховуючи специфіку сучасних Веб-стандартів, при відвідуванні веб-сайтів у мережі <URL url="https://devzone.org.ua/post/yggdrasil-mereza-z-detsentralizovanym-routynhom"><s>[</s>Yggdrasil<e>](https://devzone.org.ua/post/yggdrasil-mereza-z-detsentralizovanym-routynhom)</e></URL>, можливі та цілком ймовірні фонові запити до зовнішніх Інтернет вузлів. Таким чином, може не контрольовано здійснюватись підвантаження сторонніх ресурсів сторінки, зокрема - графіки, стилів, скриптів та іншого. Наприклад, це може бути випадкове або спеціальне звернення веб сайту до ресурсів у зоні <C><s>`</s>.ru<e>`</e></C> (зокрема Yandex) або ви просто не бажаєте витоків персональної IP адреси до будь-яких вузлів Інтернет, наприклад - користуючись Yggdrasil в режимі інкогніто.</p>

<p>Нижче наведу невеличку нотатку, про те, як особисто я фільтрую не бажаний вихідний трафік з використанням <URL url="https://uk.wikipedia.org/wiki/SOCKS"><s>[</s>SOCKS5<e>](https://uk.wikipedia.org/wiki/SOCKS)</e></URL> проксі <URL url="https://github.com/yggdrasil-network/yggstack"><s>[</s>Yggstack<e>](https://github.com/yggdrasil-network/yggstack)</e></URL> і окремим браузером для навігації в цій мережі - <URL url="https://librewolf.net/"><s>[</s>LibreWolf<e>](https://librewolf.net/)</e></URL>, на прикладі системи Fedora Linux.</p>

<p>Звертаю увагу, що дана інструкція не включає кроки з анонімізації - маскування відбитків, оновлення сесій, cookies, вимкнення акселерації та іншого. Це окрема тема, для якої існують спеціалізовані софт, додатки і навички. Тут ми просто контролюємо вихідний трафік в режимі Yggdrasil-only.</p>

<H2><s>## </s>Yggstack</H2>

<p>Yggstack - це невеличкий проксі сервер на базі Netstack, що містить в собі ізольований екземпляр вузла Yggdrasil (так само, як <URL url="https://devzone.org.ua/post/yggmail-mesendzer-z-poshtovym-interfeysom"><s>[</s>Yggmail<e>](https://devzone.org.ua/post/yggmail-mesendzer-z-poshtovym-interfeysom)</e></URL>) і надає локальний інтерфейс для підключення до нього браузеру (чи іншого додатку) для проксування в діапазоні <C><s>`</s>0200::/7<e>`</e></C>.</p>

<H3><s>### </s>Залежності</H3>

<p>Тут достатньо встановити актуальну версію <URL url="https://uk.wikipedia.org/wiki/Go_%28%D0%BC%D0%BE%D0%B2%D0%B0_%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D1%83%D0%B2%D0%B0%D0%BD%D0%BD%D1%8F%29"><s>[</s>Go<e>](https://uk.wikipedia.org/wiki/Go_(мова_програмування))</e></URL>. Про це я вже писав у матеріалі <URL url="https://devzone.org.ua/post/vstanovlennia-ostannyoyi-versiyi-go-v-debian"><s>[</s>Встановлення останньої версії Go в Debian<e>](https://devzone.org.ua/post/vstanovlennia-ostannyoyi-versiyi-go-v-debian)</e></URL>.</p>

<H3><s>### </s>Встановлення</H3>

<p>Збираємо приблизно так само, як Yggdrasil:</p>

<LIST type="decimal"><LI><s>1. </s><C><s>`</s>git clone https://github.com/yggdrasil-network/yggstack.git<e>`</e></C></LI>
<LI><s>2. </s><C><s>`</s>cd yggstack<e>`</e></C> - переходимо в робочу теку</LI>
<LI><s>3. </s><C><s>`</s>./build<e>`</e></C> - компілюємо</LI>
<LI><s>4. </s><C><s>`</s>sudo ./yggstack -genconf &gt; /etc/yggstack.conf<e>`</e></C> - генеруємо конфігурацію
    <LIST><LI><s>* </s>якщо користуєтесь в оверлеї, також не забудьте вказати <URL url="https://publicpeers.neilalexander.dev/"><s>[</s>екзіт-ноду<e>](https://publicpeers.neilalexander.dev/)</e></URL> в <C><s>`</s>Peers<e>`</e></C></LI></LIST></LI>
<LI><s>6. </s><C><s>`</s>sudo mv yggstack /usr/local/bin/yggstack<e>`</e></C> - копіюємо в штатну директорію бінарних програм</LI>
<LI><s>7. </s><C><s>`</s>sudo restorecon -rv  /usr/local/bin/yggstack<e>`</e></C> - корегуємо доступи на виконання</LI></LIST>

<H3><s>### </s>Systemd</H3>

<p>Оскільки Yggstack, в принципі, створений щоб запускатись без <C><s>`</s>tun<e>`</e></C> інтерфейсу і <C><s>`</s>root<e>`</e></C>, створимо системний сервіс з виконанням від поточного системного користувача. Якщо не плануєте його запускати на фоні, можна цей крок пропустити і запуститись командою:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>/usr/local/bin/yggstack -useconffile /etc/yggstack.conf -socks 127.0.0.1:1080<i>
</i><e>```</e></CODE>

<p>Або ж створіть файл конфігурації командою <C><s>`</s>sudo nano /etc/systemd/system/yggstack.service<e>`</e></C>, додавши наступний вміст:</p>

<CODE lang="yggstack.service"><s>``` yggstack.service</s><i>
</i>[Unit]
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=USER
Group=GROUP
ExecStart=/usr/local/bin/yggstack -useconffile /etc/yggstack.conf -socks 127.0.0.1:1080
StandardOutput=null
StandardError=null
Restart=on-failure

[Install]
WantedBy=multi-user.target<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>USER<e>`</e></C>/<C><s>`</s>GROUP<e>`</e></C> змінюємо на актуальні</LI>
<LI><s>* </s><C><s>`</s>StandardOutput<e>`</e></C> і <C><s>`</s>StandardError<e>`</e></C> можна вказати як <C><s>`</s>file:///path/to/log<e>`</e></C>, якщо потрібне ведення журналу у файл</LI>
<LI><s>* </s><C><s>`</s>sudo systemctl daemon-reload<e>`</e></C> - потрібно якщо файл вже існує (оновлення)</LI>
<LI><s>* </s><C><s>`</s>sudo systemctl restart yggstack<e>`</e></C> - якщо потрібен автозапуск при старті системи</LI>
<LI><s>* </s><C><s>`</s>sudo systemctl restart yggstack<e>`</e></C> - запуск (в режимі рестарт)</LI>
<LI><s>* </s><C><s>`</s>sudo systemctl status yggstack<e>`</e></C> - перевіряємо чи сервіс працює</LI></LIST>

<H3><s>### </s>Браузер</H3>

<p>Як писав вище, для цієї мережі я користуюсь окремим браузером LibreWolf з трохи іншим пресетом, для зручності. В принципі, ті само кроки актуальні й для FireFox.</p>

<LIST type="decimal"><LI><s>1. </s>Переходимо в <C><s>`</s>Settings<e>`</e></C> -&gt; <C><s>`</s>Proxy<e>`</e></C> / <C><s>`</s>Network settings<e>`</e></C> -&gt; <C><s>`</s>Manual proxy configuration<e>`</e></C> </LI>
<LI><s>2. </s>В <C><s>`</s>SOCKS Host<e>`</e></C> пишемо наші локальні хост <C><s>`</s>127.0.0.1<e>`</e></C> і порт <C><s>`</s>1080<e>`</e></C></LI>
<LI><s>3. </s>Переконуємось, щоб версія була відмічена як <C><s>`</s>SOCKS v5<e>`</e></C></LI></LIST>

<H4><s>#### </s>Конфігурація PAC</H4>

<p>Я додатково користуюсь файлом <URL url="https://en.wikipedia.org/wiki/Proxy_auto-config"><s>[</s>PAC<e>](https://en.wikipedia.org/wiki/Proxy_auto-config)</e></URL>, щоб зароутити всі запити, що не відносяться до мережі Yggdrasil на фіктивний проксі, щоб швидше прискорити відвантаження сторінки. Інакше браузер буде намагатись відрезольвити ресурси з незначною затримкою.</p>

<p>Цього можна не робити, адже Yggstack і так відфільтрує подібні запити, оскільки він працює виключно в діапазоні <C><s>`</s>IPv6<e>`</e></C>/<C><s>`</s>0200::/7<e>`</e></C>. Але приклад нижче лишу, якщо ви хочете користуватись цим проксі на обидві мережі, закоментувавши останній <C><s>`</s>return<e>`</e></C>:</p>

<CODE lang="yggstack.pac"><s>``` yggstack.pac</s><i>
</i>function FindProxyForURL(url, host)
{
  // спрямовуємо трафік Yggdrasil по регулярному виразу на проксі Yggstack
  // цей приклад також включає доменні зони .ygg якщо користуєтесь Alfis DNS
  if (/^0{0,1}[2-3][a-f0-9]{0,2}:/.test(host) || /\.ygg$/.test(host)) {
    return ''SOCKS5 127.0.0.1:1080'';
  }
  return ''PROXY 127.0.0.1:123''; // видаліть цей рядок, якщо хочете працювати з усіма мережами
                                // або вкажіть окремий проксі для цих мереж, наприклад Tor
}<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>шлях до даного файлу потрібно вказати у полі <C><s>`</s>Automatic proxy configuration URL<e>`</e></C> у форматі <C><s>`</s>file:///path/to/file<e>`</e></C> (якщо зберігаєте його локально)</LI>
<LI><s>* </s>також, в мене працює окремий від Yggstack інтерфейс Yggdrasil для інших служб, таких як Bittorrent і радіо Rhythmbox. Тому для основного браузеру Firefox, я створив інший файл PAC з протилежними умовами, щоб виключити випадкове звернення до ресурсів Yggdrasil з нього.</LI>
<LI><s>* </s>щоб не плутатись в обох клонах Firefox, я користуюсь різними темами оформлення.</LI></LIST>

<H4><s>#### </s>Тестування підключення</H4>

<p>Відкриваємо будь який сайт з каталогу http://[21e:a51c:885b:7db0:166e:927:98cd:d186], переходимо в режим дебагу <C><s>`</s>Ctrl+Shift+i<e>`</e></C> та дивимось заблоковані запити, якщо такі є.</p>

<LIST><LI><s>* </s>щоб вимкнути форсований редірект <C><s>`</s>HTTP<e>`</e></C> &gt; <C><s>`</s>HTTPS<e>`</e></C>, в <C><s>`</s>about:config<e>`</e></C> встановіть опцію <C><s>`</s>browser.fixup.fallback-to-https<e>`</e></C>:<C><s>`</s>false<e>`</e></C></LI></LIST>

<p>Для аналізу системного трафіку, мені подобається TUI утиліта <C><s>`</s>iptraf<e>`</e></C> (<C><s>`</s>iptraf-ng<e>`</e></C>), або GUI <C><s>`</s>etherape<e>`</e></C>, <URL url="https://sniffnet.net/"><s>[</s>Sniffnet<e>](https://sniffnet.net/)</e></URL> та інші.</p>

<H3><s>### </s>Додаткова фільтрація</H3>

<p>Опціонально, можна додати правила на <C><s>`</s>iptables<e>`</e></C>, особливо це зручно, якщо користуєтесь окремим контейнером:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ufw default deny outgoing
ufw allow out to PUBLIC_PEER_IP
ufw allow out to 0200::/7 from any<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>на Fedora, замість CLI <C><s>`</s>ufw<e>`</e></C>, для <C><s>`</s>firewalld<e>`</e></C> мені зручніше налаштовувати потрібні зони через GUI за допомогою <C><s>`</s>firewall-config<e>`</e></C></LI></LIST>

<p>Також не зайвим буде використання вихідного роутера, наприклад на базі <URL url="https://uk.wikipedia.org/wiki/OpenWrt"><s>[</s>OpenWRT<e>](https://uk.wikipedia.org/wiki/OpenWrt)</e></URL>, але на мою думку, додаткова фільтрація саме тут - не критична, оскільки вбудованих засобів браузеру, для поставлених вище задач, цілком вистачає.</p>

<p>Оригінал даної статті написано для Веб-проєкту DevZone:<br/>
<URL url="https://devzone.org.ua/post/bezpechnyy-perehliad-saytiv-yggdrasil-z-yggstack">https://devzone.org.ua/post/bezpechnyy-perehliad-saytiv-yggdrasil-z-yggstack</URL></p>

<p>Дивіться також:<br/>
<URL url="/d/26-mii-fail-pac-dlia-yggdrasil-ta-mycelium"><s>[</s>Мій файл PAC для Yggdrasil та Mycelium<e>](/d/26-mii-fail-pac-dlia-yggdrasil-ta-mycelium)</e></URL></p></r>','2025-08-28 02:46:34',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (16,10,1,'2025-08-24 21:01:57',1,'comment','<r><p>Давно збирався підняти <URL url="https://uk.wikipedia.org/wiki/BitTorrent-%D1%82%D1%80%D0%B5%D0%BA%D0%B5%D1%80"><s>[</s>BitTorrent трекер<e>](https://uk.wikipedia.org/wiki/BitTorrent-трекер)</e></URL> відкритого типу (обмін файлами без реєстрації) для мережі <URL url="https://devzone.org.ua/post/yggdrasil-mereza-z-detsentralizovanym-routynhom"><s>[</s>Yggdrasil<e>](https://devzone.org.ua/post/yggdrasil-mereza-z-detsentralizovanym-routynhom)</e></URL>. Для цієї мети існує відомий сервер з 15-річною історією розробки <URL url="https://erdgeist.org/arts/software/opentracker/"><s>[</s>OpenTracker<e>](https://erdgeist.org/arts/software/opentracker/)</e></URL>, реалізований мовою C, але останнім часом, я надаю перевагу більш сучасній мові Rust, тим паче що потім планую реалізувати цією мовою додатковий веб-агрегатор на базі кешованих трекером інфо-хешів у зв''язці з бібліотекою <URL url="https://github.com/ikatson/rqbit"><s>[</s>rqbit<e>](https://github.com/ikatson/rqbit)</e></URL>.</p>

<p>Трохи полиставши результати пошуку на GitHub, віднайшов сервер <URL url="https://github.com/greatest-ape/aquatic"><s>[</s>Aquatic<e>](https://github.com/greatest-ape/aquatic)</e></URL>, який також підтримує IPv4/IPv6, протоколи UDP, HTTP, WS і так само зберігає дані в оперативній пам''яті, не зношуючи своєю роботою носій SSD. Нижче опишу покрокову інструкцію збірки, встановлення та налаштування для мережі Yggdrasil, можливо даний матеріал буде цікавий початківцям, зокрема - для використання в класичній мережі Інтернет.</p>

<H2><s>## </s>Підготовка системи</H2>

<H3><s>### </s>Створення системного користувача</H3>

<p>Як і для інших програм Linux, що збираються з початкового коду і запускаються через <C><s>`</s>systemd<e>`</e></C>, я створюю окремого системного користувача з домашньою текою, для ізоляції прав доступу:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>useradd -m aquatic<i>
</i><e>```</e></CODE>

<H3><s>### </s>Встановлення системних залежностей</H3>

<p>Програмне середовище Rust у мене розгорнуте в профілі <C><s>`</s>root<e>`</e></C>, куди я клоную репозиторії і засобами профілю якого проводжу збірку всіх бінарних файлів.<br/>
Якщо в системі не встановлена інфраструктура Rust (<C><s>`</s>rustc<e>`</e></C>, <C><s>`</s>cargo<e>`</e></C> та інше) тоді вам <URL url="https://rustup.rs/"><s>[</s>сюди<e>](https://rustup.rs/)</e></URL>.</p>

<p>Стандартна інсталяція залежностей Rust вимагає близько 2 Гб дискового простору. Якщо ви, як і я, користуєтесь VPS - встановіть лише необхідні для роботи компілятора пакунки. Для цього при першому запуску команди <C><s>`</s>curl --proto ''=https'' --tlsv1.2 -sSf https://sh.rustup.rs | sh<e>`</e></C>, оберіть пункт <C><s>`</s>2) Customize installation<e>`</e></C> і замість стандартного <C><s>`</s>Profile (which tools and data to install)? (minimal/default/complete) [default]<e>`</e></C> вкажіть <C><s>`</s>minimal<e>`</e></C>. Це пропустить встановлення зайвих на сервері пакунків, що зменшить розмір до <SUB><s>~</s>600</SUB> Мб. У випадку використання <C><s>`</s>minimal<e>`</e></C>, для збірки Aquatic важливо до-встановити деякі глобальні залежності:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>apt install clang libclang-dev<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>при інсталяції в <C><s>`</s>rustup<e>`</e></C> в режимі <C><s>`</s>default<e>`</e></C> цей крок можна пропустити</LI></LIST>

<p>Якщо <C><s>`</s>rustup<e>`</e></C> вже встановлено, також переконаймось, що використовуються актуальні версії:</p>

<LIST><LI><s>* </s><C><s>`</s>rustup update<e>`</e></C></LI>
<LI><s>* </s><C><s>`</s>cargo update<e>`</e></C></LI></LIST>

<H3><s>### </s>Встановлення Aquatic</H3>

<p>Виконуємо наступні кроки у послідовності:</p>

<LIST type="decimal"><LI><s>1. </s><C><s>`</s>su root &amp;&amp; cd ~<e>`</e></C> - логінимось (якщо досі не <C><s>`</s>root<e>`</e></C>) і переходимо в домашню теку</LI>
<LI><s>2. </s><C><s>`</s>git clone https://github.com/greatest-ape/aquatic.git &amp;&amp; cd aquatic<e>`</e></C> - клонуємо вихідний код і переходимо до теки проєкту</LI>
<LI><s>3. </s><C><s>`</s>cargo build --release -p aquatic_udp<e>`</e></C> - збираємо оптимізовані бінарні пакети <URL url="https://github.com/greatest-ape/aquatic/tree/master/crates/udp"><s>[</s>aquatic_udp<e>](https://github.com/greatest-ape/aquatic/tree/master/crates/udp)</e></URL></LI></LIST>

<p>Таким чином, бінарники будуть доступні у теці <C><s>`</s>/root/aquatic/target/release/*<e>`</e></C>. Оскільки ми будемо використовувати сервіс <C><s>`</s>systemd<e>`</e></C>, де відсутні змінні середовища, важливо скопіювати (або залінкувати) необхідні пакети в системне розташування, де вони матимуть відповідні права на виконання:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>install target/release/aquatic_udp /usr/local/bin/aquatic_udp<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>мені потрібен тільки сервер UDP, якщо ви хочете підняти HTTP та WS, виконайте аналогічні кроки для крейтів <C><s>`</s>aquatic_*<e>`</e></C> відповідно</LI>
<LI><s>* </s>тут ми використовуємо команду <C><s>`</s>install<e>`</e></C> замість <C><s>`</s>cp<e>`</e></C>, оскільки вона встановлює правильні права доступу замість <C><s>`</s>chmod<e>`</e></C>/<C><s>`</s>chown<e>`</e></C></LI>
<LI><s>* </s>якщо не плануєте оновлення, на даному етапі можна видалити не потрібні вихідні коди командою <C><s>`</s>rm -rf /root/aquatic<e>`</e></C></LI></LIST>

<H3><s>### </s>Файл конфігурації</H3>

<p>Сервер Aquatic можна запускати зі стандартним набором опцій, без аргументів (отримати поточні налаштування для конфігурації сервера можна командою <C><s>`</s>aquatic_udp -p<e>`</e></C>)</p>

<p>Оскільки мій сервер буде працювати в режимі Yggdrasil-only, як скопіюю цей вивід у спільний системний файл конфігурації командою:</p>
<CODE lang="bash"><s>``` bash</s><i>
</i>aquatic_udp -p &gt; /etc/aquatic.toml<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>приклад <C><s>`</s>systemd<e>`</e></C> нижче буде використовувати цей модифікований файл</LI></LIST>

<p>Стандартна конфігурація передбачає запуск на всіх інтерфейсах і порті <C><s>`</s>3000<e>`</e></C>, я ж змінюю на окрему адресу підмережі Yggdrasil і більш типовий для відкритих UDP трекерів порт <C><s>`</s>6969<e>`</e></C> (детальніше про те, як створити адресу підмережі Yggdrasil - читайте <URL url="http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:subnet_setting"><s>[</s>тут<e>](http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:subnet_setting)</e></URL>):</p>

<LIST><LI><s>* </s><C><s>`</s>use_ipv4 = false<e>`</e></C> - вимикаю IPv4, так як цей інтерфейс в Yggdrasil не обслуговується</LI>
<LI><s>* </s><C><s>`</s>address_ipv6 = "[xxx:xxxx:xxxx:xxxx::fdb]:6969"<e>`</e></C> - де <C><s>`</s>xxx:xxxx:xxxx:xxxx::fdb<e>`</e></C> - актуальна адреса IPv6, <C><s>`</s>fdb<e>`</e></C> - це імпровізований постфікс у діапазоні <C><s>`</s>A-f0-9<e>`</e></C> типу "file database"</LI></LIST>

<p>Якщо потрібен вивід публічної веб-статистики, вказуємо також:</p>
<LIST><LI><s>* </s><C><s>`</s>write_html_to_file = true<e>`</e></C></LI>
<LI><s>* </s><C><s>`</s>html_file_path = "/var/www/aquatic/index.html"<e>`</e></C> - шлях може бути іншим
    <LIST><LI><s>* </s>у цьому випадку створіть каталог командою <C><s>`</s>mkdir /var/www/aquatic<e>`</e></C></LI>
	<LI><s>* </s>надайте відповідні права <C><s>`</s>chown aquatic:aquatic /var/www/aquatic<e>`</e></C></LI></LIST></LI>
<LI><s>* </s>в конфігурації хосту <C><s>`</s>nginx<e>`</e></C> додаємо наступне (не забуваємо також відкрити <C><s>`</s>80<e>`</e></C> порт):
<CODE><s>``` /etc/nginx/default.conf</s><i>
</i># /etc/nginx/default
server {
    listen [xxx:xxxx:xxxx:xxxx::fdb]:80;
    server_name xxx:xxxx:xxxx:xxxx::fdb;

    root /var/www/aquatic;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}<i>
</i><e>```</e></CODE></LI>
<LI><s>* </s>де <C><s>`</s>xxx:xxxx:xxxx:xxxx::fdb<e>`</e></C> - актуальна адреса IPv6 (або домен для <C><s>`</s>server_name<e>`</e></C>)</LI>
<LI><s>* </s>не забуваємо застосувати зміни <C><s>`</s>nginx -t<e>`</e></C> / <C><s>`</s>systemctl reload nginx<e>`</e></C></LI></LIST>

<p>Інші налаштування лишаю стандартними.</p>

<H3><s>### </s>Налаштування Firewall</H3>

<p>В системах Debian, в режимі UDP / Yggdrasil-only (трекер прийматиме та віддаватиме виключно внутрішньомережеві адреси пірів) я використовую наступне перманентне правило <C><s>`</s>ufw<e>`</e></C> для таблиці <C><s>`</s>iptables<e>`</e></C>:</p>
<CODE lang="bash"><s>``` bash</s><i>
</i>ufw allow from 0200::/7 to xxx:xxxx:xxxx:xxxx::fdb port 6969 proto udp<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>якщо в конфігурації вказано інший порт, використовуйте його замість <C><s>`</s>6969<e>`</e></C></LI></LIST>

<p>Якщо у вас звичайний Інтернет трекер, можна просто додати дозвіл на всі вхідні типи підключень:</p>
<CODE lang="bash"><s>``` bash</s><i>
</i>ufw allow 6969<i>
</i><e>```</e></CODE>

<p>Не забуваємо по аналогії відкрити порт на веб-статистику, якщо така використовується у конфігурації вище!</p>

<H3><s>### </s>Сервіс systemd</H3>

<p>Від <C><s>`</s>root<e>`</e></C> створюємо новий файл конфігурації <C><s>`</s>/etc/systemd/system/aquatic.service<e>`</e></C>. В ньому, на моєму прикладі, вказано тільки запуск сервера UDP, якщо буде потрібно, додам й інші протоколи в рамках спільного сервісу (послідовністю команд групи <C><s>`</s>exec<e>`</e></C> або додатковим скриптом <C><s>`</s>sh<e>`</e></C>). Ви можете створити для себе окремі юніти типу <C><s>`</s>aquatic_ws.service<e>`</e></C>, але на мою думку це не зручно і краще адмініструвати спільною короткою командою.</p>

<CODE><s>``` /etc/systemd/system/aquatic.service</s><i>
</i># /etc/systemd/system/aquatic.service
[Unit]
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=aquatic
Group=aquatic
ExecStart=/usr/local/bin/aquatic_udp -c /etc/aquatic.toml
StandardOutput=file:/home/aquatic/debug.log
StandardError=file:/home/aquatic/error.log

[Install]
WantedBy=multi-user.target<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>systemctl daemon-reload<e>`</e></C> - оновлюємо конфігурацію systemd</LI>
<LI><s>* </s><C><s>`</s>systemctl enable aquatic<e>`</e></C> - автостарт при запуску системи</LI>
<LI><s>* </s><C><s>`</s>systemctl start aquatic<e>`</e></C> - запуск</LI>
<LI><s>* </s><C><s>`</s>systemctl status aquatic<e>`</e></C> - перевіряємо статус</LI></LIST>

<H2><s>## </s>Тестування</H2>

<p>Після запуску сервісу, перевіряємо наявність активного процесу командою:</p>
<CODE lang="bash"><s>``` bash</s><i>
</i>netstat -tulpn | grep aquatic_udp<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>на прикладі моєї конфігурації Yggdrasil, має бути щось типу такого: <C><s>`</s>udp6 0 0 xxx:xxxx:xxxx:xxxx:6969 :::* 123456/aquatic_udp<e>`</e></C></LI></LIST>

<p>Також дивимось журнали:</p>
<LIST type="decimal"><LI><s>1. </s><C><s>`</s>/home/aquatic/debug.log<e>`</e></C> - робочі звіти</LI>
<LI><s>2. </s><C><s>`</s>/home/aquatic/error.log<e>`</e></C> - помилки</LI></LIST>

<p>На стороні клієнта, створюємо новий торент (в <URL url="https://www.qbittorrent.org/"><s>[</s>qBittorrent<e>](https://www.qbittorrent.org/)</e></URL> це <C><s>`</s>Tools<e>`</e></C> -&gt; <C><s>`</s>Torrent Creator<e>`</e></C>), вказуємо адресу нашого нового трекеру та перевіряємо оновлення веб-статистики. Так само, можна додати трекер до існуючої роздачі.</p>

<p>В принципі, це все, якщо комусь цікаво - мій сервер розташований тут:</p>

<LIST><LI><s>* </s><C><s>`</s>udp://[302:68d0:f0d5:b88d::fdb]:6969<e>`</e></C> - анонси</LI>
<LI><s>* </s>http://[302:68d0:f0d5:b88d::fdb] - статистика</LI></LIST>

<p>Оригінал даної статті написано для Веб-проєкту DevZone:<br/>
<URL url="https://devzone.org.ua/post/vstanovlennia-bittorrent-trekera-aquatic-v-linux">https://devzone.org.ua/post/vstanovlennia-bittorrent-trekera-aquatic-v-linux</URL></p></r>','2025-09-16 22:10:26',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (17,11,1,'2025-08-24 21:39:58',1,'comment','<r><p>Наразі існує один відомий мені, вручну модерований (через PR) список <URL url="https://github.com/YGGverse/mycelium-catalog"><s>[</s>YGGverse<e>](https://github.com/YGGverse/mycelium-catalog)</e></URL>. Нижче його локальна копія, якщо маєте чим поділитись - пишіть в коментарях, може згодом піднімемо якийсь аналог <URL url="http://[21e:a51c:885b:7db0:166e:927:98cd:d186]"><s>[</s>Web-directory<e>](http://[21e:a51c:885b:7db0:166e:927:98cd:d186])</e></URL>, але з більш широкою підтримкою протоколів / портів.</p>

<H2><s>## </s>BitTorrent</H2>

<H3><s>### </s>Mycelium-only peers BitTorrent tracker</H3>

<LIST><LI><s>* </s><C><s>`</s>udp://[505:6847:c778:61a1::fdb]:6969<e>`</e></C>
  <LIST><LI><s>* </s><C><s>`</s>http://[505:6847:c778:61a1::fdb]<e>`</e></C> - stats</LI></LIST></LI></LIST>

<H2><s>## </s>Спільноти</H2>

<H3><s>### </s>UA</H3>

<LIST><LI><s>* </s><C><s>`</s>http://[505:6847:c778:61a1::c]<e>`</e></C></LI></LIST>

<H2><s>## </s>DNS</H2>

<H3><s>### </s><URL url="https://github.com/Revertron/Alfis"><s>[</s>Alfis<e>](https://github.com/Revertron/Alfis)</e></URL> public peers</H3>

<LIST><LI><s>* </s><C><s>`</s>[505:6847:c778:61a1:5c6d:e802:d291:8191]:4244<e>`</e></C> - see also <URL url="https://github.com/Revertron/Alfis/pull/386"><s>[</s>PR#386<e>](https://github.com/Revertron/Alfis/pull/386)</e></URL></LI></LIST>

<H2><s>## </s><URL url="https://nightfall.city/nex/info/specification.txt"><s>[</s>Nex protocol<e>](https://nightfall.city/nex/info/specification.txt)</e></URL></H2>

<LIST><LI><s>* </s><C><s>`</s>nex://[505:6847:c778:61a1::b]/<e>`</e></C> - personal nexlog by P.S. (running with <URL url="https://github.com/YGGverse/nexy"><s>[</s>Nexy<e>](https://github.com/YGGverse/nexy)</e></URL>)</LI></LIST>

<H2><s>## </s>Публічні піри</H2>

<H3><s>### </s>Україна</H3>

<LIST><LI><s>* </s><C><s>`</s>193.93.119.13:9651<e>`</e></C></LI></LIST>

<H2><s>## </s>Ігри</H2>

<H3><s>### </s>Half-Life</H3>

<H4><s>#### </s><URL url="https://github.com/FWGS/xash3d-fwgs"><s>[</s>Xash3D-FWGS<e>](https://github.com/FWGS/xash3d-fwgs)</e></URL></H4>

<LIST><LI><s>* </s><C><s>`</s>[505:6847:c778:61a1:5c6d:e802:d291:8191]:27015<e>`</e></C>
    <LIST><LI><s>* </s><C><s>`</s>my.hl.srv<e>`</e></C> - <URL url="https://github.com/Revertron/Alfis"><s>[</s>Alfis DNS<e>](https://github.com/Revertron/Alfis)</e></URL> alias</LI></LIST></LI></LIST>

<H2><s>## </s>Веб-проксі</H2>

<H3><s>### </s>Книги</H3>

<LIST><LI><s>* </s><C><s>`</s>http://[41e:42ca:c76c:d3e2:be24:11ff:fecd:5362]<e>`</e></C></LI></LIST>

<H3><s>### </s>Веб-радіо</H3>

<LIST><LI><s>* </s><C><s>`</s>http://[41e:42ca:c76c:d3e2:be24:11ff:fe5d:e3f0]<e>`</e></C>
    <LIST><LI><s>* </s><C><s>`</s>/disco<e>`</e></C> - Disco, Funk, RnB radio</LI>
    <LI><s>* </s><C><s>`</s>/kti<e>`</e></C> - KTI Archive radio</LI>
    <LI><s>* </s><C><s>`</s>/megaton<e>`</e></C> - Megaton Cafe Radio</LI>
    <LI><s>* </s><C><s>`</s>/vocaltrance<e>`</e></C> - Vocal trance</LI></LIST></LI></LIST></r>',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (18,12,1,'2025-08-24 22:14:57',1,'comment','<r><p>Коротка інструкція по встановленню оверлейної мережі <URL url="https://github.com/threefoldtech/mycelium"><s>[</s>Mycelium<e>](https://github.com/threefoldtech/mycelium)</e></URL> в Linux, оскільки навіть з моїми скілами, вона видалась дещо заплутаною, через безлад в репозиторії та відсутність доків.</p>

<p>По суті, Mycelium нічим особливим від <URL url="/d/6-yggdrasil-mereza-z-decentralizovanim-routingom"><s>[</s>Yggdrasil<e>](/d/6-yggdrasil-mereza-z-decentralizovanim-routingom)</e></URL> не відрізняється, окрім іншої моделі маршрутизації та реалізації роутера мовою Rust. Також, відомою мені характерною рисою цієї мережі - є наявність <C><s>`</s>traceroute<e>`</e></C></p>

<p>Варто зауважити, що проєкт в стадії розробки, користуйтесь на власний ризик!</p>

<H2><s>## </s>Встановлення</H2>

<p>Якщо в системі ще не встановлено інфраструктуру Rust/Cargo, то вам <URL url="https://rustup.rs/"><s>[</s>сюди<e>](https://rustup.rs/)</e></URL> або</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>curl --proto ''=https'' --tlsv1.2 -sSf https://sh.rustup.rs | sh<i>
</i><e>```</e></CODE>

<p>Далі клонуємо та збираємо пакунок з репозиторію:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>https://github.com/threefoldtech/mycelium.git
cd mycelium/myceliumd
cargo build --release
sudo install target/release/mycelium /usr/local/bin/mycelium<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>можливо потрібно буде довстановити <C><s>`</s>apt install build-essential pkg-config  libssl-dev<e>`</e></C></LI></LIST>

<H3><s>### </s>systemd</H3>

<CODE><s>``` /etc/systemd/system/mycelium.service</s><i>
</i>#/etc/systemd/system/mycelium.service

[Unit]
Wants=network.target
After=network.target

[Service]
ProtectHome=true
ProtectSystem=true
SyslogIdentifier=mycelium
CapabilityBoundingSet=CAP_NET_ADMIN

ExecStartPre=+-/sbin/modprobe tun
ExecStart=/usr/local/bin/mycelium -k /etc/mycelium.bin --peers tcp://xxx.xx.xxx.x:xxxx

# Адреси підмереж
#ExecStartPost=/bin/sleep 5s
#ExecStartPost=/bin/ip address add xxx:xxxx:xxxx:xxxx::x1/64 dev mycelium
#ExecStartPost=/bin/ip address add xxx:xxxx:xxxx:xxxx::x2/64 dev mycelium

#Restart=always
#RestartSec=5

TimeoutStopSec=5

# mkdir /var/log/mycelium
StandardOutput=file:/var/log/mycelium/debug.log
StandardError=file:/var/log/mycelium/error.log

[Install]
WantedBy=multi-user.target<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>/etc/mycelium.bin<e>`</e></C> - це приватний ключ, він створюється автоматично при першому запуску</LI>
<LI><s>* </s>в <C><s>`</s>--peers<e>`</e></C> вказуємо піри для підключення в оверлейному режимі, знайти їх можна <URL url="https://github.com/threefoldtech/mycelium?tab=readme-ov-file#hosted-public-nodes-v06x"><s>[</s>тут<e>](https://github.com/threefoldtech/mycelium?tab=readme-ov-file#hosted-public-nodes-v06x)</e></URL> і <URL url="https://github.com/YGGverse/mycelium-catalog?tab=readme-ov-file#public-peers"><s>[</s>тут<e>](https://github.com/YGGverse/mycelium-catalog?tab=readme-ov-file#public-peers)</e></URL></LI>
<LI><s>* </s>якщо журнали не потрібні - додайте до <C><s>`</s>exec<e>`</e></C> опцію <C><s>` </s>--silent<e>`</e></C></LI></LIST>

<H2><s>## </s>Налаштування</H2>

<p>Фаєрволи обслуговуються так само, як і у випадку Yggdrasil, тільки діапазон тут - <C><s>`</s>0400::/7<e>`</e></C>;</p>

<p>Для <URL url="/d/7-alfis-dns-rejestraciia-domenu-v-blokcein"><s>[</s>Alfis DNS<e>](/d/7-alfis-dns-rejestraciia-domenu-v-blokcein)</e></URL> існує окремий <URL url="https://github.com/YGGverse/Alfis/tree/mycelium-network-mode"><s>[</s>патч<e>](https://github.com/YGGverse/Alfis/tree/mycelium-network-mode)</e></URL> (<URL url="https://github.com/Revertron/Alfis/pull/386"><s>[</s>PR#386<e>](https://github.com/Revertron/Alfis/pull/386)</e></URL>), який теоретично вміє сікти все окрім Yggdrasil або Mycelium, але в мене там є деякі питання  як і до іншого пірингового софту, які поки що не перевіряв.</p>

<H3><s>### </s>PAC</H3>

<p>Мій файл конфігурації для окремого браузеру виглядає якось так:</p>

<CODE lang="config.pac"><s>``` config.pac</s><i>
</i>function FindProxyForURL(url, host)
{
  if (/^0{0,1}[2-3][a-f0-9]{0,2}:/.test(host) || /\.ygg$/.test(host))
  {
    return ''DIRECT'';
  }
  if (/^0{0,1}[4-5][a-f0-9]{0,2}:/.test(host))
  {
    return ''DIRECT'';
  }
  return ''PROXY 127.0.0.1:123'';
}<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>тобто обслуговуються конекти Yggdrasil та Mycelium, а все інше йде на фіктивний проксі</LI>
<LI><s>* </s>детальніше про конфіг PAC я писав у матеріалі <URL url="/d/9-bezpecnii-peregliad-saitiv-yggdrasil-z-yggstack"><s>[</s>Безпечний перегляд сайтів Yggdrasil з Yggstack<e>](/d/9-bezpecnii-peregliad-saitiv-yggdrasil-z-yggstack)</e></URL></LI></LIST>

<H2><s>## </s>Тестування</H2>

<LIST><LI><s>* </s>Доступний <URL url="https://github.com/YGGverse/mycelium-catalog"><s>[</s>репозиторій<e>](https://github.com/YGGverse/mycelium-catalog)</e></URL> зі списком сервісів для цієї мережі</LI>
<LI><s>* </s><URL url="https://devzone.org.ua/topic/ukrayinska-spilnota-administratoriv-alternatyvnykh-merez"><s>[</s>Українська спільнота адміністраторів альтернативних мереж<e>](https://devzone.org.ua/topic/ukrayinska-spilnota-administratoriv-alternatyvnykh-merez)</e></URL></LI>
<LI><s>* </s>BitTorrent трекер <C><s>`</s>udp://[505:6847:c778:61a1::fdb]:6969<e>`</e></C> і <URL url="http://[505:6847:c778:61a1::fdb]"><s>[</s>Веб-статистика<e>](http://[505:6847:c778:61a1::fdb])</e></URL></LI></LIST></r>','2025-09-16 21:36:00',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (19,13,1,'2025-08-24 22:31:26',1,'comment','<r><p>Просто залишу посилання для тих, хто не розуміє мови Go та цікавиться реалізацією даної мережі на Rust:<br/>
<URL url="https://github.com/arrza/yggdrasil-rs">https://github.com/arrza/yggdrasil-rs</URL></p>

<LIST><LI><s>* </s>на момент написання цього посту, <C><s>`</s>yggdrasil-rs<e>`</e></C> реалізує застарілу версію протоколу мережі <C><s>`</s>v0.4<e>`</e></C></LI></LIST></r>','2025-08-24 22:31:39',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (20,14,1,'2025-08-24 22:33:46',1,'comment','<r><p>Це коротенька інструкція для початківців, яка дозволить швидко розгорнути останню версію інфраструктури Go в Debian для збірки програм.</p>

<H2><s>## </s>Видалення попередньої версії</H2>
<p>Спочатку перевірте, чи не встановлена певна версія Go за допомогою пакетного менеджеру:</p>
<CODE><s>```</s><i>
</i>go version<i>
</i><e>```</e></CODE>

<p>Якщо так, попередньо переконайтесь, що її не використовують інші програми, після чого її можна видалити із системи:</p>
<CODE><s>```</s><i>
</i>apt remove golang<i>
</i><e>```</e></CODE>

<p>Додатково можна перевірити наявність старих файлів та зачистити їх:</p>
<CODE><s>```</s><i>
</i>rm -rf /usr/lib/go-ВЕРСІЯ<i>
</i><e>```</e></CODE>

<H2><s>## </s>Встановлення останньої версії</H2>

<p>Наступні кроки виконуються в домашній теці користувача, від якого планується запуск програми:</p>
<CODE><s>```</s><i>
</i>cd ~<i>
</i><e>```</e></CODE>

<p>Переходимо на <URL url="https://go.dev/dl/"><s>[</s>сторінку завантажень Go<e>](https://go.dev/dl/)</e></URL> і обираємо версію для потрібної архітектури:</p>
<CODE><s>```</s><i>
</i>wget https://go.dev/dl/go1.22.1.linux-amd64.tar.gz<i>
</i><e>```</e></CODE>

<p>Розпаковуємо архів, після чого його можна видалити:</p>
<CODE><s>```</s><i>
</i>tar -xzf go1.22.1.linux-amd64.tar.gz
rm go1.22.1.linux-amd64.tar.gz<i>
</i><e>```</e></CODE>

<p>Переміщуємо файли до системної теки від <C><s>`</s>root<e>`</e></C>:</p>
<CODE><s>```</s><i>
</i>sudo mv go /usr/local/<i>
</i><e>```</e></CODE>

<p>Створимо робочу теку Go для поточного користувача:</p>
<CODE><s>```</s><i>
</i>mkdir ~/go<i>
</i><e>```</e></CODE>

<p>Налаштуємо шляхи та перезавантажимо профіль:</p>
<CODE><s>```</s><i>
</i>export PATH=$PATH:/usr/local/go/bin
export GOPATH=~/go
source .bashrc<i>
</i><e>```</e></CODE>

<p>Перевіряємо результат:</p>
<CODE><s>```</s><i>
</i>go version<i>
</i><e>```</e></CODE>

<p>Оригінал даної статті написано для Веб-проєкту DevZone:<br/>
<URL url="https://devzone.org.ua/post/vstanovlennia-ostannyoyi-versiyi-go-v-debian">https://devzone.org.ua/post/vstanovlennia-ostannyoyi-versiyi-go-v-debian</URL></p></r>',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (21,15,1,'2025-08-24 22:47:56',1,'comment','<r><p>Користувачі дистрибутивів з довгостроковою підтримкою, ймовірно зіткнуться з проблемою збірки програм з версією Rust, що міститься в репозиторіях. Зокрема, цією мовою написаний роутер Mycelium, а також не офіційна реалізація Yggdrasil, тому напишу коротку інструкцію, щоб не посилатись на Інтернет.</p>

<p>Вирішується питання досить просто, за допомогою утиліти <URL url="https://www.rust-lang.org/tools/install"><s>[</s>Rustup<e>](https://www.rust-lang.org/tools/install)</e></URL>.</p>

<p>Спочатку потрібно видалити встановлені раніше версії, разом з їх залежностями.</p>

<p>На прикладі Debian:</p>
<CODE><s>```</s><i>
</i>apt remove cargo rustc
apt autoremove<i>
</i><e>```</e></CODE>

<p>Наступні кроки виконуються від того користувача, від якого планується подальша робота з програмою. <br/>
Таким чином, пакети будуть стандартно встановлюватись до теки <C><s>`</s>~/.cargo<e>`</e></C></p>

<p>Після введення наступної команди слідуємо підказкам:</p>
<CODE><s>```</s><i>
</i>curl --proto ''=https'' --tlsv1.2 -sSf https://sh.rustup.rs | sh<i>
</i><e>```</e></CODE>

<p>Оновити пакети до останньої версії можна командою:</p>
<CODE><s>```</s><i>
</i>rustup update<i>
</i><e>```</e></CODE>

<p>Якщо потрібно зібрати будь яку програму на більш ранній версії, наприклад <C><s>`</s>1.63<e>`</e></C> - достатньо встановити її поряд з іншою:</p>
<CODE><s>```</s><i>
</i>rustup install 1.63<i>
</i><e>```</e></CODE>

<p>Для збірки програми, вказуємо відповідну версію компілятора:</p>
<CODE><s>```</s><i>
</i>cargo +1.63 build --release<i>
</i><e>```</e></CODE>

<p>Щоб видалити встановлені таким чином <C><s>`</s>cargo<e>`</e></C>, <C><s>`</s>rustc<e>`</e></C> включно з <C><s>`</s>rustup<e>`</e></C>:</p>
<CODE><s>```</s><i>
</i>rustup self uninstall<i>
</i><e>```</e></CODE>

<H2><s>## </s>Нотатки</H2>
<LIST><LI><s>* </s>якщо плануєте збірку програм на примонтованому девайсі (наприклад USB) - додайте параметр <C><s>`</s>exec<e>`</e></C> в <C><s>`</s>options<e>`</e></C> що в <C><s>`</s>/etc/fstab<e>`</e></C></LI>
<LI><s>* </s>інфраструктура та збірка тягне чимало дискового простору (від 1-2 Гб і більше), ви можете зменшити обсяг вимог до диску, встановивши мінімальні залежності з атрибутом <C><s>`</s>--profile=minimal<e>`</e></C>, що пропустить встановлення документації, <C><s>`</s>clippy<e>`</e></C> та інших інструментів; а звільнити простір - використанням додаткового крейту <URL url="https://crates.io/crates/cargo-cache"><s>[</s>cargo-cache<e>](https://crates.io/crates/cargo-cache)</e></URL> і команди <C><s>`</s>cargo cache -a<e>`</e></C></LI></LIST></r>',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (22,16,1,'2025-08-24 23:02:06',1,'comment','<r><p>Revertron <URL url="https://zhub.link/@Revertron/115086073810941396"><s>[</s>пише<e>](https://zhub.link/@Revertron/115086073810941396)</e></URL> про новий реліз месенджера Mimir з підтримкою голосових викликів. Наразі тільки для Android, тому протестувати я не можу.</p>

<p>Як заявлено автором, даний месенджер не потребує реєстрації.</p>

<p>Репозиторій проєкту:<br/>
<URL url="https://github.com/Revertron/Mimir/">https://github.com/Revertron/Mimir/</URL></p></r>',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (23,17,1,'2025-08-24 23:51:13',1,'comment','<r><p>Невеличкий гайд з мого першого досвіду встановлення Flarum на Debian/Linux в рамках цієї спільноти.</p>

<p>В принципі, на офіційному сайті доступна <URL url="https://docs.flarum.org/2.x/install"><s>[</s>інструкція<e>](https://docs.flarum.org/2.x/install)</e></URL> але й тут знадобилась деяка телепатія. В процесі доповнюватиму, по мірі самостійного розуміння що як працює.</p>

<H2><s>## </s>Системні залежності</H2>

<CODE lang="bash"><s>``` bash</s><i>
</i>apt install composer php-fpm php-curl php-dom php-sqlite3\
                                      php-fileinfo php-gd php-json php-mbstring\
                                      php-openssl php-pdo php-tokenizer php-zip php-session<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>в <C><s>`</s>apt<e>`</e></C> має вискочити нотайс з пропозицією поставити <C><s>`</s>php-common<e>`</e></C>, тому <C><s>`</s>php-dom<e>`</e></C>, <C><s>`</s>php-fileinfo<e>`</e></C> здається можна випиляти зі списку, але я залишу цю команду з історії bash, як вона є.</LI></LIST>

<H2><s>## </s>Рушій</H2>

<p>В рамках спільноти, створено спеціалізований <URL url="https://github.com/YGGverse/flarum-framework/tree/yggverse"><s>[</s>форк<e>](https://github.com/YGGverse/flarum-framework/tree/yggverse)</e></URL>, для нього є окремі <URL url="/d/21-lokalnii-fork-rusiia-flarum-vid-yggverse"><s>[</s>інструкції<e>](/d/21-lokalnii-fork-rusiia-flarum-vid-yggverse)</e></URL>.</p>

<p>Для встановлення оригіналу:</p>

<LIST type="decimal"><LI><s>1. </s><C><s>`</s>usearadd -m flarum<e>`</e></C> - створюємо окремого юзера</LI>
<LI><s>2. </s><C><s>`</s>su flarum<e>`</e></C> - логінимось</LI>
<LI><s>3. </s><C><s>`</s>cd<e>`</e></C> - переходимо в домашню теку</LI>
<LI><s>4. </s><C><s>`</s>composer create-project flarum/flarum:^2.0.0 --stability=beta<e>`</e></C> - встановлюємо через Composer</LI>
<LI><s>5. </s><C><s>`</s>cd flarum<e>`</e></C> - переходимо до теки проєкту</LI>
<LI><s>6. </s><C><s>`</s>composer update<e>`</e></C> - оновлюємо реєстр залежностей PHP</LI>
<LI><s>7. </s><C><s>`</s>php flarum install<e>`</e></C> - встановлюємо базу даних (тут створюється файл <C><s>`</s>config.php<e>`</e></C>)
    <LIST><LI><s>* </s>при виконанні команди <C><s>`</s>php flarum install<e>`</e></C> і використання драйвера SQLite, важливо вказати <C><s>`</s>name.sqlite<e>`</e></C> (з розширенням) інакше інсталяція не відбудеться</LI>
    <LI><s>* </s>назву хосту лишаємо як є (<C><s>`</s>localhost<e>`</e></C>)</LI></LIST></LI></LIST>

<p>Так як цей форум працює на обидві мережі Yggdrasil/Mycelium, у файлі <C><s>`</s>config.php<e>`</e></C> я вказав:</p>
<CODE lang="config.php"><s>``` config.php</s><i>
</i>''url'' =&gt; null,<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>є ще <URL url="https://discuss.flarum.org/d/2244-tor"><s>[</s>такий рецепт<e>](https://discuss.flarum.org/d/2244-tor)</e></URL> (<C><s>`</s>''url'' =&gt; ''//'' . $_SERVER[''HTTP_HOST'']<e>`</e></C>), але у такому разі компіляція статики не можлива, щонайменше на версії 2 буде помилка JS, ну і якщо робити то якось так, щоб не було warning при скиданні кешу: <C><s>`</s>''url'' =&gt; isset($_SERVER[''HTTP_HOST'']) ? ''//'' . $_SERVER[''HTTP_HOST''] : null<e>`</e></C></LI>
<LI><s>* </s>якщо встановити <C><s>`</s>null<e>`</e></C> то можливі проблеми з редіректами, наприклад, при виході з акаунту; тому це рішення тимчасове, дану проблему я також описав на офіційному <URL url="https://discuss.flarum.org/d/37994-cant-use-ipv6-address-in-host"><s>[</s>форумі<e>](https://discuss.flarum.org/d/37994-cant-use-ipv6-address-in-host)</e></URL>.</LI></LIST>

<p>Далі вийшов з цієї теки та надав права веб-серверу, згідно інструкції:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>chown -R www-data:www-data /home/flarum/flarum<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>тут треба придумати щось з групами, бо від <C><s>`</s>root<e>`</e></C> менеджер <C><s>`</s>composer<e>`</e></C> пускати не рекомендовано (наприклад, для оновлень рушія чи встановлення нових пакунків)</LI></LIST>

<H2><s>## </s>Nginx</H2>

<CODE><s>``` /etc/nginx/default</s><i>
</i>server {
    listen [302:68d0:f0d5:b88d::c]:80;
    listen [505:6847:c778:61a1::c]:80;

    server_name 302:68d0:f0d5:b88d::c 505:6847:c778:61a1::c;

    access_log /var/log/nginx/flarum.access.log;
    root /var/www/flarum/public;
    index index.php index.html;

    include /var/www/flarum/.nginx.conf;

    location ~ \.php$ {
        fastcgi_pass unix:/run/php/php8.2-fpm.sock;
        include fastcgi_params;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>версію сокета PHP замініть актуальною (<C><s>`</s>php -v<e>`</e></C>)</LI>
<LI><s>* </s>шляхи <C><s>`</s>/home/flarum/flarum<e>`</e></C> я пишу з пам''яті, бо довго тягав локацію туди-сюди і зараз вона в мене розташована на окремому, примонтованому диску, тому перевірте відповідність у себе актуальну щоб не було конфузів</LI>
<LI><s>* </s>тут я ще думаю залочити локацію <C><s>`</s>/admin<e>`</e></C> по IP - доповню згодом</LI></LIST>

<H2><s>## </s>Локалізація</H2>

<p>Пакети локалізації постачаються українською спільнотою <URL url="https://github.com/flarum-lang/ukrainian"><s>[</s>Joomla-UA<e>](https://github.com/flarum-lang/ukrainian)</e></URL>, але схоже що тільки для першої версії, бо встановлення ніяк не позначилось на поточному інтерфейсі. Тому потрібно якось зайнятись цим питанням.</p>

<H2><s>## </s>Бекапи</H2>

<p>Я зберігаю дані в SQLite, тому тут все просто:</p>
<CODE lang="bash"><s>``` bash</s><i>
</i>mkdir -p /path/to/flarum/daily
crontab -e
@daily /usr/bin/rsync -av --delete /path/to/flarum.sqlite /path/to/flarum/daily-dir<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>аватарки та інші медіа ще не вияснив де зберігаються, доповню</LI></LIST>

<H2><s>## </s>Виявлені проблеми</H2>

<H3><s>### </s>Швидкість</H3>

<p>Рушій здивував своєю тормознутістю. Особливо в режимі дебаг. Можливо, це залежить від SSD та кількості PHP файлів Symfony, які потребують кешування препроцесору. Або ж in-memory драйвера сесій замість БД.</p>

<p>Виконати і доповнити.</p>

<H3><s>### </s>Зовнішні запити</H3>

<p>Згодом, в консолі були помічені зовнішні запити до кешуючих серверів:</p>
<CODE><s>```</s><i>
</i>Cross-Origin Request Blocked: The Same Origin Policy disallows reading the remote resource at https://cdn.jsdelivr.net/gh/s9e/hljs-loader@1.0.36/loader.min.js. (Reason: CORS request did not succeed). Status code: (null).<i>
</i><e>```</e></CODE>
<p>Для Веб - це "нормально", але для оверлейних мереж і цієї спільноти зокрема - повинно бути виправлено:</p>

<LIST type="decimal"><LI><s>1. </s>вимикаємо або вказуємо локальне дзеркало "CDN mirror address" для додатка <C><s>`</s>flarum-emoji<e>`</e></C></LI> </LIST>

<H3><s>### </s>Тривалість сесій авторизації</H3>

<p>Форум викидає користувача через відносно короткий час (120 хвилин). Рішення проблеми описане <URL url="https://discuss.flarum.org/d/21562-login-session-timeout/15"><s>[</s>тут<e>](https://discuss.flarum.org/d/21562-login-session-timeout/15)</e></URL>:</p>

<CODE lang="php"><s>``` php</s><i>
</i>// File &lt;flarum&gt;/extend.php

use Flarum\Extend;
use Flarum\Foundation\AbstractServiceProvider;
use Illuminate\Contracts\Config\Repository as ConfigRepository;

class MyServiceProvider extends AbstractServiceProvider {
    public function register () {
         $this-&gt;container-&gt;make(ConfigRepository::class)-&gt;set(''session.lifetime'', 43829); // In minutes. Default is 120
    }
}

return [
    // Register extenders here to customize your forum!
    (new Extend\ServiceProvider)
        -&gt;register(MyServiceProvider::class),
];<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>UPD: згодом змінив <C><s>`</s>session.lifetime<e>`</e></C> на <C><s>`</s>session.gc_maxlifetime<e>`</e></C></LI>
<LI><s>* </s>щоб не робити окремий файл-костиль, можна просто вказати ці опції в <C><s>`</s>/etc/php/{VERSION}/fpm/php.in<e>`</e></C> та оновити налаштування командою <C><s>`</s>systemctl restart php{VERSION}-fpm<e>`</e></C></LI></LIST>

<H3><s>### </s>Пошта</H3>

<p>Класична електронна пошта (e-mail) - ядро системи облікових записів для цього рушія. В принципі, можна вимкнути (точніше перемкнути пересилання листів до журналу) і вручну створювати користувачів, але вони не зможуть навіть скинути свій пароль без пересилання їм коду підтвердження.</p>

<H4><s>#### </s>Yggmail</H4>

<p>При спробі інтегрувати Yggmail, було виявлено ряд проблем, зокрема в самій реалізації сервера (<URL url="https://github.com/neilalexander/yggmail/issues/41"><s>[</s>#41<e>](https://github.com/neilalexander/yggmail/issues/41)</e></URL>). Існують й інші зауваження в Issues, але схоже що розробка Yggmail була закинута. Також даний "месенджер" не покриває усі потенційно можливі мережі і примушує до встановлення та користування однією з них, яка також сьогодні не вирізняється особливою живістю.</p>

<H4><s>#### </s>Класичний поштовий сервер на всі мережі</H4>

<p>Стосовно сабжу, то наразі розглядається інтеграція локальних скриньок, при чому з підтримкою як сирого IPv6 в хостах, так і резольвера <URL url="https://github.com/Revertron/Alfis"><s>[</s>Alfis DNS<e>](https://github.com/Revertron/Alfis)</e></URL> (у випадку DNS, важлива наявність відповідних записів <C><s>`</s>MX<e>`</e></C>).</p>

<p>Як мінімум, з того що відомо, рушій не вміє форматувати низькорівневі заголовки з айпішників, тому згідно <URL url="https://www.rfc-editor.org/rfc/rfc5321#section-4.1.3"><s>[</s>специфікації<e>](https://www.rfc-editor.org/rfc/rfc5321#section-4.1.3)</e></URL>, поштові адреси потрібно буде вказувати з літералами або ж автоматично додавати на бекенді:</p>
<LIST><LI><s>* </s><C><s>`</s>user@[IPv6:302:xxxx:xxxx:xxxx::xx]<e>`</e></C> - IPv6</LI>
<LI><s>* </s><C><s>`</s>user@[xx.xx.xx.xx]<e>`</e></C> - IPv4</LI></LIST>

<p>Для проходження валідації, можливо, зробити якесь розширення, хоча тут на кожному кроці жорстка фільтрація засобами <URL url="https://www.php.net/manual/en/function.filter-var.php"><s>[</s>FILTER_VALIDATE_EMAIL<e>](https://www.php.net/manual/en/function.filter-var.php)</e></URL> і я сумніваюсь, що це буде зробити просто та сумісно з майбутніми оновленнями.</p>

<p>Використовуючи IP у якості хостів, потрібно також змінити поля <C><s>`</s>input[type="email"]<e>`</e></C> на <C><s>`</s>input[type="text"]<e>`</e></C>, інакше введення такого формату буде не доступним на рівні браузера (реалізовано в рамках локального <URL url="/d/21-lokalnii-fork-rusiia-flarum-vid-yggverse"><s>[</s>форку<e>](/d/21-lokalnii-fork-rusiia-flarum-vid-yggverse)</e></URL>).</p>

<H5><s>##### </s>Postfix / SMTP</H5>

<p>Самий простий (але ще не перевірений) спосіб. Він передбачає опцію налаштування "sendmail" що вказується в адмінці. У цьому випадку, 25 порт є закритим на фаєрволі.</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>apt install postfix<i>
</i><e>```</e></CODE>
<p>Мій файл конфігурації <C><s>`</s>/etc/postfix/main.cf<e>`</e></C> саме для цього ресурсу виглядає так:</p>

<CODE><s>``` /etc/postfix/main.cf</s><i>
</i>myhostname = localhost

smtpd_banner = $myhostname ESMTP $mail_name (Debian/GNU)
biff = no
append_dot_mydomain = no
readme_directory = no
smtpd_use_tls=no
compatibility_level = 3.6

smtpd_relay_restrictions = permit_mynetworks permit_sasl_authenticated defer_unauth_destination

alias_maps = hash:/etc/aliases
alias_database = hash:/etc/aliases

mydestination =
relayhost =
mynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
mailbox_size_limit = 0
recipient_delimiter = +
inet_interfaces = all
inet_protocols = ipv6

smtpd_etrn_restrictions=reject
disable_vrfy_command = yes
smtpd_helo_required = yes<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>тут <C><s>`</s>myhostname<e>`</e></C> ще буде змінено на основний ID, не знаю як це працюватиме</LI>
<LI><s>* </s><C><s>`</s>inet_protocols<e>`</e></C> можна вказати як "all" якщо планується взаємодія з Інтернет (інша історія з DNS)</LI></LIST>

<H5><s>##### </s>Тестування</H5>

<p>Поки не реалізовано валідатори форми, йдемо до бази даних, та змінюємо email юзера (в таблиці <C><s>`</s>users<e>`</e></C>)  вручну. Потім в адмінці, у відповідному розділі, натискаємо кнопку "Send" в секції "Send Test Mail" і перевіряємо скриньку.</p>

<p>Якщо бачите повідомлення:</p>
<QUOTE><i>&gt; </i><p>Flarum currently does not send emails. This can be due to the selected driver, or errors in its configuration.</p></QUOTE>

<p>то це не критично, в мене відправлення працює й з ним, головне, щоб не було помилок в поп-апах.</p>

<p>Стосовно клієнтського налаштування Postfix / Dovecot, читайте в окремій статті:<br/>
<URL url="/d/19-nalastuvannia-postovoyi-skrinki-dlia-lokalnix-merez-bez-dns"><s>[</s>Налаштування поштової скриньки для локальних мереж без DNS<e>](/d/19-nalastuvannia-postovoyi-skrinki-dlia-lokalnix-merez-bez-dns)</e></URL></p>

<H4><s>#### </s>Варіант без пошти</H4>

<p>В адмінці є варіант "log" тобто пошта буде надсилатись у файл-заглушку, з якого можна пересилати різні лінки верифікації та інші запити - руками або скриптом. Знаходиться цей журнал в <C><s>`</s>flarum/storage/logs/*.log<e>`</e></C></p>

<p>Вимкнути самі поля форм без патчу не вийде, в адмінці доступна лише опція вимкнення реєстрацій, таким чином, користувач бачитиме помилку при надсиланні відповідного запиту (так як це зараз).</p>

<p>Далі буде.</p></r>','2025-09-02 13:52:44',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (24,4,2,'2025-08-25 00:04:38',1,'discussionTagged','[[],[1]]',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (25,18,1,'2025-08-26 04:51:08',1,'comment','<r><p>В поточних умовах, нагадаю, що Redmi на 20.000 mAh - цілком собі тримає до шести годин побутовий Wi-Fi роутер і оптичний термінал без жодних підвищувачів напруги. Треба тільки перепаяти конектори зі старих дротів USB.</p>

<p>Насправді, я жодного разу не розряджався повністю. Сподіваюсь, інфа буде корисна тим, хто має схожі проблеми і планує витрачати гроші на китайські приблуди, що лише переведуть частину заряду в тепло.</p>

<p>Ще я про це писав <URL url="https://devzone.org.ua/qna/zyvlennia-routera-vid-paverbanku-napriamu-5v"><s>[</s>тут<e>](https://devzone.org.ua/qna/zyvlennia-routera-vid-paverbanku-napriamu-5v)</e></URL> і за цей час, жодного разу не пошкодував про свій експеримент з перевірки вбудованих стабілізаторів: нічого не погоріло, не залагало, пауер-банк - досі живий і передає вам привіт.</p></r>','2025-08-26 04:54:28',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (27,19,1,'2025-08-26 07:55:14',1,'comment','<r><p>Власне, хочу зробити повністю не залежну від Інтернет інфраструктуру для роботи цього форуму.</p>

<p>Задача - підняти локальну поштову скриньку для клієнта DeltaChat на базі персонального сервера Postfix і написати інструкцію для користувачів, щоб це не виглядало складно.</p>

<p>Подібним займаюсь вперше, частково користуюсь наступним прикладом <URL url="http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:email:home_email_server"><s>[</s>Wiki<e>](http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:email:home_email_server)</e></URL>.</p>

<p>Матеріал в процесі написання! Він частково відрізняється від інструкції вище, адже я хочу зробити можливість обміну повідомленнями без прив''язки DNS згідно такої можливості в специфікації <URL url="https://www.rfc-editor.org/rfc/rfc5321#section-4.1.3"><s>[</s>RFC 5321<e>](https://www.rfc-editor.org/rfc/rfc5321#section-4.1.3)</e></URL>.</p>

<p>Подробиці будуть оновлюватись.</p>

<H2><s>## </s>Створення користувача пошти</H2>

<p>Існує безліч способів адміністрування скриньок, але я обрав самий простий: системний, за паролем.</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>useradd -m ps
passwd ps
echo "root: ps" &gt;&gt; /etc/aliases<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>для логіну буде використовуватись саме <C><s>`</s>юзернейм<e>`</e></C> а не <C><s>`</s>юзернейм@хост<e>`</e></C>, оскільки технічно я хочу потім зробити прийом пошти з Yggdrasil та Mycelium на один і той же системний обліковий запис</LI>
<LI><s>* </s>вказаний пароль буде також використовуватись для авторизації в клієнті</LI></LIST>

<H2><s>## </s>Dovecot</H2>

<CODE lang="bash"><s>``` bash</s><i>
</i>apt install dovecot-core dovecot-imapd<i>
</i><e>```</e></CODE>

<H3><s>### </s>/etc/dovecot/dovecot.conf</H3>

<p>Вимикаю IPv4, але "слухаю" всі мережі IPv6 (включно з Yggdrasil та Mycelium)</p>
<CODE><s>``` /etc/dovecot/dovecot.conf</s><i>
</i>listen = ::<i>
</i><e>```</e></CODE>

<H3><s>### </s>/etc/dovecot/conf.d/10-auth.conf</H3>

<CODE><s>``` /etc/dovecot/conf.d/10-auth.conf</s><i>
</i>disable_plaintext_auth = no<i>
</i><e>```</e></CODE>

<H3><s>### </s>/etc/dovecot/conf.d/10-master.conf</H3>

<CODE><s>``` /etc/dovecot/conf.d/10-master.conf</s><i>
</i>service auth {
  unix_listener /var/spool/postfix/private/auth {
    mode = 0666
    user = postfix
    group = postfix
  }
}<i>
</i><e>```</e></CODE>

<H2><s>## </s>Postfix</H2>

<CODE lang="bash"><s>``` bash</s><i>
</i>apt install postfix<i>
</i><e>```</e></CODE>

<H3><s>### </s>/etc/postfix/main.cf</H3>

<CODE><s>``` /etc/postfix/main.cf</s><i>
</i>myhostname = localhost

smtpd_banner = $myhostname ESMTP $mail_name (Debian/GNU)
biff = no
append_dot_mydomain = no
readme_directory = no
smtpd_use_tls=no
compatibility_level = 3.6

smtpd_relay_restrictions = permit_mynetworks permit_sasl_authenticated defer_unauth_destination

alias_maps = hash:/etc/aliases
alias_database = hash:/etc/aliases

mydestination =
relayhost =
mynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
mailbox_size_limit = 0
recipient_delimiter = +
inet_interfaces = all
inet_protocols = ipv6

# деякі поради від спаму з мережі, але як вони працюють ще не знаю :)
smtpd_etrn_restrictions=reject
disable_vrfy_command = yes
smtpd_helo_required = yes

# інтеграція з Dovecot
smtpd_sasl_auth_enable = yes
smtpd_sasl_type = dovecot
smtpd_sasl_path = private/auth
mailbox_command =<i>
</i><e>```</e></CODE>

<H2><s>## </s>Фаєрвол</H2>

<p>Моя особиста конфігурація не передбачає прийом пошти від користувачів окрім локальних:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ufw allow from CLIENT_IP to any port 25 proto tcp
ufw allow from CLIENT_IP to any port 143 proto tcp<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>замінити <C><s>`</s>CLIENT_IP<e>`</e></C> на той, з якого підключатиметься клієнт DeltaChat</LI></LIST>

<p>У випадку, якщо ви налаштовуєте скриньку для прийому відправлень з цього форуму, можете додати виключення на його хост тієї мережі, якою користуєтесь, або замість фаєрволу - налаштувати доступ засобами SpamAssassin.</p>

<H2><s>## </s>DeltaChat</H2>

<p>Налаштовуючи даний клієнт, вказуємо:</p>
<LIST><LI><s>* </s>E-mail - у форматі RFC 5321 (тобто з літералом IPv6 <C><s>`</s>user@[IPv6:xxx:xxxx:xxxx:xxxx::]<e>`</e></C>)</LI>
<LI><s>* </s>User SMTP/IMAP - такий як до <C><s>`</s>useradd<e>`</e></C> (без хосту)</LI>
<LI><s>* </s>Host SMTP/IMAP - ваш IPv6 в мережі Yggdrasil або Mycelium</LI>
<LI><s>* </s>Password - такий як до <C><s>`</s>passwd<e>`</e></C></LI>
<LI><s>* </s>Обов''язково вказуємо стандартні порти, інакше DeltaChat використовує відмінні від 25/143</LI>
<LI><s>* </s>Усі види шифрування TLS вимикаємо</LI>
<LI><s>* </s>Верифікація сертифікатів не має значення</LI></LIST></r>','2025-09-17 01:33:57',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (29,20,1,'2025-08-26 08:49:39',1,'comment','<r><H2><s>## </s>Облікові записи</H2>

<p>Форум розсилає пошту на локальні мережі IPv6, за виключенням Інтернет.<br/>
При реєстрації або зміні адреси, будь ласка, використовуйте стандарт <URL url="https://www.rfc-editor.org/rfc/rfc5321#section-4.1.3"><s>[</s>RFC 5321<e>](https://www.rfc-editor.org/rfc/rfc5321#section-4.1.3)</e></URL>, тобто адреси формату:</p>

<LIST><LI><s>* </s><C><s>`</s>user@[IPv6:xxx:xxxx:xxxx:xxxx::]<e>`</e></C> - <URL url="/d/19-nalastuvannia-postovoyi-skrinki-dlia-lokalnix-merez-bez-dns"><s>[</s>без DNS<e>](/d/19-nalastuvannia-postovoyi-skrinki-dlia-lokalnix-merez-bez-dns)</e></URL>, важливо вказувати літерал <C><s>`</s>IPv6:<e>`</e></C> у вказаному регістрі!</LI>
<LI><s>* </s><C><s>`</s>user@host<e>`</e></C> - з DNS, сервер також підтримує <URL url="https://github.com/Revertron/Alfis"><s>[</s>Alfis DNS<e>](https://github.com/Revertron/Alfis)</e></URL> (з валідними записами <C><s>`</s>MX<e>`</e></C>)</LI></LIST>

<p>Адаптація рушія Flarum - в процесі, можливо деякі функції фронт-енду ще не готові.</p>

<H2><s>## </s>Публікації</H2>

<p>Будь ласка, враховуйте що даний форум працює на різних доменах, зокрема - Mycelium та Yggdrasil; можливі не залежні дзеркала та проксі. Тому вказуйте локальні посилання у відносному форматі, наприклад:</p>
<CODE><s>```</s><i>
</i>[alt](/uri)<i>
</i><e>```</e></CODE></r>','2025-09-12 01:00:50',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (30,20,2,'2025-08-26 08:51:16',1,'discussionStickied','{"sticky":true}',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (31,21,1,'2025-08-26 18:44:36',1,'comment','<r><p>Так як оригінальний рушій має ряд <URL url="/d/17-vstanovlennia-i-nalastuvannia-flarum-v2-beta"><s>[</s>проблем<e>](/d/17-vstanovlennia-i-nalastuvannia-flarum-v2-beta)</e></URL>, пов''язаних з сумісністю в різних мережах, було прийняте рішення створити окрему <URL url="https://github.com/YGGverse/flarum-framework/tree/yggverse"><s>[</s>гілку<e>](https://github.com/YGGverse/flarum-framework/tree/yggverse)</e></URL> з такими правками, які не мають перспектив бути включеними до офіційного upstream:</p>
<LIST><LI><s>* </s><C><s>`</s>[x]<e>`</e></C> нативна підтримка IPv6 хостів для поштових адрес користувачів</LI>
<LI><s>* </s><C><s>`</s>[ ]<e>`</e></C> додаткові засоби автоматичної фільтрації <URL url="https://www.rfc-editor.org/rfc/rfc5321#section-4.1.3"><s>[</s>літералів<e>](https://www.rfc-editor.org/rfc/rfc5321#section-4.1.3)</e></URL> </LI>
<LI><s>* </s><C><s>`</s>[ ]<e>`</e></C> підтримка мульти-хосту для організації дзеркал на різних мережах</LI> </LIST>

<p>Нижче інструкція по збірці та користування. Матеріал доповнюється!</p>

<H2><s>## </s>Встановлення</H2>

<p>В <URL url="https://docs.flarum.org/2.x/contributing#setting-up-a-local-codebase"><s>[</s>документації<e>](https://docs.flarum.org/2.x/contributing#setting-up-a-local-codebase)</e></URL> є базові інструкції, але мені знадобився день, щоб з ними усіма розібратись. Так як ця гілка розробляється для даного форуму, в осяжній перспективі її стабільні релізи чи пакетні збірки не плануються.</p>

<p>Виконуємо наступні кроки для розробників:</p>

<LIST type="decimal"><LI><s>1. </s><C><s>`</s>cd /var/www<e>`</e></C></LI>
<LI><s>2. </s><C><s>`</s>git clone https://github.com/YGGverse/flarum-framework.git<e>`</e></C></LI>
<LI><s>3. </s><C><s>`</s>cd flarum-framework<e>`</e></C></LI>
<LI><s>4. </s><C><s>`</s>git checkout yggverse<e>`</e></C></LI>
<LI><s>5. </s><C><s>`</s>cd ..<e>`</e></C></LI>
<LI><s>6. </s><C><s>`</s>git clone https://github.com/flarum/flarum.git<e>`</e></C></LI>
<LI><s>7. </s><C><s>`</s>cd flarum<e>`</e></C></LI>
<LI><s>8. </s><C><s>`</s>composer config repositories.0 path "/var/www/flarum-framework/*/*"<e>`</e></C></LI>
<LI><s>9. </s><C><s>`</s>composer config minimum-stability dev<e>`</e></C></LI>
<LI><s>10. </s><C><s>`</s>composer install<e>`</e></C> або <C><s>`</s>php flarum migrate<e>`</e></C></LI>
<LI><s>11. </s><C><s>`</s>php flarum cache:clear<e>`</e></C></LI>
<LI><s>12. </s><C><s>`</s>php flarum assets:publish<e>`</e></C> - згенерувати статику шрифтів (<URL url="https://discuss.flarum.org/d/37999-missing-font-assets-after-the-monorepo-compile"><s>[</s>1<e>](https://discuss.flarum.org/d/37999-missing-font-assets-after-the-monorepo-compile)</e></URL>, <URL url="https://discuss.flarum.org/d/27673-missing-fonts"><s>[</s>2<e>](https://discuss.flarum.org/d/27673-missing-fonts)</e></URL>)</LI></LIST>

<H2><s>## </s>Розробка</H2>

<p>При оновленні компонентів фронт-енд, важливо (після <C><s>`</s>yarn install<e>`</e></C>) зкомпілювати оптимізовані файли дистрибутиву командою <C><s>`</s>yarn build<e>`</e></C> та закомітити їх до апстріму для подальшого <URL url="#%D0%92%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%BD%D1%8F"><s>[</s>встановлення<e>](#Встановлення)</e></URL>.</p>

<p>Можливо, я не достатньо розбираюсь в цьому рушії та веб-програмуванні зокрема, але в оригінальному <C><s>`</s>flarum-framework<e>`</e></C> (який ще чомусь називається <C><s>`</s>monorepo<e>`</e></C>) не було відповідної інструкції, тому я її <URL url="https://github.com/YGGverse/flarum-framework/commit/b02e3b3600d5c0ff1a613590e72d91e7b9d88111"><s>[</s>додав<e>](https://github.com/YGGverse/flarum-framework/commit/b02e3b3600d5c0ff1a613590e72d91e7b9d88111)</e></URL> до збірки, на всяк випадок <URL url="https://discuss.flarum.org/d/37998-cant-recompile-js-cache-for-the-monorepo"><s>[</s>запитавши на форумі спільноти<e>](https://discuss.flarum.org/d/37998-cant-recompile-js-cache-for-the-monorepo)</e></URL> чому так і чи все зробив правильно. Може вони просто не хочуть щоб ці зміни потрапляли до комітів, не знаю.</p></r>','2025-08-29 01:59:11',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (32,22,1,'2025-08-27 05:11:50',1,'comment','<r><p>Деякі бібліотеки (такі як <URL url="https://github.com/ikatson/rqbit/issues/469"><s>[</s>librqbit<e>](https://github.com/ikatson/rqbit/issues/469)</e></URL>) не вміють вимикати надбудови міжпірингової комунікації типу PEX, але можуть робити це засобами так званого Blocklist.</p>

<p>В принципі, для IPv4 все просто:</p>
<CODE><s>```</s><i>
</i>Block IPv4:0.0.0.0-255.255.255.255<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>по географії списки зручно генерувати <URL url="https://www.ip2location.com/free/visitor-blocker"><s>[</s>тут<e>](https://www.ip2location.com/free/visitor-blocker)</e></URL>, для цього потрібно обрати формат <C><s>`</s>PeerGuardian2<e>`</e></C> та в залежності від торент-клієнта зберегти його у форматі <C><s>`</s>p2p<e>`</e></C> (для qBittorrent) або <C><s>`</s>txt<e>`</e></C>.</LI></LIST>

<p>Для блокування всіх IPv6 діапазонів/мереж окрім Yggdrasil, є такий <URL url="https://github.com/yggdrasil-network/yggdrasil-go/discussions/1273"><s>[</s>приклад<e>](https://github.com/yggdrasil-network/yggdrasil-go/discussions/1273)</e></URL> (по аналогії робимо ранж <C><s>`</s>0400::/7<e>`</e></C> для Mycelium):</p>
<CODE><s>```</s><i>
</i>Not Yggdrasil Network:::-1ff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
Not Yggdrasil Network:400::-7ff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
Not Yggdrasil Network:800::-fff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
Not Yggdrasil Network:1000::-1fff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
Not Yggdrasil Network:2000::-3fff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
Not Yggdrasil Network:4000::-7fff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
Not Yggdrasil Network:8000::-ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff<i>
</i><e>```</e></CODE>
<p>або</p>
<CODE><s>```</s><i>
</i>Not Yggdrasil Network:0000:0000:0000:0000:0000:0000:0000:0000-01ff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
Not Yggdrasil Network:0400:0000:0000:0000:0000:0000:0000:0000-07ff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
Not Yggdrasil Network:0800:0000:0000:0000:0000:0000:0000:0000-0fff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
Not Yggdrasil Network:1000:0000:0000:0000:0000:0000:0000:0000-1fff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
Not Yggdrasil Network:2000:0000:0000:0000:0000:0000:0000:0000-3fff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
Not Yggdrasil Network:4000:0000:0000:0000:0000:0000:0000:0000-7fff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
Not Yggdrasil Network:8000:0000:0000:0000:0000:0000:0000:0000-ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff<i>
</i><e>```</e></CODE>
<p>Наскільки я розумію, його можна спростити до:</p>
<CODE><s>```</s><i>
</i>ot Yggdrasil Network:::-1ff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
Not Yggdrasil Network:400::-ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff<i>
</i><e>```</e></CODE>
<p>або</p>
<CODE><s>```</s><i>
</i>Not Yggdrasil Network:0000:0000:0000:0000:0000:0000:0000:0000-01ff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
Not Yggdrasil Network:0400:0000:0000:0000:0000:0000:0000:0000-ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff<i>
</i><e>```</e></CODE>
<p>Якщо можна спростити ще або знайшли помилку - прокоментуйте будь ласка.</p></r>','2025-08-27 05:17:31',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (33,23,1,'2025-08-27 07:57:35',1,'comment','<r><p>Нагадаю, що в локальній мережі є сервер <URL url="https://store.steampowered.com/app/70/HalfLife/"><s>[</s>Half-Life<e>](https://store.steampowered.com/app/70/HalfLife/)</e></URL> на базі рушія <URL url="github.com/FWGS/xash3d-fwgs"><s>[</s>Xash3D<e>](github.com/FWGS/xash3d-fwgs)</e></URL> (для гри не потрібен Steam). Там нікого немає, тому сервер вимкнений, але може комусь таки захочеться організуватись на конкретний час:</p>

<LIST><LI><s>* </s><C><s>`</s>[202:68d0:f0d5:b88d:1d1a:555e:2f6b:3148]:27015<e>`</e></C> | <C><s>`</s>hl.ygg<e>`</e></C>
    <LIST><LI><s>* </s><C><s>`</s>:27010<e>`</e></C> - master</LI></LIST></LI>
<LI><s>* </s><C><s>`</s>[505:6847:c778:61a1:5c6d:e802:d291:8191]:27015<e>`</e></C> | <C><s>`</s>my.hl.srv<e>`</e></C>
    <LIST><LI><s>* </s><C><s>`</s>:27010<e>`</e></C> - master</LI></LIST></LI></LIST>

<p>Є ще сервер Skunky, має бути онлайн:</p>

<LIST><LI><s>* </s><C><s>`</s>[301:f137:d1ac:920e::2019]:27015<e>`</e></C>
    <LIST><LI><s>* </s><C><s>`</s>:27010<e>`</e></C> - master</LI></LIST></LI></LIST>

<p>Інструкції зі збірки та налаштування:</p>
<LIST><LI><s>* </s><URL url="http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:games:half_life_on_xash3d"><s>[</s>Howto/Wiki<e>](http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:games:half_life_on_xash3d)</e></URL></LI>
<LI><s>* </s><URL url="https://devzone.org.ua/post/half-life-v-linux-na-bazi-rushiia-xash3dfwgs"><s>[</s>DevZone<e>](https://devzone.org.ua/post/half-life-v-linux-na-bazi-rushiia-xash3dfwgs)</e></URL></LI></LIST>

<p>Хто не може купити ігрові асети, є локальна роздача по хешу <C><s>`</s>5dc7fad742310aa688970f9574bb6297b55de8d2<e>`</e></C>:</p>
<LIST><LI><s>* </s><C><s>`</s>udp://[302:68d0:f0d5:b88d::fdb]:6969<e>`</e></C> | <URL url="http://[302:68d0:f0d5:b88d::fdb]/5dc7fad742310aa688970f9574bb6297b55de8d2"><s>[</s>βtracker<e>](http://[302:68d0:f0d5:b88d::fdb]/5dc7fad742310aa688970f9574bb6297b55de8d2)</e></URL> - Yggdrasil</LI>
<LI><s>* </s><C><s>`</s>udp://[505:6847:c778:61a1::fdb]:6969<e>`</e></C> - Mycelium</LI></LIST></r>','2025-09-29 02:10:48',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (34,24,1,'2025-08-27 09:21:05',1,'comment','<r><p><URL url="https://github.com/YGGverse/yps"><s>[</s>YPS<e>](https://github.com/YGGverse/yps)</e></URL>, <EM><s>_</s>Yggdrasil Port Scanner<e>_</e></EM> - CLI утиліта для сканування <STRONG><s>**</s>відкритих портів<e>**</e></STRONG> мережі Yggdrasil.</p>

<p>Зручна для пошуку веб-сайтів, вузлів для підключення крипто-валют, ігрових серверів, IRC, тощо. Являє собою кравлер, що сканує дерево мережі починаючи з локального вузла Yggdrasil через JSON API та надсилає одну спробу з''єднання UDP або/і TCP. Якщо з''єднання успішне - відповідний статус з адресою виводиться в консоль або у файл; при додаванні <C><s>`</s>--debug<e>`</e></C> буде виведено детальну інформацію.</p>

<p>YPS не виконує пошук по адресам підмереж, оскільки їх сканування - технічно вимагає перебору а тому не вітається користувачами мережі.</p>

<H2><s>## </s>Встановлення</H2>

<CODE lang="bash"><s>``` bash</s><i>
</i>git clone https://github.com/yggverse/yps.git &amp;&amp; cd yps
cargo build --release
sudo install target/release/yps /usr/local/bin/yps<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>за необхідності, інфраструктура Rust/Cargo встановлюється засобами <URL url="/d/15-vstanovlennia-ostannyoyi-versiyi-rust-v-linux"><s>[</s>rustup<e>](/d/15-vstanovlennia-ostannyoyi-versiyi-rust-v-linux)</e></URL></LI></LIST>

<H2><s>## </s>Користування</H2>

<p>Програма в розробці, тому я не буду писати усі команди, доступні в <C><s>`</s>yps --help<e>`</e></C> та README, але в цілому, пошук 80 порту / TCP відбувається наступним чином:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>sudo yps --tcp --port 80<i>
</i><e>```</e></CODE>

<p>або коротко:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>sudo yps -t -p 80<i>
</i><e>```</e></CODE>

<p>є підтримка пошуку декількох портів:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>sudo yps -t -p 80 -p 443<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>перевірка рівня SSL при цьому не відбувається</LI></LIST></r>','2025-08-27 09:40:25',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (35,23,2,'2025-08-27 09:43:08',1,'discussionTagged','[[1],[1,2,3]]',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (36,25,1,'2025-08-27 12:48:32',1,'comment','<r><p><URL url="https://github.com/yggverse/btracker"><s>[</s>βtracker<e>](https://github.com/yggverse/btracker)</e></URL>, <EM><s>_</s>beta-tracker<e>_</e></EM> - локальний BitTorrent каталог агрегаційного типу на базі фреймворку <URL url="https://rocket.rs"><s>[</s>Rocket<e>](https://rocket.rs)</e></URL>, що є продовженням попереднього проєкту <URL url="https://github.com/YGGverse/YGGtracker"><s>[</s>YGGtracker<e>](https://github.com/YGGverse/YGGtracker)</e></URL> але на відміну від останнього, повністю автоматизований.</p>

<p>Індекс тут складається на базі <URL url="https://github.com/YGGverse/aquatic/tree/yggverse"><s>[</s>форку<e>](https://github.com/YGGverse/aquatic/tree/yggverse)</e></URL> UDP трекера <URL url="https://github.com/greatest-ape/aquatic/tree/master/crates/udp"><s>[</s>aquatic<e>](https://github.com/greatest-ape/aquatic/tree/master/crates/udp)</e></URL>, що генерує дамп інфо-хешів у бінарному форматі API та спеціально написаного для нього кравлера - <URL url="https://github.com/YGGverse/aquatic-crawler"><s>[</s>aquatic-crawler<e>](https://github.com/YGGverse/aquatic-crawler)</e></URL>.</p>

<H2><s>## </s>Принцип роботи</H2>

<p>Схематично, робота усієї системи зображена в README:</p>
<CODE><s>```</s><i>
</i>torrent client &gt; aquatic_udp &gt; infohash.bin &lt; aquatic-crawler &gt; * /preload/info-hash.torrent &gt; β
torrent client               &lt;-----------------------|          * /preload/info-hash/data      |
               &lt;-------------------------------------|          * /preload/.info-hash/tmp      |
                             &lt;-------------------------- scrape -------------------------------|<i>
</i><e>```</e></CODE>
<p>На схемі βtracker є останнім оператором даних справа.</p>

<p>Таким чином, торент-клієнти передають дані на UDP трекер, звідки (його форк) генерує бінарний API дамп <C><s>`</s>infohash.bin<e>`</e></C> з опціональною періодичністю, який в свою чергу читає кравлер і резольвить вказані дані (мета дані торент файлів, опціонально підвантажує зображення, txt файли, логи та інші) у спільну файлову систему, звідки їх вже читає та парсить агрегатор βtracker, тим само формуючи пошуковий індекс і Web UI.</p>

<p>Наразі вся система є раннім прототипом, і при вдалому її тестуванні, планується створити спільну бібліотеку файлової БД, зі стандартизованим API для всіх компонентів системи, що працюють з файлами асинхронно.</p>

<H2><s>## </s>Мережі</H2>

<p>βtracker розроблявся для мережі Yggdrasil, але на відміну від YGGtracker, може без проблемно працювати з Інтернет / IPv4 включно, а також споріднених оверлейних мережах типу Mycelium.</p>

<H2><s>## </s>Проблеми</H2>

<p>В рамках того, що коментарі та інша мета-інформація не є частиною стандартного <URL url="https://wiki.theory.org/BitTorrentSpecification#Info_Dictionary"><s>[</s>словника BitTorrent<e>](https://wiki.theory.org/BitTorrentSpecification#Info_Dictionary)</e></URL>, ці дані втрачаються при резольві байтів торент файла з інфо-хешу. Оскільки сам інфо-хеш формує унікальність роздачі, отримати такі дані з першого зустрічного піра не варіант, навіть якщо це технічно можливо при наприклад запиті такої інформації через сокет за рамками протоколу BitTorrent. Утім, й наявних даних цілком вистачає для побудови навігації та пошуку торентів (включно з індексованим вмістом) у невеличких мережах.</p>

<H2><s>## </s>Додаткова функціональність</H2>

<p>Так як URI сторінок торентів є унікальними для усієї мережі BitTorrent інфо-хешами, технічно, можливо реалізувати для них локальні соціальні функції: коментарі, лічильник завантажень, вподобання тощо. Але наразі така функціональність не запланована, щонайменше до першої стабільної версії усіх компонентів системи.</p>

<H2><s>## </s>Інстанси</H2>

<p>Поки для тестування усіх компонентів системи, функціонує один інстанс Yggdrasil:</p>
<LIST><LI><s>* </s><URL url="http://[302:68d0:f0d5:b88d::fdb]"><s>[</s>http://[302:68d0:f0d5:b88d::fdb]<e>](http://[302:68d0:f0d5:b88d::fdb])</e></URL> | <URL url="http://tracker.ygg">http://tracker.ygg</URL></LI></LIST>

<p>Згодом планується організувати такий само для мережі Mycelium. Є сумніви зробити спільний веб інтерфейс, але це може ускладнити навігацію, у той час як зараз - користувач явно розуміє що трекер приймає і віддає виключно одну мережу. Тому це або справа UI або вже майбутніх прототипів цієї моделі.</p>

<p><EM><s>_</s>Модифікована версія цього документу, з можливістю коментування, також доступна на <URL url="https://devzone.org.ua/post/vtracker-bittorrent-ahrehator-na-bazi-rust"><s>[</s>DevZone<e>](https://devzone.org.ua/post/vtracker-bittorrent-ahrehator-na-bazi-rust)</e></URL>.<e>_</e></EM></p></r>','2025-08-27 15:05:23',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (37,26,1,'2025-08-28 02:40:54',1,'comment','<r><p>Поділюсь прикладом свого файлу конфігурації <URL url="https://en.wikipedia.org/wiki/Proxy_auto-config"><s>[</s>PAC<e>](https://en.wikipedia.org/wiki/Proxy_auto-config)</e></URL> для LibreWolf який мною використовується суто для локалки, з метою запобігання витоків HTTP з''єднань на різні Yandex та інші "unexpected" ресурси. Я його постійно змінюю, але цей виглядає юзабельно:</p>

<CODE lang="pac"><s>``` pac</s><i>
</i>function FindProxyForURL(url, host)
{
	// Yggdrasil (all)
	if (/^0{0,1}[2-3][a-f0-9]{0,2}:/.test(host) || /\.ygg$/.test(host) || /^ygg\.ua\.srv$/.test(host))
	{
		return ''SOCKS5 127.0.0.1:1080''; // Yggstack
	}

	// Mycelium (whitelist)
	if (/^505:6847:c778:61a1:/.test(host) || /^myc\.ua\.srv$/.test(host))
	{
		return ''DIRECT'';
	}

	// Libera only
	if (/^web\.libera\.chat$/.test(host) || /^ua-log\.uk\.to$/.test(host))
	{
		return ''PROXY [324:71e:281a:9ed3::fa11]:3128''; // outproxy.acetone.*
	}

	return ''PROXY 127.0.0.1:123''; // deny (fake proxy)
}<i>
</i><e>```</e></CODE>

<p>Для встановлення словника орфографії зробив виключення, але потім видалив так як інші не планую:</p>

<CODE><s>```</s><i>
</i>if (/^addons.mozilla.org$/.test(host))
{
	return ''DIRECT'';
}<i>
</i><e>```</e></CODE></r>','2025-08-31 06:41:27',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (38,27,1,'2025-08-28 07:35:52',1,'comment','<r><p>Інструкція зі встановлення плагіна <URL url="https://github.com/gnfalex/rezka_yt_dlp_plugin"><s>[</s>rezka_yt_dlp_plugin<e>](https://github.com/gnfalex/rezka_yt_dlp_plugin)</e></URL> в Linux, для завантаження останніх релізів озвучки з дзеркал Rezka. Може бути корисною для створення роздач BitTorrent, або для локального перегляду відео.</p>

<p>Спочатку потрібно встановити утиліту <URL url="https://github.com/yt-dlp/yt-dlp"><s>[</s>yt-dlp<e>](https://github.com/yt-dlp/yt-dlp)</e></URL> зручним способом. Якщо у вас вже розгорнуто інфраструктуру Python, найпростіше це зробити з <C><s>`</s>pip<e>`</e></C>:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>pip install yt-dlp<i>
</i><e>```</e></CODE>

<p>Наступним кроком, встановлюємо сам плагін. Є різні <URL url="https://github.com/yt-dlp/yt-dlp#installing-plugins"><s>[</s>способи<e>](https://github.com/yt-dlp/yt-dlp#installing-plugins)</e></URL>, але я робив так:</p>

<LIST type="decimal"><LI><s>1. </s><C><s>`</s>mkdir -p ~/.config/yt-dlp/plugins<e>`</e></C></LI>
<LI><s>2. </s><C><s>`</s>cd ~/.config/yt-dlp/plugins<e>`</e></C></LI>
<LI><s>3. </s><C><s>`</s>git clone https://github.com/gnfalex/rezka_yt_dlp_plugin.git<e>`</e></C></LI>
<LI><s>4. </s><C><s>`</s>yt-dlp --verbose<e>`</e></C> - перевіряємо інсталяцію плагіна</LI>
<LI><s>5. </s><C><s>`</s>nano ~/.config/yt-dlp/plugins/rezka_yt_dlp_plugin/yt-dlp.conf<e>`</e></C> - вказати актуальні опції (звукову доріжку та URL) або пропустити, використовуючи у такому випадку аргументи CLI</LI></LIST>

<p>Відео завантажується наступним чином:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>cd ~/Downloads
yt-dlp --config-location ~/.config/yt-dlp/plugins/rezka_yt_dlp_plugin/yt-dlp.conf URL<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>або ж просто <C><s>`</s>yt-dlp URL<e>`</e></C> і обрати звукову доріжку вручну</LI>
<LI><s>* </s>для вибору сезону та епізоду: <C><s>`</s>--match-filter "season=1&amp;episode=2"<e>`</e></C></LI></LIST>

<p><EM><s>_</s>Інтернет-версія цього матеріалу з коментарями на <URL url="https://devzone.org.ua/post/zavantazennia-video-z-saytiv-rezka-hd-cherez-plahin-yt-dlp"><s>[</s>DevZone<e>](https://devzone.org.ua/post/zavantazennia-video-z-saytiv-rezka-hd-cherez-plahin-yt-dlp)</e></URL><e>_</e></EM></p></r>','2025-09-04 10:29:03',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (39,28,1,'2025-08-28 09:57:45',1,'comment','<r><p>В середовищі оверлейних мереж чомусь прийнято вважати, що якщо ключі вузлів перманентні, а з''єднання між вузлами захищене TLS, то додатковий шар SSL ніби як і не потрібний. Утім, останнім часом я починаю у цьому сумніватись.</p>

<H2><s>## </s>Компрометація ключа</H2>

<p>В мережах типу Yggdrasil / Mycelium немає рівня складності при генерації приватних ключів, а отже теоретично (хоча і малоймовірно) можлива колізія. З цієї причини, рекомендується використовувати основні адреси замість підмереж, а останні - розробники планують, але ніяк не випиляють. Та й зручні вони в рамках шейред хосту. Все одно це не виключає можливості випадкового видобутку копії, або не випадкового, враховуючи потенційні можливості криптоіндустрії, питання лише доречності використання супер-комп''ютера для цієї мети; скільки ці мережі включатимуть користувачів і якого статку, для потенційних атак на роутинг, що базується на фіксованому алгоритмі побудови дерева з peer ID.</p>

<H2><s>## </s>Подвійний шар</H2>

<p>Технічно, протокол транспорту Yggdrasil бере на себе роль шифрування трафіку тоді, коли це може бути не потрібно. Наприклад, у випадках:</p>
<LIST><LI><s>* </s>заощадження електроенергії та ресурсів CPU при пересиланні великих медіа файлів</LI>
<LI><s>* </s>коли вже використовується шар SSL / HTTPS на програмному рівні - з метою уникнення перехоплень логіну/паролю чи просто конфіденційного пересилання запитів GET через проксі</LI></LIST>

<p>Практичний приклад: вимога щодо шифрування трафіку Gemini в рамках Yggdrasil, бо перший хоче бути захищеним для Інтернет, але я використовую його не там, де задумував автор. З цієї причини, певний час користувався альтернативою <URL url="http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/nex_protocol"><s>[</s>Nex<e>](http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/nex_protocol)</e></URL>, але згодом усвідомив, що деякі дані потенційно можуть таки потребувати сертифікату, а отже, мені потрібна стара-добра модель HTTP+HTTPS на чутливих формах.</p>

<p>Якщо від клієнта до сервера передаються чутливі дані, то на мою думку, варто користуватись сертифікатом SSL, що слугуватиме запобіжником, але маршрутизатор вже про все "подбав", створивши зайві проблеми.</p>

<H2><s>## </s>Сертифікація в локальних мережах</H2>

<p>Через ізоляцію локальних мереж, в Yggdrasil є проблемою налаштувати валідний сертифікат, наприклад з Let''s Encrypt. Але у випадку протоколу <URL url="https://geminiprotocol.net/"><s>[</s>Gemini<e>](https://geminiprotocol.net/)</e></URL> - центри сертифікації не використовуються взагалі. Натомість застосовується принцип <URL url="https://en.wikipedia.org/wiki/Trust_on_first_use"><s>[</s>TOFU<e>](https://en.wikipedia.org/wiki/Trust_on_first_use)</e></URL>, що значно зменшує ризик перехоплення даних у часі - до моменту виявлення витоку. В мене навіть були такі думки стосовно організації внутрішньомережного центру сертифікації, чому б і ні; чому б навіть не зробити такий сервіс платним?</p>

<H2><s>## </s>Висновки</H2>

<p>Коли і як саме шифрувати дані - має вирішувати користувач / адміністратор мережі, на ті потоки / дані які того потребують. Тоді як Yggdrasil та Mycelium - роблять це "добровільно-примусово" як, власне, й інші новомодні софти з лейблом "абсолютно сек''юрно". Сучасний софт, розробники якого конкурують за право називатись "захищеним" нагадує крипто-капусту з коефіцієнтом безпеки було == стало.</p>

<p>Чомусь вже починає дратувати, коли за мене щось хтось починає вирішувати там, де того не просять. Маркетинг - маркетингом, слогани - слоганами, але досвідчені юзери йдуть через подібний дискомфорт, а туристи й без того не затримуються.</p>

<p>А ще висновки такі, що ефективні мережні рішення були винайдені повоєнними спеціалістами пів сторіччя тому, які мусили виживати, а не гратись в комерційні експерименти. Нічого принципово нового за цей час не винайдено. Можливо, наступним проривом стане квантова передача даних, а не подібний нонсенс: прокладати автоматичний маршрут до ймовірно компрометованих вузлів, при цьому шифрувати тони сміття, що ходить ним.</p>

<p><EM><s>_</s>Інтернет-версія цього матеріалу на <URL url="https://devzone.org.ua/post/dumky-stosovno-tls-v-merezakh-yggdrasil-ta-mycelium"><s>[</s>DevZone<e>](https://devzone.org.ua/post/dumky-stosovno-tls-v-merezakh-yggdrasil-ta-mycelium)</e></URL><e>_</e></EM></p></r>','2025-09-01 06:40:18',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (40,29,1,'2025-08-29 12:28:20',1,'comment','<r><p>Я давно користуюсь <URL url="https://uk.wikipedia.org/wiki/%D0%A4%D0%B5%D0%B4%D0%B8%D0%B2%D0%B5%D1%80%D1%81"><s>[</s>Fediverse<e>](https://uk.wikipedia.org/wiki/Федиверс)</e></URL>, але свій інстанс - підняв відносно недавно: приблизно пів року тому. При чому, його було створено у якості експерименту з працездатності екосистеми <URL url="https://uk.wikipedia.org/wiki/ActivityPub"><s>[</s>ActivityPub<e>](https://uk.wikipedia.org/wiki/ActivityPub)</e></URL> в рамках оверлейної мережі <URL url="/d/6-yggdrasil-mereza-z-decentralizovanim-routingom"><s>[</s>Yggdrasil<e>](/d/6-yggdrasil-mereza-z-decentralizovanim-routingom)</e></URL> як спроба не просто зробити веб-проксі, а організації локального сузір''я.</p>

<p>Так як це був перший досвід, я ще збирався організувати доступ до нього з Інтернет (повноцінну між-серверну комунікацію) але згодом усвідомив, що цей протокол на таке не розрахований і навіть якщо це технічно можливо, адміністратори інших серверів потребуватимуть додаткового шару специфікації для такої взаємодії.</p>

<H2><s>## </s>Сервери</H2>

<p>Їх вистачає: популярний <URL url="https://uk.wikipedia.org/wiki/Mastodon_%28%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BD%D0%B5_%D0%B7%D0%B0%D0%B1%D0%B5%D0%B7%D0%BF%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8F%29"><s>[</s>Mastodon<e>](https://uk.wikipedia.org/wiki/Mastodon_(програмне_забезпечення))</e></URL> я не ставив бо не хотів морочитись з PostgreSQL та й в цілому, його розгортання виглядає для мене ледачого складно.</p>

<H3><s>### </s>Snac</H3>

<p>Мені своєчасно порадили сервер <URL url="https://codeberg.org/grunfink/snac2"><s>[</s>Snac<e>](https://codeberg.org/grunfink/snac2)</e></URL>, який не тільки розрахований на маленький персональний сервер без зовнішніх реєстрацій, а ще й не потребує бази даних, при тому клієнт функціонує без JS і до цього сервера є доволі якісні теми оформлення, наприклад <URL url="https://codeberg.org/voron/snac-style/raw/branch/master/pika.css"><s>[</s>Pika<e>](https://codeberg.org/voron/snac-style/raw/branch/master/pika.css)</e></URL>. Написаний Snac мовою C.</p>

<p>Функціонування (слідування, коментарі, бусти, приватні повідомлення тощо) в локальній мережі було успішно перевірено на живих вузлах Yggdrasil в комбінаціях:</p>

<LIST><LI><s>* </s>Snac (IPv6) / Snac (IPv6)</LI>
<LI><s>* </s>Snac (IPv6) / Snac (DNS)</LI>
<LI><s>* </s>Snac (IPv6) / Mitra (IPv6)</LI>
<LI><s>* </s>Snac (IPv6) / Mitra (DNS)</LI></LIST>

<p>Детальніше про встановлення читайте в матеріалі:<br/>
<URL url="/d/8-nalastuvannia-fediverse-servera-snac-dlia-merezi-yggdrasil"><s>[</s>Налаштування Fediverse-сервера Snac для мережі Yggdrasil<e>](/d/8-nalastuvannia-fediverse-servera-snac-dlia-merezi-yggdrasil)</e></URL></p>

<p>Мій інстанс для тестування:<br/>
<URL url="http://[302:68d0:f0d5:b88d::fed]"><s>[</s>302:68d0:f0d5:b88d::fed<e>](http://[302:68d0:f0d5:b88d::fed])</e></URL></p>
<LIST><LI><s>* </s>взаємний фоловінг по запиту</LI></LIST>

<H3><s>### </s>Mitra</H3>

<p>Вже після встановлення Snac, я відкрив для себе <URL url="https://codeberg.org/silverpill/mitra"><s>[</s>Mitra<e>](https://codeberg.org/silverpill/mitra)</e></URL>. Цей сервер вимагає PostgreSQL, JS для стандартного клієнта і включає в себе навороти для автоматичної реєстрації та (мабуть) менеджменту користувачів. Я планую його спробувати потім, мені подобається його простий інтерфейс, користуюсь для свого Інтернет-профілю, який спочатку створив для тестів а потім там й лишився "жити".</p>

<p>Окремо згадую про це програмне рішення, тому що його вдалось протестувати в між-серверній комунікації з одним з реальних користувачів мережі. Також в нього була якимось чином налаштована взаємодія з Інтернет-федерацією. Подробиці цього збочення я не знаю, але довкола нашого експерименту, розробниками рушія Mitra було проявлено цікавість і спеціально натягнуто деякі адаптації по частині IPv6, тому в контексті цей сервер вартий уваги, а кому цікаві подробиці - зконтактуйте з <C><s>`</s>@madamada@mitra.void.my<e>`</e></C></p>

<H3><s>### </s>Tootik</H3>

<p>Окремо з цікавих платформ, я б ще відмітив сервер для протоколу <URL url="https://geminiprotocol.net"><s>[</s>Gemini<e>](https://geminiprotocol.net)</e></URL> - <URL url="https://github.com/dimkr/tootik"><s>[</s>Tootik<e>](https://github.com/dimkr/tootik)</e></URL>. Його бекенд, як і передбачає ActivityPub, взаємодіє по HTTP/JSON, але на рівні користування там буде інтерфейс Gemini на 1965 порті з TLS.</p>

<p>Згадую про дане рішення в контексті того, що альтернативними мережами часто користуються з метою приватності, тому протокол Gemini тут може мати деяку нішу користувачів.</p>

<H2><s>## </s>Ідентифікатори хостів</H2>

<p>Власне, саме цікаве і чому взагалі я задумав написати цей матеріал.</p>

<p>Щоб створити свій інстанс, вам потрібно ідентифікувати свій вузол як <C><s>`</s>user@host<e>`</e></C>. Коли ви це зробите, то вже не зможете безпроблемно його змінити потім, бо інші сервери федерації втратять зв''язок з вами. Тому він повинен бути обраний один раз і обраний правильно.</p>

<H3><s>### </s>DNS</H3>

<p>ActivityPub розроблявся як протокол високого рівня для комунікації засобами класичної мережі Інтернет з DNS, у той час як мережах типу Yggdrasil прийнято користуватись IPv6 а домен - вже надавати опцією.</p>

<p>Локальна мережа з ідентифікацією DNS, здавалось би дозволяє легко змінювати адреси IP або навіть перескочити з мережі Yggdrasil на Mycelium, а з того - на ще якусь нову екосистему. Але за цими перескоками повинні слідувати не тільки ваші читачі, але й сервери федерації. Тому сумнівно, якщо це не якийсь спеціалізований на одну мережу домен <C><s>`</s>.ygg<e>`</e></C> в Alfis DNS, що тільки відсіче потенційну частину сегменту, яка ним не користується.</p>

<H3><s>### </s>IP</H3>

<p>Свій ID я вирішив робити на IPv6 адресі мережі Yggdrasil бо такий формат, на відміну від домена, не може бути протермінований з часом (так, я можу зникнути на рік два і неочікувано для себе повернутись до мережі через десять).</p>

<p>З іншого боку, перманентні IP на основі криптографії - теж не панацея: ключі можуть бути загублені, випадково опубліковані тощо, а тому можуть потенційно потребувати генерації нових.</p>

<H4><s>#### </s>Адреси підмереж</H4>

<p>В мене ще лишається відкритим питання з адресами підмереж, бо ті є менш стійкими до колізій і такими, що потенційно можуть бути випиляні з майбутніх релізів роутера. Так, вони зручні, але сьогодні я б радив користуватись основними адресами для ідентифікації сервера, коли це можливо.</p>

<H2><s>## </s>Гібридна маршрутизація</H2>

<p>На початку матеріалу зауважив, що особисто для себе - відмовився від ідеї мульти-мережної комунікації для свого інстансу, спробувавши просто ініціювати локальне сузір''я, галактику, фізично ізольованої на рівні ActivityPub від інших мереж. Але зараз, спостерігаю занепад обраної мною мережі Yggdrasil, вже експериментую з Mycelium, і вже завтра - буду експериментувати з наступною. Тому трохи розкрию свої думки стосовно гібридного формату вузла.</p>

<p>Вже після запуску сервера в альтернативній мережі (або мережах з налаштованим проксі для між-серверного API), постане питання поширення посилань. Адже ви захочете ділитись публікаціями з друзями в Інтернет, Yggdrasil, I2P та інших екосистемах. Бажано, це має бути якесь одне канонічне посилання, яке приведе користувача до цільової сторінки в незалежності від налаштувань його маршрутизації і функціонування самої мережі на момент відвідування.</p>

<p>Були думки щодо організації центрального сервісу "коротких посилань" по типу колишнього bit.ly який підтримуватиме усі можливі альтернативи і для кожної з них надаватиме веб-проксі за форматом хосту...</p>

<p>З іншого боку, можна створити ще один "шейред роутер" як окремий протокол та програму для нього, саме з метою обслуговування гібридних сервісів без реалізації їх маршрутизації. У цьому питанні явно не вистачає сучасних рішень, адже зберігається тенденція до створення нових мереж та деградації старих, як це сталось з CJDNS і сьогодні відбувається з Yggdrasil. Технічно, діапазон IPv6 надає широке поле для експериментальних роутерів, їх кількість в умовах сучасних перешкод мережі буде тільки зростати, тому це питання є відкритим.</p>

<H2><s>## </s>Висновки</H2>

<p>Особисто для себе,  вирішив не міксувати екосистеми і вести ізольовані тематичні ресурси по кожній з них, намагаючись ділитись посиланнями в рамках тої екосистеми, для якої створено інстанс. Звичайно, на практиці виходить інакше, станом на сьогодні, назвати локальний інстанс - соціальним складно, утім якщо ви цієї соціальної взаємодії не шукаєте на глобальному рівні, то чому б не спробувати.</p></r>','2025-08-30 03:14:28',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (44,30,1,'2025-08-30 09:03:33',1,'comment','<r><p>На форумі спільноти запрацювала статистика відвідувань на базі локального аналізатора <URL url="https://github.com/YGGverse/htcount"><s>[</s>htcount<e>](https://github.com/YGGverse/htcount)</e></URL>. Також, щойно опублікував коротенький <URL url="/d/31-htcount-knopka-licilnik-vidviduvaciv-saitu-na-bazi-accesslog"><s>[</s>гайд<e>](/d/31-htcount-knopka-licilnik-vidviduvaciv-saitu-na-bazi-accesslog)</e></URL>, кому цікаво зробити таку кнопку в себе.</p>

<p>Поки не придумав, де її пристроїти, вручну можна подивитись <URL url="/counter.svg"><s>[</s>тут<e>](/counter.svg)</e></URL>.</p></r>','2025-08-30 09:59:58',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (45,31,1,'2025-08-30 09:08:28',1,'comment','<r><p>В локальних мережах не прийнято посилатись на зовнішні ресурси для підвантаження різних віджетів, оскільки часто такими мережами користуються саме з метою приватності. Нижче публікую адаптований гайд, початково написаний для сайту <URL url="https://devzone.org.ua/post/htcount-knopka-lichylnyk-vidviduvachiv-saytu-na-bazi-access-log"><s>[</s>DevZone<e>](https://devzone.org.ua/post/htcount-knopka-lichylnyk-vidviduvachiv-saytu-na-bazi-access-log)</e></URL>.</p>

<p><URL url="https://crates.io/crates/htcount"><s>[</s>htcount<e>](https://crates.io/crates/htcount)</e></URL> - системна утиліта, написана мовою Rust, що рахує кількість хостів / хітів на основі даних локального журналу <C><s>`</s>access.log<e>`</e></C> (<URL url="https://en.wikipedia.org/wiki/Common_Log_Format"><s>[</s>CLF<e>](https://en.wikipedia.org/wiki/Common_Log_Format)</e></URL>) і виводить результати у вигляді дампу JSON/API або у форматі кнопки SVG для вставки на сайт.</p>

<p>По суті, вона влаштована так само, як відомий <URL url="https://goaccess.io/"><s>[</s>goaccess<e>](https://goaccess.io/)</e></URL> - інструмент CLI, який дозволяє аналізувати Веб-трафік без підключення сторонніх сервісів типу Google Analytics.</p>

<H2><s>## </s>Встановлення</H2>

<p><C><s>`</s>htcount<e>`</e></C> написано мовою Rust, можливо, вам знадобиться спочатку розгорнути відповідну інфраструктуру для її збірки з початкового коду:</p>
<LIST><LI><s>* </s><URL url="/d/15-vstanovlennia-ostannyoyi-versiyi-rust-v-linux"><s>[</s>Встановлення останньої версії Rust в Linux<e>](/d/15-vstanovlennia-ostannyoyi-versiyi-rust-v-linux)</e></URL></LI></LIST>

<CODE lang="bash"><s>``` bash</s><i>
</i>git clone https://github.com/YGGverse/htcount.git &amp;&amp; cd htcount
cargo build --release
sudo install target/release/htcount /usr/local/bin/htcount<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>встановлення до <C><s>`</s>/usr/local/bin/htcount<e>`</e></C> потрібне в контексті системних дозволів <C><s>`</s>systemd<e>`</e></C></LI></LIST>

<H3><s>### </s>systemd</H3>

<CODE><s>``` /etc/systemd/system/htcount.service</s><i>
</i>#/etc/systemd/system/htcount.service
[Unit]
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
ExecStart=/usr/local/bin/htcount\
        # вкажіть актуальний шлях цільового журналу (див. також --ignore-host)
        --source /var/log/nginx/access.log\
        # вкажіть актуальний шлях для розміщення кнопки
        --export-svg /var/www/path/to/public/counter.svg\
        # я збирав пакунок від root, де в мене лежать оригінали у якості шаблону
        --template-svg /root/htcount/default/counter.svg\
        # оновлення кнопки раз на годину (3600 секунд)
        --update 3600\
        # оновлення відвідувачів раз на добу
        --match-time %%d/%%b/%%Y\
        # дебаг у файл вимкнено для заощадження терміну служби SSD
         --debug n
# дебаг вимкнено опцією --debug n, можна вказати шлях або драйвер
StandardOutput=null
# збираємо усі помилки до стандартного розташування системних журналів
StandardError=file:///var/log/htcount-error.log

[Install]
WantedBy=multi-user.target<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>перелік доступних опцій залежить від актуальної версії: <C><s>`</s>htcount --help<e>`</e></C></LI>
<LI><s>* </s>для інтеграції кнопки на сайт, додайте відповідний код: <C><s>`</s>&lt;img src="/counter.svg"/&gt;<e>`</e></C></LI></LIST></r>','2025-08-30 09:13:15',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (46,32,1,'2025-08-30 12:59:27',1,'comment','<r><p><EM><s>_</s>Мені не вдалось вирішити проблему вильоту сесій для цього браузеру, тому я переїхав на Firefox Development Edition, інструкції описані <URL url="/d/35-integraciia-binarnix-forkiv-firefox-z-gnome-desktop"><s>[</s>тут<e>](/d/35-integraciia-binarnix-forkiv-firefox-z-gnome-desktop)</e></URL>. Матеріал нижче - зберігаю для історії, можливо знайдеться якесь рішення (або виправлення багу).<e>_</e></EM></p>

<p>Користуюсь цим браузером окремо від основного Firefox, для імпровізованої ізоляції вихідних з''єднань на інші мережі через маршрутизацію засобами PAC:</p>
<LIST><LI><s>* </s><URL url="/d/9-bezpecnii-peregliad-saitiv-yggdrasil-z-yggstack"><s>[</s>Безпечний перегляд сайтів Yggdrasil з Yggstack<e>](/d/9-bezpecnii-peregliad-saitiv-yggdrasil-z-yggstack)</e></URL></LI>
<LI><s>* </s><URL url="/d/26-mii-fail-pac-dlia-yggdrasil-ta-mycelium"><s>[</s>Мій файл PAC для Yggdrasil та Mycelium<e>](/d/26-mii-fail-pac-dlia-yggdrasil-ta-mycelium)</e></URL></LI></LIST>

<p>З коробки, LibreWolf постачається з накрученими параметрами "безпеки", тому поряд з <URL url="http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:web-browsers:firefox_with_yggdrasil"><s>[</s>інструкціями Wiki для Firefox<e>](http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:web-browsers:firefox_with_yggdrasil)</e></URL>, для нього маю окремий пресет для доведення до робочого стану і деякі нотатки (які мені набридло щоразу збирати по інтернетам, тому запишу їх тут, може потім створю <URL url="https://librewolf.net/docs/settings/"><s>[</s>конфігом<e>](https://librewolf.net/docs/settings/)</e></URL> на Codeberg)</p>

<p>Налаштування нижче знижуть так би мовити рівень безпеки, приводячи цей браузер приблизно до рівня FF. Особисто я в ефекнтивість примочок LibreWolf не вірю, тому що наприклад торівський браузер з його рендерингом виглядає так, що можуть повипадати очі. Тому хто на паранойї - вам до інших інструкцій.</p>

<p>Моя ж задача тут - не анонімізація, а запобігання конектам на лівакові сайти, коли наприклад криво налаштоване проксі Yggdrasil на сайт Інтернет і в консолі сипляться помилки, через що сайт вісить на завантаженні сторінок або просто шле запити на не бажаний для мене сервер і тягне звідти медіа.</p>

<H2><s>## </s>Адаптивна тема</H2>

<p>Стандартно цей браузер блокує фінгерпрінти, що заважає як мінімум адаптивності CSS <C><s>`</s>color-scheme: light dark<e>`</e></C>. Вирішив я це питання наступним чином (в <C><s>`</s>about:config<e>`</e></C>)</p>

<CODE><s>```</s><i>
</i>privacy.resistFingerprinting = false
privacy.fingerprintingProtection = true
privacy.fingerprintingProtection.overrides = +AllTargets,-CSSPrefersColorScheme<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>тобто, це такий собі <URL url="https://bugzilla.mozilla.org/show_bug.cgi?id=1732114"><s>[</s>костиль<e>](https://bugzilla.mozilla.org/show_bug.cgi?id=1732114)</e></URL> який робить (мабуть) те само що <C><s>`</s>privacy.resistFingerprinting = true<e>`</e></C> тільки видаляє фільтр <C><s>`</s>CSSPrefersColorScheme<e>`</e></C></LI></LIST>

<p>UPD. схоже я не правильно зрозумів як працюють ці налаштування, тому просто вимкнув цей захист нах*</p>

<CODE><s>```</s><i>
</i>privacy.resistFingerprinting = false
privacy.fingerprintingProtection = false<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>інше стандартно</LI></LIST>

<H2><s>## </s>Збереження сесій</H2>

<p>З цим питанням розбираюсь, бо чомусь саме цей браузер розлогінює через час відсутності активності з ПК. При чому, те само відбувається на інших ресурсах, напложуючи купу дохлих сесій на сервері.</p>

<p>Пробував змінювати наступні опції:</p>
<LIST type="decimal"><LI><s>1. </s><C><s>`</s>Clear history when LibreWolf closes<e>`</e></C></LI>
<LI><s>2. </s><C><s>`</s>Delete cookies and site data when LibreWolf is closed<e>`</e></C></LI>
<LI><s>3. </s>Різні опції і таймаути в <C><s>`</s>about:config<e>`</e></C>, робив так само як в FF, але безрезультатно:
    <LIST><LI><s>* </s><C><s>`</s>browser.sessionstore.privacy_level = 0<e>`</e></C></LI>
    <LI><s>* </s><C><s>`</s>privacy.bounceTrackingProtection.mode = 3<e>`</e></C></LI>
    <LI><s>* </s><C><s>`</s>browser.sessionstore.privacy_level = 0<e>`</e></C></LI></LIST></LI></LIST>

<p>Підозрюю, що тут проблема саме з фінгерпринтами, може групою IDLE, або в іншому бо в цього браузеру випиляні стандартні для FF три варіанти приватності і втупу залишений лише Strict. На Reddit, <URL url="https://www.reddit.com/r/LibreWolf/comments/1jrprbu/is_librewolf_logging_me_out_of_sites_what_feature/"><s>[</s>пишуть<e>](https://www.reddit.com/r/LibreWolf/comments/1jrprbu/is_librewolf_logging_me_out_of_sites_what_feature/)</e></URL> ще про варіант <C><s>`</s>ask to save passwords<e>`</e></C>, наврят але цей пункт в мене не відмічений.</p>

<p>Проблема актуальна, якщо не вирішу то доведеться поставити просто якийсь FF Dev, Beta чи інший "клон" а не цю спробу LibreWolf натягнути сову на глобус, заважати нормальній навігації.</p>

<H2><s>## </s>uBlock</H2>

<p>Цей додаток встановлено з коробки. Він періодично шле запити на сервери Google для підвантаження актуальних правил блокування (виявив це випадково через монітор <URL url="https://en.wikipedia.org/wiki/EtherApe"><s>[</s>Etherape<e>](https://en.wikipedia.org/wiki/EtherApe)</e></URL>). Якщо для вас критичні вихідні з''єднання в Інтернет - зверніть увагу. Для себе - я просто цей додаток видалив так як реклами в Ygg немає.</p>

<H2><s>## </s>Косметика</H2>

<p>Щоб не плутатись в однакових інтерфейсах двох фаєрфоксів, для LibreWolf встановлено окрему тему оформлення. На FF в мене антогоністичний пресет PAC, тому якщо навіть я візуально сплутаю браузери і спробую перейти на локальний сайт (з витоками) звідти - то просто отримаю на такі з''єднання відмову.</p>

<p>Додатково поставив собі український спел-чекер, бо пишу гайди:<br/>
<URL url="https://addons.mozilla.org/en-US/firefox/addon/ukrainian-dictionary/">https://addons.mozilla.org/en-US/firefox/addon/ukrainian-dictionary/</URL></p>

<p>Також, повимикав спливаючі попапи при наведенні на таб:</p>

<CODE><s>```</s><i>
</i>browser.tabs.hoverPreview.enabled = false
browser.tabs.hoverPreview.showThumbnails = false<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>в принципі, це актуально й для Firefox</LI></LIST></r>','2025-08-31 08:08:59',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (47,33,1,'2025-08-30 13:54:55',1,'comment','<t><p>Було б зручно вивести даний ресурс в паблік, бо я і сам щойно не міг потрапити до мережі, щоб прочитати деякі нотатки з налаштування.</p>

<p>Якщо в когось є виділений сервер - пишіть, будемо думати як організувати.<br/>
Не бачу проблем розмістити у футері якесь реферальне посилання для волонтерів.</p></t>','2025-08-30 13:55:22',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (48,34,1,'2025-08-31 04:12:15',1,'comment','<r><p>Давно чув про соціальну мережу <URL url="https://github.com/markqvist/NomadNet"><s>[</s>NomadNet<e>](https://github.com/markqvist/NomadNet)</e></URL>, є навіть локальний <URL url="https://yggdrasil-network.github.io/services.html#reticulum-nodes"><s>[</s>пір Yggdrasil<e>](https://yggdrasil-network.github.io/services.html#reticulum-nodes)</e></URL> для неї:</p>
<LIST><LI><s>* </s><C><s>`</s>200:73eb:2e4:14be:aac7:90b3:784b:71a3<e>`</e></C> port <C><s>`</s>4242<e>`</e></C> TCP</LI></LIST>

<p>Має бути цікавою штукою з децентралізацією на базі торентів, схожою до ZeroNet, але приватно-орієнтованою за рахунок оверлейної мережі <URL url="https://github.com/markqvist/Reticulum"><s>[</s>Reticulum<e>](https://github.com/markqvist/Reticulum)</e></URL>. Так розумію, нею користуються не тільки для чатів, але й хостять там сайти (з TUI фронтендом типу Gopher / Gemini).</p>

<p>Скільки не пробував підключитись - в мене порожній список кімнат або ж там просто нікого немає. Принцип роботи чимось нагадує тунелі I2P, зокрема своїми режимами ре-трансляції. Але все дуже заплутано для початківця, може хто розкаже або я потім доповню цей матеріал гайдами вже з особистого досвіду.</p>

<p>UPD. в мережі Yggdrasil (через <URL url="http://[301:e4ae:40cf:92c3::2019]/yacysearch.html?query=nomadnet"><s>[</s>пошук<e>](http://[301:e4ae:40cf:92c3::2019]/yacysearch.html?query=nomadnet)</e></URL>) віднайшов наступні матеріали по темі:</p>
<LIST><LI><s>* </s><URL url="http://[203:1bb1:40fb:4bf0:6a49:1b0b:f134:507f]/blog/post/reticulum-nomadnet"><s>[</s>Reticulum + NomadNet<e>](http://[203:1bb1:40fb:4bf0:6a49:1b0b:f134:507f]/blog/post/reticulum-nomadnet)</e></URL></LI>
<LI><s>* </s><URL url="http://[203:75b7:45af:ecca:d641:cd42:38dc:4788]/blog/rnode_adventure_part1/"><s>[</s>RNode adventure: Part 1<e>](http://[203:75b7:45af:ecca:d641:cd42:38dc:4788]/blog/rnode_adventure_part1/)</e></URL></LI>
<LI><s>* </s><URL url="http://[203:75b7:45af:ecca:d641:cd42:38dc:4788]/blog/setting_up_reticulum/"><s>[</s>Setting up Reticulum - the almost full guide to radical networking<e>](http://[203:75b7:45af:ecca:d641:cd42:38dc:4788]/blog/setting_up_reticulum/)</e></URL></LI></LIST></r>','2025-08-31 17:41:59',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (50,35,1,'2025-08-31 06:37:21',1,'comment','<r><p>Так як не можу вирішити <URL url="/d/32-mii-preset-librewolf-dlia-navigaciyi-v-lokalnix-merezax"><s>[</s>проблеми з розлогінюванням в параноїдальному LibreWolf<e>](/d/32-mii-preset-librewolf-dlia-navigaciyi-v-lokalnix-merezax)</e></URL>, у якості окремого "контейнера" для пресетів навігації в локальних мережах, мною було прийняте рішення встановити <URL url="https://www.firefox.com/uk/channel/desktop/developer/"><s>[</s>Firefox Development Edition<e>](https://www.firefox.com/uk/channel/desktop/developer/)</e></URL>. Цей пакунок офіційно відсутній в репозиторіях (Flatpak не хочу), нижче деякі нотатки.</p>

<H2><s>## </s>Встановлення</H2>

<p>Я користуюсь Fedora, збирати цього монстра я полінився, тому просто завантажив готовий пакет з офіційного сайту. Для користувачів Debian там є репозиторій, тому не актуально.</p>

<p>У разі, якщо ви хочете перенести старий профіль, потрібно скопіювати вміст теки <C><s>`</s>~/.mozilla/firefox/xxx<e>`</e></C> до створеного після запуску та оновити ідентифікатори профілю у файлі <C><s>`</s>~/.mozilla/firefox/profiles.ini<e>`</e></C>.</p>

<H2><s>## </s>Лаунчер</H2>

<p>Взагалі, для бінарних файлів є окрема канонічна локація в Linux та інструкції <C><s>`</s>make<e>`</e></C>, але я просто завантажив готовий архів та скопіював бінарники до кастомної теки, тому мій лаунчер виглядає так:</p>

<CODE><s>```</s><i>
</i># ~/.local/share/applications/firefox-dev.desktop
[Desktop Entry]
Name=Firefox Dev
Exec=/path/to/firefox-143.0b6/firefox/firefox
Icon=/path/to/firefox-143.0b6/firefox/browser/chrome/icons/default/default128.png
Terminal=false
Type=Application
Categories=Web;<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>після цього оновити кеш <C><s>`</s>update-desktop-database ~/.local/share/applications<e>`</e></C></LI></LIST></r>','2025-08-31 07:10:14',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (51,36,1,'2025-08-31 09:47:24',1,'comment','<r><p>Наткнувся на черговий клієнтський плеєр <URL url="https://github.com/htkhiem/euphonica"><s>[</s>Euphonica<e>](https://github.com/htkhiem/euphonica)</e></URL>, який створений для відтворення аудіо з сервера <URL url="https://uk.wikipedia.org/wiki/Music_Player_Daemon"><s>[</s>MPD<e>](https://uk.wikipedia.org/wiki/Music_Player_Daemon)</e></URL>.</p>

<p>Даним рішенням ніколи не користувався, але з''явилась ідея зробити з нього публічний сервіс для локалки Yggdrasil/Mycelium, замість типового стріму <URL url="http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:internet_radio#icecast"><s>[</s>Icecast<e>](http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:internet_radio#icecast)</e></URL>, як це часто робиться.</p>

<p>Стріми потребують постійної конвертації форматів для виведення в потік, що вимагає ресурсів сервера. Може є кеш і все таке, але це постійна робота процесора. Стріми, як такі, в принципі створені для радіо, де є живі та ротаційні ефіри. Тому якщо транслювати аудіо-колекцію, мабуть, було б зручно. Що думаєте?</p>

<LIST><LI><s>* </s>Згаданий вище клієнт Euphonica наразі вміє підключатись тільки до одного сервера, тобто рішення явно орієнтоване на домашній або студійний сервер. Це залежить від клієнта, але я також натикався на інфу, що з MPD є певні моменти типу один клієнт змінює гучність і вона змінюється у всіх. Ну коротше, може бути що MPD явно не розрахований на паблік, потрібна думка олдів, бо я вже свій FTP якось підняв, виявивши ряд перешкод для подальшого хостингу на ньому своєї музичної колекції.</LI></LIST></r>','2025-08-31 09:53:26',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (52,37,1,'2025-08-31 16:25:40',1,'comment','<r><p>Недавно створив для свого сервера альтернативну гілку <URL url="/d/7-alfis-dns-rejestraciia-domenu-v-blokcein"><s>[</s>Alfis DNS<e>](/d/7-alfis-dns-rejestraciia-domenu-v-blokcein)</e></URL> з опцією фільтрації вихідних з''єднань (між-пірингової комунікації резольвера) для мережі <URL url="https://github.com/threefoldtech/mycelium"><s>[</s>Mycelium<e>](https://github.com/threefoldtech/mycelium)</e></URL>:</p>

<p><URL url="https://github.com/YGGverse/Alfis/tree/mycelium-network-mode">https://github.com/YGGverse/Alfis/tree/mycelium-network-mode</URL></p>

<p>При використанні цієї гілки, зверніть увагу, що опцію <C><s>`</s>yggdrasil_only<e>`</e></C> перейменовано в <C><s>`</s>yggdrasil_mode<e>`</e></C>, щоб зробити назву логічною для роботи в парі "і".</p>

<p>По суті, нова опція <C><s>`</s>mycelium_mode<e>`</e></C> реалізує те само правило, що й <C><s>`</s>yggdrasil_mode<e>`</e></C> але для <C><s>`</s>0400::/7<e>`</e></C>.</p>

<p>Є також <URL url="https://github.com/Revertron/Alfis/pull/386"><s>[</s>PR#386<e>](https://github.com/Revertron/Alfis/pull/386)</e></URL>, але він поки не включений до основної гілки. Також, я <URL url="https://github.com/Revertron/Alfis/issues/384"><s>[</s>сумніваюсь<e>](https://github.com/Revertron/Alfis/issues/384)</e></URL> в ефективності такої реалізації, але тим не менше, слідував поточній імплементації.</p></r>','2025-08-31 16:37:05',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (53,38,1,'2025-09-02 09:27:16',1,'comment','<r><p><EM><s>_</s>Локальна адаптація моєї статті на <URL url="https://devzone.org.ua/post/misfin-poshtovyy-satelit-geminispace"><s>[</s>DevZone<e>](https://devzone.org.ua/post/misfin-poshtovyy-satelit-geminispace)</e></URL><e>_</e></EM></p>

<p>Про Misfin я знаю давно, декілька разів намагався ним користуватись, але жодного - не доводилось перевірити його в реальних умовах. Зокрема, через брак аудиторії та відсутність такої необхідності в сучасному світі месенджерів, де й сама пошта є епохою динозаврів. Утім, хотілось би трішки освітити цю альтернативну технологію для широкого загалу, адже з протоколом <URL url="http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/gemini_protocol"><s>[</s>Gemini<e>](http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/gemini_protocol)</e></URL> - знайомий не заочно і вже встиг написати для його специфікації, у свій час, повнофункціональний GTK браузер <URL url="https://github.com/YGGverse/Yoda"><s>[</s>Yoda<e>](https://github.com/YGGverse/Yoda)</e></URL> а також ряд <URL url="https://github.com/orgs/YGGverse/repositories?q=gemini"><s>[</s>інших серверних рішень<e>](https://github.com/orgs/YGGverse/repositories?q=gemini)</e></URL> різними мовами.</p>

<p>Протокол доставки повідомлень Misfin - названо на честь космічного проєкту <URL url="https://en.wikipedia.org/wiki/Manned_Space_Flight_Network"><s>[</s>MSFN<e>](https://en.wikipedia.org/wiki/Manned_Space_Flight_Network)</e></URL> і в цілому, він є спробою реалізації мінімалістичної альтернативи класичній пошті e-mail, за образом і подобою концепції протоколу Gemini.</p>

<p>З офіційного маніфесту:</p>

<QUOTE><i>&gt; </i><p>Електронна пошта така ж погана, як і Інтернет. Вона стала складною, захищеною лише за допомогою інших протоколів, які до неї приєднані, і підтримує всі неприємні функції, які є в Інтернеті, такі як Cookies та трекінгові маячки. Ще гірше, що вона зазнає активної ворожості з боку великих гравців Інтернету. Більшість провайдерів блокують трафік на порту 25, і ви не можете доставити пошту до жодного з великих сервісів (як-от Gmail), не проходячи через численні перешкоди - і навіть тоді це лотерея.</p></QUOTE>

<p>Від себе зауважу, що вбачаю в ньому не стільки боротьбу з корпораціями та монополією, але опцію отримувати чистий вміст листів: без розмітки та зайвих заголовків, що можуть бути частиною трекінгу, характерних для сучасного Веб 2.0 та вище. Якщо ж у вас є проблеми з 25 портом чи бажаєте розгорнути повноцінну локальну пошту за NAT, ознайомтесь з наступними матеріалами:</p>
<LIST><LI><s>* </s><URL url="/d/19-nalastuvannia-postovoyi-skrinki-dlia-lokalnix-merez-bez-dns"><s>[</s>Організація поштової скриньки e-mail для локальних мереж без DNS<e>](/d/19-nalastuvannia-postovoyi-skrinki-dlia-lokalnix-merez-bez-dns)</e></URL></LI>
<LI><s>* </s><URL url="/d/5-yggmail-mesendzer-z-postovim-interfeisom"><s>[</s>Yggmail - месенджер з поштовим інтерфейсом<e>](/d/5-yggmail-mesendzer-z-postovim-interfeisom)</e></URL></LI></LIST>

<H2><s>## </s>Реалізація</H2>

<p>На мою думку, Misfin не є альтернативною класичній пошті, це швидше модифікація протоколу відправки даних Titan для Gemini або NPS для <URL url="http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/nex_protocol"><s>[</s>Nex<e>](http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/nex_protocol)</e></URL>, але на відміну від таких, не є частиною інфраструктури жодного з них.</p>

<p>Схоже до Titan, Misfin використовує сервер, який працює на сокеті з виділеним портом (стандартно <C><s>`</s>1958<e>`</e></C>) і отримує на нього дані через обов''язковий шар шифрування TLS. Окрім тексту повідомлень, дані містять мінімалістичні заголовки (які на відміну від Titan, орієнтовані не на файл, а текст) і включають:</p>
<LIST><LI><s>* </s><C><s>`</s>USER_ID<e>`</e></C> - поштова скринька користувача (<C><s>`</s>admin<e>`</e></C>, <C><s>`</s>santa<e>`</e></C> і тд.)</LI>
<LI><s>* </s><C><s>`</s>COMMON_NAME<e>`</e></C> - псевдонім користувача</LI>
<LI><s>* </s><C><s>`</s>SUBJECT_ALT_NAME<e>`</e></C> - хост (<C><s>`</s>example.com<e>`</e></C>, <C><s>`</s>misfin.org<e>`</e></C>, тощо)</LI></LIST>

<p>Сирий рядок запиту виглядатиме як:</p>
<CODE><s>```</s><i>
</i>misfin://mailbox@hostname.com \r\n
Текст повідомлення<i>
</i><e>```</e></CODE>

<p>Відповідь сервера-отримувача при цьому буде такою:</p>
<CODE><s>```</s><i>
</i>20 &lt;fingerprint of the recipient&gt;\r\n<i>
</i><e>```</e></CODE>

<p>Хто вже працював з Gemini, може побачити, що ці протоколи - між собою схожі, як дві краплі води. Більш детально вдаватись в специфікацію тут не буду, вона описана на офіційному сайті (посилання внизу сторінки). Занотую тільки, що наразі існує три базові редакції протоколу:</p>
<LIST><LI><s>* </s><C><s>`</s>A<e>`</e></C> - сама перша, рання офіційна редакція (наразі вважається архівною)</LI>
<LI><s>* </s><C><s>`</s>B<e>`</e></C> - друга офіційна редакція протоколу, що включає корекції <C><s>`</s>A<e>`</e></C></LI>
<LI><s>* </s><C><s>`</s>C<e>`</e></C> - після релізу версії <C><s>`</s>B<e>`</e></C> його автор (Лем) на деякий час пропав з радарів, тому декілька користувачів не дочекавшись випустили версію <C><s>`</s>C<e>`</e></C>, яка збільшує довжину повідомлення та включає деякі оптимізації, що стосуються формату заголовків</LI></LIST>

<p>Наскільки мені відомо, автор редакцій <C><s>`</s>A<e>`</e></C> і <C><s>`</s>B<e>`</e></C> згодом вийшов на зв''язок та збирався включити редакцію <C><s>`</s>C<e>`</e></C> в офіційну специфікацію, але потім зник. Формально, протоколи <C><s>`</s>B<e>`</e></C> і <C><s>`</s>C<e>`</e></C> є сумісними, а новий софт пишеться з урахуванням специфікації останнього. Тому майте на увазі цю невеличку історію. Більше про неї вам розкаже один з учасників цього процесу - [@clseibold](gemini://bbs.geminispace.org/u/clseibold).</p>

<H2><s>## </s>Програмне забезпечення</H2>

<p>Для доставки пошти, передбачається класична пара клієнт-сервер, при цьому для сервера відкривається вказаний в його налаштуваннях порт TCP:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ufw allow 1958/tcp<i>
</i><e>```</e></CODE>

<H3><s>### </s>Сервер</H3>

<p>Є різні реалізації, але мені відомо про щонайменше дві стабільні:</p>
<LIST><LI><s>* </s><URL url="https://sr.ht/~nixgoat/estampa/"><s>[</s>estampa<e>](https://sr.ht/~nixgoat/estampa/)</e></URL> - Rust</LI>
<LI><s>* </s><URL url="https://gitlab.com/clseibold/misfin-server"><s>[</s>misfin-server<e>](https://gitlab.com/clseibold/misfin-server)</e></URL> - Go</LI></LIST>

<H4><s>#### </s>estampa</H4>

<p>Так як сам розробляю програмне забезпечення на Rust, для себе обрав <C><s>`</s>estampa<e>`</e></C>. Встановлюється цей сервер наступним чином:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>git clone https://git.sr.ht/~nixgoat/estampa
cd estampa
cargo build --release
install target/release/estampa /usr/local/bin/estampa<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>останньою командою ми встановлюємо <C><s>`</s>estampa<e>`</e></C> до канонічного розташування бінарних програм Linux, для подальшої роботи сервера з <C><s>`</s>systemd<e>`</e></C>; якщо ви не плануєте встановлення, цей крок можна пропустити і пускатись через звернення до <C><s>`</s>target/release/estampa<e>`</e></C></LI>
<LI><s>* </s>для першої збірки програм на Rust, дивіться <URL url="/d/15-vstanovlennia-ostannyoyi-versiyi-rust-v-linux"><s>[</s>Встановлення останньої версії Rust в Linux<e>](/d/15-vstanovlennia-ostannyoyi-versiyi-rust-v-linux)</e></URL></LI></LIST>

<p>У поточній теці проєкту, відкриваємо файл конфігурації <C><s>`</s>nano config.toml<e>`</e></C> та додаємо в кінці поштові скриньки користувачів:</p>

<CODE lang="config.toml"><s>``` config.toml</s><i>
</i>[mailbox.user1]
enabled = true
name = "user 1"

[mailbox.user2]
enabled = true
name = "user 2"<i>
</i><e>```</e></CODE>

<p>Опціонально, можна вказати й інші налаштування (якщо плануєте запуск від <C><s>`</s>systemd<e>`</e></C>) але я лишив стандартно. Далі, сервер запускається командою:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>estampa<i>
</i><e>```</e></CODE>

<p>При першому запуску, у поточній теці буде згенеровано сертифікат сервера TLS (такий само як для сервера Gemini) - <C><s>`</s>server.crt<e>`</e></C> і <C><s>`</s>server.key<e>`</e></C>, у цій же теці буде створено файлову структуру для збереження листів, за адресою в прикладі це буде:</p>

<CODE><s>```</s><i>
</i>store/
    certs/
        user1.pem
        user2.pem
        priv/
            user1.pem
            user2.pem
    mbox/
        user1/
        user2/<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>таким чином, при отриманні листів, вони будуть зберігатись у теці <C><s>`</s>store/mbox/user/*.gmi<e>`</e></C></LI></LIST>

<H5><s>##### </s>systemd</H5>

<p>Публічний сервер можна (і варто) запускати від окремого користувача <C><s>`</s>useradd -m estampa<e>`</e></C>:</p>

<CODE><s>```</s><i>
</i># /etc/systemd/system/estampa.service
[Unit]
After=network-online.target
Wants=network-online.target

[Service]
Type=simple

User=estampa
Group=estampa

# Якщо в конфігурації вказано відносні шляхи до сховища та сертифікатів,
# важливо вказати шлях до робочої теки:
# WorkingDirectory=/path/to/working/directory

ExecStart=/usr/local/bin/estampa

# Вкажіть null якщо не бажаєте журналювати роботу сервера
StandardOutput=file:/home/estampa/debug.log
StandardError=file:/home/estampa/error.log

[Install]
WantedBy=multi-user.target<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>systemctl daemon-reload<e>`</e></C> - оновити конфігурацію</LI>
<LI><s>* </s><C><s>`</s>systemctl enable estampa<e>`</e></C> - автостарт при запуску системи</LI>
<LI><s>* </s><C><s>`</s>systemctl start estampa<e>`</e></C> - запуск</LI>
<LI><s>* </s><C><s>`</s>systemctl status estampa<e>`</e></C> - перевірити статус</LI></LIST>

<H3><s>### </s>Клієнт</H3>

<p>Наразі, я не знайшов готового рішення для десктоп чи мобільних платформ, як це можна було б очікувати від класичного поштового клієнта. Натомість, листи що надходять - складаються в файлову систему, з розширенням <C><s>`</s>.gmi<e>`</e></C> (Gemtext) і читаються вручну. Можливо, колись таки зроблю повноцінний GUI клієнт зі сповіщеннями і .. блек джеком, а наразі - маємо наступні опції:</p>

<H4><s>#### </s>Lagrange</H4>

<p>Найпростіший спосіб відправити листа - зробити це через GUI браузер <URL url="https://gmi.skyjake.fi/lagrange/"><s>[</s>Lagrange<e>](https://gmi.skyjake.fi/lagrange/)</e></URL> (адже з вірогідністю 99% ви будете користуватись саме ним).</p>

<p>Для цього потрібно відкрити в основному меню <C><s>`</s>Identity<e>`</e></C> &gt; <C><s>`</s>Import<e>`</e></C> та додати сертифікат (я просто зкопіював туди згенерований сертифікат одного з юзерів <C><s>`</s>store/certs<e>`</e></C>). Після цього, в боковому меню <C><s>`</s>Identities<e>`</e></C> (<C><s>`</s>Ctrl<e>`</e></C>+<C><s>`</s>4<e>`</e></C>) на імпортованому сертифікаті правою кнопкою миші відкриваємо контекстне меню та шукаємо пункт <C><s>`</s>Send mail as...<e>`</e></C>, пишемо адресу отримувача, повідомлення та тиснемо кнопку <C><s>`</s>Send<e>`</e></C>.</p>

<H4><s>#### </s>CLI</H4>

<p>У якості клієнта, можна використовувати командний рядок, засобами утиліт, які розраховані на відправлення даних через сокет з шаром SSL:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>echo -e "misfin://test@localhost &lt; test@localhost2 Test \r\nMESSAGE" | openssl s_client -connect localhost:1958 -cert /path/to/cert.pem -key /path/to/key.pem -ign_eof<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>вказуючи <C><s>`</s>&lt; test@localhost2<e>`</e></C> ми додаємо відправника і підписуємо його <C><s>`</s>/path/to/cert.pem<e>`</e></C> і <C><s>`</s>/path/to/key.pem<e>`</e></C> з набору згенерованих скриньок, що вказані в прикладі <C><s>`</s>estampa<e>`</e></C>, тобто лежать вони в <C><s>`</s>store/certs/*<e>`</e></C> (запуск окремого сервера <C><s>`</s>localhost2<e>`</e></C> не потрібен)</LI>
<LI><s>* </s>згідно [специфікації](gemini://misfin.org/specification.gmi), тут важливо зберегти пробіл перед <C><s>`</s>\r\n<e>`</e></C> інакше буде помилка <C><s>`</s>59<e>`</e></C></LI>
<LI><s>* </s>нагадаю, що для сумісності з редакцією <C><s>`</s>B<e>`</e></C>, максимальна довжина повідомлення разом із заголовком, повинна складати не більше <C><s>`</s>2048<e>`</e></C> байт</LI>
<LI><s>* </s>при успішному відправленні, як і у випадку з Gemini, має бути код <C><s>`</s>20<e>`</e></C> (успішно)</LI></LIST>

<H2><s>## </s>Висновки</H2>

<p>Як писав вище, я не вважаю даний експеримент заміною e-mail, адже той пройшов довгий шлях еволюції і став таким в умовах промислової реальності. Misfin, може стати хіба що базою для альтернативного обміну повідомленнями в локальних мережах або для спілкування з друзями-гіками, особливо, якщо ви - користувач CLI (хоча й тут, мабуть я обрав би комунікацію сокетами через <C><s>`</s>telnet<e>`</e></C> або IRC).</p>

<p>Тут також немає відповіді на питання щодо боротьби з потенційним спамом, але як вказано на офіційному сайті, в Geminispace це явище майже відсутнє через малу популярність протоколів сімейства Gopher.</p>

<H2><s>## </s>Посилання</H2>

<p>Надаю список локальних ресурсів, адже веб-дзеркала для них не знаю. Відкрити ці посилання можна у будь якому <URL url="https://github.com/kr1sp1n/awesome-gemini#clients"><s>[</s>браузері для протоколу Gemini<e>](https://github.com/kr1sp1n/awesome-gemini#clients)</e></URL>. Посилання також мають відкриватись, якщо відповідний браузер вже встановлено.</p>

<LIST><LI><s>* </s>[Офіційний сайт](gemini://misfin.org/)</LI>
<LI><s>* </s>[Група Misfin на BBS](gemini://bbs.geminispace.org/s/misfin)</LI></LIST></r>',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (54,39,1,'2025-09-02 12:54:57',1,'comment','<r><p>В мережі Yggdrasil функціонує локальний сервіс:</p>

<LIST><LI><s>* </s>Hubzilla</LI>
<LI><s>* </s>PeerTube</LI>
<LI><s>* </s>ChatMail (DeltaChat)</LI>
<LI><s>* </s>Matrix</LI></LIST>

<p>Реєстрація відкрита для всіх охочих, за умов дотримання правил даної спільноти:<br/>
<URL url="http://[300:f6b4:97af:dfc3::1]/page/twinkle/welcome-ua"><s>[</s>http://[300:f6b4:97af:dfc3::1]/page/twinkle/welcome-ua<e>](http://[300:f6b4:97af:dfc3::1]/page/twinkle/welcome-ua)</e></URL></p></r>','2025-09-02 12:55:27',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (55,40,1,'2025-09-02 18:22:08',1,'comment','<r><p>Запустив для себе цей експериментальний, чистий від розмітки формат <URL url="http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/nex_protocol"><s>[</s>Nex<e>](http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/nex_protocol)</e></URL>/Gemtext.</p>

<p>На даний момент, функціонують наступні фіди (оновлюються щогодини)</p>

<LIST><LI><s>* </s><C><s>`</s>nex://[302:68d0:f0d5:b88d::feed]/<e>`</e></C> - Yggdrasil</LI>
<LI><s>* </s><C><s>`</s>nex://[505:6847:c778:61a1::feed]/<e>`</e></C> - Mycelium</LI></LIST>

<p>Нагадаю, що в Geminispace є опція <URL url="http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/gemini_protocol#gemfeed"><s>[</s>Gemfeed<e>](http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/gemini_protocol#gemfeed)</e></URL>, але особисто я - читаю вручну.</p>

<p>Огляд конфігурації на <URL url="https://devzone.org.ua/post/rssto-konvertatsiia-fidiv-u-rizni-formaty"><s>[</s>DevZone<e>](https://devzone.org.ua/post/rssto-konvertatsiia-fidiv-u-rizni-formaty)</e></URL>.</p>

<p>UPD. <URL url="/d/90-rss-censornet-dlia-gemini-protocol-i2p"><s>[</s>переїхав на I2P<e>](/d/90-rss-censornet-dlia-gemini-protocol-i2p)</e></URL></p></r>','2025-10-19 23:14:25',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (56,41,1,'2025-09-05 10:33:32',1,'comment','<r><p><URL url="/d/25-vtracker-lokalnii-bittorrent-treker"><s>[</s>βtracker<e>](/d/25-vtracker-lokalnii-bittorrent-treker)</e></URL> розроблявся з метою створити автоматизований трекер, а не ручний каталог, який потребував би модерації та багато часу на оформлення роздач. Але згодом в ньому була помічена одна незручність: словник заголовків BitTorrent не передбачає передачу мета-коментарів для резольву через хеш.</p>

<p>Таким чином, ми не можемо отримати в каталозі більше інформації, окрім тієї, що міститься в назві файлу. Але всього до назви не впихнеш. Я так подумав, що було б зручно створювати торент не на файл, а теку, додавши поряд з основним файлом якийсь текстовий README. Так як βtracker вміє резольвити вміст по MIME (що включає <C><s>`</s>txt<e>`</e></C>, <C><s>`</s>log<e>`</e></C> та інші розширення), можна з його допомогою дізнатись усі подробиці: звідки взято файл для роздачі, його дамп конвертації або приклад команди того ж <C><s>`</s>yt-dlp<e>`</e></C>.</p>

<p>Так що не все так погано, бо я вже думав що агрегація це гиблий номер. Спробую так організувати наступні свої роздачі. Можливо згодом зроблю коментарі, але поки не планую через відсутність аудиторії.</p></r>','2025-09-05 10:46:28',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (57,42,1,'2025-09-07 11:57:29',1,'comment','<r><p>Після приблизно п''яти місяців свого експерименту зародити локальне сузір''я Yggdrasil, постійної мороки з вирішенням проблем інтеграції Snac та не вдалої спроби його апгрейду, вирішив таки припинити це безтолкове заняття.</p>

<p>Пишу цей пост для історії, якщо хтось захоче зайнятись подібним:</p>
<LIST><LI><s>* </s>протокол ActivityPub залежний від конкретної мережі: ви постійно матимете мороку з серверами що намагаються міксувати з''єднання на різні мережі (та сама картина що з проксі Invidious де частина трафіку йде через ygg а частина намагається пройти через Веб). тобто юзер налаштував собі інший конфіг і в його стрічці присутні інші мережі, які у вас тупо не працюють або блокуються з PAC</LI>
<LI><s>* </s>жорстка прив''язка до хост ID: вам потрібно обрати один хост, якщо це yggdrasil то ніхто окрім yggdrasil його не побачить (якщо не казати про веб-проксі фронтенду а саме сервер сайд); якщо це Alfis, то ваші сусіди повинні також ним користуватись</LI>
<LI><s>* </s>мало юзерів: їх тут за час мого перебування було два, при чому географічно далеких та мені не цікавих за тематикою, вся тусовка федіверс - живе в інтернеті</LI>
<LI><s>* </s>хоч для мене є зрозумілою, але не сподобалась модель протоколу ActivityPub - надсилати оновлення фоловерам, замість того щоб вони ходили за ними самі (на прикладі RSS). мій сервер блокує вихідний трафік на інші мережі, а Snac постійно намагається кудись конектитись, це тягне купу часу з дослідженнями та фіксами в рамках форку рушія, що мені робити набридло</LI></LIST>

<p>Інші думки та досвід з розгортання - читайте на цьому форумі, повторюватись вже не буду.</p>

<p>Сам я здампив дані утилітою <URL url="https://crates.io/crates/snac2nex"><s>[</s>snac2nex<e>](https://crates.io/crates/snac2nex)</e></URL> та переїхав на протокол Nex, який в мене без головняка працює на всі мережі без гемору з JSON, HTTP та іншим трешем. Знаходиться він тут, кому цікаво:</p>

<CODE><s>```</s><i>
</i>nex://[302:68d0:f0d5:b88d::b] | nex://ps.ygg
nex://[505:6847:c778:61a1::b]<i>
</i><e>```</e></CODE></r>','2025-09-07 12:01:27',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (58,43,1,'2025-09-07 12:34:22',1,'comment','<r><p>На форумі запрацювала нова рубрика <URL url="/t/file"><s>[</s>Файли<e>](/t/file)</e></URL>.</p>

<p>Ідея в тому, щоб ділитись тут перевіреними файлами, торент-роздачами з описами для них а також коментарями та питаннями. Думав назвати тегом BitTorrent, але шейринг файлів може бути через FTP тощо.</p>

<p>Створив її тому, що періодично викладаю на βtracker торенти з українською озвучкою (які не маю бажання релізити в Інтернет через упороті правила щодо їх оформлення там, мені це не цікаво - там є окрема спільнота що цим живе та займається). Тут же я просто хочу створити певну колекцію, можливо колись переросте в якийсь локальний трекер.</p></r>','2025-09-07 12:35:53',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (59,44,1,'2025-09-07 12:43:11',1,'comment','<r><p>Перший "млин комом", але створив і поки стою на роздачі наступних серій:</p>
<LIST start="5" type="decimal"><LI><s>5. </s><p><C><s>`</s>4a9045c59e3b3e92ab33e7c9ef5e78a3d8bae8c3<e>`</e></C></p></LI>
<LI><s>6. </s><p><C><s>`</s>9a3fb79f999d32e0c364355072a08e8d7b7d961e<e>`</e></C></p></LI>
<LI><s>7. </s><p><C><s>`</s>eaf939ddbb6c037f145ef8a7280476ffdfe7dd45<e>`</e></C></p></LI>
<LI><s>8. </s><p><C><s>`</s>07218194285720ebff4035a55a97c4ba347936de<e>`</e></C></p>

 <p><URL url="/d/62-lokalni-trekeri-bittorrent"><s>[</s>трекери<e>](/d/62-lokalni-trekeri-bittorrent)</e></URL></p></LI></LIST>

<p>Це веб-дампи української доріжки (376) утилітою <URL url="/d/27-zavantazennia-video-z-saitiv-rezka-hd-cerez-plagin-yt-dlp"><s>[</s>yt-dlp<e>](/d/27-zavantazennia-video-z-saitiv-rezka-hd-cerez-plagin-yt-dlp)</e></URL>. Починаючи з 6 серії, також додаю до роздач <URL url="/d/41-dumki-stosovno-oformlennia-torentiv-na-vtracker"><s>[</s>info.txt<e>](/d/41-dumki-stosovno-oformlennia-torentiv-na-vtracker)</e></URL></p>

<p>У цій же темі буду публікувати анонси інших серій. Так як слідкую за цим серіалом і не чекаю його релізів на Толоці, ймовірно він буде найсвіжішою роздачею з поміж існуючих.</p>

<p>Чи формуватиму повну серію в окремий торент - ще не знаю, маю трабли з дисковим простором. Але якщо ви хочете відео без азіно та іншої мури, качайте, дивлюсь опубліковані серії особисто.</p>

<p>UPD. роздачу завершено.</p></r>','2025-09-28 10:50:08',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (61,42,2,'2025-09-07 13:20:39',1,'discussionTagged','[[1],[1,2]]',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (62,45,1,'2025-09-09 10:45:21',1,'comment','<r><p>Довго писати не буду, може колись нашкребу окремим матеріалом:</p>

<LIST><LI><s>* </s>gemini://tracker.ygg</LI>
<LI><s>* </s>gemini://[302:68d0:f0d5:b88d::fdb]</LI></LIST>

<p>Код (Rust) і скріншоти версії <C><s>`</s>0.1.0<e>`</e></C>:<br/>
<URL url="https://github.com/YGGverse/btracker-gemini/wiki/Screenshots">https://github.com/YGGverse/btracker-gemini/wiki/Screenshots</URL></p>

<p>По суті, це окремий сервер, який виступає дзеркалом для спільної з веб-каталогом бази:</p>

<LIST><LI><s>* </s><URL url="http://tracker.ygg">http://tracker.ygg</URL></LI>
<LI><s>* </s>http://[302:68d0:f0d5:b88d::fdb]</LI></LIST>

<p>Працює він так само на базі файлового індексу <URL url="https://github.com/YGGverse/aquatic-crawler"><s>[</s>aquatic-crawler<e>](https://github.com/YGGverse/aquatic-crawler)</e></URL>, тому дана реалізація є вершиною айсбергу з купи додаткових проєктів, які може згодом об''єднаю в один контейнер. В цілому, версія Gemini - повністю перекриває функції веб-каталогу: скрапер, попередній перегляд дозволених медіа файлів, пошук, пагінація.</p></r>','2025-09-21 01:27:00',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (63,46,1,'2025-09-11 12:39:49',1,'comment','<r><p>Так як давно не в захваті від сучасного Веб (власне як і від альтернатив типу Gemini де редагування постів - те ще пекло) в мене давно гуляє думка а чи не створити багатокористувацький сервер FTP, де зареєстровані юзери могли б ділитись різними даними - нотатками в зручному форматі от як <C><s>`</s>md<e>`</e></C>, торентами, різними медіа в межах можливостей такого серверу.</p>

<p>Я ще поки до запуску не готовий і не знаю чи взагалі є сенс в цій спільноті як такій, коли всі побігли в телеграми, але попередньо ідея така. Пишіть, якщо цікаво. Колись в мережі Yggdrasil був анонімний сервер FTP, особисто мені - там було цікаво але він давно офлайн.</p></r>','2025-09-11 12:43:30',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (64,47,1,'2025-09-11 19:13:30',1,'comment','<r><p>Я мало комунікую в мережі Інтернет, але періодично зустрічаю цікаві (на мою думку) ресурси. Тому думаю створити невеличкий список, може кому буде цікаво.</p>

<LIST><LI><s>* </s><URL url="https://exception.net.ua">https://exception.net.ua</URL> - різні нотатки з системного адміністрування, наскільки мені відомо є можливість вносити свої <URL url="https://github.com/uanet-exception/exception.net.ua/pulls"><s>[</s>контрибуції<e>](https://github.com/uanet-exception/exception.net.ua/pulls)</e></URL></LI>
<LI><s>* </s><URL url="https://bebyx.co.ua">https://bebyx.co.ua</URL> - ламповий бложик технічного профілю, знайшов шукаючи інформацію про <URL url="https://bebyx.co.ua/log/gopher-ua.html"><s>[</s>Gopher<e>](https://bebyx.co.ua/log/gopher-ua.html)</e></URL></LI>
<LI><s>* </s><URL url="https://devzone.org.ua/member/ps">https://devzone.org.ua/member/ps</URL> - на цікавість не претендую, але свого сайту я не маю і періодично пишу деякі нотатки там (паралельно ще маю портовану версію gemini://ps.cities.yesterweb.org/uk) суміжно ділюсь посиланням і на ресурс DevZone, схоже метою якого була спроба створити локальний Хабр, але далі рушія там діло не пішло, адже подібна робота вимагає менеджменту і активного просування. Як платформу для дописів обрав його тому, що просто знайшов в Google, там був живий адмін і темна тема оформлення :)</LI>
<LI><s>* </s><URL url="https://linuxguide.rozh2sch.org.ua">https://linuxguide.rozh2sch.org.ua</URL> - Доволі якісна HTML книга про Linux</LI>
<LI><s>* </s><URL url="https://slovotvir.org.ua">https://slovotvir.org.ua</URL> - називають собачку <C><s>`</s>@<e>`</e></C> равликом</LI>
<LI><s>* </s><URL url="https://ebookfoundation.github.io/free-programming-books">https://ebookfoundation.github.io/free-programming-books</URL> - колекція включає ряд україномовних ресурсів ІТ: включно з книжками та медіа, варто покопатись щоб не писати все тут</LI>
<LI><s>* </s><URL url="https://github.com/pavloslav/RustBookUkr">https://github.com/pavloslav/RustBookUkr</URL> | <URL url="https://github.com/rust-lang-ua/rustbook_ukrainian">https://github.com/rust-lang-ua/rustbook_ukrainian</URL> - два окремих підручника про Rust українською (на базі mdBook), але я до кінця не второпав хто кого форкнув: тексти різні</LI>
<LI><s>* </s><URL url="https://www.linuxmint.com.ua">https://www.linuxmint.com.ua</URL> - Українська спільнота Linux Mint: знаю давно але зареєструвався тільки днями, в пошуках однодумців; для мене навіть люб''язно додали темну тему оформлення, дякую!</LI>
<LI><s>* </s><URL url="https://joomla-ua.org">https://joomla-ua.org</URL> - сучасний і стильний довгожитель, відомий також перекладами відкритого Веб-софту</LI>
<LI><s>* </s><URL url="https://opencartforum.com">https://opencartforum.com</URL> - ще один старий спеціалізований на CMS форум, зі своєю історією</LI>
<LI><s>* </s><URL url="https://prolinux.pp.ua">https://prolinux.pp.ua</URL> - затишний авторський блог про Linux, роботу над яким <URL url="https://prolinux.pp.ua/news/prolinuxua-stopped.html"><s>[</s>призупинено<e>](https://prolinux.pp.ua/news/prolinuxua-stopped.html)</e></URL></LI>
<LI><s>* </s><URL url="https://toloka.to">https://toloka.to</URL> - цей ресурс додам, так як вважаю BitTorrent сегмент не просто ІТ, а субкультурою</LI>
<LI><s>* </s><URL url="https://linux.org.ua">https://linux.org.ua</URL> - старий сайт, адмін схоже технарь, майже щодня постить нотатки з опенсорс</LI></LIST>

<p>В мене також є ряд нині архівних україномовних проєктів але зараз не опублікую з певних міркувань. Якщо маєте щось цікаве - не соромтесь поділитись!</p></r>','2025-11-01 10:53:36',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (65,48,1,'2025-09-11 20:52:27',1,'comment','<r><p>Для тих, хто цікавиться географією своїх роздач, нагадаю, що для Transmission існує окрема <URL url="https://github.com/365andreas/transmission/tree/country-flags"><s>[</s>гілка<e>](https://github.com/365andreas/transmission/tree/country-flags)</e></URL>. Вона поки не змержена в апстрім і є частиною <URL url="https://github.com/transmission/transmission/pull/7171"><s>[</s>PR#7171<e>](https://github.com/transmission/transmission/pull/7171)</e></URL>.</p>

<p>Що там відбувається - не знаю, але для себе її успішно зібрав і користуюсь вже тривалий час. По суті, вона додає колонку Geo-IP до вікна властивостей роздачі (таб <C><s>`</s>Peers<e>`</e></C>). На момент допису, останнє оновлення було внесене 2 місяці тому, отже гілка є актуальною.</p>

<p>Процес збірки на Fedora 42 / GNOME 48 виглядає наступним чином:</p>

<LIST type="decimal"><LI><s>1. </s><C><s>`</s>sudo dnf remove transmission transmission-gtk<e>`</e></C> - видаляємо, якщо встановлено з <C><s>`</s>dnf<e>`</e></C>/<C><s>`</s>yum<e>`</e></C></LI>
<LI><s>2. </s><C><s>`</s>sudo dnf install gtkmm4.0-devel<e>`</e></C> - додатково поставив тільки API фреймворку <URL url="https://gtkmm.gnome.org/en/"><s>[</s>gtkmm<e>](https://gtkmm.gnome.org/en/)</e></URL> v4</LI>
<LI><s>3. </s><C><s>`</s>git clone --recurse-submodules https://github.com/365andreas/transmission.git<e>`</e></C></LI>
<LI><s>4. </s><C><s>`</s>cd transmission<e>`</e></C></LI>
<LI><s>5. </s><C><s>`</s>git checkout country-flags<e>`</e></C> - обираємо гілку, що включає функціональність Geo-IP</LI>
<LI><s>6. </s><C><s>`</s>git submodule update --init --recursive<e>`</e></C> - ініціюємо локальні залежності</LI>
<LI><s>7. </s><C><s>`</s>cmake -B build -DCMAKE_BUILD_TYPE=RelWithDebInfo -DENABLE_GTK=ON<e>`</e></C>
    <LIST><LI><s>* </s><C><s>`</s>-DENABLE_TESTS=OFF<e>`</e></C> - не бажано, але тести можна вимкнути для швидкої компіляції</LI>
    <LI><s>* </s><C><s>`</s>-DENABLE_MAC=OFF<e>`</e></C> - за що відповідає не знаю, лишив як в сказано в доках</LI>
    <LI><s>* </s><C><s>`</s>-DCMAKE_BUILD_TYPE=Release<e>`</e></C> - додав, бо не планую нічого дебажити</LI></LIST></LI>
<LI><s>8. </s><C><s>`</s>cd build<e>`</e></C></LI>
<LI><s>9. </s><C><s>`</s>cmake --build .<e>`</e></C>
    <LIST><LI><s>* </s>можна додатково вказати <C><s>`</s>-j N<e>`</e></C> - де <C><s>`</s>N<e>`</e></C> кількість потоків / ядер для збірки</LI>
    <LI><s>* </s>якщо на цьому етапі у вас помилка з <C><s>`</s>Glib::FileTest::EXISTS<e>`</e></C>, то вам <URL url="https://github.com/transmission/transmission/pull/7171#issuecomment-3082171771"><s>[</s>сюди<e>](https://github.com/transmission/transmission/pull/7171#issuecomment-3082171771)</e></URL></LI></LIST></LI>
<LI><s>10. </s><C><s>`</s>sudo cmake --install .<e>`</e></C></LI></LIST>

<p>Це приклад для першої збірки, якщо ви оновлюєтесь, в README є окремі <URL url="https://github.com/transmission/transmission#building-transmission-from-git-updating"><s>[</s>команди<e>](https://github.com/transmission/transmission#building-transmission-from-git-updating)</e></URL>.</p>

<p>Після встановлення має з''явитись значок в меню програм GNOME. Якщо цього не сталося - перевірте наявність лаунчера <C><s>`</s>/usr/local/share/applications/transmission-gtk.desktop<e>`</e></C> (це стандартна локація для <C><s>`</s>CMAKE_INSTALL_PREFIX<e>`</e></C>)</p>

<p>Скинути кеш можна командою:</p>
<CODE><s>```</s><i>
</i>update-desktop-database /usr/local/share/applications<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>у вас цей шлях може бути іншим, наприклад <C><s>`</s>~/.local/share/applications<e>`</e></C></LI></LIST>

<p>Окремо варто зауважити, що деякі трекери можуть блокувати альфа-збірки з репозиторію по заголовкам. Наскільки це актуально - я не знаю, але ID можна змінити у файлі <URL url="https://github.com/transmission/transmission/issues/592#issuecomment-629732570"><s>[</s>version.h<e>](https://github.com/transmission/transmission/issues/592#issuecomment-629732570)</e></URL>.</p>

<p>Ну власне й все. Я думаю що дану модифікацію рано чи пізно буде додано то наступної версії, адже в qBittorrent така опція вже давно постачається з коробки, до того ж там є прапорці країн.</p>

<p><EM><s>_</s><URL url="https://devzone.org.ua/post/heo-lokatsiia-piriv-dlia-transmission-gtk"><s>[</s>Інтернет-версія цього матеріалу на DevZone<e>](https://devzone.org.ua/post/heo-lokatsiia-piriv-dlia-transmission-gtk)</e></URL><e>_</e></EM></p></r>','2025-09-12 17:30:21',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (66,49,1,'2025-09-11 21:41:14',1,'comment','<r><p>Я знаю, що тема вибору рушія для форуму й досі актуальна для адмінів, тому лишу деякі спостереження після свого першого досвіду користування ним впродовж місяця.</p>

<H2><s>## </s>Сподобалося</H2>

<LIST><LI><s>* </s>Мінімалістичний. Якщо порівнювати з популярним <URL url="https://www.discourse.org"><s>[</s>Discourse<e>](https://www.discourse.org)</e></URL> - я не втопився в налаштуваннях, а також не мучусь з усіляким задротним JS типу кастомних <C><s>`</s>Ctrl+F<e>`</e></C> (та їх вимиканням)</LI>
<LI><s>* </s>Зручно писати довгі дописи, статті. Усі навороти організовані модулями, я просто вимкнув <URL url="https://uk.wikipedia.org/wiki/BBCode"><s>[</s>BBCode<e>](https://uk.wikipedia.org/wiki/BBCode)</e></URL> і лишив <URL url="https://uk.wikipedia.org/wiki/Markdown"><s>[</s>Markdown<e>](https://uk.wikipedia.org/wiki/Markdown)</e></URL>, тому усі мої попередні дописи вдалося просто портувати. Також тут зручна форма редагування: вона влаштована так, що вікно можна просто масштабувати, при цьому текст вирівняно до ширини реального блоку стандартної теми; оновлення існуючого блоку відбувається прямо під час написання.</LI>
<LI><s>* </s>Правильна архітектура на базі <URL url="https://symfony.com"><s>[</s>Symfony<e>](https://symfony.com)</e></URL> / <URL url="https://laravel.com"><s>[</s>Laravel<e>](https://laravel.com)</e></URL>: це значить що тут використовуються промислові, перевірені часом стандарти, а не самопал. Це трохи ускладнює модифікації в плані часових витрат на розгортання середовища але воно того варте, плюсую.</LI>
<LI><s>* </s>Є більш-менш робочий сценарій перегляду форуму без JavaScript. Це може бути зручно для користувачів Інтернет в плані <URL url="https://uk.wikipedia.org/wiki/%D0%9E%D0%BF%D1%82%D0%B8%D0%BC%D1%96%D0%B7%D0%B0%D1%86%D1%96%D1%8F_%D0%B4%D0%BB%D1%8F_%D0%BF%D0%BE%D1%88%D1%83%D0%BA%D0%BE%D0%B2%D0%B8%D1%85_%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC"><s>[</s>SEO<e>](https://uk.wikipedia.org/wiki/Оптимізація_для_пошукових_систем)</e></URL> просування а також альт-мереж, в плані приватності - бо тут часто зустрічаються садомазохісти що орієнтуються без <DEL><s>~~</s>світла<e>~~</e></DEL> JS.</LI>
<LI><s>* </s>Адаптивність: підтримка мобільних пристроїв і світла/темна теми з коробки (для другої версії рушія) - останнє це суб''єктивно важливий фактор на мої "професійні" очі.</LI></LIST>

<H2><s>## </s>Не сподобалося</H2>

<LIST><LI><s>* </s>Повільний. Реально настільки, що я спочатку не розумів які такі функції працюють на бекграунді, але вимкнувши дебаг режим, інших не знайшов. Тут можна грішити на SSD і той факт, що я не налаштував сесії в пам''яті, але в мене на цьому ж диску працює <URL url="/d/25-vtracker-lokalnii-bittorrent-treker"><s>[</s>βtracker<e>](/d/25-vtracker-lokalnii-bittorrent-treker)</e></URL>, який швиденько собі шукає по нинішнім 500 торентам, враховуючи час на bencode парсинг, scrape та повнотекстовий пошук файлів, яких там буває до десятка тисяч на торент. Не знаю коротше, поки загадка для мене.</LI>
<LI><s>* </s>Немає RSS з коробки. Це сабж другої версії рушія, котру я поставив від балди як "профі" не боючись бета-тестів і можливих доопрацювань - я потім не хочу мігрувати, мені простіше почати з другої. Отже, я <URL url="https://discuss.flarum.org/d/38016-rss-feed-for-v2"><s>[</s>поцікавився<e>](https://discuss.flarum.org/d/38016-rss-feed-for-v2)</e></URL> сабжем, та зрозумів, що адміни ультра-модні, RSS для них вже не камільфо - враховуйте.</LI>
<LI><s>* </s>Немає української локалізації і покищо хз як натягнути першу версію локалізацію рушія на другу, хоча б частково, я думаю там має бути спільний скелет. Майнейнеру на моє питання - <URL url="https://discuss.flarum.org/d/31921-ukrainian-language-pack-for-flarum/54"><s>[</s>пофіг<e>](https://discuss.flarum.org/d/31921-ukrainian-language-pack-for-flarum/54)</e></URL>.</LI>
<LI><s>* </s>Налаштування теми. Зокрема - теґів: тут якийсь фільтр палітри, дрочусь і по цей день: бо в темній темі одне а в світлій інше. Утім, це не є великою траблою якщо зайнятись питанням фундаментально.</LI>
<LI><s>* </s>Хоч і наявне сховище файлів для аватарок, не можливо просто додати вкладення до повідомлення, тому наприклад, далекі від технічних приколів адміни сусіднього форуму <C><s>`</s>zabytki.in.ua<e>`</e></C> - публікують історичні фото на сторонніх сервісах, типу <C><s>`</s>twimg.com<e>`</e></C> (про що я їм своєчасно <URL url="https://zabytki.in.ua/community/d/618-zovnisnye-sxovishhe-dlya-zobrazen"><s>[</s>нагадав<e>](https://zabytki.in.ua/community/d/618-zovnisnye-sxovishhe-dlya-zobrazen)</e></URL>)</LI>
<LI><s>* </s>З коробки немає функціональності відтермінованих дописів, чернеток та автозбереження, що б могло бути зручним в локальних умовах перебоїв з живленням.</LI>
<LI><s>* </s>Немає підтримки альтернативних URL парсером Markdown, зокрема - сирих IPv6 і усіляких протоколів (схем) Gemini, Nex тощо: й досі вісять не клікабельні лінки, знаю, але фікситиму потім - тут в нас під капотом патерни Symfony / Laravel.</LI>
<LI><s>* </s>Немає підтримки кастомних E-mail та альтернативної системи авторизації зокрема. Є окремі модулі OAuth, але в рамках цієї спільноти не актуально. Думаю, це частково вирішується модулями але з побаченого я зустрів залежність від констант <URL url="https://www.php.net/manual/en/function.filter-var.php"><s>[</s>filter_var<e>](https://www.php.net/manual/en/function.filter-var.php)</e></URL> аж на рівні хвалених вище компонентів Symfony. Також є науково-популярні рішення від типових веб-розробників, які мені замість дебатів, таки довелось просто вирішити для себе <URL url="https://github.com/YGGverse/flarum-framework/commit/bd421ee6604b358a9c81e59d4f100c93e2ce264d"><s>[</s>форком<e>](https://github.com/YGGverse/flarum-framework/commit/bd421ee6604b358a9c81e59d4f100c93e2ce264d)</e></URL> фреймворку.</LI></LIST>

<H2><s>## </s>Висновки</H2>

<p>Якщо не брати до уваги моє ставлення до сучасних Веб технологій в цілому - то я задоволений. Археологію типу <URL url="https://www.phpbb.com"><s>[</s>phpBB<e>](https://www.phpbb.com)</e></URL>, <URL url="https://simplemachines.org"><s>[</s>SMF<e>](https://simplemachines.org)</e></URL> я в принципі сьогодні для створення форуму спільноти відкинув, а сучасний Discourse мені не зайшов на рівні користувача (зокрема - форумів <URL url="https://discourse.gnome.org"><s>[</s>GTK<e>](https://discourse.gnome.org)</e></URL> і <URL url="https://users.rust-lang.org"><s>[</s>Rust<e>](https://users.rust-lang.org)</e></URL>). Тому планую користуватись Flarum надалі.</p>

<H2><s>## </s>Дивіться також</H2>

<LIST><LI><s>* </s><URL url="/d/17-vstanovlennia-i-nalastuvannia-flarum-v2-beta"><s>[</s>Встановлення і налаштування Flarum v2 (beta)<e>](/d/17-vstanovlennia-i-nalastuvannia-flarum-v2-beta)</e></URL></LI>
<LI><s>* </s><URL url="/d/21-lokalnii-fork-rusiia-flarum-vid-yggverse"><s>[</s>Локальний форк рушія Flarum від YGGverse<e>](/d/21-lokalnii-fork-rusiia-flarum-vid-yggverse)</e></URL></LI>
<LI><s>* </s><URL url="https://devzone.org.ua/post/moyi-pershi-vrazennia-vid-flarum"><s>[</s>Інтернет-адаптація цього матеріалу на сайті DevZone<e>](https://devzone.org.ua/post/moyi-pershi-vrazennia-vid-flarum)</e></URL></LI></LIST></r>','2025-09-12 12:56:22',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (67,50,1,'2025-09-12 00:54:25',1,'comment','<r><p>Періодично, повертаюсь до питання організації децентралізованої бази даних цього ресурсу. Єдиною перешкодою опублікувати повний дамп БД і файлів десь публічно - є зав''язка на класичну систему реєстрації (і зокрема рушія Flarum) через E-mail.</p>

<p>Наразі, так бачу що користувачі використовують фіктивні адреси, але може статись так, що хтось зареєструє реальну (нагадаю: форум <URL url="/d/20-posibnik-z-koristuvannia-forumom"><s>[</s>вміє<e>](/d/20-posibnik-z-koristuvannia-forumom)</e></URL> розсилати листи в мережах Mycelium / Yggdrasil).</p>

<p>Тут на думку приходить альтернативна система авторизації на базі публічного ключа TLS, як це <URL url="https://geminiprotocol.net/docs/protocol-specification.gmi#client-certificates"><s>[</s>реалізовано<e>](https://geminiprotocol.net/docs/protocol-specification.gmi#client-certificates)</e></URL> в протоколі Gemini. От тільки я не знаю, як це діло натягнути на розуми сучасних користувачів, що звикли до легасі авторизації через пару E-mail/пароль.</p>

<p>Чому протокол Gemini зміг запровадити зручний UI для логіну сертифікатами, а супер-навороченій Веб з його браузерами - ні та досі тягає давно дохлий поштовий протокол...</p>

<p>Коротше треба зайнятись питанням, думаю відвідувачі цього реурсу "професійно" мають вже вміти генерувати ключі через термінал, напишемо якусь інструкцію в крайньому випадку.</p></r>','2025-09-12 01:03:00',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (68,51,1,'2025-09-12 12:43:06',1,'comment','<r><p>Другий рік як потихеньку працюю над власним GTK клієнтом <URL url="https://github.com/YGGverse/Yoda"><s>[</s>Yoda<e>](https://github.com/YGGverse/Yoda)</e></URL> для протоколу <URL url="https://geminiprotocol.net"><s>[</s>Gemini<e>](https://geminiprotocol.net)</e></URL>.</p>

<p>Пакети Flatpak не робив свідомо, сподіваючись на швидкий вихід першої мажорної версії, але бачу що до неї далеко. Тим не менше, в мене періодично запитують про таку опцію встановлення і врешті мені довелось й самому скористатись нею для швидкого встановлення на ноутбук без розгортання екосистеми Rust.</p>

<p>Якщо комусь цікаво спробувати - пакунки Flatpak будуть додаватись до нових стабільних релізів починаючи з версії <C><s>`</s>0.12.1<e>`</e></C>:</p>

<p><URL url="https://github.com/YGGverse/Yoda/releases/download/0.12.1/Yoda.flatpak">https://github.com/YGGverse/Yoda/releases/download/0.12.1/Yoda.flatpak</URL></p></r>','2025-09-12 12:52:01',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (69,52,1,'2025-09-13 13:02:31',1,'comment','<r><p>Подібна задача може виникнути у разі, якщо ви адмініструєте агрегатор та хочете вирізняти його агент з поміж інших з''єднань або якщо з якихось причин ваш трекер блокує альфа-збірки клієнтів.</p>

<H2><s>## </s>settings.json</H2>

<p><C><s>`</s>User-agent<e>`</e></C> можна змінити через опцію <C><s>`</s>user-agent<e>`</e></C> у файлі налаштувань. В системах Linux, він звичайно знаходиться в <C><s>`</s>~/.config/transmission/settings.json<e>`</e></C>:</p>

<CODE><s>``` ~/.config/transmission/settings.json</s><i>
</i>"user-agent" = "VALUE"<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>де <C><s>`</s>VALUE<e>`</e></C> - ваше значення</LI>
<LI><s>* </s>після зміни файлу, потрібно перезапустити клієнт / сервер</LI></LIST>

<H2><s>## </s>CMakeLists.txt</H2>

<p>На відміну від першого способу, зміна версії в <URL url="https://github.com/transmission/transmission/blob/main/CMakeLists.txt#L94"><s>[</s>CMakeLists.txt<e>](https://github.com/transmission/transmission/blob/main/CMakeLists.txt#L94)</e></URL> також змінює і <C><s>`</s>PeerID<e>`</e></C> на базі вказаних версій, а також може впливати на конфігурацію збірки (через директиви компілятора) тому майте на увазі, якщо йдете цим шляхом:</p>

<CODE lang="CMakeLists.txt"><s>``` CMakeLists.txt</s><i>
</i># these should be the only five lines you need to change
set(TR_VERSION_MAJOR "4")
set(TR_VERSION_MINOR "1")
set(TR_VERSION_PATCH "0")
set(TR_VERSION_BETA_NUMBER "2") # empty string for not beta
set(TR_VERSION_DEV FALSE)<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>після цього перезбираємо клієнт / сервер</LI></LIST>

<H2><s>## </s>version.h</H2>

<p>Як і попередній спосіб, є ще один варіант - через генерацію файлу <C><s>`</s>version.h<e>`</e></C> через скрипт <URL url="https://github.com/transmission/transmission/blob/main/update-version-h.sh"><s>[</s>update-version-h.sh<e>](https://github.com/transmission/transmission/blob/main/update-version-h.sh)</e></URL>. Після виконання цього скрипта, файл <C><s>`</s>version.h<e>`</e></C> з''явиться у теці <URL url="https://github.com/transmission/transmission/tree/main/libtransmission"><s>[</s>libtransmission<e>](https://github.com/transmission/transmission/tree/main/libtransmission)</e></URL>. Так само, після внесення змін, потрібно перезібрати клієнт / сервер.</p></r>','2025-09-13 13:35:00',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (70,53,1,'2025-09-14 15:47:21',1,'comment','<r><p>Днями зайнявся архівацією україномовних Веб-ресурсів, бо ті з очевидних причин масово йдуть в офлайн. Зокрема, віднайшов цікаву книгу з налаштування поштового сервера, яка ймовірно може зникнути з оригінального сайту, так як той вже не доступний.</p>

<p>З оригінального банеру на <URL url="https://web.archive.org/web/20230203102341/https://yakim.org.ua/uk/servers/poshtovyi-server/133-mailserver-book.html"><s>[</s>Веб-архів<e>](https://web.archive.org/web/20230203102341/https://yakim.org.ua/uk/servers/poshtovyi-server/133-mailserver-book.html)</e></URL>:</p>

<QUOTE><i>&gt; </i><p>Підтримайте, будь ласка автора та придбайте книгу "Налаштування поштового сервера на базі Postfix, Dovecot та RoundCube" В електронному вигляді</p></QUOTE>

<LIST><LI><s>* </s>реквізити є в самій книзі, але наскільки вони актуальні - не знаю</LI></LIST>

<p>Файл отримано з офіційного відкритого джерела:<br/>
<URL url="https://yakim.org.ua/images/stories/articles/SYakimchuck-MailServer.pdf">https://yakim.org.ua/images/stories/articles/SYakimchuck-MailServer.pdf</URL></p>

<H2><s>## </s>FTP</H2>

 <LIST><LI><s>* </s><URL url="/d/57-parametri-pidkliucennia-do-gostyovogo-servera-ftp"><s>[</s>Параметри підключення до гостьового сервера FTP<e>](/d/57-parametri-pidkliucennia-do-gostyovogo-servera-ftp)</e></URL></LI></LIST>

<H2><s>## </s>BitTorrent</H2>

<LIST><LI><s>* </s><C><s>`</s>67708815c147c8bc4abfbcb2425965c019c66bf8<e>`</e></C> (<URL url="/d/62-lokalni-trekeri-bittorrent"><s>[</s>трекери<e>](/d/62-lokalni-trekeri-bittorrent)</e></URL>)</LI></LIST>

<p>Прошу не байдужих стати на роздачу (і поділитись нею) задля збереження культурного надбання.</p></r>','2025-09-21 21:57:16',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (71,54,1,'2025-09-14 17:29:49',1,'comment','<r><p>Вже тривалий час спостерігаю картину природного занепаду Web, який поступово витісняють мобільні платформи, а тепер ще й штучний інтелект. Це можна було б сприймати за норму, адже є такі ресурси як Web-archive, звідки "завжди" можна підняти архівну копію. Але такі копії там хаотично формуються кравлером, тому деякий контент пропускається а деякий - з невідомих мені причин стає не доступним.</p>

<p>Таким чином, з пошукової видачі поступово зникає україномовний контент, за ним зникає читач, а потім й сама культура, зокрема - наукові роботи, статті, мануали, книги, тощо...</p>

<p>Думки наступні:</p>

<LIST type="decimal"><LI><s>1. </s>зробити локальні "сирі" копії активних сайтів щонайменше засобами <C><s>`</s>wget<e>`</e></C><br/>
    1.1. тут можна підняти віртуальні Веб-хости Yggdrasil для локального читання у браузері<br/>
    1.2. створити для таких дампів роздачу BitTorrent або просто підписати хешем SHA/MD<br/>
    1.3. надати до статичних дампів доступи по FTP (в анонімному режимі read-only для копіювання)</LI>
<LI><s>2. </s>підняти останні архіви вже не доступних сайтів та вручну оформити їх в репозиторій у форматі Markdown, який потім можна згенерувати в актуальний формат, зокрема засобами <URL url="https://rust-lang.github.io/mdBook/"><s>[</s>mdBook<e>](https://rust-lang.github.io/mdBook/)</e></URL> або актуальним на той момент П/З.</LI></LIST>

<p>Стосовно останнього пункту, тут є "невеличка" проблема з авторськими правами, бо колись було модно ліпити лейбл "усі права захищено" тут здається термін переходу інформації в суспільне надбання складає близько 60 років, можливо я помиляюсь. За цей час інформація може зникнути, або частково втратитись, тому на допомогу може прийти стара добра модель андеграунду з його неформальними правилами "забити болт" на копіразм але при цьому з повагою ставитися до подібних скарг, таким чином що якщо автор з''явиться / оживе, можна було зняти з публікації ресурс за його скаргою.</p>

<p>Утім, такий ресурс вже може стати частиною певної енциклопедії або вікі, я цей процес погано уявляю, але більше уявляю той факт, що більшість з авторів все ж таки на зв''язок не вийдуть ніколи - через втрату інтересу або через військові дії.</p>

<p>Іншою проблемою збереження готових збірок (для того ж пункту #2) є медіа-файли. Якщо це буде Git-хостинг, то медіа-файли там не вітаються і рано чи пізно спричинять зайві питання від провайдера. Тому ймовірно, тут доведеться заморочитись з Gitea, чи що там сьогодні модно. Але такий формат зробить сховище менш популярним, а значить - менш стійким до потенційного занепаду. Можливо є сенс обговорювати з адміністрацією хостинга, на що повертаємось до питання копірайту.</p>

<H2><s>## </s>Для поширення в Інтернет</H2>

<LIST><LI><s>* </s>Копія цієї теми на <URL url="https://devzone.org.ua/topic/restavratsiia-ukrayinskykh-veb-arkhiviv"><s>[</s>DevZone<e>](https://devzone.org.ua/topic/restavratsiia-ukrayinskykh-veb-arkhiviv)</e></URL></LI>
<LI><s>* </s>Ініціатива на <URL url="https://www.linuxmint.com.ua/d/695-restavraciya-ukrayinomovnix-veb-arxiviv"><s>[</s>Linux Mint Україна<e>](https://www.linuxmint.com.ua/d/695-restavraciya-ukrayinomovnix-veb-arxiviv)</e></URL></LI>
<LI><s>* </s>Проєкт спільноти на <URL url="https://codeberg.org/uarchive/"><s>[</s>Codeberg<e>](https://codeberg.org/uarchive/)</e></URL></LI></LIST>

<H2><s>## </s>Локальне сховище FTP</H2>

<LIST><LI><s>* </s><URL url="/d/57-parametri-pidkliucennia-do-gostyovogo-servera-ftp"><s>[</s>Параметри підключення до гостьового сервера FTP<e>](/d/57-parametri-pidkliucennia-do-gostyovogo-servera-ftp)</e></URL></LI></LIST>

<p>Далі буде.</p></r>','2025-09-17 18:02:10',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (72,55,1,'2025-09-16 20:49:13',1,'comment','<r><p>Постало завдання десь зберігати дампи україномовних сайтів у сирому HTML. Розгортати повноцінний Git хостинг поки не хочу, зокрема й тому що при кожному апдейті там будуть оновлюватись хеші файлів, це не дуже доречно. Утім, хочеться якось "розподілити" дані між користувачами.</p>

<p>Для цієї мети, вирішив підняти старий добрий публічний сервер FTP (для локальної мережі) з анонімним доступом до сервера в активному та пасивному режимах. Доступ до файлів тут в режимі <EM><s>_</s>read-only<e>_</e></EM>, я додаю їх від користувача по окремому потоку SSH.</p>

<p>Нижче описані кроки з налаштувань, щоб наступного не лазити по закладкам, може комусь стане в нагоді.</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>apt install vsftpd<i>
</i><e>```</e></CODE>

<H2><s>## </s>Налаштування</H2>

<LIST><LI><s>* </s>В операційній системі Fedora, файл конфігурації знаходиться за адресою <C><s>`</s>/etc/vsftpd/vsftpd.conf<e>`</e></C></LI>
<LI><s>* </s>В Debian - це <C><s>`</s>/etc/vsftpd.conf<e>`</e></C></LI></LIST>

<CODE lang="vsftpd.conf"><s>``` vsftpd.conf</s><i>
</i># дозволити підключення в анонімному режимі
anonymous_enable=YES

# заборонити логін локальних користувачів
local_enable=NO

# заборонити запис (додаю файли через SSH)
write_enable=NO

# маска, я її лишив здається стандартною
local_umask=022

# дозволити отримання списку директорій (для зручності навігації)
dirmessage_enable=YES

# вимкнув, щоб отримувати журнали в файл (див. vsftpd_log_file)
xferlog_std_format=NO

# вимкнув IPv4, оскільки я користуюсь тільки IPv6 (Yggdrasil/Mycelium)
listen=NO
listen_ipv6=YES

# в мене не стандартна локація на примонтованому пристрої
anon_root=/path/to/public

# дозволив відображення "прихованих" файлів що починаються з крапки
force_dot_files=YES

# увімкнув пасивний режим явно та вказав діапазон портів для iptables
# про активний і пасивний режими, конструктивно тут: https://vps.ua/wiki/ukr/ftp-mode/
pasv_enable=YES
pasv_min_port=10000
pasv_max_port=10100

# можна також обмежити конективність для певних конфігурацій
# pasv_address=
# pasv_addr_resolve=NO
# connect_from_port_20=YES

# файл журналів
vsftpd_log_file=/var/log/vsftpd.log<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>інші опції я лишив як є, але це актуально лише для моєї версії vsftdp - будьте уважні!</LI></LIST>

<H2><s>## </s>Фаєрвол</H2>

<p>Тепер важливо відкрити потрібні порти. Так як я не використовую режим SSL, мені потрібно дозволити тільки порти <C><s>`</s>20<e>`</e></C>, <C><s>`</s>21<e>`</e></C> і <C><s>`</s>10000-10100<e>`</e></C> (<C><s>`</s>pasv_min_port<e>`</e></C> і <C><s>`</s>pasv_max_port<e>`</e></C> відповідно).</p>

<p>На Fedora, я досі не навчився користуватись новомодним <EM><s>_</s>firewalld<e>_</e></EM> через командний рядок, тому зробив це через GUI <URL url="https://firewalld.org"><s>[</s>Firewall<e>](https://firewalld.org)</e></URL> (<EM><s>_</s>firewall-config<e>_</e></EM>). Тут важливо додати ці правила до групи Permanent щоб вони не злетіли після ребуту.</p>

<p>В Debian, для перманентної зміни <C><s>`</s>iptables<e>`</e></C>, я користуюсь <C><s>`</s>ufw<e>`</e></C>:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ufw allow 20/tcp
ufw allow 21/tcp
ufw allow 10000:10100/tcp<i>
</i><e>```</e></CODE>

<H3><s>### </s>Альтернативні мережі</H3>

<p>Якщо потрібно дозволити підключення тільки для користувачів Yggdrasil:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ufw allow from 0200::/7 port 20 proto tcp
ufw allow from 0200::/7 port 21 proto tcp
ufw allow from 0200::/7 port 10000:10100 proto tcp<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>для Mycelium вказуємо <C><s>`</s>0400::/7<e>`</e></C></LI></LIST>

<H4><s>#### </s>Мульти-мережний режим</H4>

<p>Я особисто використовую правила без <C><s>`</s>from<e>`</e></C> (дозволяю підключення звідусіль) оскільки в мене крутиться декілька IPv6 мереж і якщо правильно не забіндити сервер на одній з них - можливі помилки підключення в пасивному режимі. Якщо не вдається підключитись через таймаут - дивіться <C><s>`</s>/var/log/ufw.log<e>`</e></C> і спробуйте тимчасово викнути фаєрвол взагалі, щоб перевірити чи справа дійсно в ньому (<C><s>`</s>ufw disable<e>`</e></C>).</p>

<H2><s>## </s>Запуск</H2>

<LIST><LI><s>* </s><C><s>`</s>systemctl restart vsftpd<e>`</e></C> - застосовуємо конфігурацію перезапуском сервера</LI>
<LI><s>* </s><C><s>`</s>systemctl enable vsftpd<e>`</e></C> - автозапуск сервера при старті системи</LI>
<LI><s>* </s><C><s>`</s>systemctl status vsftpd<e>`</e></C> - перевіряємо статус, після чого можна підключатися</LI></LIST></r>','2025-09-17 16:30:50',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (73,56,1,'2025-09-17 17:43:10',1,'comment','<r><p>Я тут знову примудрився грохнути операційну систему, тому довелося піднімати конфіги руками. Цього разу, вирішив створити нотатку, щоб не обмірковувати все спочатку кожного разу коли партачу з системою.</p>

<p>Отже, <URL url="/d/7-alfis-dns-rejestraciia-domenu-v-blokcein"><s>[</s>Alfis DNS<e>](/d/7-alfis-dns-rejestraciia-domenu-v-blokcein)</e></URL> в мене крутиться на окремому девайсі ARM, який слугує спільним резольвером для звичайних доменів Інтернет а також внутрішніх <C><s>`</s>.ygg<e>`</e></C>, <C><s>`</s>.srv<e>`</e></C> тощо. Для синхронізації блокчейну, тут використовуються оверлейні мережі <URL url="/d/6-yggdrasil-mereza-z-decentralizovanim-routingom"><s>[</s>Yggdrasil<e>](/d/6-yggdrasil-mereza-z-decentralizovanim-routingom)</e></URL> і <URL url="/d/12-vstanovlennia-mycelium"><s>[</s>Mycelium<e>](/d/12-vstanovlennia-mycelium)</e></URL>. Таким чином, цей роутер виступає у якості проксуючого DNS на всі локальні девайси, що до нього підключаються - тобто я не ставлю Alfis на всі клієнти але користуюся резольвом доменних зон через спільний сервер, що поєднує собою усі альтернативні напрямки. Також цей роутер підтримує саму мережу Alfis, виступаючи для неї у якості публічного піра (для шейрингу блокчейн та обміну DHT)</p>

<p>Оскільки мій резольвер не взаємодіє з пірами Інтернет (хоча така опція там є стандартною), мій пресет також передбачає особистий <URL url="https://github.com/YGGverse/Alfis/tree/mycelium-network-mode"><s>[</s>форк<e>](https://github.com/YGGverse/Alfis/tree/mycelium-network-mode)</e></URL> до <URL url="https://github.com/Revertron/Alfis/pull/386"><s>[</s>PR#386<e>](https://github.com/Revertron/Alfis/pull/386)</e></URL> який додатково включає комбіновані правила фільтрації вихідних з''єднань на Yggdrasil і Mycelium (в оригіналі там тільки опція Yggdrasil) - будьте уважні, бо конфіг тут також відрізнятиметься!</p>

<H2><s>## </s>Роутер</H2>

<p>Я встановлюю редакцію Alfis зі свого репозиторію з патчем який досі вісить в PR:</p>

<LIST><LI><s>* </s><C><s>`</s>git clone https://github.com/YGGverse/Alfis.git &amp;&amp; cd Alfis<e>`</e></C></LI>
<LI><s>* </s><C><s>`</s>git checkout mycelium-network-mode<e>`</e></C> - гілка з підтримкою Mycelium</LI>
<LI><s>* </s><C><s>`</s>cargo build --release --no-default-features<e>`</e></C> - збірка без GUI (демон)</LI>
<LI><s>* </s><C><s>`</s>install target/release/alfis /usr/local/bin/alfis<e>`</e></C></LI></LIST>

<p>Далі створюю окремого юзера, так як не планую пускати від рута (на системних портах)</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>useradd -m alfis<i>
</i><e>```</e></CODE>

<H3><s>### </s>Конфігурація</H3>

<p>Створюю файл конфігурації <C><s>`</s>/etc/alfis.toml<e>`</e></C> наступного змісту:</p>

<CODE><s>``` /etc/alfis.toml</s><i>
</i># сід-блок, лишаємо як є, якщо він не відрізняється від оригіналу мережі
# https://github.com/Revertron/Alfis/blob/master/alfis.toml#L2
origin = "0000001D2A77D63477172678502E51DE7F346061FF7EB188A2445ECA3FC0780E"

# шляхи до ключів: на роутері я не адмініструю домени, тому просто коментую
key_files = [
#"key1.toml", "key2.toml", "key3.toml", "key4.toml", "key5.toml"
]

# скільки блоків перевіряти на старті - лишаю стандартно
check_blocks = 8

# налаштування мережі
[net]
# вузли ініціації: коментую стандартні бо не довіряю Інтернет-доменам,
# лишаю тільки пачку відомих мені вузлів (але з часом вони можуть втратити свою актуальність)
peers = [
        #"peer-v4.alfis.name:4244", "peer-v6.alfis.name:4244", "peer-ygg.alfis.name:4244"
        "[200:f8e5:2383:c1f8:7c73:8e74:2a5e:197e]:4244",
        "[200:f8e5:2383:c1f8:7c73:8e74:2a5e:197e]:4244",
        "[200:31b6:1c3a:3a1c:d322:3ed7:e109:4b3]:4244",
        "[200:1106::a702:9841:e607:9b3]:4244",
        "[208:84:68:55:2f91:8484:8d60:2fca]:4244",
        "[208:25:40:bd:6ea9:89fc:ac75:87be]:4244",
        "[208:62:45:62:59b8:f1a2:62ca:f87c]:4244",
        "[225:ca89:40a8:611e:78b8:ab81:999a:d4d7]:4244",
        "[301:84f7:4bc0:2f3a::53]:4244"
]

# слухаю з''єднання на всіх IPv6 бо користуюсь Yggdrasil / Mycelium а від провайдера Інтернет на цьому інтерфейсі немає
listen = "[::]:4244"

# цією опцією долучаюсь до підтримки мережі (обмін DHT і блокчейн даними)
public = true

# опція з мого патчу: дозволяю вихідні з''єднання тільки на мережу Mycelium
mycelium_mode = true

# аналогічно для Yggdrasil
yggdrasil_mode = true

[dns]
# резольвер слухатиме клієнтів на IPv4 інтерфейсі
listen = "0.0.0.0:5353"

# скільки потоків виділяти для резольву DNS
threads = 10

# для Інтернет-резольву я користуюсь клаудфлейр бо він швидкий, ви можете обрати собі інший
forwarders = [
"1.1.1.1:53"
]

# тут здається воно використовується якщо ви збирались з флагом --features="doh" (але я не перевіряв)
bootstraps = ["9.9.9.9:53", "94.140.14.14:53"]

# не знаю, чому закоментив, лишаю оригінальний комент:
# Hosts file support (resolve local names or block ads)
# hosts = ["system", "adblock.txt"]

[mining]
# кількість потоків CPU для майнингу (якщо використовується)
threads = 2

# понизити пріоритет для операцій майнингу (якщо використовується)
lower = true<i>
</i><e>```</e></CODE>

<H3><s>### </s>systemd</H3>

<p>Додаю конфігурацію <C><s>`</s>/etc/systemd/system/alfis.service<e>`</e></C> на основі оригінального <URL url="https://github.com/Revertron/Alfis/blob/master/contrib/systemd/alfis.service"><s>[</s>файлу<e>](https://github.com/Revertron/Alfis/blob/master/contrib/systemd/alfis.service)</e></URL>:</p>

<CODE><s>``` /etc/systemd/system/alfis.service</s><i>
</i>[Unit]
Wants=network.target
After=network.target

[Service]
User=alfis
Group=alfis

# закоментив бо я переїхав в домашню теку юзера
# ProtectHome=true
ProtectSystem=true

SecureBits=keep-caps
CapabilityBoundingSet=CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_BIND_SERVICE

SyslogIdentifier=alfis
WorkingDirectory=/home/alfis
ExecStart=/usr/local/bin/alfis -n -c /etc/alfis.toml

# цю опцію можливо є сенс закоментити але лишив як в оригіналі
ExecReload=/bin/kill -HUP $MAINPID

# це закоментив бо хай краще не працює аніж ребутається втіхаря
# Restart=always
# TimeoutStopSec=5

StandardOutput=file:///home/alfis/debug.log
StandardError=file:///home/alfis/error.log

[Install]
WantedBy=multi-user.target<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>systemdtl restart alfis<e>`</e></C> - запуск</LI>
<LI><s>* </s><C><s>`</s>systemdtl enable alfis<e>`</e></C> - автостарт</LI>
<LI><s>* </s><C><s>`</s>systemdtl status alfis<e>`</e></C> - перевірка статусу</LI></LIST>

<H3><s>### </s>Фаєрвол</H3>

<p>На роутері в мене Debian, тому додаю правила через <C><s>`</s>ufw<e>`</e></C>:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ufw allow from 0200::/7 to any port 4244
ufw allow from 0400::/7 to any port 4244<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>ці правила дозволяють підтримувати мережу Alfis DNS для мереж Yggdrasil (<C><s>`</s>0200::/7<e>`</e></C>) та Mycelium (<C><s>`</s>0400::/7<e>`</e></C>) відповідно</LI></LIST>

<CODE lang="bash"><s>``` bash</s><i>
</i>ufw allow from xx:xx:xx:xx to any port 5353 proto udp<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>хостів може бути декілька, я додаю таким чином дозвіл на резольв окремим локальним девайсам а іншим - забороняю (хоча чи не роздає часом мій атрибут <C><s>`</s>public<e>`</e></C> подібні відповіді через сокет <C><s>`</s>4244<e>`</e></C> - я не знаю, сподіваюсь що ні, бо так гіпотетично можлива DDOS атака на Інтернет DNS)</LI></LIST>

<H2><s>## </s>Клієнт</H2>

<p>На клієнті в мене Fedora, тому нижче інструкції для неї (для Ubuntu додам згодом, бо поки не під рукою для перевірки)</p>

<CODE><s>``` /etc/systemd/resolved.conf</s><i>
</i>#/etc/systemd/resolved.conf
[Resolve]
DNS=xx.xx.xx.xx:5353
#FallbackDNS=1.0.0.1 8.8.4.4
#Domains=~.
LLMNR=no
MulticastDNS=no
#DNSSEC=yes
#Cache=yes

[Network]
DNSStubListener=no<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>xx.xx.xx.xx:5353<e>`</e></C> - адреса роутера, на якому крутиться резольвер Alfis DNS</LI>
<LI><s>* </s>після змін перезапускаємо сервіс <C><s>`</s>systemctl restart systemd-resolved<e>`</e></C></LI></LIST>

<p>Тут, теоретично можна (і було б зручно) змінити налаштування в GUI менеджері з''єднань GNOME, але в мене він не підтримує параметр порту - хоче <C><s>`</s>53<e>`</e></C> (пустий) а його я не хочу пускати на роутері. Тому таке рішення з <C><s>`</s>resolved.conf<e>`</e></C></p></r>','2025-09-22 04:36:09',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (74,57,1,'2025-09-17 17:58:59',1,'comment','<r><p>Так як дана спільнота доступна за різними адресами, тему створено для поширення відносних посилань на параметри підключення, замість копіювання даних нижче, оскільки такі можуть оновлюватись з часом.</p>

<H2><s>## </s>Гостьовий FTP для доступу в анонімному режимі (порт 21)</H2>

<LIST type="decimal"><LI><s>1. </s><C><s>`</s>ftp://[302:68d0:f0d5:b88d::c]<e>`</e></C> | <C><s>`</s>ftp://ygg.ua.srv<e>`</e></C></LI>
<LI><s>2. </s><C><s>`</s>ftp://[505:6847:c778:61a1::c]<e>`</e></C> | <C><s>`</s>ftp://myc.ua.srv<e>`</e></C></LI></LIST>

<p>UPD. сервер вимкнено, якщо комусь він дійсно потрібен - пишіть.</p></r>','2025-10-11 14:35:12',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (76,58,1,'2025-09-18 20:32:50',1,'comment','<r><p>В рамках проєкту <URL url="/d/54-restavraciia-ukrayinskix-veb-arxiviv"><s>[</s>Реставрація українських Веб-архівів<e>](/d/54-restavraciia-ukrayinskix-veb-arxiviv)</e></URL>, я періодично роблю "сирі" дампи деяких Веб-сайтів, на випадок їх зникнення з онлайну. Утім один з ресурсів, який мене <URL url="https://prolinux.pp.ua/news/prolinuxua-stopped.html"><s>[</s>зацікавив<e>](https://prolinux.pp.ua/news/prolinuxua-stopped.html)</e></URL> - використовував динамічний анти-бот захист на основі JavaScript + Cookies, перший з яких утиліта <C><s>`</s>wget<e>`</e></C> обробляти не вміє, через що цей сайт також не може проіндексуватись проєктом <URL url="https://web.archive.org/web/20231130201641/https://prolinux.pp.ua/?i=1"><s>[</s>Webarchive<e>](https://web.archive.org/web/20231130201641/https://prolinux.pp.ua/?i=1)</e></URL>.</p>

<p>Тобто у цьому випадку, його сторінка віддає кравлеру наступний код, точніше логічне завдання для клієнт-сайду, результат якого потрібно зберегти до Cookies та застосувати для подальших запитів:</p>

<CODE lang="html"><s>``` html</s><i>
</i>&lt;html&gt;&lt;body&gt;&lt;script type="text/javascript" src="/aes.js" &gt;&lt;/script&gt;&lt;script&gt;function toNumbers(d){var e=[];d.replace(/(..)/g,function(d){e.push(parseInt(d,16))});return e}function toHex(){for(var d=[],d=1==arguments.length&amp;&amp;arguments[0].constructor==Array?arguments[0]:arguments,e="",f=0;f&lt;d.length;f++)e+=(16&gt;d[f]?"0":"")+d[f].toString(16);return e.toLowerCase()}var a=toNumbers("1a24ba9d09a112d4968c63579db51a24"),b=toNumbers("3e244c2eee86c3994890592585b41a24"),c=toNumbers("4f249fe8595e58d63109a7ae2e5c1e24");document.cookie="__test="+toHex(slowAES.decrypt(c,2,a,b))+"; max-age=21600; expires=Thu, 31-Dec-37 23:55:55 GMT; path=/"; location.href="https://prolinux.pp.ua/?i=1";&lt;/script&gt;&lt;noscript&gt;This site requires Javascript to work, please enable Javascript in your browser or use a browser with Javascript support&lt;/noscript&gt;&lt;/body&gt;&lt;/html&gt;<i>
</i><e>```</e></CODE>

<p>Колись я вже мав подібний досвід (з логінами), тому швидко знайшов рішення для цього сайту і написав відповідний <URL url="https://codeberg.org/uarchive/prolinux.pp.ua#readme"><s>[</s>гайд<e>](https://codeberg.org/uarchive/prolinux.pp.ua#readme)</e></URL> для архівного репозиторію. За одно вирішив поділитись рішенням і тут, адже принцип роботи може бути корисним не тільки для архівації, але якщо ви хочете отримати копію сайту для читання в офлайн а той - має схожі заморочки.</p>

<p>Це звісно не є універсальним рішенням, якщо сайт не віддає сторінки без JavaScript в принципі (що в плані <URL url="https://en.wikipedia.org/wiki/Search_engine_optimization"><s>[</s>SEO<e>](https://en.wikipedia.org/wiki/Search_engine_optimization)</e></URL> сьогодні зустрічається рідко) або використовуються якісь інші, більш складні алгоритми, наприклад на основі майнингу (типу <URL url="https://github.com/TecharoHQ/anubis"><s>[</s>Anubis<e>](https://github.com/TecharoHQ/anubis)</e></URL>).</p>

<H2><s>## </s>wget</H2>

<p>Типова команда для отримання локальної копії звичайного сайту виглядає наступним чином:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>wget -e robots=off\
    --recursive\
    --timestamping\
    --page-requisites\
    --convert-links\
    --adjust-extension\
    --reject="*/feed"\
    --user-agent="VALUE"\
    --load-cookies="path/to/cookies.txt"\
    --no-check-certificate\
    https://prolinux.pp.ua/<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>-e robots=off<e>`</e></C> - ігнорувати правила <C><s>`</s>robots<e>`</e></C></LI>
<LI><s>* </s><C><s>`</s>--recursive<e>`</e></C> - режим кравлера</LI>
<LI><s>* </s><C><s>`</s>--timestamping<e>`</e></C> - завантажити файли лише в тому випадку, якщо вони новіші, аніж локальні</LI>
<LI><s>* </s><C><s>`</s>--page-requisites<e>`</e></C> - завантажити елементи, необхідні для коректного відображення веб-сторінки (CSS, JavaScript, медіа)</LI>
<LI><s>* </s><C><s>`</s>--convert-links<e>`</e></C> - конвертувати посилання у відносний формат для читання офлайн (з локальних файлів)</LI>
<LI><s>* </s><C><s>`</s>--adjust-extension<e>`</e></C> - додавати відповідні розширення, наприклад <C><s>`</s>.html<e>`</e></C></LI>
<LI><s>* </s><C><s>`</s>--reject="*/feed"<e>`</e></C> - локальне правило виключно для цього сайту</LI>
<LI><s>* </s>у випадку саме цього сайту я вказую <C><s>`</s>https<e>`</e></C> з <C><s>`</s>--no-check-certificate<e>`</e></C> бо сертифікат прострочений а посилання ведуть саме на SSL версію</LI>
<LI><s>* </s>про значення аргументів <C><s>`</s>--user-agent<e>`</e></C> і <C><s>`</s>--load-cookies<e>`</e></C> - нижче</LI></LIST>

<p>Оскільки даний хостинг (або програмне забезпечення сайту) використовує захист JavaScript з використанням випадкового значення Cookies, потрібно спочатку згенерувати його, перейшовши на головну сторінку сайту програмою, яка це все "розуміє" наприклад, через Firefox.</p>

<H3><s>### </s>--load-cookies</H3>

<p>Тут потрібно "витягнути" згенеровані Cookies у форматі <C><s>`</s>Netscape HTTP Cookie File<e>`</e></C> для подальшого використання з <C><s>`</s>--load-cookies<e>`</e></C>.<br/>
Для Firefox найпростіше це зробити <URL url="https://gist.githubusercontent.com/hackerb9/d382e09683a52dcac492ebcdaf1b79af/raw/fcc8dcc0b8c3ca1d81e5ba2fb8d4f346dfe0a511/extract_cookies.sh"><s>[</s>скриптом<e>](https://gist.githubusercontent.com/hackerb9/d382e09683a52dcac492ebcdaf1b79af/raw/fcc8dcc0b8c3ca1d81e5ba2fb8d4f346dfe0a511/extract_cookies.sh)</e></URL>:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>chown +x extract_cookies.sh
extract_cookies.sh &gt; cookies.txt<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>опціонально, з цього файлу можна видалити все, що не співпадає з хостом у прикладі - <C><s>`</s>prolinux.pp.ua<e>`</e></C></LI></LIST>

<p>В принципі, можна й без скрипта вище руками зкопіювати значення вкладки, якщо не боїтесь помилитись з синтаксисом (<C><s>`</s>Ctrl+Shift+i<e>`</e></C> &gt; <EM><s>*</s>Storage<e>*</e></EM> &gt; <EM><s>*</s>Cookies<e>*</e></EM>)</p>

<CODE lang="cookies.txt"><s>``` cookies.txt</s><i>
</i># Netscape HTTP Cookie File
prolinux.pp.ua	FALSE	/	FALSE	1758187902409	__test	c2343463c82123417efd87dadb45678<i>
</i><e>```</e></CODE>

<H3><s>### </s>--user-agent</H3>

<p>Для <C><s>`</s>wget<e>`</e></C> важливо вказати такий само <C><s>`</s>--user-agent<e>`</e></C> яким було отримано значення Cookies. Тут можна ввести в Google <URL url="https://www.google.com/search?q=get+current+user+agent+online"><s>[</s>запит<e>](https://www.google.com/search?q=get+current+user+agent+online)</e></URL> - для Firefox, там виводиться рядок типу <C><s>`</s>Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0<e>`</e></C>.</p>

<H2><s>## </s>P.S.</H2>

<p>Як бачите, у конкретно цьому випадку - все відносно просто: якщо зрозуміти принцип взаємодії Cookies з <C><s>`</s>wget<e>`</e></C>, то можна легко застосувати дану логіку й для схожих завдань. Саму команду імпорту можна трохи адаптувати, але частину локальної адаптації я вже виконаю окремо.</p>

<p>Оскільки я не впевнений чи варто розміщувати дані цього сайту на Codeberg, можливо хтось доєднається і створить в себе додаткову локальну копію за прикладом вище і коли автор блогу повернеться - ми зможемо таким чином підстрахувати його роботи від втрати даних.</p></r>',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (78,59,1,'2025-09-21 00:14:55',1,'comment','<r><p>Згадалась мені альтернативна стільникова мережа <URL url="https://uk.wikipedia.org/wiki/Code_Division_Multiple_Access"><s>[</s>CDMA<e>](https://uk.wikipedia.org/wiki/Code_Division_Multiple_Access)</e></URL> - колись користувався нею для оформлення міського номеру в мобільному форматі для тодішнього бізнес-проєкту.</p>

<p>Технологічно, CDMA відрізняється низьким рівнем випромінення, близьким або таким що не перевищує "фонове". Тобто гіпотетично, це була також менш шкідлива для здоров''я альтернатива <URL url="https://uk.wikipedia.org/wiki/GSM"><s>[</s>GSM<e>](https://uk.wikipedia.org/wiki/GSM)</e></URL>, де під час роботи останнього є характерні звукові сигнали, якщо розмістити активний телефон поряд з динаміками. CDMA також був нішевим продуктом в сфері мобільного Інтернет.</p>

<p>Через довжину хвилі робочого діапазону, якість зв''язку мала свої переваги - наприклад, зв''язок був доступний в пішохідних переходах (ще тоді без встановлених там локальних станцій ретрансляції) і недоліки - при низькому рівні сигналу, було чути специфічний шум під час голосового виклику. Вторинним недоліком, була й більш висока ціна, через більшу поширеність в Україні GSM, утім це було лише локальною проблемою. Вища ціна стосувалася не тільки тарифних планів, але й "заліза" адже сім-картки також мали технологічні відмінності і звичайні GSM пристрої (телефони, модеми) були не сумісними.</p>

<p>Власне, останнє мабуть і стало причиною його остаточного витіснення: у січні 2025 року компанія «Інтертелеком» перейшла на надання послуг у стандарті GSM (<URL url="https://www.intertelecom.ua/aboutcompany"><s>[</s>джерело<e>](https://www.intertelecom.ua/aboutcompany)</e></URL>). Стосовно 2025 року я не впевнений, адже цікавився питанням декілька років тому, і вже тоді підтримки CDMA не було - можливо на сайті переплутані дати серверу, бо в копірайті зараз 2028 рік :)</p>

<p>Була також інша організація - <URL url="https://uk.wikipedia.org/wiki/CDMA_UKRAINE"><s>[</s>CDMA Україна<e>](https://uk.wikipedia.org/wiki/CDMA_UKRAINE)</e></URL>, але особисто послугами цього провайдера не користувався і сьогодні їх сайт вже взагалі не доступний, його можна відкрити тільки через <URL url="https://web.archive.org/web/20120922025805/http://www.cdma.ua/"><s>[</s>веб-архів<e>](https://web.archive.org/web/20120922025805/http://www.cdma.ua/)</e></URL>.</p></r>','2025-09-21 00:30:27',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (79,60,1,'2025-09-21 17:41:58',1,'comment','<r><p>Випадково натрапив на цікавий матеріал 2017 року, хоча він і не новий - технологія BitTorrent v1 є поширеною і можна сказати основою по цей день. Зокрема, такі "новітні" проєкти як <URL url="https://github.com/ikatson/rqbit/issues/70"><s>[</s>rqbit<e>](https://github.com/ikatson/rqbit/issues/70)</e></URL> і досі не мають підтримки v2 / sha256. Не зважаючи на наявність такої опції в libtrorrent / qBittorrent, сучасні торент-трекери вимагають створення роздач саме в v1 для "кращої сумісності".</p>

<p><URL url="https://www.bleepingcomputer.com/news/security/sha1-collision-attack-can-serve-backdoored-torrents-to-track-down-pirates/"><s>[</s>SHA1 Collision Attack Can Serve Backdoored Torrents to Track Down Pirates<e>](https://www.bleepingcomputer.com/news/security/sha1-collision-attack-can-serve-backdoored-torrents-to-track-down-pirates/)</e></URL></p></r>','2025-09-21 17:44:02',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (80,61,1,'2025-09-21 20:17:01',1,'comment','<r><p>Наткнувся на сабж <URL url="https://toloka.to/t670016">https://toloka.to/t670016</URL></p>

<p>Сам гратись не планую, також я не перевіряв, але вирішив оформити в роздачу,<br/>
щоб вся та робота не пропала разом з Mega.</p>

<H2><s>## </s>BitTorrent</H2>

<LIST><LI><s>* </s><C><s>`</s>1ec0ae40dceb4d6d3e43a3145c84ed3a44164ef0<e>`</e></C> (<URL url="/d/62-lokalni-trekeri-bittorrent"><s>[</s>трекери<e>](/d/62-lokalni-trekeri-bittorrent)</e></URL>)</LI></LIST>

<H2><s>## </s>FTP</H2>

<LIST><LI><s>* </s><URL url="/d/57-parametri-pidkliucennia-do-gostyovogo-servera-ftp"><s>[</s>Параметри підключення до гостьового сервера FTP<e>](/d/57-parametri-pidkliucennia-do-gostyovogo-servera-ftp)</e></URL></LI></LIST></r>','2025-09-21 21:57:34',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (81,62,1,'2025-09-21 20:41:52',1,'comment','<r><p>Так як наш трекер працює в різних мережах, створено дану тему для поширення відносних посилань на неї в темах розділу, замість копіювання (та подальшого оновлення) інформації нижче.</p>

<H2><s>## </s>Трекери</H2>

<p>Додайте наступні трекери до налаштувань вашого BitTorrent клієнта або сформуйте посилання Magnet:</p>

<LIST><LI><s>* </s><C><s>`</s>udp://[302:68d0:f0d5:b88d::fdb]:6969<e>`</e></C> | <C><s>`</s>udp://tracker.ygg:6969<e>`</e></C> - Yggdrasil</LI>
<LI><s>* </s><C><s>`</s>udp://[505:6847:c778:61a1::fdb]:6969<e>`</e></C> - Mycelium</LI></LIST>

<p>Якщо ви бажаєте доєднатись до списку, на сайті є <URL url="/d/10-vstanovlennia-bittorrent-trekera-aquatic-v-linux"><s>[</s>інструкція<e>](/d/10-vstanovlennia-bittorrent-trekera-aquatic-v-linux)</e></URL>.</p>

<H3><s>### </s>Сторонні трекери</H3>

<p>Наразі відомо про щонайменше два активні трекери для мережі Yggdrasil, ви можете додати їх до списку, щоб покращити конективність локальної мережі DHT:</p>

<LIST><LI><s>* </s><C><s>`</s>http://[21e:6565:9c87:a49d:dafa:92c1:b33f:f21]:1337/announce<e>`</e></C></LI>
<LI><s>* </s><C><s>`</s>http://[316:c51a:62a3:8b9::5]/announce<e>`</e></C></LI></LIST>

<H2><s>## </s>Сервіси</H2>

<H3><s>### </s>βtracker</H3>

<p>Web UI для пошуку роздач. Може бути зручним, якщо ви хочете віднайти не оголошений торент. Наразі, сервіс каталогу працює тільки для мережі Yggdrasil.</p>

<LIST><LI><s>* </s>http://[302:68d0:f0d5:b88d::fdb] | <URL url="http://tracker.ygg">http://tracker.ygg</URL> - Веб-версія (<URL url="/d/25-vtracker-lokalnii-bittorrent-treker"><s>[</s>детальніше<e>](/d/25-vtracker-lokalnii-bittorrent-treker)</e></URL>)</LI>
<LI><s>* </s>gemini://[302:68d0:f0d5:b88d::fdb] | gemini://tracker.ygg - Версія для Gemini protocol (<URL url="/d/45-vtracker-dlia-gemini-protocol"><s>[</s>детальніше<e>](/d/45-vtracker-dlia-gemini-protocol)</e></URL>)</LI></LIST>

<H3><s>### </s>Роутер посилань Magnet</H3>

<p>Є ідея створити локальний мод Flarum, який автоматично замінюватиме інфо-хеш торента в тексті повідомлення - Magnet посиланням з трекером поточної мережі дзеркала цього сайту. Можна трохи його ускладнити і реалізувати scrape по ряду інших трекерів, додаючи декілька таких посилань, включаючи гібридне. Поки не реалізовано, пропоную просто додавати хеш в текст повідомлення нікуди не посилаючись.</p>
</r>','2025-10-09 00:35:00',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (82,62,2,'2025-09-21 20:42:26',1,'discussionStickied','{"sticky":true}',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (83,63,1,'2025-09-21 21:20:41',1,'comment','<r><QUOTE><i>&gt; </i><p>У цьому фундаментальному виданні висвітлено практично всі сучасні мережеві інформаційні технології,  Розглянуто апаратні та логічні принципи побудови мереж, функції протоколів, сучасні комерційні технології локальних та глобальних мереж, питання керування та адміністрування мережами, об’єднання мереж, віддаленого доступу, архітектур розподілених обчислень. Значну увагу приділено побудові коректних мережевих вирішень, наведемо типові вирішення. Порівняно мережеві функції головних мережевих операційних систем.<br/>
Це унікальне за інформаційною насиченістю видання можуть використовувати як студенти, так і спеціалісти в галузі інформаційних технологій.</p>

<i>&gt; </i><p>Автор: Буров Є.В<br/>
<i>&gt; </i>Місце видання: Львів<br/>
<i>&gt; </i>Видавництво: БаК<br/>
<i>&gt; </i>Формат: djvu(OCR)<br/>
<i>&gt; </i>Кількість сторінок: 584<br/>
<i>&gt; </i>Мова: українська</p></QUOTE>

<LIST><LI><s>* </s><URL url="https://toloka.to/t44295"><s>[</s>джерело<e>](https://toloka.to/t44295)</e></URL></LI></LIST>

<H2><s>## </s>BitTorrent</H2>

<LIST><LI><s>* </s><C><s>`</s>8b3799bf27c4f4e2367ad0ea4d72fc459bc3c1b7<e>`</e></C> (<URL url="/d/62-lokalni-trekeri-bittorrent"><s>[</s>трекери<e>](/d/62-lokalni-trekeri-bittorrent)</e></URL>)</LI></LIST>

<H2><s>## </s>FTP</H2>

<LIST><LI><s>* </s><URL url="/d/57-parametri-pidkliucennia-do-gostyovogo-servera-ftp"><s>[</s>Параметри підключення до гостьового сервера FTP<e>](/d/57-parametri-pidkliucennia-do-gostyovogo-servera-ftp)</e></URL></LI></LIST></r>','2025-09-21 21:56:55',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (84,64,1,'2025-09-22 13:13:36',1,'comment','<r><p>Запускаємо локальну радіо-станцію нашої спільноти, де наразі гратиме переважно український рок, можливо згодом з''являться й живі етери щоб не мотало по колу.</p>

<H2><s>## </s>Yggdrasil</H2>

<LIST><LI><s>* </s>http://[202:68d0:f0d5:b88d:1d1a:555e:2f6b:3148]:8000</LI>
<LI><s>* </s><URL url="http://ygg.ua.srv:8000">http://ygg.ua.srv:8000</URL></LI></LIST>

<H2><s>## </s>Mycelium</H2>

<LIST><LI><s>* </s>http://[505:6847:c778:61a1:5c6d:e802:d291:8191]:8000</LI>
<LI><s>* </s><URL url="http://myc.ua.srv:8000">http://myc.ua.srv:8000</URL></LI></LIST>

<H2><s>## </s>I2P</H2>

<LIST><LI><s>* </s><URL url="http://mrkssh4b2qkrf5hl4yxrwbtuowbmjugozaa7emaybnokw5jtcydq.b32.i2p">http://mrkssh4b2qkrf5hl4yxrwbtuowbmjugozaa7emaybnokw5jtcydq.b32.i2p</URL>
    <LIST><LI><s>* </s><URL url="http://pidpilne.i2p">http://pidpilne.i2p</URL></LI></LIST></LI></LIST></r>','2025-10-31 05:41:58',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (85,65,1,'2025-09-22 16:31:31',1,'comment','<r><p>Причина проста: я не впевнений що до кінця розумію <URL url="/d/17-vstanovlennia-i-nalastuvannia-flarum-v2-beta"><s>[</s>свій конфіг<e>](/d/17-vstanovlennia-i-nalastuvannia-flarum-v2-beta)</e></URL>. Тим паче днями був запоров сервер і не пам''ятаю що міг забути підняти руками з початку. Наразі пошта йде в заглушку, але це не повинно заважати реєстрації. Пишіть, якщо вона комусь буде потрібна для сповіщень і не дивуйтесь чому не приходить якщо тестуєте зокрема цей <URL url="/d/19-nalastuvannia-postovoyi-skrinki-dlia-lokalnix-merez-bez-dns"><s>[</s>рецепт<e>](/d/19-nalastuvannia-postovoyi-skrinki-dlia-lokalnix-merez-bez-dns)</e></URL>.</p>

<p>В мене досі є сумніви реалізувати авторизацію через публічний ключ, як це виконано в <URL url="https://geminiprotocol.net/docs/protocol-specification.gmi#client-certificates"><s>[</s>Gemini<e>](https://geminiprotocol.net/docs/protocol-specification.gmi#client-certificates)</e></URL>. Левел місцевих дозволяє перейти на цей формат авторизації, що не вивертає особисті дані при резервному копіюванні БД.</p></r>','2025-09-22 16:42:40',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (86,66,1,'2025-09-22 16:35:12',1,'comment','<r><p>Помітив тільки через три дні. Як завжди є конструктивна нотатка по її оновленням:</p>

<p><URL url="https://twinkle.lol/item/915871dd-4ff9-423d-b25b-bbc19f6c51e0">https://twinkle.lol/item/915871dd-4ff9-423d-b25b-bbc19f6c51e0</URL></p>

<p>Для локальних:</p>

<QUOTE><i>&gt; </i><p>Forwarding: once connected, the node binds a local listener on [::]:1080 and forwards all connections bidirectionally to the chosen remote SOCKS5 service.</p></QUOTE>


<QUOTE><i>&gt; </i><p>Binding to all interfaces: the listener binds to [::]:1080 (all interfaces). This can expose the SOCKS endpoint to your local network. Use OS firewalling to restrict access to localhost only if desired.</p></QUOTE></r>','2025-09-22 16:38:53',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (87,67,1,'2025-09-24 01:30:01',1,'comment','<r><p><EM><s>_</s>Адаптивний переклад <URL url="http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:internet_radio"><s>[</s>сторінки<e>](http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:internet_radio)</e></URL> howto.ygg для україномовної аудиторії <URL url="https://devzone.org.ua/post/veb-radio-v-linux-vstanovlennia-servera-icecast-ta-bazove-nalashtuvannia-rotatsiyi-z-ezstream"><s>[</s>DevZone<e>](https://devzone.org.ua/post/veb-radio-v-linux-vstanovlennia-servera-icecast-ta-bazove-nalashtuvannia-rotatsiyi-z-ezstream)</e></URL> на особистому досвіді з розгортання локальної <URL url="/d/64-radio-pidpilne-ne-formalna-radio-stanciia-nasoyi-spilnoti"><s>[</s>Радіо-станції спільноти<e>](/d/64-radio-pidpilne-ne-formalna-radio-stanciia-nasoyi-spilnoti)</e></URL>. Взагалі, я не планував запуск звичайного плеєра у форматі потоку і мене більше цікавить живий формат трансляцій, програвання треків за розкладом та відстеження подій у реальному часі. Згодом, якщо пощастить, планую створити серію матеріалів з адміністрування серверу Icecast, а даний гайд - лише перший крок до цієї мети.<e>_</e></EM></p>

<p>Давно планував і нарешті вирішив таки створити власну "лампову" радіо-станцію для локальної мережі <URL url="/d/6-yggdrasil-mereza-z-decentralizovanim-routingom"><s>[</s>Yggdrasil<e>](/d/6-yggdrasil-mereza-z-decentralizovanim-routingom)</e></URL>. Інформації про налаштування <URL url="https://icecast.org"><s>[</s>Icecast<e>](https://icecast.org)</e></URL> в мережі повно, але для мене знайдена інфа виглядала заплутаною: я не розумів, чому окремо розглядається Icecast, <URL url="https://icecast.org/ices/"><s>[</s>Ices<e>](https://icecast.org/ices/)</e></URL>, <URL url="https://icecast.org/ezstream/"><s>[</s>Ezstream<e>](https://icecast.org/ezstream/)</e></URL> та додатковий скриптинг, у той час як мені для початку було потрібно просто зробити тривіальну річ: мотати по колу плейлист музичних файлів.</p>

<p>В темі стрімінгу та аудіо-обробки - я нуб. З цієї причини вирішив написати невеличкий гайд для Debian/Linux, зрозумілий для себе "в минулому" а також практичну нотатку, на випадок якщо завалю сервер та доведеться пригадувати що робив. Згодом, планую також навчитись додавати ретрансляцію етерів новин за розкладом, можливо - пускати в ефір живі стріми, тоді й розширю цей матеріал до серії.</p>

<H2><s>## </s>Icecast</H2>

<p>Icecast - це класичний сервер, на базі якого створюється публічний сервіс для слухачів (клієнтів). Його можна порівняти з проксі сервером Nginx для Веб-сайтів, от тільки створений він спеціально для операцій з потоковими даними. Цей сервер ніяк не взаємодіє з медіа-колекціями напряму, він просто отримує на себе сирий потік аудіо (або інших) даних з бекенду (по API) та розподіляє його на активні підключення, виступаючи в ролі хабу, своєрідної "радіо-вежі".</p>

<p><STRONG><s>**</s>Встановлення<e>**</e></STRONG></p>

<CODE lang="bash"><s>``` bash</s><i>
</i>apt install icecast2<i>
</i><e>```</e></CODE>

<p><STRONG><s>**</s>Налаштування<e>**</e></STRONG></p>

<p>Після встановлення пакету з репозиторію, до системи буде автоматично додано сервіс systemd (<C><s>`</s>/etc/init.d/icecast2<e>`</e></C>) та стандартний файл конфігурації (<C><s>`</s>/etc/icecast2/icecast.xml<e>`</e></C>). Зайдемо до останнього та адаптуємо його під свої потреби:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>nano /etc/icecast2/icecast.xml<i>
</i><e>```</e></CODE>

<CODE><s>``` /etc/icecast2/icecast.xml</s><i>
</i>&lt;icecast&gt;
    &lt;!-- Базові налаштування, я лишив стандартні --&gt;
    &lt;location&gt;Earth&lt;/location&gt;
    &lt;admin&gt;icemaster@localhost&lt;/admin&gt;
    &lt;limits&gt;
        &lt;clients&gt;100&lt;/clients&gt;
        &lt;sources&gt;2&lt;/sources&gt;
        &lt;queue-size&gt;524288&lt;/queue-size&gt;
        &lt;client-timeout&gt;30&lt;/client-timeout&gt;
        &lt;header-timeout&gt;15&lt;/header-timeout&gt;
        &lt;source-timeout&gt;10&lt;/source-timeout&gt;
        &lt;burst-on-connect&gt;1&lt;/burst-on-connect&gt;
        &lt;burst-size&gt;65535&lt;/burst-size&gt;
    &lt;/limits&gt;

    &lt;authentication&gt;
        &lt;!-- Пароль для бекенд-клієнтів (з ним будемо підключати Ezstream) --&gt;
        &lt;source-password&gt;PASSWORD&lt;/source-password&gt;

        &lt;!-- Цей пароль в прикладах не використовується, але заповніть це поле "на потім" --&gt;
        &lt;relay-password&gt;PASSWORD&lt;/relay-password&gt;

        &lt;!-- Доступи до Веб-адмінки --&gt;
        &lt;admin-user&gt;admin&lt;/admin-user&gt;
        &lt;admin-password&gt;PASSWORD&lt;/admin-password&gt;
    &lt;/authentication&gt;

    &lt;!-- Адреса хосту для клієнтів.
         Оскільки мій сервер працює на різні мережі,
         я вказав наступним чином: --&gt;
    &lt;hostname&gt;ua&lt;/hostname&gt;

    &lt;!-- Важливо вказати, якщо ви плануєте ротацію треків з кириличними назвами в системах Unix --&gt;
    &lt;mount type="default"&gt;
       &lt;charset&gt;UTF-8&lt;/charset&gt;
    &lt;/mount&gt;

    &lt;!-- Параметри для локального запуску сервісу Icecast.
         Тут можна вказати 127.0.0.1 (localhost), якщо з''єднання з сервером проксується через Nginx
         або цей сервер буде локальним в принципі;
         в моєму випадку, я транслюю на пряму з Icecast, на всі мережі IPv6 --&gt;
    &lt;listen-socket&gt;
        &lt;port&gt;8000&lt;/port&gt;
        &lt;bind-address&gt;::&lt;/bind-address&gt;
    &lt;/listen-socket&gt;

    &lt;!-- Політика крос-сайтового скриптингу ACAO/CORS
         у більшості випадків можна лишити стандартно --&gt;
    &lt;http-headers&gt;
        &lt;header name="Access-Control-Allow-Origin" value="*" /&gt;
    &lt;/http-headers&gt;

    &lt;!-- Вмикає файловий сервер Icecast,
         з якого можуть подаватися статичні файли (графіка, CSS) --&gt;
    &lt;fileserve&gt;1&lt;/fileserve&gt;

    &lt;!-- Налаштування шляхів, лишаю стандартними --&gt;
    &lt;paths&gt;
        &lt;basedir&gt;/usr/share/icecast2&lt;/basedir&gt;

        &lt;logdir&gt;/var/log/icecast2&lt;/logdir&gt;
        &lt;webroot&gt;/usr/share/icecast2/web&lt;/webroot&gt;
        &lt;adminroot&gt;/usr/share/icecast2/admin&lt;/adminroot&gt;

        &lt;!-- Аліас: у даному випадку,
             перенаправляє запити з http://server:port/ до http://server:port/status.xsl --&gt;
        &lt;alias source="/" destination="/status.xsl"/&gt;
        &lt;!-- Якщо використовується шифрування,
             файл PEM повинен містити у собі приватну та публічну пари!
        &lt;ssl-certificate&gt;/usr/share/icecast2/icecast.pem&lt;/ssl-certificate&gt;
        --&gt;
    &lt;/paths&gt;

    &lt;logging&gt;
        &lt;accesslog&gt;access.log&lt;/accesslog&gt;
        &lt;errorlog&gt;error.log&lt;/errorlog&gt;

        &lt;!-- Рівні подій для додавання в accesslog:
             * 4 відлагодження (debug)
             * 3 інформація (info) - стандартно
             * 2 попередження (warn)
             * 1 помилки (error) --&gt;
        &lt;loglevel&gt;3&lt;/loglevel&gt;

        &lt;!-- Максимальний розмір журналу --&gt;
        &lt;logsize&gt;10000&lt;/logsize&gt;

        &lt;!-- Якщо увімкнено (1), тоді по досягненню logsize
             файл журналу буде переміщено до [error|access|playlist].log.DATESTAMP,
             в іншому випадку - [error|access|playlist].log.old. Стандартно - вимкнено. --&gt;
        &lt;!-- &lt;logarchive&gt;1&lt;/logarchive&gt; --&gt;
    &lt;/logging&gt;

    &lt;!-- Параметри запуску лишаю стандартними --&gt;
    &lt;security&gt;
        &lt;chroot&gt;0&lt;/chroot&gt;
        &lt;!--
        &lt;changeowner&gt;
            &lt;user&gt;nobody&lt;/user&gt;
            &lt;group&gt;nogroup&lt;/group&gt;
        &lt;/changeowner&gt;
        --&gt;
    &lt;/security&gt;
&lt;/icecast&gt;<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>не забудьте вказати актуальне значення <C><s>`</s>PASSWORD<e>`</e></C></LI>
<LI><s>* </s>після внесення змін, необхідно перезапустити сервіс <C><s>`</s>systemctl restart icecast2<e>`</e></C></LI></LIST>

<H3><s>### </s>Фаєрвол</H3>

<p>У прикладі вище, використовується IPv6 маска хостів <C><s>`</s>::<e>`</e></C> (у вас це може бути IPv4 типу <C><s>`</s>0.0.0.0<e>`</e></C>) для доступу без Веб-проксі. Тому відкриваємо й відповідний порт:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ufw allow 8000/tcp<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>приклад відкриття порту <C><s>`</s>8000<e>`</e></C> для <C><s>`</s>IPv4<e>`</e></C> + <C><s>`</s>IPv6<e>`</e></C> (TCP)</LI></LIST>

<p>Якщо ви плануєте проксуватись через <C><s>`</s>80<e>`</e></C>/<C><s>`</s>443<e>`</e></C> порти Nginx (у вас там має бути вже відкритим <C><s>`</s>80/tcp<e>`</e></C> / <C><s>`</s>433/tcp<e>`</e></C> відповідно), або у вас локальний хост на кшталт <C><s>`</s>::1<e>`</e></C> чи <C><s>`</s>127.0.0.1<e>`</e></C> (стандартно) тоді відкривати не потрібно.</p>

<H3><s>### </s>Веб-проксі через Nginx</H3>

<p>Хоча сам не користуюсь такою комбінацією, але додам нотатку з налаштування проксі для віртуального хосту Nginx, на прикладі конфігурації бекенд-сервера <C><s>`</s>127.0.0.1:8000<e>`</e></C>:</p>

<CODE lang="default"><s>``` default</s><i>
</i>server {
     # розкоментуйте, якщо використовуєте IPv4
     # listen IPv4:80

     listen [IPv6]:80;

     server_name IPv4 IPv6 DOMAIN_1 DOMAIN_2;

     location / {
          proxy_pass http://127.0.0.1:8000;

          # розкоментуйте значення якщо делегуєте журналювання серверу icecast
          # proxy_set_header X-Real-IP $remote_addr;
          # proxy_set_header X-Forwarded-Proto $scheme;
     }
}<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>IPv4<e>`</e></C> і <C><s>`</s>IPv6<e>`</e></C> - публічні адреси вашого Веб-сервера (Nginx)</LI>
<LI><s>* </s><C><s>`</s>DOMAIN_1<e>`</e></C> і <C><s>`</s>DOMAIN_2<e>`</e></C> - домени/субдомени/аліаси через пробіл, якщо використовуються</LI>
<LI><s>* </s>не забуваємо відкрити порт <C><s>`</s>80<e>`</e></C> (і/або <C><s>`</s>443<e>`</e></C> якщо використовується)</LI></LIST>

<H3><s>### </s>SSL/TLS</H3>

<p>В принципі, можна використовувати модні "захищені" з''єднання, але для стрімінгу я бачу його використання не доречним з точки зору енергозаощадження і здорового глузду в плані шифрування потоків з публічними даними. Дивіться самі, особисто я по причині вище завжди прослуховую радіо-станції по HTTP, якщо така опція надається сервером.</p>

<H2><s>## </s>Ezstream</H2>

<p>Коли "станцію" Icecast налаштовано, нам потрібно надіслати їй дані для трансляції. Такі дані можуть бути голосовими / потоковими або зберігатись у бінарних файлах. Оскільки мені потрібен останній варіант, з ним є одна не очевидна на перший погляд проблема: усі вони мають різні формати (<C><s>`</s>ogg<e>`</e></C>, <C><s>`</s>flac<e>`</e></C>, <C><s>`</s>mp3<e>`</e></C>, тощо) а також різні бітрейти та інші характеристики (в яких не торопаю). Оскільки вихідний стрім для слухача завжди має один формат, нам потрібно якимось чином відформатувати нашу колекцію до уніфікованого потоку: для цієї задачі й потрібен такий софт як Ezstream.</p>

<p>На відміну від популярної комбінації Icecast2 + <URL url="https://icecast.org/ices/"><s>[</s>Ices2<e>](https://icecast.org/ices/)</e></URL>, Ezstream відрізняється тим, що підтримує більше медіа-форматів з коробки та є простішим в налаштуванні (для поточних завдань)</p>

<p><STRONG><s>**</s>Встановлення<e>**</e></STRONG></p>

<CODE lang="bash"><s>``` bash</s><i>
</i>apt install ezstream<i>
</i><e>```</e></CODE>

<p><STRONG><s>**</s>Налаштування<e>**</e></STRONG></p>

<p>Створімо окремого користувача з домашньою текою, де зберігатимуться налаштування та аудіо-файли:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>useradd -m ezstream<i>
</i><e>```</e></CODE>

<H3><s>### </s>Створення списку ротації</H3>

<p>Насамперед, варто зауважити, що якщо це ротація великої колекції по колу, то медіа файли бажано звести до єдиного формату. Якщо цього не зробити то Ezstream буде конвертувати файли на льоту, що потребуватиме додаткових ресурсів CPU. На цьому етапі я не робив того, використовуючи колекцію що складається з <C><s>`</s>mp3<e>`</e></C> і стрім мій буде в цьому ж форматі. Єдине що, я сумніваюся щодо різного бітрейту та інших аудіо-характеристик, це буде окремою темою про конвертацію наприклад з <C><s>`</s>ffmpeg<e>`</e></C>, але майте на увазі цей нюанс.</p>

<p>Для початку, завантажимо потрібні аудіофайли до умовної теки <C><s>`</s>/home/ezstream/my-stream/collection<e>`</e></C>. Якщо планується декілька тематичних стрімів, буде зручно заздалегідь створити для них простір імен у вигляді підтек, наприклад:</p>

<LIST><LI><s>* </s><C><s>`</s>mkdir -p /home/ezstream/my-stream-1/collection<e>`</e></C></LI>
<LI><s>* </s><C><s>`</s>mkdir -p /home/ezstream/my-stream-2/collection<e>`</e></C></LI>
<LI><s>* </s>...</LI></LIST>

<p>Після того, як до колекції додано медіа-файли, згенеруємо для них мета-індекс для ротації в Ezstream. На виході це буде звичайний текстовий список шляхів до файлів по одному на рядок:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>find /home/ezstream/my-stream/collection -name *.mp3 &gt; /home/ezstream/my-stream/playlist.txt<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>у даному прикладі, всі мої файли у форматі <C><s>`</s>mp3<e>`</e></C>, тому пошук відбувається за відповідним суфіксом, інші розширення у цьому прикладі будуть проігноровані</LI></LIST>

<p>Оскільки операції вище я проводив від рута (без попереднього логіну з <C><s>`</s>su ezstream<e>`</e></C>) варто виправити права Unix, адже наш сервіс systemd пускатиметься саме від користувача <C><s>`</s>ezstream<e>`</e></C>:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>chown ezstream:ezstream -R ~/ezstream<i>
</i><e>```</e></CODE>

<H3><s>### </s>Конфігурація Ezstream</H3>

<p>Коли дані ротації готові, можна перейти безпосередньо до налаштувань Ezstream.</p>

<p>Щоб не переварювати зайві опції, копіюємо мінімальний конфіг в домашню теку користувача <C><s>`</s>ezstream<e>`</e></C>:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>cp /usr/share/doc/ezstream/examples/ezstream-minimal.xml /home/ezstream/my-stream/config.xml<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>замініть <C><s>`</s>my-stream<e>`</e></C> на логічну назву проєкту та занотуйте шлях - він також буде потрібен для налаштування systemd</LI></LIST>

<p>Якщо вам потрібні додаткові опції, дивимось доступні пресети з коментарями:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ls /usr/share/doc/ezstream/examples/<i>
</i><e>```</e></CODE>

<p>Мій файл для конфігурації Icecast вище, містить деякі додаткові опції та зараз виглядає так:</p>

<CODE><s>``` /home/ezstream/my-stream/config.xml</s><i>
</i>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;ezstream&gt;
  &lt;servers&gt;
    &lt;server&gt;
      &lt;!-- Icecast крутиться на :: отже звернутись до нього можна через localhost/IPv6 --&gt;
      &lt;hostname&gt;::1&lt;/hostname&gt;

      &lt;!-- Пароль від &lt;source-password&gt; в /etc/icecast2/icecast.xml --&gt;
      &lt;password&gt;PASSWORD&lt;/password&gt;
    &lt;/server&gt;
  &lt;/servers&gt;
  &lt;streams&gt;
    &lt;stream&gt;
      &lt;!-- Вкажіть актуальні NAME, DESCRIPTION, GENRE --&gt;
      &lt;stream_name&gt;NAME&lt;/stream_name&gt;
      &lt;stream_description&gt;DESCRIPTION&lt;/stream_description&gt;
      &lt;stream_genre&gt;GENRE&lt;/stream_genre&gt;

      &lt;!-- Шлях монтування: це URI для http://host:8000/my-stream.mp3 --&gt;
      &lt;mountpoint&gt;/my-stream.mp3&lt;/mountpoint&gt;

      &lt;!-- Стандартним є ogg, утім в моєму випадку це mp3
           щоб уникнути зайвої конвертації "на льоту" --&gt;
      &lt;format&gt;mp3&lt;/format&gt;
    &lt;/stream&gt;
  &lt;/streams&gt;
  &lt;intakes&gt;
    &lt;intake&gt;
      &lt;!-- Шлях до згенерованого вище списку файлів для ротації --&gt;
      &lt;filename&gt;/home/ezstream/my-stream/playlist.txt&lt;/filename&gt;

      &lt;!-- Змішування треків у моєму випадку буде вимкнено --&gt;
      &lt;shuffle&gt;No&lt;/shuffle&gt;

      &lt;!-- Також, я хочу щоб треки грали з початку після завершення списку --&gt;
      &lt;stream_once&gt;No&lt;/stream_once&gt;
    &lt;/intake&gt;
  &lt;/intakes&gt;
&lt;/ezstream&gt;<i>
</i><e>```</e></CODE>

<p>Зауважу, що на кожен потік (стрім) потрібен окремий файл конфігурації / systemd процес, не додавайте масив <C><s>`</s>&lt;stream&gt;<e>`</e></C> в <C><s>`</s>&lt;streams&gt;<e>`</e></C> - це так не працює і якщо ви додасте декілька, потік просто видаватиме один з потоків. Тобто для кожного стріму - має бути окремий файл конфігурації і окремий конфіг systemd для нього, тому вище ми і створили неймспейс <C><s>`</s>/home/ezstream/my-stream<e>`</e></C></p>

<H3><s>### </s>systemd</H3>

<p>Останнє, що потрібно зробити - це створити сервіс systemd для налаштованого потоку Ezstream. Запускатиметься він від створеного вище користувача <C><s>`</s>ezstream<e>`</e></C> та вище створеної конфігурації <C><s>`</s>/home/ezstream/my-stream/config.xml<e>`</e></C>:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>nano /etc/systemd/system/ezstream-my-stream.service<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>назвати файл можна як завгодно, головне щоб ви його потім впізнали та відрізнили від інших сервісів / потоків Ezstream</LI></LIST>

<CODE><s>``` /etc/systemd/system/ezstream-my-stream.service</s><i>
</i>[Unit]
After=network.target

[Service]
Type=simple

# актуальні користувач/група
User=ezstream
Group=ezstream

# я додав затримку, оскільки потік не зможе стартувати,
# якщо процес icecast того зробити не встиг (наприклад, при старті системи)
ExecStartPre=/bin/sleep 5s

# вказуємо коректний шлях до конфігурації
ExecStart=/usr/bin/ezstream -c /home/ezstream/my-stream/config.xml

# вказуємо актуальні шляхи до майбутніх журналів
StandardOutput=file:/home/ezstream/my-stream/mainstream-debug.log
StandardError=file:/home/ezstream/my-stream/mainstream-error.log

# можна розкоментувати, але тоді ви можете не помітити збій окрім як читаючи логи
# Restart=on-failure

[Install]
WantedBy=multi-user.target<i>
</i><e>```</e></CODE>

<p>Зберігаємось (<C><s>`</s>Ctrl+X<e>`</e></C> + <C><s>`</s>Y<e>`</e></C>) і виконуємо один раз в послідовності:</p>

<LIST type="decimal"><LI><s>1. </s><C><s>`</s>systemctl enable ezstream-my-stream<e>`</e></C> - додаємо автозапуск стріма при старті системи</LI>
<LI><s>2. </s><C><s>`</s>systemctl start ezstream-my-stream<e>`</e></C> - стартуємо стрім</LI>
<LI><s>3. </s><C><s>`</s>systemctl status ezstream-my-stream<e>`</e></C> - перевіряємо статус
    <LIST><LI><s>* </s><C><s>`</s>systemctl stop ezstream-my-stream<e>`</e></C> - зупинити стрім (опціонально)</LI></LIST></LI></LIST>

<p>Ось власне і все, перезавантажувати процес Icecast не потрібно, конкретний потік Ezstream буде змонтовано та відмонтовано автоматично під час запуску / зупинки його процесу.</p>

<H2><s>## </s>Тестування</H2>

<p>Тепер можна в браузері перейти за адресою вашого сервера Icecast: на прикладі конфігурації вище, це <C><s>`</s>http://[IP]:8000<e>`</e></C>. Якщо у вас активні процеси Ezstream, вони мають відображатися в списку на головній сторінці. До кожного потоку, з права є кнопки експорту в форматах <C><s>`</s>M3U<e>`</e></C> і <C><s>`</s>XSPF<e>`</e></C> - якщо на них клікнути вони або скачаються або відкриються в плеєрі, що підтримує стрімінг. В себе на Fedora, я відкриваю <C><s>`</s>.m3u<e>`</e></C> як текстовий файл та виймаю з нього URL, після чого копіюю в розділ "Radio" програвача "Rhythmbox" :)</p></r>','2025-10-28 05:43:35',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (88,68,1,'2025-09-24 15:59:02',1,'comment','<r><p>Маю на меті навчитись фільтрувати зовнішні конекти на випадок перебування в ситуації, коли Інтернет стане Чайнанетом, а доступ в світ - буде лише за перепусткою (ака вайтліст). Скільки не дрочусь цією темою, завжди ловлю дірки в плані зовнішніх конектів у різному софті.</p>

<p>Днями піймав знову: цього разу в qBittorrent v5.2.0alpha1 (64-bit), завантажуючи образ Debian, що містить Веб-сіди (вкладка HTTP Sources):<br/>
<URL url="https://cdimage.debian.org/debian-cd/current/amd64/bt-cd/debian-13.1.0-amd64-netinst.iso.torrent">https://cdimage.debian.org/debian-cd/current/amd64/bt-cd/debian-13.1.0-amd64-netinst.iso.torrent</URL></p>

<p>Сам qBittorrent в мене крутиться без контейнера, в ньому вимкнені різні DHT, PEX, шмекс...</p>

<p>Також я встановлюю біндінг на всі мережі, бо в мене Yggdrasil + Mycelium, але полем нижче вказую "All IPv6 addresses" бо Інтернет IPv6 в мене немає і на роутері ця галка вимкнена.</p>

<p>Отже, скачав я цей образ Debian і втупу додав його в свій призначений для мешів клієнт qBittorrent (бо бачив на βtracker були роздачі). Ну і що: а то що пішов конект на Інтернет IPv4 і я хз чи це дійсно Веб сід чи реально підсосався якийсь пір.</p>

<p>Таке, депресія з приборканням <DEL><s>~~</s>норовливої<e>~~</e></DEL> BitTorrent. Я було думав писати свій клієнт на Rust, але ліба кандидат librqbit взагалі не заточена на параноїків і <URL url="https://github.com/ikatson/rqbit/issues/469"><s>[</s>не вміє<e>](https://github.com/ikatson/rqbit/issues/469)</e></URL> вимикати PEX (я обходжу ситуацію через костиль <URL url="/d/22-blokuvannia-vixidnix-zjednan-bittorrent-po-diapazonu-ipv6"><s>[</s>блек-ліст<e>](/d/22-blokuvannia-vixidnix-zjednan-bittorrent-po-diapazonu-ipv6)</e></URL>). Може я просто не розумію цієї опції, але будьте уважні.</p>

<p>P.S. створив сабж зі скрінами <URL url="https://github.com/qbittorrent/qBittorrent/issues/23307">https://github.com/qbittorrent/qBittorrent/issues/23307</URL><br/>
P.P.S. рішення: <URL url="/d/69-izoliaciia-linux-vid-priamix-internet-zjednan-na-bazi-qemu-virtual-machine-manager-z-vsock"><s>[</s>Ізоляція Linux від прямих Інтернет з''єднань на базі QEMU / Virtual Machine Manager з VSOCK<e>](/d/69-izoliaciia-linux-vid-priamix-internet-zjednan-na-bazi-qemu-virtual-machine-manager-z-vsock)</e></URL></p></r>','2025-09-25 05:27:13',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (89,69,1,'2025-09-25 05:19:07',1,'comment','<r><p>В матеріалі наведено приклад ізоляції віртуальної операційної системи Linux (та відповідно - усіх її програм) від вхідних та вихідних з''єднань в Інтернет, без додаткових правил в iptables. Зв''язок передбачається виключно засобами локальної мережі <URL url="/d/6-yggdrasil-mereza-z-decentralizovanim-routingom"><s>[</s>Yggdrasil<e>](/d/6-yggdrasil-mereza-z-decentralizovanim-routingom)</e></URL> з використанням технології <URL url="https://man7.org/linux/man-pages/man7/vsock.7.html"><s>[</s>VSOCK<e>](https://man7.org/linux/man-pages/man7/vsock.7.html)</e></URL>, а Інтернет-інтерфейс - буде відсутній як такий.</p>

<p>Кому потрібен доступ в Інтернет, це можна зробити окремо - засобами локальних проксі DNS та дзеркал репозиторіїв. Тобто, така система не буде "сліпою" та з певними доопрацюваннями буде здатна оновлюватись і взаємодіяти зі світом, але робити це без витоків через дірки софту та пропущені опції в конфігах.</p>

<p>Нижче розглядається налаштування засобами GUI <URL url="https://virt-manager.org"><s>[</s>Virtual Machine Manager<e>](https://virt-manager.org)</e></URL>, що зручно для десктоп образів. Користувачі CLI, зокрема системні адміністратори - можуть цей допис не читати.</p>

<H2><s>## </s>VSOCK</H2>

<p>З документації: технологія VSOCK - забезпечує взаємодію між віртуальними машинами та вузлом, на якому вони виконуються. Це адресне сімейство використовується гостьовими агентами та службами супервізора, яким потрібен канал зв''язку, що не залежить від налаштувань мережі віртуальної машини.</p>

<p>Тобто ми вимикаємо усі мережеві інтерфейси, а для підключення до Yggdrasil - будемо використовувати локальний сокет VSOCK, який розшарено з хосту на гостьову систему (або системи) для побудови його локального дерева маршрутизації.</p>

<H2><s>## </s>Yggdrasil</H2>

<p>Так як конфігурація передбачає взаємодію виключно з мережею Yggdrasil, нам потрібно спочатку зібрати версію роутера, яка має підтримку протоколу VSOCK. Я віднайшов <URL url="https://github.com/nagy/yggdrasil-go/tree/vsock"><s>[</s>форк<e>](https://github.com/nagy/yggdrasil-go/tree/vsock)</e></URL>, можливо, він втратить свою актуальність з часом або ж буде включений до апстріму в рамках <URL url="https://github.com/yggdrasil-network/yggdrasil-go/pull/1223"><s>[</s>PR#1223<e>](https://github.com/yggdrasil-network/yggdrasil-go/pull/1223)</e></URL>. Як на хості, так і на гостьовій системах, збирається наступним чином:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>git clone https://github.com/nagy/yggdrasil-go.git
cd yggdrasil-go
git checkout vsock
./build
# опціонально встановлюється за призначенням
# install yggdrasil /usr/local/bin/yggdrasil
# install yggdrasilctl /usr/local/bin/yggdrasilctl<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>тут передбачається, що у вас вже <URL url="/d/14-vstanovlennia-ostannyoyi-versiyi-go-v-debianlinux"><s>[</s>встановлена актуальна версія Go<e>](/d/14-vstanovlennia-ostannyoyi-versiyi-go-v-debianlinux)</e></URL></LI></LIST>

<p>Налаштування модифікованого роутера майже нічим не відрізняється від базового, за тим лише виключенням, що на хост машині (де запускаються гостьові віртуалки) потрібно додати прослуховування сокету:</p>

<CODE><s>``` /etc/yggdrasil.conf</s><i>
</i>#/etc/yggdrasil.conf
Listen: [vsock://host:1234]<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>host<e>`</e></C> - лишаємо саме таким (або можна вказати як ID <C><s>`</s>2<e>`</e></C>), порт можете вказати довільний</LI></LIST>

<p>Перед продовженням, важливо перезапустити роутер Yggdrasil, оскільки потрібно, щоб він забіндився на вказаному інтерфейсі <C><s>`</s>vsock://host:1234<e>`</e></C></p>

<H2><s>## </s>Virtual Machine Manager</H2>

<p>Тут вже може бути встановлено операційну систему, тому перед тим як продовжити, запустимо її та встановимо такий само форк Yggdrasil за інструкцією вище.</p>

<p>Після встановлення роутера, Інтернет більше не потрібен, вимикаємо гостьову систему та повертаємось до налаштувань VM. Сторінка налаштувань (Show virtual hardware details) знаходиться там де значок лампи у вікні образу</p>

<p><IMG alt="Virtual Machine Manager: Show virtual hardware details" src="/data/d/69/1.png"><s>![</s>Virtual Machine Manager: Show virtual hardware details<e>](/data/d/69/1.png)</e></IMG></p>

<p>звідки знаходимо NAT (або Route) інтерфейс і видаляємо через контекстне меню "Remove hardware" правим кліком миші; видаляємо всі "девайси" зі значком дво-направленої стрілки, що мають відношення до мережі</p>

<p><IMG alt="Virtual Machine Manager: Remove hardware" src="/data/d/69/2.png"><s>![</s>Virtual Machine Manager: Remove hardware<e>](/data/d/69/2.png)</e></IMG></p>

<p>В низу вікна, натискаємо кнопку "Add hardware"</p>

<p><IMG alt="Virtual Machine Manager: Add hardware" src="/data/d/69/3.png"><s>![</s>Virtual Machine Manager: Add hardware<e>](/data/d/69/3.png)</e></IMG></p>

<p>шукаємо там "VirtIO VSOCK" та додаємо його до конфігурації з відміченою галкою "Guest CID: Auto"</p>

<p><IMG alt="Virtual Machine Manager: VirtIO VSOCK" src="/data/d/69/4.png"><s>![</s>Virtual Machine Manager: VirtIO VSOCK<e>](/data/d/69/4.png)</e></IMG></p>

<p>Тепер можна запустити гостьову систему кнопкою "Power on the virtual machine" і перемкнутись на режим перегляду:</p>

<p><IMG alt="Virtual Machine Manager: Power on the virtual machine / Show the graphical console" src="/data/d/69/5.png"><s>![</s>Virtual Machine Manager: Power on the virtual machine / Show the graphical console<e>](/data/d/69/5.png)</e></IMG></p>

<p><STRONG><s>**</s>Наступні дії виконуються в середині гостьової машини!<e>**</e></STRONG></p>

<p>Після завантаження, вже має бути відсутній Інтернет - так і треба, але якщо у вас Yggdrasil автоматично запускається з systemd, його інтерфейс (стандартно <C><s>`</s>tun0<e>`</e></C>) має бути активним:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ifconfig

# lo
# tun0 - Yggdrasil<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>тут взагалі я оголошую <C><s>`</s>IfName<e>`</e></C> як <C><s>`</s>yggdrasil<e>`</e></C> явно, замість стандартного <C><s>`</s>auto<e>`</e></C>, щоб випадково не переплутати з динамічними VPN що також ймовірно буде на <C><s>`</s>tun*<e>`</e></C></LI></LIST>

<p>Нагадаю, форк роутера з підтримкою VSOCK для гостьової системи ми вже встановили раніше, тож додамо наш батьківський <C><s>`</s>vsock://host:1234<e>`</e></C>, але цього разу не в <C><s>`</s>Listen<e>`</e></C>, а в <C><s>`</s>Peers<e>`</e></C>:</p>

<CODE><s>``` /etc/yggdrasil.conf</s><i>
</i>#/etc/yggdrasil.conf
Peers: [vsock://host:1234]<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>якщо у вас там якісь інші сторонні конекти, можна їх закоментувати - вони все одно більше не працюватимуть.</LI></LIST>

<p>Перезапускаємо сервіс Yggdrasil та перевіряємо підключення до сокету:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>sudo yggdrasilctl getpeers<i>
</i><e>```</e></CODE>

<p>вивід має бути приблизно таким:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>URI                State  Dir  IP Address    Uptime  RTT     RX     TX     Down  Up  Pr  Cost Last Error
vsock://host:1234  Up     Out  200:xxxx:..   2m59s   1.61ms  1.8KB  0.6KB  -     -   0   1    -<i>
</i><e>```</e></CODE>

<p>Оверлейний пір батьківського хосту підключено, а отже тепер можна підключатись до всіх вузлів мережі Yggdrasil, без наявності Інтернет в гостьовій системі. Тобто можна безпечно качати торенти з увімкненими DHT, PEX, якщо ви десь в ЄС або просто приватно сьорфити локальну мережу без жодних додаткових <URL url="/d/26-mii-fail-pac-dlia-yggdrasil-ta-mycelium"><s>[</s>налаштувань софта типу PAC для Firefox<e>](/d/26-mii-fail-pac-dlia-yggdrasil-ta-mycelium)</e></URL>.</p>

<p>Про те, як налаштувати локальний DNS і репозиторії, щоб зробити систему здатною до оновлень (через локальні проксі) - згодом. Стосовно DNS, я частково описував свою конфігурацію в матеріалі <URL url="/d/56-mii-preset-alfis-dns-na-routeri-yggdrasil-mycelium"><s>[</s>Мій пресет Alfis DNS на роутері Yggdrasil / Mycelium<e>](/d/56-mii-preset-alfis-dns-na-routeri-yggdrasil-mycelium)</e></URL>, звідки можна взяти приклади, замінивши Інтернет резольвери на <URL url="https://yggdrasil-network.github.io/services.html#dns"><s>[</s>локальні<e>](https://yggdrasil-network.github.io/services.html#dns)</e></URL>.</p>

<p>Взагалі думки такі, що було б не погано мати готовий образ системи, що адаптований для роботи виключно засобами певних локальних мереж. Але це вже інша історія.</p>

<p><EM><s>_</s><URL url="https://devzone.org.ua/post/izoliatsiia-linux-vid-priamykh-internet-zyednan-na-bazi-qemu-virtual-machine-manager-i-vsock"><s>[</s>Інтернет-версія цього матеріалу на DevZone<e>](https://devzone.org.ua/post/izoliatsiia-linux-vid-priamykh-internet-zyednan-na-bazi-qemu-virtual-machine-manager-i-vsock)</e></URL><e>_</e></EM></p></r>','2025-09-25 06:31:28',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (90,44,2,'2025-09-28 10:50:22',1,'discussionLocked','{"locked":true}',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (91,70,1,'2025-09-29 03:36:31',1,'comment','<r><p>Здається, біржу tradeogre, через яку приймались донати - прикрили. Від того прийнято рішення перейти на локальний гаманець. Вузли нижче пінгуються, але не перевірялись на конективність легкого гаманця. Для синхронізацією з мережею (bootstrap) мають працювати.</p>

<LIST><LI><s>* </s><C><s>`</s>[201:2d47:2607:ecaf:2909:2dc5:926d:a8df]:18089<e>`</e></C> - <URL url="https://yggdrasil-network.github.io/services.html#monero-nodes"><s>[</s>джерело<e>](https://yggdrasil-network.github.io/services.html#monero-nodes)</e></URL></LI>
<LI><s>* </s><C><s>`</s>[200:28fa:d807:e104:5a13:e2c4:eaf:445f]:18081<e>`</e></C> - <URL url="https://github.com/yggdrasil-network/yggdrasil-network.github.io/pull/299"><s>[</s>джерело<e>](https://github.com/yggdrasil-network/yggdrasil-network.github.io/pull/299)</e></URL></LI></LIST>

<H2><s>## </s>Дивіться також</H2>

<LIST><LI><s>* </s><URL url="http://[201:72f6:9b56:e977:2d40:c7da:667b:f7a0]"><s>[</s>Стандартні порти BitCoin, LiteCoin, DogeCoin<e>](http://[201:72f6:9b56:e977:2d40:c7da:667b:f7a0])</e></URL></LI>
<LI><s>* </s><URL url="/d/24-yps-utilita-dlia-skanuvannia-portiv-yggdrasil"><s>[</s>YPS - утиліта для сканування портів Yggdrasil<e>](/d/24-yps-utilita-dlia-skanuvannia-portiv-yggdrasil)</e></URL></LI></LIST></r>','2025-09-29 06:35:14',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (92,71,1,'2025-09-29 12:43:12',1,'comment','<r><p>Як відомо, стандартна конфігурація правил <C><s>`</s>ufw<e>`</e></C> блокує виключно вхідний трафік:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i># ufw status verbose
Status: active
...
Default: deny (incoming), allow (outgoing), disabled (routed)
...<i>
</i><e>```</e></CODE>

<p>Тут, статус <C><s>`</s>allow (outgoing)<e>`</e></C> передбачає вихідні з''єднання, що може бути чутливим питанням у випадках, коли сервер має взаємодіяти виключно з мережами Yggdrasil / Mycelium, але його софт реалізує інтерактивний API (наприклад ActivitiPub, BitTorrent / PEX, SMTP, деякі реалізації FTP, тощо) і таким чином, можливі зовнішні звернення в Інтернет через вхідні запити з локальних мереж.</p>

<p>Найпростішим рішенням є блокування усіх вихідних з''єднань поряд з <C><s>`</s>deny (incoming)<e>`</e></C> та використання явних правил по білому списку, зокрема для DNS, NTP, apt, git тощо:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ufw default deny outgoing<i>
</i><e>```</e></CODE>

<p>Після цього, дозволимо вихід на усі адреси Yggdrasil / Mycelium по відповідному діапазону:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ufw allow out to 0200::/7
ufw allow out to 0400::/7<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>можна явно задати порт, наприклад <C><s>`</s>... port 80 proto tcp<e>`</e></C></LI></LIST>

<p>Для підключення оверлейних мереж вище до публічних вузлів:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ufw allow out to xx.xx.xx.xx port xxxx proto tcp
...<i>
</i><e>```</e></CODE>

<H2><s>## </s>DNS</H2>

<p>Далі, дивимось адреси DNS для системного резольвера (наприклад в <C><s>`</s>/etc/systemd/resolved.conf<e>`</e></C>), та додаємо їх до списку; для Cloudflare - це буде <C><s>`</s>1.1.1.1:53<e>`</e></C>:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ufw allow out to 1.1.1.1 port 53 proto udp<i>
</i><e>```</e></CODE>

<p>або просто дозволяємо всі можливі:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ufw allow out to any port 53 proto udp<i>
</i><e>```</e></CODE>

<p>Якщо використовується <URL url="http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:dns:internal_dns"><s>[</s>локальний DNS для Yggdrasil<e>](http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:dns:internal_dns)</e></URL> або Mycelium, цей крок можна пропустити, адже вище ми вже дозволили усі вихідні з''єднання на ці мережі.</p>

<H2><s>## </s>NTP</H2>

<p>Важливо дозволити синхронізацію годинника:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ufw allow out 123/udp<i>
</i><e>```</e></CODE>

<H2><s>## </s>apt</H2>

<p>Для системних оновлень, найпростіше підключити локальні дзеркала або проксі, для Yggdrasil це:</p>

<CODE><s>``` /etc/apt/apt.conf.d/proxy.conf</s><i>
</i>#/etc/apt/apt.conf.d/proxy.conf
Acquire::http::Proxy "http://[324:71e:281a:9ed3::fa11]:3128";
Acquire::https::Proxy "http://[324:71e:281a:9ed3::fa11]:3128";<i>
</i><e>```</e></CODE>

<p>Для команди <C><s>`</s>extrepo<e>`</e></C> на прикладі додавання репозиторію LibreWolf:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>https_proxy=http://[324:71e:281a:9ed3::fa11]:3128/ extrepo enable librewolf<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>або/і <C><s>`</s>http_proxy<e>`</e></C></LI></LIST>

<H3><s>### </s>Git</H3>

<CODE lang="bash"><s>``` bash</s><i>
</i>git config --global http.proxy http://[324:71e:281a:9ed3::fa11]:3128<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>або/і <C><s>`</s>https.proxy<e>`</e></C></LI></LIST>

<p>Додаючи програмне забезпечення через сторонні проксі, важливо розуміти, що ви отримуєте через них й ключі. Відповідно, маєте усвідомлювати, що такий спосіб отримання системних оновлень може бути потенційно небезпечним і краще користуватись окремими джерелами або власним сервером (у даному випадку - локальним)</p>

<H2><s>## </s>Читайте також</H2>

<LIST><LI><s>* </s><URL url="/d/69-izoliaciia-linux-vid-priamix-internet-zjednan-na-bazi-qemu-virtual-machine-manager-z-vsock"><s>[</s>Ізоляція Linux від прямих Інтернет з''єднань на базі QEMU / Virtual Machine Manager з VSOCK<e>](/d/69-izoliaciia-linux-vid-priamix-internet-zjednan-na-bazi-qemu-virtual-machine-manager-z-vsock)</e></URL></LI></LIST></r>','2025-10-05 12:49:58',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (93,72,1,'2025-09-30 16:49:08',1,'comment','<r><p>Відтепер доступний за адресою:<br/>
<URL url="http://hc3fycfadz7fkapp62fqi6llioe46fvis6wuswfobl5ghc2u7snq.b32.i2p">http://hc3fycfadz7fkapp62fqi6llioe46fvis6wuswfobl5ghc2u7snq.b32.i2p</URL></p></r>','2025-09-30 16:52:31',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (94,73,1,'2025-10-02 01:39:06',1,'comment','<r><p>I2P - це альтернативна мережа, характерною рисою якої є анонімізація користувача. На відміну від Tor, має принципово іншу модель маршрутизації, де стек IP не використовується як такий, а дані відправника вільно циркулюють роєм через випадкові вузли ретрансляції, допоки не досягнуть точки призначення. Таким чином, відправник даних є не визначеним мережею.</p>

<p>Утім, для підключення до I2P глобально, часто використовується Інтернет. Особливістю цього гайду є спосіб підключення до мережі I2P без прямих звернень Інтернет, через додатковий шар <URL url="/d/6-yggdrasil-mereza-z-decentralizovanim-routingom"><s>[</s>Yggdrasil<e>](/d/6-yggdrasil-mereza-z-decentralizovanim-routingom)</e></URL>. Може бути корисним у випадках, якщо ваш провайдер блокує піринговий трафік.</p>

<LIST><LI><s>* </s><EM><s>_</s>В інших випадках, такий спосіб може бути менш "анонімним" через можливість генерації необмеженої кількості адрес Yggdrasil з підміною ними "незалежних" вузлів (<URL url="https://uk.wikipedia.org/wiki/%D0%90%D1%82%D0%B0%D0%BA%D0%B0_%D0%A1%D0%B8%D0%B2%D1%96%D0%BB%D0%BB%D0%B8"><s>[</s>Атака Сивілли<e>](https://uk.wikipedia.org/wiki/Атака_Сивілли)</e></URL>) - таким чином, для себе важливо правильно обирати пріоритети налаштувань і розуміти мету, з якою використовується I2P. Адже якщо метою є саме анонімізація а не наприклад ретрансляція певного сервісу для користувачів з обмеженим доступом - то для таких цілей, на мою думку, краще використовувати звичайний Інтернет піринг або приватний ботнет.<e>_</e></EM></LI></LIST>

<p>Метою цього матеріалу не є детальний опис принципу роботи мережі I2P і анонімізація зокрема. Матеріал створено лише у якості нотатки, з досвіду публікації Веб-сайту для цієї спільноти на прохання деяких користувачів, для чого й був потрібен локальний роутер. Якщо вам не потрібно публікувати сайт чи анонімно користуватися мережею I2P, можна просто скористатися наявними вихідними SOCKS/HTTP проксі.</p>

<H2><s>## </s>Роутер</H2>

<p>Існує декілька відомих мені реалізацій роутера I2P:</p>

<LIST><LI><s>* </s><URL url="https://github.com/i2p/i2p.i2p"><s>[</s>i2p.i2p<e>](https://github.com/i2p/i2p.i2p)</e></URL> (Java) - оригінальна реалізація</LI>
<LI><s>* </s><URL url="https://github.com/i2p/i2p-rs"><s>[</s>i2p-rs<e>](https://github.com/i2p/i2p-rs)</e></URL> (Rust) - стан готовності цього проєкту мені не відомий</LI>
<LI><s>* </s><URL url="https://github.com/PurpleI2P/i2pd"><s>[</s>i2pd<e>](https://github.com/PurpleI2P/i2pd)</e></URL> (C++) - найбільш повноцінна реалізація, що підтримує з коробки режим роботи Yggdrasil-only</LI></LIST>

<H3><s>### </s>i2pd</H3>

<p>Для i2pd є готові збірки та репозиторії для різних дистрибутивів, але сам я завжди надаю перевагу збірці останніх версій програм з початкового коду. Нижче описаний саме такий спосіб, можливо з часом він може втратити свою актуальність через оновлення кодової реалізації. Детальна інструкція доступна в <URL url="https://i2pd.readthedocs.io/en/latest/devs/building/unix/"><s>[</s>документації<e>](https://i2pd.readthedocs.io/en/latest/devs/building/unix/)</e></URL>, а нижче - приклад встановлення для Debian / Linux.</p>

<H4><s>#### </s>Встановлення</H4>

<CODE lang="bash"><s>``` bash</s><i>
</i>git clone https://github.com/PurpleI2P/i2pd.git
cd i2pd/build
cmake .
make<i>
</i><e>```</e></CODE>

<p>Власне, для Debian, можна зібрати пакунок <C><s>`</s>.deb<e>`</e></C> (що може бути більш правильним з точки зору адміністрування) але я встановлював вручну, адже буде зкомпільовано лише один бінарний файл i2pd, який потрібно перемістити до системної теки:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>sudo make install<i>
</i><e>```</e></CODE>

<H4><s>#### </s>Створення системного користувача</H4>

<p>Роутер <C><s>`</s>i2pd<e>`</e></C> я запускатиму від окремого системного користувача зі стандартними привілеями:</p>

<CODE><s>```</s><i>
</i>useradd -m i2pd<i>
</i><e>```</e></CODE>

<H4><s>#### </s>Конфігурація i2pd</H4>

<p>Тепер потрібно створити файл конфігурації, його я розмістив за адресою <C><s>`</s>/etc/i2pd.conf<e>`</e></C>, хоча ви можете додати його до теки користувача, при цьому змінивши шляхи у прикладах нижче:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>nano /etc/i2pd.conf<i>
</i><e>```</e></CODE>

<p>Оригінальний файл конфігурації <URL url="https://github.com/PurpleI2P/i2pd/blob/openssl/contrib/i2pd.conf"><s>[</s>доступний в репозиторії<e>](https://github.com/PurpleI2P/i2pd/blob/openssl/contrib/i2pd.conf)</e></URL>, нижче я наведу тільки змінені його опції, але буде правильним звірити їх актуальність на момент встановлення:</p>

<CODE><s>``` /etc/i2pd.conf</s><i>
</i># рівень деталізації журналів, я змінив щоб не засмічувати пам''ять
loglevel = error

# вимикаємо стандартні інтерфейси,
# так як в цьому прикладі підключення відбувається через Yggdrasil
ipv4 = false
ipv6 = false

# вимикаємо не задіяну в конфігурації Yggdrasil функціональність
[ntcp2]
enabled = false
[ssu2]
enabled = false

# доступ до веб-адмінки роутера
# цей пункт можна лишити стандартним,
# але в мене в address вказано статичну адресу (віддаленого сервера)
# IP не повинен бути 0.0.0.0, бо доступ буде відхилено через фільтр
[http]
address = 127.0.0.1
auth = true
user = user
pass = pass

# дані опції потрібні, якщо ви користуєтесь I2P, наприклад в браузері
# в мене роутер працює на сервері (для веб-сайту) тому ці сокети вимкнено
[socksproxy]
enabled = false
[httpproxy]
enabled = false

# в мережі I2P використовується окремий протокол комунікації,
# якщо ви не плануєте підключатись до роутера через клієнтський софт, вимикаємо
[sam]
enabled = false

# вмикаємо конфігурацію роутера для роботи в режимі Yggdrasil
[meshnets]
yggdrasil = true

# роутер в режимі yggdrasil слухатиме всі мережі IPv6 (::)
# оголосити сервіс можна й на конкретній адресі нижче
# перевірити результат можна з `netstat -tulpn | grep i2pd`
# yggaddress = xxx::xxx...<i>
</i><e>```</e></CODE>

<p>Так як я не змінював стандартні шляхи, через помилку запуску згодом, додатково руками створив теку для збереження даних профілю (у вас це може бути тека користувача або інша)</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>mkdir /var/lib/i2pd
chown i2pd:i2pd /var/lib/i2pd<i>
</i><e>```</e></CODE>

<p>Також, вручну скопіював <URL url="https://github.com/PurpleI2P/i2pd/tree/openssl/contrib/certificates"><s>[</s>сертифікати<e>](https://github.com/PurpleI2P/i2pd/tree/openssl/contrib/certificates)</e></URL> ініціальних вузлів до створеної теки <C><s>`</s>/var/lib/i2pd<e>`</e></C>, інакше в конфігі доведеться вимкнути опцію <C><s>`</s>reseed.verify<e>`</e></C></p>

<H4><s>#### </s>Systemd</H4>

<p>Тепер створімо сервіс systemd. В мене він відрізняється від <URL url="https://github.com/PurpleI2P/i2pd/blob/openssl/contrib/i2pd.service"><s>[</s>стандартного<e>](https://github.com/PurpleI2P/i2pd/blob/openssl/contrib/i2pd.service)</e></URL>:</p>

<CODE><s>``` /etc/systemd/system/i2pd.service</s><i>
</i>#/etc/systemd/system/i2pd.service

[Unit]
Wants=network.target

# сервіс повинен запускатись після сервісу Yggdrasil
# у вас тут може бути інша конфігурація, залежна від конкретної мережі
# та способу її ініціації
After=yggdrasil.service

[Service]

# запуск від окремого користувача
User=i2pd
Group=i2pd

# роутер використовує дочірні процеси
Type=forking

ExecStart=/usr/local/bin/i2pd --conf=/etc/i2pd.conf --daemon --service

# лишив як в оригіналі, можливо це потрібно для реалізації i2pd
LimitNOFILE=8192

# фактично, шлях журналів буде таким, як вказано в /etc/i2pd.conf
# StandardOutput=file:///home/i2pd/debug.log
# StandardError=file:///home/i2pd/error.log

[Install]
WantedBy=multi-user.target<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>systemctl enable i2pd<e>`</e></C> - автостарт</LI>
<LI><s>* </s><C><s>`</s>systemctl start i2pd<e>`</e></C> - запуск (на цьому етапі, роутер Yggdrasil має бути активним)</LI>
<LI><s>* </s><C><s>`</s>systemctl status i2pd<e>`</e></C> - статус</LI></LIST>

<H4><s>#### </s>Ініціальний запуск роутера</H4>

<p>При першому запуску, ініціалізація мережі в мене відбувалась не одразу: системний сервіс вилітав з помилками підключення до вузлів. Наскільки я розумію, це пов''язано з відсутністю або малою кількістю ресідів Yggdrasil в мережі I2P. Якщо у вас вже є аналогічний вузол, що працює на такому (локальному) конфігі, можна спробувати імпортувати профіль мережі з нього або підняти звідти ресід: це робиться утилітою <URL url="https://github.com/PurpleI2P/pyseeder"><s>[</s>pyseeder<e>](https://github.com/PurpleI2P/pyseeder)</e></URL>. Якщо ви знаєте адресу Yggdrasil вузла онлайн, то можете просто спробувати додати його в конфігурацію <C><s>`</s>reseed.yggurls<e>`</e></C> і перезапустити i2pd.</p>

<p>Якщо конекту досі немає, і ваш роутер по якимось причинам вже пускався в режимі Інтернет, варто (після зупинки сервіса i2pd) спробувати видалити теку:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>rm -rf /var/lib/i2pd/netDb<i>
</i><e>```</e></CODE>

<p>або якщо тека нова і там немає налаштувань тунелів, то очистити її повністю:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>rm -rf /var/lib/i2pd/*<i>
</i><e>```</e></CODE>

<p>Після змін вище, не забуваємо перезапустити роутер:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>systemctl restart i2pd<i>
</i><e>```</e></CODE>

<p>Через деякий час, ініціалізація мережі таки відбулась, але що було причиною точно не знаю.</p>

<p>Перевірити статус роботи роутера можна перейшовши у браузері за адресою його адмінки. Цю адресу ми вказували в опції <C><s>`</s>http.address<e>`</e></C></p>

<H4><s>#### </s>Публікація Веб-сайту в I2P</H4>

<p>Власне, сайт (та будь який інший сервіс) публікується доволі просто: для цього використовуються так звані "<URL url="https://i2pd.readthedocs.io/en/latest/user-guide/tunnels/"><s>[</s>тунелі<e>](https://i2pd.readthedocs.io/en/latest/user-guide/tunnels/)</e></URL>" які проксуватимуть внутрішній трафік I2P на вказаний локальний сервіс, наприклад сервер Nginx.</p>

<p>Створімо новий файл <C><s>`</s>/var/lib/i2pd/tunnels.conf<e>`</e></C>, або відредагуємо існуючий, якщо його немає:</p>

<CODE><s>``` /var/lib/i2pd/tunnels.conf</s><i>
</i>[nginx]
# протокол
type = http
# хост, який прослуховує веб-сервер або Nginx
host = 127.0.0.1
# порт, у моєму випадку SSL/443 не використовується
port = 80
# внутрішній порт вхідного трафіку з I2P
inport = 80
# ідентифікатор тунелю, цей файл буде створено автоматично
keys = nginx.dat<i>
</i><e>```</e></CODE>

<p>Адреси <C><s>`</s>.i2p<e>`</e></C> не є частиною ваших приватних ключів, як це реалізовано в Yggdrasil, натомість адреса I2P є ідентифікатором маршруту. На прикладі нашої конфігурації вище, вам потрібно зберегти резервну копію <C><s>`</s>nginx.dat<e>`</e></C> що відповідає за публічну адресу Веб-сайту.</p>

<p>Подивитись яка у вас адреса - можна у Веб-адмінці роутера, у вкладці <EM><s>_</s>I2P tunnels<e>_</e></EM> &gt; <EM><s>_</s>Server Tunnels<e>_</e></EM>. Опціонально, можна зареєструвати короткий домен, але така система реєстрації не є централізованою і має ряд вимог (зокрема щодо термінів обслуговування), від того це тема для окремого матеріалу.</p>

<H5><s>##### </s>Nginx</H5>

<p>Налаштування Nginx я не змінював, бо сайт спільноти слухає різні інтерфейси, в той час як опція <C><s>`</s>host<e>`</e></C> тунелю <C><s>`</s>i2pd<e>`</e></C> пересилає з''єднання на локальний IPv6 Yggdrasil. Утім, якщо планується публікація сайту виключно в мережі I2P з <C><s>`</s>server_name = xxx.i2p<e>`</e></C> тоді потрібно додатково змінити файл <C><s>`</s>/etc/nginx.conf<e>`</e></C>:</p>

<CODE><s>``` /etc/nginx.conf</s><i>
</i>server_names_hash_bucket_size 128;<i>
</i><e>```</e></CODE>

<p>Додаткову інформацію по налаштуванням Nginx, можна також знайти <URL url="http://wiki.ilita.i2p/%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5_eep-%D1%81%D0%B0%D0%B9%D1%82%D0%B0_%D0%BD%D0%B0_%D0%B1%D0%B0%D0%B7%D0%B5_Nginx_%D0%B8_I2Pd#%D0%B8%D1%82%D0%B0%D0%BF_4._%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0_nginx"><s>[</s>тут<e>](http://wiki.ilita.i2p/Создание_eep-сайта_на_базе_Nginx_и_I2Pd#итап_4._Настройка_nginx)</e></URL>.</p>

<H2><s>## </s>Додаткові заходи</H2>

<p>Як сказано на початку матеріалу, його метою не є анонімізація. Роботу роутера я не перевіряв на предмет витоків з''єднань в Інтернет, публікація анонімного сайту (a.k.a. eepsite) - окрема тема. Якщо для вас це чутливе питання, зверніть увагу на попередні публікації, що можуть частково допомогти з ізоляцією потенційних витоків:</p>

<LIST><LI><s>* </s><URL url="/d/69-izoliaciia-linux-vid-priamix-internet-zjednan-na-bazi-qemu-virtual-machine-manager-z-vsock"><s>[</s>Ізоляція Linux від прямих Інтернет з''єднань на базі QEMU / Virtual Machine Manager з VSOCK<e>](/d/69-izoliaciia-linux-vid-priamix-internet-zjednan-na-bazi-qemu-virtual-machine-manager-z-vsock)</e></URL></LI>
<LI><s>* </s><URL url="/d/71-obmezennia-vixidnix-zjednan-na-internet-z-ufw"><s>[</s>Обмеження вихідних з''єднань на Інтернет з ufw<e>](/d/71-obmezennia-vixidnix-zjednan-na-internet-z-ufw)</e></URL></LI>
<LI><s>* </s><URL url="/d/9-bezpecnii-peregliad-saitiv-yggdrasil-z-yggstack"><s>[</s>Безпечний перегляд сайтів Yggdrasil з Yggstack<e>](/d/9-bezpecnii-peregliad-saitiv-yggdrasil-z-yggstack)</e></URL></LI></LIST>

<H2><s>## </s>Посилання</H2>

<LIST><LI><s>* </s><URL url="https://devzone.org.ua/post/vstanovlennia-routera-i2p-z-pidkliuchenniam-cherez-yggdrasil"><s>[</s>Інтернет-версія цього матеріалу на DevZone<e>](https://devzone.org.ua/post/vstanovlennia-routera-i2p-z-pidkliuchenniam-cherez-yggdrasil)</e></URL></LI></LIST></r>','2025-10-26 15:43:52',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (97,74,1,'2025-10-04 03:03:06',1,'comment','<r><p>Вирішив тут затестити рушій з відкритим кодом:<br/>
<URL url="https://github.com/afritz1/OpenTESArena">https://github.com/afritz1/OpenTESArena</URL></p>

<p>Для запуску потрібні оригінальні ігрові асети, через що довелося качати клієнт Steam. Гра безкоштовна, кому потрібні оригінальні файли без смс і реєстрації, викладаю торентом:</p>

<CODE><s>```</s><i>
</i>dcf608bb76dce55a5b4469f5179bf3cda93c1899<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><URL url="/d/62-lokalni-trekeri-bittorrent"><s>[</s>трекери<e>](/d/62-lokalni-trekeri-bittorrent)</e></URL></LI></LIST>

<p>P.S. на своєму кориті компілив так:</p>
<CODE lang="bash"><s>``` bash</s><i>
</i>git clone https://github.com/afritz1/OpenTESArena.git
cd OpenTESArena
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=ReleaseNative -DUSE_SSE4_1=OFF -DUSE_SSE4_2=OFF -DUSE_AVX=OFF -DUSE_AVX2=OFF -DUSE_AVX512=OFF -DUSE_LZCNT=OFF -DUSE_TZCNT=OFF -DUSE_F16C=OFF -DUSE_FMADD=OFF ..
make<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>після цього потрібно вказати актуальний шлях <C><s>`</s>ArenaPaths<e>`</e></C> до теки <C><s>`</s>ARENA<e>`</e></C> в <C><s>`</s>options/options-default.txt<e>`</e></C></LI>
<LI><s>* </s>для запуску гри <C><s>`</s>./otesa<e>`</e></C></LI></LIST></r>','2025-10-04 03:05:19',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (98,75,1,'2025-10-04 03:48:28',1,'comment','<r><p>Поки створено ініціальне правило фільтрації в рамках <URL url="https://github.com/PurpleI2P/i2pd/pull/2245"><s>[</s>PR#2245<e>](https://github.com/PurpleI2P/i2pd/pull/2245)</e></URL></p>

<p>Чи доведу почате до кінця - не знаю, але до відома, така ініціатива реалізується в гілці:<br/>
<URL url="https://github.com/YGGverse/i2pd/tree/mycelium">https://github.com/YGGverse/i2pd/tree/mycelium</URL></p>

<p>UPD. експериментально <URL url="https://github.com/YGGverse/i2pd/pull/1"><s>[</s>поколупавшись<e>](https://github.com/YGGverse/i2pd/pull/1)</e></URL> в реалізації транспорту, прийшов до висновку, що варто або створити окремий реєстр <C><s>`</s>eNTCP2V6MeshIdx<e>`</e></C> або перейменувати самі опції конфігу з <C><s>`</s>ygg<e>`</e></C> на щось типу <C><s>`</s>mesh<e>`</e></C> щоб воно відповідало логіці.</p>

<p>Наразі, кому потрібна підтримка Mycelium тут і зараз - простіше додати <URL url="https://github.com/PurpleI2P/i2pd/pull/2245/commits/b079fb63c759a27ef090ad759a102d1b108f5650"><s>[</s>умову<e>](https://github.com/PurpleI2P/i2pd/pull/2245/commits/b079fb63c759a27ef090ad759a102d1b108f5650)</e></URL> "OR" або замінити нею поточну (якщо потрібен моно режим) прямо в метод <C><s>`</s>IsYggdrasilAddress<e>`</e></C> що у файлі <C><s>`</s>libi2pd/util.cpp<e>`</e></C></p>

<CODE><s>``` libi2pd/util.cpp</s><i>
</i>static bool IsYggdrasilAddress (const uint8_t addr[16])
{
	return addr[0] == 0x02 || addr[0] == 0x03 ||
		addr[0] == 0x04 || addr[0] == 0x05; // 0400::/7
}<i>
</i><e>```</e></CODE>

<p>і відповідно додати в конфіг ресіди Міцелію. Інакше тут потрібен невеличкий рефакторинг / інтерес до розширення такої функціональності з боку майнтейнерів i2pd.</p>

<p>UPD 2. все-таки рішення вище не спрацює для двох мереж одночасно бо хоч-не-хоч а треба щоб роутер з''єднував тільки релевантні сімейства адрес. Отже, треба пиляти...</p></r>','2025-10-04 08:38:12',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (102,76,1,'2025-10-04 13:21:12',1,'comment','<r><p>Так як при першій <URL url="/d/73-vstanovlennia-routera-i2pd-z-pidkliucenniam-do-merezi-i2p-cerez-yggdrasil"><s>[</s>ініціалізації вузла i2pd засобами Yggdrasil<e>](/d/73-vstanovlennia-routera-i2pd-z-pidkliucenniam-do-merezi-i2p-cerez-yggdrasil)</e></URL> (для цього форуму) виникли деякі затримки, вирішив слідом за конектом свого роутера - підняти й додатковий ресід для інших локальних юзерів.</p>

<H2><s>## </s>Pyseeder</H2>

<p><URL url="https://github.com/PurpleI2P/pyseeder"><s>[</s>pyseeder<e>](https://github.com/PurpleI2P/pyseeder)</e></URL> - утиліта командного рядка, написана мовою Python. Вона використовується для різних задач, зокрема для генерації файлу <C><s>`</s>i2pseeds.su3<e>`</e></C>, необхідного для пошуку вузлів при першому запуску роутера I2P (в i2pd, він звичайно вказується в <C><s>`</s>i2pd.conf<e>`</e></C>). Це працює приблизно так, як DNS сід гаманців BitCoin.</p>

<p>Інструкції з користування pyseeder описані в <URL url="https://github.com/PurpleI2P/pyseeder/blob/master/README.md"><s>[</s>README.md<e>](https://github.com/PurpleI2P/pyseeder/blob/master/README.md)</e></URL> проєкту. Нижче опишу лише свою конфігурацію.</p>

<H3><s>### </s>Встановлення</H3>

<p>Для Debian / Linux знадобились такі пакунки:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>apt install python3 python3-virtualenv build-essential libssl-dev libffi-dev<i>
</i><e>```</e></CODE>

<p>Від користувача, яким планується подальший запуск:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>git clone https://github.com/PurpleI2P/pyseeder.git
cd pyseeder
virtualenv --python=python3 venv
. venv/bin/activate
pip3 install .<i>
</i><e>```</e></CODE>

<H3><s>### </s>Nginx</H3>

<p>В pyseeder, мене спочатку заплутала наявність сервера, адже для DNS сіда BitCoin - потрібен саме він. Тут же все простіше: потрібно просто згенерувати дамп "пірів" у статичний файл і розмістити його у теці яку слухає будь який Веб-сервер, зокрема Nginx.</p>

<p>Створімо публічну теку:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>mkdir /var/www/pyseeder
chown USER:GROUP /var/www/pyseeder<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>USER:GROUP<e>`</e></C> - ваше значення</LI></LIST>

<p>Копіюємо туди файл <C><s>`</s>seed.html<e>`</e></C> з теки <URL url="https://github.com/PurpleI2P/pyseeder/tree/master/yggdrasil"><s>[</s>yggdrasil<e>](https://github.com/PurpleI2P/pyseeder/tree/master/yggdrasil)</e></URL>:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>cp yggdrasil/seed.html /var/www/pyseeder<i>
</i><e>```</e></CODE>

<p>Приклад налаштувань хосту Nginx можна знайти у файлі <URL url="https://github.com/PurpleI2P/pyseeder/blob/master/yggdrasil/reseed_nginx.conf"><s>[</s>reseed_nginx.conf<e>](https://github.com/PurpleI2P/pyseeder/blob/master/yggdrasil/reseed_nginx.conf)</e></URL>. Я організував свій хост наступним чином:</p>

<CODE lang="reseed_nginx.conf"><s>``` reseed_nginx.conf</s><i>
</i>limit_req_zone $binary_remote_addr zone=reseed:512k rate=10r/m;
server {
	root /var/www/pyseeder;
	listen [302:68d0:f0d5:b88d::9216]:80;
	# на цьому сервері також прослуховується 0400::/7 (Mycelium)
	# listen [505:6847:c778:61a1::9216]:80;
	index seed.html;
        location /i2pseeds.su3 {
		limit_req zone=reseed burst=5;
		if ($http_user_agent !~* "Wget/1.11.4" ) { return 403; }
        }
	location /user_at_mail.i2p.crt {
                limit_req zone=reseed;
        }
}<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>не забудьте додати відповідні <URL url="http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:subnet_setting"><s>[</s>маски підмережі<e>](http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:subnet_setting)</e></URL> або використовуйте основну адресу на іншому порту, якщо 80 зайнятий</LI>
<LI><s>* </s>також після змін треба оновити конфігурацію <C><s>`</s>systemctl reload nginx<e>`</e></C></LI></LIST>

<H3><s>### </s>Генерація ключа і сертифіката</H3>

<CODE lang="bash"><s>``` bash</s><i>
</i>pyseeder keygen --cert /var/www/pyseeder/user_at_mail.i2p.crt --private-key /path/to/priv_key.pem --signer-id noreply@localhost<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>--cert<e>`</e></C> потрібен якщо на цільовому сервері увімкнена опція <C><s>`</s>reseed.verify = true<e>`</e></C>; якщо ви плануєте стати "офіційним" ресідом, його також потрібно додати до репозиторію i2pd через PR (інакше користувачу потрібно буде вказати цей сертифікат при імпорті пірів для верифікації постачальника <C><s>`</s>i2pseeds.su3<e>`</e></C>)</LI>
<LI><s>* </s><C><s>`</s>--private-key<e>`</e></C> - власне <STRONG><s>**</s>приватний<e>**</e></STRONG> ключ, яким підписуються дані для експорту</LI>
<LI><s>* </s><C><s>`</s>--signer-id<e>`</e></C> - поки не зрозумів, чому цей аргумент обов''язковий, доповню згодом, поки вказав <C><s>`</s>noreply@localhost<e>`</e></C></LI>
<LI><s>* </s>пароль на запит можна вказати пустим</LI></LIST>

<H3><s>### </s>Генерація i2pseeds.su3</H3>

<CODE lang="bash"><s>``` bash</s><i>
</i>YOUR_PASSWORD="Pa55w0rd"
echo $YOUR_PASSWORD | pyseeder reseed --netdb /path/to/netDb --private-key /path/to/priv_key.pem --outfile /var/www/pyseeder/i2pseeds.su3 --signer-id noreply@localhost<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>YOUR_PASSWORD<e>`</e></C> - пароль, який було вказано при <C><s>`</s>pyseeder keygen<e>`</e></C> (або кропаємо все до <C><s>`</s>|<e>`</e></C> та додаємо аргумент <C><s>`</s>--no-encryption<e>`</e></C> якщо пароль відсутній)</LI>
<LI><s>* </s><C><s>`</s>--netdb<e>`</e></C> - шлях до бази мережі I2P, це може бути відфільтрована скриптом або "жива" база вузла</LI>
<LI><s>* </s><C><s>`</s>--outfile<e>`</e></C> - публічна тека на Веб-сервері, звідки інші піри зможуть її забрати</LI>
<LI><s>* </s><C><s>`</s>--signer-id<e>`</e></C> - той само, що вказувався при генерації ключів</LI></LIST>

<p>Для оновлення по розкладу crontab, створімо скрипт <C><s>`</s>crontab.sh<e>`</e></C>:</p>

<CODE lang="crontab.sh"><s>``` crontab.sh</s><i>
</i>#!/bin/bash
cd /path/to/pyseeder
. venv/bin/activate
#YOUR_PASSWORD="Pa55w0rd"
#echo $YOUR_PASSWORD | pyseeder reseed --netdb /path/to/netDb --private-key /path/to/priv_key.pem --outfile /var/www/pyseeder/i2pseeds.su3 --signer-id noreply@localhost
pyseeder reseed --no-encryption --netdb /path/to/netDb --private-key /path/to/priv_key.pem --outfile /var/www/pyseeder/i2pseeds.su3 --signer-id noreply@localhost
deactivate<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>в прикладі вказані сценарії з використанням паролю і без (розкоментуйте потрібне)</LI>
<LI><s>* </s>замініть значення <C><s>`</s>YOUR_PASSWORD<e>`</e></C>, <C><s>`</s>/path/to<e>`</e></C> і <C><s>`</s>noreply@localhost<e>`</e></C> на ваші</LI>
<LI><s>* </s>додаємо права на виконання: <C><s>`</s>chmod +x crontab.sh<e>`</e></C></LI></LIST>

<p>І додамо завдання:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>crontab -e<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>виконується від потрібного користувача</LI></LIST>

<CODE lang="bash"><s>``` bash</s><i>
</i>@hourly /path/to/crontab.sh<i>
</i><e>```</e></CODE>

<H2><s>## </s>Фільтрація вузлів Yggdrasil</H2>

<p>В принципі, можна користуватись утилітою з командного рядка (після активації <C><s>`</s>. venv/bin/activate<e>`</e></C>) але у випадку піра Yggdrasil, бажано не просто здампити накопичену базу NetDB, але й відфільтрувати вузли Yggdrasil для локальних користувачів, зокрема - віддавати їх в пріоритеті. Цю задачу виконує скрипт <URL url="https://github.com/PurpleI2P/pyseeder/blob/master/yggdrasil/y2r.sh"><s>[</s>y2r.sh<e>](https://github.com/PurpleI2P/pyseeder/blob/master/yggdrasil/y2r.sh)</e></URL>.</p>

<p>Перед його запуском, важливо актуалізувати в ньому наступні шляхи:</p>

<LIST><LI><s>* </s><C><s>`</s>netdb<e>`</e></C> - донор: ймовірно, база активного вузла <C><s>`</s>/var/lib/i2pd/netDb<e>`</e></C></LI>
<LI><s>* </s><C><s>`</s>outdb<e>`</e></C> - не публічна копія з відфільтрованими результатами роботи <C><s>`</s>y2r.sh<e>`</e></C></LI>
<LI><s>* </s><C><s>`</s>sed -i "s/&gt;[0-9]\{1,1000\}&lt;/&gt;$yggaddr&lt;/" /srv/pyseeder/output/seed.html<e>`</e></C></LI>
<LI><s>* </s>інші можна лишити як є (тимчасові файли стандартно зберігатимуться в <C><s>`</s>/tmp/*<e>`</e></C>)</LI></LIST>

<p>Цей скрипт зручно виконувати через crontab з іншого скрипта, перед з командою <C><s>`</s>pyseeder reseed ...<e>`</e></C></p>

<H3><s>### </s>Збереження тимчасових файлів в оперативній пам''яті</H3>

<p>Оскільки pyseeder зберігає тимчасові дампи netDb в файл, щоб не зношувати SSD, я монтую локації y2r.sh в оперативну пам''ять. Для цього в <C><s>`</s>/etc/fstab<e>`</e></C> додаю на вибір:</p>

<H4><s>#### </s>tmpfs</H4>

<p>Цей варіант дозволяє коректно розставити права на запис і вказати потрібні опції. Також він передбачає розширення пам''яті за рахунок swap у разі перевищення фізичного простору:</p>

<CODE><s>``` /etc/fstab</s><i>
</i>tmpfs  /path/to/tmp-net-db  tmpfs  defaults  0  0<i>
</i><e>```</e></CODE>

<p>Зміни вступають в силу після перезапуску системи, якщо потрібно в рамках поточної сесії - монтуємо:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>mount -t tmpfs -o defaults tmpfs /path/to/tmp-net-db<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>опції <C><s>`</s>defaults<e>`</e></C> можуть розширюватись, наприклад <C><s>`</s>..,noatime,nosuid,nofail,size=64M<e>`</e></C></LI></LIST>

<H4><s>#### </s>ramfs</H4>

<p>У такому випадку, використовується лише фізична пам''ять, але для неї буде не доступний запис від користувача (crontab.sh). Змінити права після монтування (на прикладі вище) можна через <C><s>`</s>crontab -e<e>`</e></C> від root:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>@reboot chown USER:GROUP /path/to/tmp-net-db<i>
</i><e>```</e></CODE>

<p>але наскільки безпечним такий сценарій буде для динамічних даних ресіда - вирішуйте самостійно.</p>

<H2><s>## </s>Тестування</H2>

<p>Для перевірки, на цільовому сервері (з попередньо встановленим pyseeder) виконуємо команду:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>pyseeder transport.pull --urls http://[302:68d0:f0d5:b88d::9216]/ --outfile /path/to/i2pseeds.su3<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>для запобігання помилки парсера, важливо вказати слеш в кінці URL</LI></LIST></r>','2025-10-09 03:08:58',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (103,77,1,'2025-10-05 14:13:05',1,'comment','<r><p>Ресід спільноти. Використовується <URL url="https://github.com/PurpleI2P/pyseeder/blob/master/yggdrasil/y2r.sh#L91"><s>[</s>фільтр pyseeder<e>](https://github.com/PurpleI2P/pyseeder/blob/master/yggdrasil/y2r.sh#L91)</e></URL>:</p>

<CODE lang=".sh"><s>``` .sh</s><i>
</i>cat $dat | grep ''=.[45]..:'' &amp;&gt; /dev/null<i>
</i><e>```</e></CODE>

<p>Адреса:</p>

<CODE><s>```</s><i>
</i>http://[505:6847:c778:61a1::9216]/<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>порт 80</LI></LIST>

<p>Про <URL url="/d/76-pyseeder-pidtrimka-ekosistemi-i2p-v-merezi-yggdrasil"><s>[</s>налаштування pyseeder<e>](/d/76-pyseeder-pidtrimka-ekosistemi-i2p-v-merezi-yggdrasil)</e></URL></p></r>','2025-10-09 00:56:53',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (105,78,1,'2025-10-07 04:45:04',1,'comment','<r><p>Поставив собі месенджер:<br/>
<URL url="https://github.com/liamcottle/reticulum-meshchat">https://github.com/liamcottle/reticulum-meshchat</URL></p>

<p>Там є зручний Web-UI: чати, дзвінки і браузер сайтів - все те, що було не зрозуміло в TUI NomadNet.</p>

<p>Головне - додати піри для конекту з мережею у файл <C><s>`</s>~/.reticulum/config<e>`</e></C>, для Yggdrasil це:</p>

<CODE><s>``` ~/.reticulum/config</s><i>
</i>  [[rothbard_RNS_transport_ZA_ygg]]
    type = TCPClientInterface
    enabled = true
    target_host = 200:73eb:2e4:14be:aac7:90b3:784b:71a3
    target_port = 4242<i>
</i><e>```</e></CODE>

<p>UPD. не додумався оновити цей матеріал і написав окремий <URL url="/d/80-reticulum-vstanovlennia-na-prikladi-meshchat-z-pidkliucenniam-cerez-yggdrasil"><s>[</s>гайд<e>](/d/80-reticulum-vstanovlennia-na-prikladi-meshchat-z-pidkliucenniam-cerez-yggdrasil)</e></URL> (тему закрито, коментуйте туди)</p></r>','2025-10-07 12:19:29',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (107,79,1,'2025-10-07 11:55:54',1,'comment','<r><p>Наразі мені відомий лише один пір Yggdrasil:</p>

<p><URL url="https://yggdrasil-network.github.io/services.html#reticulum-nodes">https://yggdrasil-network.github.io/services.html#reticulum-nodes</URL></p>

<CODE><s>```</s><i>
</i>200:73eb:2e4:14be:aac7:90b3:784b:71a3 port 4242 TCP<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>ніби для нього ще є <URL url="http://[203:1bb1:40fb:4bf0:6a49:1b0b:f134:507f]/blog/post/reticulum-nomadnet"><s>[</s>точка I2P<e>](http://[203:1bb1:40fb:4bf0:6a49:1b0b:f134:507f]/blog/post/reticulum-nomadnet)</e></URL></LI></LIST>

<p>Є також мої, але вони підключені через інтерфейс вище (який не є стабільним)</p>

<CODE><s>```</s><i>
</i>202:68d0:f0d5:b88d:1d1a:555e:2f6b:3148 port 4242 TCP
505:6847:c778:61a1:5c6d:e802:d291:8191 port 4242 TCP<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>UPD. наразі вимкнено</LI></LIST>

<p>Окремий реєстр на <URL url="http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:sites_and_services:other_network_services#reticulum"><s>[</s>howto.ygg<e>](http://[222:a8e4:50cd:55c:788e:b0a5:4e2f:a92c]/yggdrasil:sites_and_services:other_network_services#reticulum)</e></URL></p>

<p>Для I2P (наче потрібен SAM) тему не конектив, але нашкріб такі кандидати (наскільки живі не знаю)</p>

<LIST><LI><s>* </s><URL url="https://github.com/markqvist/Reticulum/discussions/508"><s>[</s>g3br23bvx3lq5uddcsjii74xgmn6y5q325ovrkq2zw2wbzbqgbuq.b32.i2p<e>](https://github.com/markqvist/Reticulum/discussions/508)</e></URL></LI>
<LI><s>* </s><URL url="https://github.com/markqvist/Reticulum/discussions/27#discussioncomment-2852933"><s>[</s>re2ct667tpclusj4neu2yz6i2kqp23tnbldbiexiohund2gw2yrq.b32.i2p<e>](https://github.com/markqvist/Reticulum/discussions/27#discussioncomment-2852933)</e></URL></LI>
<LI><s>* </s><URL url="https://unsigned.io/rnode_bootstrap_console/r/connect.html"><s>[</s>mrwqlsioq4hoo2lmeeud7dkfscnm7yxak7dmiyvsrnpfag3z5tsq.b32.i2p<e>](https://unsigned.io/rnode_bootstrap_console/r/connect.html)</e></URL></LI></LIST>

<p>UPD. перешерстив інтернети, а виявляється - всі відомі піри є в офіційній вікі:<br/>
<URL url="https://github.com/markqvist/Reticulum/wiki/Community-Node-List">https://github.com/markqvist/Reticulum/wiki/Community-Node-List</URL></p></r>','2025-10-11 14:44:32',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (108,80,1,'2025-10-07 12:02:25',1,'comment','<r><p><URL url="https://github.com/markqvist/Reticulum"><s>[</s>Reticulum<e>](https://github.com/markqvist/Reticulum)</e></URL> - відносно новий протокол зв''язку, створений в першу чергу для радіо-мереж з метою захищеної, децентралізованої передачі даних в умовах високої затримки сигналу, але може працювати в оверлейному режимі (поверх інших мереж). На відміну від наявних реалізацій локальних мереж CJDNS, Yggdrasil, Mycelium та інших, в основі не використовує стек IP як такий, натомість реалізує передачу даних в етері через пірингові ретранслятори, вже знайомі користувачам I2P як "хопи".</p>

<p>Сфери застосування технології Reticulum можуть бути різними: в цивільному сегменті - розробляються такі протоколи обміну даними як <URL url="https://github.com/markqvist/lxmf"><s>[</s>LXMF<e>](https://github.com/markqvist/lxmf)</e></URL> та вже функціонуюча його засобами соціальна платформа <URL url="https://github.com/markqvist/NomadNet"><s>[</s>NomadNet<e>](https://github.com/markqvist/NomadNet)</e></URL>, що віддалено може нагадувати гібрид ZeroNet і Gemini Protocol поверх I2P, з функціональністю месенджера.</p>

<p>В технічну складову роботи мережі вдаватись не буду, оскільки сам в ній тільки розбираюсь. Натомість, пропоную ознайомитись з Reticulum на рівні користувача, встановивши клієнтське програмне забезпечення соціальної платформи та налаштувавши вузол ретрансляції для локальних користувачів мереж Yggdrasil та Mycelium.</p>

<H2><s>## </s>Клієнт</H2>

<p>Оригінальний клієнт NomadNet я пробував встановлювати багато разів, але інтерфейс TUI видавався не зручним; через вибраний мною не стабільний пір я також не міг підключитися до внутрішніх сайтів і зрозуміти як це працює. Невдовзі, перечитуючи документацію, вирішив спробувати <URL url="https://github.com/liamcottle/reticulum-meshchat"><s>[</s>MeshChat<e>](https://github.com/liamcottle/reticulum-meshchat)</e></URL>, який використовує ті само технології, але надає їх в сучасному та інтуїтивно зрозумілому форматі Web UI (засобами Vue / Node.js)</p>

<p>Окрім перегляду ресурсів NomadNet, текстового месенджера та голосових викликів, MeshChat надає деякі інструменти адміністрування і візуалізації мережі Reticulum.</p>

<p>Для встановлення MeshChat в Debian / Linux, є проста і робоча <URL url="https://github.com/liamcottle/reticulum-meshchat/blob/master/docs/meshchat_on_raspberry_pi.md"><s>[</s>інструкція<e>](https://github.com/liamcottle/reticulum-meshchat/blob/master/docs/meshchat_on_raspberry_pi.md)</e></URL>:</p>

<H3><s>### </s>Системні залежності</H3>

<p>Реалізації самої мережі Reticulum та застосунку MeshChat зокрема - написані мовою Python:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>sudo apt install git python3-pip<i>
</i><e>```</e></CODE>

<p>Для збірки Web UI сервера MeshChat, додатково знадобляться інструменти Node.js</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/nodesource.gpg
NODE_MAJOR=22
echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt update
sudo apt install nodejs<i>
</i><e>```</e></CODE>

<p>Також додамо системного користувача з текою для даних профілю:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>sudo useradd -m reticulum<i>
</i><e>```</e></CODE>

<H3><s>### </s>Встановлення</H3>

<p>Командами нижче буде встановлено маршрутизатор Reticulum, сервер MeshChat та зкомпільовано його Веб-інтерфейс:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>su reticulum
cd ~
git clone https://github.com/liamcottle/reticulum-meshchat
cd reticulum-meshchat
pip install -r requirements.txt --break-system-packages
npm install --omit=dev
npm run build-frontend<i>
</i><e>```</e></CODE>

<p>Забігаючи наперед, при запуску в мене була <URL url="https://github.com/liamcottle/reticulum-meshchat/issues/110"><s>[</s>помилка<e>](https://github.com/liamcottle/reticulum-meshchat/issues/110)</e></URL>, тут я руками створив теку:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>mkdir -p ~/reticulum-meshchat/public<i>
</i><e>```</e></CODE>

<H3><s>### </s>Системний сервіс</H3>

<p>Сервер зручно пускати через systemd. Для цього створімо сервіс (в мене він трохи відрізняється від оригіналу)</p>

<CODE><s>``` /etc/systemd/system/reticulum-meshchat.service</s><i>
</i>#/etc/systemd/system/reticulum-meshchat.service

[Unit]
Description=reticulum-meshchat

After=network.target
Wants=network-online.target
StartLimitIntervalSec=0

[Service]
Type=simple

User=reticulum
Group=reticulum

WorkingDirectory=/home/reticulum/reticulum-meshchat

# я пускаю слідом за Yggdrasil та Mycelium, в мене там затримка в 5 секунд для інших залежностей
# ExecStartPost=/bin/sleep 10s

# можна (і варто) вказати конкретний хост і порт, з якого відбуватиметься підключення до веб-адмінки
ExecStart=/usr/bin/env /usr/bin/python3 /home/reticulum/reticulum-meshchat/meshchat.py --headless --host 127.0.0.1 --port 1234

# куди писати журнали
StandardOutput=file:///home/reticulum/debug.log
StandardError=file:///home/reticulum/error.log

[Install]
WantedBy=multi-user.target<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>sudo systemctl enable reticulum-meshchat<e>`</e></C> - авто-запуск при старті системи</LI>
<LI><s>* </s><C><s>`</s>sudo systemctl start reticulum-meshchat<e>`</e></C> - запуск</LI>
<LI><s>* </s><C><s>`</s>sudo systemctl status reticulum-meshchat<e>`</e></C> - перевірка статусу</LI></LIST>

<H3><s>### </s>Фаєрвол</H3>

<p>Якщо сервер пускається локально, відкривати порт для адмінки не потрібно, просто заходимо на <URL url="http://localhost:1234">http://localhost:1234</URL></p>

<p>На віддаленій машині, потрібно відкрити відповідний порт TCP (на прикладі вище - <C><s>`</s>1234<e>`</e></C>)</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>sudo ufw allow from xx.xx.xx.xx to xx.xx.xx.xx port 1234 proto tcp<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>xx.xx.xx.xx<e>`</e></C> - IP сервера та клієнта відповідно</LI></LIST>

<H2><s>## </s>Підключення до Reticulum через Yggdrasil / Mycelium</H2>

<p>Підключитись до Reticulum в оверлейному режимі (mesh) можна різними засобами. Особисто я користуюсь мережами Yggdrasil і Mycelium, тому нижче приклад розгортання конекту для такої екосистеми.</p>

<p>Наразі, мені відома одна <URL url="https://yggdrasil-network.github.io/services.html#reticulum-nodes"><s>[</s>точка доступу для Yggdrasil<e>](https://yggdrasil-network.github.io/services.html#reticulum-nodes)</e></URL> / TCP, вона додається в налаштування роутера Reticulum, після чого потрібно перезавантажити сервер MeshChat, що через нього підключається:</p>

<CODE><s>``` ~/.reticulum/config</s><i>
</i>#~/.reticulum/config
[interfaces]
  [[rothbard_RNS_transport_ZA_ygg]]
    type = TCPClientInterface
    enabled = true
    target_host = 200:73eb:2e4:14be:aac7:90b3:784b:71a3
    target_port = 4242<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>ця нода не є стабільною, якщо у вас відвалиться конект, то майте на увазі (спробуйте віднайти та додати інші)</LI></LIST>

<H2><s>## </s>Налаштування вузла ретрансляції</H2>

<p>Коли ви успішно підключились до мережі Reticulum, буде корисним поділитись доступом до мережі з іншими. До налаштувань роутера Reticulum потрібно додати / змінити наступні налаштування:</p>

<CODE><s>``` ~/.reticulum/config</s><i>
</i>#~/.reticulum/config

# дозволити транзитний трафік (стандартно False)
enable_transport = true

[interfaces]

  # вказуємо серверний інтерфейс, на якому будемо "слухати" вхідні підключення
  # якщо у вас використовується Інтернет IPv6 і ви не хочете його використовувати,
  # краще вказати дві окремі опції для локальних інтерфейсів Mycelium і Yggdrasil.
  [[TCP Server Interface]]
    type = TCPServerInterface
    interface_enabled = true
    listen_ip = ::
    listen_port = 4242<i>
</i><e>```</e></CODE>

<p>Таким чином, з іншого сервера, я можу підключитись на обидві мережі Mycelium і Yggdrasil:</p>

<CODE><s>``` ~/.reticulum/config</s><i>
</i>#~/.reticulum/config
[interfaces]

  # клієнтські інтерфейси (ведуть на :: сервера)
  [[ygg]]
    type = TCPClientInterface
    enabled = true
    target_host = 202:68d0:f0d5:b88d:1d1a:555e:2f6b:3148
    target_port = 4242
  [[myc]]
    type = TCPClientInterface
    enabled = true
    target_host = 505:6847:c778:61a1:5c6d:e802:d291:8191
    target_port = 4242<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>ви можете додати будь які інші <URL url="https://github.com/markqvist/Reticulum/wiki/Community-Node-List"><s>[</s>піри<e>](https://github.com/markqvist/Reticulum/wiki/Community-Node-List)</e></URL> та <URL url="https://reticulum.network/manual/interfaces.html"><s>[</s>інтерфейси<e>](https://reticulum.network/manual/interfaces.html)</e></URL> з поміж доступних, в тому числі UDP або навіть I2P (зробити це можна також через Веб-адмінку MeshChat)</LI></LIST>

<p>Для доступу до сервера, в залежності від його типу, потрібно також відкрити відповідні порти (у прикладі це <C><s>`</s>4242<e>`</e></C>)</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>sudo ufw allow from 0200::/7 to 202:68d0:f0d5:b88d:1d1a:555e:2f6b:3148 port 4242 proto tcp
sudo ufw allow from 0400::/7 to 505:6847:c778:61a1:5c6d:e802:d291:8191 port 4242 proto tcp<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>актуалізуйте ваші адреси IPv6 (<C><s>`</s>ifconfig<e>`</e></C>)</LI></LIST>

<p>Після цього перезавантажуємо сервіс:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>sudo systemctl restart reticulum-meshchat<i>
</i><e>```</e></CODE>

<p>Перевіряємо</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>sudo systemctl status reticulum-meshchat
netstat -tulpn | grep 4242<i>
</i><e>```</e></CODE>

<H2><s>## </s>Дивіться також</H2>

<LIST><LI><s>* </s><URL url="/d/81-publikaciia-saitu-v-merezi-reticulum"><s>[</s>Публікація сайту в мережі Reticulum<e>](/d/81-publikaciia-saitu-v-merezi-reticulum)</e></URL></LI>
<LI><s>* </s><URL url="/d/79-spisok-vidomix-piriv-reticulum-dlia-yggdrasil-i-mycelium"><s>[</s>Список відомих пірів Reticulum для Yggdrasil і Mycelium<e>](/d/79-spisok-vidomix-piriv-reticulum-dlia-yggdrasil-i-mycelium)</e></URL></LI>
<LI><s>* </s><URL url="http://[203:1bb1:40fb:4bf0:6a49:1b0b:f134:507f]/blog/post/reticulum-nomadnet"><s>[</s>Reticulum + NomadNet<e>](http://[203:1bb1:40fb:4bf0:6a49:1b0b:f134:507f]/blog/post/reticulum-nomadnet)</e></URL> - тематичний матеріал англійською</LI>
<LI><s>* </s><URL url="https://devzone.org.ua/post/reticulum-vstanovlennia-na-prykladi-meshchat-z-pidkliuchenniam-cherez-yggdrasil"><s>[</s>Інтернет-адаптація цього матеріалу на DevZone<e>](https://devzone.org.ua/post/reticulum-vstanovlennia-na-prykladi-meshchat-z-pidkliuchenniam-cherez-yggdrasil)</e></URL></LI></LIST></r>','2025-10-12 21:19:45',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (109,78,2,'2025-10-07 12:19:05',1,'discussionLocked','{"locked":true}',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (110,81,1,'2025-10-07 15:39:18',1,'comment','<r><p>В процесі вивчення, наразі відомо, що для публікації статики Micron, потрібно встановити або <URL url="https://github.com/markqvist/NomadNet"><s>[</s>NomadNet<e>](https://github.com/markqvist/NomadNet)</e></URL> або <URL url="https://github.com/SebastianObi/RNS-Tools/tree/main/rns_server_page"><s>[</s>rns_server_page<e>](https://github.com/SebastianObi/RNS-Tools/tree/main/rns_server_page)</e></URL>, що власне реалізують відповідний протокол.</p>

<p>Цю функцію я очікував побачити з коробки у вже встановленому сервері <URL url="https://github.com/liamcottle/reticulum-meshchat"><s>[</s>MeshChat<e>](https://github.com/liamcottle/reticulum-meshchat)</e></URL>, але як мені сказали, вона там не реалізована. Взагалі, інформацію черпаю з локального форуму в форматі IRC:</p>

<CODE><s>```</s><i>
</i>d251bfd8e30540b5bd219bbbfcc3afc5:/page/meshchat.mu<i>
</i><e>```</e></CODE>

<p>Також, для отримання підтримки, мені порадили відвідати ще одну спільноту:</p>
<CODE><s>```</s><i>
</i>585f25214d432629c509e176ce7d386f:/page/index.mu<i>
</i><e>```</e></CODE>

<H2><s>## </s>Софт</H2>

<p>Підбірка софту для швидкого старту</p>

<H3><s>### </s>Утиліти</H3>

<LIST><LI><s>* </s><URL url="https://github.com/randogoth/md2mu"><s>[</s>md2mu<e>](https://github.com/randogoth/md2mu)</e></URL> - конвертор Markdown в Micron</LI></LIST>

<H3><s>### </s>Сервери</H3>

<p>Хто знайомий з Gemini protocol, в екосистемі Reticulum використовуються "сервери" - софт що реалізує динаміку (або читач статики в директорії сервера) і включає в себе функції фронтального проксі (Nginx)</p>

<LIST><LI><s>* </s><URL url="https://github.com/fr33n0w/thechatroom"><s>[</s>thechatroom<e>](https://github.com/fr33n0w/thechatroom)</e></URL> - щось типу ірки, прикольно тим, що зберігає історію</LI></LIST>

<H3><s>### </s>Клієнти</H3>

<p>Окрім NomadNet і MeshChat знайшов ще таке:</p>

<LIST><LI><s>* </s><URL url="https://github.com/fr33n0w/rBrowser"><s>[</s>rBrowser<e>](https://github.com/fr33n0w/rBrowser)</e></URL> - браузер в браузері, виключно для сьорфу</LI></LIST>

<p>Згодом розширю цей матеріал.</p></r>','2025-10-08 10:16:28',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (111,82,1,'2025-10-08 15:24:28',1,'comment','<r><p>Якось, був організував собі <URL url="/d/69-izoliaciia-linux-vid-priamix-internet-zjednan-na-bazi-qemu-virtual-machine-manager-z-vsock"><s>[</s>віртуальну систему, ізольовану від Інтернет засобами VSOCK<e>](/d/69-izoliaciia-linux-vid-priamix-internet-zjednan-na-bazi-qemu-virtual-machine-manager-z-vsock)</e></URL>, з доступом виключно до мережі Yggdrasil. Оскільки мені потрібно звідти якось брати оновлення і робити це безпечно, вирішив на іншій машині, де є Інтернет - підняти вихідний проксі (out-proxy)</p>

<H2><s>## </s>Сервер</H2>

<p>В Debian, сервер squid ставиться з репозиторію:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>apt install squid<i>
</i><e>```</e></CODE>

<H3><s>### </s>Налаштування</H3>

<p>Тут в мене передбачається взаємодія між проксі-сервером "a" та клієнтом "b" на IPv6 інтерфейсі:</p>

<CODE><s>``` /etc/squid/debian.conf</s><i>
</i>#/etc/squid/debian.conf

# інтерфейс, на якому слухати вхідні підключення
http_port [aaa:aaaa:aaaa:aaaa:aaaa]:3128

# налаштування журналів
logfile_rotate 0

# оголошуємо групу "remote", куди входить IP "b"
acl remote src bbb:bbbb:bbbb:bbbb:bbbb

# оголошуємо набір правил "updates" типу "dstdomain"
# мені проксі потрібен тільки для системних оновлень,
# окрім iptables, на всяк випадок, я вирішив додати правила на піддомени (у вас може бути інший набір - дивіться /etc/apt/sources.list.d)
acl updates  dstdomain  .debian.org .debian.net .armbian.com .github.com .gitlab.com .crates.io .fastlydns.net .librewolf.net .nodesource.com

# вмикаємо обмеження у послідовності
http_access    allow      remote    updates
http_access    deny       all<i>
</i><e>```</e></CODE>

<p>Запускаємо і дивимось чи все в порядку:</p>

<LIST><LI><s>* </s><C><s>`</s>systemctl restart squid<e>`</e></C> - застосувати зміни конфігурації (перезапуск)</LI>
<LI><s>* </s><C><s>`</s>systemctl enable squid<e>`</e></C> - автозапуск проксі сервера при старті системи</LI>
<LI><s>* </s><C><s>`</s>systemctl status squid<e>`</e></C> - статус проксі сервера</LI>
<LI><s>* </s><C><s>`</s>netstat -tulpn | grep 3128<e>`</e></C> - перевірити, де слухається порт</LI></LIST>

<H3><s>### </s>Фаєрвол</H3>

<p>Yggdrasil - це локальна мережа, відповідно до нашого проксі можуть підключитись усі її користувачі (а не тільки наша віртуальна машина)<br/>
Якщо ви не хочете щоб усі ходили з вашого Інтернет IP на вказані сервери групи "updates", потрібно дозволити доступ тільки конкретній адресі, у нашому випадку це "b". Для керування iptables, я використовую фронт-енд ufw, тому приклад такий:</p>

<CODE><s>```</s><i>
</i>ufw allow from bbb:bbbb:bbbb:bbbb:bbbb to aaa:aaaa:aaaa:aaaa:aaaa port 3128 proto tcp<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>переконайтесь що фаєрвол активний і правило додане: <C><s>`</s>ufw status<e>`</e></C></LI></LIST>

<p>Також, в мене <URL url="/d/71-obmezennia-vixidnix-zjednan-na-internet-z-ufw"><s>[</s>вимкнені вихідні (пірингові) підключення в Інтернет<e>](/d/71-obmezennia-vixidnix-zjednan-na-internet-z-ufw)</e></URL> з машини "a" де працює проксі-сервер, тому я окремо дозволив вихід на 80/443 TCP:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ufw allow out 80,443/tcp<i>
</i><e>```</e></CODE>

<p>На Веб-порти, я згодом планую дозволяти тільки конкретні IP по списку. Для цього знадобиться скрипт, що резольвитиме DNS і оновлюватиме правила iptables. Є готові "комбайни" типу Dansguardian, але мені тут не потрібен батьківський контроль з його семантичними фільтрами. Вирішуйте це питання для себе окремо.</p>

<H2><s>## </s>Клієнт</H2>

<p>На клієнтській машині, в залежності від програмного забезпечення, шукаємо його налаштування і вказуємо там проксі. На прикладі apt в Debian, це буде файл:</p>

<CODE><s>``` /etc/apt/apt.conf.d/proxy.conf</s><i>
</i>#/etc/apt/apt.conf.d/proxy.conf
Acquire::http::Proxy "http://[aaa:aaaa:aaaa:aaaa:aaaa]:3128";
Acquire::https::Proxy "http://[aaa:aaaa:aaaa:aaaa:aaaa]:3128";<i>
</i><e>```</e></CODE>

<p>Для підключення репозиторіїв утилітою extrepo, використовується команда з префіксом:</p>

<CODE><s>```</s><i>
</i>https_proxy=http://[aaa:aaaa:aaaa:aaaa:aaaa]:3128 extrepo enable librewolf<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>або / і <C><s>`</s>http_proxy<e>`</e></C></LI></LIST>

<p>І так далі: тут гуглимо для себе, що кому треба.</p>

<p>Якщо при підключенні бачите помилку групи 400, ймовірно потрібно додати домен до білого списку: йдемо на сервер і змінюємо нашу групу ACL ("updates"), після чого перезапускаємо squid і пробуємо підключитись знову.</p></r>','2025-10-08 16:55:28',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (113,83,1,'2025-10-09 00:09:55',1,'comment','<r><p>Список каналів, які мені сподобались (оновлюється)</p>

<H2><s>## </s>Адміністрування</H2>

<LIST><LI><s>* </s><URL url="https://www.youtube.com/@acetonevideo"><s>[</s>Acetone video<e>](https://www.youtube.com/@acetonevideo)</e></URL> (RU) - приватність, I2P, Yggdrasil, історія мереж</LI>
<LI><s>* </s><URL url="https://www.youtube.com/@libretrack9214"><s>[</s>LibreTrack<e>](https://www.youtube.com/@libretrack9214)</e></URL> (RU) - I2P, Tor, OpenSouce</LI>
<LI><s>* </s><URL url="https://www.youtube.com/@pro-technologyi"><s>[</s>ПРОтехнологии<e>](https://www.youtube.com/@pro-technologyi)</e></URL> (RU) - мережі, віртуальні машини</LI></LIST>

<H2><s>## </s>Програмування</H2>

<H3><s>### </s>C++</H3>

<LIST><LI><s>* </s><URL url="https://www.youtube.com/@BloganProgrammingUkraine"><s>[</s>Blogan<e>](https://www.youtube.com/@BloganProgrammingUkraine)</e></URL> (UA) - уроки C++, кому треба швидко влитись в тему, є уроки C#</LI></LIST>

<H3><s>### </s>Rust</H3>

<LIST><LI><s>* </s><URL url="https://www.youtube.com/@bitwiseuwu"><s>[</s>Bitωise<e>](https://www.youtube.com/@bitwiseuwu)</e></URL> (RU) - найкращий канал, який зустрічав: конструктивно та без води</LI></LIST>

<H2><s>## </s>Теревені</H2>

<LIST><LI><s>* </s><URL url="https://kyiv.tube/c/eqtv_ua"><s>[</s>eQtv українською мовою<e>](https://kyiv.tube/c/eqtv_ua)</e></URL> (UA) - проект eQualitie, неприбуткової організації, що розробляє технології для підвищення цифрової стійкості, особливо для спільнот, яким загрожують цензура, стеження, зміна клімату та мережева ізоляція</LI>
<LI><s>* </s><URL url="https://peertube.in.ua/c/x_quantum_quest/videos"><s>[</s>X-Quantum_Quest<e>](https://peertube.in.ua/c/x_quantum_quest/videos)</e></URL> (UA) - про антени :)</LI></LIST></r>','2025-11-01 10:59:53',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (114,84,1,'2025-10-09 20:33:29',1,'comment','<r><p>Стало цікаво перевірити роботу <URL url="https://geminiprotocol.net"><s>[</s>протоколу Gemini<e>](https://geminiprotocol.net)</e></URL> в контексті I2P, адже вочевидь, ці технології - ніби створені одна для одної:</p>

<LIST type="decimal"><LI><s>1. </s>мінімальний розмір контенту, та одно-поточні запити до сервера: що добре для швидкості відгуку та легкі для мережі I2P в цілому, адже не тягатимуть купу асинхронних скриптів, трекерів, стилів, медіа та іншого мотлоху</LI>
<LI><s>2. </s>приватно-орієнтованість: немає заголовків з рефералами, сторонніх підвантажень контенту, а отже - не потрібні костилі з <URL url="/d/69-izoliaciia-linux-vid-priamix-internet-zjednan-na-bazi-qemu-virtual-machine-manager-z-vsock"><s>[</s>ізольованими контейнерами<e>](/d/69-izoliaciia-linux-vid-priamix-internet-zjednan-na-bazi-qemu-virtual-machine-manager-z-vsock)</e></URL>, <URL url="/d/9-bezpecnii-peregliad-saitiv-yggdrasil-z-yggstack"><s>[</s>окремі браузери з PAC<e>](/d/9-bezpecnii-peregliad-saitiv-yggdrasil-z-yggstack)</e></URL> чи <URL url="/d/71-obmezennia-vixidnix-zjednan-na-internet-z-ufw"><s>[</s>правила фаєрволу<e>](/d/71-obmezennia-vixidnix-zjednan-na-internet-z-ufw)</e></URL>, що фільтруватимуть потенційні витоки з''єднань на Інтернет</LI>
<LI><s>3. </s>відсутність потреби у виділеному IP: роутер I2P може поставити собі кожен, для цього не потрібно навіть відкривати порт</LI>
<LI><s>4. </s>ідеально для соціальних децентралізованих застосунків: <URL url="https://geminiprotocol.net/docs/protocol-specification.gmi#client-certificates"><s>[</s>авторизація на базі TLS<e>](https://geminiprotocol.net/docs/protocol-specification.gmi#client-certificates)</e></URL> не передбачає передачу на сервер класичних для Веб e-mail, паролів та іншої потенційно чутливої інформації</LI></LIST>

<p>Сьогодні таки зібрався і вирішив спробувати опублікувати [свою капсулу](gemini://ps.cities.yesterweb.org) (у просторі Gemini - так називається сайт) При цьому, вирішив не проксувати трафік I2P на віддалений хостинг <URL url="https://yesterweb.org/community/gemini/"><s>[</s>Yesterweb<e>](https://yesterweb.org/community/gemini/)</e></URL>, а саме задзеркалити копію ресурсу (mirror) на локальному сервері.</p>

<H2><s>## </s>I2P</H2>

<p>Тут передбачається, що вже встановлено роутер I2P. Якщо ні - перегляньте <URL url="/d/73-vstanovlennia-routera-i2pd-z-pidkliucenniam-do-merezi-i2p-cerez-yggdrasil"><s>[</s>попередній матеріал<e>](/d/73-vstanovlennia-routera-i2pd-z-pidkliucenniam-do-merezi-i2p-cerez-yggdrasil)</e></URL> або скористайтесь <URL url="https://i2pd.readthedocs.io/en/latest/"><s>[</s>офіційною документацією<e>](https://i2pd.readthedocs.io/en/latest/)</e></URL> (i2pd)</p>

<p>Для публікації капсули, достатньо додати наступну конфігурацію до файлу <C><s>`</s>/var/lib/i2pd/tunnels.conf<e>`</e></C>:</p>

<CODE lang="tunnels.conf"><s>``` tunnels.conf</s><i>
</i>[gemini]
type = server
host = 127.0.0.1
port = 1965
keys = gemini.dat<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>gemini<e>`</e></C> - умовна назва вашого профілю</LI>
<LI><s>* </s>шлях до <C><s>`</s>tunnels.conf<e>`</e></C> може відрізнятись, в залежності від налаштувань</LI></LIST>

<p>Тепер потрібно перезапустити i2pd:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>systemctl i2pd restart<i>
</i><e>```</e></CODE>

<p>Після цього, роутером буде згенеровано ключ тунелю - по суті, він є вашим доменом в мережі I2P (знаходиться відповідно в файлі <C><s>`</s>/var/lib/i2pd/gemini.dat<e>`</e></C>) тому бажано забекапити його копію у надійному місці для можливості відновлення.</p>

<H2><s>## </s>Agate</H2>

<p><URL url="https://github.com/mbrubeck/agate"><s>[</s>Agate<e>](https://github.com/mbrubeck/agate)</e></URL> - це <URL url="https://github.com/kr1sp1n/awesome-gemini"><s>[</s>один з відомих<e>](https://github.com/kr1sp1n/awesome-gemini)</e></URL> серверів Gemini для публікації статики Gemtext, написаний мовою Rust.</p>

<p><EM><s>*</s>Взагалі, я хотів би опублікувати дзеркало на усі мережі: I2P, Yggdrasil і Mycelium, але сервер Agate має свою специфіку роботи з SNI: чомусь, більшість розробників в очі не бачили IPv6 і таке поняття як мульти-стек. Тому забігаючи на перед - ця інструкція підходить лише для публікації одного домену в I2P; якщо ви хочете забіндитись на різні мережі, то подивіться сервер <URL url="https://devzone.org.ua/post/gmid-bahatofunktsionalnyy-proksi-server-dlia-gemini"><s>[</s>gmid<e>](https://devzone.org.ua/post/gmid-bahatofunktsionalnyy-proksi-server-dlia-gemini)</e></URL> (clang)<e>*</e></EM></p>

<H3><s>### </s>Встановлення</H3>

<p>Інформація доступна в репозиторії проєкту, але я зібрав для себе по вже натоптаному шляху:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>git clone https://github.com/mbrubeck/agate.git
cd agate
cargo build --release
sudo install target/release/agate /usr/local/bin/agate<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><URL url="/d/15-vstanovlennia-ostannyoyi-versiyi-rust-v-linux"><s>[</s>встановлення останньої версії Rust в Linux<e>](/d/15-vstanovlennia-ostannyoyi-versiyi-rust-v-linux)</e></URL></LI></LIST>

<p>Створімо окремого користувача з домашньою текою, від якого запускатимемо сервер і де зберігатимемо статичні файли:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>useradd -m agate<i>
</i><e>```</e></CODE>

<H3><s>### </s>Systemd</H3>

<CODE><s>``` /etc/systemd/system/agate.service</s><i>
</i>#/etc/systemd/system/agate.service

[Unit]
After=network-online.target
Wants=network-online.target

[Service]
Type=simple

User=agate
Group=agate

WorkingDirectory=/home/agate
ExecStart=/usr/local/bin/agate --content /home/agate/public --addr 127.0.0.1:1965 --hostname xxxx.b32.i2p

StandardOutput=file:///home/agate/debug.log
StandardError=file:///home/agate/error.log

[Install]
WantedBy=multi-user.target<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>xxxx.b32.i2p<e>`</e></C> - ваш домен в I2P</LI>
<LI><s>* </s><C><s>`</s>/home/agate/public<e>`</e></C> - тека зі статичними файлами для публікації</LI></LIST>

<H2><s>## </s>Запуск</H2>

<p>Порт 1965 відкривати не потрібно, адже вхідний трафік йтиме з локального роутера i2pd.</p>

<LIST><LI><s>* </s><C><s>`</s>systemctl start agate<e>`</e></C> - запускаємо сервер</LI>
<LI><s>* </s><C><s>`</s>systemctl enable agate<e>`</e></C> - додаємо в автозапуск при старті системи</LI>
<LI><s>* </s><C><s>`</s>systemctl status agate<e>`</e></C> - перевіряємо роботу</LI></LIST>

<H2><s>## </s>Клієнт</H2>

<p>Для доступу до ресурсів I2P, потрібен клієнт (браузер) Gemini з функціями проксування SOCKS або HTTP. Наскільки мені відомо, популярний браузер <URL url="https://github.com/skyjake/lagrange/"><s>[</s>Lagrange<e>](https://github.com/skyjake/lagrange/)</e></URL> (на момент публікації матеріалу) того не вміє. Останнім часом, активно розвивається клієнт <URL url="https://github.com/mochaman/alhena"><s>[</s>Alhena<e>](https://github.com/mochaman/alhena)</e></URL>, але там альтернативно реалізована клієнтська частина, що виходить за рамки специфікації і підвантажує inline-медіа на фоні.</p>

<p>Особисто я користуюсь спеціально створеним для моїх потреб GTK браузером <URL url="https://github.com/YGGverse/Yoda"><s>[</s>Yoda<e>](https://github.com/YGGverse/Yoda)</e></URL>, де реалізовано підтримку різних типів проксі а також маршрутизацію по regex і пріоритетам:</p>

<CODE><s>```</s><i>
</i>\.i2p$ http://127.0.0.1:4444<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>regex + локальний проксі відповідно</LI>
<LI><s>* </s>стандартно, сервер HTTP в i2pd працює на порту 4444</LI>
<LI><s>* </s>правило регулярного виразу актуальне для версії 0.12.2+</LI></LIST>

<p>В інтерфейсі налаштувань це виглядає так:</p>

<p><IMG alt="Налаштування проксі I2P в Yoda" src="/data/d/84/yoda-proxy-settings-i2p.png"><s>![</s>Налаштування проксі I2P в Yoda<e>](/data/d/84/yoda-proxy-settings-i2p.png)</e></IMG></p>
<LIST><LI><s>* </s>на прикладі видно окремий рядок налаштувань з іншого проксі (<URL url="https://github.com/yggdrasil-network/yggstack"><s>[</s>Yggstack<e>](https://github.com/yggdrasil-network/yggstack)</e></URL>) для адрес Yggdrasil, не звертайте на нього уваги - його вимкнено, але якщо у вас є інші активні правила, для них можна вказати пріоритет (замість <C><s>`</s>0<e>`</e></C>)</LI></LIST>

<p>Після цього, можна відкрити адресу в браузері, наприклад:</p>

<CODE><s>```</s><i>
</i>gemini://shxxkkrws2m6qowjse5jpgmu64vzupnnhxrhdzrn6fr6m7ynddbq.b32.i2p<i>
</i><e>```</e></CODE></r>','2025-10-10 10:31:20',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (115,85,1,'2025-10-12 14:59:02',1,'comment','<r><p>Дамп Google Drive від 12.10.2025</p>

<p>Вміст файлів мною не перевірявся.</p>

<CODE><s>```</s><i>
</i>52183486a74be5d9a8b32510a0f408efce85d6dd<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><URL url="/d/62-lokalni-trekeri-bittorrent"><s>[</s>трекери<e>](/d/62-lokalni-trekeri-bittorrent)</e></URL></LI></LIST>

<H2><s>## </s>Посилання</H2>

<LIST><LI><s>* </s><URL url="https://drive.google.com/drive/folders/1fIiZz8xwNdMX7tzOpxOGTlilDqkg3pVa"><s>[</s>Джерело<e>](https://drive.google.com/drive/folders/1fIiZz8xwNdMX7tzOpxOGTlilDqkg3pVa)</e></URL></LI>
<LI><s>* </s><URL url="https://gamedev.dou.ua/forums/topic/56041/"><s>[</s>Анонс на DOU<e>](https://gamedev.dou.ua/forums/topic/56041/)</e></URL></LI></LIST></r>','2025-10-12 15:00:03',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (116,86,1,'2025-10-12 21:17:22',1,'comment','<r><p>Недавно спробував запустити роутер <URL url="/d/80-reticulum-meshchat-z-pidkliucenniam-cerez-yggdrasil"><s>[</s>Reticulum в оверлейному режимі через Yggdrasil<e>](/d/80-reticulum-meshchat-z-pidkliucenniam-cerez-yggdrasil)</e></URL>. Трішки посьорфивши мережу засобами LXMF, так і не знайшов відповіді як цю штуку змусити працювати зі звичними програмами та їх протоколами, адже всюди маячить Micron і не ясно, як мені опублікувати HTML чи Gemtext у разі якщо "великий інтернет" наїбнеться.</p>

<p>Вже майже не маючи надії отримати відповідь на тисячу виникших питань, вирішив запитати на форумі BBS, і о чудо, мені навіть відповіли по цій темі:<br/>
gemini://bbs.geminispace.org/u/ps/33594</p>

<p>Зокрема, всплив ось такий софт для вивчення:</p>
<LIST><LI><s>* </s><URL url="https://github.com/cotteux/RetiGemiProxy"><s>[</s>RetiGemiProxy<e>](https://github.com/cotteux/RetiGemiProxy)</e></URL> - Gemini proxy for using Lagrange with Lora network on Reticulum Network</LI>
<LI><s>* </s><URL url="https://codeberg.org/int32/gemini-reticulum"><s>[</s>gemini-reticulum<e>](https://codeberg.org/int32/gemini-reticulum)</e></URL> - Python libraries and examples to use the Gemini protocol on Reticulum</LI></LIST>

<p>Так чи інакше, свій оверлейний роутер я поки що погасив (бо не люблю жерти ресурс без потреби) але можливо, коли в мене буде час запустити свій радіо-модуль, повернусь до цього питання ще раз.</p></r>','2025-10-12 21:17:42',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (117,87,1,'2025-10-17 23:22:55',1,'comment','<r><p>Нещодавно знайшов супутниковий канал <URL url="https://tv.equalitie.org/uk/live/"><s>[</s>eQtv<e>](https://tv.equalitie.org/uk/live/)</e></URL> на різні теми ІТ. Наскільки розумію, на PeerTube є офіційний <URL url="https://kyiv.tube/c/eqtv_ua"><s>[</s>канал<e>](https://kyiv.tube/c/eqtv_ua)</e></URL>, де можна дивитись історію стрімів онлайн або скачати відео через торент.</p>

<p>Також вирішив стати на роздачу деяких (переглянутих мною) відео в локальних мережах Yggdrasil та Mycelium. Для цього додайте <URL url="/d/62-lokalni-trekeri-bittorrent"><s>[</s>відповідні трекери<e>](/d/62-lokalni-trekeri-bittorrent)</e></URL> до вашого клієнта. Якщо маєте можливість клірнет-піринга, додайте й офіційний трекер каналу: <C><s>`</s>https://kyiv.tube/tracker/announce<e>`</e></C></p>

<p><STRONG><s>**</s>Зверніть увагу<e>**</e></STRONG>: оригінальні торенти (що завантажуються з PeerTube), окрім трекерів, містять адресу веб-сокета (<C><s>`</s>wss://kyiv.tube:443/tracker/socket<e>`</e></C>) для прямого завантаження з сервера платформи. На <URL url="http://tracker.ygg"><s>[</s>βtracker<e>](http://tracker.ygg)</e></URL> можна скористатись пошуком і отримати локальне (чисте) посилання Magnet, якщо у вас немає доступу до Інтернет або ви не хочете з''єднуватись напряму. Додавати тег eQtv я не став, щоб зберегти сумісність хешів, тому шукайте тим ключам, що є в оригінальних назвах.</p>

<H2><s>## </s>Добірки</H2>

<p>Створені мною колекції для швидкого завантаження завершених серій. Такі роздачі не є частиною Fediverse і потрібні лише для зручності завантаження:</p>

<LIST><LI><s>* </s><C><s>`</s>2bb19e43acf4532d55e46fd4d35595b55e3855b4<e>`</e></C> - Готуємося до сертифікації з кібербезпеки</LI></LIST></r>','2025-10-18 15:55:06',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (119,88,1,'2025-10-18 15:00:11',1,'comment','<r><p>Роздача <URL url="https://peertube.in.ua/c/x_quantum_quest/videos"><s>[</s>оригінальних торентів з PeerTube<e>](https://peertube.in.ua/c/x_quantum_quest/videos)</e></URL> для локальних мереж Yggdrasil та Mycelium:</p>
<LIST><LI><s>* </s><C><s>`</s>ef3ba81967c458b45299812acbe3851ea8ff492e<e>`</e></C> -  <URL url="https://peertube.in.ua/w/cuUCxYiTAZPrY8nVsLCn6z"><s>[</s>Антена ＂Asymmetric Turnstile＂ для прийому погодних супутників!<e>](https://peertube.in.ua/w/cuUCxYiTAZPrY8nVsLCn6z)</e></URL></LI>
<LI><s>* </s><C><s>`</s>e78f1ace9c3af96e6653cc212042ab26ce617f81<e>`</e></C> - <URL url="https://peertube.in.ua/w/oBi3E6823D83FprdYf9Z9g"><s>[</s>Приймаємо короткі хвилі (HF) на RTL-SDR!<e>](https://peertube.in.ua/w/oBi3E6823D83FprdYf9Z9g)</e></URL></LI></LIST>

<p>Можливо потім об''єднаю в серію. Трекери обираємо <URL url="/d/62-lokalni-trekeri-bittorrent"><s>[</s>тут<e>](/d/62-lokalni-trekeri-bittorrent)</e></URL>.</p></r>','2025-10-18 16:02:54',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (120,89,1,'2025-10-18 15:44:12',1,'comment','<r><p>Добірка тематичних відео з PeerTube каналу <URL url="https://peertube.in.ua/c/digital_nomad"><s>[</s>Digital Nomad<e>](https://peertube.in.ua/c/digital_nomad)</e></URL>. Піринг доступний для користувачів мереж Yggdrasil та Mycelium (див. <URL url="/d/62-lokalni-trekeri-bittorrent"><s>[</s>трекери<e>](/d/62-lokalni-trekeri-bittorrent)</e></URL>).</p>

<LIST><LI><s>* </s><C><s>`</s>196a9816dfc55b177a63ba67481fbb9a84702603<e>`</e></C> - <URL url="https://peertube.in.ua/w/1rzbvQx4rR5eQxPWc94vzH"><s>[</s>Моя віртуальна мережа з комп''ютерів [#2]<e>](https://peertube.in.ua/w/1rzbvQx4rR5eQxPWc94vzH)</e></URL></LI></LIST></r>','2025-10-18 15:46:25',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (121,90,1,'2025-10-19 23:10:59',1,'comment','<r><p>Після деякої паузи, все ж вирішив підняти дзеркало <URL url="https://github.com/YGGverse/rssto"><s>[</s>rssto<e>](https://github.com/YGGverse/rssto)</e></URL>, цього разу для I2P. Mycelium / Yggdrasil не планую бо його все одно ніхто не читає, а в мене є складнощі з організацією мультибіндінгу на сервері Agate.</p>

<CODE><s>```</s><i>
</i>gemini://ry6hezqckcbqgwrkyb6w3rzcyyrvkx3dqlskk7ry3egcg3lcadzq.b32.i2p<i>
</i><e>```</e></CODE>

<p>P.S. В цілому, я бачу для себе комбінацію Gemini+I2P максимально гармонічною, <URL url="/d/40-rss-dampi-dlia-merez-yggdrasil-ta-mycelium-nex"><s>[</s>минулого разу<e>](/d/40-rss-dampi-dlia-merez-yggdrasil-ta-mycelium-nex)</e></URL> був Nex, але після певного часу користування цим протоколом, все ж бачу використання TLS доречним, а засоби Gemini більш зручними в плані інтерактивності, мігруючи з Веб.</p></r>',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (122,91,1,'2025-10-20 04:52:45',1,'comment','<r><QUOTE><i>&gt; </i><p>eQtv — це проект eQualitie, неприбуткової організації, що розробляє технології для підвищення цифрової стійкості, особливо для спільнот, яким загрожують цензура, стеження, зміна клімату та мережева ізоляція.</p></QUOTE>

<p>Наразі аудіо, 32 kb/s (якість зумовлена сумісністю з пропускним каналом I2P)</p>

<LIST><LI><s>* </s>http://[202:68d0:f0d5:b88d:1d1a:555e:2f6b:3148]:8000/eQtv.mp3 - Yggdrasil</LI>
<LI><s>* </s>http://[505:6847:c778:61a1:5c6d:e802:d291:8191]:8000/eQtv.mp3 - Mycelium</LI>
<LI><s>* </s><URL url="http://mrkssh4b2qkrf5hl4yxrwbtuowbmjugozaa7emaybnokw5jtcydq.b32.i2p/eQtv.mp3">http://mrkssh4b2qkrf5hl4yxrwbtuowbmjugozaa7emaybnokw5jtcydq.b32.i2p/eQtv.mp3</URL> - I2P</LI></LIST>

<H2><s>## </s>Дивіться також</H2>

<LIST><LI><s>* </s><URL url="/d/92-proksuvannia-m3u8-zasobami-icecast"><s>[</s>Приклад налаштування Icecast<e>](/d/92-proksuvannia-m3u8-zasobami-icecast)</e></URL></LI></LIST></r>','2025-10-20 06:05:50',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (124,92,1,'2025-10-20 06:03:01',1,'comment','<r><p>Я не маю значного досвіду з адміністрування стрімінгових сервісів, раніше на базі Icecast робив тільки локальну <URL url="/d/67-veb-radio-v-linux-vstanovlennia-servera-icecast-ta-bazove-nalastuvannia-rotaciyi-z-ezstream"><s>[</s>ротацію музичної колекції<e>](/d/67-veb-radio-v-linux-vstanovlennia-servera-icecast-ta-bazove-nalastuvannia-rotaciyi-z-ezstream)</e></URL>, але зацікавив проєкт довкола-айтішних стрімів <URL url="https://tv.equalitie.org/uk/live/"><s>[</s>eQtv<e>](https://tv.equalitie.org/uk/live/)</e></URL>. Цей матеріал - невеличка нотатка про налаштування проксі на прикладі сервісу <URL url="/d/91-retransliaciia-eqtv-ukrayinskoiu-movoiu-dlia-lokalnix-merez"><s>[</s>eQtv українською мовою для локальних мереж<e>](/d/91-retransliaciia-eqtv-ukrayinskoiu-movoiu-dlia-lokalnix-merez)</e></URL>.</p>

<p>Витягнути потік виявилось задачею не тривіальною, я її постійно відкладав але згодом таки знайшов в дебагах (<C><s>`</s>ctrl+shift+i<e>`</e></C>) наступні доріжки:</p>

<LIST><LI><s>* </s><C><s>`</s>https://eqtv.live:8083/eqtvua/eqtvua480/chunks_dvr.m3u8<e>`</e></C> - схоже, що відповідає за відео</LI>
<LI><s>* </s><C><s>`</s>https://eqtv.live:8083/eqtvua/eqtvua_hd_ukr/chunks_dvr.m3u8<e>`</e></C> - відповідає за аудіо-ряд (їх там три)</LI></LIST>

<H2><s>## </s>ffmpeg</H2>

<p>Вже звичний мені ezstream не вміє проксувати потоки з URL, тому віднайшов спосіб з ffmpeg:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ffmpeg -i "https://eqtv.live:8083/eqtvua/eqtvua_hd_ukr/chunks_dvr.m3u8?nimblesessionid=xxx" -c:a copy icecast://user:password@127.0.0.1:8000/eQtv.aac<i>
</i><e>```</e></CODE>

<p>У прикладі вище - потік передається в Icecast "як є" у форматі AAC, але такий формат мені не зовсім підходить, бо я хочу окрім оверлейних мереж Yggdrasil і Mycelium ще й стрімити в I2P з його "вузьким" каналом. Хоч конвертація вимагає додаткових ресурсів CPU, все ж вирішив її застосувати, звівши до поширеного формату MP3 з бітрейтом 32 kb/s:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ffmpeg -i "https://eqtv.live:8083/eqtvua/eqtvua_hd_ukr/chunks_dvr.m3u8?nimblesessionid=xxx" -b:a 32k icecast://user:password@127.0.0.1:8000/eQtv.mp3<i>
</i><e>```</e></CODE>

<p>Як видно на прикладах вище, я додав до URL джерела аргумент <C><s>`</s>?nimblesessionid=xxx<e>`</e></C> - він потрібен для того, щоб ffmpeg не плодив нові сесії в процесі читання. Тут я ще не знаю, як довго протримається поточна сесія, але якщо будуть проблеми - напишу скрипт, що витягає актуальний її номер та доповню цей матеріал.</p>

<p>UPD. очікувано, сесія прожила менше доби, тому створив такий скрипт, будемо пускати його в <C><s>`</s>ExecStart<e>`</e></C> сервісу systemd, замість сирої команди <C><s>`</s>ffmpeg<e>`</e></C>:</p>

<CODE><s>``` /home/eqtv/stream.sh</s><i>
</i>#!/bin/bash

# завантажуємо актуальний файл m3u8, що містить активний номер сесії
# та витягаємо перше знайдене значення в змінну SESSION_ID
CHUNKS_DVR="/home/eqtv/chunks_dvr.m3u8"
wget -O $CHUNKS_DVR https://eqtv.live:8083/eqtvua/eqtvua_hd_ukr/chunks_dvr.m3u8
SESSION_ID=$(grep -oP ''(?&lt;=sessionid=)\d+'' $CHUNKS_DVR -m 1)
if [ -z "$SESSION_ID" ]; then
  echo "SESSION_ID is empty. Exiting script."
  exit 1
fi

# запускаємо стрім з актуальним значенням SESSION_ID
ffmpeg -i "https://eqtv.live:8083/eqtvua/eqtvua_hd_ukr/chunks_dvr.m3u8?nimblesessionid=$SESSION_ID" -b:a 32k icecast://user:password@127.0.0.1:8000/eQtv.mp3<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>цей скрипт передбачає роботу з systemd: під час помилки процесу, буде виконано <C><s>`</s>Restart=on-failure<e>`</e></C>, таким чином ключ сесії буде актуалізовано</LI></LIST>

<H2><s>## </s>Icecast</H2>

<p>Декілька слів про налаштування сервера Icecast. Раніше, для локальних колекцій, мета-інформація про стрім в мене обслуговувалась сервером ezstream. Тут його немає, тому я додав такий набір до конфігурації точки монтування Icecast:</p>

<CODE><s>``` /etc/icecast2/icecast.xml</s><i>
</i>&lt;mount type="normal"&gt;
    &lt;mount-name&gt;/eQtv.mp3&lt;/mount-name&gt;
    &lt;username&gt;user&lt;/username&gt;
    &lt;password&gt;password&lt;/password&gt;
    &lt;stream-name&gt;eQtv українською мовою (аудіо, 32 kb/s)&lt;/stream-name&gt;
    &lt;stream-description&gt;eQtv — це проект eQualitie, неприбуткової організації, що розробляє технології для підвищення цифрової стійкості, особливо для спільнот, яким загрожують цензура, стеження, зміна клімату та мережева ізоляція.&lt;/stream-description&gt;
    &lt;stream-url&gt;https://tv.equalitie.org/uk/live&lt;/stream-url&gt;
&lt;/mount&gt;<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>відповідно, <C><s>`</s>user:password<e>`</e></C> мають відповідати тим, що вказані в команді <C><s>`</s>ffmpeg<e>`</e></C></LI></LIST>

<H2><s>## </s>Systemd</H2>

<p>Команду <C><s>`</s>ffmpeg<e>`</e></C> я виконую від системного сервісу, створивши відповідного користувача:</p>

<CODE><s>``` /etc/systemd/system/eqtv-mp3.service</s><i>
</i>#/etc/systemd/system/eqtv-mp3.service
[Unit]
# якщо Icecast локальний, можна додати icecast2.target поряд з network-online
# After=network-online.target icecast2.target
After=network-online.target

[Service]
Type=simple

User=eqtv
Group=eqtv

# Затримка потрібна у моєму випадку через залежність від Icecast
# ExecStartPre=/bin/sleep 5s

# ExecStart=/usr/bin/ffmpeg -i ...
# ExecStart=/bin/bash /path/to/script.sh
ExecStart=/path/to/script.sh

# Журнали я вимкнув, але можна продебажити наступним чином
StandardOutput=null
# file:///home/eqtv/eqtv-mp3-debug.log
StandardError=null
# file:///home/eqtv/eqtv-mp3-error.log

# Бажано увімкнути, якщо замість команди ffmpeg в ExecStart
# використовується скрипт оновлення номеру сесії
Restart=on-failure

[Install]
WantedBy=multi-user.target<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>в <C><s>`</s>ExecStart<e>`</e></C> треба вказати відповідний набір атрибутів <C><s>`</s>ffmpeg<e>`</e></C> або шлях до скрипта (вище)</LI></LIST>

<H2><s>## </s>Nginx</H2>

<p>Як видно з прикладу, мій сервер Icecast крутиться на інтерфейсі <C><s>`</s>127.0.0.1<e>`</e></C> для локальних потреб (щоб не ганяти трафік через оверлей). Окрім локалхосту, в мене відбувається ретрансляція на різні мережі IPv6, тому для зручності я проксую клієнтський трафік через Nginx:</p>

<CODE><s>``` /etc/nginx/sites-available/default</s><i>
</i>#/etc/nginx/sites-available/default
server {
    listen [202:68d0:f0d5:b88d:1d1a:555e:2f6b:3148]:8000;
    listen [505:6847:c778:61a1:5c6d:e802:d291:8191]:8000;
    listen xx.xx.xx.xx:8000;

    access_log /var/log/nginx/icecast.access.log;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_redirect off;
    }
}<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>на прикладі <C><s>`</s>listen<e>`</e></C> - проксі на Yggdrasil та Mycelium і одна на локальну мережу IPv4</LI>
<LI><s>* </s><C><s>`</s>proxy_pass<e>`</e></C> - може бути відмінний локальний порт від вказаного у прикладах</LI></LIST></r>','2025-10-29 18:13:00',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (125,93,1,'2025-10-20 12:12:11',1,'comment','<r><p>На вітальному банері форуму з''явились партнерські кнопки, серед них - Yourserver. Замість прямого реферального посилання, вирішив трішки розписати стосовно цього провайдера з особистого досвіду.</p>

<p>Користуємось ним не перший рік, це дійсно лояльний для західної юрисдикції сервіс, що надає послуги віртуального сервера на базі KVM з можливістю оплати в BitCoin. Географічно, можна обрати IP Швеції або Латвії з необмеженим трафіком згідно заявленої швидкості каналу.</p>

<p>Цінова політика середня по ринку, можна знайти дешевше (від 1.5-3 євро замість мінімальних тут 5) на 10Гб простору / 1 Гб RAM / 1 ядро (характеристики заліза на сайті)</p>

<p>Підтримка по суті - один адмін, який відповідає не завжди оперативно (як це робить кал центр) але на протязі доби проблеми вирішуються в ручному режимі. Тобто конструктивні питання висіти не будуть. Оформлення сервера там автоматичне і як заявлено відбувається на протязі 10-15хв. Апгрейди, як мені здається, тут в напів-автоматичному режимі (адмін щось там крутить руками), але  звичайно від вас нічого не потребується окрім запиту в контрольній панелі.</p>

<p>Один раз була проблема з розгортанням нового серверу, як пофіксили не пам''ятаю, але це було щось з опери кривого образу Ubuntu, яку я собі обрав після оновлення її дистрибутиву.</p>

<p>З оплатою, поверненням коштів на баланс не було жодного разу, також не помічав проблем з рефералами.  Все чітко списується по графіку і повертається при скасуванні послуг.</p>

<p>IPv6 там налаштовується руками, він входить до пакету послуг але з коробки в Інтернет дивиться тільки IPv4, може це залежить від образу ОС. Бекапи за додаткову плату, якщо вони вам потрібні.</p>

<p>Для мене цей сервіс випробуваний часом: торенти, децентралізовані сервіси, VPN, і навіть майнинг крипти (соціальна платформа на базі реалізації BitCoin) - питань на відміну від США/Германії не було жодних. Тут прошу не плутати такі поняття як "лояльність" і "абузостійкість", на сайті є угода користувача.</p>

<p>Якщо комусь цікаво, нижче партнерське посилання, буду вдячний якщо не проігноруєте реферальну його частину (зберігається в cookies, якщо у вас приватний браузер) - це зарахує нам бонус для оплати сервера зокрема для локальних послуг YGGverse:</p>

<p><URL url="https://www.yourserver.se/portal/aff.php?aff=610">https://www.yourserver.se/portal/aff.php?aff=610</URL></p></r>','2025-10-20 12:37:29',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (126,94,1,'2025-10-20 14:51:46',1,'comment','<r><p>Зацікавив мульт рисовкою, схожою до Scavengers Reign (хоча сподівань на Netflix не маю). Пройшовся трекерами - ніхто не виклав, тому роблю дамп <URL url="/d/27-zavantazennia-video-z-saitiv-rezka-hd-cerez-plagin-yt-dlp"><s>[</s>yt-dlp<e>](/d/27-zavantazennia-video-z-saitiv-rezka-hd-cerez-plagin-yt-dlp)</e></URL> і буду на роздачі поки не закінчиться простір на диску:</p>

<CODE><s>```</s><i>
</i>b9d717950676a7397148c75992b5d78529dd480a<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><URL url="/d/62-lokalni-trekeri-bittorrent"><s>[</s>трекери<e>](/d/62-lokalni-trekeri-bittorrent)</e></URL></LI></LIST></r>','2025-10-20 14:52:58',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (127,95,1,'2025-10-21 11:41:00',1,'comment','<r><CODE><s>```</s><i>
</i>65728481a2007d1efb6e4170257daad4ee777036<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><URL url="/d/62-lokalni-trekeri-bittorrent"><s>[</s>трекери<e>](/d/62-lokalni-trekeri-bittorrent)</e></URL></LI>
<LI><s>* </s><URL url="https://learning.lpi.org/pdfstore/LPI-Learning-Material-010-160-uk.pdf"><s>[</s>джерело<e>](https://learning.lpi.org/pdfstore/LPI-Learning-Material-010-160-uk.pdf)</e></URL></LI></LIST></r>','2025-10-21 11:41:20',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (128,96,1,'2025-10-24 02:57:24',1,'comment','<r><p>Давно цікавлюсь тематикою альтернативних мереж, зокрема - експериментую з <URL url="/d/6-yggdrasil-mereza-z-decentralizovanim-routingom"><s>[</s>Yggdrasil<e>](/d/6-yggdrasil-mereza-z-decentralizovanim-routingom)</e></URL> в контексті BitTorrent. Про мережу I2P знаю давно, але мені жодного разу не доводилось нею користуватись. Утім, організувавши на прохання деяких користувачів доступ по I2P до цього форуму, <URL url="/d/84-publikaciia-kapsuli-gemini-v-i2p-na-prikladi-servera-agate"><s>[</s>налаштувавши дзеркало свого блогу Gemini<e>](/d/84-publikaciia-kapsuli-gemini-v-i2p-na-prikladi-servera-agate)</e></URL>, та <URL url="/d/91-retransliaciia-eqtv-ukrayinskoiu-movoiu-dlia-lokalnix-merez"><s>[</s>ретрансляцію каналів eQtv і Громадське радіо<e>](/d/91-retransliaciia-eqtv-ukrayinskoiu-movoiu-dlia-lokalnix-merez)</e></URL>, стало цікаво також спробувати цю мережу і в контексті торентів.</p>

<p>Для одночасного обміну файлами в Інтернет, Yggdrasil і Mycelium - я користуюсь вільним клієнтом <URL url="https://www.qbittorrent.org"><s>[</s>qBittorrent<e>](https://www.qbittorrent.org)</e></URL>, що з коробки працює на всі мережі (Інтернет та Yggdrasil через подвійний стек IPv4/IPv6) і має гнучкі налаштування для керування великими колекціями. Але Yggdrasil не є анонімною мережею, а qBittorrent - допускає в такому випадку непередбачені з''єднання в гібридному режимі, оскільки розроблявся перш за все для максимальної конективності, а не для анонімізації/деперсоналізації. Так, в ньому є експериментальна опція I2P та універсальна реалізація проксі SOCKS5, але я вже помічав за цим клієнтом "сюрпризи" у вигляді вихідних з''єднань на веб-сокет IPv4 при біндінгу на IPv6 та інші нюанси, що в цілому залежать від конкретної версії.</p>

<p>Ситуація не краще й з віднайденою мною бібліотекою <URL url="https://docs.rs/librqbit/latest/librqbit/"><s>[</s>librqbit<e>](https://docs.rs/librqbit/latest/librqbit/)</e></URL> (на базі якої мав намір створити приватно-орієнтований клієнт GTK для оверлейних мереж) де наприклад не можливо вимкнути <URL url="https://en.wikipedia.org/wiki/Peer_exchange"><s>[</s>PEX<e>](https://en.wikipedia.org/wiki/Peer_exchange)</e></URL>, для чого треба користуватись костилями blacklist. Взагалі, тему приватного користування торентами в контексті оверлейних мереж краще розкрити окремо, бо тут є що розповісти.</p>

<H2><s>## </s>Інфраструктура I2P</H2>

<p>В своїй конфігурації I2P, я використовую C++ роутер <URL url="https://github.com/PurpleI2P/i2pd"><s>[</s>i2pd<e>](https://github.com/PurpleI2P/i2pd)</e></URL>, оскільки він дозволяє з коробки <URL url="/d/73-vstanovlennia-routera-i2pd-z-pidkliucenniam-do-merezi-i2p-cerez-yggdrasil"><s>[</s>налаштувати підключення в режимі Yggdrasil-only<e>](/d/73-vstanovlennia-routera-i2pd-z-pidkliucenniam-do-merezi-i2p-cerez-yggdrasil)</e></URL> (минаючи прямі з''єднання в Інтернет) і може бути корисним в умовах, коли піринговий трафік через Інтернет може бути не бажаним.</p>

<p>Переглянувши <URL url="https://i2pd.readthedocs.io/en/latest/tutorials/filesharing/"><s>[</s>доступні клієнти<e>](https://i2pd.readthedocs.io/en/latest/tutorials/filesharing/)</e></URL>, відкинув вже згаданий qBittorrent і <URL url="https://www.biglybt.com/"><s>[</s>BiglyBT<e>](https://www.biglybt.com/)</e></URL> через їх універсальність; <URL url="https://github.com/majestrate/XD"><s>[</s>XD<e>](https://github.com/majestrate/XD)</e></URL> - як такий, що "крашить" i2pd. Тому з кандидатів лишився I2P-only <URL url="https://gitlab.com/i2pplus/I2P.Plus/-/tree/master/apps/i2psnark"><s>[</s>I2PSnark<e>](https://gitlab.com/i2pplus/I2P.Plus/-/tree/master/apps/i2psnark)</e></URL>.</p>

<H3><s>### </s>I2PSnark</H3>

<p>Як видно з посилання, клієнт I2PSnark - є частиною Java роутера <URL url="https://gitlab.com/i2pplus/I2P.Plus"><s>[</s>I2P.Plus<e>](https://gitlab.com/i2pplus/I2P.Plus)</e></URL>, у той час як моя збірка використовує i2pd (C++). На щастя, розробники заморочились і написали скрипт для генерації артефакту "<URL url="https://gitlab.com/i2pplus/I2P.Plus/-/jobs/artifacts/master/raw/i2psnark-standalone.zip?job=Java8"><s>[</s>standalone<e>](https://gitlab.com/i2pplus/I2P.Plus/-/jobs/artifacts/master/raw/i2psnark-standalone.zip?job=Java8)</e></URL>" - тобто цей клієнт можна запустити як окрему програму та під''єднати до наявного демона i2pd через API <URL url="https://geti2p.net/uk/docs/protocol/i2cp"><s>[</s>I2CP<e>](https://geti2p.net/uk/docs/protocol/i2cp)</e></URL> (один з протоколів комунікації застосунків мережі I2P)</p>

<p>Для "встановлення" в Linux, достатньо розпакувати архів до потрібної вам теки з програмами користувача і запустити скрипт <C><s>`</s>launch-i2psnark<e>`</e></C> (для Windows це наче має бути <C><s>`</s>launch-i2psnark.bat<e>`</e></C>). Якщо потрібно зібратись з сорсу - дивіться інструкції генерації артефакту відповідно до актуальної версії, особисто я не бачу сенсу білдитись тут руками. Само собою, для запуску I2PSnark повинна бути встановлена віртуальна машина Java.</p>

<H3><s>### </s>i2pd</H3>

<p>Пара слів про i2pd.</p>

<p>По-перше, якщо в налаштуваннях роутера не увімкнено протокол I2CP - вмикаємо:</p>

<CODE><s>``` /etc/i2pd.conf</s><i>
</i>#/etc/i2pd.conf
[i2cp]
enabled = true<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>або запускаємо роутер з аргументом <C><s>`</s>--i2cp.enabled=true<e>`</e></C></LI></LIST>

<p>По-друге, цей роутер в мене встановлено на віддаленому сервері, тому якщо запустити стандартну конфігурацію I2PSnark, він не зможе підключитись до локалхосту (<C><s>`</s>127.0.0.1<e>`</e></C>). Якщо у вас аналогічна ситуація, відредагуємо додатково:</p>

<CODE><s>``` /etc/i2pd.conf</s><i>
</i>#/etc/i2pd.conf
[i2cp]
address = a.a.a.a<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>a.a.a.a<e>`</e></C> - IP адреса віддаленого i2pd роутера, це може бути локальна IPv4 або IPv6 адреса</LI></LIST>

<p>Якщо роутер віддалений, не забуваємо відкрити відповідний порт для клієнтського хосту:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>ufw allow from b.b.b.b to a.a.a.a port 7654 proto tcp<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>b.b.b.b<e>`</e></C> - адреса, де встановлено клієнт I2PSnark</LI>
<LI><s>* </s><C><s>`</s>a.a.a.a<e>`</e></C> - адреса роутера i2pd</LI>
<LI><s>* </s>якщо <C><s>`</s>a.a.a.a<e>`</e></C> == <C><s>`</s>127.0.0.1<e>`</e></C> або <C><s>`</s>::1<e>`</e></C> (тобто I2PSnark і i2pd на одному пристрої) то відкривати порт не потрібно</LI></LIST>

<H2><s>## </s>Запуск</H2>

<p>Як згадано вище, запуск I2PSnark відбувається командою:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>./launch-i2psnark<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s>після цього має автоматично відкритись вкладка типового браузера за адресою <URL url="http://127.0.0.1:8002/i2psnark/">http://127.0.0.1:8002/i2psnark/</URL></LI></LIST>

<H3><s>### </s>Приклад systemd</H3>

<p>Для зручності запуску, в системах Linux можна створити системний сервіс:</p>

<CODE><s>``` /etc/systemd/system/i2psnark.service</s><i>
</i>#/etc/systemd/system/i2psnark.service
[Unit]
After=network.target

[Service]
Type=idle

# useradd -m i2psnark
User=i2psnark
Group=i2psnark

# за умови, що I2PSnark розпаковано до теки користувача
WorkingDirectory=/home/i2psnark
ExecStart=/home/i2psnark/i2psnark/launch-i2psnark

# опціонально, можна вказати як null
# StandardOutput=file:///home/i2psnark/debug.log
# StandardError=file:///home/i2psnark/error.log

[Install]
WantedBy=multi-user.target<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>systemctl start i2psnark<e>`</e></C> - старт</LI>
<LI><s>* </s><C><s>`</s>systemctl enable i2psnark<e>`</e></C> - додати в авто-запуск</LI>
<LI><s>* </s><C><s>`</s>systemctl status i2psnark<e>`</e></C> - перевірка статусу</LI>
<LI><s>* </s><C><s>`</s>systemctl stop i2psnark<e>`</e></C> - зупинити</LI></LIST>

<H3><s>### </s>Підключення до віддаленого роутера i2pd</H3>

<p>У разі, якщо роутер i2pd віддалений, перше що треба зробити - це зайти до налаштувань WebUI:</p>

<p><IMG alt="Кнопка налаштувань I2PSnark в браузері" src="/data/d/96/i2psnark-settings-button.png"><s>![</s>Кнопка налаштувань I2PSnark в браузері<e>](/data/d/96/i2psnark-settings-button.png)</e></IMG></p>

<p>І вказати актуальний його хост (<EM><s>_</s>Configuration<e>_</e></EM> &gt; <EM><s>_</s>Tunnel Configuration<e>_</e></EM> &gt; <EM><s>_</s>I2CP Host<e>_</e></EM>)</p>

<p><IMG alt="Налаштування хосту I2CP в I2PSnark" src="/data/d/96/i2cp-host-configuration.png"><s>![</s>Налаштування хосту I2CP в I2PSnark<e>](/data/d/96/i2cp-host-configuration.png)</e></IMG></p>

<p>В принципі, можна вказати до запуску, у файлі <C><s>`</s>/i2psnark/i2psnark.config.d/i2psnark.config<e>`</e></C>:</p>

<CODE><s>``` /i2psnark/i2psnark.config.d/i2psnark.config</s><i>
</i>i2psnark.i2cpHost=a.a.a.a<i>
</i><e>```</e></CODE>

<H3><s>### </s>Налаштування довжини ланцюжка з''єднань</H3>

<p>На що варто звернути увагу перед початком обміну файлами - це довжина "хопів" або точок ретрансляції. Ці налаштування знаходяться в тому ж розділі (<EM><s>_</s>Configuration<e>_</e></EM> &gt; <EM><s>_</s>Tunnel Configuration<e>_</e></EM> &gt; <EM><s>_</s>Inbound Settings<e>_</e></EM> та <EM><s>_</s>Outbound Settings<e>_</e></EM>)</p>

<p><IMG alt="Налаштування довжини тунелів I2PSnark" src="/data/d/96/tunnel-hops-settings-in-i2psnark.png"><s>![</s>Налаштування довжини тунелів I2PSnark<e>](/data/d/96/tunnel-hops-settings-in-i2psnark.png)</e></IMG></p>

<p>Тут можна поставити значення "2" або навіть "1", адже заплутаність маршруту - не є останнім засобом анонімізації, яку використовує I2P: зокрема клієнт I2PSnark генерує випадкові PeerID, а трафік в каналі є зашифрованим, до того ж (у моєму випадку) загорнутий в Yggdrasil. Не варто зайвий раз навантажувати транзитні вузли ціною вашого ж часу на завантаження серіалу.</p>

<H3><s>### </s>Налаштування швидкості</H3>

<p>I2PSnark має "комфортні" обмеження з коробки, тобто такі, що не перевантажують пропускний канал роутера. Тому, якщо ви, як і я, не дуже активно сьорфите мережею I2P, можна збільшити ліміти на вхідний / вихідний трафік в розділі <EM><s>_</s>Configuration<e>_</e></EM> &gt; <EM><s>_</s>Torrent Options<e>_</e></EM> &gt; <EM><s>_</s>Bandwidth limit<e>_</e></EM>:</p>

<p><IMG alt="Налаштування ліміту швидкості каналу I2PSnark" src="/data/d/96/i2psnark-bandwidth-limit.png"><s>![</s>Налаштування ліміту швидкості каналу I2PSnark<e>](/data/d/96/i2psnark-bandwidth-limit.png)</e></IMG></p>

<H3><s>### </s>Налаштування локального сховища</H3>

<p>Варто звернути увагу на те, де будуть зберігатись завантажені та поширювані файли. Вказати шлях до кореневої теки можна в розділі <EM><s>_</s>Configuration<e>_</e></EM> &gt; <EM><s>_</s>Data Storage<e>_</e></EM> &gt; <EM><s>_</s>Data directory<e>_</e></EM>:</p>

<p><IMG alt="Налаштування локального сховища I2PSnark" src="/data/d/96/i2psnark-data-directory-settings.png"><s>![</s>Налаштування локального сховища I2PSnark<e>](/data/d/96/i2psnark-data-directory-settings.png)</e></IMG></p>

<LIST><LI><s>* </s>Якщо в <EM><s>_</s>Data directory<e>_</e></EM> через файловий менеджер або FTP додати торент-файли, вони будуть автоматично розпізнані клієнтом і з''являться в списку на головній сторінці Веб-панелі, а дані торентів - будуть завантажені відносно її кореня</LI>
<LI><s>* </s>I2PSnark підтримує символічні посилання, тому якщо у вас для сховища примонтовані різні диски з файлами, для них в <EM><s>_</s>Data directory<e>_</e></EM> можна створити вказівники командою <C><s>`</s>ln -s<e>`</e></C></LI></LIST>

<H3><s>### </s>Користування</H3>

<p>Стосовно інтерфейсу, хто користувався торентами і здатен поставити описаний вище софт - зорієнтується як додавати через веб-адмінку файли <C><s>`</s>.torrent<e>`</e></C> і посилання Magnet. Зі свого першого досвіду, можу сказати, що цей клієнт дуже "дивний" і так би мовити не інтерактивний. Тут потрібен час, щоб вивчити кожний його нюанс, тому не поспішайте сідити з нього великі колекції.</p>

<p>Декілька порад, що можуть стати в нагоді початківцям:</p>

<LIST><LI><s>* </s>При першому запуску, дочекайтесь індексації каталогу і відбудови усіх роздач у спику. Поки вона не завершиться, не варто додавати нові, бо вони з''являться тільки після завершення усіх попередніх процесів у черзі. Можливо, це пов''язано з реалізацією UI/API, але таке враження що I2PSnark працює в одному потоці і не реагує, коли ви шлете через WebUI нову команду. Це дуже збиває з толку, бо консоль і журнали не реєструють ініціацію нових подій.</LI>
<LI><s>* </s>Не додавайте кастомні шляхи при імпорті торентів з WebUI, окрім того що вказано в <EM><s>_</s>Data directory<e>_</e></EM>. Я так робив та після хард-ребуту (зникло світло), в мене відвалились роздачі розміщені за рамками стандартної теки - довелось руками писати символічні посилання. Ці шляхи я згодом віднайшов у профілі I2PSnark (<C><s>`</s>/path/to/i2psnark.config.d/xx/xx.config<e>`</e></C>), але їх зміна в мене не працює; можливо там є часові мітки або ще щось мені не відоме.</LI>
<LI><s>* </s>Зверніть увагу, що в екосистемі I2P торенти мають не формальний ліміт файлів (inode) 2000 на торент. Таке ж значення вказане в I2PSnark. Хоча ця опція є в налаштуваннях, вона доступна тільки на читання. В принципі, ви можете її змінити в конфігурації профілю (<C><s>`</s>i2psnark.maxFilesPerTorrent=5000<e>`</e></C>) і перезапустити клієнт, але інші користувачі I2PSnark не зможуть її обробити, якщо як і ви, не змінили цей стандартний ліміт локально. Тобто ваша роздача буде напів-сумісною з мережею: також, відомі трекери валідують кількість файлів на торент. Якщо ваша роздача містить більше 2000 файлів, їх варто або заархівувати або розбити на окремі торенти, які згодом організувати в рамках так званого "пулу" або "колекції".</LI></LIST>

<H3><s>### </s>Трекери</H3>

<p>Щодо трекерів, то в мережі I2P є різні ресурси, найвідоміший і найстаріший з них - це <URL url="http://tracker2.postman.i2p"><s>[</s>tracker2.postman.i2p<e>](http://tracker2.postman.i2p)</e></URL> (<URL url="http://6a4kxkg5wp33p25qqhgwl6sj4yh4xuf5b3p3qldwgclebchm3eea.b32.i2p"><s>[</s>b32<e>](http://6a4kxkg5wp33p25qqhgwl6sj4yh4xuf5b3p3qldwgclebchm3eea.b32.i2p)</e></URL>) він вже входить до стандартного пресету I2PSnark. Створюючи новий торент для відвантаження на цей трекер, переконайтесь, що його адресу додано до списку:</p>

<p><IMG alt="Додавання трекерів до нової роздачі в I2PSnark" src="/data/d/96/i2psnark-bittorrent-trackers.png"><s>![</s>Додавання трекерів до нової роздачі в I2PSnark<e>](/data/d/96/i2psnark-bittorrent-trackers.png)</e></IMG></p>
<LIST><LI><s>* </s>можна вказати альтернативні трекери (колонка <EM><s>_</s>Alternates<e>_</e></EM>) для кращої конективності DHT;</LI>
<LI><s>* </s>поле "<EM><s>_</s>Content Filters<e>_</e></EM>" - наскільки я розумію, дозволяє прибрати з роздачі системні файли;</LI>
<LI><s>* </s>поле "<EM><s>_</s>Data to seed<e>_</e></EM>" - назва файлу або теки у файловій системі (відносно <EM><s>_</s>Data directory<e>_</e></EM>) або абсолютний альтернативний шлях, який з досвіду вище я використовувати не раджу.</LI></LIST>

<p>Якщо ви користуєтесь іншим трекером і його немає в стандартному списку, додати такий (як і налаштувати власні фільтри) можна в <EM><s>_</s>Configuration<e>_</e></EM> &gt; <EM><s>_</s>Trackers<e>_</e></EM> і <EM><s>_</s>Torrent create file filtering<e>_</e></EM> відповідно:</p>

<p><IMG alt="Налаштування користувацьких трекерів та фільтрів в I2PSnark" src="/data/d/96/i2psnark-content-filter-trackers-settings.png"><s>![</s>Налаштування користувацьких трекерів та фільтрів в I2PSnark<e>](/data/d/96/i2psnark-content-filter-trackers-settings.png)</e></IMG></p>

<H3><s>### </s>Поради з безпеки</H3>

<p>Будь-який роутер I2P реалізує класичну технологію пірингу (P2P), це означає, що ваш пристрій надсилатиме запити на випадкові адреси IP, отримані в процесі роботи роутера (подібно до звичайного клієнта BitTorrent). I2P не маскує ваше користування цією мережею, а лише ідентичність в ній. Тому, якщо такі технології, зокрема що базовані на BitTorrent/DHT - частково або повністю обмежені у вашій країні як такі, підключайтесь до I2P через VPN або локальні мережі типу <URL url="/d/73-vstanovlennia-routera-i2pd-z-pidkliucenniam-do-merezi-i2p-cerez-yggdrasil"><s>[</s>Yggdrasil<e>](/d/73-vstanovlennia-routera-i2pd-z-pidkliucenniam-do-merezi-i2p-cerez-yggdrasil)</e></URL>. Проаналізувати якість налаштувань та активні підключення (наявність витоків трафіку), зручно програмою <URL url="https://etherape.sourceforge.io"><s>[</s>Etherape<e>](https://etherape.sourceforge.io)</e></URL>.</p>

<p>Якщо у вас є сумніви стосовно якості реалізації i2pd / I2PSnark, скористайтесь додатковими засобами віртуалізації, наприклад без використання мережного інтерфейсу як такого:</p>
<LIST><LI><s>* </s><URL url="/d/69-izoliaciia-linux-vid-priamix-internet-zjednan-na-bazi-qemu-virtual-machine-manager-z-vsock"><s>[</s>Ізоляція Linux від прямих Інтернет з''єднань на базі QEMU / Virtual Machine Manager з VSOCK<e>](/d/69-izoliaciia-linux-vid-priamix-internet-zjednan-na-bazi-qemu-virtual-machine-manager-z-vsock)</e></URL></LI></LIST>

<H2><s>## </s>Посилання</H2>

<LIST><LI><s>* </s><URL url="https://devzone.org.ua/post/anonimne-korystuvannia-bittorrent-z-i2psnark-ta-i2pd"><s>[</s>Інтернет-версія цього матеріалу з коментарями на DevZone<e>](https://devzone.org.ua/post/anonimne-korystuvannia-bittorrent-z-i2psnark-ta-i2pd)</e></URL></LI></LIST>

<H3><s>### </s>Тематичні відео</H3>

<LIST><LI><s>* </s><URL url="https://www.youtube.com/watch?v=Csf7YQY9JOc"><s>[</s>Acetone: BitTorrent over I2P. Анонимный обмен файлами через даркнет без регистрации и СМС | №12<e>](https://www.youtube.com/watch?v=Csf7YQY9JOc)</e></URL>
    <LIST><LI><s>* </s><URL url="http://tracker2.postman.i2p/index.php?view=TorrentDetail&amp;id=67062"><s>[</s>BitTorrent роздача цього відео на tracker2.postman.i2p<e>](http://tracker2.postman.i2p/index.php?view=TorrentDetail&amp;id=67062)</e></URL> (<URL url="http://tracker2.postman.i2p/index.php?view=TPoolDetail&amp;id=1450"><s>[</s>пул<e>](http://tracker2.postman.i2p/index.php?view=TPoolDetail&amp;id=1450)</e></URL>)</LI></LIST></LI>
<LI><s>* </s><URL url="https://www.youtube.com/watch?v=WLA7_SLNUco"><s>[</s>LibreTrack: Работа с торрентами в сети I2P<e>](https://www.youtube.com/watch?v=WLA7_SLNUco)</e></URL></LI></LIST></r>','2025-10-30 01:38:45',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (129,97,1,'2025-10-24 03:11:30',1,'comment','<r><p>Випадково натрапив на <URL url="http://i2p-projekt.i2p/en/blog/post/2025/10/16/new-i2p-routers#emissary-appears-from-the-darkness"><s>[</s>допис<e>](http://i2p-projekt.i2p/en/blog/post/2025/10/16/new-i2p-routers#emissary-appears-from-the-darkness)</e></URL> блогу i2p-projekt.i2p (від 2025-10-16) де згадується розробка альтернативного роутера I2P мовою Rust:</p>

<p><URL url="https://github.com/altonen/emissary">https://github.com/altonen/emissary</URL></p>

<p>Вже реалізовані базові протоколи:</p>

<LIST><LI><s>* </s>Transports
   <LIST><LI><s>* </s>NTCP2</LI>
   <LI><s>* </s>SSU2 (experimental)</LI></LIST></LI>
<LI><s>* </s>Client protocols
   <LIST><LI><s>* </s>I2CP</LI>
   <LI><s>* </s>SAMv3</LI></LIST></LI>
<LI><s>* </s>Proxies
   <LIST><LI><s>* </s>HTTP</LI>
   <LI><s>* </s>SOCKSv5</LI></LIST></LI></LIST>

<p>Судячи з активності в репозиторії, проєкт дійсно свіжий. Я поки ставити не збираюсь, але цікавлюсь такою екосистемою, багато в чому й в контексті майбутнього переходу на Redox OS. Якщо хтось користується цим роутером - напишіть як воно там, можливо теж долучусь до тестів.</p></r>','2025-10-24 04:49:01',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (130,98,1,'2025-10-27 13:37:38',1,'comment','<r><p>Власне, так як я постійно кручусь довкола ідеї зробити черговий сервіс з відкритою базою на блокчейн, вирішив натягнути деякі обнови, про які написано на <URL url="https://github.com/kvazar-network/kevacoin/releases/tag/kvazar-1.4.0"><s>[</s>сторінці релізу<e>](https://github.com/kvazar-network/kevacoin/releases/tag/kvazar-1.4.0)</e></URL>.</p>

<p>Мабуть головна зміна цього разу - експериментальна підтримка маршрутизації пірів Yggdrasil та Mycelium. Наскільки вона працездатна, поки не знаю, але ця функція потрібна в першу чергу користувачам з активним IPv6 на Інтернет. Резольвер дозволяє конектити релевантні сімейства адрес, це в принципі спільний патерн для всіх біткоїн-подібних "core".</p>

<p>Також, в клієнті Qt, пофікшені різні баги з датами і встановлено моноширинні шрифти на таблиці, а також браузер key/value, що дозволяє тепер дивитись ASCII арт і різний преформатед текст (таблички і все таке)</p>

<p>В цілому, все дуже сиро, мені особисто не подобається працювати з C++ і я постійно думаю про міграцію на Rust з його анти-нуб аналізатором, хоча до справи діло не доходить (навіть не знаю чи це можливо <URL url="https://github.com/rust-litecoin/rust-litecoin?tab=readme-ov-file#known-limitations"><s>[</s>технічно<e>](https://github.com/rust-litecoin/rust-litecoin?tab=readme-ov-file#known-limitations)</e></URL>) Тут же код брудноватий, масивний, також мені здається є витоки якщо довго крутити ноду без ребуту, але воно працює, китайці щось майнять тому дані зберігаються за лічені хвилини і майже безкоштовно.</p>

<p>Кому цікаво, колись писав про цей коїн тут:</p>
<LIST><LI><s>* </s><URL url="https://devzone.org.ua/post/kevacoin-detsentralizovana-baza-danykh-v-blokcheyn"><s>[</s>KevaCoin - децентралізована база даних в блокчейн<e>](https://devzone.org.ua/post/kevacoin-detsentralizovana-baza-danykh-v-blokcheyn)</e></URL></LI></LIST></r>','2025-10-27 13:48:03',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (131,99,1,'2025-10-28 02:29:22',1,'comment','<r><H2><s>## </s>Основні зміни</H2>

<H3><s>### </s>GUI та крос-платформність</H3>

<LIST><LI><s>* </s>Перенесено інтерфейс з непідтримуваного веб-переглядача до бібліотеки wry для покращення сумісності з Linux та стабільності в майбутньому.</LI></LIST>

<H3><s>### </s>Покращення безпеки DNS</H3>

<LIST><LI><s>* </s>Реалізовано тимчасові порти для DNS-запитів.</LI>
<LI><s>* </s>Додано кодування DNS 0x20 для підвищення безпеки.</LI></LIST>

<H3><s>### </s>Виправлення помилок та поліпшення</H3>

<LIST><LI><s>* </s>Автоматичне перенесення конфігурацій для некоректного тестового порту (42440 → 4244).</LI>
<LI><s>* </s>Виправлено попередження під час тестування.</LI>
<LI><s>* </s>Оновлено всі залежності.</LI></LIST>

<p>Ця версія зосереджена на покращенні стабільності крос-платформності та посиленні функцій безпеки DNS при збереженні сумісності з існуючими конфігураціями.</p>

<p><URL url="https://github.com/Revertron/Alfis/releases/tag/v0.8.7">https://github.com/Revertron/Alfis/releases/tag/v0.8.7</URL></p>

<H2><s>## </s>Читайте також</H2>

<LIST><LI><s>* </s><URL url="/d/7-alfis-dns-rejestraciia-domenu-v-blokcein"><s>[</s>Alfis DNS - реєстрація домену в блокчейн<e>](/d/7-alfis-dns-rejestraciia-domenu-v-blokcein)</e></URL></LI></LIST></r>',NULL,NULL,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (132,100,1,'2025-10-29 19:05:57',1,'comment','<r><LIST><LI><s>* </s><URL url="https://github.com/ngosang/trackerslist"><s>[</s>Updated list of public BitTorrent trackers<e>](https://github.com/ngosang/trackerslist)</e></URL>
    <LIST><LI><s>* </s><URL url="https://github.com/ngosang/trackerslist/blob/master/trackers_all_yggdrasil.txt"><s>[</s>trackers_all_yggdrasil.txt<e>](https://github.com/ngosang/trackerslist/blob/master/trackers_all_yggdrasil.txt)</e></URL></LI>
    <LI><s>* </s><URL url="https://github.com/ngosang/trackerslist/blob/master/trackers_all_yggdrasil_ip.txt"><s>[</s>trackers_all_yggdrasil_ip.txt<e>](https://github.com/ngosang/trackerslist/blob/master/trackers_all_yggdrasil_ip.txt)</e></URL></LI></LIST></LI></LIST></r>','2025-10-29 19:06:46',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (133,101,1,'2025-10-31 00:04:01',1,'comment','<r><p>Останнім часом, захопився дослідженням мережі I2P, зокрема:</p>

<LIST><LI><s>* </s><URL url="/d/73-vstanovlennia-routera-i2pd-z-pidkliucenniam-do-merezi-i2p-cerez-yggdrasil"><s>[</s>встановлення роутера i2pd з підключенням до мережі I2P через Yggdrasil<e>](/d/73-vstanovlennia-routera-i2pd-z-pidkliucenniam-do-merezi-i2p-cerez-yggdrasil)</e></URL></LI>
<LI><s>* </s><URL url="/d/96-anonimnii-piring-bittorrent-z-i2psnark-ta-i2pd"><s>[</s>обміном файлами через технологію BitTorrent<e>](/d/96-anonimnii-piring-bittorrent-z-i2psnark-ta-i2pd)</e></URL></LI>
<LI><s>* </s><URL url="http://hc3fycfadz7fkapp62fqi6llioe46fvis6wuswfobl5ghc2u7snq.b32.i2p"><s>[</s>опублікував в ній сайт спільноти<e>](http://hc3fycfadz7fkapp62fqi6llioe46fvis6wuswfobl5ghc2u7snq.b32.i2p)</e></URL></LI>
<LI><s>* </s><URL url="/d/92-proksuvannia-potoku-m3u8-zasobami-ffmpeg-v-icecast"><s>[</s>налаштував<e>](/d/92-proksuvannia-potoku-m3u8-zasobami-ffmpeg-v-icecast)</e></URL> ретрансляцію <URL url="/d/91-retransliaciia-eqtv-ukrayinskoiu-movoiu-dlia-lokalnix-merez"><s>[</s>радіо eQtv<e>](/d/91-retransliaciia-eqtv-ukrayinskoiu-movoiu-dlia-lokalnix-merez)</e></URL></LI>
<LI><s>* </s>а також успішно <URL url="/d/84-publikaciia-kapsuli-gemini-v-i2p-na-prikladi-servera-agate"><s>[</s>інтегрував свій блог<e>](/d/84-publikaciia-kapsuli-gemini-v-i2p-na-prikladi-servera-agate)</e></URL>, що реалізує протокол <URL url="https://geminiprotocol.net"><s>[</s>Gemini<e>](https://geminiprotocol.net)</e></URL></LI></LIST>

<p>На цьому, думав завершити свій експеримент з налаштуванням інфраструктури, але довгий час залишалось питання стосовно доменів: усі відомі мені ресурси мали короткі адреси, які я знайшов у списку <URL url="http://notbob.i2p"><s>[</s>notbob.i2p<e>](http://notbob.i2p)</e></URL>, але цей сайт не відображає перманентні B32. Від того, про мої сервіси ніхто окрім мене не знає, від того крутити їх онлайн - сенсу мало. Трохи полиставши документацію, віднайшов деяку інформацію і організував перший домен для одного зі своїх проєктів у списку, що виявилось тривіально просто. Нижче опишу свій скромний досвід, можливо, він стане в нагоді початківцям.</p>

<H2><s>## </s>Набір утиліт i2pd-tools</H2>

<p>Для адміністрування доменів I2P, нам знадобиться утиліта <URL url="https://github.com/PurpleI2P/i2pd-tools"><s>[</s>i2pd-tools<e>](https://github.com/PurpleI2P/i2pd-tools)</e></URL>. В її репозиторії є детальна <URL url="https://github.com/PurpleI2P/i2pd-tools?tab=readme-ov-file#i2pd-tools"><s>[</s>інструкція<e>](https://github.com/PurpleI2P/i2pd-tools?tab=readme-ov-file#i2pd-tools)</e></URL>. Збірка з початкового коду, на момент написання матеріалу, виглядає наступним чином:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>git clone https://github.com/PurpleI2P/i2pd-tools.git &amp;&amp; cd i2pd-tools
git submodule init &amp;&amp; git submodule update
git submodule update --init
git pull --recurse-submodules
make<i>
</i><e>```</e></CODE>

<p>Розглянемо декілька варіантів реєстрації доменів та відповідні утиліти з набору <C><s>`</s>i2pd-tools<e>`</e></C>.</p>

<H2><s>## </s>Майнинг семантичного префіксу для домена B32</H2>

<p>Однією з опцій створення домену - може бути майнинг семантичного префіксу для хешу B32 (актуально для EDDSA-SHA512-ED25519). Цей спосіб вартий уваги до розгляду наступних опцій реєстрації, адже згенерувавши візуально зрозумілий префікс, такий сервіс буде простіше знайти в історії браузеру. До того ж це буде канонічний, перманентний ідентифікатор I2P, що згідно оригінальної парадигми, належатиме тільки вам.</p>

<p>Для цієї мети, в <C><s>`</s>i2pd-tools<e>`</e></C>, використовується утиліта <C><s>`</s>vain<e>`</e></C>:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>./vain domain -o mydomain.dat<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>domain<e>`</e></C> - бажаний префікс для адреси типу <C><s>`</s>domain1ad...2u7adq.b32.i2p<e>`</e></C>: чим більша його довжина - тим <URL url="https://github.com/PurpleI2P/i2pd-tools?tab=readme-ov-file#time-to-generate-on-a-270ghz-processor"><s>[</s>складнішою<e>](https://github.com/PurpleI2P/i2pd-tools?tab=readme-ov-file#time-to-generate-on-a-270ghz-processor)</e></URL> буде процедура видобутку!</LI>
<LI><s>* </s><C><s>`</s>mydomain.dat<e>`</e></C> - шлях до файлу, куди буде записано знайдений ключ (тунелю)</LI>
<LI><s>* </s>додатково можна вказати:
    <LIST><LI><s>* </s><C><s>`</s>-t<e>`</e></C> (<C><s>`</s>--threads<e>`</e></C>) - кількість паралельних потоків для майнингу</LI>
    <LI><s>* </s><C><s>`</s>-r<e>`</e></C> (<C><s>`</s>--reg<e>`</e></C>) - якщо потрібно генерувати по регулярному виразу замість статичного рядка</LI></LIST></LI></LIST>

<H2><s>## </s>Централізовані короткі домени</H2>

<p>В цілому, класична технологія DNS в мережі I2P відсутня в принципі. Можливо є засоби інтеграції, але вони так чи інакше пов''язані з централізацією. Короткі домени в I2P - є також частково централізованими, але таких "центрів" як мінімум два: <URL url="http://stats.i2p"><s>[</s>stats.i2p<e>](http://stats.i2p)</e></URL> (від <URL url="https://github.com/i2p"><s>[</s>команди Java роутера<e>](https://github.com/i2p)</e></URL>) і <URL url="http://reg.i2p"><s>[</s>reg.i2p<e>](http://reg.i2p)</e></URL> (від <URL url="https://github.com/PurpleI2P"><s>[</s>команди роутера C++<e>](https://github.com/PurpleI2P)</e></URL>). Працюють вони за іншим принципом, аніж класичні DNS, але при тому так само виконують свою функцію надання семантичних адрес безкоштовно, хоч і з певними умовами стосовно цензури і терміну дії (умов пролонгації).</p>

<p>Умови реєстраторів переписувати не буду, актуальну версію можна почитати на їх сайтах. Якщо коротко, то для реєстрації такого формату, адреса повинна бути не зайнята а ваш сервіс - доступним онлайн. В іншому випадку адресу буде звільнено для інших користувачів.</p>

<p>Працює така реєстрація за принципом автоматизованого створення реєстрів <URL url="http://reg.i2p/hosts.txt"><s>[</s>hosts.txt<e>](http://reg.i2p/hosts.txt)</e></URL> що по суті являють собою індекс псевдонімів для хешу вашого тунелю (домену B32). Коли додається новий домен, він підписується приватним ключем власника тунелю, перевіряється системою реєстратора і за виконання умов - поширюється між іншими роутерами I2P, що підтримують цього реєстратора.</p>

<H3><s>### </s>Короткий домен другого рівня (2LD) з i2pd-tools/regaddr</H3>

<p>Передбачається, що у вас є умовний сайт з ключем тунелю <C><s>`</s>domain.dat<e>`</e></C>, щоб згенерувати для нього підписаний запит на реєстрацію, виконуємо <C><s>`</s>regaddr<e>`</e></C>:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>./regaddr domain.dat domain.i2p &gt; domain.txt<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>domain.i2p<e>`</e></C> - бажана адреса для <C><s>`</s>domain.dat<e>`</e></C></LI></LIST>

<H3><s>### </s>Короткий домен третього рівня (3LD) з i2pd-tools/regaddr_3ld</H3>

<p>Тут майже те само що й для 2LD, але нам потрібно підписати піддомен третього рівня ключем власника домену другого рівня. Виконується така операція вже в три кроки, утилітою <C><s>`</s>regaddr_3ld<e>`</e></C>:</p>

<CODE lang="bash"><s>``` bash</s><i>
</i>./regaddr_3ld step1 sub_domain.dat sub.domain.i2p &gt; step1.txt
./regaddr_3ld step2 step1.txt domain.dat domain.i2p &gt; step2.txt
./regaddr_3ld step3 step2.txt sub_domain.dat &gt; step3.txt<i>
</i><e>```</e></CODE>
<LIST><LI><s>* </s><C><s>`</s>sub.domain.i2p<e>`</e></C> - бажана адреса для <C><s>`</s>sub_domain.dat<e>`</e></C></LI></LIST>

<H3><s>### </s>Реєстрація</H3>

<p>Згенерувавши підписи, переходимо на сайти обраних реєстраторів:</p>

<LIST><LI><s>* </s><URL url="http://reg.i2p/add"><s>[</s>reg.i2p<e>](http://reg.i2p/add)</e></URL></LI>
<LI><s>* </s><URL url="http://stats.i2p/i2p/addkey.html"><s>[</s>stats.i2p<e>](http://stats.i2p/i2p/addkey.html)</e></URL>
    <LIST><LI><s>* </s>якщо ви користуєтесь роутером i2pd і бачите помилку "403 Denied - Inproxy access denied. You must run I2P to access this site." - переключіть ваш роутер в режим проксі HTTP замість SOCKS (<URL url="https://github.com/PurpleI2P/i2pd/issues/507"><s>[</s>джерело<e>](https://github.com/PurpleI2P/i2pd/issues/507)</e></URL>)</LI></LIST></LI></LIST>

<p>Заповнюємо форму, вказавши наш вміст файлів <C><s>`</s>domain.txt<e>`</e></C> і <C><s>`</s>step3.txt<e>`</e></C> відповідно до типу домену і слідуємо інструкціям. Звичайно, потрібно почекати декілька днів, поки заявку буде оброблено, а інші роутери мережі оновлять локальні реєстри. Щоб не чекати самому, можна скористатись посиланнями API, що надаються при реєстрації, для миттєвого оновлення вашого локального реєстру.</p>

<p>На прикладі реєстратора <C><s>`</s>stats.i2p<e>`</e></C>, статус домену можна перевірити на <URL url="http://stats.i2p/cgi-bin/newhosts.cgi"><s>[</s>сторінці нових хостів<e>](http://stats.i2p/cgi-bin/newhosts.cgi)</e></URL>.</p>

<H2><s>## </s>Посилання</H2>

<LIST><LI><s>* </s><URL url="https://devzone.org.ua/post/reyestratsiia-domenu-v-merezi-i2p"><s>[</s>Інтернет версія цього матеріалу з коментарями на DevZone<e>](https://devzone.org.ua/post/reyestratsiia-domenu-v-merezi-i2p)</e></URL></LI></LIST></r>','2025-10-31 00:14:53',1,NULL,NULL,NULL,0,1);
INSERT INTO "posts" VALUES (134,102,1,'2025-10-31 04:13:31',1,'comment','<r><p>Рідко використовую VPN, під рукою на такий випадок є ProtonVPN, прив''язаний до пошти. Утім, в нього є один недолік: на безкоштовному тарифі, він блокує трафік BitTorrent/DHT.</p>

<p>Серед того лайна, що плаває в топах складно щось віднайти без прив''язки до картки (стартового акаунту) але кому треба, ось мій список, можливо буде оновлюватись по мірі необхідності:</p>

<LIST><LI><s>* </s><URL url="https://www.vpnbook.com"><s>[</s>vpnbook.com<e>](https://www.vpnbook.com)</e></URL> - стара закладка, досі працює але не завжди для торентів, для підключення потребує періодичного оновлення паролю з каптчі</LI>
<LI><s>* </s><URL url="https://www.vpncreate.com/openvpn-server"><s>[</s>vpncreate.com<e>](https://www.vpncreate.com/openvpn-server)</e></URL> - проста реєстрація по логін/паролю, скачаний <C><s>`</s>.ovpn<e>`</e></C> містить неправильний юзернейм, якщо фіксанути руками то все працює</LI></LIST></r>','2025-11-01 11:02:11',1,NULL,NULL,NULL,0,1);
INSERT INTO "tags" VALUES (1,'Теревені','general','Загальний форум','#deddda',NULL,NULL,0,NULL,NULL,0,0,37,'2025-10-31 04:13:31',102,1,'',NULL,NULL,0);
INSERT INTO "tags" VALUES (2,'Yggdrasil','yggdrasil','https://yggdrasil-network.github.io','#26a269',NULL,NULL,NULL,NULL,NULL,0,0,33,'2025-10-29 19:05:57',100,1,'','2025-08-24 20:18:26','2025-08-24 20:18:26',0);
INSERT INTO "tags" VALUES (3,'Mycelium','mycelium','https://github.com/threefoldtech/mycelium','#613583',NULL,NULL,NULL,NULL,NULL,0,0,20,'2025-10-27 13:37:38',98,1,'','2025-08-24 20:18:56','2025-08-24 20:18:56',0);
INSERT INTO "tags" VALUES (4,'Спільнота','community','','#3584e4',NULL,NULL,1,NULL,NULL,0,0,13,'2025-09-30 16:49:08',72,1,'','2025-08-24 20:21:13','2025-08-24 20:21:13',1);
INSERT INTO "tags" VALUES (5,'Гайди','guide','','#3d3846',NULL,NULL,2,NULL,NULL,0,0,39,'2025-10-31 00:04:01',101,1,'','2025-08-24 20:22:44','2025-08-24 20:22:44',1);
INSERT INTO "tags" VALUES (7,'Файли','file','Ділимось файлами, торент-роздачами','#cdab8f',NULL,NULL,3,NULL,NULL,0,0,13,'2025-10-21 11:41:00',95,1,'','2025-09-07 12:26:50','2025-09-07 12:26:50',0);
INSERT INTO "tags" VALUES (8,'I2P','i2p','','#f9f06b',NULL,NULL,NULL,NULL,NULL,0,0,13,'2025-10-31 00:04:01',101,1,'','2025-09-30 16:44:40','2025-09-30 16:44:40',0);
INSERT INTO "tags" VALUES (9,'Reticulum','reticulum','https://github.com/liamcottle/reticulum-meshchat','',NULL,NULL,NULL,NULL,NULL,0,0,5,'2025-10-12 21:17:22',86,1,'','2025-10-07 04:43:13','2025-10-07 04:43:13',0);
CREATE VIEW "test" AS SELECT * FROM "main"."tags";
CREATE INDEX IF NOT EXISTS "discussions_comment_count_index" ON "discussions" (
	"comment_count"
);
CREATE INDEX IF NOT EXISTS "discussions_created_at_index" ON "discussions" (
	"created_at"
);
CREATE INDEX IF NOT EXISTS "discussions_hidden_at_index" ON "discussions" (
	"hidden_at"
);
CREATE INDEX IF NOT EXISTS "discussions_is_locked_index" ON "discussions" (
	"is_locked"
);
CREATE INDEX IF NOT EXISTS "discussions_is_sticky_created_at_index" ON "discussions" (
	"is_sticky",
	"created_at"
);
CREATE INDEX IF NOT EXISTS "discussions_is_sticky_last_posted_at_index" ON "discussions" (
	"is_sticky",
	"last_posted_at"
);
CREATE INDEX IF NOT EXISTS "discussions_last_posted_at_index" ON "discussions" (
	"last_posted_at"
);
CREATE INDEX IF NOT EXISTS "discussions_last_posted_user_id_index" ON "discussions" (
	"last_posted_user_id"
);
CREATE INDEX IF NOT EXISTS "discussions_participant_count_index" ON "discussions" (
	"participant_count"
);
CREATE INDEX IF NOT EXISTS "discussions_user_id_index" ON "discussions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "posts_discussion_id_created_at_index" ON "posts" (
	"discussion_id",
	"created_at"
);
CREATE INDEX IF NOT EXISTS "posts_discussion_id_number_index" ON "posts" (
	"discussion_id",
	"number"
);
CREATE UNIQUE INDEX IF NOT EXISTS "posts_discussion_id_number_unique" ON "posts" (
	"discussion_id",
	"number"
);
CREATE INDEX IF NOT EXISTS "posts_type_created_at_index" ON "posts" (
	"type",
	"created_at"
);
CREATE INDEX IF NOT EXISTS "posts_type_index" ON "posts" (
	"type"
);
CREATE INDEX IF NOT EXISTS "posts_user_id_created_at_index" ON "posts" (
	"user_id",
	"created_at"
);
CREATE UNIQUE INDEX IF NOT EXISTS "tags_slug_unique" ON "tags" (
	"slug"
);
COMMIT;
