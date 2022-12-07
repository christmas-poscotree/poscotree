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
<title>Insert title here</title>
</head>
<body>
<div class="background">
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
	</div>
</body>
</html>