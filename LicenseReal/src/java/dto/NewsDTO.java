/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author Admin
 */
public class NewsDTO {
    private int id;
    private String content;
    private String image;
    private Date date;
    private String title;
    private boolean status;
    private int createby;

    public NewsDTO() {
    }

    public NewsDTO(int id, String content, String image, Date date, String title, boolean status, int createby) {
        this.id = id;
        this.content = content;
        this.image = image;
        this.date = date;
        this.title = title;
        this.status = status;
        this.createby = createby;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getCreateby() {
        return createby;
    }

    public void setCreateby(int createby) {
        this.createby = createby;
    }
    
}
