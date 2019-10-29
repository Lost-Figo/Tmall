package servlet.qiantai;

import frontEnd.entity.CartLine;
import frontEnd.service.ChangeCartLine;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/changeOrderItem")
public class AlterCartLine extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取要修改的pdid;
        int pdid = Integer.parseInt(req.getParameter("pid"));
        //获取数量
        int num = Integer.parseInt(req.getParameter("number"));
        List<CartLine> carts = (List<CartLine>) req.getSession().getAttribute("carts");
        for (int i = 0; i < carts.size(); i++){
            if(carts.get(i).getProduct().getPdid() == pdid){

                carts.get(i).getOrderItem().setCount(num);
                //TODo 修改数据库
                int oiid = carts.get(i).getOrderItem().getOiid();
                try {
                    ChangeCartLine.changeCartLine(oiid,num);
                } catch (SQLException e) {
                    System.out.println("修改购物车数据库失败！");
                    e.printStackTrace();
                }

            }
        }
        req.getSession().setAttribute("carts",carts);
        PrintWriter pw = resp.getWriter();
        pw.print("success");
    }
}
