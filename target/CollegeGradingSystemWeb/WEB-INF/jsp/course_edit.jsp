<%-- 
    Document   : course_edit
    Created on : 31-Jul-2018, 2:34:48 PM
    Author     : Dev
--%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page import="model.Student"%>
<%@ page session="false" %>
<html>
    <head>
        <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
        <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
        <title>Edit Course</title>
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
                                <h4>Edit Course</h4></li>
                        </ol>
                    </nav>
                    ${msg}
                    <c:url var="updateAction" value="/course/edit/update" ></c:url>
                    <form:form action="${updateAction}" commandName="course" method="Post">
                        <form:input type="hidden" path="id"/>
                        <form:label path="courseName">
                            <spring:message text="Course Name"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="courseName"/>
                        <form:label path="courseDes">
                            <spring:message text="Course Description"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="courseDes"/>
                        <form:label path="courseCode">
                            <spring:message text="Course Code"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="courseCode"/>
                        <form:label path="creditNumber">
                            <spring:message text="Credit Number"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="creditNumber"/>
                        <p></p>
                        <input class="btn btn-primary btn-block" type="submit" value="Update">
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>
