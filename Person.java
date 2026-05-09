package com.grocery.supplier;

public class Person {
    private String name;
    private String email;
    private String phone;

    public Person() {
    }

    public Person(String name, String email, String phone) {
        this.name = name;
        this.email = email;
        this.phone = phone;
    }

    // Encapsulation: getters and setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

	public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
	
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    // This method will be overridden in Supplier class
    public String displayDetails() {
        return "Name: " + name + ", Email: " + email + ", Phone: " + phone;
    }
}
