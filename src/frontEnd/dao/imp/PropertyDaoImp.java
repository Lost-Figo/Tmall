package frontEnd.dao.imp;

import entity.TmProperty;
import frontEnd.dao.PropertyDao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.C3p0Utils;

import java.sql.SQLException;
import java.util.List;

public class PropertyDaoImp implements PropertyDao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    @Override
    public List<TmProperty> findPropertyByCid(int cid) throws SQLException {
        String sql = "select * from tmproperty where cid = ?";
        return  queryRunner.query(sql,new BeanListHandler<>(TmProperty.class),cid);
    }
}
class testproperty{
    public static void main(String[] args) {
        PropertyDao propertyDao = new PropertyDaoImp();
        try {
            System.out.println(propertyDao.findPropertyByCid(1017));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}