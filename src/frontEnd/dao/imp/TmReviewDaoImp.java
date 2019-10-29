package frontEnd.dao.imp;

import frontEnd.dao.TmReviewDao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.C3p0Utils;

import java.sql.SQLException;

public class TmReviewDaoImp implements TmReviewDao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    @Override
    public int findReviewCountByPdid(int pdid) throws SQLException {
        String sql = "select count(*) from TmReview where pdid = ?";
        return Integer.parseInt(queryRunner.query(sql,new ScalarHandler(),pdid).toString());
    }
}

class ReviewTest{
    public static void main(String[] args) {
        TmReviewDao tmReviewDao = new TmReviewDaoImp();
        try {
            System.out.println(tmReviewDao.findReviewCountByPdid(3001));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
