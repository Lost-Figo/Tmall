package servlet.houtai;

import brackground.dao.CategoryDao;
import brackground.dao.Imp.CategoryImp;
import com.alibaba.fastjson.JSON;
import entity.TmCategory;
import entity.TmProduct;
import entity.Znodes;
import brackground.dao.ProductDao;
import brackground.dao.Imp.ProductImp;

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
        PrintWriter pw = resp.getWriter();
        ProductDao productDao = new ProductImp();
        if(uri.indexOf("category")>=0){   //后台获取产品种类
            List<TmCategory> list = null;
            try {
                list = categoryDao.getCategory();
                ArrayList<Znodes> str = new ArrayList<Znodes>();
                int id = 111;
                str.add(new Znodes(11,1,"all"));
                for (int i=0;i<list.size();i++){
                    str.add(new Znodes(id,11,list.get(i).getName()));
                    id++;
                }
                String jsonstr = JSON.toJSONString(str);
                pw.write(jsonstr);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else {
            if (uri.indexOf("product")>=0){         //后台获取产品
                List<TmProduct> plist = null;
                try {
                    plist = productDao.findAll();
                    String jsonstr = JSON.toJSONString(plist);
                    pw.write(jsonstr);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }else if(uri.indexOf("treename")>=0){
                String treename = req.getParameter("treename");
                List<TmProduct> plist = null;
                if("all".equals(treename)){
                    try {
                        plist = productDao.findAll();
                        String jsonstr = JSON.toJSONString(plist);
                        pw.write(jsonstr);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }else{
                    try {
                        plist = productDao.findByName(treename);
                        String jsonstr = JSON.toJSONString(plist);
                        pw.write(jsonstr);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }
}
