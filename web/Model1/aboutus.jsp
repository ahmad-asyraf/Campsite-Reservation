<%-- 
    Document   : aboutus
    Created on : 22 Jun 2022, 10:20:02 pm
    Author     : reski
--%>

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
    </body>
    <body><br><br><br><br><br><br><br><br>
    <center><img src="../images/tent.png"style="height: 50rem; width: auto;"></center>

    <h1 style="text-align:center;">About Us</h1>

    <br>

    <div class="content">
        <h2 style="text-align:center;">Go where you feel most alive.</h2>
    </div>
    <br>

    <div class="content">
        <h2 style="text-align:center;">Camp It is a hidden gem surrounded by lush green fields - 
            this 15-acre eco farm in Hulu Selangor offers a nature experience like no other. 
            <br></h2>
    </div>
    <br>
    <div class="content">
        <h2 style="text-align:center;">People are our customers, the reason of our existence. People are our employees, our greatest asset..</h2>
    </div>

    <script>
        var coll = document.getElementsByClassName("about us");
        var i;

        for (i = 0; i < coll.length; i++) {
            coll[i].addEventListener("click", function () {
                this.classList.toggle("active");
                var content = this.nextElementSibling;
                if (content.style.display === "block") {
                    content.style.display = "none";
                } else {
                    content.style.display = "block";
                }
            });
        }
    </script>
</body>
</html>
