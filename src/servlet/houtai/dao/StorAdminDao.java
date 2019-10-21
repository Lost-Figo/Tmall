package servlet.houtai.dao;

import entity.TmStoreAdmin;

        import java.sql.SQLException;

public interface StorAdminDao {
    public boolean login(TmStoreAdmin tmStoreAdmin) throws SQLException;  //商店管理员登录
    public void reg(TmStoreAdmin tmStoreAdmin) throws SQLException;     //商店管理员注册
    public boolean checkStoreAdminName(String adminname) throws SQLException;       //商店管理员注册姓名查重
}
