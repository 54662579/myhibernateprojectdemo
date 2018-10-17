<%-- 
    Document   : logout
    Created on : 2-Aug-2018, 6:50:01 PM
    Author     : Dev
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
        <title>Logout page</title>
    </head>
    <body class="text-center">
        <h1 class="h3 mb-3 font-weight-normal">Logout Success!</h1>
        <br>
        <a href="<c:out value="${pageContext.request.contextPath}"/>/index.jsp" 
           class="btn btn-primary btn-lg" role="button" aria-pressed="true">Go to Login</a>
    </body>
</html>
