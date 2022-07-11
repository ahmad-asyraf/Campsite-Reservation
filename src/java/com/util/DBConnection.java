/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.util;

import java.sql.*;

/**
 *
 * @author Asyraf
 */
public class DBConnection implements java.io.Serializable {
    
    private static Connection con;
    
    public static Connection getConnection() {
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            
            //String url = "jdbc:mysql://localhost:3306/s60494_camper_test";
            //con = DriverManager.getConnection(url, "s60494", "FS7OaikZDtrx");
            String url = "jdbc:mysql://localhost:3306/camper";
            con = DriverManager.getConnection(url, "root", "");
        }
        catch(Exception e) {
            e.getMessage();
        }
        return con;
    }
    
    public void closeConnection() {
        
        try {
            con.close();
        }
        catch(Exception e) {
            e.getMessage();
        }
    }
}
