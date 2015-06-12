#! /bin/sh


for row in `cat exec_mysql_scripts.ini`
do
	mysql_scripts_dir=`echo "${row}" | awk -F'|' '{print $1}'`
	mysql_db_host=`echo "${row}" | awk -F'|' '{print $2}'`
	mysql_db_user=`echo "${row}" | awk -F'|' '{print $3}'`
	mysql_db_pwd=`echo "${row}" | awk -F'|' '{print $4}'`
	mysql_db_dbname=`echo "${row}" | awk -F'|' '{print $5}'`


	for filename in `ls ${mysql_scripts_dir}/*.sql`
	do
		mysql -f -h ${mysql_db_host} -u ${mysql_db_user} -p${mysql_db_pwd} ${mysql_db_dbname} < ${filename} > ${filename}.err 2>&1
	done
done

echo "ERROR..."
ls -l */*.err | awk '$5 > 0 {print $9}'
