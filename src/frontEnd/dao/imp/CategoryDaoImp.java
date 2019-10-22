package frontEnd.dao.imp;

import entity.TmCategory;
import frontEnd.dao.CategoryDao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.C3p0Utils;

import java.sql.SQLException;
import java.util.List;

public class CategoryDaoImp implements CategoryDao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    @Override
    public List<TmCategory> findAll() throws SQLException {
        String sql = "select * from tmCategory order by cid";
        return queryRunner.query(sql,new BeanListHandler<>(TmCategory.class));
    }
}
class test{
    public static void main(String[] args) {
        CategoryDao categoryDao = new CategoryDaoImp();
        List<TmCategory> list = null;
        try {
            list = categoryDao.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(list);
    }

}
