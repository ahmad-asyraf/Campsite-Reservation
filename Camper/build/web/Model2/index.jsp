<%-- 
    Document   : index
    Created on : 13 Jun 2022, 5:56:59 pm
    Author     : Asyraf
--%>

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
        <div class="container-fluid">
            <nav class="row navbar bg-light d-block d-sm-none ">
                <div class="website-name">
                    <a href="<%= request.getContextPath()%>/Model2/index.jsp">Campsite</a>
                </div>
            </nav>
            <div class="container pt-5">
                <div class="main-content pt-5">
                    <h1 class="text-center header-name d-none d-sm-block">Campsite Reservation</h1>
                    <h1 class="text-center display-1 pt-5 pb-5 d-md-none">Campsite Reservation</h1>
                    <p class="text-center">
                        <a href="create-account.jsp"><button class="btn btn-light col-6 col-md-2">Book Now</button></a>
                    </p>
                </div>
            </div>
        </div>
    </body>
</html>
