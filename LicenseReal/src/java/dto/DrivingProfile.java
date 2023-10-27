/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import dto.MemberDTO;
import java.time.LocalDate;

/**
 *
 * @author Admin
 */
public class DrivingProfile {

    private int id;
    private String img_cccd;
    private String img_user;
    private int memberID;
    private String name;
    private String phone;
    private String email;
    private String cccd;
    private LocalDate dob;
    private String address;
    private String health;
    private boolean gender;
    private boolean flag;
    private boolean status;

    public DrivingProfile() {
    }

    public DrivingProfile(int id, String img_cccd, String img_user, int memberID, boolean status) {
        this.id = id;
        this.img_cccd = img_cccd;
        this.img_user = img_user;
        this.memberID = memberID;
        this.status = status;
    }

    public DrivingProfile(MemberDTO member, String img_cccd, String img_user, boolean gender, boolean flag, boolean status) {
        this.name = member.getName();
        this.phone = member.getPhone();
        this.email = member.getEmail();
        this.cccd = member.getCccd();
        this.address = member.getAddress();
        this.dob = member.getDob();
        this.health = member.getHealth();
        this.img_cccd = img_cccd;
        this.img_user = img_user;
        this.gender = gender;
        this.flag = flag;
        this.status = status;
    }
        public DrivingProfile(MemberDTO member, String img_cccd, String img_user, boolean gender) {
        this.name = member.getName();
        this.phone = member.getPhone();
        this.email = member.getEmail();
        this.cccd = member.getCccd();
        this.address = member.getAddress();
        this.dob = member.getDob();
        this.health = member.getHealth();
        this.img_cccd = img_cccd;
        this.img_user = img_user;
        this.gender = gender;
    }

    public DrivingProfile(MemberDTO member, int memberID, String img_user, boolean gender, boolean flag, boolean status) {
        this.memberID = memberID;
        this.name = member.getName();
        this.phone = member.getPhone();
        this.email = member.getEmail();
        this.cccd = member.getCccd();
        this.img_user = img_user;
        this.gender = gender;
        this.flag = flag;
        this.status = status;
    }

    public LocalDate getDob() {
        return dob;
    }

    public String getHealth() {
        return health;
    }

    public void setHealth(String health) {
        this.health = health;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg_cccd() {
        return img_cccd;
    }

    public void setImg_cccd(String img_cccd) {
        this.img_cccd = img_cccd;
    }

    public String getImg_user() {
        return img_user;
    }

    public void setImg_user(String img_user) {
        this.img_user = img_user;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
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

    public String getCccd() {
        return cccd;
    }

    public void setCccd(String cccd) {
        this.cccd = cccd;
    }

//    @Override
//    public String toString() {
//        return "DrivingProfile{" + "id=" + id + ", img_cccd=" + img_cccd + ", img_user=" + img_user + ", memberID=" + memberID + ", name=" + name + ", phone=" + phone + ", email=" + email + ", cccd=" + cccd + ", status=" + status + '}';
//    }
    @Override
    public String toString() {
        return "DrivingProfile{" + " name='" + name + '\''
                + ", phone='" + phone + '\''
                + ", email='" + email + '\''
                + ", cccd='" + cccd + '\''
                + ", imgUser='" + img_user + '\''
                + ", status=" + status
                + '}';
    }

}
