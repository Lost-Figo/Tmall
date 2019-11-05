package frontEnd.zxq.dao;

import frontEnd.zxq.entity.TmPersonalInformation;

import java.sql.SQLException;
/**
 * 个人信息表操作表类
 */
public interface TmpersonalInformationDao {
    //向表中插入个人信息记录
    public void addInfo(TmPersonalInformation tmPersonalInformation) throws SQLException;
    //删除个人的信息记录一条，通过个人id和用户id 来确定
    public void deleteInfo(int tmuid) throws SQLException;
    //更新、修改某人的个人信息记录
    public void updataInfo(TmPersonalInformation tmPersonalInformation) throws SQLException;
    //查看个人信息
    public TmPersonalInformation findInfo(int tmuid) throws SQLException;

}
