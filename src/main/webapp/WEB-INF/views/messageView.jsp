<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>messageView</title>
</head>
<body>
	<h>MessageView</h>
	<h1>${message }</h1>
	<h1>${sender }</h1>
	<%
		String message = (String) request.getAttribute("message");
		String name = (String) request.getAttribute("sender");
	%>
</body>
</html>