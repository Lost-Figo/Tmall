package frontEnd.dao;

import entity.TmReview;

import java.sql.SQLException;
import java.util.List;

public interface ReviewDao {
    List<TmReview> findReviewByPdid(int pdid) throws SQLException;
}
