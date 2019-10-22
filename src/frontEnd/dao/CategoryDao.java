package frontEnd.dao;

import entity.TmCategory;

import java.sql.SQLException;
import java.util.List;

public interface CategoryDao {
    List<TmCategory>  findAll() throws SQLException;
}
