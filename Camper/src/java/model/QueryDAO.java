/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import com.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Asyraf
 */
public class QueryDAO {
    
    private int result;
    private final Connection con;
    
    public QueryDAO() {
        con = DBConnection.getConnection();
    }
    
    //REGISTER USER
    public int createAccount(User user) {
        
        try {
            String sql = "INSERT INTO users(fName,lName,phoneNo,email,passwords) VALUES(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getFname());
            ps.setString(2, user.getLname());
            ps.setString(3, user.getPnumber());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPassword());
            result = ps.executeUpdate();
        }
        catch(Exception e) {
            e.getMessage();
        }
        return result;
    }
    
    //CHECK USER LOGIN VALIDATION
    public int loginValidation(User user) {
        
        int count = 0;
        try {
            String sql = "SELECT * FROM users WHERE email='" + user.getEmail()
                    + "' AND passwords='" + user.getPassword() + "'";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()) {
                user.setId(rs.getInt(1));
                user.setEmail(rs.getString(5));
                user.setPassword(rs.getString(6));
                count++;
            }
        }
        catch(Exception e) {
            e.getMessage();
        }
        return count;
    }
    
    //RETRIEVE ONE USER USING EMAIL
    public User retrieveOneUser(String email) {
        
        User user = new User();
        try {
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM users WHERE email='" + email + "'";
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()) {
                user.setId(rs.getInt(1));
                user.setFname(rs.getString(2));
                user.setLname(rs.getString(3));
                user.setPnumber(rs.getString(4));
                user.setEmail(rs.getString(5));
                user.setPassword(rs.getString(6));
                user.setRoleid(rs.getInt(7));
            }
        }
        catch(Exception e) {
            e.getMessage();
        }
        return user;
    }
    
    //RETRIEVE ONE USER USING ID
    public User retrieveOneUserID(int id) {
        
        User user = new User();
        try {
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM users WHERE id='" + id + "'";
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()) {
                user.setId(rs.getInt(1));
                user.setFname(rs.getString(2));
                user.setLname(rs.getString(3));
                user.setPnumber(rs.getString(4));
                user.setEmail(rs.getString(5));
                user.setPassword(rs.getString(6));
                user.setRoleid(rs.getInt(7));
            }
        }
        catch(Exception e) {
            e.getMessage();
        }
        return user;
    }
    
    //UPDATE USER PROFILE
    public int updateUser(User user) {
        
        try {
            String sql = "UPDATE users SET fName=?,lName=?,phoneNo=?,email=?,passwords=?"
                    + "WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getFname());
            ps.setString(2, user.getLname());
            ps.setString(3, user.getPnumber());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPassword());
            ps.setInt(6, user.getId());
            result = ps.executeUpdate();
        }
        catch(Exception e) {
            e.getMessage();
        }
        return result;
    }
    
    public Camp retrieveCampById(int id) {
        
        Camp camp = new Camp();
        try {
            String sql = "SELECT * FROM campground WHERE id='" + id + "'";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                camp.setCampID(rs.getInt(1));
                camp.setCategory(rs.getString(2));
                camp.setMaxParticipant(rs.getInt(3));
                camp.setPricePerson(rs.getDouble(4));
                camp.setMaxTent(rs.getInt(5));
                camp.setPriceTent(rs.getDouble(6));
                camp.setCampStatus(rs.getString(7));
                camp.setHall(rs.getString(8));
                camp.setPax(rs.getString(9));
            }
        }
        catch(Exception e) {
            e.getMessage();
        }
        return camp;
    }
    
    //CREATE CAMP BOOKING
    public int createBooking(Booking booking) {
        
        try {
            String sql = "INSERT INTO booking(campName,participant,dateFrom,dateTo,additional,totalprice,userID,campID) "
                    + "VALUES(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, booking.getCampName());
            ps.setInt(2, booking.getParticipant());
            ps.setString(3, booking.getFrom());
            ps.setString(4, booking.getTo());
            ps.setString(5, booking.getAddition());
            ps.setDouble(6, booking.getTotalPrice());
            ps.setInt(7, booking.getUserID());
            ps.setInt(8, booking.getCampID());
            result = ps.executeUpdate();
        }
        catch(Exception e) {
            e.getMessage();
        }
        return result;
    }
    
    //RETRIEVE BOOKING BY USER ID
    public List<Booking> retrieveBookingById(int id) {
        
        List<Booking> bookById = new ArrayList<Booking>();
        Booking booking;
        try {
            String sql = "SELECT * FROM booking WHERE userID='" + id + "' ORDER BY bookDate DESC";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                booking = new Booking();
                booking.setId(rs.getInt(1));
                booking.setCampName(rs.getString(2));
                booking.setParticipant(rs.getInt(3));
                booking.setFrom(rs.getString(4));
                booking.setTo(rs.getString(5));
                booking.setAddition(rs.getString(6));
                booking.setTotalPrice(rs.getDouble(7));
                booking.setUserID(rs.getInt(8));
                booking.setCampID(rs.getInt(9));
                booking.setBookDate(rs.getString(10));
                booking.setStatus(rs.getString(11));
                booking.setBookTime(rs.getString(12));
                bookById.add(booking);
            }
        }
        catch(Exception e) {
            e.getMessage();
        }
        return bookById;
    }
    
    //RETRIEVE ONE BOOKING ID
    public Booking retrieveOneBooking(int id) {
        
        Booking booking = new Booking();
        try {
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM booking WHERE id='" + id + "'";
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                booking.setId(rs.getInt(1));
                booking.setCampName(rs.getString(2));
                booking.setParticipant(rs.getInt(3));
                booking.setFrom(rs.getString(4));
                booking.setTo(rs.getString(5));
                booking.setAddition(rs.getString(6));
                booking.setTotalPrice(rs.getDouble(7));
                booking.setUserID(rs.getInt(8));
                booking.setCampID(rs.getInt(9));
                booking.setBookDate(rs.getString(10));
                booking.setStatus(rs.getString(11));
                booking.setBookTime(rs.getString(12));
            }
        }
        catch(Exception e) {
            e.getMessage();
        }
        return booking;
    }
    
    //DELETE RESERVATION BY USER's ID
    public int deleteBooking(int id) {
        
        try {
            String sql = "DELETE FROM booking WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            result = ps.executeUpdate();
        }
        catch(Exception e) {
            e.getMessage();
        }
        return result;
    }
    
    //CREATE PAYMENT
    public int insertPayment(Payment payment) {
        
        try {
            String sql = "INSERT INTO payment(cardNumber,expDate,cvv,nameCard,userID,bookID)"
                    + "VALUES(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, payment.getCardNumber());
            ps.setString(2, payment.getExpDate());
            ps.setInt(3, payment.getCvv());
            ps.setString(4, payment.getNameCard());
            ps.setInt(5, payment.getUserID());
            ps.setInt(6, payment.getBookID());
            result = ps.executeUpdate();
        }
        catch(Exception e) {
            e.getMessage();
        }
        return result;
    }
    
    //UPDATE BOOKING STATUS
    public int updateStatus(Booking booking) {
        
        try {
            String sql = "UPDATE booking SET status=?"
                    + "WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, booking.getStatus());
            ps.setInt(2, booking.getId());
            result = ps.executeUpdate();
        }
        catch(Exception e) {
            e.getMessage();
        }
        return result;
    }
    
    //CALCULATE TOTAL EXPENSE
    public int calculateExpense(int id) {
        
        Booking booking = new Booking();
        try {
            String sql = "SELECT SUM(totalprice) FROM booking WHERE userID=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDouble(1, booking.getTotalPrice());
            ps.setInt(2, id);
            result = ps.executeUpdate();
        }
        catch(Exception e) {
            e.getMessage();
        }
            return result;
    }
}
