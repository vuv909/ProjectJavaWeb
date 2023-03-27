/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vuv90
 */
public class ShippingAction {

    private int id;
    private String name;
    private int phone;
    private String address;
    private String createdate;
    private String productname;
    private double price;
    private String productimgage;
    private int quantity;
    private String status;

    public ShippingAction() {
    }

    public ShippingAction(int id, String name, int phone, String address, String createdate, String productname, double price, String productimgage, int quantity, String status) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.createdate = createdate;
        this.productname = productname;
        this.price = price;
        this.productimgage = productimgage;
        this.quantity = quantity;
        this.status = status;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getProductimgage() {
        return productimgage;
    }

    public void setProductimgage(String productimgage) {
        this.productimgage = productimgage;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

   

  
 

}
