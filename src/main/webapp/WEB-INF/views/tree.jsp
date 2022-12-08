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
			div {
				width: 500px;
				height: 400px;
				position: absolute;
			}
			div.x0 {
				top: 300px;
				left: 360px;
			}
			div.x1 {
				top: 380px;
				left: 270px;
			}
			div.x2 {
				top: 450px;
				left: 400px;
			}
			div.x3 {
				top: 570px;
				left: 260px;
			}
			div.x4 {
				top: 610px;
				left: 390px;
			}
			div.x5 {
				top: 780px;
				left: 250px;
			}
			div.x6 {
				top: 780px;
				left: 420px;
			}
			div.x7 {
				top: 780px;
				left: 500px;
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
	Integer treeNo = (Integer) request.getAttribute("tree_no");
	
	%>
	<div class="background">
	<h6>포스코ICT 4기 Tree</h6>
	<br />
	<img src="../img/img_tree.png" width=800 height = 800>
	<div>
	<% for(int i = 0; i<list01.size(); i++) {%>
		<div class="x<%=i%>">
		<form>
			<img src="../img/<%= i %>.png" width=100 height = 100
			onClick="location.href='/tree/<%=treeNo%>/<%=list01.get(i).getMessage_no()%>'">
		</form>
		</div>
	<% }%>
	</div>
	
	<h3>
		<%=treename%>의 트리
	</h3>

	<% if(session.getAttribute("memberNo") != null ) { //로그인했을때 %>
		<button  onClick="location.href='/tree/<%=memberNo%>/message-list'">편지 확인하기</button>
		<button  class="copy-btn" onclick="copyUrl()">호텔링크 복사하기</button>
		<button  onclick="location.href='/tree/<%=treeNo%>/MessageForm'"> 트리 꾸며주기</button>
		
	<a href="/logout">로그아웃</a>

	<% } else{ // 로그인 안한 사람이 작성%>
  		<button onclick="location.href='/tree/<%=treeNo%>/MessageForm'"> 트리 꾸며주기</button>
		<button onclick="/login"> 나도 트리 만들래!</button>
	<% }%>
  </div>

</body>
</html>

