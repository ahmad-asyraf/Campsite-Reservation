<%-- 
    Document   : home
    Created on : 14 Jun 2022, 8:52:38 pm
    Author     :reski
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Campsite Reservation - Model 1</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
        <link rel="icon" type="image/png" sizes="16x16" href="<%= request.getContextPath()%>/images/backpack.ico">
        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <!-- custom css file link  -->
        <style>
            * {
                box-sizing: border-box
            }
            body {
                font-family: Verdana, sans-serif;
                margin:0
            }
            .mySlides {
                display: none
            }
            img {
                vertical-align: middle;
            }

            /* Slideshow container */
            .slideshow-container {
                max-width: 1000px;
                position: relative;
                margin: auto;
            }

            /* Next & previous buttons */
            .prev, .next {
                cursor: pointer;
                position: absolute;
                top: 50%;
                width: auto;
                padding: 16px;
                margin-top: -22px;
                color: white;
                font-weight: bold;
                font-size: 18px;
                transition: 0.6s ease;
                border-radius: 0 3px 3px 0;
                user-select: none;
            }

            /* Position the "next button" to the right */
            .next {
                right: 0;
                border-radius: 3px 0 0 3px;
            }

            /* On hover, add a black background color with a little bit see-through */
            .prev:hover, .next:hover {
                background-color: rgba(0,0,0,0.8);
            }

            /* Caption text */
            .text {
                color: #f2f2f2;
                font-size: 15px;
                padding: 8px 12px;
                position: absolute;
                bottom: 8px;
                width: 100%;
                text-align: center;
            }

            /* Number text (1/3 etc) */
            .numbertext {
                color: #f2f2f2;
                font-size: 12px;
                padding: 8px 12px;
                position: absolute;
                top: 0;
            }

            /* Fading animation */
            .fade {
                animation-name: fade;
                animation-duration: 1.5s;
            }

            @keyframes fade {
                from {
                    opacity: .4
                }
                to {
                    opacity: 1
                }
            }

            /* On smaller screens, decrease text size */
            @media only screen and (max-width: 300px) {
                .prev, .next,.text {
                    font-size: 11px
                }
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
        </style>
    </head>
    <body>
        <!-- header section starts  -->
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
        <!-- header section ends -->
        <!-- home section starts  -->
        <section class="home" id="home">
            <div class="content">
                <h3>Life Is Best When You’re Camping.</h3>
                <p>Home Is Where You Park It</p>
                <a href="booking.jsp" class="btn">Book now</a>
            </div>
            <div class="slideshow-container">
                <div class="mySlides fade">
                    <div class="numbertext">1 / 3</div>
                    <img src="../images/hiking.png" style="width:100%">
                    <div class="Hiking">Hiking</div>
                </div>
                <div class="mySlides fade">
                    <div class="numbertext">2 / 3</div>
                    <img src="../images/campfire.png" style="width:100%">
                    <div class="Campfire">Campfire</div>
                </div>
                <div class="mySlides fade">
                    <div class="numbertext">3 / 3</div>
                    <img src="../images/tent.png" style="width:100%">
                    <div class="Barbeque">Our campsite</div>
                </div>
                <a class="prev" onclick="plusSlides(-1)">❮</a>
                <a class="next" onclick="plusSlides(1)">❯</a>
            </div><br>
        </section>
        <script>
            let slideIndex = 1;
            showSlides(slideIndex);

            function plusSlides(n) {
                showSlides(slideIndex += n);
            }

            function currentSlide(n) {
                showSlides(slideIndex = n);
            }

            function showSlides(n) {
                let i;
                let slides = document.getElementsByClassName("mySlides");
                let dots = document.getElementsByClassName("dot");
                if (n > slides.length) {
                    slideIndex = 1
                }
                if (n < 1) {
                    slideIndex = slides.length
                }

                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
            }
        </script>
    </body>
</html>
