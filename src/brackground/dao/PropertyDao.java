package brackground.dao;

import entity.TmProperty;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public interface PropertyDao {
    void createpro(int cid,String name) throws SQLException;
    List<TmProperty> cidfindname(int cid) throws SQLException;
    boolean chachong(String name) throws SQLException;
    BigDecimal namefindcid(String name) throws SQLException;
    void update(String old,String name) throws SQLException;
    TmProperty pidfindname(int pid) throws SQLException;
}
