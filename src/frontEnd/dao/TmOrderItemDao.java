package frontEnd.dao;

import entity.TmOrderItem;

import java.sql.SQLException;
import java.util.List;

public interface TmOrderItemDao {
    int findProductCountByPdid(int pdid) throws SQLException;

    void addCart(int pdid, int tmuid, int num) throws SQLException;
    List<TmOrderItem> findcart(int tmuid) throws SQLException;
    void deleteCartLine(int oiid) throws SQLException;

    void changeCartLine(int oiid , int num) throws SQLException;
}
