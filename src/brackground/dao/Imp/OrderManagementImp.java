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
    //浏览订单表
    @Override
    public List<TmOrder> listalltmorder() {
        return null;
    }
    //浏览订单项表
    @Override
    public List<TmOrderItem> listalltmorderitem() {
        return null;
    }
    //插入订单表
    @Override
    public void addorder(TmOrder tmOrder) {

    }
    //插入订单项表
    @Override
    public void addorderitem(TmOrderItem tmOrderItem) {

    }
    //查询某种状态的订单数目
    @Override
    public int findnumbystatus(int number) {
        return 0;
    }
    //订单总数目查询
    @Override
    public int ordernum() throws SQLException {
        String sql = "select count(*) from tmorder";
        return Integer.parseInt(queryRunner.query(sql,new ScalarHandler()).toString());
    }
    //交易金额查询
    @Override
    public double findamount() throws SQLException {
        String sql = "select sum(onemoney) from (select tmproduct.pdid,promoteprice*summoney as onemoney from (select pdid,sum(count) as summoney from (select * from tmorderitem where oid in (select oid from tmorder where status != 5)) a group by pdid order by pdid) b,tmproduct where b.pdid = tmproduct.pdid)";
        return Double.parseDouble(queryRunner.query(sql, new ScalarHandler()).toString());//注意，重点
    }
    //订单成功的数量
    @Override
    public int successorder() throws SQLException {
        String sql = "select count(*) from tmorder where status = 4";
        return Integer.parseInt(queryRunner.query(sql,new ScalarHandler()).toString());
    }
    //订单失败数目
    @Override
    public int failorder() throws SQLException {
        String sql = "select count(*) from tmorder where status = 5";
        return Integer.parseInt(queryRunner.query(sql,new ScalarHandler()).toString());
    }
    //退款总金额
    @Override
    public double tobackmoney() throws SQLException {
        String sql = "select sum(onemoney) from (select tmproduct.pdid,promoteprice*summoney as onemoney from (select pdid,sum(count) as summoney from (select * from tmorderitem where oid in (select oid from tmorder where status = 5)) a group by pdid order by pdid) b,tmproduct where b.pdid = tmproduct.pdid)";
        return Double.parseDouble(queryRunner.query(sql,new ScalarHandler()).toString());
    }
    //某个月份的所有订单
    @Override
    public int ordernumbymonth(int month) throws SQLException {
        String sql = "select count(*) from tmorder where to_char(createdate,'mm') = ? and to_char(createdate,'yyyy') = to_char(sysdate,'yyyy')-1";
        return Integer.parseInt(queryRunner.query(sql,new ScalarHandler(),month).toString());
    }
    //某个月份待付款的所有订单
    @Override
    public int ordernopaybymonth(int month) throws SQLException {
        String sql = "select count(*) from tmorder where (to_char(createdate,'mm') = ?) and (to_char(createdate,'yyyy') = to_char(sysdate,'yyyy')-1) and (status = 1)";
        return Integer.parseInt(queryRunner.query(sql,new ScalarHandler(),month).toString());
    }
    //某个月已付款的所有订单
    @Override
    public int orderpaidbymonth(int month) throws SQLException {
        String sql = "select count(*) from tmorder where (to_char(createdate,'mm') = ?) and (to_char(createdate,'yyyy') = to_char(sysdate,'yyyy')-1) and (status = 2)";
        return Integer.parseInt(queryRunner.query(sql,new ScalarHandler(),month).toString());
    }
    //某个月已发货的所有订单
    @Override
    public int ordersendedbymonth(int month) throws SQLException {
        String sql = "select count(*) from tmorder where (to_char(createdate,'mm') = ?) and (to_char(createdate,'yyyy') = to_char(sysdate,'yyyy')-1) and (status = 3)";
        return Integer.parseInt(queryRunner.query(sql,new ScalarHandler(),month).toString());
    }

    @Override
    public int ordernumbyprovince(String province) throws SQLException {
        return 0;
    }

    @Override
    public double ordernumbytype(String type) throws SQLException {
        return 0;
    }

    @Override
    public int ordernumall() throws SQLException {
        return 0;
    }
}
class test1{
    public static void main(String[] args) throws SQLException {
        OrderManagementDao orderManagementDao = new OrderManagementImp();
        double o = orderManagementDao.findamount();
        System.out.println(orderManagementDao.ordernumbytype("马桶"));
    }
}