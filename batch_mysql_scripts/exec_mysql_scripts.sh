#! /bin/sh

#设置系统环境变量IFS（字段分隔符）为\n
#目的是保证cat命令读出的数据是一行
IFS=$'\n'

for row in `cat exec_mysql_scripts.ini`
do
	#如果第一个字符是#则跳过该行不予处理
	if [ s`echo ${row} | cut -c 1` = "s#" ];
	then
		continue 
	fi

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
