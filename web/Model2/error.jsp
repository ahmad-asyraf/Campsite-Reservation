<%-- 
    Document   : error
    Created on : 17 Jun 2022, 6:41:40 pm
    Author     : Asyraf
--%>

<%@page isErrorPage="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Oops! - Error Page</title>
        <meta name="author" content="Asyraf S60494">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/main-style.css"/>
        <link rel="icon" type="image/png" sizes="16x16" href="<%= request.getContextPath() %>/images/backpack.ico">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body class="error-page text-center">
        <h1 class="text-center pt">Oops! There is something not working here.</h1>
        <div class="pt">
            <img src="<%= request.getContextPath() %>/images/cute-bear.gif" alt="cute-bear"/>
        </div>
    </body>
</html>
