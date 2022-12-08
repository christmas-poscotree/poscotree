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
.root{
    padding: 0px;
    border: 0px;
    font: inherit;
    vertical-align: baseline;
    min-height: calc(var(--vh,1vh) * 100);
    width: 100%;
    margin: 0px auto;
	
    display: flex;
    flex-direction: column;
    overflow: auto;
}

.background{
    padding: 0px;
    border: 0px;
    font: inherit;
    vertical-align: baseline;
    min-height: calc(var(--vh,1vh) * 100);
    width: 100%;
    /* margin: 0px auto; */
    background-image: url( "../img/ssnow.gif" );
  	background-size:cover;
    display: flex;
    flex-direction: column;
    overflow: auto;
    margin: 0px;
    position: relative;
  	align-items: center;
    height: 100%;
}

.bform{
    margin: 0px;
    padding: 0px;
    border: 0px;
    font: inherit;
    vertical-align: baseline;
    display: flex;
    flex-direction: column;
   -webkit-box-align: center;
    align-items: center;
    margin-top: 50px;
    position: relative;
    
}
.title{
    font-size: 30px;
    font-weight: bold;
    display: flex;
    flex-direction: column;
    -webkit-box-align: center;
    align-items: center;
    background-color: rgb(160, 32, 16);
    color: rgb(255,255,255);
    width: 281px;
    border-color: white;
    border-radius: 10px;
}

.treeform{
    display: flex;
    flex-direction: column;
    -webkit-box-align: center;
    align-items: center;
    position: relative;
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
    margin-bottom: 30px;
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
    margin-bottom: 100px;
   
}

			div.x0 {
			position: relative;
			grid-column: 3/ 5;
			}
			div.x1 {
				position: relative;
				grid-row-start: 2;
				grid-column:2/5;
			}
			div.x2 {
				position: relative;
				grid-row-start: 2;
				grid-column: 4/5;
			}
			div.x3 {
			grid-row-start: 3;
				position: relative;
				grid-column : 2 /  5;
			}
			div.x4 {
			grid-row-start: 3;
			position: relative;
			grid-column : 4/  5;
			
			}
.table{
  margin: 0px;
    padding: 10px;
    position: absolute;
    display: grid;
    grid-template-columns: repeat(6, 30px);
    grid-template-rows: repeat(3, 100px);
    margin-top: 90px;
    gap:35px;
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
	<div class="root">
		<div class="background">
		
		<div class ="bform"> 
			<div class ="title">
				<%=treename%>의 트리
			</div>
			<br />
			
			<div class="treeform" style=" ">
			<img src="../img/img_tree.png" width=700 height = 600 >
			
				<div class="table">
				<% for(int i = 0; i<list01.size(); i++) {%>
					<div class="x<%=i%>" style="cursor: pointer;">
					<form>
						<img src="../img/<%= i %>.png" width=100 height = 100
						onClick="location.href='/tree/<%=treeNo%>/<%=list01.get(i).getMessage_no()%>'">
					</form>
					</div>
				<% }%>
				</div>
			</div>
		</div>
		
		
		<% if(memberNo != null && Objects.equals(treeMemberNo, memberNo)) { //로그인했을때 %>
			<div class='bform'>
			<button  type="submit" class="log" onClick="location.href='/tree/<%=treeNo%>/message-list'"style="cursor: pointer;">편지 확인하기</button>
			<button  type="submit" class="sign" onClick="copyUrl()"style="cursor: pointer;">호텔링크 복사하기</button>
		<a href="/logout">로그아웃</a>
		</div>
		<% } else if (memberNo == null){ // 로그인 안한 사람이 작성%>
			<div class='bform'>
			<button type="submit" class="log" onClick="location.href='/tree/<%= treeNo%>/MessageForm'" > 트리 꾸며주기</button>
			<button type="submit" class="sign" onClick="location.href='/'" style="cursor: pointer;"> 나도 트리 만들래!</button>
			</div>
		<% } else { // 로그인한 사람인데 다른 사람 트리 볼 때 %>
			<div class='bform'>
			<button type="submit" class="sign" onClick="location.href='/tree/<%= treeNo%>/MessageForm'"style="cursor: pointer;"> 트리 꾸며주기</button>
			<button type="submit" class="log" onClick="location.href='/login'"style="cursor: pointer;"> 내 트리로 가기 </button>
			</div>
		<% } %>
		
		
	  </div>
	  
	 </div>
</body>
</html>