
--分类表
--drop table tmCategory;
create table tmCategory(
  cid number , --分类id
  name varchar2(500), --分类名称
  constraint pk_cate_id primary key (cid)
);
drop sequence tm_cid;
create sequence tm_cid increment by 1 start with 1018;--分类表序列（tm_cid）

select * from tmcategory;
INSERT INTO tmcategory VALUES (1001,'安全座椅');
INSERT INTO tmcategory VALUES (1002,'太阳镜');
INSERT INTO tmcategory VALUES (1003,'品牌女装');
INSERT INTO tmcategory VALUES (1004,'时尚男鞋');
INSERT INTO tmcategory VALUES (1005,'男士西服');
INSERT INTO tmcategory VALUES (1006,'男士手拿包 ');
INSERT INTO tmcategory VALUES (1007,'男表');
INSERT INTO tmcategory VALUES (1008,'女表');
INSERT INTO tmcategory VALUES (1009,'空调');
INSERT INTO tmcategory VALUES (1010,'冰箱');
INSERT INTO tmcategory VALUES (1011,'原汁机');
INSERT INTO tmcategory VALUES (1012,'扫地机器人 ');
INSERT INTO tmcategory VALUES (1013,'平衡车');
INSERT INTO tmcategory VALUES (1014,'电热水器');
INSERT INTO tmcategory VALUES (1015,'沙发');
INSERT INTO tmcategory VALUES (1016,'马桶');
INSERT INTO tmcategory VALUES (1017,'平板电视');

--用户表
--drop table tmuser;
create table tmuser(
       tmuid number,            --用户ID
       name varchar2(500),      --用户名
       password varchar2(500),          --密码
       constraint pk_user_tmuid primary key(tmuid)
);
drop sequence tm_tmuid;
create sequence tm_tmuid increment by 1 start with 8001;--评论表序列（tm_tmuid）
select * from tmuser;
insert into tmuser values(8001,'admin','123456');

--商店管理员表
--drop table tmstoreadmin;
create table tmstoreadmin(
       sdid number primary key,--商店管理员编号
       name varchar2(400) not null,--商店管理员姓名
       password varchar2(400) not null--商店管理员登陆密码
);
drop sequence tm_sdid;
create sequence tm_sdid increment by 1 start with 11001;--商店管理员表序列（tm_sdid）
insert into tmstoreadmin values(11001,'admin','123456');

--网站管理员表
--drop table tmadmin;
create table tmadmin(
     aid number primary key,--网站管理员编号
     name varchar2(400) not null,--网站管理员姓名
     password varchar2(400) not null,--网站管理员登陆密码
     class varchar2(400) not null--网站管理员的级别
);
drop sequence tm_aid;
create sequence tm_aid increment by 1 start with 12001;--网站管理员表序列（tm_aid）
insert into tmadmin values (12001,'admin','123456','1');
--属性表
--drop table tmproperty;
create table tmproperty(
       pid number, --属性id
       cid number not null,--所属类id
       name varchar2(500), --属性名称
       constraint pk_prop_id primary key (pid),
       constraint tmpr_cid_fk foreign key(cid) references tmCategory(cid)--外键
);
drop sequence tm_pid;
create sequence tm_pid increment by 1 start with 2001;--分类表序列（tm_pid）

INSERT INTO tmproperty VALUES (2001,1007,'品牌');
INSERT INTO tmproperty VALUES (2002,1007,'证书状态');
INSERT INTO tmproperty VALUES (2003,1007,'3C产品型号');
INSERT INTO tmproperty VALUES (2004,1007,'申请人名称');
INSERT INTO tmproperty VALUES (2005,1007,'证书编号');
INSERT INTO tmproperty VALUES (2006,1007,'分辨率');
INSERT INTO tmproperty VALUES (2007,1007,'型号');
INSERT INTO tmproperty VALUES (2008,1007,'制造商名称');
INSERT INTO tmproperty VALUES (2009,1007,'网络连接方式');
INSERT INTO tmproperty VALUES (2010,1007,'产品名称');
INSERT INTO tmproperty VALUES (2011,1007,'能效等级');
INSERT INTO tmproperty VALUES (2012,1007,'3D类型');
INSERT INTO tmproperty VALUES (2013,1007,'操作系统');
INSERT INTO tmproperty VALUES (2014,1006,'品牌');
INSERT INTO tmproperty VALUES (2015,1006,'冲水按键类型');
INSERT INTO tmproperty VALUES (2016,1006,'坐便器类型');
INSERT INTO tmproperty VALUES (2017,1006,'盖板是否缓冲');
INSERT INTO tmproperty VALUES (2018,1006,'型号');
INSERT INTO tmproperty VALUES (2019,1006,'坐便器冲水方式');
INSERT INTO tmproperty VALUES (2020,1006,'排水方式');
INSERT INTO tmproperty VALUES (2021,1006,'材质');
INSERT INTO tmproperty VALUES (2022,1006,'最小坑距');
INSERT INTO tmproperty VALUES (2023,1006,'承重');
INSERT INTO tmproperty VALUES (2024,1006,'颜色分类');
INSERT INTO tmproperty VALUES (2025,1006,'坐便冲水量');
INSERT INTO tmproperty VALUES (2026,1006,'同城服务');
INSERT INTO tmproperty VALUES (2027,1005,'风格');
INSERT INTO tmproperty VALUES (2028,1005,'城市');
INSERT INTO tmproperty VALUES (2029,1005,'面料饰面工艺');
INSERT INTO tmproperty VALUES (2030,1005,'是否带储物空间');
INSERT INTO tmproperty VALUES (2031,1005,'包装体积');
INSERT INTO tmproperty VALUES (2032,1005,'颜色分类');
INSERT INTO tmproperty VALUES (2033,1005,'附加功能');
INSERT INTO tmproperty VALUES (2034,1005,'是否可拆洗');
INSERT INTO tmproperty VALUES (2035,1005,'结构工艺');
INSERT INTO tmproperty VALUES (2036,1005,'设计元素');
INSERT INTO tmproperty VALUES (2037,1005,'几人坐');
INSERT INTO tmproperty VALUES (2038,1005,'图案');
INSERT INTO tmproperty VALUES (2039,1005,'是否组装');
INSERT INTO tmproperty VALUES (2040,1005,'面料');
INSERT INTO tmproperty VALUES (2041,1005,'可送货/安装');
INSERT INTO tmproperty VALUES (2042,1005,'木质结构工艺');
INSERT INTO tmproperty VALUES (2043,1005,'沙发组合形式');
INSERT INTO tmproperty VALUES (2044,1005,'产地');
INSERT INTO tmproperty VALUES (2045,1005,'是否可定制');
INSERT INTO tmproperty VALUES (2046,1005,'品牌');
INSERT INTO tmproperty VALUES (2047,1005,'适用对象');
INSERT INTO tmproperty VALUES (2048,1005,'材质');
INSERT INTO tmproperty VALUES (2049,1005,'款式定位');
INSERT INTO tmproperty VALUES (2050,1005,'填充物');
INSERT INTO tmproperty VALUES (2051,1005,'填充物硬度');
INSERT INTO tmproperty VALUES (2052,1005,'出租车是否可运输');
INSERT INTO tmproperty VALUES (2053,1005,'型号');
INSERT INTO tmproperty VALUES (2054,1005,'木质材质');
INSERT INTO tmproperty VALUES (2055,1005,'是否可预售');
INSERT INTO tmproperty VALUES (2056,1005,'安装说明详情');

--商店表
--drop table tmstore;
create table tmstore(
       sid number, --商店id
       sdid number, --商店管理员id
       name varchar2(500),--商店名称
       phone varchar2(500),--商店联系电话
       describe varchar2(500),--商店描述
       constraint pk_store_id primary key (sid),
       constraint tmsto_sdid_fk foreign key(sdid) references tmstoreadmin(sdid)--外键
);
drop sequence tm_sid;
create sequence tm_sid increment by 1 start with 5002;--商品属性值表序列（tm_sid）
select * from tmstore;
insert into tmstore values (5001,11001,'admin','123456789','测试商店');

--商品表
--drop table tmproduct;
create table tmproduct(
       pdid number,  --商品id
       name varchar2(500), --商品名称
       subtitle varchar2(500), --商品副标题（简述）
       originprice number, --商品原价
       promoteprice number, --商品促销价
       cid number, --商品类别id
       sid number, --店铺id
       constraint pk_prod_id primary key (pdid),
       constraint tmprd_cid_fk foreign key(cid) references tmCategory(cid),--外键
       constraint tmpr_spid_fk foreign key(sid) references tmstore(sid)--外键
);
drop sequence tm_pdid;
create sequence tm_pdid increment by 1 start with 3016;--商品表序列（tm_pdid）

INSERT INTO tmproduct VALUES (3001,'Konka/康佳 LED32S1卧室32吋安卓智能无线WIFI网络液晶平板电视机','32吋电视机 8核智能 网络 全国联保 送货上门',1699,1104.35,1017,5001);
INSERT INTO tmproduct VALUES (3002,'Hisense/海信 LED49EC320A 49吋led液晶电视机智能网络平板电视50','新品特惠 十核智能 内置WiFi 咨询有惊喜',2799,1679.4,1017,5001);
INSERT INTO tmproduct VALUES (3003,'Hisense/海信 LED40EC520UA 40英寸4K智能平板液晶电视机WIFI网络','周末 特惠 2189 元还送 精美礼品',2399,1439.4,1017,5001);
INSERT INTO tmproduct VALUES (3004,'Changhong/长虹 65S1安卓智能12核65英寸网络平板LED液晶电视机70','屏大影院 高配12核 安卓智能',4499.01,3824.16,1017,5001);
INSERT INTO tmproduct VALUES (3005,'夏普屏PANDA/熊猫 LE39D71S 39英寸智能WiFi液晶平板电视40 42 43','',2499,1874.25,1017,5001);
INSERT INTO tmproduct VALUES (3006,'乐洁士智能马桶高品质全自动遥控感应一体式智能坐便器座便器','全国联保 清洗烘干 气泡按摩 座圈加热 断电冲水',8960,8512,1016,5001);
INSERT INTO tmproduct VALUES (3007,'箭牌马桶/ARROW AB1118脲醛盖板连体喷射虹吸式坐便器座便器正品','领券更优惠 品质脲醛盖 千城送装 送安装配件',1976,1482,1016,5001);
INSERT INTO tmproduct VALUES (3008,'纳蒂兰卡1066卫浴漩冲虹吸式马桶350坑距坐便器可配智能盖座便器','盖板易拆 送全套配件 500区县 送货入户安装',1670,1503,1016,5001);
INSERT INTO tmproduct VALUES (3009,'德国DGPOSY超漩式彩色马桶缓降坐便器静音节水抽水马桶连体座便器','纳米自洁釉 漩涡排污 静音节水 净重50kg',2399,1799.25,1016,5001);
INSERT INTO tmproduct VALUES (3010,'纳蒂兰卡 1082卫浴洁具 钻石切边 坐便器 虹吸式抽水马桶 座便器','高性价比 造型新颖 钻石品质 时尚尊贵 好评如潮',1900,1710,1016,5001);
INSERT INTO tmproduct VALUES (3011,'新款布艺沙发 可拆洗大小户型客厅简约家居贵妃组合L型转角布沙发','',5198,3638.6,1015,5001);
INSERT INTO tmproduct VALUES (3012,'凯米蒂亚欧式真皮沙发组合客厅奢华转角皮艺蓝色沙发美式实木家具','匠心独运 欧式美式设计 头层真皮 三包到家',18398,11038.8,1015,5001);
INSERT INTO tmproduct VALUES (3013,'南台布艺沙发组合可拆洗简约现代客厅整装家具布艺沙发组合大户型','16CM坐垫 16CM坐垫 重要的 事情 说三遍',6576,4274.4,1015,5001);
INSERT INTO tmproduct VALUES (3014,'依然美佳欧式布艺沙发组合可拆洗新款实木雕花大户型奢华别墅家具','高档户型客厅 精湛雕花工艺 实木框架 经典款式',10012,7008.4,1015,5001);
INSERT INTO tmproduct VALUES (3015,'雅居汇欧式沙发组合实木雕花客厅高档奢华大户型住宅家具布艺沙发','热卖推荐 端庄大气 四色可选 五年质保 品质服务',32450,22715,1015,5001);

select * from tmproduct;
--商店仓库表
--drop table tmstorewarehouse;
create table tmstorewarehouse(
       spid number primary key,--商店仓库id
       sid number not null,--商店编号
       pdid number not null,--产品编号
       count number not null,--产品数量 
       constraint tmst_sid_fk foreign key(sid) references tmstore(sid),--外键
       constraint tmst_pdid_fk foreign key(pdid) references tmProduct(pdid)--外键      
);
drop sequence tm_spid;
create sequence tm_spid increment by 1 start with 150016;--商店仓库表序列（tm_spid）
insert into tmstorewarehouse values (15001,5001,3001,1000);
insert into tmstorewarehouse values (15002,5001,3002,1000);
insert into tmstorewarehouse values (15003,5001,3003,1000);
insert into tmstorewarehouse values (15004,5001,3004,1000);
insert into tmstorewarehouse values (15005,5001,3005,1000);
insert into tmstorewarehouse values (15006,5001,3006,1000);
insert into tmstorewarehouse values (15007,5001,3007,1000);
insert into tmstorewarehouse values (15008,5001,3008,1000);
insert into tmstorewarehouse values (15009,5001,3009,1000);
insert into tmstorewarehouse values (15010,5001,3010,1000);
insert into tmstorewarehouse values (15011,5001,3011,1000);
insert into tmstorewarehouse values (15012,5001,3012,1000);
insert into tmstorewarehouse values (15013,5001,3013,1000);
insert into tmstorewarehouse values (15014,5001,3014,1000);
insert into tmstorewarehouse values (15015,5001,3015,1000);

select * from tmstorewarehouse;

--商品属性值表
--drop table tmpropertyvalue;
create table tmpropertyvalue(
       pvid number, --属性值id
       pid number, --所属属性id
       pdid number, --所属商品id
       value varchar2(500), --属性值
       constraint pk_propval_id primary key(pvid),
       constraint tmpro_pid_fk foreign key(pid) references tmProperty(pid),--外键
       constraint tmpro_pdid_fk foreign key(pdid) references tmProduct(pdid)--外键
);
drop sequence tm_pvid;
create sequence tm_pvid increment by 1 start with 40014;--商品属性值表序列（tm_pvid）
select * from tmpropertyvalue;

INSERT INTO tmpropertyvalue VALUES (4001,2013,3001,'VIDAA');
INSERT INTO tmpropertyvalue VALUES (4002,2012,3001,'无');
INSERT INTO tmpropertyvalue VALUES (4003,2011,3001,'一级');
INSERT INTO tmpropertyvalue VALUES (4004,2010,3001,'Hisense/海信 LED60EC660...');
INSERT INTO tmpropertyvalue VALUES (4005,2009,3001,'全部支持');
INSERT INTO tmpropertyvalue VALUES (4006,2008,3001,'青岛海信电器股份有限公司');
INSERT INTO tmpropertyvalue VALUES (4007,2007,3001,'LED60EC660US');
INSERT INTO tmpropertyvalue VALUES (4008,2006,3001,'3840x2160');
INSERT INTO tmpropertyvalue VALUES (4009,2005,3001,'2016010808835313');
INSERT INTO tmpropertyvalue VALUES (40010,2004,3001,'青岛海信电器股份有限公司');
INSERT INTO tmpropertyvalue VALUES (40011,2003,3001,'LED60K5500U、LED60EC660US');
INSERT INTO tmpropertyvalue VALUES (40012,2002,3001,'有效');
INSERT INTO tmpropertyvalue VALUES (40013,2001,3001,'Hisense/海信');


--产品图片表
--drop table tmproductimage;
create table tmproductimage(
       piid number,   --产品图片id
       pdid number,    --商品id
       imageadd varchar2(500),    --图片路径
       constraint pk_productimg_piid primary key(piid),
       constraint tmpr_pdid_fk foreign key(pdid) references tmProduct(pdid)--外键 
);
drop sequence tm_piid;
create sequence tm_piid increment by 1 start with 6001;--产品图片表序列（tm_piid）

--评论表
--drop table tmreview;
create table tmreview(
       rid number,     --评论id
       tmuid number,     --用户id
       pdid number,      --产品id
       content varchar2(500),        --评论
       createdate date,              --评论时间
       constraint pk_review_rid primary key(rid),
       constraint tmre_tmuid_fk foreign key(tmuid) references tmUser(tmuid),--外键 
       constraint tmre_pdid_fk foreign key(pdid) references tmProduct(pdid)--外键
);
drop sequence tm_rid;
create sequence tm_rid increment by 1 start with 7001;--评论表序列（tm_rid）


--订单表
--drop table tmorder;
create table tmorder(
       oid number,              --订单id  
       ordercode number,        --订单号
       address varchar2(500),   --地址
       post number,             --邮编
       recevier varchar2(500),  --接受者
       phone varchar2(500),     --电话
       usermassage varchar2(500),       --备注消息
       createdate date,                 --创建时间
       paydate date,                    --支付时间
       deliverydate date,               --发货时间
       confirmdate date,                --完成时间
       status number,                   --状态
       tmuid number,                    --用户id
       constraint pk_order_oid primary key(oid),
       constraint tmor_tmuid_fk foreign key(tmuid) references tmUser(tmuid)--外键
);
drop sequence tm_oid;
create sequence tm_oid increment by 1 start with 9001;--订单表序列（tm_oid）
insert into tmorder values(9001,20180812,'湖南工业大学',15155,'小超先生',484848484,'第一个订单',to_date('2018-08-12 10:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-08-13 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-08-13 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-08-13 04:47:16','YYYY-MM-DD HH24:MI:SS'),4,8001);
insert into tmorder values(9002,20180921,'湖南工业大学',15155,'小超先生',484848484,'第二个订单',to_date('2018-09-21 10:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-09-21 06:12:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-09-22 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-09-22 18:47:16','YYYY-MM-DD HH24:MI:SS'),4,8001);
insert into tmorder values(9003,20180613,'湖南工业大学',15155,'小超先生',484848484,'第三个订单',to_date('2018-06-13 10:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-06-14 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-06-15 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-06-16 04:47:16','YYYY-MM-DD HH24:MI:SS'),4,8001);
insert into tmorder values(9004,20180921,'湖南工业大学',15155,'小超先生',484848484,'第一个订单',to_date('2018-08-12 10:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-08-13 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-08-13 04:47:16','YYYY-MM-DD HH24:MI:SS'),null,3,8001);
insert into tmorder values(9005,20180521,'湖南工业大学',15155,'小超先生',484848484,'第一个订单',to_date('2018-05-12 10:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-05-13 04:47:16','YYYY-MM-DD HH24:MI:SS'),null,null,2,8001);
insert into tmorder values(9006,20180321,'湖南工业大学',15155,'小超先生',484848484,'第一个订单',to_date('2018-03-12 10:47:16','YYYY-MM-DD HH24:MI:SS'),null,null,null,1,8001);
insert into tmorder values(9007,20180721,'湖南工业大学',15155,'小超先生',484848484,'第一个订单',to_date('2018-07-12 10:47:16','YYYY-MM-DD HH24:MI:SS'),null,null,null,5,8001);
insert into tmorder values(9008,20181021,'湖南工业大学',15155,'小超先生',484848484,'第一个订单',to_date('2018-10-12 10:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-10-13 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-10-14 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-10-15 04:47:16','YYYY-MM-DD HH24:MI:SS'),4,8001);
insert into tmorder values(9009,20181023,'湖南工业大学',15155,'小超先生',484848484,'第一个订单',to_date('2018-10-23 10:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-10-24 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-10-25 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-10-26 04:47:16','YYYY-MM-DD HH24:MI:SS'),4,8001);
update tmorder set address = '安徽省' where oid = 9001;
update tmorder set address = '北京市' where oid = 9002;
update tmorder set address = '湖北省' where oid = 9003;
update tmorder set address = '湖南省' where oid = 9004;
update tmorder set address = '贵州省' where oid = 9005;
update tmorder set address = '江西省' where oid = 9006;
update tmorder set address = '福建省' where oid = 9007;
update tmorder set address = '安徽省' where oid = 9008;
update tmorder set address = '安徽省' where oid = 9009;
select * from tmorder;
select count(*) from tmorder where address like '%安徽省%';


select sum(onemoney) from (select tmproduct.pdid,promoteprice*summoney as onemoney from (select pdid,sum(count) as summoney from (select * from tmorderitem where oid in (select oid from tmorder where status != 5)) a group by pdid order by pdid) b,tmproduct where b.pdid = tmproduct.pdid);
select count(*) from tmorder where status = 4;
select sum(onemoney) from (select tmproduct.pdid,promoteprice*summoney as onemoney from (select pdid,sum(count) as summoney from (select * from tmorderitem where oid in (select oid from tmorder where status = 5)) a group by pdid order by pdid) b,tmproduct where b.pdid = tmproduct.pdid);
select count(*) from tmorder where to_char(createdate,'mm') = 10 and to_char(createdate,'yyyy') = to_char(sysdate,'yyyy')-1;

select sum(onemoney) from (select tmproduct.pdid,promoteprice*summoney as onemoney from (select pdid,sum(count) as summoney from (select * from tmorderitem where oid in (select oid from tmorder where status != 5)) a group by pdid order by pdid) b,tmproduct where b.pdid = tmproduct.pdid);
select count(*) from tmorder where status = 4;
select sum(onemoney) from (select tmproduct.pdid,promoteprice*summoney as onemoney from (select pdid,sum(count) as summoney from (select * from tmorderitem where oid in (select oid from tmorder where status = 5)) a group by pdid order by pdid) b,tmproduct where b.pdid = tmproduct.pdid);
select count(*) from tmorder where to_char(createdate,'mm') = 10 and to_char(createdate,'yyyy') = to_char(sysdate,'yyyy')-1;



--订单项表
--drop table tmorderitem;
create table tmorderitem(
       oiid number,            --订单项id
       pdid number,            --产品id
       tmuid number,           --用户id
       oid number,             --订单id
       count number,           --数量
       constraint pk_orderitem_oiid primary key(oiid),
       constraint tmorder_pdid_fk foreign key(pdid) references tmProduct(pdid),--外键
       constraint tmorder_tmuid_fk foreign key(tmuid) references tmUser(tmuid),--外键
       constraint tmor_oid_fk foreign key(oid) references tmOrder(oid)--外键
);
drop sequence tm_oiid;
create sequence tm_oiid increment by 1 start with 10001;--订单项表序列（tm_oiid）
insert into tmorderitem values(10001,3001,8001,9001,2);
insert into tmorderitem values(10002,3001,8001,9002,3);
insert into tmorderitem values(10003,3001,8001,9003,1);
insert into tmorderitem values(10004,3001,8001,9004,2);
insert into tmorderitem values(10005,3001,8001,9005,4);
insert into tmorderitem values(10006,3001,8001,9006,3);
insert into tmorderitem values(10007,3001,8001,9007,1);
insert into tmorderitem values(10008,3001,8001,9008,2);
insert into tmorderitem values(10009,3002,8001,9009,2);
insert into tmorderitem values(100010,3002,8001,9005,4);
insert into tmorderitem values(100011,3005,8001,9006,3);
insert into tmorderitem values(100012,3003,8001,9007,1);
insert into tmorderitem values(100013,3006,8001,9008,2);
insert into tmorderitem values(100014,3006,8001,9009,2);
insert into tmorderitem values(100015,3005,8001,9005,4);
insert into tmorderitem values(100016,3009,8001,9006,3);
insert into tmorderitem values(100017,3008,8001,9007,1);
insert into tmorderitem values(100018,3008,8001,9008,2);
insert into tmorderitem values(100019,3006,8001,9009,2);
select * from tmorderitem;
select allnumber from (select name,sum(allcount) as allnumber from (select tmproduct.pdid,cid,allcount from tmproduct,(select pdid,sum(count) as allcount from tmorderitem group by pdid) a where tmproduct.pdid =a.pdid) b,tmCategory where b.cid = tmCategory.cid group by name) where name = '平板电视';


--收货地址表
--drop table tmshoppingAddress;
create table tmshoppingAddress(
       addid number primary key,--收货地址编号
       tmuid number not null,--用户编号
       address varchar2(400) not null,--收货地址
       post varchar2(400) not null,--邮编
       recevier varchar2(400),--收货人
       phone varchar2(400) not null,--联系电话
       constraint tmsh_addid_fk foreign key(tmuid) references tmUser(tmuid)--外键
);
drop sequence tm_addid;
create sequence tm_addid increment by 1 start with 13002;--收货地址表序列（tm_addid）

insert into tmshoppingAddress values (13001,8001,'测试地址','123456','测试收货人','123456789');
--个人信息表
--drop table tmpersonalInformation;
create table tmpersonalInformation(
       perid number primary key,--个人详细信息编号
       tmuid number not null,--用户编号
       name varchar2(400) not null,--用户昵称
       headimg varchar2(400) not null,--用户头像
       sex varchar2(400) not null,--用户性别
       signature varchar2(400) not null,--个性签名
       constraint tmpe_perid_fk foreign key(tmuid) references tmUser(tmuid)--外键
);
drop sequence tm_perid;
create sequence tm_perid increment by 1 start with 14001;--个人信息表序列（tm_perid）
insert into tmpersonalInformation values (14002,8001,'testuser','heading','男','测试机');
