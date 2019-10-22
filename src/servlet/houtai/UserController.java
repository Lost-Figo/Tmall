package servlet.houtai;

import entity.TmStoreAdmin;
import brackground.dao.Imp.StoreAdminImp;
import brackground.dao.StorAdminDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("*.tm")

public class UserController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(123);
        StorAdminDao storAdminDao = new StoreAdminImp();
        String uri = req.getRequestURI();
        if(uri.indexOf("login")>=0){
            String logname = req.getParameter("logname");
            String logpassword = req.getParameter("logpassword");
            System.out.println(logname+","+logpassword);
            TmStoreAdmin tmStoreAdmin = new TmStoreAdmin();
            tmStoreAdmin.setName(logname);
            tmStoreAdmin.setPassword(logpassword);
            try {
                if(storAdminDao.login(tmStoreAdmin)){
                    req.getSession().setAttribute("storeadminInfo",tmStoreAdmin);
                    req.getRequestDispatcher("backstage/backstagemain.jsp").forward(req,resp);
                }else{

                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
