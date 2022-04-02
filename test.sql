CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username varchar(255) UNIQUE NOT NULL,
  password varchar(255) NOT NULL
);

juicebox-dev=# \d users
                                  Table "public.users"
  Column  |          Type          |                     Modifiers                      
----------+------------------------+----------------------------------------------------
 id       | integer                | not null default nextval('users_id_seq'::regclass)
 username | character varying(255) | not null
 password | character varying(255) | not null
Indexes:
    "users_pkey" PRIMARY KEY, btree (id)
    "users_username_key" UNIQUE CONSTRAINT, btree (username)

INSERT INTO users (username, password)
VALUES
  ('albert', 'bertie99'),
  ('sandra', '2sandy4me'),
  ('glamgal', 'soglam');

# INSERT 0 3


SELECT * FROM users; 

 id | username | password  
----+----------+-----------
  1 | albert   | bertie99
  2 | sandra   | 2sandy4me
  3 | glamgal  | soglam
(3 rows)

SELECT id, username FROM users WHERE username='albert' AND password='bertie99';

 id | username 
----+----------
  1 | albert
(1 row)

SELECT id, username FROM users WHERE username='albert' AND password='bertiw99';

 id | username 
----+----------
(0 rows)

\q

DROP TABLE table_name;
DROP TABLE IF EXISTS users;
NOTICE:  table "users" does not exist, skipping
DROP TABLE

DROP TABLE users;
DROP TABLE

DROP TABLE users;

client.query(`
  INSERT INTO users(username, password) VALUES ($1, $2);
`, [ "some_name", "some_password" ]);
