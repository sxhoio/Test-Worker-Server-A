// Generated file for commit 56
// Commit message: Create scheduled tasks
// Created at: 08/06/2025 16:30:42
-- Migration for: Create scheduled tasks
CREATE TABLE IF NOT EXISTS feature_56 (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO feature_56 (name) VALUES ('Create scheduled tasks');
