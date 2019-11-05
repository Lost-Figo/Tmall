package servlet.qiantai;

import entity.TmProductImage;
import entity.TmReview;
import frontEnd.dao.ProductDao;
import frontEnd.dao.ProductImageDao;
import frontEnd.dao.imp.ProductDaoImp;
import frontEnd.dao.imp.ProductImageDaoImp;
import frontEnd.entity.ProductAttibute;
import frontEnd.entity.ProductInfo;
import frontEnd.service.FindProductAttiImg;
import frontEnd.service.FindProductAttibute;
import frontEnd.service.FindReviewByPdid;
import frontEnd.service.ProductInfoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/Product.prod")
public class ProductServlet extends HttpServlet {
    //详细标题及价格 需要主标题 副标题 价格 销量 累计评价 图片列表
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int pdid = Integer.parseInt(req.getParameter("pdid"));
        //获得产品详情
        ProductInfo productInfo = ProductInfoService.findInfoByPdid(pdid);
        int cid = productInfo.getProduct().getCid();
        //获得产品属性
        List<ProductAttibute> list = FindProductAttibute.findProductAttibute(pdid,cid);
        //获得产品详情图片
        List<TmProductImage> listimg = FindProductAttiImg.findProductAtti(pdid);
        //获得产品评论
        List<TmReview> listReviews = FindReviewByPdid.findReviewByPdid(pdid);

        req.setAttribute("productInfo",productInfo);
        req.setAttribute("productAttibute",list);
        req.setAttribute("productAttiImg",listimg);
        req.setAttribute("productReview",listReviews);

        req.getRequestDispatcher("frontDesk/yfg/product/product.jsp").forward(req,resp);
    }
}
