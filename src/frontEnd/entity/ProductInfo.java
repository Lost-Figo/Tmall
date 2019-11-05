package frontEnd.entity;

import entity.TmProduct;
import entity.TmProductImage;

import java.util.List;

public class ProductInfo {
    //(详细标题及价格 需要主标题 副标题 价格 )[商品] 销量数 库存 累计评价数 图片列表
    private TmProduct product;
    private int stock;
    private int sales;
    private int evaluate;
    private List<TmProductImage> productImageList;

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    public TmProduct getProduct() {
        return product;
    }

    public void setProduct(TmProduct product) {
        this.product = product;
    }

    public int getSales() {
        return sales;
    }

    public void setSales(int sales) {
        this.sales = sales;
    }

    public int getEvaluate() {
        return evaluate;
    }

    public void setEvaluate(int evaluate) {
        this.evaluate = evaluate;
    }

    public List<TmProductImage> getProductImageList() {
        return productImageList;
    }

    public void setProductImageList(List<TmProductImage> productImageList) {
        this.productImageList = productImageList;
    }

    @Override
    public String toString() {
        return "ProductInfo{" +
                "product=" + product +
                ", stock=" + stock +
                ", sales=" + sales +
                ", evaluate=" + evaluate +
                ", productImageList=" + productImageList +
                '}';
    }
}
