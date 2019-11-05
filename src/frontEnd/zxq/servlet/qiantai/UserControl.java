package frontEnd.zxq.servlet.qiantai;

import frontEnd.zxq.dao.TmuserDao;
import frontEnd.zxq.daoImp.TmpersonalInformationDaoImp;
import frontEnd.zxq.daoImp.TmuserDaoImp;
import frontEnd.zxq.entity.TmPersonalInformation;
import frontEnd.zxq.entity.TmUser;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("*.user")
public class UserControl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset= utf-8");
        String uri = req.getRequestURI();
        PrintWriter printWriter = resp.getWriter();
       // System.out.println("sk"+uri);
        TmuserDao tmuserDao = new TmuserDaoImp();
        //保存发送的邮件验证码
        String Verification = "";



        if(uri.indexOf("login")>=0){
            String uname = req.getParameter("name");
            String password = req.getParameter("password");
            TmUser tmUser  = new TmUser();

            tmUser.setName(uname);
            tmUser.setPassword(password);

//            System.out.println(tmUser);
//
//            System.out.println(uname);
//            System.out.println(password);

            try {
                if (tmuserDao.login(tmUser)){
                    req.getSession().setAttribute("user",tmUser);
                    resp.sendRedirect("frontDesk/zxq/registerSuccess.jsp");
                    //TODO
                }else {
                    req.setAttribute("error_msg" ,"用户名密码错误");
                    req.getRequestDispatcher("frontDesk/zxq/login.jsp").forward(req,resp);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }else if(uri.indexOf("reg")>=0){
            String uname = req.getParameter("name");
            String password = req.getParameter("password");
            TmUser tmUser = new TmUser(uname,password);

            try {
                tmuserDao.reg(tmUser);
                resp.sendRedirect("frontDesk/zxq/registerSuccess.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                resp.sendRedirect("frontDesk/zxq/register.jsp");
            }

        }else if (uri.indexOf("checkname")>=0){
            String  name = req.getParameter("name");
            try {
                if (!tmuserDao.checkUserName(name)){
                    printWriter.write("用户名已存在！");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }else if (uri.indexOf("out")>=0){
            req.getSession().setAttribute("user",null);
            resp.sendRedirect("frontDesk/zxq/login.jsp");

        }else if (uri.indexOf("sendemail")>=0){
            //向用户发送邮件，用以验证
            String name = req.getParameter("name");
            String choose = req.getParameter("choose");

            try {
                //拿到用户id
                TmUser tmUser = tmuserDao.findByName(name);
                int tmuid = tmUser.getTmuid();


                //拿到邮件接受人邮件向号，判断是否是使用已保存的邮箱号
                String email;
                if(choose.indexOf("no")>=0){
                    email = req.getParameter("choose");
                }else {
                    TmpersonalInformationDaoImp tmpersonalInformationDaoImp = new TmpersonalInformationDaoImp();
                    TmPersonalInformation tmPersonalInformation = tmpersonalInformationDaoImp.findInfo(tmuid);
                    email = tmPersonalInformation.getEmail();
                }
                //生成验证码
                BuildVerificationCode buildVerificationCode = new BuildVerificationCode();
                 Verification = String.valueOf(buildVerificationCode.getVerification());

                //生成将发送的邮件
                try {
                    CreateEmail createEmail=  new CreateEmail(email,name,"找回密码的验证码",Verification);
                    MimeMessage mimeMessage =createEmail.getEmailMessage();
                    //发送邮件
                    new SendEmail(createEmail.getSession(),mimeMessage);
                } catch (MessagingException e) {
                    printWriter.write("操作失败，请重新获取验证码。");
                    e.printStackTrace();
                }



            } catch (SQLException e) {
                System.out.println("用户相关信息获取失败！！！！！！");
                e.printStackTrace();
            }


        }else if (uri.indexOf("findpassword")>=0){
            //拿到用户id
            String name = req.getParameter("name");
           String password = req.getParameter("password");


            try {
                TmUser tmUser = tmuserDao.findByName(name);
                tmUser.setPassword(password);
                tmuserDao.updataTmuser(tmUser);
                resp.sendRedirect("frontDesk/zxq/registerSuccess.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                printWriter.write("操作失败！！！！！！！");
            }




        }else if (uri.indexOf("yanzheng")>=0){
            String yanzheng = req.getParameter("yanzheng");
            if (Verification.equals(yanzheng)){
                printWriter.write("yes");

            }else {
                printWriter.write("no");
            }

        }


    }
}
