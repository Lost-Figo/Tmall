package frontEnd.service;

import entity.TmProductImage;
import frontEnd.dao.ProductImageDao;
import frontEnd.dao.imp.ProductImageDaoImp;

import java.sql.SQLException;
import java.util.List;

public class FindProductAttiImg {
    public static List<TmProductImage> findProductAtti(int pdid){
        ProductImageDao productImageDao = new ProductImageDaoImp();
        try {
            return productImageDao.findProductAttrImgByPdid(pdid);
        } catch (SQLException e) {
            System.out.println("获取图片详情失败！");
            e.printStackTrace();
            return null;
        }
    }
}
