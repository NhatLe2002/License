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
public class QuestionDTO {
    private int id;
    private String question;
    private String image;
    private ArrayList<AnswerDTO> answer;
    private String questionType;
    private int topicID;
    private String name;

    public QuestionDTO() {
    }

    public QuestionDTO(int id, String question, String image, String questionType, ArrayList<AnswerDTO> answer) {
        this.id = id;
        this.question = question;
        this.image = image;
        this.answer = answer;
        this.questionType = questionType;
    }


    public QuestionDTO(int id, String question, String image, ArrayList<AnswerDTO> answer, String questionType, int topicID) {
        this.id = id;
        this.question = question;
        this.image = image;
        this.answer = answer;
        this.questionType = questionType;
        this.topicID = topicID;
    }

    public QuestionDTO(int topicID, String name) {
        this.topicID = topicID;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public ArrayList<AnswerDTO> getAnswer() {
        return answer;
    }

    public void setAnswer(ArrayList<AnswerDTO> answer) {
        this.answer = answer;
    }


    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }

    public int getTopicID() {
        return topicID;
    }

    public void setTopicID(int topicID) {
        this.topicID = topicID;
    }  

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}