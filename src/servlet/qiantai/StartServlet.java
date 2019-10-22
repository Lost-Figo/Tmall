package servlet.qiantai;

import entity.TmCategory;
import frontEnd.dao.CategoryDao;
import frontEnd.dao.imp.CategoryDaoImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/start")
public class StartServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取分类数据
        CategoryDao categoryDao = new CategoryDaoImp();
        try {
            System.out.println(123);
            List<TmCategory> categorys = categoryDao.findAll();
            req.setAttribute("categorys",categorys);
            req.getSession().setAttribute("categorys",categorys);
            req.getRequestDispatcher("frontDesk/yfg/index.jsp").forward(req,resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
