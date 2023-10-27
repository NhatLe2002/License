/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.List;

/**
 *
 * @author Admin
 */
public class TopicDTO {
    private int id;
    private int topicID;
    private int questionID;
    List<QuestionDTO> list;
    private boolean status;
    private int numberOfQuestion;
    private String topicName;
    
    public TopicDTO() {
    }

    public TopicDTO(int id, int topicID, int questionID) {
        this.id = id;
        this.topicID = topicID;
        this.questionID = questionID;
    }

    public TopicDTO(int topicID, String topicName, int numberOfQuestion, boolean status) {
        this.topicID = topicID;
        this.status = status;
        this.topicName = topicName;
        this.numberOfQuestion = numberOfQuestion;
    }

    public TopicDTO(int id, int questionID, String topicName) {
        this.id = id;
        this.questionID = questionID;
        this.topicName = topicName;
    }
    public TopicDTO(int id, int questionID) {
        this.id = id;
        this.questionID = questionID;
    }

    public TopicDTO(List<QuestionDTO> list) {
        this.list = list;
    }

    public TopicDTO(int questionID) {
        this.questionID = questionID;
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

    public List<QuestionDTO> getList() {
        return list;
    }

    public void setList(List<QuestionDTO> list) {
        this.list = list;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getNumberOfQuestion() {
        return numberOfQuestion;
    }

    public void setNumberOfQuestion(int numberOfQuestion) {
        this.numberOfQuestion = numberOfQuestion;
    }

    public String getTopicName() {
        return topicName;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    
    
}
