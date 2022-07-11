<%-- 
    Document   : user-update
    Created on : 20 Jun 2022, 5:17:59 pm
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
<%@page import="model.QueryDAO"%>
<%@page errorPage="error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Campsite Booking - Model 2</title>
        <meta name="author" content="Asyraf S60494">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.min.css">
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
            <div class="kotak-update pt-4 pb-4">
                <form action="<%= request.getContextPath()%>/ControllerServlet" method="POST" onsubmit="return confirm('Confirm to update?');">
                    <div class="form-group header-box">
                        Update Profile
                    </div>
                    <div class="form-group row">
                        <label class="form-label text-left col-4 offset-md-2 col-md-4 offset-lg-4 col-lg-2">First Name</label>
                        <div class="col-4 col-md-4 text-left col-lg-2">
                            <input type="text" name="fname" class="form-control" value="<%= user.getFname()%>" pattern="[a-z A-Z]+" maxlength="50" required="on">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="form-label text-left col-4 offset-md-2 col-md-4 offset-lg-4 col-lg-2">Last Name</label>
                        <div class="col-4 col-md-4 text-left col-lg-2">
                            <input type="text" name="lname" class="form-control" value="<%= user.getLname()%>" pattern="[a-zA-Z]+" maxlength="50" required="on">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="form-label text-left col-4 offset-md-2 col-md-4 offset-lg-4 col-lg-2">Contact No</label>
                        <div class="col-4 col-md-4 text-left col-lg-2">
                            <input type="text" name="pnumber" class="form-control" value="<%= user.getPnumber()%>" placeholder="E.g.011-1234567" pattern="[0-9]{2,3}-[0-9]{7}" maxlength="20" required="on">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="form-label text-left col-4 offset-md-2 col-md-4 offset-lg-4 col-lg-2">Email</label>
                        <div class="col-4 col-md-4 text-left col-lg-2">
                            <input type="email" name="email" class="form-control" value="<%= user.getEmail()%>" maxlength="100" required="on">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="form-label text-left col-4 offset-md-2 col-md-4 offset-lg-4 col-lg-2">Password</label>
                        <div class="col-4 col-md-4 text-left col-lg-2">
                            <input type="password" name="password" class="form-control" value="<%= user.getPassword()%>" maxlength="100" required="on">
                        </div>
                    </div>
                    <div class="form-group footer-box">
                        <input type="hidden" name="action" value="updateProfile">
                        <input type="hidden" name="userID" value="<%= user.getId()%>">
                        <button type="submit" class="btn btn-primary col-4 col-md-2" >Save</button>
                        <button type="reset" class="btn btn-light col-4 col-md-2">Cancel</button>
                    </div>
                </form>
                <%-- CONFIRM MESSAGE DISPLAY IF UPDATE SUCCESS OR FAIL --%>
                <%
                    if (request.getAttribute("confirmMessage") != null) {
                        String msg = (String) request.getAttribute("confirmMessage");
                %>
                <div class="form-group">
                    <%= msg%>
                </div>
                <%
                    }
                %>
            </div>
        </div>

        <script src="<%= request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
<%  }%>