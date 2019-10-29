package frontEnd.dao;

import java.sql.SQLException;

public interface TmReviewDao {
    int findReviewCountByPdid(int pdid) throws SQLException;
}
