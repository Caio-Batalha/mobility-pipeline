CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.traffic_raw (
    id BIGSERIAL PRIMARY KEY,
    run_id UUID NOT NULL,
    fetched_at TIMESTAMPTZ NOT NULL,
    payload JSONB NOT NULL
);

GRANT USAGE, SELECT ON SEQUENCE staging.traffic_raw_id_seq TO mobility_app;
