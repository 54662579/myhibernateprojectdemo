<%-- 
    Document   : student_edit
    Created on : 20-Jul-2018, 2:23:51 PM
    Author     : Dev
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Edit Student</title>
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
                                <h4>Edit Student</h4></li>
                        </ol>
                    </nav>
                    ${msg}
                    <c:url var="updateAction" value="/student/edit/update" ></c:url>
                    <form:form action="${updateAction}" commandName="student" method="Post">
                        <form:input type="hidden" path="id"/>
                        <form:label path="firstName">
                            <spring:message text="First Name"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="firstName"/>
                        <form:label path="lastName">
                            <spring:message text="Last Name"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="lastName"/>
                        <form:label path="gender">
                            <spring:message text="Gender"/>
                        </form:label>
                        <form:select class="form-control" path="gender" >
                            <form:option value="Male" label="Male"/>
                            <form:option value="Female" label="Female"/>
                        </form:select>
                        <form:label path="organisation">
                            <spring:message text="Organisation"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="organisation"/>
                        <form:label path="address">
                            <spring:message text="Address"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="address" />
                        <form:label path="city">
                            <spring:message text="City"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="city" />
                        <form:label path="province">
                            <spring:message text="Province"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="province" />
                        <form:label path="country">
                            <spring:message text="Country"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="country" />
                        <form:label path="zipcode">
                            <spring:message text="ZipCode"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="zipcode" />
                        <form:label path="phoneNumber">
                            <spring:message text="Phone Number"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="phoneNumber" />
                        <form:label path="email">
                            <spring:message text="Email"/>
                        </form:label>
                        <form:input class="form-control" type="email" path="email" />
                        <form:label path="major">
                            <spring:message text="Major"/>
                        </form:label>
                        <form:input class="form-control" type="text" path="Major" />
                        <form:label path="dateOfBirth">
                            <spring:message text="Date of Birth"/>
                        </form:label>
                        <form:input class="form-control" type="date" path="dateOfBirth" />
                        <p></p>
                        <input class="btn btn-primary btn-block" type="submit" value="Update">
                    </form:form>
                </div>
            </div>
         </div>
    </body>
</html>
