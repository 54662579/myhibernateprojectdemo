<%-- 
    Document   : course_form
    Created on : 23-Jul-2018, 1:39:43 PM
    Author     : Dev
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
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
        <title>Add Course</title>
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
                                <h4>Add Course</h4></li>
                        </ol>
                    </nav>
                    ${msg}
                    <c:url var="addAction" value="/course/add" ></c:url>
                    <form:form action="${addAction}" commandName="course" method="Post">
                        <form:label path="courseName">
                            <spring:message text="Course Name"/>
                            
                        </form:label>
                        <form:input class="form-control" type="text" path="courseName" required="required"/>
                        <form:label path="courseDes">
                            <spring:message text="Course Description"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="courseDes" required="required"/>
                        <form:label path="courseCode">
                            <spring:message text="Course Code"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="courseCode" required="required"/>
                        <form:label path="creditNumber">
                            <spring:message text="Credit Number"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="creditNumber" required="required"/>
                        <p></p>
                        <input class="btn btn-primary btn-block" type="submit" value="Add">
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>
