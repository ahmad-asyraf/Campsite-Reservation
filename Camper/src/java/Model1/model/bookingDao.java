/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model1.model;

/**
 *
 * @author USER
 */
import Model1.util.ReskiConnection;
import java.sql.*;

public class bookingDao {
    
    public bookingDao() throws ClassNotFoundException {
        Connection con = ReskiConnection.getConnection();
    }
    
    public int addDetails(booking books) throws ClassNotFoundException {
        int result = 0;
        try {
            Connection con = ReskiConnection.getConnection();
            
            String sql = "INSERT INTO booking(name, guest, category) VALUES(?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, books.getName());
            ps.setString(2, books.getGuest());
            ps.setString(3, books.getCategory());
            
            result = ps.executeUpdate();
            
            con.close();
        }
        catch (SQLException e) { }
        return result;
    }
}