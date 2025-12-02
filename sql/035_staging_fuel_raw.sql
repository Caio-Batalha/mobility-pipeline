CREATE TABLE IF NOT EXISTS staging.fuel_raw (
    id           BIGSERIAL PRIMARY KEY,
    run_id       UUID        NOT NULL,
    source       text        NOT NULL DEFAULT 'eia',
    market_code  text        NOT NULL,   -- e.g. 'WTI', 'BRENT', 'RBOB', or country code
    fuel_type    text        NOT NULL,   -- e.g. 'crude', 'gasoline'
    observed_at  timestamptz NOT NULL,
    payload      jsonb       NOT NULL,
    inserted_at  timestamptz NOT NULL DEFAULT now()
);

GRANT INSERT ON staging.fuel_raw TO mobility_app;
