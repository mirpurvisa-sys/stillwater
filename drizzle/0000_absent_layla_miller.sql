CREATE TABLE `audit` (
	`id` text PRIMARY KEY NOT NULL,
	`actor` text NOT NULL,
	`action` text NOT NULL,
	`record_id` text NOT NULL,
	`date` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE `files` (
	`id` text PRIMARY KEY NOT NULL,
	`case_id` text NOT NULL,
	`name` text NOT NULL,
	`mime` text NOT NULL,
	`owner` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE `grants` (
	`email` text PRIMARY KEY NOT NULL,
	`role` text NOT NULL,
	`case_id` text DEFAULT '' NOT NULL
);
--> statement-breakpoint
CREATE TABLE `members` (
	`id` text PRIMARY KEY NOT NULL,
	`email` text NOT NULL,
	`role` text NOT NULL,
	`case_id` text DEFAULT '' NOT NULL
);
--> statement-breakpoint
CREATE TABLE `records` (
	`id` text PRIMARY KEY NOT NULL,
	`kind` text NOT NULL,
	`case_id` text DEFAULT '' NOT NULL,
	`data` text NOT NULL,
	`updated` text NOT NULL
);
