<%-- 
    Document   : course_detail
    Created on : 31-Jul-2018, 2:27:22 PM
    Author     : Dev
--%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
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
        <title>Course Detail</title>
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
                                <h4>Course Detail</h4></li>
                        </ol>
                    </nav>
                    <c:set var="cInfo" value="${course}"/>
                    <table class="table table-bordered">
                        <colgroup>
                            <col class="col-md-2">
                            <col class="col-md-12">
                        </colgroup>
                        <tr>
                            <td>Id</td>
                            <td><c:out value="${cInfo.id}"/></td>
                        </tr>
                        <tr>
                            <td>Course Name</td>
                            <td><c:out value="${cInfo.courseName}"/></td>
                        </tr>
                        <tr>
                            <td>Course Description</td>
                            <td><c:out value="${cInfo.courseDes}"/></td>
                        </tr>
                        <tr>
                            <td>Course Code</td>
                            <td><c:out value="${cInfo.courseCode}"/></td>
                        </tr>
                        <tr>
                            <td>Credit Number</td>
                            <td><c:out value="${cInfo.creditNumber}"/></td>
                        </tr>
                    </table>
                    <form method="get" action="<c:out value="${pageContext.request.contextPath}"/>/course/edit/${cInfo.id}">
                        <button class="btn btn-info" type="submit">Edit Course</button>
                    </form>
                    <br>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active" aria-current="page">
                                <h4>Teachers in Course</h4></li>
                        </ol>
                    </nav>
                    <table class="table table-hover">
                        <tr>
                            <th>Teacher ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th colspan="3"></th>
                        </tr>
                        <c:forEach items="${cInfo.teachers}" var="t">
                            <tr>
                                <td><c:out value="${t.id}"/></td>
                                <td><c:out value="${t.firstName}"/></td>
                                <td><c:out value="${t.lastName}"/></td>
                                <td><a href="<c:out value="${pageContext.request.contextPath}"/>/teacher/detail/${t.id}" 
                                       class="btn btn-primary" role="button" aria-pressed="true">Show Detail</a></td>
                                <td><a href="<c:out value="${pageContext.request.contextPath}"/>/teacher/edit/${t.id}" 
                                       class="btn btn-primary" role="button" aria-pressed="true">Edit</a></td>
                                <td><a href="<c:out value="${pageContext.request.contextPath}"/>/teacher_course/delete/${t.id}/${cInfo.id}" 
                                       onclick="confirm('Are you sure you want to delete teacher from a course?')"
                                       class="btn btn-primary" role="button" aria-pressed="true">Remove Teacher</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active" aria-current="page">
                                <h4>Students in Course</h4></li>
                        </ol>
                    </nav>
                    <table class="table table-hover">
                        <tr>
                            <th>Student ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th colspan="3"></th>
                        </tr>
                        <c:forEach items="${cInfo.students}" var="s">
                            <tr>
                                <td><c:out value="${s.id}"/></td>
                                <td><c:out value="${s.firstName}"/></td>
                                <td><c:out value="${s.lastName}"/></td>
                                <td><a href="<c:out value="${pageContext.request.contextPath}"/>/student/detail/${s.id}" 
                                       class="btn btn-primary" role="button" aria-pressed="true">Show Detail</a></td>
                                <td><a href="<c:out value="${pageContext.request.contextPath}"/>/student/edit/${s.id}" 
                                       class="btn btn-primary" role="button" aria-pressed="true">Edit</a></td>
                                <td><a href="<c:out value="${pageContext.request.contextPath}"/>/student_course/delete/${sInfo.id}/${c.id}" 
                                       onclick="alert('Are you sure you want to remove student from a course?')"
                                       class="btn btn-primary" role="button" aria-pressed="true">
                                        Remove Student</a> 
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
