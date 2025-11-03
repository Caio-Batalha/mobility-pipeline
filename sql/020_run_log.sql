-- Enable UUID generator (needed for gen_random_uuid())
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- A simple run log for ETL executions
CREATE TABLE IF NOT EXISTS etl.run_log (
    run_id           uuid PRIMARY KEY DEFAULT gen_random_uuid(),  -- unique per run
    source           text        NOT NULL,                         -- e.g. 'traffic' | 'fuel' | 'weather'
    task             text        NULL,                             -- optional sub-task name (e.g. 'ingest', 'merge')
    started_at       timestamptz NOT NULL DEFAULT now(),           -- when the run started
    finished_at      timestamptz NULL,                             -- set on completion
    status           text        NOT NULL CHECK (status IN ('started','succeeded','failed','skipped')),
    rows_staged      integer     NULL,                             -- raw rows landed
    rows_merged      integer     NULL,                             -- rows upserted into core
    checksum_sha256  text        NULL,                             -- optional dedupe integrity marker
    error_message    text        NULL                              -- truncated error details if failed
);

-- Helpful indexes for monitoring and lookups
CREATE INDEX IF NOT EXISTS ix_run_log_started_at_desc ON etl.run_log (started_at DESC);
CREATE INDEX IF NOT EXISTS ix_run_log_source_started ON etl.run_log (source, started_at DESC);

-- Privileges: allow the app to read/append, but not drop/alter
GRANT USAGE ON SCHEMA etl TO mobility_app;
GRANT SELECT, INSERT, UPDATE ON etl.run_log TO mobility_app;

-- Optional: future tables in etl default to readable/changeable by mobility_app
ALTER DEFAULT PRIVILEGES IN SCHEMA etl GRANT SELECT, INSERT, UPDATE ON TABLES TO mobility_app;
