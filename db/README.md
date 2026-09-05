# Database management

Using [dbmate]() for migrations then the relevant commands are:

* `dbmate new <migration name>` to create a new migration, using PascalCase makes for the best migration file names
* `dbmate migrate` will apply migrations
* the last migration can be rolled back with `dbmate rollback`

The first useful migration is to create a modified field update function

```sql

-- migrate:up

CREATE OR REPLACE FUNCTION update_modified_column() 
	RETURNS TRIGGER AS $$
	BEGIN
	    NEW.modified = now();
	    RETURN NEW; 
	END;
	$$ language 'plpgsql';

-- migrate:down

DROP FUNCTION update_modified_column;
```