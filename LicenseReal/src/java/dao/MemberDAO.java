/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static dao.AccountDAO.getAccount;
import dto.MemberDTO;
import dto.MentorDTO;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.DBUtils;
import static utils.DBUtils.getConnection;
import utils.Util;

/**
 *
 * @author Admin
 */
public class MemberDAO {

    public static MemberDTO getMemberByUserID(int id) {
        MemberDTO member = new MemberDTO();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select * from Member where userID = ?";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int idMember = rs.getInt(1);
                        String health = rs.getString(2);
                        boolean status = rs.getBoolean(3);
                        int userID = rs.getInt(4);
                        member = new MemberDTO(idMember, health, status, userID);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return member;
    }

    public static boolean createMember(int userID) {
        boolean check = false;
        try {

            String sql = "INSERT INTO Member(status,userID)"
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

    public static ArrayList<MemberDTO> getAllMember() throws SQLException, ClassNotFoundException {
        ArrayList<MemberDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        conn = DBUtils.getConnection();
        try {
            if (conn != null) {
                String sql = "SELECT U.[id], U.[name], U.[phone], U.[email], U.[dob], U.[cccd], U.[address],M.[id] AS memberID, M.[health],U.status\n"
                        + "                        FROM [User] U \n"
                        + "                        JOIN [Member] M ON U.id = M.userID \n";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int memberId = rs.getInt("memberID");
                    int userId = rs.getInt("id");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String cccd = rs.getString("cccd");
                    String health = rs.getString("health");
                    boolean status = rs.getBoolean("status");
                    UserDTO userDTO = new UserDTO(userId, name, phone, email, cccd);
//                    MemberDTO memberDTO = new MemberDTO(memberId, userDTO,health, status);                   
                    list.add(new MemberDTO(memberId, userDTO, health, status));
                }
            }
        } catch (SQLException e) {

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

    public static MemberDTO getNameByMemberID(int id) throws SQLException, ClassNotFoundException {
        MemberDTO member = new MemberDTO();
//        String nameMember = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        conn = DBUtils.getConnection();
        try {
            if (conn != null) {
                String sql = "SELECT U.[id], U.[name], U.[phone], U.[email], U.[dob], U.[cccd], U.[address],M.[id] AS memberID, M.[health],U.status\n"
                        + "                        FROM [User] U \n"
                        + "                        JOIN [Member] M ON U.id = M.userID WHERE M.id = ? \n";
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();

                while (rs.next()) {
                    int memberId = rs.getInt("memberID");
                    int userId = rs.getInt("id");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String cccd = rs.getString("cccd");
                    String health = rs.getString("health");
                    boolean status = rs.getBoolean("status");
                    UserDTO userDTO = new UserDTO(userId, name, phone, email, cccd);
//                    MemberDTO memberDTO = new MemberDTO(memberId, userDTO,health, status);                   
                    member = (new MemberDTO(memberId, userDTO, health, status));
//                    nameMember = member.getName();
                }
            }
        } catch (SQLException e) {

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
        return member;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {

        System.out.println(getNameByMemberID(5));
    }
    // update status member

    public boolean updateStatusMember(String memberID, String status) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        boolean result = false;
        String sql;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (status.equals("1")) {
                    sql = "UPDATE [User]\n"
                            + "SET [User].status = 0\n"
                            + "FROM [User]\n"
                            + "JOIN [Member] ON [User].id = [Member].userID\n"
                            + "WHERE [Member].id = " + memberID;
                } else {
                    sql = "UPDATE [User]\n"
                            + "SET [User].status = 1\n"
                            + "FROM [User]\n"
                            + "JOIN [Member] ON [User].id = [Member].userID\n"
                            + "WHERE [Member].id = " + memberID;
                }
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
        return result;
    }

    public static ArrayList<MentorDTO> getAllMentor() throws SQLException, ClassNotFoundException {
        ArrayList<MentorDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        conn = DBUtils.getConnection();
        try {
            if (conn != null) {
                String sql = "SELECT U.[id], U.[name], U.[phone], U.[email], U.[dob], U.[cccd], U.[address],M.[id] AS mentorID, M.[certificate], M.[experience], U.status\n"
                        + "                        FROM [User] U \n"
                        + "                        JOIN [Mentor] M ON U.id = M.userID \n";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int mentorId = rs.getInt("mentorID");
                    int userId = rs.getInt("id");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String cccd = rs.getString("cccd");
                    String certificate = rs.getString("certificate");
                    String experience = rs.getString("experience");
                    boolean status = rs.getBoolean("status");
                    UserDTO userDTO = new UserDTO(userId, name, phone, email, cccd);
//                    MemberDTO memberDTO = new MemberDTO(memberId, userDTO,health, status);                   
                    list.add(new MentorDTO(mentorId, userDTO, certificate, experience, status));
                }
            }
        } catch (SQLException e) {

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

    public boolean updateStatusMentor(String mentorID, String status) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        boolean result = false;
        String sql;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (status.equals("1")) {
                    sql = "UPDATE [User]\n"
                            + "SET [User].status = 0\n"
                            + "FROM [User]\n"
                            + "JOIN [Mentor] ON [User].id = [Mentor].userID\n"
                            + "WHERE [Mentor].id = " + mentorID;
                } else {
                    sql = "UPDATE [User]\n"
                            + "SET [User].status = 1\n"
                            + "FROM [User]\n"
                            + "JOIN [Mentor] ON [User].id = [Mentor].userID\n"
                            + "WHERE [Mentor].id = " + mentorID;
                }
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
        return result;
    }

    public static boolean createAccount(String username, String password) {

        boolean check = false;
        String hashPassword = Util.hashPassword(password);
        try {
            if (username.equals("")) {
                return check = false;
            }
            if (!Util.validateUsername(username)) {
                return check = false;
            }
            if (getAccount(username, password) == null) {
                String sql = "INSERT INTO Account(username,password)"
                        + "values(?,?)";
                PreparedStatement ps = getConnection().prepareStatement(sql);
                ps.setString(1, username);
                ps.setString(2, hashPassword);
                int row = ps.executeUpdate();
                if (row > 0) {
                    check = true;
                }
            } else {
                check = false;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return check;

    }

//    public static void main(String[] args) {
//        System.out.println(createAccount(1));
//    }
}
