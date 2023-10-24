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
public class RatingDTO {

    private int id;
    private int mentorID;
    private int memberID;
    private float star;
    private String description;
    private String mentorName;

    public RatingDTO() {
    }

    public RatingDTO(int id, int mentorID, int memberID, float star, String description) {
        this.id = id;
        this.mentorID = mentorID;
        this.memberID = memberID;
        this.star = star;
        this.description = description;
    }

    
    public RatingDTO(int id, int mentorID, int memberID, int star, String description) {
        this.id = id;
        this.mentorID = mentorID;
        this.memberID = memberID;
        this.star = star;
        this.description = description;
    }

    public RatingDTO(int mentorID, int memberID, int star, String description) {
        this.mentorID = mentorID;
        this.memberID = memberID;
        this.star = star;
        this.description = description;
    }

    public RatingDTO(int id, float star, int memberID, int mentorID) {
        this.id = id;
        this.star = star;
        this.memberID = memberID;
        this.mentorID = mentorID;
    }

    public RatingDTO(int id, int mentorID, int memberID, float star, String description, String mentorName) {
        this.id = id;
        this.mentorID = mentorID;
        this.memberID = memberID;
        this.star = star;
        this.description = description;
        this.mentorName = mentorName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    public int getMentorID() {
        return mentorID;
    }

    public void setMentorID(int mentorID) {
        this.mentorID = mentorID;
    }

    public String getMentorName() {
        return mentorName;
    }

    public void setMentorName(String mentorName) {
        this.mentorName = mentorName;
    }
    
}
