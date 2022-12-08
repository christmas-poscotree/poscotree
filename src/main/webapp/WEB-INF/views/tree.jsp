<%@page import="domain.TreeDTO"%>
<%@page import="java.util.LinkedList"%>
<%@ page import="java.util.Objects" %>
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
    width: 100%;
    margin: 0px auto;
    background-image: url( "../img/ssnow.gif" );
  	background-size:cover;
    display: flex;
    flex-direction: column;
    overflow: auto;
}
.log{
	width: 281px;
    height: 29px;
    border-width: 1.5px;
    border-style: dashed;
    border-color: white;
    border-radius: 2px;
    background-color: rgb(175, 32, 16);
    outline: rgb(175, 32, 16) solid 9px;
    font-weight: 400;
    font-size: 14px;
    font-family: Nanum Pen Script;
    line-height: 20px;
    color: white;
    margin-top: 9px;
    margin-bottom: 9px;
}
.sign{
	width: 281px;
    height: 29px;
    border-width: 1.5px;
    border-style: dashed;
    border-color: white;
    border-radius: 2px;
    background: rgb(0, 84, 82);
    outline: rgb(0, 84, 82) solid 9px;
    font-weight: 400;
    font-size: 14px;
    font-family: Nanum Pen Script;
    line-height: 20px;
    color: white;
    margin-top: 9px;
    margin-bottom: 9px;
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
	Integer treeMemberNo = (Integer) request.getAttribute("nowMemberNo");
	%>

	<div class="background">
	<h3>
		<%=treename%>의 트리
	</h3>
	<br />
	
	<div class="treeform" style=" ">
	<img src="../img/img_tree.png" width=800 height = 800 >
	</div>
	
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
	
	
	

	<% if(memberNo != null && Objects.equals(treeMemberNo, memberNo)) { //로그인했을때 %>
		<button  class="log" onClick="location.href='/tree/<%=treeNo%>/message-list'">편지 확인하기</button>
		<button  class="sign" onclick="copyUrl()">호텔링크 복사하기</button>
	<a href="/logout">로그아웃</a>
	<% } else if (memberNo == null){ // 로그인 안한 사람이 작성%>
		<button class="log" onclick="location.href='/tree/<%= treeNo%>/MessageForm'"> 트리 꾸며주기</button>
		<button class="sign" onClick="location.href='/'"> 나도 트리 만들래!</button>
	<% } else { // 로그인한 사람인데 다른 사람 트리 볼 때 %>
		<button class="sign" onclick="location.href='/tree/<%= treeNo%>/MessageForm'"> 트리 꾸며주기</button>
		<button class="log" onClick="location.href='/login'"> 내 트리로 가기 </button>
	<% } %>
  </div>
</body>
</html>