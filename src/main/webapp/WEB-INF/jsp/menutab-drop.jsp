<%-- 
    Document   : menutab-drop
    Created on : 20-Jul-2018, 10:55:20 AM
    Author     : Dev
--%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">

<div class="sidebar-nav">
    <div class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <span class="visible-xs navbar-brand">Sidebar menu</span>
        </div>
        <div class="navbar-collapse collapse sidebar-navbar-collapse">
            <ul class="nav navbar-nav" id="sidenav01">
                <li class="active">
                    <a href="<c:out value="${pageContext.request.contextPath}"/>/index.jsp" data-toggle="collapse" data-target="#toggleDemo0" data-parent="#sidenav01" class="collapsed">
                        <h4>
                            Home
                        </h4>
                    </a>
                </li>
                <c:if test="${pageContext.request.isUserInRole('admin')}">
                    <li>
                        <a href="#" data-toggle="collapse" data-target="#toggleDemo" data-parent="#sidenav01" class="collapsed">
                            Student <span class="caret pull-right"></span>
                        </a>
                        <div class="collapse" id="toggleDemo" style="height: 0px;">
                            <ul class="nav nav-list">
                                <li><a href="<c:out value="${pageContext.request.contextPath}"/>/student_form">Add Student</a></li>
                                <li><a href="<c:out value="${pageContext.request.contextPath}"/>/student_list">List Student</a></li>
                            </ul>
                        </div>
                    </li>
                </c:if>
                <c:if test="${pageContext.request.isUserInRole('admin') || pageContext.request.isUserInRole('programAdmin')}">
                    <li>
                        <a href="#" data-toggle="collapse" data-target="#toggleDemo2" data-parent="#sidenav01" class="collapsed">
                            Course <span class="caret pull-right"></span>
                        </a>
                        <div class="collapse" id="toggleDemo2" style="height: 0px;">
                            <ul class="nav nav-list">
                                <li><a href="<c:out value="${pageContext.request.contextPath}"/>/course_form">Add Course</a></li>
                                <li><a href="<c:out value="${pageContext.request.contextPath}"/>/course_list">List Course</a></li>
                                <li><a href="<c:out value="${pageContext.request.contextPath}"/>/student_course">Add Student to Course</a></li>
                                <li><a href="<c:out value="${pageContext.request.contextPath}"/>/teacher_course">Add Teacher to Course</a></li>
                            </ul>
                        </div>
                    </li>
                </c:if>
                <c:if test="${pageContext.request.isUserInRole('admin')}">
                    <li>
                        <a href="#" data-toggle="collapse" data-target="#toggleDemo3" data-parent="#sidenav01" class="collapsed">
                            Teacher <span class="caret pull-right"></span>
                        </a>
                        <div class="collapse" id="toggleDemo3" style="height: 0px;">
                            <ul class="nav nav-list">
                                <li><a href="<c:out value="${pageContext.request.contextPath}"/>/teacher_form">Add Teacher</a></li>
                                <li><a href="<c:out value="${pageContext.request.contextPath}"/>/teacher_list">List Teacher</a></li>
                            </ul>
                        </div>
                    </li>
                </c:if>
                <c:if test="${pageContext.request.isUserInRole('admin') || pageContext.request.isUserInRole('teacher')}">
                    <li>
                        <a href="#" data-toggle="collapse" data-target="#toggleDemo4" data-parent="#sidenav01" class="collapsed">
                            Result&nbsp<span class="caret pull-right"></span>
                        </a>
                        <div class="collapse" id="toggleDemo4" style="height: 0px;">
                            <ul class="nav nav-list">
                                <li><a href="<c:out value="${pageContext.request.contextPath}"/>/result_form">Add Result</a></li>
                                <li><a href="<c:out value="${pageContext.request.contextPath}"/>/result_list">List Result</a></li>
                            </ul>
                        </div>
                    </li>
                </c:if>
                <li class="active">
                    <a href="<c:out value="${pageContext.request.contextPath}"/>/logout" 
                       data-toggle="collapse" data-target="#toggleDemo5" data-parent="#sidenav01" class="collapsed">
                        <h4>Logout</h4>                  
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>