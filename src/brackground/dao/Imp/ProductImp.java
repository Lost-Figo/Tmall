package brackground.dao.Imp;

import entity.TmProduct;
import brackground.dao.ProductDao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.C3p0Utils;

import java.sql.SQLException;
import java.util.List;

public class ProductImp implements ProductDao {
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
    public List<TmProduct> findByName(String name) throws SQLException {
        String sql = "select p.* from tmproduct p,tmcategory c where c.name = ? and p.cid=c.cid";
        return queryRunner.query(sql,new BeanListHandler<>(TmProduct.class),name);
    }

    @Override
    public void createproduct(String zname, String fname, int op, int pp, int cid, int sid) throws SQLException {
        String sql = "insert into tmproduct(pdid,name,subtitle,originprice,promoteprice,cid,sid) values(tm_pdid.nextval,?,?,?,?,?,?)";
        queryRunner.update(sql,zname,fname,op,pp,cid,sid);
    }

    @Override
    public TmProduct findbypid(int pid) {
        String sql = "select * from ";
        return null;
    }
}
