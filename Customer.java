package com.grocery.model;

// Base Customer class - Encapsulation with private fields + getters/setters
public class Customer {
    private String customerId;
    private String name;
    private String email;
    private String phone;
    private String address;
    private String password;
    private String customerType; // REGULAR or PREMIUM

    public Customer() {}

    public Customer(String customerId, String name, String email, String phone,
                    String address, String password, String customerType) {
        this.customerId = customerId;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.password = password;
        this.customerType = customerType;
    }

    // Polymorphism - overridden in subclasses
    public double calculateDiscount(double amount) {
        return 0.0; // No discount for base customer
    }

    public String getCustomerId() { return customerId; }
    public void setCustomerId(String customerId) { this.customerId = customerId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getCustomerType() { return customerType; }
    public void setCustomerType(String customerType) { this.customerType = customerType; }

    // Convert to CSV line for file storage
    public String toFileString() {
        return customerId + "|" + name + "|" + email + "|" + phone + "|"
                + address + "|" + password + "|" + customerType;
    }

    // Parse from CSV line
    public static Customer fromFileString(String line) {
        String[] parts = line.split("\\|");
        if (parts.length < 7) return null;
        String type = parts[6];
        if ("PREMIUM".equals(type)) {
            return new PremiumCustomer(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5]);
        } else {
            return new RegularCustomer(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5]);
        }
    }

    @Override
    public String toString() {
        return "Customer{id=" + customerId + ", name=" + name + ", email=" + email + "}";
    }
}
