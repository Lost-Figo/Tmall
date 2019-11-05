package frontEnd.dao.imp;

import entity.TmPropertyValue;
import frontEnd.dao.TmPropertyValueDao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.C3p0Utils;

import java.sql.SQLException;
import java.util.List;

public class TmpropertyValueDaoImp implements TmPropertyValueDao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    @Override
    public TmPropertyValue findPropValueBy(int pdid,int pid) throws SQLException {
        String sql = "select * from TmpropertyValue where pdid = ? and pid = ?";
        return queryRunner.query(sql,new BeanHandler<>(TmPropertyValue.class),pdid,pid);
    }
}

class testPropertyvalues{
    public static void main(String[] args) throws SQLException {
        TmPropertyValueDao tmPropertyValueDao = new TmpropertyValueDaoImp();
        System.out.println(tmPropertyValueDao.findPropValueBy(3001,2001));
    }
}