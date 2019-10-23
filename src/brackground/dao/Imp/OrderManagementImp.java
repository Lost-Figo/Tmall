package brackground.dao.Imp;

import brackground.dao.OrderManagementDao;
import entity.TmOrder;
import entity.TmOrderItem;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.C3p0Utils;

import java.sql.SQLException;
import java.util.List;

public class OrderManagementImp implements OrderManagementDao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    //���������
    @Override
    public List<TmOrder> listalltmorder() {
        return null;
    }
    //����������
    @Override
    public List<TmOrderItem> listalltmorderitem() {
        return null;
    }
    //���붩����
    @Override
    public void addorder(TmOrder tmOrder) {

    }
    //���붩�����
    @Override
    public void addorderitem(TmOrderItem tmOrderItem) {

    }
    //��ѯĳ��״̬�Ķ�����Ŀ
    @Override
    public int findnumbystatus(int number) {
        return 0;
    }
    //��������Ŀ��ѯ
    @Override
    public int ordernum() throws SQLException {
        String sql = "select count(*) from tmorder";
        return Integer.parseInt(queryRunner.query(sql,new ScalarHandler()).toString());
    }
    //���׽���ѯ
    @Override
    public double findamount() throws SQLException {
        String sql = "select sum(onemoney) from (select tmproduct.pdid,promoteprice*summoney as onemoney from (select pdid,sum(count) as summoney from (select * from tmorderitem where oid in (select oid from tmorder where status != 5)) a group by pdid order by pdid) b,tmproduct where b.pdid = tmproduct.pdid)";
        return Double.parseDouble(queryRunner.query(sql, new ScalarHandler()).toString());//ע�⣬�ص�
    }
    //�����ɹ�������
    @Override
    public int successorder() throws SQLException {
        String sql = "select count(*) from tmorder where status = 4";
        return Integer.parseInt(queryRunner.query(sql,new ScalarHandler()).toString());
    }
    //����ʧ����Ŀ
    @Override
    public int failorder() throws SQLException {
        String sql = "select count(*) from tmorder where status = 5";
        return Integer.parseInt(queryRunner.query(sql,new ScalarHandler()).toString());
    }
    //�˿��ܽ��
    @Override
    public double tobackmoney() throws SQLException {
        String sql = "select sum(onemoney) from (select tmproduct.pdid,promoteprice*summoney as onemoney from (select pdid,sum(count) as summoney from (select * from tmorderitem where oid in (select oid from tmorder where status = 5)) a group by pdid order by pdid) b,tmproduct where b.pdid = tmproduct.pdid)";
        return Double.parseDouble(queryRunner.query(sql,new ScalarHandler()).toString());
    }
    //ĳ���·ݵ����ж���
    @Override
    public int ordernumbymonth(int month) throws SQLException {
        String sql = "select count(*) from tmorder where to_char(createdate,'mm') = ? and to_char(createdate,'yyyy') = to_char(sysdate,'yyyy')-1";
        return Integer.parseInt(queryRunner.query(sql,new ScalarHandler(),month).toString());
    }
    //ĳ���·ݴ���������ж���
    @Override
    public int ordernopaybymonth(int month) throws SQLException {
        String sql = "select count(*) from tmorder where (to_char(createdate,'mm') = ?) and (to_char(createdate,'yyyy') = to_char(sysdate,'yyyy')-1) and (status = 1)";
        return Integer.parseInt(queryRunner.query(sql,new ScalarHandler(),month).toString());
    }
    //ĳ�����Ѹ�������ж���
    @Override
    public int orderpaidbymonth(int month) throws SQLException {
        String sql = "select count(*) from tmorder where (to_char(createdate,'mm') = ?) and (to_char(createdate,'yyyy') = to_char(sysdate,'yyyy')-1) and (status = 2)";
        return Integer.parseInt(queryRunner.query(sql,new ScalarHandler(),month).toString());
    }
    //ĳ�����ѷ��������ж���
    @Override
    public int ordersendedbymonth(int month) throws SQLException {
        String sql = "select count(*) from tmorder where (to_char(createdate,'mm') = ?) and (to_char(createdate,'yyyy') = to_char(sysdate,'yyyy')-1) and (status = 3)";
        return Integer.parseInt(queryRunner.query(sql,new ScalarHandler(),month).toString());
    }
    //���Ҹ���ʡ�ݵĶ�����
    @Override
    public int ordernumbyprovince(String province) throws SQLException {
        String sql = "select count(*) from tmorder where address like ?";
        return Integer.parseInt(queryRunner.query(sql,new ScalarHandler(),province).toString());
    }
    //���Ҷ����е�������Ʒ
    @Override
    public int ordernumall() throws SQLException {
        String sql = "select sum(allnumber) from (select name,sum(allcount) as allnumber from (select tmproduct.pdid,cid,allcount from tmproduct,(select pdid,sum(count) as allcount from tmorderitem group by pdid) a where tmproduct.pdid =a.pdid) b,tmCategory where b.cid = tmCategory.cid group by name)";
        return Integer.parseInt(queryRunner.query(sql,new ScalarHandler()).toString());
    }
    //����ĳһ������Ʒ����Ŀ
    @Override
    public double ordernumbytype(String type) throws SQLException {
        String sql = "select allnumber from (select name,sum(allcount) as allnumber from (select tmproduct.pdid,cid,allcount from tmproduct,(select pdid,sum(count) as allcount from tmorderitem group by pdid) a where tmproduct.pdid =a.pdid) b,tmCategory where b.cid = tmCategory.cid group by name) where name = ?";
        return Double.parseDouble(String.format("%.2f",Double.parseDouble(queryRunner.query(sql,new ScalarHandler(),type).toString())*100/ordernumall()));
    }
}
class test1{
    public static void main(String[] args) throws SQLException {
        OrderManagementDao orderManagementDao = new OrderManagementImp();
        double o = orderManagementDao.findamount();
        System.out.println(orderManagementDao.ordernumbytype("��Ͱ"));
    }
}