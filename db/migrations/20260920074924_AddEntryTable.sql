-- migrate:up

CREATE TABLE IF NOT EXISTS entries (
        id INT GENERATED ALWAYS AS IDENTITY,
        external_id uuid UNIQUE NOT NULL DEFAULT gen_random_uuid (),
        headline text NOT NULL,
        occurrance_date DATE NOT NULL,
        notes text NULL,
        tags text[] NULL,
        created timestamp default current_timestamp,
        updated timestamp default current_timestamp
);

CREATE TRIGGER update_entries_modtime
BEFORE UPDATE ON entries
FOR EACH ROW EXECUTE PROCEDURE update_modified_column();


-- migrate:down

DROP TRIGGER IF EXISTS update_entries_modtime ON entries;

DROP TABLE IF EXISTS entries;


