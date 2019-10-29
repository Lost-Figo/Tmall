package frontEnd.entity;

import entity.TmPropertyValue;

public class ProductAttibute {
    private int pdid;
    private String propertyName;
    private String propertyValueName;

    public int getPdid() {
        return pdid;
    }

    public void setPdid(int pdid) {
        this.pdid = pdid;
    }

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public String getPropertyValueName() {
        return propertyValueName;
    }

    public void setPropertyValueName(String propertyValueName) {
        this.propertyValueName = propertyValueName;
    }

    @Override
    public String toString() {
        return "ProductAttibute{" +
                "pdid=" + pdid +
                ", propertyName='" + propertyName + '\'' +
                ", propertyValueName='" + propertyValueName + '\'' +
                '}';
    }
}
