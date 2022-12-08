<%@page import="domain.TreeDTO"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MessageList</title>
</head>
<body>
	<%
		LinkedList<TreeDTO> list01 = (LinkedList<TreeDTO>)request.getAttribute("list");
	%>
	<table border = 1>
		<tr>
			<td> Message </td>
			<td> 보낸 사람</td>
		</tr>
		<% for(int i = 0; i < list01.size(); i++) {%>
		<tr>
			<td> <%=list01.get(i).getMessage() %> </td>
			<td> <%=list01.get(i).getSender() %> </td>
		</tr>
		<% } %>
	</table>
	<a href = "/login"> 트리로 돌아가기 </a>
</body>
</html>