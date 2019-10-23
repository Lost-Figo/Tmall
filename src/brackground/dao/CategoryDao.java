package brackground.dao;

import entity.TmCategory;

import java.sql.SQLException;
import java.util.List;

/**
 * 产品分类获取
 */
public interface CategoryDao {
    public List<TmCategory> getCategory() throws SQLException;
}
