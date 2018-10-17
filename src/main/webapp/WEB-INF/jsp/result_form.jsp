<%-- 
    Document   : result_form
    Created on : 31-Jul-2018, 8:19:43 PM
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
        <title>Add Result</title>
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
                                <h4>Add Result</h4></li>
                        </ol>
                    </nav>
                    ${msg}
                    <c:set var="addAction" value="${pageContext.request.contextPath}/result/add"/>
                    <form:form action="${addAction}" commandName="result" method="Post">
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
                        <form:input class="form-control" type="text" path="sessionNumber" min="101" max="1299" required="required"/>
                        <form:label path="mark">
                            <spring:message text="Mark"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="mark" min="0" max="20" required="required"/>
                        <p></p>
                        <input class="btn btn-primary btn-block" type="submit" value="Add">
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>
