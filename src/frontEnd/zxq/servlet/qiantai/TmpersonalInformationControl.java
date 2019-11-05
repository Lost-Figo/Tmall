package frontEnd.zxq.servlet.qiantai;

import frontEnd.zxq.daoImp.TmpersonalInformationDaoImp;
import frontEnd.zxq.entity.TmPersonalInformation;
import frontEnd.zxq.entity.TmUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("*.Info")
public class TmpersonalInformationControl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset = utf-8");
        String uri = req.getRequestURI();
        PrintWriter printWriter = resp.getWriter();

        //拿到TmPersonalInformation的操作类
        TmpersonalInformationDaoImp tmpersonalInformationDaoImp = new TmpersonalInformationDaoImp();

        if (uri.indexOf("addInfo")>=0){
            String signature = req.getParameter("signature");
            String  name = req.getParameter("name");
            String sex =  req.getParameter("sex");
            String headimg = req.getParameter("headimg");

            String phone = req.getParameter("phone");
            String email = req.getParameter("email");
            String kind = req.getParameter("kind");
            String homedress = req.getParameter("homedress");

            //拿到用户登录的相关信息Tmuser  //获取session里面的car对象
            HttpSession httpSession = req.getSession();
            TmUser tmUser = (TmUser)httpSession.getAttribute("user");
            int  tmuid = tmUser.getTmuid();

            TmPersonalInformation tmPersonalInformation = new TmPersonalInformation(tmuid,name,sex,phone,email,kind,homedress,headimg,signature);

            try {
                //将用户信息加入数据库
                tmpersonalInformationDaoImp.addInfo(tmPersonalInformation);
                //拿到数据库中的用户信息，并放置在session例
                TmPersonalInformation userInfo = tmpersonalInformationDaoImp.findInfo(tmuid);
                 req.getSession().setAttribute("userInfo",userInfo);
                resp.sendRedirect("frontDesk/zxq/registerSuccess.jsp");
            } catch (SQLException e) {
                // TODO: 2019/10/26  
              //  printWriter.write("alert("信息保存失败，请重新操作")");
                e.printStackTrace();

            }

        }
    }
}
