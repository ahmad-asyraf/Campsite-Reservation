/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Asyraf
 */
public class Camp {
    int campID;
    String category;
    int maxParticipant;
    double pricePerson;
    int maxTent;
    double priceTent;
    String campStatus;
    String hall;
    String pax;

    public int getCampID() {
        return campID;
    }

    public void setCampID(int campID) {
        this.campID = campID;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getMaxParticipant() {
        return maxParticipant;
    }

    public void setMaxParticipant(int maxParticipant) {
        this.maxParticipant = maxParticipant;
    }

    public double getPricePerson() {
        return pricePerson;
    }

    public void setPricePerson(double pricePerson) {
        this.pricePerson = pricePerson;
    }

    public int getMaxTent() {
        return maxTent;
    }

    public void setMaxTent(int maxTent) {
        this.maxTent = maxTent;
    }

    public double getPriceTent() {
        return priceTent;
    }

    public void setPriceTent(double priceTent) {
        this.priceTent = priceTent;
    }

    public String getCampStatus() {
        return campStatus;
    }

    public void setCampStatus(String campStatus) {
        this.campStatus = campStatus;
    }

    public String getHall() {
        return hall;
    }

    public void setHall(String hall) {
        this.hall = hall;
    }

    public String getPax() {
        return pax;
    }

    public void setPax(String pax) {
        this.pax = pax;
    }
}
