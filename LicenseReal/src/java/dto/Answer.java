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
public class Answer {
    private int answerID;
    private int questionID;
    private String options;
    private String answer;
    private boolean isCorrect;

    public Answer() {
    }

    public Answer(int answerID, int questionID, String options, boolean isCorrect) {
        this.answerID = answerID;
        this.questionID = questionID;
        this.options = options;
        this.isCorrect = isCorrect;
    }

    public Answer(int questionID, String options, String answer, boolean isCorrect) {
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

    public String getOptions() {
        return options;
    }

    public void setOptions(String options) {
        this.options = options;
    }

    public boolean isIsCorrect() {
        return isCorrect;
    }

    public void setIsCorrect(boolean isCorrect) {
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