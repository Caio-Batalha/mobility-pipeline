CREATE INDEX IF NOT EXISTS ix_stg_fuel_market_time
  ON staging.fuel_raw (market_code, fuel_type, observed_at DESC);

CREATE INDEX IF NOT EXISTS ix_stg_fuel_observed_brin
  ON staging.fuel_raw USING BRIN (observed_at);

GRANT USAGE, SELECT ON SEQUENCE staging.fuel_raw_id_seq TO mobility_app;
