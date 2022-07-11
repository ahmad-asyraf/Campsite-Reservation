<%-- 
    Document   : booking-category
    Created on : 20 Jun 2022, 9:47:37 pm
    Author     : Asyraf
--%>
<% 
    //CHECK USER SESSION
    User user = (User)session.getAttribute("userID"); 
    if(user == null) {
        String path = request.getContextPath();
        request.setAttribute("theMessage", "Your session expired! Please Sign in");
        //response.sendRedirect(path + "/Model2/login.jsp");
        request.getRequestDispatcher("/Model2/login.jsp").forward(request, response);
    }
    if(user != null) {
%>
<%@page import="model.User"%>
<%@page import="model.Camp"%>
<%@page import="model.QueryDAO"%>
<%@page errorPage="error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Campsite Booking - Model 2</title>
        <meta name="author" content="Asyraf S60494">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/main-style.css"/>
        <link rel="icon" type="image/png" sizes="16x16" href="<%= request.getContextPath() %>/images/backpack.ico">
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
            Welcome, <%= user.getFname() %>
        </div>
        <div class="account-content">
            <div class="text-center">
                <table class="none-lg pt pb">
                    <tr>
                        <td><img src="../images/Solo-Couple.jpg" class="img-list img-thumbnail" alt="alt"/></td>
                        <td><img src="../images/Family.jpg" class="img-list img-thumbnail" alt="alt"/></td>
                        <td><img src="../images/School-Campground.jpg" class="img-list img-thumbnail" alt="alt"/></td>
                    </tr>
                    <tr>
                        <td><a href="<%= request.getContextPath() %>/ControllerServlet?action=Category&id=1">Solo/Couple Camping</a></td>
                        <td><a href="<%= request.getContextPath() %>/ControllerServlet?action=Category&id=2">Family Camping</a></td>
                        <td><a href="<%= request.getContextPath() %>/ControllerServlet?action=Category&id=3">School Campground</a></td>
                    </tr>
                </table>
                <table class="none-xs pt pb">
                    <tr>
                        <td><img src="../images/Solo-Couple.jpg" class="img-list img-thumbnail" alt="alt"/></td>
                    </tr>
                    <tr>
                        <td><a href="<%= request.getContextPath() %>/ControllerServlet?action=Category&id=1">Solo/Couple Camping</a></td>
                    </tr>
                    <tr>
                        <td><img src="../images/Family.jpg" class="img-list img-thumbnail" alt="alt"/></td>
                    </tr>
                    <tr>
                        <td><a href="<%= request.getContextPath() %>/ControllerServlet?action=Category&id=2">Family Camping</a></td>
                    </tr>
                    <tr>
                        <td><img src="../images/School-Campground.jpg" class="img-list img-thumbnail" alt="alt"/></td>
                    </tr>
                    <tr>
                        <td><a href="<%= request.getContextPath() %>/ControllerServlet?action=Category&id=3">School Campground</a></td>
                    </tr>
                </table>
                <%-- CONFIRM MESSAGE DISPLAY IF UPDATE SUCCESS OR FAIL --%>
                <% 
                    if(request.getAttribute("confirmMessage") != null) {
                        String msg = (String)request.getAttribute("confirmMessage");
                %>
                        <div class="form-group">
                            <%= msg %>
                        </div>
                <%
                    }
                %>
            </div>
        </div>

        <script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
<%  }%>
