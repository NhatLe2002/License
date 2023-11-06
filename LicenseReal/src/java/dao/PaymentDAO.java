/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.PaymentDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import static utils.DBUtils.getConnection;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;

import utils.DBUtils;

/**
 *
 * @author emcua
 */
public class PaymentDAO {

    Connection conn = null;
    PreparedStatement ptm = null;
    ResultSet rs = null;

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

        }
        return check;
    }

    public static ArrayList<PaymentDTO> getPaymentByID(int memberID) {
        ArrayList<PaymentDTO> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [PAYMENT] WHERE memberID = ? ORDER BY id DESC";
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

    public static ArrayList<PaymentDTO> getAllPayment() {
        ArrayList<PaymentDTO> list = new ArrayList<>();
        try {
            String sql = "  SELECT * FROM [PAYMENT] ORDER BY id DESC";
            PreparedStatement ps = getConnection().prepareStatement(sql);
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

    public static ArrayList<PaymentDTO> getPaymentIn1Month(int memberId) {
        ArrayList<PaymentDTO> list = new ArrayList<>();
        try {
            // Tạo một LocalDate
            LocalDate oneMonthAgo = LocalDate.now().minusMonths(1);

            // Chuyển đổi từ LocalDate sang Date
            Date date = java.sql.Date.valueOf(oneMonthAgo);
            String sql = "  SELECT * FROM Payment WHERE create_date >= ? AND create_date <= GETDATE() AND memberID = ? AND status = 1 AND (type = '3regisLearn' OR type = '5regisLearn')";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setDate(1, date);
            ps.setInt(2, memberId);
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

    public static LocalDate getDateMin(int memberId) {
        LocalDate dateRes = null;
        try {
            // Tạo một LocalDate
            LocalDate oneMonthAgo = LocalDate.now().minusMonths(1);

            // Chuyển đổi từ LocalDate sang Date
            Date date = java.sql.Date.valueOf(oneMonthAgo);
            String sql = "SELECT MIN(create_date) FROM Payment WHERE create_date >= ? AND create_date <= GETDATE() AND memberID = ? AND status = 1 AND (type = '3regisLearn' OR type = '5regisLearn')";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setDate(1, date);
            ps.setInt(2, memberId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                dateRes = rs.getDate(1).toLocalDate();
            }
        } catch (Exception e) {
        }
        return dateRes;
    }

    public static boolean updatePayment(int id) {
        boolean check = false;

        try {
            String sql = "UPDATE [Payment] SET status = 1 WHERE id = ? ";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            check = true;

        } catch (Exception e) {

        }
        return check;
    }

    public static boolean deletePayment(int id) {
        boolean check = false;

        try {
            String sql = "DELETE FROM [Payment] WHERE id = ? ";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            check = true;

        } catch (Exception e) {

        }
        return check;
    }

    // public static void main(String[] args) {
//        ArrayList<PaymentDTO> list = getAllPayment();
//        for (PaymentDTO p : list) {
//            System.out.println(p.getPrice());
//
//        }
//        System.out.println(updatePayment(18));
//            System.out.println(p);
//
//        }
//        System.out.println(updatePayment(18));
//        //ArrayList<PaymentDTO> list = new ArrayList<>();
//        list = getPaymentByID(1);
//        for (PaymentDTO payment : list) {
//            boolean status = payment.isStatus();
//            System.out.println("Status: " + status);
//        }
//         == == ==
    //    public static void main(String[] args) {
    //        try {
    //            PaymentDAO dao = new PaymentDAO();
    //            float totalRevenue = 0;
    //            float old_totalRevenue = 0;
    //            LocalDate localDate = LocalDate.now();
    //            int yearNow = localDate.getYear();
    //            int lastYear = yearNow - 1;
    //
    //            ArrayList<PaymentDTO> list = dao.getRevenue();
    //            ArrayList<Integer> dataYearNow = new ArrayList<>();
    //            ArrayList<Integer> dataLastYear = new ArrayList<>();
    //            for (PaymentDTO paymentDTO : list) {
    //
    //                if (paymentDTO.getCreate_date().getYear() == yearNow) {
    //                    totalRevenue += paymentDTO.getPrice();
    //                    dataYearNow.add(Math.round(paymentDTO.getPrice())/1000000);
    ////                    System.out.print(paymentDTO.getCreate_date());
    ////                    System.out.println(paymentDTO.getPrice());
    //                }
    //                if (paymentDTO.getCreate_date().getYear() == lastYear) {
    //                    old_totalRevenue += paymentDTO.getPrice();
    //                    dataLastYear.add(-Math.round(paymentDTO.getPrice())/1000000);
    ////                    System.out.print(paymentDTO.getCreate_date());
    ////                    System.out.println(paymentDTO.getPrice());
    //                }
    //            }
    //            System.out.println(Math.round(totalRevenue));
    //            System.out.println(Math.round(old_totalRevenue));
    //            System.out.println("yearNow: " + yearNow);
    //            for (Integer now : dataYearNow) {
    //                System.out.println(now);
    //            }
    //            System.out.println("lastYear: " + lastYear);
    //            for (Integer last : dataLastYear) {
    //                System.out.println(last);
    //            }
    //
    //        } catch (SQLException ex) {
    //            System.out.println("ERROR: " + ex.getMessage());
    //        }
    //    }
    //    public static void main(String[] args) {
    //        try {
    //            PaymentDAO dao = new PaymentDAO();
    //            ArrayList<PaymentDTO> list = dao.getRevenue();
    //            Set<Integer> uniqueYears = new HashSet<>();
    //
    //            for (PaymentDTO paymentDTO : list) {
    //                Date date = Date.valueOf(paymentDTO.getCreate_date());
    //                Calendar calendar = Calendar.getInstance();
    //                calendar.setTime(date);
    //                int year = calendar.get(Calendar.YEAR);
    //                uniqueYears.add(year);
    //            }
    //
    //            // Chuyển set uniqueYears thành một danh sách để sắp xếp
    //            List<Integer> sortedYears = new ArrayList<>(uniqueYears);
    //
    //            // Sắp xếp danh sách theo thứ tự giảm dần
    //            Collections.sort(sortedYears, Collections.reverseOrder());
    //
    //            System.out.println("Các năm không trùng nhau trong mảng (sắp xếp giảm dần):");
    //            ArrayList<Integer> years = new ArrayList<>();
    //            for (int year : sortedYears) {
    //                years.add(year);
    //            }
    //            System.out.println(years);
    //        } catch (Exception e) {
    //        }
    //    }
    //}
    public ArrayList<PaymentDTO> getRevenue() throws SQLException {
        ArrayList<PaymentDTO> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM Payment WHERE status = 1";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new PaymentDTO(rs.getInt("id"), rs.getFloat("price"), LocalDate.parse(rs.getString("create_date")),
                            rs.getInt("memberID"), rs.getString("type"), rs.getBoolean("status"), rs.getBoolean("cash_type")));
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

    public ArrayList<PaymentDTO> getRevenueByYear(int year) throws SQLException {
        ArrayList<PaymentDTO> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM Payment WHERE status = 1 AND create_date LIKE '%" + year + "%'";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new PaymentDTO(rs.getInt("id"), rs.getFloat("price"), LocalDate.parse(rs.getString("create_date")),
                            rs.getInt("memberID"), rs.getString("type"), rs.getBoolean("status"), rs.getBoolean("cash_type")));
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

    public float compareRevenue(float yearNow, float lastYear) throws SQLException {
        float percent = 0;
        try {
            percent = ((yearNow - lastYear) / lastYear) * 100;
        } catch (Exception e) {
        }
        return percent;
    }

    public ArrayList<PaymentDTO> getAllPaymentByCashType(int year, int cash_type) throws SQLException {
        ArrayList<PaymentDTO> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT *  FROM Payment WHERE status = 1 AND cash_type = " + cash_type + " AND create_date LIKE '%" + year + "%'";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new PaymentDTO(rs.getInt("id"), rs.getFloat("price"), LocalDate.parse(rs.getString("create_date")),
                            rs.getInt("memberID"), rs.getString("type"), rs.getBoolean("status"), rs.getBoolean("cash_type")));
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
//    public void main(String[] args) throws SQLException {
//         ArrayList<PaymentDTO> list = getAllPaymentByCashType(2023, 1);
//         System.out.println(list);
//    }

    public ArrayList<PaymentDTO> getAllPaymentByType(int year) throws SQLException {
        ArrayList<PaymentDTO> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM Payment WHERE status = 1 AND type = 'regisTest' AND create_date LIKE '%" + year + "%'";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new PaymentDTO(rs.getInt("id"), rs.getFloat("price"), LocalDate.parse(rs.getString("create_date")),
                            rs.getInt("memberID"), rs.getString("type"), rs.getBoolean("status"), rs.getBoolean("cash_type")));
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

//    public static void main(String[] args) throws SQLException {
////        int M = 1000000;
////        PaymentDAO dao = new PaymentDAO();
////        LocalDate localDate = LocalDate.now();
////        int yearNow = localDate.getYear();
////        int lastYear = yearNow - 1;
////        ArrayList<PaymentDTO> getAllPaymentByMoney = dao.getAllPaymentByCashType(yearNow, 0);
////        ArrayList<PaymentDTO> getAllPaymentByVNPay = dao.getAllPaymentByCashType(yearNow, 1);
////        float totalMoney = 0, totalVNPay = 0;
////        for (PaymentDTO paymentDTO : getAllPaymentByMoney) {
////            float paymentPrice = paymentDTO.getPrice();
////            totalMoney += paymentPrice;
////        }
////        for (PaymentDTO paymentDTO : getAllPaymentByVNPay) {
////            float paymentPrice = paymentDTO.getPrice();
////            totalVNPay += paymentPrice;
////        }
////        float percentVNPay = (totalVNPay / (totalMoney + totalVNPay)) * 100;
////        float percentMoney = (totalMoney / (totalMoney + totalVNPay)) * 100;
////
////        HashMap<Integer, Float> dataYearVNPay = new HashMap<>();
////        HashMap<Integer, Float> dataYearMoney = new HashMap<>();
////        ArrayList<Integer> dataVNPayYearNow = new ArrayList<>();
////        ArrayList<Integer> dataMoneyLastYear = new ArrayList<>();
////        for (PaymentDTO paymentDTO : getAllPaymentByVNPay) {
////            int paymentYear = paymentDTO.getCreate_date().getYear();
////            int paymentMonth = paymentDTO.getCreate_date().getMonthValue();
////            float paymentPrice = paymentDTO.getPrice();
////
////            if (paymentYear == yearNow) {
////                dataYearVNPay.put(paymentMonth, dataYearVNPay.getOrDefault(paymentMonth, 0f) + paymentPrice);
////            }
////        }
////        for (PaymentDTO paymentDTO : getAllPaymentByMoney) {
////            int paymentYear = paymentDTO.getCreate_date().getYear();
////            int paymentMonth = paymentDTO.getCreate_date().getMonthValue();
////            float paymentPrice = paymentDTO.getPrice();
////
////            if (paymentYear == yearNow) {
////                dataYearMoney.put(paymentMonth, dataYearMoney.getOrDefault(paymentMonth, 0f) + paymentPrice);
////            }
////        }
////
////        for (int month = 0; month <= 12; month++) {
////            int dataVNPayYearNowValue = Math.round(dataYearVNPay.getOrDefault(month, 0f)) / 100000;
////            int dataMoneyLastYearValue = Math.round(dataYearMoney.getOrDefault(month, 0f)) / 100000;
////            dataVNPayYearNow.add(dataVNPayYearNowValue);
////            dataMoneyLastYear.add(dataMoneyLastYearValue);
////        }
////        System.out.println("DataVNPay: " + dataVNPayYearNow);
////        System.out.println("DataMoney: " + dataMoneyLastYear);
//
//        // Tạo một LocalDate
//        LocalDate oneMonthAgo = LocalDate.now().minusMonths(1);
//
//        // Chuyển đổi từ LocalDate sang Date
////        System.out.println(getDateMin(4));
//        for (PaymentDTO integer : getPaymentIn1Month(4)) {
//            System.out.println(integer.getCreate_date());
//        }
//    }
}
