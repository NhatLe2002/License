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
import java.util.ArrayList;
import java.util.List;
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

    public static boolean checkBanAccount(String username) throws SQLException {
        boolean status = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT U.[status]\n"
                        + " FROM [License].[dbo].[User] U\n"
                        + " JOIN [License].[dbo].[Account] A ON U.[accountID] = A.[id]\n"
                        + " WHERE A.[username] = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                rs = stm.executeQuery();
                if (rs.next()) {
                    status = rs.getBoolean("status");
                    if (status == true) {
                        return status;
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
        return status;
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

    public static ArrayList<AccountDTO> getAllAccount() {
        ArrayList<AccountDTO> listAccount = new ArrayList<>();
        try {
            String sql = "select * from Account";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    listAccount.add(new AccountDTO(rs.getInt("id"), rs.getString("username"), rs.getString("password")));
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listAccount;
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

    public static ArrayList<AccountDTO> getAccountStaff() {
        ArrayList<AccountDTO> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select * from Account where id = (select accountID from [User] where [User].role = 3)";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        list.add(new AccountDTO(rs.getInt("id"), rs.getString("username"), rs.getString("password")));
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
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

    public static void main(String[] args) throws SQLException {
        String username = "mentor2";
        boolean check = checkBanAccount(username);
        if (!check) {
            System.out.println("Tài khoản này đã bị chặn");
        } else {
            System.out.println("Tài khoản này hợp lệ ");
        }

        System.out.println(getAccountStaff().size());
        
        System.out.println(getAccount("OkeOke", "123").getId());
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
