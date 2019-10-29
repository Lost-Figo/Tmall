package frontEnd.service;

import entity.TmOrderItem;
import entity.TmProduct;
import frontEnd.dao.ProductDao;
import frontEnd.dao.ProductImageDao;
import frontEnd.dao.TmOrderItemDao;
import frontEnd.dao.imp.ProductDaoImp;
import frontEnd.dao.imp.ProductImageDaoImp;
import frontEnd.dao.imp.TmOrderItemDaoImp;
import frontEnd.entity.CartLine;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class FindCart {
    public static List<CartLine> findCart(int tmuid){
        //购物车有订单项和对应的商品
        List<CartLine> carts = new ArrayList<>();
        TmOrderItemDao orderItemDao = new TmOrderItemDaoImp();
        ProductDao productDao = new ProductDaoImp();
        ProductImageDao productImageDao = new ProductImageDaoImp();
        try {
            //找到用户对应的订单项（购物车）
            List<TmOrderItem> list = orderItemDao.findcart(tmuid);
            Iterator<TmOrderItem> iterator = list.iterator();
            while(iterator.hasNext()){
                TmOrderItem orderItem = iterator.next();
                CartLine cartLine = new CartLine();
                int img = productImageDao.findProductImgBypdid(orderItem.getPdid()).get(0).getPiid();
                cartLine.setOrderItem(orderItem);
                cartLine.setProduct(productDao.findByPdid(orderItem.getPdid()));
                cartLine.setProductImag(img);
                carts.add(cartLine);
            }
            return carts;

        } catch (SQLException e) {
            System.out.println("购物车获取失败！");
            e.printStackTrace();
            return  null;
        }
    }
}

class testfindcart{
    public static void main(String[] args) {
        System.out.println(FindCart.findCart(8001));
    }
}