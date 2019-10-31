package brackground.dao.Imp;

import brackground.dao.NewsDao;
import org.apache.commons.dbutils.QueryRunner;
import utils.C3p0Utils;

import java.sql.Date;
import java.sql.SQLException;

public class NewsImp implements NewsDao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    @Override
    public void createnews(String username, String productname, int sid, Date shijian) throws SQLException {
        String sql = "insert into tmnews(nid,username,productname,sid,status,shijian,liulan) values(tm_nid.nextval,?,?,?,1,?,0)";
        queryRunner.update(sql,username,productname,sid,shijian);
    }

    @Override
    public void changenews(String username, String productname, int sid, int status) throws SQLException {
        String sql = "updata tmnews set status=? where username=? and productname=? and sid=?";
        queryRunner.update(sql,status,username,productname,sid);
    }

    @Override
    public void liulan(int nid) throws SQLException {
        String sql = "update tmnews set liulan=1 where nid=?";
        queryRunner.update(sql,nid);
    }
}
