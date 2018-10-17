<%-- 
    Document   : result_edit
    Created on : 1-Aug-2018, 8:24:16 AM
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
                                <h4>Edit Result</h4></li>
                        </ol>
                    </nav>
                    <c:url var="updateAction" value="/result/edit/update" ></c:url>
                    <form:form action="${updateAction}" commandName="result" method="Post">
                        <form:input class="form-control" type="hidden" path="id" />
                        <form:label path="student">
                            <spring:message text="Select Student"/>
                        </form:label>
                        <form:select class="form-control" path="student">
                            <c:forEach items="${studentList}" var="s">
                                <form:option value="${s.id}" label="${s.id} ${s.firstName} ${s.lastName}"></form:option>
                            </c:forEach>
                        </form:select>
                        <form:label path="course">
                            <spring:message text="Select Course"/>
                        </form:label>
                        <form:select class="form-control" path="course">
                            <c:forEach items="${courseList}" var="c">
                                <form:option value="${c.id}" label="${c.courseName}"></form:option>
                            </c:forEach>
                        </form:select>
                        <form:label path="sessionNumber">
                            <spring:message text="Session Number"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="sessionNumber" />
                        <form:label path="mark">
                            <spring:message text="Mark"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="mark" />
                        <p></p>
                        <input class="btn btn-primary btn-block" type="submit" value="Update">
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>
