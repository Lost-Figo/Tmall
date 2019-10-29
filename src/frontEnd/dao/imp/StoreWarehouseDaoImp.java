package frontEnd.dao.imp;

import frontEnd.dao.StoreWarehouseDao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.C3p0Utils;

import java.sql.SQLException;

public class StoreWarehouseDaoImp implements StoreWarehouseDao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    @Override
    public int findStockBypdid(int pdid) throws SQLException {
        String sql = "select count from tmstorewarehouse where pdid = ?";

        return Integer.parseInt(queryRunner.query(sql,new ScalarHandler(),pdid).toString());
    }
}
class teststock{
    public static void main(String[] args) {
        StoreWarehouseDao storeWarehouseDao = new StoreWarehouseDaoImp();
        try {
            System.out.println(storeWarehouseDao.findStockBypdid(3001));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}