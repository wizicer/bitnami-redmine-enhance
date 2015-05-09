#! /bin/sh
password=$(grep "password:" /opt/bitnami/apps/redmine/htdocs/config/database.yml|awk -F':' '{print $2}'|awk '{print $1}'|head -n 1)

# required settings 
DB_USERNAME='bitnami'
DB_PASSWORD=$password
DB_NAME='bitnami_redmine'
REDMINE_ROOT='/opt/bitnami/apps/redmine/htdocs'
BACKUP_ROOT='/home/bitnami/backup'

echo 'Setting up directories'
mkdir $BACKUP_ROOT/redmine/db -p
mkdir $BACKUP_ROOT/redmine/files -p

echo 'Backing up database'
mysqldump -u $DB_USERNAME --password=$DB_PASSWORD $DB_NAME | gzip > $BACKUP_ROOT/redmine/db/`date +%Y%m%d`.gz

echo 'Backing up attachments'
rsync -a $REDMINE_ROOT/files/ $BACKUP_ROOT/redmine/files/

echo 'Backup complete'

