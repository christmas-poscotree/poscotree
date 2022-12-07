<%@page import="java.sql.PreparedStatement"%>
<%@page import="repository.TreeRepository"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MessageForm</title>
</head>
<body>
	<h1>MessageForm.jsp</h1>
	<form method = 'post' action='tree/{tree_no}/send' accept-charset="UTF-8">
		<input type = 'text' name = 'message'/><br/>
		<input type = 'text' name = 'sender'/><br/>
		<input type = 'submit' value = 'insert'/>
	</form>
	<% 
	%>
</body>
</html>