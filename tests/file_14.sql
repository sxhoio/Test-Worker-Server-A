// Generated file for commit 14
// Commit message: Create database migration scripts
// Created at: 08/06/2025 16:30:33
-- Migration for: Create database migration scripts
CREATE TABLE IF NOT EXISTS feature_14 (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO feature_14 (name) VALUES ('Create database migration scripts');
