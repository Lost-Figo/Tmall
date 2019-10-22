package brackground.dao.Imp;

import entity.TmStoreAdmin;
import org.apache.commons.dbutils.QueryRunner;
import brackground.dao.StorAdminDao;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.C3p0Utils;

import java.sql.SQLException;

public class StoreAdminImp implements StorAdminDao {
    private QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    @Override
    public boolean login(TmStoreAdmin tmStoreAdmin) throws SQLException {
        String sql = "select sdid from tmstoreadmin where name=? and password=?";
        int id = queryRunner.update(sql,tmStoreAdmin.getName(),tmStoreAdmin.getPassword());
        return id>0;
    }

    @Override
    public void reg(TmStoreAdmin tmStoreAdmin) throws SQLException {
        String sql = "insert into tmstoreadmin(sdid,name,password) values(tm_sdid,?,?)";
        queryRunner.update(sql,tmStoreAdmin.getName(),tmStoreAdmin.getPassword());
    }

    @Override
    public boolean checkStoreAdminName(String adminname) {
        return false;
    }
}

class test{
    public static void main(String[] args) throws SQLException {
        StorAdminDao dao = new StoreAdminImp();
        TmStoreAdmin tm = new TmStoreAdmin();
        tm.setName("admin");
        tm.setPassword("123456");
        if(dao.login(tm)){
            System.out.println(1);
        }else{
            System.out.println(2);
        }
    }
}