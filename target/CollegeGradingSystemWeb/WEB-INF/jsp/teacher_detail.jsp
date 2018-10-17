<%-- 
    Document   : teacher_detail
    Created on : 31-Jul-2018, 6:11:35 PM
    Author     : Dev
--%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false"%>
<html>
    <head>
        <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
        <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
        <title>Teacher Detail</title>
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
                                <h4>Teacher Detail</h4></li>
                        </ol>
                    </nav>
                    <c:set var="tInfo" value="${teacher}"/>
                    <table class="table table-bordered">
                        <colgroup>
                            <col class="col-md-2">
                            <col class="col-md-12">
                        </colgroup>
                        <tr>
                            <td>Id</td>
                            <td><c:out value="${tInfo.id}"/></td>
                        </tr>
                        <tr>
                            <td>First Name</td>
                            <td><c:out value="${tInfo.firstName}"/></td>
                        </tr>
                        <tr>
                            <td>Last Name</td>
                            <td><c:out value="${tInfo.lastName}"/></td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td><c:out value="${tInfo.address}"/></td>
                        </tr>
                        <tr>
                            <td>City</td>
                            <td><c:out value="${tInfo.city}"/></td>
                        </tr>
                        <tr>
                            <td>Phone Number</td>
                            <td><c:out value="${tInfo.phoneNumber}"/></td>
                        </tr>
                        <tr>
                            <td>Salary</td>
                            <td><fmt:formatNumber type="currency" value="${tInfo.salary}"/></td>
                        </tr>
                    </table>
                    <form method="get" action="<c:out value="${pageContext.request.contextPath}"/>/teacher/edit/${tInfo.id}">
                        <button class="btn btn-info" type="submit">Edit Teacher</button>
                    </form>
                    <br>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active" aria-current="page">
                                <h4>Course Detail</h4></li>
                        </ol>
                    </nav>
                    <table class="table table-hover">
                        <tr>
                            <th>Course ID</th>
                            <th>Course Name</th>
                            <th colspan="3"></th>
                        </tr>
                        <c:forEach var="c" items="${tInfo.courses}">
                            <tr>
                                <td><c:out value="${c.id}"/></td>
                                <td><c:out value="${c.courseName}"/></td>  
                                <td><a href="<c:out value="${pageContext.request.contextPath}"/>/course/detail/${c.id}"
                                       class="btn btn-primary" role="button" aria-pressed="true">Course Detail</a></td> 
                                <td><a href="<c:out value="${pageContext.request.contextPath}"/>/course/edit/${c.id}"
                                       class="btn btn-primary" role="button" aria-pressed="true">Edit Course</a></td>
                                <td><a href="<c:out value="${pageContext.request.contextPath}"/>/teacher_course/delete/${tInfo.id}/${c.id}" 
                                       onclick="alert('Are you sure you want to remove teacher from a course?')"
                                       class="btn btn-primary" role="button" aria-pressed="true">
                                        Remove Course</a> 
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    
                </div>
            </div>
        </div>
    </body>
</html>
