package frontEnd.entity;

import entity.TmOrderItem;
import entity.TmProduct;

public class CartLine {
    private TmOrderItem orderItem;
    private TmProduct product;
    private int  productImag;

    public int getProductImag() {
        return productImag;
    }

    public void setProductImag(int productImag) {
        this.productImag = productImag;
    }

    public TmOrderItem getOrderItem() {
        return orderItem;
    }

    public void setOrderItem(TmOrderItem orderItem) {
        this.orderItem = orderItem;
    }

    public TmProduct getProduct() {
        return product;
    }

    public void setProduct(TmProduct product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "CartLine{" +
                "orderItem=" + orderItem +
                ", product=" + product +
                ", productImag=" + productImag +
                '}';
    }
}
