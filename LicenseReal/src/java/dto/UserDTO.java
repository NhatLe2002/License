/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.time.LocalDate;


/**
 *
 * @author Admin
 */
public class UserDTO {
    private int id;
    private String name;
    private String phone;
    private String email;
    private LocalDate dob;
    private String cccd;
    private String address;
    private String avatar;
    private int role;
    private boolean status;
    private int accountID;

    public UserDTO() {
    }

    public UserDTO(int id, int accountID) {
        this.id = id;
        this.accountID = accountID;
    }

    

    
    public UserDTO(int id, String name, String phone, String email, String cccd) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.cccd = cccd;
    }
    

    public UserDTO(int id, String name, String phone, String email, LocalDate dob, String cccd, String address, String avatar, int role, boolean status, int accountID) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.dob = dob;
        this.cccd = cccd;
        this.address = address;
        this.avatar = avatar;
        this.role = role;
        this.status = status;
        this.accountID = accountID;
    }

    public UserDTO(int id, String name, String phone, String email, LocalDate dob, String cccd, String address, String avatar, int role, boolean status) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.dob = dob;
        this.cccd = cccd;
        this.address = address;
        this.avatar = avatar;
        this.role = role;
        this.status = status;
    }
        public UserDTO(int id, String name, String phone, String email, LocalDate dob, String cccd, String address) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.dob = dob;
        this.cccd = cccd;
        this.address = address;
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

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    public String getCccd() {
        return cccd;
    }

    public void setCccd(String cccd) {
        this.cccd = cccd;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }
    
}
