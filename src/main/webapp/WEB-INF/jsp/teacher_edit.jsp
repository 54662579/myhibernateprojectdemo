<%-- 
    Document   : teacher_edit
    Created on : 31-Jul-2018, 6:18:06 PM
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
        <title>Edit Teacher</title>
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
                                <h4>Edit Teacher</h4></li>
                        </ol>
                    </nav>
                    <c:url var="updateAction" value="/teacher/edit/update" ></c:url>
                    <form:form action="${updateAction}" commandName="teacher" method="Post">
                        <form:input type="hidden" path="id"/>
                        <form:label path="firstName">
                            <spring:message text="First Name"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="firstName" />
                        <form:label path="lastName">
                            <spring:message text="Last Name"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="lastName"/>
                        <form:label path="address">
                            <spring:message text="Address"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="address"/>
                        <form:label path="city">
                            <spring:message text="City"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="city" />
                        <form:label path="phoneNumber">
                            <spring:message text="Phone Number"/>
                        </form:label>
                        <form:input class="form-control" type="tel" path="phoneNumber" />
                        <form:label path="salary">
                            <spring:message text="Salary"/>
                        </form:label>
                        <form:input class="form-control" type="number" path="salary" />
                        <p></p>
                        <input class="btn btn-primary btn-block" type="submit" value="Update">
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>
