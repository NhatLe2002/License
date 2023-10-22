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
public class TopicDTO {
    private int id;
    private int topicID;
    private int questionID;
    QuestionDTO list;
    private boolean status;

    public TopicDTO() {
    }

    public TopicDTO(int id, int topicID, int questionID) {
        this.id = id;
        this.topicID = topicID;
        this.questionID = questionID;
    }

    public TopicDTO(int topicID, boolean status) {
        this.topicID = topicID;
        this.status = status;
    }

    public TopicDTO(int id, int questionID) {
        this.id = id;
        this.questionID = questionID;
    }

    public TopicDTO(QuestionDTO list) {
        this.list = list;
    }


    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTopicID() {
        return topicID;
    }

    public void setTopicID(int topicID) {
        this.topicID = topicID;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public QuestionDTO getList() {
        return list;
    }

    public void setList(QuestionDTO list) {
        this.list = list;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
}
