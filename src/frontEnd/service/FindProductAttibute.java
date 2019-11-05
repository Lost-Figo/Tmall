package frontEnd.service;

import entity.TmProperty;
import entity.TmPropertyValue;
import frontEnd.dao.PropertyDao;
import frontEnd.dao.TmPropertyValueDao;
import frontEnd.dao.imp.PropertyDaoImp;
import frontEnd.dao.imp.TmpropertyValueDaoImp;
import frontEnd.entity.ProductAttibute;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FindProductAttibute {

    public static List<ProductAttibute> findProductAttibute(int pdid,int cid){
        List<ProductAttibute> list = new ArrayList<>();

        PropertyDao propertyDao = new PropertyDaoImp();
        TmPropertyValueDao propertyValueDao = new TmpropertyValueDaoImp();
        try {
            List<TmProperty> property = propertyDao.findPropertyByCid(cid);
            for(int i = 0; i < property.size(); i++ ){
                ProductAttibute productAttibute = new ProductAttibute();
                productAttibute.setPdid(pdid);
                productAttibute.setPropertyName(property.get(i).getName());
                productAttibute.setPropertyValueName(propertyValueDao.findPropValueBy(pdid,property.get(i).getPid()).getValue());
                list.add(productAttibute);
            }
            return list;
        } catch (SQLException e) {
            System.out.println("产品详情有误！");
            e.printStackTrace();
            return null;
        }
    }
}
class testfindPro{
    public static void main(String[] args) {
        System.out.println(FindProductAttibute.findProductAttibute(3001,1017));
    }
}