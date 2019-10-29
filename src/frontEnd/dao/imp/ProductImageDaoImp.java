package frontEnd.dao.imp;

import entity.TmProductImage;
import frontEnd.dao.ProductImageDao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.C3p0Utils;

import java.sql.SQLException;
import java.util.List;

public class ProductImageDaoImp implements ProductImageDao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    @Override
    public List<TmProductImage> findAllProductImage() throws SQLException {
        String sql = "select * from TmproductImage";
        return queryRunner.query(sql,new BeanListHandler<>(TmProductImage.class));
    }

    @Override
    public List<TmProductImage> findProductImgBypdid(int pdid) throws SQLException {
        String sql = "select * from Tmproductimage where pdid = ? and imageadd = 'type_single'";
        return queryRunner.query(sql,new BeanListHandler<>(TmProductImage.class),pdid);
    }

    @Override
    public List<TmProductImage> findProductAttrImgByPdid(int pdid) throws SQLException {
        String sql = "select * from Tmproductimage where pdid = ? and imageadd = 'type_detail'";
        return queryRunner.query(sql,new BeanListHandler<>(TmProductImage.class),pdid);
    }
}
class testProdimage{
    public static void main(String[] args) throws SQLException {
        ProductImageDao productImageDao = new ProductImageDaoImp();
        System.out.println(productImageDao.findProductAttrImgByPdid(3001));
    }
}