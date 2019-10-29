package frontEnd.dao;

import java.sql.SQLException;

public interface StoreWarehouseDao {
    int findStockBypdid(int pdid) throws SQLException;
}
