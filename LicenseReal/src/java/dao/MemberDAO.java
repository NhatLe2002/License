/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.MemberDTO;
import dto.UserDTO;
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
                String sql = "SELECT U.[id], U.[name], U.[phone], U.[email], U.[dob], U.[cccd], U.[address],M.[id] AS memberID, M.[health], M.status\n" +
"                        FROM [User] U \n" +
"                        JOIN [Member] M ON U.id = M.userID \n";
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
                    list.add(new MemberDTO(memberId, userDTO,health, status));
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
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        ArrayList<MemberDTO> list = getAllMember();
        System.out.println(list);
    }

//    public static void main(String[] args) {
//        System.out.println(createAccount(1));
//    }
}
