/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.time.LocalDate;
import java.time.Period;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author emcua
 */
public class Util {

    public static boolean validateAllDigits(String input) {
        for (int i = 0; i < input.length(); i++) {
            if (!Character.isDigit(input.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean validateEmail(String email) {
        String regex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    public static boolean validateNotFutureDate(LocalDate date) {
        LocalDate currentDate = LocalDate.now();
        return !date.isAfter(currentDate);
    }

    public static boolean validateAge(LocalDate birthDate) {
        LocalDate currentDate = LocalDate.now();
        Period age = Period.between(birthDate, currentDate);
        return age.getYears() >= 18;
    }

    public static String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            String truncatedHash = bytesToHex(hash).substring(0, 40); // Take the first 40 characters
            return truncatedHash;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    private static String bytesToHex(byte[] bytes) {
        StringBuilder result = new StringBuilder();
        for (byte b : bytes) {
            result.append(String.format("%02x", b));
        }
        return result.toString();
    }

    public static boolean validateUsername(String username) {
        if (username == null || username.isEmpty()) {
            return false; // Empty username
        }

        for (char c : username.toCharArray()) {
            if (Character.isWhitespace(c)) {
                return false; // Username contains whitespace
            }
        }

        return true; // Username is valid
    }

    public static void sendEmail(String receiveEmail, String OTP) {
        final String PASSWORD = "tynomtmftulrxqoz";
        final String EMAIL = "groupswp3@gmail.com";
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL, PASSWORD); //To change body of generated methods, choose Tools | Templates.
            }
        };
        Session session = Session.getInstance(props, auth);
        MimeMessage msg = new MimeMessage(session);
        try {
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.addHeader(EMAIL, EMAIL);
            msg.setFrom(EMAIL);
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiveEmail, false));
            msg.setSubject("Lấy lại mật khẩu","UTF-8");
            msg.setText("Đây là mã OTP để lấy lại mật khẩu : " + OTP,"UTF-8");
            Transport.send(msg);
        } catch (Exception e) {
        }

    }

}
