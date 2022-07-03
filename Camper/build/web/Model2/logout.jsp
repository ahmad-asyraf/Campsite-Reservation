<%-- 
    Document   : logout
    Created on : 14 Jun 2022, 9:55:33 am
    Author     : Asyraf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            session.invalidate();
            request.getRequestDispatcher("/Model2/login.jsp").forward(request, response);
        %>
    </body>
</html>
