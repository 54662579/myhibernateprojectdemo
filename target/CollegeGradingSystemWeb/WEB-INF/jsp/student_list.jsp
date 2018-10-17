<%-- 
    Document   : student_list
    Created on : 19-Jul-2018, 8:01:56 PM
    Author     : Dev
--%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false"%>
<html>
    <head>
        <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
        <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
        <title>List of Student</title>
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
                                <h4>List of Students</h4></li>
                        </ol>
                    </nav>
                    <table class="table table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Student ID</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Address</th>
                                <th>City</th>
                                <th>Country</th>
                                <th>Email</th>
                                <th>Major</th>
                                <th colspan="4"></th>
                            </tr>
                        </thead>
                        <c:forEach var="sList" items="${listStudents}" >
                            <tr>
                                <td><c:out value="${sList.id}">null</c:out></td>
                                <td><c:out value="${sList.firstName}">null</c:out></td>
                                <td><c:out value="${sList.lastName}">null</c:out></td>
                                <td><c:out value="${sList.address}">null</c:out></td>
                                <td><c:out value="${sList.city}">null</c:out></td>
                                <td><c:out value="${sList.country}">null</c:out></td>
                                <td><c:out value="${sList.email}">null</c:out></td>
                                <td><c:out value="${sList.major}">null</c:out></td>
                                <td><a href="<c:out value="${pageContext.request.contextPath}"/>/student/detail/${sList.id}" 
                                       class="btn btn-primary" role="button" aria-pressed="true">Show Detail</a></td>
                                <td><a href="<c:out value="${pageContext.request.contextPath}"/>/student/edit/${sList.id}" 
                                       class="btn btn-primary" role="button" aria-pressed="true">Edit</a></td>
                                <td><a href="<c:out value="${pageContext.request.contextPath}"/>/student/remove/${sList.id}"
                                       class="btn btn-primary" role="button" aria-pressed="true"
                                       onclick="confirm('Are you sure you want to delete a student?')">Delete</a></td>
                                <td><a href="<c:out value="${pageContext.request.contextPath}"/>/emailForm/${sList.id}" 
                                       class="btn btn-primary" role="button" aria-pressed="true">Send an Email</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
