package brackground.dao;

import entity.TmProduct;

import java.sql.SQLException;
import java.util.List;

public interface ProductDao {
    List<TmProduct> findAll() throws SQLException;
    List<TmProduct> findByCid(int cid) throws SQLException;
    List<TmProduct> findByName(String name) throws SQLException;
}
