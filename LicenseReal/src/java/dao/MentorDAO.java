/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.MentorDTO;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class MentorDAO {

    public static MentorDTO getMentorByUserID(int id) {
        MentorDTO mentor = new MentorDTO();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select * from Mentor where userID = ?";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int idMentor = rs.getInt("id");
                        String cer = rs.getString("certificate");
                        String exp = rs.getString("experience");
                        boolean status = rs.getBoolean("status");
                        int userID = id;
                        mentor = new MentorDTO(idMentor, cer, exp, status, userID);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return mentor;
    }

    public static MentorDTO getMentorByID(int id) {
        MentorDTO mentor = new MentorDTO();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select * from Mentor where id = ?";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int idMentor = rs.getInt("id");
                        String cer = rs.getString("certificate");
                        String exp = rs.getString("experience");
                        boolean status = rs.getBoolean("status");
                        int userID = rs.getInt(4);
                        mentor = new MentorDTO(idMentor, cer, exp, status, userID);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return mentor;
    }
    
        public static boolean createMentor(int userID) {
        boolean check = false;
        try {

            String sql = "INSERT INTO Mentor(status,userID)"
                    + "values(1,?)";
            PreparedStatement ps = DBUtils.getConnection().prepareStatement(sql);
            ps.setInt(1, userID);
            int row = ps.executeUpdate();
            if (row > 0) {
                check = true;
            } else {
                check = false;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return check;
    }

    public static MentorDTO getMentorAndUserByMentorID(int id) {
        MentorDTO mentor = new MentorDTO();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select * from [Mentor] join [User] on Mentor.userID = [User].id where [Mentor].id = ?";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {

                        mentor = new MentorDTO(rs.getInt(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getBoolean(4),
                                rs.getInt(5),
                                new UserDTO(rs.getInt(6),
                                        rs.getString(7),
                                        rs.getString(8),
                                        rs.getString(9),
                                        rs.getDate(10).toLocalDate(),
                                        rs.getString(11),
                                        rs.getString(12),
                                        rs.getString(13),
                                        rs.getInt(14),
                                        rs.getBoolean(15),
                                        rs.getInt(16))
                        );
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return mentor;
    }
    public static MentorDTO getMentorAndUserByMentorIDHaveStatus0(int id) {
        MentorDTO mentor = new MentorDTO();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select * from [Mentor] join [User] on Mentor.userID = [User].id where [Mentor].id = ? and [Mentor].status = 1";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {

                        mentor = new MentorDTO(rs.getInt(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getBoolean(4),
                                rs.getInt(5),
                                new UserDTO(rs.getInt(6),
                                        rs.getString(7),
                                        rs.getString(8),
                                        rs.getString(9),
                                        rs.getDate(10).toLocalDate(),
                                        rs.getString(11),
                                        rs.getString(12),
                                        rs.getString(13),
                                        rs.getInt(14),
                                        rs.getBoolean(15),
                                        rs.getInt(16))
                        );
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return mentor;
    }
    public static void main(String[] args) {
        System.out.println(getMentorAndUserByMentorID(ScheduleDAO.getScheduleById(4).getMentorID()).getUser().getEmail());
    }
}
