--liquibase formatted sql

--changeset softserveinc:1513597385307-1
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'image_type') THEN
        CREATE TYPE IMAGE_TYPE AS ENUM ('USER', 'ISSUE');
    END IF;
END $$;

--changeset softserveinc:1513597385307-2
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'user_type') THEN
        CREATE TYPE USER_TYPE AS ENUM ('ROLE_BANNED', 'ROLE_USER', 'ROLE_ADMIN', 'ROLE_MASTER');
    END IF;
END $$;
