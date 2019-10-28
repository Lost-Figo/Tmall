package brackground.dao.Imp;

import brackground.dao.CategoryDao;
import entity.TmCategory;
import frontEnd.dao.imp.CategoryDaoImp;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.C3p0Utils;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

public class CategoryImp implements CategoryDao {
    private QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());

    @Override
    public List<TmCategory> getCategory() throws SQLException {
        String sql = "select name from tmcategory";
        return queryRunner.query(sql,new BeanListHandler<TmCategory>(TmCategory.class));
    }

    @Override
    public boolean findname(String name) throws SQLException {
        String sql = "select cid from tmcategory where name=?";
        return queryRunner.update(sql,name)>0;
    }

    @Override
    public BigDecimal findidbyname(String name) throws SQLException {
        String sql = "select cid from tmcategory where name=?";
        return (BigDecimal) queryRunner.query(sql,new ScalarHandler(),name);
    }

    @Override
    public void createcate(String name) throws SQLException {
        String sql = "insert into tmcategory(cid,name) values(tm_cid.nextval,?)";
        queryRunner.update(sql,name);
    }
}

