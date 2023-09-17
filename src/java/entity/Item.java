/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author bcd12
 */
public class Item {

    private Product p;
    private int quantity;
    private double subtotal;

    public Item() {
    }

    public Item(Product p, int quantity, double subtotal) {
        this.p = p;
        this.quantity = quantity;
        this.subtotal = subtotal;
    }

    public Product getP() {
        return p;
    }

    public void setP(Product p) {
        this.p = p;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    @Override
    public String toString() {
        return "Item{" + "p=" + p + ", quantity=" + quantity + ", subtotal=" + subtotal + '}';
    }

}
