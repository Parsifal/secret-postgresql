# secret-postgresql

Secret implementation in PostgreSQL.

## Usage

Run the SQL file or include the feature in your database migration.

## Example

```sql
create table users
(
    id       text default secret(),
    password text default secret()
);
```
