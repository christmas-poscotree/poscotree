<%@page import="domain.TreeDTO"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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

<title>My tree</title>
	<script type="text/javascript">
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
		LinkedList<TreeDTO> list01 = (LinkedList<TreeDTO>)request.getAttribute("list");
	String treename = (String) request.getAttribute("tree_nm");
	Integer memberNo = (Integer) session.getAttribute("memberNo");
	Integer message_no1 = Integer.parseInt(list01.get(0).getMessage_no());
	Integer message_no2 = Integer.parseInt(list01.get(1).getMessage_no());
	Integer message_no3 = Integer.parseInt(list01.get(2).getMessage_no());
	Integer message_no4 = Integer.parseInt(list01.get(3).getMessage_no());
	Integer message_no5 = Integer.parseInt(list01.get(4).getMessage_no());
	%>
	<div class="background">
	<h6>포스코ICT 4기 Tree</h6>
	<br />
	<img src="img/sock.png">
	<%
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

	<button  onClick="location.href='/tree/<%=memberNo%>/<%=message_no1%>'">
	<%-- 	<%= out.println(list01.get(0).getMessage() + " " + list01.get(0).getSender())%>
		<%= out.println("<br/>")%> --%>
	</button>
	<button  onClick="location.href='/tree/<%=memberNo%>/<%=message_no2%>'">편지 확인하기</button>
	<button  onClick="location.href='/tree/<%=memberNo%>/<%=message_no3%>'">편지 확인하기</button>
	<button  onClick="location.href='/tree/<%=memberNo%>/<%=message_no4%>'">편지 확인하기</button>
	<button  onClick="location.href='/tree/<%=memberNo%>/<%=message_no5%>'">편지 확인하기</button>
	<h3>
		<%=treename%>의 트리
	</h3>

	<% if(session.getAttribute("memberNo") != null ) { //로그인했을때 %>
		<button  onClick="location.href='/tree/<%=memberNo%>/message-list}'">편지 확인하기</button>
		<button  class="copy-btn" onclick="copyUrl()">호텔링크 복사하기</button>
		<button class="copy-btn" onclick="location.href='/t1'"> 트리 꾸며주기</button>
		
	<a href="logout">로그아웃</a>

	<% } else{ // 로그인 안한 사람이 작성%>
  		<button class="copy-btn" onclick="location.href='/t1'"> 트리 꾸며주기</button>
		<button onclick="login"> 나도 트리 만들래!</button>
	<% }%>
  </div>

</body>
</html>

