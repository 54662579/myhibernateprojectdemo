<%-- 
    Document   : student_course
    Created on : 1-Aug-2018, 10:05:17 AM
    Author     : Dev
--%><%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
        <title>Add Student to Course</title>
    </head>
    <body>
        <div class="container-fluid">
            <jsp:include page="header.jsp" />
            <div class="row content">
                <div class="col-sm-2 sidenav">
                    <jsp:include page="menutab-drop.jsp" />
                </div>
                <div class="col-sm-10">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active" aria-current="page">
                                <h4>Add Student to Course</h4></li>
                        </ol>
                    </nav>
                    
                    <c:set var="addAction" value="${pageContext.request.contextPath}/student_course/add"/>
                    <form action="${addAction}" method="Post">
                        Select Student
                        <select class="form-control" name="student">
                            <c:forEach items="${studentList}" var="s">
                                <option value="${s.id}">${s.id} ${s.firstName} ${s.lastName}</option>
                            </c:forEach>
                        <select>
                        Select Course
                        <select class="form-control" name="course">
                            <c:forEach items="${courseList}" var="c">
                                <option value="${c.id}">${c.courseName}</option>
                            </c:forEach>
                        <select>
                        <p></p>
                        <input class="btn btn-primary btn-block" type="submit" value="Add">
                    <form>
                </div>
            </div>
        </div>
    </body>
</html>
