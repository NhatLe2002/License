/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.PaymentDTO;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import static utils.DBUtils.getConnection;
import utils.Util;
import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author emcua
 */
public class PaymentDAO {

    public static boolean createPayment(int memberID, float price, String type, boolean status, boolean cash_type) {

        boolean check = false;

        try {
            LocalDate currentDate = LocalDate.now();
            String sql = "INSERT INTO [Payment] (memberID,price,create_date,type,status,cash_type)"
                    + "values(?,?,?,?,?,?)";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, memberID);
            ps.setFloat(2, price);
            ps.setDate(3, Date.valueOf(currentDate));
            ps.setString(4, type);
            ps.setBoolean(5, status);
            ps.setBoolean(6, cash_type);
            int row = ps.executeUpdate();
            if (row > 0) {
                check = true;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return check;
    }

    public static ArrayList<PaymentDTO> getPaymentByID(int memberID) {
        ArrayList<PaymentDTO> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [PAYMENT] WHERE memberID = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, memberID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                
                list.add(new PaymentDTO(rs.getInt("id"),
                        rs.getFloat("price"), rs.getDate("create_date").toLocalDate(),
                        rs.getInt("memberID"), rs.getString("type"),
                        rs.getBoolean("status"), rs.getBoolean("cash_type")));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        ArrayList<PaymentDTO> list = new ArrayList<>();
        list = getPaymentByID(1);
        for (PaymentDTO payment : list) {
    boolean status = payment.isStatus();
    System.out.println("Status: " + status);
}
       
    }
}
