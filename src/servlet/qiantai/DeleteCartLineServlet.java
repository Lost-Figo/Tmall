package servlet.qiantai;

import frontEnd.entity.CartLine;
import frontEnd.service.DeleteCartLine;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

//删除购物车选项
@WebServlet("/deleteOrderItem")
public class DeleteCartLineServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取oiid
        int oiid = Integer.parseInt(req.getParameter("oiid"));
        //在购物车中查找该选项并删除
        List<CartLine> carts = (List<CartLine>) req.getSession().getAttribute("carts");
        for(int i = 0; i < carts.size(); i++){
            if(carts.get(i).getOrderItem().getOiid() == oiid){
                DeleteCartLine.deleteCartLine(oiid);
                carts.remove(i);
            }
        }

        req.getSession().setAttribute("carts",carts);
        PrintWriter printWriter = resp.getWriter();
        printWriter.print("success");

    }
}
