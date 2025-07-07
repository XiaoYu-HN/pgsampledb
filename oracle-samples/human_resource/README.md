HR (Human Resources) is the smallest and most simple one of the Sample Schemas.

use hr_main to create objects and populate data...

There's two methods to restore hr schema.

Method 1:
use hr_main.sql script

Method 2:
restore sampledb dump file

```bash
psql -d sampledb -f sampledb.dump
```

before restore dump, please make sure database and roles are ready:
```sql
CREATE DATABASE sampledb;
CREATE ROLE hr LOGIN PASSWORD 'Welcome1';
CREATE ROLE sh LOGIN PASSWORD 'Welcome1';
```
