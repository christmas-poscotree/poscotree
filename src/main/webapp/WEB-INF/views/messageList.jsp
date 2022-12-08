<%@page import="domain.TreeDTO"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<title>MessageList</title>
</head>
<body>
<div class="background">
	<%
		LinkedList<TreeDTO> list01 = (LinkedList<TreeDTO>)request.getAttribute("list");
	%>

	</div>
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