
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Controller.TreeDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<style type="text/css">
.background{
    padding: 0px;
    border: 0px;
    font: inherit;
    vertical-align: baseline;
    min-height: calc(var(--vh,1vh) * 100);
    width: 768px;
    margin: 0px auto;
    background: linear-gradient(rgb(245, 200, 184) 5%, rgb(252, 244, 233), rgb(252, 244, 233), rgb(252, 244, 233), rgb(252, 244, 233));
    display: flex;
    flex-direction: column;
    overflow: auto;
}
</style>
<title>MessageForm</title>
</head>
<body>
<div class="background">
	<h1>MessageForm.jsp</h1>
	<form method = 'post' action='tree/{tree_no}/send' accept-charset="UTF-8">
		<input type = 'text' name = 'message'/><br/>
		<input type = 'text' name = 'sender'/><br/>
		<input type = 'submit' value = 'insert'/>
	</form>
	<% 
	%>
	</div>
</body>
</html>