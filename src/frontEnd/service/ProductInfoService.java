package frontEnd.service;

import frontEnd.dao.*;
import frontEnd.dao.imp.*;
import frontEnd.entity.ProductInfo;

import java.sql.SQLException;

public class ProductInfoService {
    //详细标题及价格 需要主标题 副标题 价格) 销量 累计评价 图片列表
    public static ProductInfo findInfoByPdid(int pdid){

        ProductInfo productInfo = new ProductInfo();

        ProductDao productDao = new ProductDaoImp();
        TmOrderItemDao tmOrderItemDao = new TmOrderItemDaoImp();
        TmReviewDao tmReviewDao = new TmReviewDaoImp();
        StoreWarehouseDao storeWarehouseDao = new StoreWarehouseDaoImp();
        ProductImageDao productImageDao = new ProductImageDaoImp();
        try {
            productInfo.setProduct(productDao.findByPdid(pdid));
            productInfo.setSales(tmOrderItemDao.findProductCountByPdid(pdid));
            productInfo.setStock(storeWarehouseDao.findStockBypdid(pdid));
            productInfo.setEvaluate(tmReviewDao.findReviewCountByPdid(pdid));
            productInfo.setProductImageList(productImageDao.findProductImgBypdid(pdid));
            return productInfo;
        } catch (SQLException e) {
            System.out.println("产品未找到！");
            e.printStackTrace();
            return null;
        }

    };
}

class ProductInfoTest{
    public static void main(String[] args) {
        System.out.println(ProductInfoService.findInfoByPdid(3001));
    }
}
