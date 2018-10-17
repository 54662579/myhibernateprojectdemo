<%-- 
    Document   : teacher_form
    Created on : 31-Jul-2018, 3:43:14 PM
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
        <title>Add Teacher</title>
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
                                <h4>Add Teacher</h4></li>
                        </ol>
                    </nav>
                    <c:url var="addAction" value="/teacher/add" ></c:url>
                    <form:form action="${addAction}" commandName="teacher" method="Post">
                        <form:label path="firstName">
                            <spring:message text="First Name"/>
                            
                        </form:label>
                        <form:input class="form-control" type="text" path="firstName" required="required"/>
                        <form:label path="lastName">
                            <spring:message text="Last Name"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="lastName" required="required"/>
                        <form:label path="address">
                            <spring:message text="Address"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="address" required="required"/>
                        <form:label path="city">
                            <spring:message text="City"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="city" required="required"/>
                        <form:label path="phoneNumber">
                            <spring:message text="Phone Number"/>
                        </form:label>
                        <form:input class="form-control" type="tel" path="phoneNumber" required="required"/>
                        <form:label path="salary">
                            <spring:message text="Salary"/>
                        </form:label>
                        <form:input class="form-control" type="number" path="salary" required="required"/>
                        <p></p>
                        <input class="btn btn-primary btn-block" type="submit" value="Add">
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>
