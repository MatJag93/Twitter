<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form"
    uri="http://www.springframework.org/tags/form" %>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tweet list</title>
</head>
<body>
<h2>Tweetes</h2>
	<c:forEach items="${tweets}" var="tweets">
		ID: ${tweet.id}<br/>
		Text: ${tweet.text}<br />
		Created: ${tweet.created}<br />
		<!--button onClick="javascript:location.href='form?id=${tweets.id}'">Edit</button-->
		<!--button onClick="javascript:location.href='confirmDelete?id=${tweets.id}'">Delete</button-->
		<hr />
	</c:forEach>
	<button onClick="javascript:location.href='add'">Dodaj</button>

<a href="/">Strona Główna</a>
</body>
</html>