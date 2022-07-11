<%-- 
    Document   : booking
    Created on : 13 Jun 2022, 7:23:09 pm
    Author     : Asyraf
--%>

<%@page import="model.User" %>
<%@page errorPage="error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Campsite Booking - Model 2</title>
        <meta name="author" content="Asyraf S60494">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/main-style.css">
        <link rel="icon" type="image/png" sizes="16x16" href="<%= request.getContextPath()%>/images/backpack.ico">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <div class="container-fluid">
            <nav class="row navbar bg-light d-block d-sm-none ">
                <div class="website-name">
                    <a href="<%= request.getContextPath()%>/Model2/index.jsp">Campsite</a>
                </div>
            </nav>
            <div class="container pt-5 pb-5">
                <%
                    if (request.getAttribute("theMessage") != null) {
                        String msg = (String) request.getAttribute("theMessage");
                        out.print("<script type='text/javascript'>"
                                + "alert('" + msg + "')"
                                + "</script>");
                    }
                %>
                <h1 class="text-center header-booking d-none d-sm-block">Create Account</h1>
                <form action="<%= request.getContextPath()%>/ControllerServlet" method="POST">
                    <div class="kotak col-md-5 text-center pt-md-5">
                        <div class="form-group d-md-none">
                            <h1>Create Account</h1>
                        </div>
                        <div class="mt-2 mb-2 row">
                            <label class="offset-md-1 col-md-4 col-form-label text-left">First Name</label>
                            <div class="col-md-6">
                                <input type="text" name="fname" class="form-control" pattern="[A-Z a-z]+" maxlength="50" required="on">
                            </div>
                        </div>
                        <div class="mt-2 mb-2 row">
                            <label class="offset-md-1 col-md-4 col-form-label text-left">Last Name</label>
                            <div class="col-md-6">
                                <input type="text" name="lname" class="form-control" pattern="[A-Z a-z]+" maxlength="50" required="on">
                            </div>
                        </div>
                        <div class="mt-2 mb-2 row">
                            <label class="offset-md-1 col-md-4 col-form-label text-left">Contact Number</label>
                            <div class="col-md-6">
                                <input type="text" name="pnumber" class="form-control" pattern="[0-9]{2,3}-[0-9]{7}" placeholder="E.g. 011-1234567" maxlength="11" required>
                            </div>
                        </div>
                        <div class="mt-2 mb-2 row">
                            <label class="offset-md-1 col-md-4 col-form-label text-left">Email</label>
                            <div class="col-md-6">
                                <input type="email" name="email" class="form-control" maxlength="100" required="on">
                            </div>
                        </div>
                        <div class="mt-2 mb-2 row">
                            <label class="offset-md-1 col-md-4 col-form-label text-left">Password</label>
                            <div class="col-md-6">
                                <input type="password" name="password" class="form-control" maxlength="100" required="on">
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="hidden" name="action" value="createAccount">
                            <button type="submit" class="btn btn-primary col-12 col-md-5">Create account</button>
                        </div>
                        <div class="form-group">
                            Already own an account? <a href="<%= request.getContextPath()%>/Model2/login.jsp">Sign in</a>
                        </div>
                    </div>
                </form>    
            </div>
        </div>

        <script src="../js/bootstrap.bundle.min.js"></script>
    </body>
</html>
