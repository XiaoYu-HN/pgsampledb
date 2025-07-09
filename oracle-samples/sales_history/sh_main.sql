psql -U sh sampledb -a -f csh_v3.sql
# please uncompress data files first
# tar -zxvf data_v3.tar.gz
psql -U sh sampledb -a -f lsh_v3.sql
psql -U sh sampledb -a -f cons_v3.sql
psql -U sh sampledb -a -f idx_v3.sql
psql -U sh sampledb -a -f views_v3.sql
psql -U sh sampledb -a -f cmnts_v3.sql
