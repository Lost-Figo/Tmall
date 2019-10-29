package frontEnd.dao.imp;

import entity.TmOrderItem;
import frontEnd.dao.TmOrderItemDao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.C3p0Utils;

import java.sql.SQLException;
import java.util.List;

public class TmOrderItemDaoImp implements TmOrderItemDao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());

    //查询产品销量
    @Override
    public int findProductCountByPdid(int pdid) throws SQLException {
        String sql = "select count(count) from tmorderitem where pdid = ? and oid <> 0";
        return Integer.parseInt(queryRunner.query(sql,new ScalarHandler(),pdid).toString());
    }
    //加入购物车
    @Override
    public void addCart(int pdid, int tmuid, int num) throws SQLException {
        String sql = "insert into tmorderitem values (tm_oiid.nextval,?,?,0,?)";
        queryRunner.update(sql,pdid,tmuid,num);
    }


    //查找用户的购物车
    @Override
    public List<TmOrderItem> findcart(int tmuid) throws SQLException {
        String sql = "select * from tmorderitem where tmuid = ? and oid = 0";
        return queryRunner.query(sql,new BeanListHandler<>(TmOrderItem.class),tmuid);
    }
    //删除购物车的选项
    @Override
    public void deleteCartLine(int oiid) throws SQLException {
        String sql = "delete tmorderitem where oiid = ?";
        queryRunner.update(sql,oiid);
    }
    //改变购物车中的数目
    @Override
    public void changeCartLine(int oiid, int num) throws SQLException {
        String sql = "update tmorderitem set count = ? where oiid = ?";
        queryRunner.update(sql,num,oiid);
    }
}
class testOrderitem{
    public static void main(String[] args) {
        TmOrderItemDao orderItemDao = new TmOrderItemDaoImp();
        try {
            orderItemDao.addCart(3001,8001,20);
            System.out.println(orderItemDao.findcart(8001));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}