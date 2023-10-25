/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import utils.DBUtils;
import dto.AccountDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.Util;

/**
 *
 * @author emcua
 */
public class AccountDAO extends DBUtils {

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

    public static boolean checkBanAccount(String username, String password) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT M.[status]\n"
                        + "FROM [License].[dbo].[Member] M\n"
                        + "JOIN [License].[dbo].[User] U ON M.[userID] = U.[id]\n"
                        + "JOIN [License].[dbo].[Account] A ON U.[accountID] = A.[id]\n"
                        + "WHERE A.[username] = ? AND A.[password] = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    boolean status = rs.getBoolean("status");
                    if (status == true) {
                        result = true;
                    } else {
                        result = false;
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            };
            if (conn != null) {
                conn.close();
            };

        }
        return result;
    }

    public static AccountDTO getAccount(String username, String password) {
        AccountDTO account = new AccountDTO();
        String hashPassword = Util.hashPassword(password);
        try {
            String sql = "select * from Account where userName = ? and password = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, hashPassword);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return account = new AccountDTO(rs.getInt("id"), username, password);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static AccountDTO getAccountById(int id) {
        AccountDTO account = new AccountDTO();
        try {
            String sql = "select * from Account where id = ? ";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return account = new AccountDTO(rs.getInt("id"), rs.getString("username"), rs.getString("password"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static boolean changePassword(int id, String newPassword) {
        boolean check = false;
        String hashPassword = Util.hashPassword(newPassword);
        try {
            if (getAccountById(id) == null) {
                return check = false;
            } else {
                String sql = "UPDATE [Account] SET password = ? WHERE id = ? ";
                PreparedStatement ps = getConnection().prepareStatement(sql);
                ps.setString(1, hashPassword);
                ps.setInt(2, id);
                ps.executeUpdate();
                check = true;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return check;
    }

    public static int getAccountID(String username) {
        int id = -1;
        try {
            String sql = "select * from Account where username = ? ";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("id");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return id;
    }

    public static void main(String[] args) {

        String username = "user1";
        String password = "123";

        try {
            boolean isBanned = checkBanAccount(username, password);
            if (isBanned) {
                System.out.println("Account is banned. Cannot login.");
            } else {
                System.out.println("Account is not banned. Login successful.");
            }
        } catch (SQLException e) {
            System.out.println("An error occurred while checking account ban status: " + e.getMessage());
        }
//        System.out.println(getAccount("anh123", "666").getId());
    }
//    public static boolean changePassword(int id, String newPassword) {
//    boolean check = false;
//    try {
//        String sql = "UPDATE [AccountDTO] SET password = ? WHERE id = ? ";
//        PreparedStatement ps = getConnection().prepareStatement(sql);
//        ps.setString(1, newPassword);
//        ps.setInt(2, id);
//        int row = ps.executeUpdate();
//        if (row > 0) {
//            check = true;
//        }
//    } catch (Exception e) {
//        System.out.println(e);
//    }
//    return check;
//}
}
