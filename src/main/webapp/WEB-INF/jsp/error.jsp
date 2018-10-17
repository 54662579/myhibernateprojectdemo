<%-- 
    Document   : error
    Created on : 20-Jul-2018, 8:12:18 PM
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
        <title>Error Page</title>
    </head>
    <body>
        <h4>Error! Wrong username or password. </h4>
        <a href="<c:out value="${pageContext.request.contextPath}"/>/index.jsp" 
           class="btn btn-primary btn-lg" role="button" aria-pressed="true">Go to Login</a>
    </body>
</html>
