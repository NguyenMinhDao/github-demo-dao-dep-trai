/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author bcd12
 */
public class Account {

    private String username;
    private String password;
    private int role;
    private String fullname;
    private String phone;
    private String email;
    private String address;

    public Account() {
    }

    public Account(String username) {
        this.username = username;
    }

    public Account(String username, String password, int role, String fullname, String phone, String email, String address) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.fullname = fullname;
        this.phone = phone;
        this.email = email;
        this.address = address;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getUsername() {
        username = username.substring(0, 1).toUpperCase() + username.substring(1);
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
