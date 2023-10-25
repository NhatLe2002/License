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
public class MentorDTO {

    private int id;
    private String certificate;
    private String experience;
    private boolean status;
    private int userID;
    private UserDTO user;
    private String name;
    private String phone;
    private String email;
    private LocalDate dob;
    private String cccd;
    private String address;
    private String avatar;
    private int role;

    public MentorDTO() {
    }

    public MentorDTO(int id, String certificate, String experience, boolean status, int userID) {
        this.id = id;
        this.certificate = certificate;
        this.experience = experience;
        this.status = status;
        this.userID = userID;
    }

    public MentorDTO(int id, String certificate, String experience, boolean status, int userID, UserDTO user) {
        this.id = id;
        this.certificate = certificate;
        this.experience = experience;
        this.status = status;
        this.userID = userID;
        this.user = user;
    }

    public MentorDTO(int id, UserDTO user, String certificate, String experience, boolean status) {
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
        this.status = status;
        this.certificate = certificate;
        this.experience = experience;
    }

    public MentorDTO(int id, UserDTO user, String certificate, String experience) {
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
        this.certificate = certificate;
        this.experience = experience;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCertificate() {
        return certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
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

    public UserDTO getUser() {
        return user;
    }

    public void setUser(UserDTO user) {
        this.user = user;
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
        return "MentorDTO{" + "id=" + id + ", certificate=" + certificate + ", experience=" + experience + ", status=" + status + ", userID=" + userID + ", user=" + user + ", name=" + name + ", phone=" + phone + ", email=" + email + ", dob=" + dob + ", cccd=" + cccd + ", address=" + address + ", avatar=" + avatar + ", role=" + role + '}';
    }

    
    
}
