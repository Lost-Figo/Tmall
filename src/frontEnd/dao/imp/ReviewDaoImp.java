package frontEnd.dao.imp;

import entity.TmProperty;
import entity.TmReview;
import frontEnd.dao.ReviewDao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.C3p0Utils;

import java.sql.SQLException;
import java.util.List;

public class ReviewDaoImp implements ReviewDao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    @Override
    public List<TmReview> findReviewByPdid(int pdid) throws SQLException {
        String sql = "select * from TmReview where pdid =?";
        return queryRunner.query(sql,new BeanListHandler<>(TmReview.class),pdid);
    }
}
class testreview{
    public static void main(String[] args) {
        ReviewDao reviewDao = new ReviewDaoImp();
        try {
            System.out.println(reviewDao.findReviewByPdid(3001));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}