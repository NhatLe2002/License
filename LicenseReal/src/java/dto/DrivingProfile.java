/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Admin
 */
public class DrivingProfile {
    private int id;
    private String img_cccd;
    private String img_user;
    private int memberID;

    public DrivingProfile() {
    }

    public DrivingProfile(int id, String img_cccd, String img_user, int memberID) {
        this.id = id;
        this.img_cccd = img_cccd;
        this.img_user = img_user;
        this.memberID = memberID;
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
    
}
