package frontEnd.service;

import entity.TmCategory;
import entity.TmProduct;
import frontEnd.dao.CategoryDao;
import frontEnd.dao.ProductDao;
import frontEnd.dao.imp.CategoryDaoImp;
import frontEnd.dao.imp.ProductDaoImp;
import frontEnd.entity.ProductByCid;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class FindProductByCid {
    //分类的产品
    public static List<ProductByCid> findProductByCid() {

        List<ProductByCid> productByCids = new ArrayList<>();
        ProductDao productDao = new ProductDaoImp();
        //添加分类

        List<TmCategory> categories = FindCategory.findCategory();
        Iterator<TmCategory> iterator = categories.iterator();
        while(iterator.hasNext()){
            TmCategory category = iterator.next();
            ProductByCid productByCid = new ProductByCid();
            productByCid.setCategoryName(category.getName());
            try {
                productByCid.setLists(productDao.findByCid(category.getCid()));
            } catch (SQLException e) {
                e.printStackTrace();
            }
            productByCids.add(productByCid);
        }
        return productByCids;

    };
}

class testPro{
    public static void main(String[] args) {
        List<ProductByCid> list = FindProductByCid.findProductByCid();
        Iterator<ProductByCid> iterator = list.iterator();
        while(iterator.hasNext()){
            ProductByCid productByCid = iterator.next();
            System.out.println(productByCid.getCategoryName());
            System.out.println("***************");
            List<TmProduct> products = productByCid.getLists();
            System.out.println(products);
        }
    }
}