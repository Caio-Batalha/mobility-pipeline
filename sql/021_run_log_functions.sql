-- Functions to start/finish a run in etl.run_log

CREATE OR REPLACE FUNCTION etl.start_run(
    p_source   text,
    p_task     text DEFAULT NULL,
    p_checksum text DEFAULT NULL
) RETURNS uuid
LANGUAGE plpgsql
AS $$
DECLARE
    v_run_id uuid;
BEGIN
    INSERT INTO etl.run_log (run_id, source, task, status, checksum_sha256)
    VALUES (gen_random_uuid(), p_source, p_task, 'started', p_checksum)
    RETURNING run_id INTO v_run_id;

    RETURN v_run_id;
END;
$$;

CREATE OR REPLACE FUNCTION etl.finish_run(
    p_run_id       uuid,
    p_status       text,               -- 'succeeded' | 'failed' | 'skipped'
    p_rows_staged  integer DEFAULT NULL,
    p_rows_merged  integer DEFAULT NULL,
    p_error_msg    text    DEFAULT NULL
) RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE etl.run_log
    SET finished_at     = now(),
        status          = p_status,
        rows_staged     = COALESCE(p_rows_staged, rows_staged),
        rows_merged     = COALESCE(p_rows_merged, rows_merged),
        error_message   = p_error_msg
    WHERE run_id = p_run_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'etl.finish_run(): unknown run_id: %', p_run_id;
    END IF;
END;
$$;

-- Allow the app role to execute these (read/append is already granted on table)
GRANT EXECUTE ON FUNCTION etl.start_run(text, text, text) TO mobility_app;
GRANT EXECUTE ON FUNCTION etl.finish_run(uuid, text, integer, integer, text) TO mobility_app;
