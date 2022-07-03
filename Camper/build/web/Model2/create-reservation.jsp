<%-- 
    Document   : create-booking
    Created on : 14 Jun 2022, 10:13:21 am
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
<%@page import="model.QueryDAO"%>
<%@page errorPage="error.jsp" %>
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
            <div class="kotak-update pt-4 pb-4">
                <form action="<%= request.getContextPath()%>/ControllerServlet" method="POST" onsubmit="return confirm('Confirm with the reservation?');">
                    <% Camp camp = (Camp) request.getAttribute("camp"); %>
                    <div class="form-group header-box">
                        Additional Information
                    </div>
                    <div class="form-group row">
                        <% if (camp.getCampID() == 1) { %>
                        <label class="form-label text-left col-4 offset-md-2 col-md-4 offset-lg-4 col-lg-2">Category</label>
                        <div class="col-8 col-md-4 text-left col-lg-2">
                            <select name="campName" class="form-select">
                                <option disabled="" selected="">Choose Category</option>
                                <option>Solo</option>
                                <option>Couple</option>
                            </select>
                        </div>
                        <%  }
                            if (camp.getCampID() == 2) {%>
                        <label class="form-label text-left col-4 offset-md-2 col-md-4 offset-lg-4 col-lg-2">Category</label>
                        <div class="col-4 col-md-4 text-left col-lg-2">
                            <%= camp.getCategory()%>
                            <input type="hidden" name="campName" class="form-control" value="<%= camp.getCategory()%>" required="on">
                        </div>
                        <%  }
                            if (camp.getCampID() == 3) { %>
                        <label class="form-label text-left col-4 offset-md-2 col-md-4 offset-lg-4 col-lg-2">School Name</label>
                        <div class="col-4 col-md-4 text-left col-lg-2">
                            <input type="text" name="campName" class="form-control" maxlength="100" required="on">
                        </div>
                        <%  }%>
                    </div>
                    <div class="form-group row">
                        <label class="form-label text-left col-4 offset-md-2 col-md-4 offset-lg-4 col-lg-2">Participants</label>
                        <div class="col col-md-4 text-left col-lg-2">
                            <input type="number" name="participant" class="form-control" pattern="[0-9]{1,3}" maxlength="3" min="1" max="<%= camp.getMaxParticipant()%>" required="on">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="form-label text-left col-4 offset-md-2 col-md-4 offset-lg-4 col-lg-2">Date From</label>
                        <div class="col col-md-4 text-left col-lg-2">
                            <input type="date" id="txtDateFrom" name="from" class="form-control" required="on">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="form-label text-left col-4 offset-md-2 col-md-4 offset-lg-4 col-lg-2">Date To</label>
                        <div class="col col-md-4 text-left col-lg-2">
                            <input type="date" id="txtDateTo" name="to" class="form-control" required="on">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="form-label text-left col-4 offset-md-2 col-md-4 offset-lg-4 col-lg-2">Additional Rent</label>
                        <div class="col text-left">
                            <div class="form-check col">
                                <input type="checkbox" name="addition" value="Tent">
                                <label class="text-left"> Tent </label>
                            </div>
                            <div class="form-check col">
                                <input type="checkbox" name="addition" value="Firewoods">
                                <label class="text-left"> Firewoods </label>
                            </div>
                            <div class="form-check col">
                                <input type="checkbox" name="addition" value="Charcoal">
                                <label class="text-left"> Charcoal </label>
                            </div>
                            <div class="form-check col">
                                <input type="checkbox" name="addition" value="Medical Kit">
                                <label class="text-left"> Medical Kit </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group footer-box">
                        <input type="hidden" name="action" value="addReservation">
                        <input type="hidden" name="campID" value="<%= camp.getCampID()%>">
                        <input type="hidden" name="pricePerson" value="<%= camp.getPricePerson()%>">
                        <input type="hidden" name="priceTent" value="<%= camp.getPriceTent()%>">
                        <input type="hidden" name="maxPar" value="<%= camp.getMaxParticipant()%>">
                        <input type="hidden" name="userID" value="<%= user.getId()%>">
                        <button type="submit" class="btn btn-primary col-4 col-md-2">Submit</button>
                        <button type="reset" class="btn btn-light col-4 col-md-2">Cancel</button>
                    </div>
                </form>
                <%-- CONFIRM MESSAGE DISPLAY IF UPDATE SUCCESS OR FAIL --%>
                <%
                    if (request.getAttribute("theMessage") != null) {
                        String msg = (String) request.getAttribute("theMessage");
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script type="text/javascript">
                    $(function () {
                        var today = new Date();

                        var month = today.getMonth() + 1;
                        var day = today.getDate();
                        var year = today.getFullYear();
                        if (month < 10)
                            month = '0' + month.toString();
                        if (day < 10)
                            day = '0' + day.toString();

                        var maxDate = year + '-' + month + '-' + day;

                        //alert(maxDate);
                        $('#txtDateFrom').attr('min', maxDate);
                        $('#txtDateTo').attr('min', maxDate);
                    });
        </script>
    </body>
</html>
<%  }%>