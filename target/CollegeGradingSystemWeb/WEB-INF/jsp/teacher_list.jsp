<%-- 
    Document   : teacher_list
    Created on : 23-Jul-2018, 1:55:48 PM
    Author     : Dev
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />"
        <script src="/resources/js/jquery.min.js"></script>
        <script src="/resources/js/bootstrap.min.js"></script>
        <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
        <title>Teacher List</title>
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
                                <h4>Teacher List</h4></li>
                        </ol>
                        <table class="table table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Teacher ID</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Address</th>
                                    <th>City</th>
                                    <th>Phone Number</th>
                                    <th>Salary</th>
                                    <th colspan="3"></th>
                                </tr>
                                <c:forEach var="tList" items="${teacherList}">
                                    <tr>
                                        <td><c:out value="${tList.id}">null</c:out></td>
                                        <td><c:out value="${tList.firstName}">null</c:out></td>
                                        <td><c:out value="${tList.lastName}">null</c:out></td>
                                        <td><c:out value="${tList.address}">null</c:out></td>
                                        <td><c:out value="${tList.city}">null</c:out></td>
                                        <td><c:out value="${tList.phoneNumber}">null</c:out></td>
                                        <td><fmt:formatNumber type="currency" value="${tList.salary}"/></td>
                                        <td><a href="<c:out value="${pageContext.request.contextPath}"/>/teacher/detail/${tList.id}" 
                                               class="btn btn-primary" role="button" aria-pressed="true">Show Detail</a></td>
                                        <td><a href="<c:out value="${pageContext.request.contextPath}"/>/teacher/edit/${tList.id}" 
                                               class="btn btn-primary" role="button" aria-pressed="true">Edit</a></td>
                                        <td><a href="<c:out value="${pageContext.request.contextPath}"/>/teacher/remove/${tList.id}" 
                                               onclick="confirm('Are you sure you want to delete a teacher?')" 
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
