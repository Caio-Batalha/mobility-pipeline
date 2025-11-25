CREATE INDEX IF NOT EXISTS ix_stg_traffic_city_time
  ON staging.traffic_raw (city_name, country_code, observed_at DESC);

CREATE INDEX IF NOT EXISTS ix_stg_traffic_observed_brin
  ON staging.traffic_raw USING BRIN (observed_at);
