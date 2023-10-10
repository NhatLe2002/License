/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.QuestionDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.DBUtils;

/**
 *
 * @author HP Pro
 */
public class AnswerDAO {

    private Connection conn;
    private PreparedStatement ptm;
    private ResultSet rs;
    
    public boolean insertAnswer(int questionID, String answer_option, String answer, String isCorrect) throws SQLException{
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
               String sql = "INSERT INTO Answer (questionID, answer_options, answer_text, isCorrect, status) VALUES (" + questionID + "," + answer_option + ",N'" + answer + "','" + isCorrect + "',1)";
               ptm = conn.prepareStatement(sql);
               int row = ptm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
                        
            }
        } 
        return false;
    }
    
//    public ArrayList<QuestionDTO> checkAnswer(String questionID, String selectAnswer) throws SQLException{
//        
//    }
    
    public static void main(String[] args) throws SQLException {
        AnswerDAO dao = new AnswerDAO();
        boolean checkInsert = dao.insertAnswer(1, "4", "ABCB\nDBVBS\nskas\ndadhai", "A");
        System.out.println(checkInsert);
    }
}
