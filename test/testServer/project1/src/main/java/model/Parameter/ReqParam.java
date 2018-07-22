package model.Parameter;
import java.util.ArrayList;
import java.util.List;

public class ReqParam {

    private String slocation ;
    private String sday ;
    private String stime ;
    private String etime ;
    private String sdate ;
    private String lat ;
    private String lng ;

    ///Google Maps
    private String location ;
    private double  radius;
    private String type;
    private List<String> types = new ArrayList<>();
    private String keyword;
    private String key;

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLng() {
        return lng;
    }

    public void setLng(String lng) {
        this.lng = lng;
    }

    public String getSlocation() {
        return slocation;
    }

    public void setSlocation(String slocation) {
        this.slocation = slocation;
    }

    public String getSday() {
        return sday;
    }

    public void setSday(String sday) {
        this.sday = sday;
    }

    public String getStime() {
        return stime;
    }

    public void setStime(String stime) {
        this.stime = stime;
    }

    public String getEtime() {
        return etime;
    }

    public void setEtime(String etime) {
        this.etime = etime;
    }

    public String getSdate() {
        return sdate;
    }

    public void setSdate(String sdate) {
        this.sdate = sdate;
    }


    public List<String> getTypes() {
        return types;
    }

    public void setTypes(List<String> types) {
        this.types = types;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ReqParam)) return false;

        ReqParam reqParam = (ReqParam) o;

        if (Double.compare(reqParam.getRadius(), getRadius()) != 0) return false;
        if (!getLocation().equals(reqParam.getLocation())) return false;
        if (!getType().equals(reqParam.getType())) return false;
        if (!getKeyword().equals(reqParam.getKeyword())) return false;
        return getKey().equals(reqParam.getKey());
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = getLocation().hashCode();
        temp = Double.doubleToLongBits(getRadius());
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + getType().hashCode();
        result = 31 * result + getKeyword().hashCode();
        result = 31 * result + getKey().hashCode();
        return result;
    }

    @Override
    public java.lang.String toString() {
        return "ReqParam{" +
                "location=" + location +
                ", radius=" + radius +
                ", type=" + type +
                ", types=" + types +
                ", keyword=" + keyword +
                ", key=" + key +
                '}';
    }
}
