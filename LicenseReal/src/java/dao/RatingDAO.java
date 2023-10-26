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
import java.util.ArrayList;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class RatingDAO {

    Connection conn = null;
    PreparedStatement ptm = null;
    ResultSet rs = null;

    public static RatingDTO getRatingByMemberAndMentorID(int memberId, int mentorId) {
        RatingDTO rating = null;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "  select * from Rating where memberID = ? and mentorID = ?";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, memberId);
                pst.setInt(2, mentorId);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        int memberID = rs.getInt("memberID");
                        int mentorID = rs.getInt("mentorID");
                        float star = rs.getFloat("star");
                        rating = new RatingDTO(id, star, memberID, mentorID);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return rating;
    }

    public static ArrayList<RatingDTO> getAllRating() {
        ArrayList<RatingDTO> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT * FROM Rating ";

                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        int memberId = rs.getInt("memberID");
                        int mentorID = rs.getInt("mentorID");
                        float star = rs.getFloat("star");
                        RatingDTO rating = new RatingDTO(id, star, memberId, mentorID);
                        list.add(rating);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static ArrayList<RatingDTO> getRatingByMentorID(int ratingId) {
        ArrayList<RatingDTO> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select * from Rating where mentorID = ? and status = 1";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, ratingId);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        int memberId = rs.getInt("memberID");
                        int mentorID = rs.getInt("mentorID");
                        float star = rs.getFloat("star");
                        RatingDTO rating = new RatingDTO(id, star, memberId, mentorID);
                        list.add(rating);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static boolean insertRating(RatingDTO rating) {
        String sql = "  insert into Rating values(?,?,?,?,?)";
        Connection cn = null;
        boolean check = false;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, rating.getMemberID());
                st.setInt(2, rating.getMentorID());
                st.setString(3, rating.getDescription());
                st.setFloat(4, rating.getStar());
                st.setBoolean(5, false);
                st.executeUpdate();
                check = true;
            }
        } catch (Exception e) {

        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        return check;
    }

    public static void main(String[] args) {
//        System.out.println(getRatingByMemberAndMentorID(1, 1) == null);
//        for (RatingDTO rating : getAllRating()) {
//            System.out.println(rating.getStar());
//        }
//        System.out.println(insertRating(new RatingDTO(1, 1, 1, 1)));

        try {
            RatingDAO dao = new RatingDAO();
            ArrayList<RatingDTO> list = dao.getAllRatingAndMentorName();
            for (RatingDTO ratingDTO : list) {
                System.out.println(ratingDTO);
            }
        } catch (Exception e) {
        }
    }

    public ArrayList<RatingDTO> getAllRatingAndMentorName() throws SQLException {
        ArrayList<RatingDTO> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ra.*, us.name FROM Rating AS ra\n"
                        + "JOIN Mentor AS me ON me.id = ra.mentorID\n"
                        + "JOIN [User] AS us ON me.userID = us.id\n"
                        + "WHERE ra.status = 0";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new RatingDTO(rs.getInt("id"), rs.getInt("mentorID"), rs.getInt("memberID"), rs.getFloat("star"), rs.getString("description"), rs.getString("name")));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean acceptFeedback(String feedbackID) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Rating SET status = 1 WHERE id = " + feedbackID;
                ptm = conn.prepareStatement(sql);
                int row = ptm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return false;
    }
    
    public boolean deleteFeedback(String feedbackID) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "DELETE FROM Rating WHERE id = " + feedbackID;
                ptm = conn.prepareStatement(sql);
                int row = ptm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return false;
    }
}
