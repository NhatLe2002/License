
import dao.AccountDAO;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author HOANG ANH
 */
public class Test {
    public static void main(String[] args) throws SQLException {
        String username = "user1";
        AccountDAO dao = new AccountDAO();
        boolean check = dao.checkBanAccount(username);
        if (!check) {
            System.out.println("Tài khoản này đã bị chặn");
        } else {
            System.out.println("Tài khoản này ok");
        }
    }
}
