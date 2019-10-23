package servlet.houtai;

import brackground.dao.CategoryDao;
import brackground.dao.Imp.CategoryImp;
import com.alibaba.fastjson.JSON;
import entity.TmCategory;
import entity.Znodes;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("*.pd")
public class ProductController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        CategoryDao categoryDao = new CategoryImp();
        if(uri.indexOf("category")>=0){
            List<TmCategory> list = null;
            try {
                list = categoryDao.getCategory();
                ArrayList<Znodes> str = new ArrayList<Znodes>();
                int id = 111;
                for (int i=0;i<list.size();i++){
                    str.add(new Znodes(id,11,list.get(i).getName()));
                    id++;
                }
                String jsonstr = JSON.toJSONString(str);
                System.out.println(jsonstr);
                PrintWriter pw = resp.getWriter();
                pw.write(jsonstr);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
