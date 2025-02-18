DO $$

DECLARE

  tbl RECORD;

BEGIN
  FOR tbl IN

    SELECT schemaname, tablename
    FROM pg tables
    WHERE schemaname NOT IN ('pg_catalog', ‘information_schema') -- Systemtabellen ausschlieBen

  LOOP
    EXECUTE FORMAT (

    'SELECT ''%s.%s'' AS table name, COUNT(*) AS row count FROM %I.%I',
    tbl.schemaname, tbl.tablename, tbl.schemaname, tbl.tablename

    );

  END LOOP;

END;

$$ LANGUAGE plpgsql;


