<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form"
    uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Twitter - rejestracja</title>
<style type="text/css">
	.error {
		color: red;
	}
</style>
</head>
<body>
<h2>Rejestracja</h2>
<form:form modelAttribute="user" method="POST">
	Nazwa użytkownika: <form:input path="username" /><br />
	<form:errors path="username" element="div" cssClass="error" />
	Hasło: <form:password path="password" /><br />
	<form:errors path="password" element="div" cssClass="error" />
	Email : <form:input path="email"/><br />
	<form:errors path="email" element="div" cssClass="error" />
	<input type="submit" value="Submit"></input>
</form:form>
</body>
</html>