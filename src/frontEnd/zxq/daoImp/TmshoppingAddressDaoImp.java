package frontEnd.zxq.daoImp;

import frontEnd.zxq.dao.TmshoppingAddressDao;
import frontEnd.zxq.entity.TmShoppingAddress;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
//import org.junit.Test;
import utils.C3p0Utils;

import java.sql.SQLException;
import java.util.List;

public class TmshoppingAddressDaoImp implements TmshoppingAddressDao {
    QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    @Override
    public List<TmShoppingAddress> finddress(int tmuid) throws SQLException {
        String sql = "select * from TmshoppingAddress where tmuid=?";
       // List<TmShoppingAddress> listaddress =
        return queryRunner.query(sql,new BeanListHandler<TmShoppingAddress>(TmShoppingAddress.class),tmuid);
    }




    @Override
    public void addAddress(TmShoppingAddress tmShoppingAddress) throws SQLException {
        String  sql = "insert into TmshoppingAddress(addid,tmuid,address,post,recevier,phone) values(tm_addid.nextval,?,?,?,?,?)";
        queryRunner.update(sql,tmShoppingAddress.getTmuid(),tmShoppingAddress.getAddress(),tmShoppingAddress.getPost(),tmShoppingAddress.getRecevier(),tmShoppingAddress.getPhone());

    }

    @Override
    public void deletedress(int addid, int tmuid) throws SQLException {
        String sql = "delete TmshoppingAddress where addid = ? and tmuid = ?";
        queryRunner.update(sql,addid,tmuid);

    }

    @Override
    public void updatadress(TmShoppingAddress tmShoppingAddress) throws SQLException {
        String  sql = "update TmshoppingAddress set address =?,post =?,recevier =?,phone =? where addid =? and tmuid =?";
        queryRunner.update(sql,tmShoppingAddress.getAddress(),tmShoppingAddress.getPost(),tmShoppingAddress.getRecevier(),tmShoppingAddress.getPhone(),tmShoppingAddress.getAddid(),tmShoppingAddress.getTmuid());

    }

//    @Test
    public void test(){
        TmShoppingAddress tmshoppingAddress = new TmShoppingAddress();
        tmshoppingAddress.setAddid(5555);
        tmshoppingAddress.setTmuid(8001);
        tmshoppingAddress.setAddress("换工业大学");
        tmshoppingAddress.setPost("422900");
        tmshoppingAddress.setRecevier("髓知味");
        tmshoppingAddress.setPhone("18195471264");
       // System.out.println(tmshoppingAddress);
        TmShoppingAddress tmShoppingAddress1 = tmshoppingAddress;
       // tmShoppingAddress1.setAddress("li喃喃杨桂芬");
      //  System.out.println(tmshoppingAddress);
     //   System.out.println(tmShoppingAddress1);

        try {
         // addAddress(tmshoppingAddress);
          System.out.println(finddress(8001).get(0).toString());
           updatadress(tmshoppingAddress);
            System.out.println(finddress(8001).get(0).toString());
            //deletedress(tmshoppingAddress.getAddid(),tmshoppingAddress.getAddid());

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
