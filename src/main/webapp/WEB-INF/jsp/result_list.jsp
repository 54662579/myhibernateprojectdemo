<%-- 
    Document   : result_list
    Created on : 31-Jul-2018, 10:50:00 PM
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
        <title>Result List</title>
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
                                <h4>Result List</h4></li>
                        </ol>
                        <table class="table table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Result ID</th>
                                    <th>Student ID</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Course ID</th>
                                    <th>Course Name</th>
                                    <th>Session Number</th>
                                    <th>Mark</th>
                                    <th colspan="2"></th>
                                </tr>
                                <c:forEach items="${resultList}" var="r">
                                    <tr>
                                        <td><c:out value="${r.id}">null</c:out></td>
                                        <td><c:out value="${r.student.id}">null</c:out></td>
                                        <td><c:out value="${r.student.firstName}">null</c:out></td>
                                        <td><c:out value="${r.student.lastName}">null</c:out></td>
                                        <td><c:out value="${r.course.id}">null</c:out></td>
                                        <td><c:out value="${r.course.courseName}">null</c:out></td>
                                        <td><c:out value="${r.sessionNumber}">null</c:out></td>
                                        <td><c:out value="${r.mark}">null</c:out></td>
                                        <td><a href="<c:out value="${pageContext.request.contextPath}"/>/result/edit/${r.id}" 
                                               class="btn btn-primary" role="button" aria-pressed="true">Edit</a></td>
                                        <td><a href="<c:out value="${pageContext.request.contextPath}"/>/result/remove/${r.id}" 
                                               onclick="confirm('Are you sure you want to delete this result?')" 
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
