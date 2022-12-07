<%@page import="domain.TreeDTO"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		LinkedList<TreeDTO> list01 = (LinkedList<TreeDTO>)request.getAttribute("list");
		out.println(list01.get(0).getMessage() + " " + list01.get(0).getSender());
		out.println("<br/>");
		out.println(list01.get(1).getMessage() + " " + list01.get(1).getSender());
		out.println("<br/>");
		out.println(list01.get(2).getMessage() + " " + list01.get(2).getSender());
		out.println("<br/>");
		out.println(list01.get(3).getMessage() + " " + list01.get(3).getSender());
		out.println("<br/>");
		out.println(list01.get(4).getMessage() + " " + list01.get(4).getSender());
		out.println("<br/>");
	%>
</body>
</html>