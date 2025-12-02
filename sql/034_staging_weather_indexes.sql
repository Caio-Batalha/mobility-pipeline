CREATE INDEX IF NOT EXISTS ix_stg_weather_city_time
  ON staging.weather_raw (city_name, country_code, observed_at DESC);

CREATE INDEX IF NOT EXISTS ix_stg_weather_observed_brin
  ON staging.weather_raw USING BRIN (observed_at);

GRANT USAGE, SELECT ON SEQUENCE staging.weather_raw_id_seq TO mobility_app;
