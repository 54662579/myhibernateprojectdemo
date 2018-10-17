<%-- 
    Document   : course_list
    Created on : 23-Jul-2018, 1:55:48 PM
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
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />"
        <script src="/resources/js/jquery.min.js"></script>
        <script src="/resources/js/bootstrap.min.js"></script>
        <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
        <title>Course List</title>
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
                                <h4>Course List</h4></li>
                        </ol>
                        <table class="table table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Course ID</th>
                                    <th>Course Name</th>
                                    <th>Course Description</th>
                                    <th>Course Code</th>
                                    <th>Credit Number</th>
                                    <th colspan="3"></th>
                                </tr>
                                <c:forEach var="cList" items="${courseList}">
                                    <tr>
                                        <td><c:out value="${cList.id}">null</c:out></td>
                                        <td><c:out value="${cList.courseName}">null</c:out></td>
                                        <td><c:out value="${cList.courseDes}">null</c:out></td>
                                        <td><c:out value="${cList.courseCode}">null</c:out></td>
                                        <td><c:out value="${cList.creditNumber}">null</c:out></td>
                                        <td><a href="<c:out value="${pageContext.request.contextPath}"/>/course/detail/${cList.id}" 
                                               class="btn btn-primary" role="button" aria-pressed="true">Show Detail</a></td>
                                        <td><a href="<c:out value="${pageContext.request.contextPath}"/>/course/edit/${cList.id}" 
                                               class="btn btn-primary" role="button" aria-pressed="true">Edit</a></td>
                                        <td><a href="<c:out value="${pageContext.request.contextPath}"/>/course/remove/${cList.id}" 
                                               onclick="confirm('Are you sure you want to delete a course?')" 
                                               class="btn btn-primary" role="button" aria-pressed="true">Delete</a></td>
                                    </tr>
                                </c:forEach>
                            </thead>
                        </table>
                    </nav>
                </div>
            </div>
        </div>
    </body>
</html>
