package frontEnd.dao;

import entity.TmProductImage;

import java.sql.SQLException;
import java.util.List;

public interface ProductImageDao {
    //查找图片
    List<TmProductImage> findAllProductImage() throws SQLException;
    List<TmProductImage> findProductImgBypdid(int pdid) throws SQLException;
    List<TmProductImage> findProductAttrImgByPdid(int pdid) throws SQLException;

}
