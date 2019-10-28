package brackground.dao.Imp;

import brackground.dao.PropertyDao;
import entity.TmProperty;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.C3p0Utils;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PropertyImp implements PropertyDao {
    private QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    @Override
    public void createpro(int cid, String name) throws SQLException {
        String sql = "insert into tmproperty(pid,cid,name) values(tm_pid.nextval,?,?)";
        queryRunner.update(sql,cid,name);
    }

    @Override
    public List<TmProperty> cidfindname(int cid) throws SQLException {
        String sql = "select * from tmproperty where cid=?";
        return queryRunner.query(sql,new BeanListHandler<>(TmProperty.class),cid);
    }

    @Override
    public boolean chachong(String name) throws SQLException {
        String sql = "select cid from tmproperty where name=?";
        return queryRunner.update(sql,name)>0;
    }

    @Override
    public BigDecimal namefindcid(String name) throws SQLException {
        String sql = "select pid from tmproperty where name=?";
        return (BigDecimal) queryRunner.query(sql,new ScalarHandler(),name);
    }

    @Override
    public void update(String old, String name) throws SQLException {
        String sql = "update tmproperty set name=? where name=?";
        queryRunner.update(sql,name,old);
    }

    @Override
    public TmProperty pidfindname(int pid) throws SQLException {
        String sql = "select name from tmproperty where pid=?";
        return queryRunner.query(sql,new BeanHandler<>(TmProperty.class),pid);
    }
}
class test3{
    public static void main(String[] args) throws SQLException {
        PropertyDao dao = new PropertyImp();
        System.out.println(dao.cidfindname(1006).get(0).getName());
    }
}