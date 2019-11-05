package frontEnd.service;

import frontEnd.dao.TmOrderItemDao;
import frontEnd.dao.imp.TmOrderItemDaoImp;

import java.sql.SQLException;

public class ChangeCartLine {
    public static void changeCartLine(int oiid,int num) throws SQLException {
        TmOrderItemDao orderItemDao = new TmOrderItemDaoImp();
        orderItemDao.changeCartLine(oiid,num);
    }
}
