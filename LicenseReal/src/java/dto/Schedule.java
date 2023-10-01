/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Time;

/**
 *
 * @author Admin
 */
public class Schedule {
    private int id;
    private int type;
    private String day;
    private Time time;
    private int memberID;
    private int mentorID;

    public Schedule() {
    }

    public Schedule(int id, int type, String day, Time time, int memberID, int mentorID) {
        this.id = id;
        this.type = type;
        this.day = day;
        this.time = time;
        this.memberID = memberID;
        this.mentorID = mentorID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
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
