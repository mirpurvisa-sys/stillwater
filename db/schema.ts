import {sqliteTable,text} from 'drizzle-orm/sqlite-core';
export const records=sqliteTable('records',{id:text('id').primaryKey(),kind:text('kind').notNull(),caseId:text('case_id').notNull().default(''),data:text('data').notNull(),updated:text('updated').notNull()});
export const members=sqliteTable('members',{id:text('id').primaryKey(),email:text('email').notNull(),role:text('role').notNull(),caseId:text('case_id').notNull().default('')});
export const grants=sqliteTable('grants',{email:text('email').primaryKey(),role:text('role').notNull(),caseId:text('case_id').notNull().default('')});
export const audit=sqliteTable('audit',{id:text('id').primaryKey(),actor:text('actor').notNull(),action:text('action').notNull(),recordId:text('record_id').notNull(),date:text('date').notNull()});
export const files=sqliteTable('files',{id:text('id').primaryKey(),caseId:text('case_id').notNull(),name:text('name').notNull(),mime:text('mime').notNull(),owner:text('owner').notNull()});
