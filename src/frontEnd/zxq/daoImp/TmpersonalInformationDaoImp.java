package frontEnd.zxq.daoImp;

import frontEnd.zxq.dao.TmpersonalInformationDao;
import frontEnd.zxq.entity.TmPersonalInformation;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import utils.C3p0Utils;

import java.sql.SQLException;
import java.util.List;

public class TmpersonalInformationDaoImp implements TmpersonalInformationDao {

    private QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
    @Override
    public void addInfo(TmPersonalInformation tp) throws SQLException {
        String sql =  "insert into tmpersonalInformation(perid,tmuid,name,headimg,sex,signature,homedress,phone,email,kind) values(tm_perid.nextval,?,?,?,?,?,?,?,?,?)";
        queryRunner.update(sql,tp.getTmuid(),tp.getName(),tp.getHeadimg(),tp.getSex(),tp.getSignature(),tp.getHomedress(),tp.getPhone(),tp.getEmail(),tp.getKind());


    }

    @Override
    public void deleteInfo(int tmuid) throws SQLException {
        String sql = "delete from tmPersonalInformation where tmuid = ?";
        queryRunner.update(sql,tmuid);

    }

    @Override
    public void updataInfo(TmPersonalInformation tmPersonalInformation) throws SQLException {
        deleteInfo(tmPersonalInformation.getTmuid());
        addInfo(tmPersonalInformation);

    }

    @Override
    public TmPersonalInformation findInfo(int tmuid) throws SQLException {
        String sql = "select * from TmPersonalInformation where tmuid =?";
       TmPersonalInformation tmPersonalInformation = queryRunner.query(sql,new BeanHandler<TmPersonalInformation>(TmPersonalInformation.class),tmuid);
        return tmPersonalInformation;
    }


    public List<TmPersonalInformation> findInfo1() throws SQLException {
        String sql = "select * from TmPersonalInformation ";
        List<TmPersonalInformation> tmPersonalInformation = queryRunner.query(sql,new BeanListHandler<TmPersonalInformation>(TmPersonalInformation.class));
        return tmPersonalInformation;
    }


    public void test(){
        //1111,8002,"朱紫琪","女","tu1","强者的世界就由他们去说吧"
        TmPersonalInformation  tmPersonalInformation = new TmPersonalInformation();
        try {
            //    addInfo(tmPersonalInformation);
          //  deleteInfo(tmPersonalInformation.getPerid(),tmPersonalInformation.getTmuid());
            //updataInfo(tmPersonalInformation);
           // System.out.println(findInfo1());

           System.out.println(findInfo(8002));


        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


}
