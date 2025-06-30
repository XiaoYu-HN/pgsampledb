
DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN
        SELECT tablename
        FROM pg_tables
        WHERE schemaname = 'hr'
    LOOP
        EXECUTE 'ANALYZE hr.' || quote_ident(r.tablename);
    END LOOP;
END$$;
