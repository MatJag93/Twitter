<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Szczebiotek - logowanie</title>
<style type="text/css">
	.error {
		color: red;
	}
</style>
</head>
<body>
<div style="float: right">
	<button onClick="javascript:location.href='register'" style="margin-left: 20px">Rejestracja</button>
</div>
<h2>Logowanie</h2>
<c:if test="${not empty loginError}">
	<div class="error">
		<c:out value="${loginError }" />
	</div>
</c:if>
<form:form modelAttribute="user" method="POST">
	Email : <form:input path="email"/><br />
	<form:errors path="email" element="div" cssClass="error" />
	Hasło: <form:password path="password" /><br />
	<form:errors path="password" element="div" cssClass="error" />
	<input type="submit" value="Submit"></input>
</form:form>
</body>
</html>