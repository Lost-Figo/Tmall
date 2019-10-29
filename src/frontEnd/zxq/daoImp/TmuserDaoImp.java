package frontEnd.zxq.daoImp;

import frontEnd.zxq.dao.TmuserDao;
import frontEnd.zxq.entity.TmUser;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
//import org.junit.Test;
import utils.C3p0Utils;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

public class TmuserDaoImp implements TmuserDao {
    private QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());

    @Override
    public boolean login(TmUser tmUser) throws SQLException {
        String sql = "select count(*) from Tmuser where name = ? and password = ?";
    //    List<TmUser> list = queryRunner.query("select * from Tmuser",new BeanListHandler<TmUser>(TmUser.class));
      //  System.out.println(list);
        TmUser tmUser1 = queryRunner.query(sql,new BeanHandler<TmUser>(TmUser.class),tmUser.getName(),tmUser.getPassword());
      //  TmUser tmUser1 = queryRunner.query(sql,new BeanHandler<TmUser>(TmUser.class),tmUser.getName(),tmUser.getPassword());
        return tmUser1 != null;
       // System.out.println(tmUser.getName()+":"+tmUser.getPassword());
//        BigDecimal bigDecimal = (BigDecimal) queryRunner.query(sql, new ScalarHandler(), tmUser.getName(),tmUser.getPassword());
//        return bigDecimal.intValue()>0;
    }

    @Override
    public void reg(TmUser tmUser) throws SQLException {
        String sql = "insert into Tmuser(tmuid,name,password) values(tm_tmuid.nextval,?,?)";
        queryRunner.update(sql,tmUser.getName(),tmUser.getPassword());

    }

    @Override
    public boolean checkUserName(String name) throws SQLException {
        String sql = "select name from Tmuser where name = ?";
        TmUser tmUser = queryRunner.query(sql,new BeanHandler<TmUser>(TmUser.class),name);
        return tmUser.getName() == null;
    }

    @Override
    public TmUser findpassword(int tmuid) throws SQLException {
        String sql = "select * from Tmuser where tmuid = ?";
        TmUser tmUser = queryRunner.query(sql,new BeanHandler<TmUser>(TmUser.class),tmuid);
        return tmUser;
    }

    @Override
    public TmUser findByName(String name) throws SQLException {
        String sql = "select * from Tmuser where name = ?";
        TmUser tmUser = queryRunner.query(sql,new BeanHandler<TmUser>(TmUser.class),name);
        return tmUser;
    }

    @Override
    public void updataTmuser(TmUser tmUser) throws SQLException {
        String  sql = "update TmUser set name =?,password =? where tmuid =?";
        queryRunner.update(sql,tmUser.getName(),tmUser.getPassword(),tmUser.getTmuid());

    }

//    @Test
    public  void test(){
        TmUser tmUser = new TmUser("pzfhuzii","zzq");
        String name = "zhuzii";
        System.out.println( tmUser);

        String uname ="zhuzii" ;
        String password =    "zzq";
        TmUser tmUser1 = new TmUser();

            tmUser1.setPassword(password);
            tmUser1.setName(uname);
        try {
            System.out.println(tmUser);
            System.out.println(login(tmUser));
            System.out.println(tmUser1);
            System.out.println(login(tmUser1));

          // System.out.println(checkUserName(name));

        } catch (SQLException e) {
          e.printStackTrace();
        }

    }
}
