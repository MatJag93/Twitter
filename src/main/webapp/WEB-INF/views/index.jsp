<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Tweeter</title>
</head>
<body>
	<c:choose>
		<c:when test="${empty user}">
			<div style="float: right">
				<button onClick="javascript:location.href='user/login'">Logowanie</button>
				<button onClick="javascript:location.href='user/register'" style="margin-left: 20px">Rejestracja</button>
			</div>
			<h2>Zaloguj się, aby skorzystać z serwisu</h2>
		</c:when>
		<c:otherwise>
			<div style="float: right">

				<button onClick="javascript:location.href='user/logout'">Wyloguj się</button>
			</div>
			<h2>Witaj, <c:out value="${user.username}" /></h2>
			<form:form modelAttribute="tweet" method="POST">
				<form:hidden path="user.id" value="${user.id}" />
				Text: <form:input path="text" /><form:errors path="text" cssClass="error" /><br />
				<form:errors path="user" cssClass="error" element="div" />
				<input type="submit" value="Submit"></input>
			</form:form>
		</c:otherwise>
	</c:choose>
</body>
</html>