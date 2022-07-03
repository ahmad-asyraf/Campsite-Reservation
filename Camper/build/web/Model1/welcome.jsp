<%-- 
    Document   : welcome
    Created on : 5 Jun 2022, 11:02:48 pm
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
<%@page import="java.sql.*"%>
<%@page import="Model1.util.ReskiConnection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Campsite Reservation - Model 1</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/main.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/login-register.css">
        <link rel="icon" type="image/png" sizes="16x16" href="<%= request.getContextPath() %>/images/backpack.ico">
    </head>
    <body>
        <ul>
            <li><h1>Campsite Reservation</h1></li>
        </ul>
        <div class="main-content">
            <center>
                <h1> Welcome, <%= rs.getString(2) + " " + rs.getString(3) %> </h1>
                <a href="booking.jsp"><button class="btn btn-continue" type="submit" >Continue</button></a>
                <a href="logout.jsp"><button class="btn btn-logout" type="submit" >Logout</button></a>
            </center>
        </div>
    </body>
</html>
<%      }
    }
%>