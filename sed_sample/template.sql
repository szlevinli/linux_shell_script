insert into tt_dm_prod_price_strat
(
    strategy -- 报价策略
    ,execute_tm -- 价格执行日期
    ,start_dt -- 生效时间
    ,end_dt -- 失效时间
    ,creator -- 创建人
    ,create_tm -- 创建时间
    ,updater -- 修改人
    ,update_tm -- 修改时间
    ,prod_code -- 
    ,cus_const_id -- 客户合同ID
)
select
    2
    ,null
    ,'[[[start_dt]]]' -- M
    ,'[[[end_dt]]]' -- M
    ,'ppsadmin'
    ,now()
    ,'ppsadmin'
    ,now()
    ,'[[[prod_code]]]' -- M
    ,a.cus_const_id
from
    tt_dm_cus_contract a -- 客户合同(运费/增值配置协议)
    join tt_dm_offer_cus b -- 已报价客户(折扣协议主表)
    on a.off_cus_id = b.off_cus_id
    and b.customer_code = '[[[customer_code]]]' -- M
;
