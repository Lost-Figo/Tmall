package servlet.qiantai;


import frontEnd.service.FindCategory;
import frontEnd.service.FindProductByCid;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/start")
public class StartServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //分类数据
        req.setAttribute("categorys",FindCategory.findCategory());

        //分类产品
        req.setAttribute("productByCid", FindProductByCid.findProductByCid());

        //跳转页面
        req.getRequestDispatcher("frontDesk/yfg/index.jsp").forward(req,resp);
    }
}
