package servlet.qiantai;

import entity.TmOrderItem;
import frontEnd.entity.CartLine;
import frontEnd.service.FindCart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("*.skip")
public class SkipServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        //购物车页面需要 商品名，商品图片 ，两个价格 ，数量
        if(uri.indexOf("cart") >= 0){
            //获取购物车信息
            int tmuid = (int) req.getSession().getAttribute("tmuid");


            req.getRequestDispatcher("frontDesk/yfg/cart/cart.jsp").forward(req,resp);
            //跳转页面
        }
    }
}
