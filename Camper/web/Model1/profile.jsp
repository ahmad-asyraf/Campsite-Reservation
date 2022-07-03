<%-- 
    Document   : queryStudent
    Created on : 5 Jun 2022
    Author     : reski
--%>

<%
    String userSession = (String) session.getAttribute("login");
    if (session.getAttribute("login") == null || session.getAttribute("login") == " ") //check condition unauthorize user not direct access welcome.jsp page
    {
        response.sendRedirect("index.jsp");
    }
    if (userSession != null) {
        ReskiConnection con = new ReskiConnection();

        String sql = "SELECT * FROM login WHERE email='" + userSession + "'";
        Statement stmt = con.getConnection().createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
%>
<%@page import="Model1.util.ReskiConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
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
            <a href="#" class="logo"><i class="fa fa-home"></i>Camp It</a>
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
        <h1 class="text-center h1-header">User Profile</h1>
        <div class="kotak">
            <fieldset>
                <p><label>User ID</label>: <%= rs.getString(1)%></p>
                <p><label>First Name</label>: <%= rs.getString(2)%></p>
                <p><label>Last Name</label>: <%= rs.getString(3)%></p>
                <p><label>Email</label>: <%= rs.getString(4)%></p>
            </fieldset>
        </div>
        <p class="url-back"><a href="booking.jsp">back</a></p>
    </body>
</html>
<%
        }
    }
%>