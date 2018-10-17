<%-- 
    Document   : student_detail
    Created on : 20-Jul-2018, 2:50:14 PM
    Author     : Dev
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page import="java.util.Set" %>
<%@page import="model.Result"%>
<%@ page session="false"%>
<html>
    <head>
        <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
        <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
        <title>Student Detail</title>
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
                                <h4>Student Detail</h4></li>
                        </ol>
                    </nav>
                    <c:set var="sInfo" value="${student}"/>
                    <table class="table table-bordered">
                        <colgroup>
                            <col class="col-md-2">
                            <col class="col-md-12">
                        </colgroup>
                        <tr>
                            <td>Id</td>
                            <td><c:out value="${sInfo.id}"/></td>
                        </tr>
                        <tr>
                            <td>First Name</td>
                            <td><c:out value="${sInfo.firstName}"/></td>
                        </tr>
                        <tr>
                            <td>Last Name</td>
                            <td><c:out value="${sInfo.lastName}"/></td>
                        </tr>
                        <tr>
                            <td>Gender</td>
                            <td><c:out value="${sInfo.gender}"/></td>
                        </tr>
                        <tr>
                            <td>Organization</td>
                            <td><c:out value="${sInfo.organisation}"/></td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td><c:out value="${sInfo.address}"/></td>
                        </tr>
                        <tr>
                            <td>City</td>
                            <td><c:out value="${sInfo.city}"/></td>
                        </tr>
                        <tr>
                            <td>Province</td>
                            <td><c:out value="${sInfo.province}"/></td>
                        </tr>
                        <tr>
                            <td>Country</td>
                            <td><c:out value="${sInfo.country}"/></td>
                        </tr>
                        <tr>
                            <td>Zip Code</td>
                            <td><c:out value="${sInfo.zipcode}"/></td>
                        </tr>
                        <tr>
                            <td>Phone Number</td>
                            <td><c:out value="${sInfo.phoneNumber}"/></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><c:out value="${sInfo.email}"/></td>
                        </tr>
                        <tr>
                            <td>Major</td>
                            <td><c:out value="${sInfo.major}"/></td>
                        </tr>
                        <tr>
                            <td>Date of Birth</td>
                            <td><c:out value="${sInfo.dateOfBirth}"/></td>
                        </tr>                      
                    </table>
                    <form method="get" action="<c:out value="${pageContext.request.contextPath}"/>/student/edit/${sInfo.id}">
                        <button class="btn btn-info" type="submit">Edit Student</button>
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
                        <c:forEach var="c" items="${sInfo.courses}">
                            <tr>
                                <td><c:out value="${c.id}"/></td>
                                <td><c:out value="${c.courseName}"/></td>  
                                <td><a href="<c:out value="${pageContext.request.contextPath}"/>/course/detail/${c.id}"
                                       class="btn btn-primary" role="button" aria-pressed="true">Course Detail</a></td> 
                                <td><a href="<c:out value="${pageContext.request.contextPath}"/>/course/edit/${c.id}"
                                       class="btn btn-primary" role="button" aria-pressed="true">Edit Course</a></td>
                                <td><a href="<c:out value="${pageContext.request.contextPath}"/>/student_course/delete/${sInfo.id}/${c.id}" 
                                       onclick="alert('Are you sure you want to remove student from a course?')"
                                       class="btn btn-primary" role="button" aria-pressed="true">
                                        Remove Course</a> 
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <br>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active" aria-current="page">
                                <h4>Result Detail</h4></li>
                        </ol>
                    </nav>
                    <table class="table table-hover">
                        <tr>
                            <th>Result ID</th>
                            <th>Course ID</th>
                            <th>Course Name</th>
                            <th>Session Number</th>
                            <th>Mark</th>
                            <th colspan="2"></th>
                        </tr>
                        <c:forEach var="r" items="${sInfo.results}">
                            <tr>
                                <td><c:out value="${r.id}">null</c:out></td>
                                <td><c:out value="${r.course.id}">null</c:out></td>
                                <td><c:out value="${r.course.courseName}">null</c:out></td>
                                <td><c:out value="${r.sessionNumber}">null</c:out></td>
                                <td><c:out value="${r.mark}">null</c:out></td>
                                <td><a href="<c:out value="${pageContext.request.contextPath}"/>/result/edit/${r.id}"
                                       class="btn btn-primary" role="button" aria-pressed="true">Edit Result</a></td>
                                <td><a href="<c:out value="${pageContext.request.contextPath}"/>/result/remove/${r.id}" 
                                       onclick="confirm('Are you sure you want to delete this result?')"
                                       class="btn btn-primary" role="button" aria-pressed="true">Remove Result</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
