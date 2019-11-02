package servlet.houtai;

import brackground.dao.CategoryDao;
import brackground.dao.Imp.CategoryImp;
import brackground.dao.Imp.PropertyImp;
import brackground.dao.PropertyDao;
import com.alibaba.fastjson.JSON;
import entity.TmCategory;
import entity.TmProduct;
import entity.TmProperty;
import entity.Znodes;
import brackground.dao.ProductDao;
import brackground.dao.Imp.ProductImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
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
        PropertyDao propertyDao = new PropertyImp();
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
            }else if(uri.indexOf("addcate")>=0){
                String[] sxname = req.getParameterValues("shuxingname");
                String catename = req.getParameter("product-category-name");
                ArrayList<TmProperty> list = null;
                try {
                    categoryDao.createcate(catename);
                    int id = categoryDao.findidbyname(catename).intValue();
                    if(sxname!=null){
                        for (int i=0;i<sxname.length;i++){
                            propertyDao.createpro(id,sxname[i]);
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }else if(uri.indexOf("catenamecheck")>=0){
                String catename = req.getParameter("name");
                System.out.println(1);
                System.out.println(catename);
                try {
                    if(categoryDao.findname(catename)){
                        System.out.println(2);
                        pw.write("msgno");
                    }else{
                        pw.write("msgyes");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }else if(uri.indexOf("catechange")>=0){
                String catename = req.getParameter("catename");
                try {
                    int id = categoryDao.findidbyname(catename).intValue();
                    List<TmProperty> sxname = propertyDao.cidfindname(id);
                    pw.write(JSON.toJSONString(sxname));
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }else if(uri.indexOf("shuxingname")>=0){
                String shuxingname = req.getParameter("shuxingname");
                try {
                    if(propertyDao.chachong(shuxingname)){
                        pw.write("msgno");
                    }else{
                        int pid = Integer.parseInt(req.getParameter("pid"));
                        String oldname = propertyDao.pidfindname(pid).getName();
                        propertyDao.update(oldname,shuxingname);
                        pw.write("msgyes");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }else if(uri.indexOf("createpro")>=0){
                System.out.println(1);
                String zhuname = req.getParameter("zhuname");
                String funame = req.getParameter("funame");
                String yuanjia = req.getParameter("yuanjia");
                String zuxiao = req.getParameter("zuxiao");
                String catename = req.getParameter("zhongleiname");
                System.out.println(catename);
                try {
                    int cid = categoryDao.findidbyname(catename).intValue();
                    productDao.createproduct(zhuname,funame,Integer.parseInt(yuanjia),Integer.parseInt(zuxiao),cid,5001);
                    System.out.println(2);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
