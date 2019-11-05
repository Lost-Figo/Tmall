package frontEnd.service;

import entity.TmReview;
import frontEnd.dao.ReviewDao;
import frontEnd.dao.imp.ReviewDaoImp;

import java.sql.SQLException;
import java.util.List;

public class FindReviewByPdid {
    public static List<TmReview> findReviewByPdid(int pdid){
        ReviewDao reviewDao = new ReviewDaoImp();
        try {
            return reviewDao.findReviewByPdid(pdid);
        } catch (SQLException e) {
            System.out.println("获取评论失败");
            e.printStackTrace();
            return null;
        }
    }
}
