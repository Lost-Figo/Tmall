//package frontEnd.zxq.servlet.houtai;
//
//import frontEnd.zxq.entity.TmStoreAdmin;
//import brackground.dao.Imp.StoreAdminImp;
//import brackground.dao.StorAdminDao;
//
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.sql.SQLException;
//
//@WebServlet("*.tm")
//
//public class UserController extends HttpServlet {
//    @Override
//    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        StorAdminDao storAdminDao = new StoreAdminImp();
//        String uri = req.getRequestURI();
//        if(uri.indexOf("login")>=0){
//            String logname = req.getParameter("logname");
//            String logpassword = req.getParameter("logpassword");
//            TmStoreAdmin tmStoreAdmin = new TmStoreAdmin();
//            try {
//                if(storAdminDao.login(tmStoreAdmin)){
//                    req.getSession().setAttribute("storeadminInfo",tmStoreAdmin);
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//    }
//}
