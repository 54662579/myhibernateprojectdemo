<%-- 
    Document   : mail
    Created on : 3-Aug-2018, 10:16:53 AM
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
        <title>Mail</title>
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
                                <h4>Send an E-mail</h4></li>
                        </ol>
                    </nav>
                    <c:url var="addAction" value="/send_email" ></c:url>
                    <form action="${addAction}" method="Post">
                        <fieldset>
                            <table class="table">
                                <colgroup>
                                    <col class="col-lg-2">
                                    <col class="col-lg-12">
                                <tr>
                                    <th>Mail to</th>
                                    <th>
                                        ${student.firstName} ${student.lastName}
                                        <input type="hidden" name="fName" value="${student.firstName}"/>
                                        <input type="hidden" name="lName" value="${student.lastName}"/>

                                    </th>
                                </tr>
                                <tr>
                                    <th> Email</th>
                                    <td><input class="form-control" type ="text" name ="mailAddress" value="${student.email}" readonly/></td>

                                </tr>
                                <tr>
                                    <th> Content</th>
                                    <td>
                                        <textarea class="form-control form-group-lg" 
                                                  row="10" name="mailBody" value="result" ></textarea>
                                    </td>
                                </tr>
                            </table>
                            <input class="btn btn-primary" type="submit" value="SEND"/>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
