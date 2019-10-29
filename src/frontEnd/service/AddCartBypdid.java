package frontEnd.service;

import frontEnd.dao.TmOrderItemDao;
import frontEnd.dao.imp.TmOrderItemDaoImp;
import frontEnd.entity.CartLine;

import java.sql.SQLException;
import java.util.List;

public class AddCartBypdid {

    public static List<CartLine> addCartByPdid(int pdid, int tmuid, int num, List<CartLine> carts){
        //加入购物车
        Boolean flag = false;
        //判断该商品是否存在在购物车
        for(int i = 0; i <carts.size(); i++){
            CartLine cartLine = carts.get(i);
            if(cartLine.getOrderItem().getPdid() == pdid){
                int count = cartLine.getOrderItem().getCount();
                count += num;
                cartLine.getOrderItem().setCount(count);
                flag = true;
                break;
            }
        }
        //存在则相加，不存在则创建
        if(!flag){
            //创建购物车项
            TmOrderItemDao orderItemDao = new TmOrderItemDaoImp();
            try {
                //插入数据库
                orderItemDao.addCart(pdid,tmuid,num);
                //更新购物车
                List<CartLine> newcart = FindCart.findCart(tmuid);
                return newcart;

            } catch (SQLException e) {
                System.out.println("添加购物车失败！");
                e.printStackTrace();
            }
        }
        System.out.println(carts);
        return carts;



    }
}
