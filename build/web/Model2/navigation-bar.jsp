<%-- 
    Document   : navigation-bar
    Created on : 20 Jun 2022, 11:41:58 pm
    Author     : Asyraf
--%>
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="<%= request.getContextPath()%>/Model2/account.jsp">Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%= request.getContextPath()%>/Model2/camp-reservation.jsp">Camp Reservation</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%= request.getContextPath()%>/ControllerServlet?action=listReservation&userID=<%= user.getId()%>">History</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%= request.getContextPath()%>/Model2/logout.jsp">Logout</a>
            </li>