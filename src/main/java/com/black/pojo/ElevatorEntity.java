package com.black.pojo;

/**
 * Created by try on 2017/9/24.
 */
public class ElevatorEntity {
    private String ID;
    private String TestID;
    private String RegisID;
    private String UseUnit;
    private String SitesID;
    private String Linkman;
    private String Address;
    private String TeleNumber;
    private String Type;
    private String Carry;
    private String Manufacturer;
    private String FloorNum;
    private String TestType;
    private String MaintainUnit;
    private String Xcoordinate;
    private String Ycoordinate;

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getTestID() {
        return TestID;
    }

    public void setTestID(String testID) {
        TestID = testID;
    }

    public String getRegisID() {
        return RegisID;
    }

    public void setRegisID(String regisID) {
        RegisID = regisID;
    }

    public String getUseUnit() {
        return UseUnit;
    }

    public void setUseUnit(String useUnit) {
        UseUnit = useUnit;
    }

    public String getSitesID() {
        return SitesID;
    }

    public void setSitesID(String sitesID) {
        SitesID = sitesID;
    }

    public String getLinkman() {
        return Linkman;
    }

    public void setLinkman(String linkman) {
        Linkman = linkman;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getTeleNumber() {
        return TeleNumber;
    }

    public void setTeleNumber(String teleNumber) {
        TeleNumber = teleNumber;
    }

    public String getType() {
        return Type;
    }

    public void setType(String type) {
        Type = type;
    }

    public String getCarry() {
        return Carry;
    }

    public void setCarry(String carry) {
        Carry = carry;
    }

    public String getManufacturer() {
        return Manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        Manufacturer = manufacturer;
    }

    public String getFloorNum() {
        return FloorNum;
    }

    public void setFloorNum(String floorNum) {
        FloorNum = floorNum;
    }

    public String getTestType() {
        return TestType;
    }

    public void setTestType(String testType) {
        TestType = testType;
    }

    public String getMaintainUnit() {
        return MaintainUnit;
    }

    public void setMaintainUnit(String maintainUnit) {
        MaintainUnit = maintainUnit;
    }

    public String getXcoordinate() {
        return Xcoordinate;
    }

    public void setXcoordinate(String xcoordinate) {
        Xcoordinate = xcoordinate;
    }

    public String getYcoordinate() {
        return Ycoordinate;
    }

    public void setYcoordinate(String ycoordinate) {
        Ycoordinate = ycoordinate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ElevatorEntity that = (ElevatorEntity) o;

        if (ID != null ? !ID.equals(that.ID) : that.ID != null) return false;
        if (TestID != null ? !TestID.equals(that.TestID) : that.TestID != null) return false;
        if (RegisID != null ? !RegisID.equals(that.RegisID) : that.RegisID != null) return false;
        if (UseUnit != null ? !UseUnit.equals(that.UseUnit) : that.UseUnit != null) return false;
        if (SitesID != null ? !SitesID.equals(that.SitesID) : that.SitesID != null) return false;
        if (Linkman != null ? !Linkman.equals(that.Linkman) : that.Linkman != null) return false;
        if (Address != null ? !Address.equals(that.Address) : that.Address != null) return false;
        if (TeleNumber != null ? !TeleNumber.equals(that.TeleNumber) : that.TeleNumber != null) return false;
        if (Type != null ? !Type.equals(that.Type) : that.Type != null) return false;
        if (Carry != null ? !Carry.equals(that.Carry) : that.Carry != null) return false;
        if (Manufacturer != null ? !Manufacturer.equals(that.Manufacturer) : that.Manufacturer != null) return false;
        if (FloorNum != null ? !FloorNum.equals(that.FloorNum) : that.FloorNum != null) return false;
        if (TestType != null ? !TestType.equals(that.TestType) : that.TestType != null) return false;
        if (MaintainUnit != null ? !MaintainUnit.equals(that.MaintainUnit) : that.MaintainUnit != null) return false;
        if (Xcoordinate != null ? !Xcoordinate.equals(that.Xcoordinate) : that.Xcoordinate != null) return false;
        return Ycoordinate != null ? Ycoordinate.equals(that.Ycoordinate) : that.Ycoordinate == null;
    }

    @Override
    public int hashCode() {
        int result = ID != null ? ID.hashCode() : 0;
        result = 31 * result + (TestID != null ? TestID.hashCode() : 0);
        result = 31 * result + (RegisID != null ? RegisID.hashCode() : 0);
        result = 31 * result + (UseUnit != null ? UseUnit.hashCode() : 0);
        result = 31 * result + (SitesID != null ? SitesID.hashCode() : 0);
        result = 31 * result + (Linkman != null ? Linkman.hashCode() : 0);
        result = 31 * result + (Address != null ? Address.hashCode() : 0);
        result = 31 * result + (TeleNumber != null ? TeleNumber.hashCode() : 0);
        result = 31 * result + (Type != null ? Type.hashCode() : 0);
        result = 31 * result + (Carry != null ? Carry.hashCode() : 0);
        result = 31 * result + (Manufacturer != null ? Manufacturer.hashCode() : 0);
        result = 31 * result + (FloorNum != null ? FloorNum.hashCode() : 0);
        result = 31 * result + (TestType != null ? TestType.hashCode() : 0);
        result = 31 * result + (MaintainUnit != null ? MaintainUnit.hashCode() : 0);
        result = 31 * result + (Xcoordinate != null ? Xcoordinate.hashCode() : 0);
        result = 31 * result + (Ycoordinate != null ? Ycoordinate.hashCode() : 0);
        return result;
    }
}
