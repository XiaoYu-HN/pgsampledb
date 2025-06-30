
psql -U postgres postgres -a -f hr_db.sql
psql -U hr sampledb -a -f hr_cre.sql
psql -U hr sampledb -a -f hr_popul.sql
psql -U hr sampledb -a -f hr_idx.sql
psql -U hr sampledb -a -f hr_comnt.sql
psql -U hr sampledb -a -f hr_code.sql
psql -U hr sampledb -a -f hr_analz.sql
