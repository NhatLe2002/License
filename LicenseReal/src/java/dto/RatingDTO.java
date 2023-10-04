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
    private float star;
    private int memberID;
    private int mentorID;

    public RatingDTO() {
    }

    public RatingDTO(int id, float star, int memberID, int mentorID) {
        this.id = id;
        this.star = star;
        this.memberID = memberID;
        this.mentorID = mentorID;
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

    public void setStar(float star) {
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
    
}
