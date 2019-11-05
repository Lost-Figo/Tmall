package frontEnd.zxq.servlet.qiantai;

import frontEnd.zxq.daoImp.TmshoppingAddressDaoImp;
import frontEnd.zxq.entity.TmShoppingAddress;
import frontEnd.zxq.entity.TmUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("*.dress")
public class TmshoppingAddressControl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset= utf-8");
        String uri = req.getRequestURI();
        PrintWriter printWriter = resp.getWriter();

        //拿到相关的数据库操作函数类
        TmshoppingAddressDaoImp tmshoppingAddressDaoImp = new TmshoppingAddressDaoImp();

        //得到用户信息
        TmUser tmUser = (TmUser)req.getSession().getAttribute("tmuser");
        int tmuid = tmUser.getTmuid();
        String uname = tmUser.getName();


        if (uri.indexOf("delete")>=0){
            int addid =Integer.parseInt(req.getParameter("addid"));

            try {
                tmshoppingAddressDaoImp.deletedress(addid,tmuid);
                printWriter.write("删除成功！");
            } catch (SQLException e) {
                e.printStackTrace();
                printWriter.write("不可删除！！！");
            }

        }else if (uri.indexOf("add")>=0){

            String address = req.getParameter("address");
            String post = req.getParameter("post");
            String receiver = req.getParameter("receiver");
            String phone = req.getParameter("phone");

            TmShoppingAddress tmShoppingAddress = new TmShoppingAddress(tmuid,address,receiver,post,phone);
            try {
                tmshoppingAddressDaoImp.addAddress(tmShoppingAddress);
                req.getRequestDispatcher("frontDesk/zxq/TmShoppingAddress.jsp").forward(req,resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if (uri.indexOf("TmShoppingAddress")>=0){
            try {
                //拿到用户的所有收货地址信息，将其放入session里面
                List<TmShoppingAddress> list = tmshoppingAddressDaoImp.finddress(tmuid);

                req.getSession().setAttribute("list",list);
                req.getRequestDispatcher("frontDesk/zxq/TmShoppingAddress.jsp").forward(req,resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if (uri.indexOf("update")>=0){
            int addid = Integer.parseInt(req.getParameter("addid"));

            String address = req.getParameter("address");
            String post = req.getParameter("post");
            String receiver = req.getParameter("receiver");
            String phone = req.getParameter("phone");

            TmShoppingAddress tmShoppingAddress = new TmShoppingAddress(addid,tmuid,address,receiver,post,phone);
            try {
                tmshoppingAddressDaoImp.updatadress(tmShoppingAddress);
            } catch (SQLException e) {
                e.printStackTrace();
                printWriter.write("操作失败！");
            }

        }


    }
}
