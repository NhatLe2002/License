/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author Admin
 */
public class ScheduleDTO {
    private int id;
    private int mentorID;
    private Integer memberID;
    private Integer type;
    private Date day;
    private int time;
    private MentorDTO mentor;
    private String mentorName;
    private float revenue;

    public ScheduleDTO() {
    }

    public ScheduleDTO(int id, int mentorID, Integer memberID, Integer type, Date day, int time) {
        this.id = id;
        this.mentorID = mentorID;
        this.memberID = memberID;
        this.type = type;
        this.day = day;
        this.time = time;
    }

    public ScheduleDTO(int id, int mentorID, Integer memberID, Integer type, Date day, int time, MentorDTO mentor) {
        this.id = id;
        this.mentorID = mentorID;
        this.memberID = memberID;
        this.type = type;
        this.day = day;
        this.time = time;
        this.mentor = mentor;
    }

    public ScheduleDTO(String mentorName, float revenue) {
        this.mentorName = mentorName;
        this.revenue = revenue;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMentorID() {
        return mentorID;
    }

    public void setMentorID(int mentorID) {
        this.mentorID = mentorID;
    }

    public Integer getMemberID() {
        return memberID;
    }

    public void setMemberID(Integer memberID) {
        this.memberID = memberID;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public MentorDTO getMentor() {
        return mentor;
    }

    public void setMentor(MentorDTO mentor) {
        this.mentor = mentor;
    }

    public String getMentorName() {
        return mentorName;
    }

    public void setMentorName(String mentorName) {
        this.mentorName = mentorName;
    }

    public float getRevenue() {
        return revenue;
    }

    public void setRevenue(float revenue) {
        this.revenue = revenue;
    }

    
}
