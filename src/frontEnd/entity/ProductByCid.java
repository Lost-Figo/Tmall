package frontEnd.entity;

import entity.TmCategory;
import entity.TmProduct;

import java.util.List;

public class ProductByCid {
    public String categoryName;
    public List<TmProduct> lists;

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public List<TmProduct> getLists() {
        return lists;
    }

    public void setLists(List<TmProduct> lists) {
        this.lists = lists;
    }

    public ProductByCid() {
    }

    @Override
    public String toString() {
        return "ProductByCid{" +
                "categoryName='" + categoryName + '\'' +
                ", Productlist=" + lists +
                '}';
    }
}
