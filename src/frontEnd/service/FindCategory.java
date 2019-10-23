package frontEnd.service;

import entity.TmCategory;
import frontEnd.dao.CategoryDao;
import frontEnd.dao.imp.CategoryDaoImp;

import java.sql.SQLException;
import java.util.List;

public class FindCategory {
    //获取分类数据
    public static List<TmCategory> findCategory(){

        CategoryDao categoryDao = new CategoryDaoImp();
        try {
            List<TmCategory> categorys = categoryDao.findAll();
            return categorys;
        } catch (SQLException e) {
            System.out.println("获取分类数据失败！");
            return null;
        }

    };
}
