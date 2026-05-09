package com.grocery.supplier;

public class Supplier extends Person {
    private String supplierId;
    private String companyName;
    private String address;
    private String productCategory;

    public Supplier() {
    }

    public Supplier(String supplierId, String name, String companyName, String email,
                    String phone, String address, String productCategory) {

        super(name, email, phone); // Calling parent class constructor

        this.supplierId = supplierId;
        this.companyName = companyName;
        this.address = address;
        this.productCategory = productCategory;
    }

    public String getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(String supplierId) {
        this.supplierId = supplierId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    // This converts supplier object into one text line for file saving
    public String toFileString() {
        return supplierId + "," + getName() + "," + companyName + "," +
                getEmail() + "," + getPhone() + "," + address + "," + productCategory;
    }

    // Polymorphism: overriding parent class method
    @Override
    public String displayDetails() {
        return "Supplier ID: " + supplierId +
                ", Name: " + getName() +
                ", Company: " + companyName +
                ", Category: " + productCategory;
    }
}
