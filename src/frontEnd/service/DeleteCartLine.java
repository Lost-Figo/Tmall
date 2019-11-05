package frontEnd.service;

import frontEnd.dao.TmOrderItemDao;
import frontEnd.dao.imp.TmOrderItemDaoImp;

import java.sql.SQLException;

public class DeleteCartLine {
    public static void deleteCartLine(int oiid){
        TmOrderItemDao orderItemDao = new TmOrderItemDaoImp();
        try {
            orderItemDao.deleteCartLine(oiid);
        } catch (SQLException e) {
            System.out.println("购物车选项删除失败！");
            e.printStackTrace();
        }
    }
}
