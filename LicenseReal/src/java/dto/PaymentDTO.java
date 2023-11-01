/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 *
 * @author Admin
 */
public class PaymentDTO   {

    private int id;
    private float price;
    private LocalDate create_date;
    private int memberID;
    private String type;
    private boolean status;
    private boolean cash_type;
    private String memberName;

    public PaymentDTO() {
    }

    public PaymentDTO(int id, float price, LocalDate create_date, int memberID, String type, boolean status, boolean cash_type) {
        this.id = id;
        this.price = price;
        this.create_date = create_date;
        this.memberID = memberID;
        this.type = type;
        this.status = status;
        this.cash_type = cash_type;
    }

    public PaymentDTO(String memberName, float price, LocalDate create_date, int memberID, String type, boolean status, boolean cash_type) {
        this.memberName = memberName;
        this.price = price;
        this.create_date = create_date;
        this.memberID = memberID;
        this.type = type;
        this.status = status;
        this.cash_type = cash_type;
    }

    public PaymentDTO(int id,String memberName, float price, LocalDate create_date, int memberID, String type, boolean status, boolean cash_type) {
        this.memberName = memberName;
        this.price = price;
        this.create_date = create_date;
        this.memberID = memberID;
        this.type = type;
        this.status = status;
        this.cash_type = cash_type;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public LocalDate getCreate_date() {
        return create_date;
    }

    public void setCreate_date(LocalDate create_date) {
        this.create_date = create_date;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public boolean isCash_type() {
        return cash_type;
    }

    public void setCash_type(boolean cash_type) {
        this.cash_type = cash_type;
    }

    @Override
    public String toString() {
        return "PaymentDTO{" + "id=" + id + ", price=" + price + ", create_date=" + create_date + ", memberID=" + memberID + ", type=" + type + ", status=" + status + ", cash_type=" + cash_type + ", memberName=" + memberName + '}';
    }

}
