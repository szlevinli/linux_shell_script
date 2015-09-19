#! /bin/bash

#IFS=$'\r\n'
#for line in `cat t1.txt`
#do
    #echo ${line}
#    cust_code=`echo ${line} | awk -F '\t' '{print $1}'`
#    prod_code=`echo ${line} | awk -F '\t' '{print $2}'`
#    orig_city=`echo ${line} | awk -F '\t' '{print $3}'`
#    start_dt=`echo ${line} | awk -F '\t' '{print $4}'`
#    end_dt=`echo ${line} | awk -F '\t' '{print $5}'`
#    echo "$cust_code--$prod_code--$end_dt" 
#done

para_file=./para.txt
template_file=./template.sql
IFS=$'\t\r\n'
while read -r customer_code prod_code orig_city start_dt end_dt
do
    sed -e "s|\[\[\[start_dt\]\]\]|${start_dt}|g" \
        -e "s|\[\[\[end_dt\]\]\]|${end_dt}|g" \
        -e "s|\[\[\[prod_code\]\]\]|${prod_code}|g" \
        -e "s|\[\[\[customer_code\]\]\]|${customer_code}|g" \
        ${template_file}
done < ${para_file}
