package frontEnd.dao;

import entity.TmPropertyValue;

import java.sql.SQLException;
import java.util.List;

public interface TmPropertyValueDao {
    TmPropertyValue findPropValueBy(int pdid,int pid) throws SQLException;
}
