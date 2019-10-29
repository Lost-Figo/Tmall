package frontEnd.zxq.dao;

import frontEnd.zxq.entity.TmUser;

import java.sql.SQLException;

/**
 *
 * 个人登录信息表操作类
 */

public interface TmuserDao {
    //登录时，核对七人的登录信息是否正确
    public boolean login(TmUser tmUser) throws SQLException;
    //注册时，向个人登录信息表中插入其相关的用户名和登录密码
    public void reg(TmUser tmUser) throws SQLException;
    //检查用具注册时的用户名 是否已经别使用过了
    public boolean checkUserName(String name) throws SQLException;
    //用户找回密码时，调用返回其用户登录名字和登录密码
    public TmUser findpassword(int tmuid) throws SQLException;
    public TmUser findByName(String name) throws SQLException;
    public void updataTmuser(TmUser tmUser) throws SQLException;

}
