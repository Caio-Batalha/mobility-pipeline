CREATE TABLE IF NOT EXISTS staging.weather_raw (
    id           BIGSERIAL PRIMARY KEY,
    run_id       UUID        NOT NULL,
    source       text        NOT NULL DEFAULT 'open-meteo',
    city_name    text        NOT NULL,
    country_code char(2)     NOT NULL,
    lat          double precision NOT NULL,
    lon          double precision NOT NULL,
    observed_at  timestamptz NOT NULL,
    payload      jsonb       NOT NULL,
    inserted_at  timestamptz NOT NULL DEFAULT now()
);

GRANT INSERT ON staging.weather_raw TO mobility_app;
