/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Booking;
import model.Payment;
import model.QueryDAO;

/**
 *
 * @author Asyraf
 */
public class PaymentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
            String action = request.getParameter("command");

            switch(action) {
                case "loadToPayment": //LOAD RESERVATION TO PAYMENT
                    loadToPayment(request, response);
                    break;
                case "ADDPAYMENT": //PROCESS USER's PAYMENT
                    makePayment(request, response);
                    break;
                default:
            }
        }
    
    //LOAD RESERVATION TO PAYMENT
    protected void loadToPayment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        int bookID = Integer.parseInt(request.getParameter("pbookID"));
        
        QueryDAO qdao = new QueryDAO();
        Booking booking = qdao.retrieveOneBooking(bookID);
        
        if(bookID > 0) {
            request.setAttribute("allBooking", booking);
            request.getRequestDispatcher("/Model2/payment.jsp").forward(request, response);
        }
    }
    
    //PROCESS USER's PAYMENT
    protected void makePayment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        String cn = request.getParameter("cardNumber");
        String exp = request.getParameter("expDate");
        int cvv = Integer.parseInt(request.getParameter("cvv"));
        String nc = request.getParameter("nameCard");
        int uid = Integer.parseInt(request.getParameter("userID"));
        int bookID = Integer.parseInt(request.getParameter("bookID"));
        String status = "Confirm";
        
        Payment payment = new Payment();
        payment.setCardNumber(cn);
        payment.setExpDate(exp);
        payment.setCvv(cvv);
        payment.setNameCard(nc);
        payment.setUserID(uid);
        payment.setBookID(bookID);
        
        QueryDAO qdao = new QueryDAO();
        Booking booking = qdao.retrieveOneBooking(bookID);
        booking.setStatus(status);
        int result = qdao.insertPayment(payment);
        
        if(result > 0) {
            qdao.updateStatus(booking);
            request.setAttribute("allBooking", booking);
            request.setAttribute("theMessage", "<p class='success'>Payment process successfull.</p>");
            request.getRequestDispatcher("/ControllerServlet?action=listReservation&userID=" + uid).forward(request, response);
        }
        else {
            request.setAttribute("theMessage", "<p class='error'>Failed to process payment.</p>");
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
