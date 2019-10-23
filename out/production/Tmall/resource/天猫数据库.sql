
--�����
--drop table tmCategory;
create table tmCategory(
  cid number , --����id
  name varchar2(500), --��������
  constraint pk_cate_id primary key (cid)
);
drop sequence tm_cid;
create sequence tm_cid increment by 1 start with 1018;--��������У�tm_cid��

select * from tmcategory;
INSERT INTO tmcategory VALUES (1001,'��ȫ����');
INSERT INTO tmcategory VALUES (1002,'̫����');
INSERT INTO tmcategory VALUES (1003,'Ʒ��Ůװ');
INSERT INTO tmcategory VALUES (1004,'ʱ����Ь');
INSERT INTO tmcategory VALUES (1005,'��ʿ����');
INSERT INTO tmcategory VALUES (1006,'��ʿ���ð� ');
INSERT INTO tmcategory VALUES (1007,'�б�');
INSERT INTO tmcategory VALUES (1008,'Ů��');
INSERT INTO tmcategory VALUES (1009,'�յ�');
INSERT INTO tmcategory VALUES (1010,'����');
INSERT INTO tmcategory VALUES (1011,'ԭ֭��');
INSERT INTO tmcategory VALUES (1012,'ɨ�ػ����� ');
INSERT INTO tmcategory VALUES (1013,'ƽ�⳵');
INSERT INTO tmcategory VALUES (1014,'����ˮ��');
INSERT INTO tmcategory VALUES (1015,'ɳ��');
INSERT INTO tmcategory VALUES (1016,'��Ͱ');
INSERT INTO tmcategory VALUES (1017,'ƽ�����');

--�û���
--drop table tmuser;
create table tmuser(
       tmuid number,            --�û�ID
       name varchar2(500),      --�û���
       password varchar2(500),          --����
       constraint pk_user_tmuid primary key(tmuid)
);
drop sequence tm_tmuid;
create sequence tm_tmuid increment by 1 start with 8001;--���۱����У�tm_tmuid��
select * from tmuser;
insert into tmuser values(8001,'admin','123456');

--�̵����Ա��
--drop table tmstoreadmin;
create table tmstoreadmin(
       sdid number primary key,--�̵����Ա���
       name varchar2(400) not null,--�̵����Ա����
       password varchar2(400) not null--�̵����Ա��½����
);
drop sequence tm_sdid;
create sequence tm_sdid increment by 1 start with 11001;--�̵����Ա�����У�tm_sdid��
insert into tmstoreadmin values(11001,'admin','123456');

--��վ����Ա��
--drop table tmadmin;
create table tmadmin(
     aid number primary key,--��վ����Ա���
     name varchar2(400) not null,--��վ����Ա����
     password varchar2(400) not null,--��վ����Ա��½����
     class varchar2(400) not null--��վ����Ա�ļ���
);
drop sequence tm_aid;
create sequence tm_aid increment by 1 start with 12001;--��վ����Ա�����У�tm_aid��
insert into tmadmin values (12001,'admin','123456','1');
--���Ա�
--drop table tmproperty;
create table tmproperty(
       pid number, --����id
       cid number not null,--������id
       name varchar2(500), --��������
       constraint pk_prop_id primary key (pid),
       constraint tmpr_cid_fk foreign key(cid) references tmCategory(cid)--���
);
drop sequence tm_pid;
create sequence tm_pid increment by 1 start with 2001;--��������У�tm_pid��

INSERT INTO tmproperty VALUES (2001,1007,'Ʒ��');
INSERT INTO tmproperty VALUES (2002,1007,'֤��״̬');
INSERT INTO tmproperty VALUES (2003,1007,'3C��Ʒ�ͺ�');
INSERT INTO tmproperty VALUES (2004,1007,'����������');
INSERT INTO tmproperty VALUES (2005,1007,'֤����');
INSERT INTO tmproperty VALUES (2006,1007,'�ֱ���');
INSERT INTO tmproperty VALUES (2007,1007,'�ͺ�');
INSERT INTO tmproperty VALUES (2008,1007,'����������');
INSERT INTO tmproperty VALUES (2009,1007,'�������ӷ�ʽ');
INSERT INTO tmproperty VALUES (2010,1007,'��Ʒ����');
INSERT INTO tmproperty VALUES (2011,1007,'��Ч�ȼ�');
INSERT INTO tmproperty VALUES (2012,1007,'3D����');
INSERT INTO tmproperty VALUES (2013,1007,'����ϵͳ');
INSERT INTO tmproperty VALUES (2014,1006,'Ʒ��');
INSERT INTO tmproperty VALUES (2015,1006,'��ˮ��������');
INSERT INTO tmproperty VALUES (2016,1006,'����������');
INSERT INTO tmproperty VALUES (2017,1006,'�ǰ��Ƿ񻺳�');
INSERT INTO tmproperty VALUES (2018,1006,'�ͺ�');
INSERT INTO tmproperty VALUES (2019,1006,'��������ˮ��ʽ');
INSERT INTO tmproperty VALUES (2020,1006,'��ˮ��ʽ');
INSERT INTO tmproperty VALUES (2021,1006,'����');
INSERT INTO tmproperty VALUES (2022,1006,'��С�Ӿ�');
INSERT INTO tmproperty VALUES (2023,1006,'����');
INSERT INTO tmproperty VALUES (2024,1006,'��ɫ����');
INSERT INTO tmproperty VALUES (2025,1006,'�����ˮ��');
INSERT INTO tmproperty VALUES (2026,1006,'ͬ�Ƿ���');
INSERT INTO tmproperty VALUES (2027,1005,'���');
INSERT INTO tmproperty VALUES (2028,1005,'����');
INSERT INTO tmproperty VALUES (2029,1005,'�������湤��');
INSERT INTO tmproperty VALUES (2030,1005,'�Ƿ������ռ�');
INSERT INTO tmproperty VALUES (2031,1005,'��װ���');
INSERT INTO tmproperty VALUES (2032,1005,'��ɫ����');
INSERT INTO tmproperty VALUES (2033,1005,'���ӹ���');
INSERT INTO tmproperty VALUES (2034,1005,'�Ƿ�ɲ�ϴ');
INSERT INTO tmproperty VALUES (2035,1005,'�ṹ����');
INSERT INTO tmproperty VALUES (2036,1005,'���Ԫ��');
INSERT INTO tmproperty VALUES (2037,1005,'������');
INSERT INTO tmproperty VALUES (2038,1005,'ͼ��');
INSERT INTO tmproperty VALUES (2039,1005,'�Ƿ���װ');
INSERT INTO tmproperty VALUES (2040,1005,'����');
INSERT INTO tmproperty VALUES (2041,1005,'���ͻ�/��װ');
INSERT INTO tmproperty VALUES (2042,1005,'ľ�ʽṹ����');
INSERT INTO tmproperty VALUES (2043,1005,'ɳ�������ʽ');
INSERT INTO tmproperty VALUES (2044,1005,'����');
INSERT INTO tmproperty VALUES (2045,1005,'�Ƿ�ɶ���');
INSERT INTO tmproperty VALUES (2046,1005,'Ʒ��');
INSERT INTO tmproperty VALUES (2047,1005,'���ö���');
INSERT INTO tmproperty VALUES (2048,1005,'����');
INSERT INTO tmproperty VALUES (2049,1005,'��ʽ��λ');
INSERT INTO tmproperty VALUES (2050,1005,'�����');
INSERT INTO tmproperty VALUES (2051,1005,'�����Ӳ��');
INSERT INTO tmproperty VALUES (2052,1005,'���⳵�Ƿ������');
INSERT INTO tmproperty VALUES (2053,1005,'�ͺ�');
INSERT INTO tmproperty VALUES (2054,1005,'ľ�ʲ���');
INSERT INTO tmproperty VALUES (2055,1005,'�Ƿ��Ԥ��');
INSERT INTO tmproperty VALUES (2056,1005,'��װ˵������');

--�̵��
--drop table tmstore;
create table tmstore(
       sid number, --�̵�id
       sdid number, --�̵����Աid
       name varchar2(500),--�̵�����
       phone varchar2(500),--�̵���ϵ�绰
       describe varchar2(500),--�̵�����
       constraint pk_store_id primary key (sid),
       constraint tmsto_sdid_fk foreign key(sdid) references tmstoreadmin(sdid)--���
);
drop sequence tm_sid;
create sequence tm_sid increment by 1 start with 5002;--��Ʒ����ֵ�����У�tm_sid��
select * from tmstore;
insert into tmstore values (5001,11001,'admin','123456789','�����̵�');

--��Ʒ��
--drop table tmproduct;
create table tmproduct(
       pdid number,  --��Ʒid
       name varchar2(500), --��Ʒ����
       subtitle varchar2(500), --��Ʒ�����⣨������
       originprice number, --��Ʒԭ��
       promoteprice number, --��Ʒ������
       cid number, --��Ʒ���id
       sid number, --����id
       constraint pk_prod_id primary key (pdid),
       constraint tmprd_cid_fk foreign key(cid) references tmCategory(cid),--���
       constraint tmpr_spid_fk foreign key(sid) references tmstore(sid)--���
);
drop sequence tm_pdid;
create sequence tm_pdid increment by 1 start with 3016;--��Ʒ�����У�tm_pdid��

INSERT INTO tmproduct VALUES (3001,'Konka/���� LED32S1����32����׿��������WIFI����Һ��ƽ����ӻ�','32�����ӻ� 8������ ���� ȫ������ �ͻ�����',1699,1104.35,1017,5001);
INSERT INTO tmproduct VALUES (3002,'Hisense/���� LED49EC320A 49��ledҺ�����ӻ���������ƽ�����50','��Ʒ�ػ� ʮ������ ����WiFi ��ѯ�о�ϲ',2799,1679.4,1017,5001);
INSERT INTO tmproduct VALUES (3003,'Hisense/���� LED40EC520UA 40Ӣ��4K����ƽ��Һ�����ӻ�WIFI����','��ĩ �ػ� 2189 Ԫ���� ������Ʒ',2399,1439.4,1017,5001);
INSERT INTO tmproduct VALUES (3004,'Changhong/���� 65S1��׿����12��65Ӣ������ƽ��LEDҺ�����ӻ�70','����ӰԺ ����12�� ��׿����',4499.01,3824.16,1017,5001);
INSERT INTO tmproduct VALUES (3005,'������PANDA/��è LE39D71S 39Ӣ������WiFiҺ��ƽ�����40 42 43','',2499,1874.25,1017,5001);
INSERT INTO tmproduct VALUES (3006,'�ֽ�ʿ������Ͱ��Ʒ��ȫ�Զ�ң�ظ�Ӧһ��ʽ����������������','ȫ������ ��ϴ��� ���ݰ�Ħ ��Ȧ���� �ϵ��ˮ',8960,8512,1016,5001);
INSERT INTO tmproduct VALUES (3007,'������Ͱ/ARROW AB1118��ȩ�ǰ������������ʽ��������������Ʒ','��ȯ���Ż� Ʒ����ȩ�� ǧ����װ �Ͱ�װ���',1976,1482,1016,5001);
INSERT INTO tmproduct VALUES (3008,'�ɵ�����1066��ԡ�������ʽ��Ͱ350�Ӿ��������������ܸ�������','�ǰ��ײ� ��ȫ����� 500���� �ͻ��뻧��װ',1670,1503,1016,5001);
INSERT INTO tmproduct VALUES (3009,'�¹�DGPOSY����ʽ��ɫ��Ͱ����������������ˮ��ˮ��Ͱ����������','�����Խ��� �������� ������ˮ ����50kg',2399,1799.25,1016,5001);
INSERT INTO tmproduct VALUES (3010,'�ɵ����� 1082��ԡ��� ��ʯ�б� ������ ����ʽ��ˮ��Ͱ ������','���Լ۱� ������ӱ ��ʯƷ�� ʱ����� �����糱',1900,1710,1016,5001);
INSERT INTO tmproduct VALUES (3011,'�¿��ɳ�� �ɲ�ϴ��С���Ϳ�����Լ�Ҿӹ������L��ת�ǲ�ɳ��','',5198,3638.6,1015,5001);
INSERT INTO tmproduct VALUES (3012,'���׵���ŷʽ��Ƥɳ����Ͽ����ݻ�ת��Ƥ����ɫɳ����ʽʵľ�Ҿ�','���Ķ��� ŷʽ��ʽ��� ͷ����Ƥ ��������',18398,11038.8,1015,5001);
INSERT INTO tmproduct VALUES (3013,'��̨����ɳ����Ͽɲ�ϴ��Լ�ִ�������װ�Ҿ߲���ɳ����ϴ���','16CM���� 16CM���� ��Ҫ�� ���� ˵����',6576,4274.4,1015,5001);
INSERT INTO tmproduct VALUES (3014,'��Ȼ����ŷʽ����ɳ����Ͽɲ�ϴ�¿�ʵľ�񻨴����ݻ������Ҿ�','�ߵ����Ϳ��� ��տ�񻨹��� ʵľ��� �����ʽ',10012,7008.4,1015,5001);
INSERT INTO tmproduct VALUES (3015,'�žӻ�ŷʽɳ�����ʵľ�񻨿����ߵ��ݻ�����סլ�Ҿ߲���ɳ��','�����Ƽ� ��ׯ���� ��ɫ��ѡ �����ʱ� Ʒ�ʷ���',32450,22715,1015,5001);

select * from tmproduct;
--�̵�ֿ��
--drop table tmstorewarehouse;
create table tmstorewarehouse(
       spid number primary key,--�̵�ֿ�id
       sid number not null,--�̵���
       pdid number not null,--��Ʒ���
       count number not null,--��Ʒ���� 
       constraint tmst_sid_fk foreign key(sid) references tmstore(sid),--���
       constraint tmst_pdid_fk foreign key(pdid) references tmProduct(pdid)--���      
);
drop sequence tm_spid;
create sequence tm_spid increment by 1 start with 150016;--�̵�ֿ�����У�tm_spid��
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

--��Ʒ����ֵ��
--drop table tmpropertyvalue;
create table tmpropertyvalue(
       pvid number, --����ֵid
       pid number, --��������id
       pdid number, --������Ʒid
       value varchar2(500), --����ֵ
       constraint pk_propval_id primary key(pvid),
       constraint tmpro_pid_fk foreign key(pid) references tmProperty(pid),--���
       constraint tmpro_pdid_fk foreign key(pdid) references tmProduct(pdid)--���
);
drop sequence tm_pvid;
create sequence tm_pvid increment by 1 start with 40014;--��Ʒ����ֵ�����У�tm_pvid��
select * from tmpropertyvalue;

INSERT INTO tmpropertyvalue VALUES (4001,2013,3001,'VIDAA');
INSERT INTO tmpropertyvalue VALUES (4002,2012,3001,'��');
INSERT INTO tmpropertyvalue VALUES (4003,2011,3001,'һ��');
INSERT INTO tmpropertyvalue VALUES (4004,2010,3001,'Hisense/���� LED60EC660...');
INSERT INTO tmpropertyvalue VALUES (4005,2009,3001,'ȫ��֧��');
INSERT INTO tmpropertyvalue VALUES (4006,2008,3001,'�ൺ���ŵ����ɷ����޹�˾');
INSERT INTO tmpropertyvalue VALUES (4007,2007,3001,'LED60EC660US');
INSERT INTO tmpropertyvalue VALUES (4008,2006,3001,'3840x2160');
INSERT INTO tmpropertyvalue VALUES (4009,2005,3001,'2016010808835313');
INSERT INTO tmpropertyvalue VALUES (40010,2004,3001,'�ൺ���ŵ����ɷ����޹�˾');
INSERT INTO tmpropertyvalue VALUES (40011,2003,3001,'LED60K5500U��LED60EC660US');
INSERT INTO tmpropertyvalue VALUES (40012,2002,3001,'��Ч');
INSERT INTO tmpropertyvalue VALUES (40013,2001,3001,'Hisense/����');


--��ƷͼƬ��
--drop table tmproductimage;
create table tmproductimage(
       piid number,   --��ƷͼƬid
       pdid number,    --��Ʒid
       imageadd varchar2(500),    --ͼƬ·��
       constraint pk_productimg_piid primary key(piid),
       constraint tmpr_pdid_fk foreign key(pdid) references tmProduct(pdid)--��� 
);
drop sequence tm_piid;
create sequence tm_piid increment by 1 start with 6001;--��ƷͼƬ�����У�tm_piid��

--���۱�
--drop table tmreview;
create table tmreview(
       rid number,     --����id
       tmuid number,     --�û�id
       pdid number,      --��Ʒid
       content varchar2(500),        --����
       createdate date,              --����ʱ��
       constraint pk_review_rid primary key(rid),
       constraint tmre_tmuid_fk foreign key(tmuid) references tmUser(tmuid),--��� 
       constraint tmre_pdid_fk foreign key(pdid) references tmProduct(pdid)--���
);
drop sequence tm_rid;
create sequence tm_rid increment by 1 start with 7001;--���۱����У�tm_rid��


--������
--drop table tmorder;
create table tmorder(
       oid number,              --����id  
       ordercode number,        --������
       address varchar2(500),   --��ַ
       post number,             --�ʱ�
       recevier varchar2(500),  --������
       phone varchar2(500),     --�绰
       usermassage varchar2(500),       --��ע��Ϣ
       createdate date,                 --����ʱ��
       paydate date,                    --֧��ʱ��
       deliverydate date,               --����ʱ��
       confirmdate date,                --���ʱ��
       status number,                   --״̬
       tmuid number,                    --�û�id
       constraint pk_order_oid primary key(oid),
       constraint tmor_tmuid_fk foreign key(tmuid) references tmUser(tmuid)--���
);
drop sequence tm_oid;
create sequence tm_oid increment by 1 start with 9001;--���������У�tm_oid��
insert into tmorder values(9001,20180812,'���Ϲ�ҵ��ѧ',15155,'С������',484848484,'��һ������',to_date('2018-08-12 10:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-08-13 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-08-13 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-08-13 04:47:16','YYYY-MM-DD HH24:MI:SS'),4,8001);
insert into tmorder values(9002,20180921,'���Ϲ�ҵ��ѧ',15155,'С������',484848484,'�ڶ�������',to_date('2018-09-21 10:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-09-21 06:12:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-09-22 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-09-22 18:47:16','YYYY-MM-DD HH24:MI:SS'),4,8001);
insert into tmorder values(9003,20180613,'���Ϲ�ҵ��ѧ',15155,'С������',484848484,'����������',to_date('2018-06-13 10:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-06-14 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-06-15 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-06-16 04:47:16','YYYY-MM-DD HH24:MI:SS'),4,8001);
insert into tmorder values(9004,20180921,'���Ϲ�ҵ��ѧ',15155,'С������',484848484,'��һ������',to_date('2018-08-12 10:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-08-13 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-08-13 04:47:16','YYYY-MM-DD HH24:MI:SS'),null,3,8001);
insert into tmorder values(9005,20180521,'���Ϲ�ҵ��ѧ',15155,'С������',484848484,'��һ������',to_date('2018-05-12 10:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-05-13 04:47:16','YYYY-MM-DD HH24:MI:SS'),null,null,2,8001);
insert into tmorder values(9006,20180321,'���Ϲ�ҵ��ѧ',15155,'С������',484848484,'��һ������',to_date('2018-03-12 10:47:16','YYYY-MM-DD HH24:MI:SS'),null,null,null,1,8001);
insert into tmorder values(9007,20180721,'���Ϲ�ҵ��ѧ',15155,'С������',484848484,'��һ������',to_date('2018-07-12 10:47:16','YYYY-MM-DD HH24:MI:SS'),null,null,null,5,8001);
insert into tmorder values(9008,20181021,'���Ϲ�ҵ��ѧ',15155,'С������',484848484,'��һ������',to_date('2018-10-12 10:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-10-13 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-10-14 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-10-15 04:47:16','YYYY-MM-DD HH24:MI:SS'),4,8001);
insert into tmorder values(9009,20181023,'���Ϲ�ҵ��ѧ',15155,'С������',484848484,'��һ������',to_date('2018-10-23 10:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-10-24 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-10-25 04:47:16','YYYY-MM-DD HH24:MI:SS'),to_date('2018-10-26 04:47:16','YYYY-MM-DD HH24:MI:SS'),4,8001);
update tmorder set address = '����ʡ' where oid = 9001;
update tmorder set address = '������' where oid = 9002;
update tmorder set address = '����ʡ' where oid = 9003;
update tmorder set address = '����ʡ' where oid = 9004;
update tmorder set address = '����ʡ' where oid = 9005;
update tmorder set address = '����ʡ' where oid = 9006;
update tmorder set address = '����ʡ' where oid = 9007;
update tmorder set address = '����ʡ' where oid = 9008;
update tmorder set address = '����ʡ' where oid = 9009;
select * from tmorder;
select count(*) from tmorder where address like '%����ʡ%';


select sum(onemoney) from (select tmproduct.pdid,promoteprice*summoney as onemoney from (select pdid,sum(count) as summoney from (select * from tmorderitem where oid in (select oid from tmorder where status != 5)) a group by pdid order by pdid) b,tmproduct where b.pdid = tmproduct.pdid);
select count(*) from tmorder where status = 4;
select sum(onemoney) from (select tmproduct.pdid,promoteprice*summoney as onemoney from (select pdid,sum(count) as summoney from (select * from tmorderitem where oid in (select oid from tmorder where status = 5)) a group by pdid order by pdid) b,tmproduct where b.pdid = tmproduct.pdid);
select count(*) from tmorder where to_char(createdate,'mm') = 10 and to_char(createdate,'yyyy') = to_char(sysdate,'yyyy')-1;

select sum(onemoney) from (select tmproduct.pdid,promoteprice*summoney as onemoney from (select pdid,sum(count) as summoney from (select * from tmorderitem where oid in (select oid from tmorder where status != 5)) a group by pdid order by pdid) b,tmproduct where b.pdid = tmproduct.pdid);
select count(*) from tmorder where status = 4;
select sum(onemoney) from (select tmproduct.pdid,promoteprice*summoney as onemoney from (select pdid,sum(count) as summoney from (select * from tmorderitem where oid in (select oid from tmorder where status = 5)) a group by pdid order by pdid) b,tmproduct where b.pdid = tmproduct.pdid);
select count(*) from tmorder where to_char(createdate,'mm') = 10 and to_char(createdate,'yyyy') = to_char(sysdate,'yyyy')-1;



--�������
--drop table tmorderitem;
create table tmorderitem(
       oiid number,            --������id
       pdid number,            --��Ʒid
       tmuid number,           --�û�id
       oid number,             --����id
       count number,           --����
       constraint pk_orderitem_oiid primary key(oiid),
       constraint tmorder_pdid_fk foreign key(pdid) references tmProduct(pdid),--���
       constraint tmorder_tmuid_fk foreign key(tmuid) references tmUser(tmuid),--���
       constraint tmor_oid_fk foreign key(oid) references tmOrder(oid)--���
);
drop sequence tm_oiid;
create sequence tm_oiid increment by 1 start with 10001;--����������У�tm_oiid��
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
select allnumber from (select name,sum(allcount) as allnumber from (select tmproduct.pdid,cid,allcount from tmproduct,(select pdid,sum(count) as allcount from tmorderitem group by pdid) a where tmproduct.pdid =a.pdid) b,tmCategory where b.cid = tmCategory.cid group by name) where name = 'ƽ�����';


--�ջ���ַ��
--drop table tmshoppingAddress;
create table tmshoppingAddress(
       addid number primary key,--�ջ���ַ���
       tmuid number not null,--�û����
       address varchar2(400) not null,--�ջ���ַ
       post varchar2(400) not null,--�ʱ�
       recevier varchar2(400),--�ջ���
       phone varchar2(400) not null,--��ϵ�绰
       constraint tmsh_addid_fk foreign key(tmuid) references tmUser(tmuid)--���
);
drop sequence tm_addid;
create sequence tm_addid increment by 1 start with 13002;--�ջ���ַ�����У�tm_addid��

insert into tmshoppingAddress values (13001,8001,'���Ե�ַ','123456','�����ջ���','123456789');
--������Ϣ��
--drop table tmpersonalInformation;
create table tmpersonalInformation(
       perid number primary key,--������ϸ��Ϣ���
       tmuid number not null,--�û����
       name varchar2(400) not null,--�û��ǳ�
       headimg varchar2(400) not null,--�û�ͷ��
       sex varchar2(400) not null,--�û��Ա�
       signature varchar2(400) not null,--����ǩ��
       constraint tmpe_perid_fk foreign key(tmuid) references tmUser(tmuid)--���
);
drop sequence tm_perid;
create sequence tm_perid increment by 1 start with 14001;--������Ϣ�����У�tm_perid��
insert into tmpersonalInformation values (14002,8001,'testuser','heading','��','���Ի�');
