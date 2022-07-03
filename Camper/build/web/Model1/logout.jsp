<%-- 
    Document   : logout
    Created on : 5 Jun 2022, 11:04:04 pm
    Author     : reski
--%>

<% 
session.invalidate(); //destroy session
response.sendRedirect("index.jsp");
%>

