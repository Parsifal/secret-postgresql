create extension if not exists pgcrypto;

create function secret(length integer DEFAULT 64) returns text
    stable
    language plpgsql
as
$$
DECLARE
    bytes    bytea := gen_random_bytes(length);
    alphabet text  := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ-abcdefghijklmnopqrstuvwxyz_0123456789';
    id       text  := '';
    i        int   := 0;
BEGIN
    WHILE i < length
        LOOP
            id := id || substr(alphabet, (get_byte(bytes, i) & 63) + 1, 1);
            i = i + 1;
        END LOOP;
    RETURN id;
END
$$;