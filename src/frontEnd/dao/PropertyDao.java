package frontEnd.dao;

import entity.TmProperty;

import java.sql.SQLException;
import java.util.List;

public interface PropertyDao {
    List<TmProperty> findPropertyByCid(int cid) throws SQLException;

    ;
}
