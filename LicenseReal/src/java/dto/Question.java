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
    private String question;
    private String image;
    private ArrayList<Answer> answer;
    private boolean questionType;
    private int topicID;

    public Question() {
    }

    public Question(int id, String question, String image, boolean questionType, ArrayList<Answer> answer) {
        this.id = id;
        this.question = question;
        this.image = image;
        this.answer = answer;
        this.questionType = questionType;
    }

    public Question(int id, String question, String image, ArrayList<Answer> answer, boolean questionType, int topicID) {
        this.id = id;
        this.question = question;
        this.image = image;
        this.answer = answer;
        this.questionType = questionType;
        this.topicID = topicID;
    }

    public Question(int topicID) {
        this.topicID = topicID;
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

    public ArrayList<Answer> getAnswer() {
        return answer;
    }

    public void setAnswer(ArrayList<Answer> answer) {
        this.answer = answer;
    }


    public boolean isQuestionType() {
        return questionType;
    }

    public void setQuestionType(boolean questionType) {
        this.questionType = questionType;
    }

    public int getTopicID() {
        return topicID;
    }

    public void setTopicID(int topicID) {
        this.topicID = topicID;
    }

    @Override
    public String toString() {
        return "Question{" + "id=" + id + ", question=" + question + ", image=" + image + ", answer=" + answer + ", questionType=" + questionType + ", topicID=" + topicID + '}';
    }


}