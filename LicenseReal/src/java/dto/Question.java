/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Question {
    private int id;
    private String question_text;
    private String image;
    private boolean question_type;

    public Question() {
    }

    public Question(int id, String question_text, String image, boolean question_type) {
        this.id = id;
        this.question_text = question_text;
        this.image = image;
        this.question_type = question_type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQuestion_text() {
        return question_text;
    }

    public void setQuestion_text(String question_text) {
        this.question_text = question_text;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean isQuestion_type() {
        return question_type;
    }

    public void setQuestion_type(boolean question_type) {
        this.question_type = question_type;
    }
 
}