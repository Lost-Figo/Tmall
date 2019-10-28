package brackground.dao.Imp;

import brackground.dao.PropertyValueDao;
import org.apache.commons.dbutils.QueryRunner;
import utils.C3p0Utils;

import java.sql.SQLException;

public class PropertyValueImp implements PropertyValueDao {
    private QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    @Override
    public boolean chazhao(int pid) throws SQLException {
        String sql = "select * from tmpropertyvalue where pid=?";
        return queryRunner.update(sql,pid)>0;
    }
}
