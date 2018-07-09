<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form"
    uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tweet form</title>
	<style>
		.error{
			color:red;
		}

	</style>
</head>
<body>
<h2>Tweet</h2>
<form:form modelAttribute="tweet" method="POST">
		  <form:hidden path="id"/>
	Text: <form:input path="text" /><form:errors path="text" cssClass="error" /><br />
	User: <form:select items="${users}" path="user.id" itemValue="id" itemLabel="username" />
	      <form:errors path="user" cssClass="error" element="div" />
	<input type="submit" value="Submit"></input>
</form:form>
</body>
</html>