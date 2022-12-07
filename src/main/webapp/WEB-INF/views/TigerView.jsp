<%@page import="java.sql.PreparedStatement"%>
<%@page import="Controller.GSDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>tigerView1.jsp</h1>
	<form method = 'post' action='t3'>
		<input type = 'text' name = 'message'/><br/>
		<input type = 'text' name = 'pw'/><br/>
		<input type = 'text' name = 'email'/><br/>
		<input type = 'text' name = 'tel'/><br/>
		<input type = 'submit' value = 'insert'/>
	</form>
	<% 
	%>
</body>
</html>