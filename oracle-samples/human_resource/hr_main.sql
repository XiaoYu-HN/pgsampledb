
psql -U postgres postgres -a -f hr_db.sql
PGOPTIONS="-c search_path=hr" psql -U dbadmin sampledb -a -f hr_cre.sql
PGOPTIONS="-c search_path=hr" psql -U dbadmin sampledb -a -f hr_popul.sql
PGOPTIONS="-c search_path=hr" psql -U dbadmin sampledb -a -f hr_idx.sql
PGOPTIONS="-c search_path=hr" psql -U dbadmin sampledb -a -f hr_comnt.sql
PGOPTIONS="-c search_path=hr" psql -U dbadmin sampledb -a -f hr_code.sql
PGOPTIONS="-c search_path=hr" psql -U dbadmin sampledb -a -f hr_analz.sql

