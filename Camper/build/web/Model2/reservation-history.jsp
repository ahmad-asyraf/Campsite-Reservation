<%-- 
    Document   : reservation-history
    Created on : 21 Jun 2022, 3:57:21 am
    Author     : Asyraf
--%>
<%
    //CHECK USER SESSION
    User user = (User) session.getAttribute("userID");
    if (user == null) {
        String path = request.getContextPath();
        request.setAttribute("theMessage", "Your session expired! Please Sign in");
        //response.sendRedirect(path + "/Model2/login.jsp");
        request.getRequestDispatcher("/Model2/login.jsp").forward(request, response);
    }
    if (user != null) {
%>
<%@page import="model.User"%>
<%@page import="model.Camp"%>
<%@page import="model.Booking"%>
<%@page errorPage="error.jsp" %>
<%@page import="model.QueryDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Campsite Booking - Model 2</title>
        <meta name="author" content="Asyraf S60494">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-style.css"/>
        <link rel="icon" type="image/png" sizes="16x16" href="<%= request.getContextPath()%>/images/backpack.ico">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Campsite</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    -
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <%-- INCLUDE NAVIGATION BAR --%>
                        <%@include file="navigation-bar.jsp" %>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="user-nav">
            Welcome, <%= user.getFname()%>
        </div>
        <div class="account-content">
            <div class="kotak-profile reservation-history pt-4 pb-4">
                <%-- CONFIRM MESSAGE DISPLAY IF UPDATE SUCCESS OR FAIL --%>
                <%
                    if (request.getAttribute("theMessage") != null) {
                        String msg = (String) request.getAttribute("theMessage");
                %>
                <div class="form-group">
                    <%= msg%>
                </div>
                <%  }%>
                <div class="table-responsive-sm">
                    <table class="table table-reservation">
                        <tr>
                            <th colspan="9" class="theader">Reservation History</th>
                        </tr>
                        <tr>
                            <th>No.</th>
                            <th>Camp Name</th>
                            <th>From</th>
                            <th>To</th>
                            <th>Total Price</th>
                            <th>Reservation Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                        <%
                            ArrayList<Booking> allBooking = (ArrayList) request.getAttribute("allBooking");
                            if (!allBooking.isEmpty()) {
                        %>
                        <tr>
                            <% for (int i = 0; i < allBooking.size(); i++) {%>  
                            <td><%= i + 1%></td>
                            <td><%= allBooking.get(i).getCampName()%></td>
                            <td><%= allBooking.get(i).getFrom()%></td>
                            <td><%= allBooking.get(i).getTo()%></td>
                            <td><fmt:formatNumber type="currency" currencySymbol="RM " value="<%= allBooking.get(i).getTotalPrice()%>"/></td>
                            <td><%= allBooking.get(i).getBookDate()%></td>
                            <c:set var="status" value="<%= allBooking.get(i).getStatus()%>"/>
                            <c:if test="${status == 'Pending'}">
                                <td><span class="status-pending"><%= allBooking.get(i).getStatus()%></span></td>
                                <td>
                                    <a href="<%= request.getContextPath()%>/PaymentServlet?command=loadToPayment&pbookID=<%= allBooking.get(i).getId()%>">
                                        <button class="btn btn-sm btn-primary">Pay</button>
                                    </a>
                                    <a href="<%= request.getContextPath()%>/ControllerServlet?action=delete&bookID=<%= allBooking.get(i).getId()%>" onclick="return confirm('Confirm to delete?');">
                                        <button class="btn btn-sm btn-danger">Delete</button>
                                    </a>
                                </td>
                            </c:if>
                            <c:if test="${status == 'Confirm'}">
                                <td><span class="status-confirm"><%= allBooking.get(i).getStatus()%></span></td>
                                <td>
                                    <button type="button" class="btn btn-sm btn-primary" disabled="on">Pay</button>
                                    <button type="button" class="btn btn-sm btn-danger" disabled>Delete</button>
                                </td>
                            </c:if>
                        </tr>
                        <%      }%>
                        <tr>
                            <th colspan="4" class="tfooter">Total Expense</th>
                                <% int total = (int) request.getAttribute("totalExpense");%>
                            <th class="tfooter"><fmt:formatNumber type="currency" currencySymbol="RM " value="<%= total%>"/></th>
                        </tr>
                        <%  }
                            if (allBooking.isEmpty()) { %>
                        <tr>
                            <td colspan="8">No reservation recorded</td>
                        </tr>
                        <%  }%>
                    </table>
                </div>
            </div>
        </div>

        <script src="<%= request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
<%  }%>