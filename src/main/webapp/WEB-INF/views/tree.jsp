<%@page import="domain.TreeDTO"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My tree</title>
	<script type="text/javascript">
		alert("확인");
		let nowUrl = window.location.href;
		
		function copyUrl(){ 
		  //nowUrl 변수에 담긴 주소를
		  	navigator.clipboard.writeText(nowUrl).then(res=>{
			  alert("주소가 복사되었습니다!");
			})
		}
	</script>
</head>

<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String treename = (String) request.getAttribute("tree_nm");
	%>
	<h6>포스코ICT 4기 Tree</h6>
	<br />
	
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

	<h3>
		<%=treename%>의 트리
	</h3>
	<% if(session.getAttribute("userName") != null) { //로그인했을때 %>
		<button  onClick="location.href='messageView.jsp'">편지 확인하기</button>
		<button  class="copy-btn" onclick="copyUrl()">호텔링크 복사하기</button>
		<a href="logout'">로그아웃</a>
			
	<% } else{ // 로그인 안한 사람이 작성%>
		<button class="copy-btn" onclick="location.href='/t1'"> 트리 꾸며주기</button>
		<button onclick="login"> 나도 트리 만들래!</button>
	<% }%>
	
</body>
</html>

