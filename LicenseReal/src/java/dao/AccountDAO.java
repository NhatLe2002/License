/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import utils.DBUtils;
import dto.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author emcua
 */
public class AccountDAO extends DBUtils {

    public static boolean createAccount(String username, String password) {
        boolean check = false;
        try {
            if (getAccount(username, password) == null) {
                String sql = "INSERT INTO Account(username,password)"
                        + "values(?,?)";
                PreparedStatement ps = getConnection().prepareStatement(sql);
                ps.setString(1, username);
                ps.setString(2, password);
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

    public static Account getAccount(String username, String password) {
        Account account = new Account();
        try {
            String sql = "select * from Account where userName = ? and password = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return account = new Account(rs.getInt("id"), username, password);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static Account getAccountById(int id) {
        Account account = new Account();
        try {
            String sql = "select * from Account where id = ? ";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return account = new Account(rs.getInt("id"), rs.getString("username"), rs.getString("password"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static boolean changePassword(int id, String newPassword) {
        boolean check = false;

        try {
            if (getAccountById(id) == null) {
                return check = false;
            } else {
                String sql = "UPDATE [Account] SET password = ? WHERE id = ? ";
                PreparedStatement ps = getConnection().prepareStatement(sql);
                ps.setString(1, newPassword);
                ps.setInt(2, id);
                ps.executeUpdate();
                check = true;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return check;
    }

//    public static boolean changePassword(int id, String newPassword) {
//    boolean check = false;
//    try {
//        String sql = "UPDATE [Account] SET password = ? WHERE id = ? ";
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
    public static void main(String[] args) {
        System.out.println(changePassword(1, "666"));
    }

}
