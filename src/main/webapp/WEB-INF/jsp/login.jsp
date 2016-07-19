<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Form Page</title>
</head>
<body>
<p>Formular de logare</p>
<form:form modelAttribute="userForm" action="User" method="POST">
    <form:input path="username" type="text" placeholder="Username"></form:input>
    <form:input path="password" type="password" placeholder="Password"></form:input>
    <input type="submit" value="Submit">
</form:form>
</body>
</html>
