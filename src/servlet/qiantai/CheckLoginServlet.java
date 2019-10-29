package servlet.qiantai;

import frontEnd.entity.CartLine;
import frontEnd.service.FindCart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/checklogin")
public class CheckLoginServlet extends HttpServlet {
    //检查登录
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //判断是否登录
        //ToDo 默认登录
        req.getSession().setAttribute("tmuid",8001);
        //查找购物车信息
        List<CartLine> carts = FindCart.findCart(8001);
        req.getSession().setAttribute("carts",carts);
        PrintWriter pw = resp.getWriter();
        pw.print("success");
    }
}
