package brackground.dao.Imp;

import brackground.dao.CategoryDao;
import entity.TmCategory;
import frontEnd.dao.imp.CategoryDaoImp;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.C3p0Utils;

import java.sql.SQLException;
import java.util.List;

public class CategoryImp implements CategoryDao {
    private QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());

    @Override
    public List<TmCategory> getCategory() throws SQLException {
        String sql = "select name from tmcategory";
        return queryRunner.query(sql,new BeanListHandler<TmCategory>(TmCategory.class));
    }
}
class test{
    public static void main(String[] args) {
        frontEnd.dao.CategoryDao categoryDao = new CategoryDaoImp();
        List<TmCategory> list = null;
        try {
            list = categoryDao.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(list);
    }

}
