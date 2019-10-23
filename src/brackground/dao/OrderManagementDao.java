package brackground.dao;

import entity.TmOrder;
import entity.TmOrderItem;

import java.sql.SQLException;
import java.util.List;

public interface OrderManagementDao {
    //浏览订单表
    List<TmOrder> listalltmorder();
    //浏览订单项表
    List<TmOrderItem> listalltmorderitem();
    //插入订单表
    void addorder(TmOrder tmOrder);
    //插入订单项表
    void addorderitem(TmOrderItem tmOrderItem);
    //查找订单某种完成状态的数目
    int findnumbystatus(int number);
    //查找订单总数
    int ordernum() throws SQLException;
    //查找交易总金额
    double findamount() throws SQLException;
    //查找交易成功的订单数
    int successorder() throws SQLException;
    //查找交易失败订单数目
    int failorder() throws SQLException;
    //查找退款金额
    double tobackmoney() throws SQLException;
    //某个月份的所有订单
    int ordernumbymonth(int month) throws SQLException;
    //某个月份待付款的所有订单
    int ordernopaybymonth(int month) throws SQLException;
    //某个月已付款的所有订单
    int orderpaidbymonth(int month) throws SQLException;
    //某个月已发货的所有订单
    int ordersendedbymonth(int month) throws SQLException;
    //查找各个省份的订单量
    int ordernumbyprovince(String province) throws SQLException;
    //查找某一类别的商品的占总商品数的比例
    double ordernumbytype(String type) throws SQLException;
    //查找订单中的所有商品
    int ordernumall() throws SQLException;
}
