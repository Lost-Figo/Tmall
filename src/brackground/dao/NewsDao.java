package brackground.dao;

import java.sql.Date;
import java.sql.SQLException;

public interface NewsDao {
    void createnews(String username, String productname, int sid, Date shijian) throws SQLException;  //创建消息
    void changenews(String username,String productname,int sid,int status) throws SQLException;   //改变消息的状态
    void liulan(int nid) throws SQLException;
}
