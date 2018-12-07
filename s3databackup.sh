#!/bin/bash

a="carmatec.com"
b="carmatec.ae"
c="codewebber.com"
d="colorcuboid.com"
e="instacarma.com"
f="qatar.carmatec.com"
g="railscarma.com"

tar czf /backup/daily/${a}.tar.gz -C /home/carmatec/public_html/ carmatec.com
tar czf /backup/daily/${b}.tar.gz -C /home/carmatec/public_html/ carmatec.ae
tar czf /backup/daily/${c}.tar.gz -C /home/carmatec/public_html/ codewebber.com
tar czf /backup/daily/${d}.tar.gz -C /home/carmatec/public_html/ colorcuboid.com
tar czf /backup/daily/${e}.tar.gz -C /home/carmatec/public_html/ instacarma.com
tar czf /backup/daily/${f}.tar.gz -C /home/carmatec/public_html/ qatar.carmatec.com
tar czf /backup/daily/${g}.tar.gz -C /home/carmatec/public_html/ railscarma.com




##Directory which needs to be backed up

SOURCE="/backup/daily"

##Name of the backup in bucket

DESTINATION=`date +%F`

##Backup degree

DEGREE=2

##Uploading the daily backup to Amazon s3

/usr/bin/s3cmd -r put ${SOURCE} s3://carmatec-backup/${DESTINATION}/

find /backup/daily -mtime +1 -exec rm {} \;
