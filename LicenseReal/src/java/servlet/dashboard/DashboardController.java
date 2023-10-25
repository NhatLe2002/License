package servlet.dashboard;

import dao.PaymentDAO;
import dao.QuestionDAO;
import dao.ScheduleDAO;
import dao.UserDAO;
import dto.PaymentDTO;
import dto.QuestionDTO;
import dto.ScheduleDTO;
import dto.UserDTO;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DashboardController", urlPatterns = {"/DashboardController"})
public class DashboardController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int M = 1000000;
            PaymentDAO dao = new PaymentDAO();
            HashMap<Integer, Float> dataYearNow = new HashMap<>();
            HashMap<Integer, Float> dataLastYear = new HashMap<>();
            LocalDate localDate = LocalDate.now();
            int yearNow = localDate.getYear();
            int lastYear = yearNow - 1;
            float totalRevenueYearNow = 0, totalRevenueLastYear = 0,
                    totalPaymentVNPayYearNow = 0, totalPaymentMoneyYearNow = 0,
                    totalPaymentVNPayLastYear = 0, totalPaymentMoneyLastYear = 0;
            String action = request.getParameter("action");
            String yearID = request.getParameter("year");

            if (action != null && action.equals("change")) {
                yearNow = Integer.parseInt(yearID);
                lastYear = yearNow - 1;
            }

            // Total revenue and growth chart
            ArrayList<PaymentDTO> listRevenue = dao.getRevenue();
            for (PaymentDTO paymentDTO : listRevenue) {
                int paymentYear = paymentDTO.getCreate_date().getYear();
                int paymentMonth = paymentDTO.getCreate_date().getMonthValue();
                float paymentPrice = paymentDTO.getPrice();

                if (paymentYear == yearNow) {
                    totalRevenueYearNow += paymentPrice;
                    dataYearNow.put(paymentMonth, dataYearNow.getOrDefault(paymentMonth, 0f) + paymentPrice);
                    if (paymentDTO.isCash_type() == true) {
                        totalPaymentVNPayYearNow += paymentPrice;
                    } else {
                        totalPaymentMoneyYearNow += paymentPrice;
                    }
                }
                if (paymentYear == lastYear) {
                    totalRevenueLastYear += paymentPrice;
                    dataLastYear.put(paymentMonth, dataLastYear.getOrDefault(paymentMonth, 0f) + paymentPrice);
                    if (paymentDTO.isCash_type() == true) {
                        totalPaymentVNPayLastYear += paymentPrice;
                    } else {
                        totalPaymentMoneyLastYear += paymentPrice;
                    }
                }
            }
            ArrayList<Integer> dataYearNowList = new ArrayList<>();
            ArrayList<Integer> dataLastYearList = new ArrayList<>();

            for (int month = 1; month <= 12; month++) {
                int dataYearNowValue = Math.round(dataYearNow.getOrDefault(month, 0f)) / M;
                int dataLastYearValue = -Math.round(dataLastYear.getOrDefault(month, 0f)) / M;
                dataYearNowList.add(dataYearNowValue);
                dataLastYearList.add(dataLastYearValue);
            }

            Set<Integer> uniqueYears = new HashSet<>();
            for (PaymentDTO paymentDTO : listRevenue) {
                Date date = Date.valueOf(paymentDTO.getCreate_date());
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(date);
                int year = calendar.get(Calendar.YEAR);
                uniqueYears.add(year);
            }
            List<Integer> sortedYears = new ArrayList<>(uniqueYears);
            Collections.sort(sortedYears, Collections.reverseOrder());
            List<Integer> years = new ArrayList<>(sortedYears);
            float compareRevenue = dao.compareRevenue(Math.round(totalRevenueYearNow) / M, Math.round(totalRevenueLastYear) / M);
            if (lastYear == 2021) {
                compareRevenue = 100;
            }
            request.setAttribute("compareRevenue", Math.round(compareRevenue));
            request.setAttribute("totalRevenueYearNow", Math.round(totalRevenueYearNow) / M);
            request.setAttribute("totalRevenueLastYear", Math.round(totalRevenueLastYear) / M);
            request.setAttribute("yearNow", yearNow);
            request.setAttribute("lastYear", lastYear);
            request.setAttribute("years", years);
            request.setAttribute("listRevenue", listRevenue);
            request.setAttribute("dataYearNow", dataYearNowList);
            request.setAttribute("dataLastYear", dataLastYearList);

            //Orders chart
            ArrayList<PaymentDTO> getAllPaymentByMoney = dao.getAllPaymentByCashType(yearNow, 0);
            ArrayList<PaymentDTO> getAllPaymentByVNPay = dao.getAllPaymentByCashType(yearNow, 1);
            float totalMoney = 0, totalVNPay = 0;
            for (PaymentDTO paymentDTO : getAllPaymentByMoney) {
                float paymentPrice = paymentDTO.getPrice();
                totalMoney += paymentPrice;
            }
            for (PaymentDTO paymentDTO : getAllPaymentByVNPay) {
                float paymentPrice = paymentDTO.getPrice();
                totalVNPay += paymentPrice;
            }
            float percentVNPay = (totalVNPay / (totalMoney + totalVNPay)) * 100;
            float percentMoney = (totalMoney / (totalMoney + totalVNPay)) * 100;

            HashMap<Integer, Float> dataYearVNPay = new HashMap<>();
            HashMap<Integer, Float> dataYearMoney = new HashMap<>();
            ArrayList<Integer> dataVNPayYearNow = new ArrayList<>();
            ArrayList<Integer> dataMoneyYearNow = new ArrayList<>();
            for (PaymentDTO paymentDTO : getAllPaymentByVNPay) {
                int paymentYear = paymentDTO.getCreate_date().getYear();
                int paymentMonth = paymentDTO.getCreate_date().getMonthValue();
                float paymentPrice = paymentDTO.getPrice();

                if (paymentYear == yearNow) {
                    dataYearVNPay.put(paymentMonth, dataYearVNPay.getOrDefault(paymentMonth, 0f) + paymentPrice);
                }
            }
            for (PaymentDTO paymentDTO : getAllPaymentByMoney) {
                int paymentYear = paymentDTO.getCreate_date().getYear();
                int paymentMonth = paymentDTO.getCreate_date().getMonthValue();
                float paymentPrice = paymentDTO.getPrice();

                if (paymentYear == yearNow) {
                    dataYearMoney.put(paymentMonth, dataYearMoney.getOrDefault(paymentMonth, 0f) + paymentPrice);
                }
            }

            for (int month = 0; month <= 12; month++) {
                int dataVNPayYearNowValue = Math.round(dataYearVNPay.getOrDefault(month, 0f)) / M;
                int dataMoneyLastYearValue = Math.round(dataYearMoney.getOrDefault(month, 0f)) / M;
                dataVNPayYearNow.add(dataVNPayYearNowValue);
                dataMoneyYearNow.add(dataMoneyLastYearValue);
            }

            float compareVNPay = ((totalPaymentVNPayYearNow - totalPaymentVNPayLastYear) / totalPaymentVNPayLastYear) * 100;
            float compareMoney = ((totalPaymentMoneyYearNow - totalPaymentMoneyLastYear) / totalPaymentMoneyLastYear) * 100;

            float compareVNPayValue = Math.round(compareVNPay * 100) / 100f;
            float compareMoneyValue = Math.round(compareMoney * 100) / 100f;

            if (lastYear == 2021) {
                compareVNPayValue = 100;
                compareMoneyValue = 100;
            }

            request.setAttribute("compareMoney", compareMoneyValue);
            request.setAttribute("compareVNPay", compareVNPayValue);
            request.setAttribute("dataVNPayYearNow", dataVNPayYearNow);
            request.setAttribute("dataMoneyYearNow", dataMoneyYearNow);
            request.setAttribute("totalMoney", Math.round(totalMoney) / M);
            request.setAttribute("totalVNPay", Math.round(totalVNPay) / M);
            request.setAttribute("percentVNPay", Math.round(percentVNPay));
            request.setAttribute("percentMoney", Math.round(percentMoney));
            request.setAttribute("totalPayment", getAllPaymentByMoney.size() + getAllPaymentByVNPay.size());

            //Total member, mentor, staff and question
            List<UserDTO> member = UserDAO.getListByRole(1);
            List<UserDTO> mentor = UserDAO.getListByRole(2);
            List<UserDTO> staff = UserDAO.getListByRole(3);
            QuestionDAO qdao = new QuestionDAO();
            ArrayList<QuestionDTO> question = qdao.getAllQuestion("1");
            request.setAttribute("member", member.size());
            request.setAttribute("mentor", mentor.size());
            request.setAttribute("staff", staff.size());
            request.setAttribute("question", question.size());

            ScheduleDAO scdao = new ScheduleDAO();
            ArrayList<ScheduleDTO> mentorRevenue = scdao.getAllMentorRevenue(yearNow);
            request.setAttribute("mentorRevenue", mentorRevenue);

            //Driving Profile Chart
            ArrayList<PaymentDTO> getAllPaymentProfile = dao.getAllPaymentByType(yearNow);
            HashMap<Integer, Float> dataPaymentProfile = new HashMap<>();
            ArrayList<Integer> dataPaymentProfileYearNow = new ArrayList<>();
            float totaPaymentProfilel = 0;
            for (PaymentDTO paymentDTO : getAllPaymentByMoney) {
                float paymentPrice = paymentDTO.getPrice();
                totaPaymentProfilel += paymentPrice;
            }
            for (PaymentDTO paymentDTO : getAllPaymentProfile) {
                int paymentYear = paymentDTO.getCreate_date().getYear();
                int paymentMonth = paymentDTO.getCreate_date().getMonthValue();
                float paymentPrice = paymentDTO.getPrice();

                if (paymentYear == yearNow) {
                    dataPaymentProfile.put(paymentMonth, dataPaymentProfile.getOrDefault(paymentMonth, 0f) + paymentPrice);
                }
            }
            for (int month = 1; month <= 12; month++) {
                int dataProfileYearNowValue = Math.round(dataPaymentProfile.getOrDefault(month, 0f)) / M;
                dataPaymentProfileYearNow.add(dataProfileYearNowValue);
            }
            request.setAttribute("totaPaymentProfilel", Math.round(totaPaymentProfilel) / M);
            request.setAttribute("dataPaymentProfileYearNow", dataPaymentProfileYearNow);

            int currentMonth;
            if (yearNow == localDate.getYear()) {
                currentMonth = localDate.getMonthValue();
            } else {
                currentMonth = 13;
            }
            request.setAttribute("currentMonth", currentMonth);
        } catch (Exception e) {
        }
        request.getRequestDispatcher("admin/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
