package servlet.qiantai;

import entity.TmOrderItem;
import frontEnd.entity.CartLine;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@WebServlet("/buy")
public class BuyServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] oiids = req.getParameterValues("oiid");
        List<CartLine> carts = (List<CartLine>) req.getSession().getAttribute("carts");
        List<CartLine> buyCart = new ArrayList<>();
        double total = 0;
        int i = 0;
        //找到购物车中的选择列
        Iterator<CartLine> iterator = carts.iterator();
        while(iterator.hasNext()){
            CartLine cartLine = iterator.next();
            int oiid = Integer.parseInt(oiids[i]);
            if(oiid == cartLine.getOrderItem().getOiid()){
                buyCart.add(cartLine);
                i++;
                //满足条件tuic
                if(i >= oiids.length){
                    break;
                }
            }
        }
        System.out.println(buyCart);
        req.setAttribute("buyCart",buyCart);
        req.getRequestDispatcher("frontDesk/yfg/cart/buy.jsp").forward(req,resp);
    }
}
