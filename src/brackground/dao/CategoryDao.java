package brackground.dao;

import entity.TmCategory;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

/**
 * 产品分类获取
 */
public interface CategoryDao {
    public List<TmCategory> getCategory() throws SQLException;
    public boolean findname(String name) throws SQLException;
    public BigDecimal findidbyname(String name) throws SQLException;
    public void createcate(String name) throws SQLException;
}
