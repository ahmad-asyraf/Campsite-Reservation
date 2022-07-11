/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Booking;
import model.Camp;
import model.Payment;
import model.QueryDAO;
import model.User;

/**
 *
 * @author Asyraf
 */
public class ControllerServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        try {
            String action = request.getParameter("action");
        
            if(action == null) {
                int uid = 0;

                try {
                    uid = Integer.parseInt(request.getParameter("userID"));
                    if(uid > 0) {
                        action = "LoadUser";
                    }
                }
                catch(Exception e) {
                    e.getMessage();
                }
            }

            switch(action) {
                case "createAccount": //REGISTER USER ACCOUNT
                    createAccount(request, response);
                    break;
                case "userValidation": //CHECK USER LOGIN VALIDATION
                    userValidation(request, response);
                    break;
                case "LoadUser": //VIEW USER DETAILS
                    loadUser(request, response);
                    break;
                case "updateProfile": //UPDATE USER's PROFILE
                    updateUser(request, response);
                    break;
                case "Category": //VIEW CAMP CATEGORY
                    loadCampground(request, response);
                    break;
                case "reservation": //VIEW RESERVATION DETAIL
                    loadReservation(request, response);
                    break;
                case "addReservation": //REGISTER CAMP RESERVATION
                    addReservation(request, response);
                    break;
                case "listReservation": //VIEW USER's RESERVATION RECORDS
                    listReservation(request, response);
                    break;
                case "delete": //VIEW USER's RESERVATION RECORDS
                    deleteReservation(request, response);
                    break;
                default:
            }
        }
        catch(Exception ex) {
            Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    //REGISTER USER ACCOUNT
    protected void createAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String pnum = request.getParameter("pnumber");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        
        User user = new User();
        user.setFname(fname);
        user.setLname(lname);
        user.setPnumber(pnum);
        user.setEmail(email);
        user.setPassword(pass);
        
        QueryDAO qdao = new QueryDAO();
        int result = qdao.createAccount(user);
        if(result > 0) {
            request.setAttribute("theMessage", "Registration successfully.");
            request.getRequestDispatcher("/Model2/login.jsp").forward(request, response);
        }
        else {
            request.setAttribute("theMessage", "Failed to register account! Email " + email + " is already being used.");
            request.getRequestDispatcher("/Model2/create-account.jsp").forward(request, response);
        }
    }
    //CHECK USER LOGIN VALIDATION
    protected void userValidation(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        
        User user = new User();
        user.setEmail(email);
        user.setPassword(pass);
        
        QueryDAO qdao = new QueryDAO();
        int result = qdao.loginValidation(user);
        
        if(result > 0) {
            User user1 = qdao.retrieveOneUserID(user.getId());
            HttpSession session = request.getSession();
            session.setAttribute("userID", user1);
            request.getRequestDispatcher("/Model2/account.jsp").forward(request, response);
        }
        else {
            request.setAttribute("theMessage", "Invalid email or password! Please try again");
            request.getRequestDispatcher("/Model2/login.jsp").forward(request, response);
        }
    }
    
    //VIEW USER DETAILS
    protected void loadUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        String uid = request.getParameter("userID");
        int uids = Integer.parseInt(uid);
        request.setAttribute("userID", uids);
        
        QueryDAO qdao = new QueryDAO();
        User user = qdao.retrieveOneUserID(uids);
        
        if(uids > 0) {
            HttpSession session = request.getSession();
            session.setAttribute("userID", user);
            
            request.getRequestDispatcher("/Model2/user-update.jsp").forward(request, response);
        }
    }
    
    //UPDATE USER's PROFILE
    protected void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String pnum = request.getParameter("pnumber");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        int uid = Integer.parseInt(request.getParameter("userID"));
        
        User user = new User();
        user.setFname(fname);
        user.setLname(lname);
        user.setPnumber(pnum);
        user.setEmail(email);
        user.setPassword(pass);
        user.setId(uid);
        
        QueryDAO qdao = new QueryDAO();
        int result = qdao.updateUser(user);
        
        if(result > 0) {
            request.setAttribute("confirmMessage", "<p class='alert success'>Profile updated successfully.</p>");
            HttpSession session = request.getSession();
            session.setAttribute("userID", user);
            request.getRequestDispatcher("/Model2/account.jsp").forward(request, response);
        }
        else {
            request.setAttribute("confirmMessage", "<p class='alert success'>Failed to update profile.</p>");
            request.getRequestDispatcher("/Model2/account.jsp").forward(request, response);
        }
    }
    
    //VIEW CAMP CATEGORY
    protected void loadCampground(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        String campid = request.getParameter("id");
        int cid = Integer.parseInt(campid);
        
        QueryDAO qdao = new QueryDAO();
        Camp camp = qdao.retrieveCampById(cid);
        
        if(cid > 0) {
            request.setAttribute("camp", camp);
            request.getRequestDispatcher("/Model2/camp-details.jsp").forward(request, response);
        }
        else {
            request.setAttribute("theMessage", "Invalid email or password! Please try again");
            request.getRequestDispatcher("/Model2/login.jsp").forward(request, response);
        }
    }
    
    //VIEW RESERVATION DETAILS
    protected void loadReservation(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        String campid = request.getParameter("id");
        int cid = Integer.parseInt(campid);
        
        QueryDAO qdao = new QueryDAO();
        Camp camp = qdao.retrieveCampById(cid);
        
        if(cid > 0) {
            request.setAttribute("camp", camp);
            request.getRequestDispatcher("/Model2/create-reservation.jsp").forward(request, response);
        }
        else {
            request.setAttribute("theMessage", "<p class='alert warning'>Failed to make a reservation.</p>");
            request.getRequestDispatcher("/Model2/create-reservation.jsp").forward(request, response);
        }
    }
    
    //REGISTER CAMP RESERVATION
    protected void addReservation(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        String campName = request.getParameter("campName");
        int participant = Integer.parseInt(request.getParameter("participant"));
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String add[] = request.getParameterValues("addition");
        int uid = Integer.parseInt(request.getParameter("userID"));
        int campid = Integer.parseInt(request.getParameter("campID"));
        double pricePerson = Double.parseDouble(request.getParameter("pricePerson"));
        double priceTent = Double.parseDouble(request.getParameter("priceTent"));
        int maxPar = Integer.parseInt(request.getParameter("maxPar"));
        double total = 0.00;
        int totalExpense = 0;
        String tAdd = "";
        double totalTent;
        double totalPerson;
        
        //Calculate Days by date
        
        //Calculate Price
        totalTent = ((participant / 4) * priceTent);
        totalPerson = participant * pricePerson;
        total = totalTent + totalPerson;
        
        Booking booking = new Booking();
        booking.setCampName(campName);
        booking.setParticipant(participant);
        booking.setFrom(from);
        booking.setTo(to);
        if(add != null) {
            for(String tempAdd : add) {
                tAdd += tempAdd + ", \n";
            }
        }
        booking.setAddition(tAdd);
        booking.setTotalPrice(total);
        booking.setUserID(uid);
        booking.setCampID(campid);
        
        QueryDAO qdao = new QueryDAO();
        int result = qdao.createBooking(booking);
        List<Booking> allBooking = qdao.retrieveBookingById(uid);
        
        if(result > 0) {
            for(int i = 0; i < allBooking.size(); i++) {
                totalExpense += allBooking.get(i).getTotalPrice();
                request.setAttribute("totalExpense", totalExpense);
            }
            request.setAttribute("allBooking", allBooking);
            request.setAttribute("userID", uid);
            request.setAttribute("theMessage", "<p class='alert success'>Reservation successfully.</p>");
            request.getRequestDispatcher("/Model2/reservation-history.jsp").forward(request, response);
        }
        else {
            request.setAttribute("theMessage", "<p class='alert warning'>Failed to make a reservation.</p>");
            request.getRequestDispatcher("/Model2/create-reservation.jsp").forward(request, response);
        }
    }
    
    //VIEW USER's RESERVATION RECORDS
    protected void listReservation(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        String userid = request.getParameter("userID");
        int uid = Integer.parseInt(userid);
        int totalExpense = 0;
        
        QueryDAO qdao = new QueryDAO();
        List<Booking> allBooking = qdao.retrieveBookingById(uid);
        for(int i = 0; i < allBooking.size(); i++) {
            totalExpense += allBooking.get(i).getTotalPrice();
            request.setAttribute("totalExpense", totalExpense);
        }
        
        request.setAttribute("allBooking", allBooking);
        request.setAttribute("userID", uid);
        request.getRequestDispatcher("/Model2/reservation-history.jsp").forward(request, response);
    }
    
    //DELETE USER's RESERVATION RECORD BY ID
    protected void deleteReservation(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        int bookID = Integer.parseInt(request.getParameter("bookID"));
        
        QueryDAO qdao = new QueryDAO();
        Booking booking = qdao.retrieveOneBooking(bookID);
        
        int uid = booking.getUserID();
        int result = qdao.deleteBooking(bookID);
        
        if(result > 0) {
            request.setAttribute("theMessage", "<p class='success'>The reservation delete successfull</p>");
            request.getRequestDispatcher("/ControllerServlet?action=listReservation&userID=" + uid).forward(request, response);
        }
        else {
            request.setAttribute("theMessage", "<p class='warning'>Failed to delete reservation.</p>");
            request.getRequestDispatcher("/ControllerServlet?action=listReservation&userID=" + uid).forward(request, response);
        }
    }
    
    
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
