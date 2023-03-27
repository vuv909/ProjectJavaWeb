/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vuv90
 */
public class Order {
    private int id;
    private int accountID;
    private double totalPrice;
    private String note;
    private String createdate;
    private int shippingID;

    public Order() {
    }

    public Order(int id, int accountID, double totalPrice, String note, String createdate, int shippingID) {
        this.id = id;
        this.accountID = accountID;
        this.totalPrice = totalPrice;
        this.note = note;
        this.createdate = createdate;
        this.shippingID = shippingID;
    }
     public Order(int accountID, double totalPrice, String note, String createdate, int shippingID) {
        
        this.accountID = accountID;
        this.totalPrice = totalPrice;
        this.note = note;
        this.createdate = createdate;
        this.shippingID = shippingID;
    }
     public Order(int accountID, double totalPrice, String note,  int shippingID) {
        
        this.accountID = accountID;
        this.totalPrice = totalPrice;
        this.note = note;
        this.shippingID = shippingID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public int getShippingID() {
        return shippingID;
    }

    public void setShippingID(int shippingID) {
        this.shippingID = shippingID;
    }
    
}
