package frontEnd.dao.imp;

import entity.TmCategory;
import entity.TmProduct;
import frontEnd.dao.CategoryDao;
import frontEnd.dao.ProductDao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.C3p0Utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ProductDaoImp implements ProductDao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    @Override
    public List<TmProduct> findAll() throws SQLException {
        String sql = "select * from tmproduct";
        return queryRunner.query(sql,new BeanListHandler<>(TmProduct.class));
    }

    @Override
    public List<TmProduct> findByCid(int cid) throws SQLException {
        String sql = "select * from tmproduct where cid = ?";
        return queryRunner.query(sql,new BeanListHandler<>(TmProduct.class),cid);
    }

    @Override
    public TmProduct findByPdid(int pdid) throws SQLException {
        String sql = "select * from tmproduct where pdid = ?";
        return queryRunner.query(sql,new BeanHandler<>(TmProduct.class),pdid);
    }
}
class test2{
    public static void main(String[] args) {
        ProductDao productDao = new ProductDaoImp();
//        List<TmProduct> list = null;
//        try {
//            list = productDao.findAll();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        System.out.println(list);

        try {
            TmProduct product = productDao.findByPdid(3001);
            System.out.println(product);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}