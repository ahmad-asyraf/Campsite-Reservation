<%-- 
    Document   : processMarathon
    Created on : 5 Jun 2022
    Author     : reski
--%>

<%
    String userSession = (String)session.getAttribute("login");
    if (session.getAttribute("login") == null || session.getAttribute("login") == " ") //check condition unauthorize user not direct access welcome.jsp page
    {
        response.sendRedirect("index.jsp");
    }
    if(userSession != null) {
        ReskiConnection con = new ReskiConnection();
        
        String sql = "SELECT * FROM login WHERE email='" + userSession + "'";
        Statement stmt = con.getConnection().createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while(rs.next()) 
        {
%>
<%@page import="Model1.model.bookingDao"%>
<%@page import="Model1.util.ReskiConnection"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Campsite Reservation - Model 1</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/png" sizes="16x16" href="<%= request.getContextPath() %>/images/backpack.ico">
        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

        <!-- custom css file link  -->
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
    </head>
    <body>
        <!-- header section starts  -->
        <header>
            <a href="#" class="logo"><i class="fa fa-book"></i>Camp It</a>
            <div id="menu-bar" class="fas fa-bars"></div>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="profile.jsp">Profile</a></li>
                <li><a href="booking.jsp">Books</a></li>
                <li><a href="aboutus.jsp">About Us</a></li>
                <li><a href="logout.jsp">Logout</a></li> 
            </ul>
        </header>
        <br><br><br><br><br><br><br>
        <h1 class="text-center h1-header">Here your Booking</h1>
        <jsp:useBean id="myMarathon" class="Model1.model.booking" scope="request"/>
        <jsp:setProperty name="myMarathon" property="*"/>
        <%
            int result;
            
            bookingDao md = new bookingDao();

            result = md.addDetails(myMarathon);

            if (result > 0) {
        %>
        <h2 class="text-center">Congrats <%= myMarathon.getName()%> Enjoy your trip</h2>
        <div class="kotak">
            <fieldset>
                <legend>Details</legend>
                <div class="form-group">
                    <label>Name</label>: <%= myMarathon.getName()%>
                </div>
                <div class="form-group">
                    <label>No Person</label>: <%= myMarathon.getGuest()%>
                </div>
                <div class="form-group">
                    <label>Category</label>: <%= myMarathon.getCategory()%>
                </div>
            </fieldset>
        </div>
        <%
            } else {
                out.print("<p class='error'>" + myMarathon.getName() + " already exist!</p>");
            }
            con.closeConnection();
        %>
        <p class="url-back"><a href="booking.jsp">back</a> | &copy;2022 - reski</p>
    </body>
</html>
<%
        }
    }
%>