<%-- 
    Document   : payment
    Created on : 23 Jun 2022, 11:47:00 am
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
<%@page import="model.Booking"%>
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
        <div class="user-nav">
            Welcome, <%= user.getFname()%>
        </div>

        <div class="account-content">
            <div class="kotak-update">
                <form action="PaymentServlet" method="POST" onsubmit="return confirm('Confirm payment?');">
                    <% Booking booking = (Booking) request.getAttribute("allBooking");%>
                    <input type="hidden" name="command" value="ADDPAYMENT">
                    <div class="form-group header-box">
                        Card Details
                    </div>
                    <div class="form-group row">
                        <label class="form-label text-left col-4 offset-md-2 col-md-4 offset-lg-4 col-lg-2">Card Number</label>
                        <div class="col col-md-4 text-left col-lg-2">
                            <input type="text" name="cardNumber" class="form-control" id="cc" pattern="[0-9 ]+" placeholder="E.g. 1111 2222 3333 4444" maxlength="19" required="on">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="form-label text-left col-4 offset-md-2 col-md-4 offset-lg-4 col-lg-2">Expiry Date (MM/YY)</label>
                        <div class="col col-md-4 text-left col-lg-2">
                            <input type="text" name="expDate" class="form-control" id="exp" pattern="[0-9]{2}/[0-9]{2}" placeholder="E.g. 06/22" maxlength="5" required="on">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="form-label text-left col-4 offset-md-2 col-md-4 offset-lg-4 col-lg-2">CVV</label>
                        <div class="col col-md-4 text-left col-lg-2">
                            <input type="text" name="cvv" class="form-control" pattern="[0-9]{3}" maxlength="3" placeholder="E.g 123" required="on">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="form-label text-left col-4 offset-md-2 col-md-4 offset-lg-4 col-lg-2">Name on Card</label>
                        <div class="col col-md-4 text-left col-lg-2">
                            <input type="text" name="nameCard" class="form-control" pattern="[a-z A-Z]+" maxlength="100" required="on">
                        </div>
                    </div>
                    <div class="form-group footer-box">
                        <input type="hidden" name="userID" value="<%= booking.getUserID()%>">
                        <input type="hidden" name="bookID" value="<%= booking.getId()%>">
                        <button type="submit" class="btn btn-primary col-4 col-md-2">Pay Now</button>
                        <button type="reset" class="btn btn-light col-4 col-md-2" onclick="window.location.href = '<%= request.getContextPath()%>/ControllerServlet?action=listReservation&userID=<%= user.getId()%>'">Cancel</button>
                    </div>
                </form>
            </div>
        </div>

        <script src="<%= request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            $('#cc').on('keypress', function (e) {
                var val = $(this).val();
                var newval = "";

                val = val.replace(/\s/g, '');

                for (var i = 0; i < val.length; i++) {
                    if (i % 4 === 0 && i > 0)
                        newval = newval.concat(' ');
                    newval = newval.concat(val[i]);
                }
                $(this).val(newval);
            });

            $('#exp').on('keypress change', function () {
                $(this).val(function (index, value) {
                    return value.replace(/\W/gi, '').replace(/(.{2})/, '$1/');
                });
            });
        </script>
    </body>
</html>
<%  }%>