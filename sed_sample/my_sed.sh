#! /bin/bash

para_file=./para.txt
template_file=./template.sql
IFS=$'\t'
while read -r customer_code prod_code orig_city start_dt end_dt
do
    sed -e "s|\[\[\[start_dt\]\]\]|${start_dt}|g" \
        -e "s|\[\[\[end_dt\]\]\]|${end_dt}|g" \
        -e "s|\[\[\[prod_code\]\]\]|${prod_code}|g" \
        -e "s|\[\[\[customer_code\]\]\]|${customer_code}|g" \
        ${template_file}
done < ${para_file}
