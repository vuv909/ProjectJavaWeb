/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vuv90
 */
public class SuccessfullOrder {
    //ProductName, productimage,Sum(Quantity) as TotalQuantity,productprice
    private String name;
    private String img;
    private int quantity;
    private double price;

    public SuccessfullOrder() {
    }

    public SuccessfullOrder(String name, String img, int quantity, double price) {
        this.name = name;
        this.img = img;
        this.quantity = quantity;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
}
