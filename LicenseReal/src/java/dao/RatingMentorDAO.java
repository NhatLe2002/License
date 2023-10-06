/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.RatingDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtils;

/**
 *
 * @author HOANG ANH
 */
public class RatingMentorDAO {

    // tạo rating
    public static boolean createRating(int memberID, int mentorID, String description, int star) throws SQLException, ClassNotFoundException {
        Connection cn = null;
        PreparedStatement stm = null;
        try {
            cn = DBUtils.getConnection();
            String query = "INSERT INTO Rating (memberID, mentorID, description, star) VALUES (" + memberID + ", " + mentorID + ", N'" + description + "', " + star + ")";
            stm = cn.prepareStatement(query);
            int row = stm.executeUpdate();
            if (row > 0) {
                return true;
            }
        } catch (SQLException e) {
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (SQLException e) {
                }
            }
        }
        return false;
    }

    //thống kê các rating 
    public static RatingDTO getRatingByMentorID(int mentorID) throws SQLException, ClassNotFoundException {
        Connection cn = null;
        RatingDTO rating = null;
        try {
            cn = DBUtils.getConnection();
            String query = "SELECT memberID, mentorID, description, star FROM Rating WHERE mentorID = " + mentorID;
            PreparedStatement stm = cn.prepareStatement(query);
            stm.setInt(1, mentorID);
            ResultSet rs = stm.executeQuery();
            rating = new RatingDTO(rs.getInt(1), rs.getInt(2),rs.getInt(3), rs.getString(4));

        }catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return rating;
    }

    public static void main(String[] args) {
    try {
        int mentorID = 1; // Thay đổi mentorID theo nhu cầu
        RatingDTO rating = getRatingByMentorID(mentorID);
        if (rating != null) {
            System.out.println("Rating ID: " + rating.getId());
            System.out.println("Mentor ID: " + rating.getMentorID());
            System.out.println("Student ID: " + rating.getMemberID());
            System.out.println("Comment: " + rating.getDescription());
        } else {
            System.out.println("No rating found for mentor ID: " + mentorID);
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
}
}
