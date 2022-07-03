<%-- 
    Document   : booking
    Created on : 22 Jun 2022, 10:24:53 pm
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
<%@page import="java.sql.*"%>
<%@page import="Model1.util.ReskiConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Campsite Reservation - Model 1</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/png" sizes="16x16" href="<%= request.getContextPath()%>/images/backpack.ico">
        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

        <!-- custom css file link  -->
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
        <style>
            body{
                height:100%;
                width:100%;
            }
            ul{
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                background-color: #333;
            }

            li {
                float: left;
            }

            li a{
                display: block;
                color: white;
                text-align: center;
                padding: 14px 55px;
                text-decoration: none;
            }

            li a:hover{
                background-color: #111;
            }

            fieldset {
                background-color: #eeeeee;
            }

            legend {
                background-color: gray;
                color: white;
                padding: 5px 10px;
            }

            input {
                margin: 5px;
            }
            .page-section {
                padding: 8rem 0;
            }

        </style>
    <header>
        <a href="home.jsp" class="logo"><i class="fa fa-home"></i>Camp It</a>
        <div id="menu-bar" class="fas fa-bars"></div>
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="profile.jsp">Profile</a></li>
            <li><a href="booking.jsp">Booking</a></li>
            <li><a href="aboutus.jsp">About Us</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </header>
    <section class="page-section" id="page-section">
        <h1 class="text-center h1-header">Please Enter the Booking Form!</h1>
        <div class="kotak">
            <form action="processBooking.jsp">
                <fieldset>
                    <legend>Booking Form</legend><br>
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" placeholder='Enter your name' required=""><br>

                    <label for="guest">No Person</label>
                    <select name="guest" id="guest" required>
                        <option value="" disabled="on" selected="on">Choose no of person</option>
                        <option value="1-3">1-3 persons</option>
                        <option value="3-6">3-5 persons</option>
                        <option value="6-10">6-10 persons</option>
                    </select><br><br>

                    <label for="category">Category</label>
                    <select name="category" id="category" required>
                        <option value="" disabled="on" selected="on">Choose category</option>
                        <option value="Solo camping">Solo Camping</option>
                        <option value="Couple camping">Couple Camping</option>
                        <option value="Family camping">Family Camping</option>
                    </select><br><br>
                    <p>
                        <button class="btn-submit" type="submit"> Submit </button>
                        <button class="btn-reset" type="reset"> Cancel </button>
                    </p>
                </fieldset>
            </form>
        </div>
    </section>
</body>
</html>
<%
        }
    }
%>