package dto;

import dto.User;
import java.time.LocalDate;

public class Member {
    private int id;
    private String health;
    private boolean status;
    private int userID;
    private String name;
    private String phone;
    private String email;
    private LocalDate dob;
    private String cccd;
    private String address;
    private String avatar;
    private int role;

    public Member(int id, String health, boolean status, int userID, String name, String phone, String email, LocalDate dob, String cccd, String address, String avatar, int role) {
        this.id = id;
        this.health = health;
        this.status = status;
        this.userID = userID;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.dob = dob;
        this.cccd = cccd;
        this.address = address;
        this.avatar = avatar;
        this.role = role;
    }



    public Member(int id, User user, String health) {
        this.id = id;
        this.userID = user.getId();
        this.name = user.getName();
        this.phone = user.getPhone();
        this.email = user.getEmail();
        this.dob = user.getDob();
        this.cccd = user.getCccd();
        this.address = user.getAddress();
        this.avatar = user.getAvatar();
        this.role = user.getRole();
        this.status = true;
        this.health = health;
    }

    public Member() {
        
    }

    // Các getter và setter cho các thuộc tính

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHealth() {
        return health;
    }

    public void setHealth(String health) {
        this.health = health;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
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

    @Override
    public String toString() {
        return "Member{" + "id=" + id + ", health=" + health + ", status=" + status + ", userID=" + userID + ", name=" + name + ", phone=" + phone + ", email=" + email + ", dob=" + dob + ", cccd=" + cccd + ", address=" + address + ", avatar=" + avatar + ", role=" + role + '}';
    }


    
}