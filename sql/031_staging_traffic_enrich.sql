ALTER TABLE staging.traffic_raw
  ADD COLUMN IF NOT EXISTS city_name    text,
  ADD COLUMN IF NOT EXISTS country_code char(2),
  ADD COLUMN IF NOT EXISTS lat          double precision,
  ADD COLUMN IF NOT EXISTS lon          double precision,
  ADD COLUMN IF NOT EXISTS observed_at  timestamptz;
