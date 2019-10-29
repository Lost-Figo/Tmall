package servlet.qiantai;

import frontEnd.dao.TmOrderItemDao;
import frontEnd.dao.imp.TmOrderItemDaoImp;
import frontEnd.entity.CartLine;
import frontEnd.service.AddCartBypdid;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/addcart")
public class AddcareServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pdid = Integer.parseInt(req.getParameter("pdid"));
        int num = Integer.parseInt(req.getParameter("num"));
        //将产品放入购物车
        List<CartLine> carts = (List<CartLine>) req.getSession().getAttribute("carts");
        int tmuid = (int) req.getSession().getAttribute("tmuid");
        List<CartLine> cartLines = AddCartBypdid.addCartByPdid(pdid, tmuid, num,carts);

        req.getSession().setAttribute("carts",cartLines);
        System.out.println(req.getSession().getAttribute("carts"));
        PrintWriter pw = resp.getWriter();
        pw.print("success");
    }
}
