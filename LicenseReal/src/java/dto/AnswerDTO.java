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
public class AnswerDTO {
    private int answerID;
    private int questionID;
    private int options;
    private String answer;
    private String isCorrect;

    public AnswerDTO() {
    }

    public AnswerDTO(int answerID, int questionID, int options, String isCorrect) {
        this.answerID = answerID;
        this.questionID = questionID;
        this.options = options;
        this.isCorrect = isCorrect;
    }

    public AnswerDTO(int questionID, int options, String answer, String isCorrect) {
        this.questionID = questionID;
        this.options = options;
        this.answer = answer;
        this.isCorrect = isCorrect;
    }

    public int getAnswerID() {
        return answerID;
    }

    public void setAnswerID(int answerID) {
        this.answerID = answerID;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public int getOptions() {
        return options;
    }

    public void setOptions(int options) {
        this.options = options;
    }

    public String getIsCorrect() {
        return isCorrect;
    }

    public void setIsCorrect(String isCorrect) {
        this.isCorrect = isCorrect;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return "Answer{" + "answerID=" + answerID + ", questionID=" + questionID + ", options=" + options + ", answer=" + answer + ", isCorrect=" + isCorrect + '}';
    }

  
    
}