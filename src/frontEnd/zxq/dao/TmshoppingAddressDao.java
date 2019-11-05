package frontEnd.zxq.dao;

import frontEnd.zxq.entity.TmShoppingAddress;

import java.sql.SQLException;
import java.util.List;
/*
个人收货地址表操作类
 */

public interface  TmshoppingAddressDao {
    //通过个人的id号来查看其人的所有的收货地址信息
    public List<TmShoppingAddress> finddress(int tmuid) throws SQLException;
    //向收货地址表插入个人收货地址信息记录
    public void addAddress(TmShoppingAddress tmShoppingAddress) throws SQLException;
    //删除个人收货地址表中，一人的某一条收货地址信息
    public void deletedress(int addid, int tmuid) throws SQLException;
    //修改某个人的一条收货地址信息记录
    public void updatadress(TmShoppingAddress tmShoppingAddress) throws SQLException;
}
