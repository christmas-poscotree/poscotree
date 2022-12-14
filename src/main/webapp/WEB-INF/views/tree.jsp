<%@page import="domain.TreeDTO"%>
<%@page import="java.util.LinkedList"%>
<%@ page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
.root {
	padding: 0px;
	border: 0px;
	font: inherit;
	vertical-align: baseline;
	min-height: calc(var(- -vh, 1vh)* 100);
	width: 100%;
	margin: 0px auto;
	display: flex;
	flex-direction: column;
	overflow: auto;
}

.background {
	padding: 0px;
	border: 0px;
	font: inherit;
	vertical-align: baseline;
	min-height: calc(var(- -vh, 1vh)* 100);
	width: 100%;
	/* margin: 0px auto; */
	background-image: url( "../img/ssnow.gif" );
	background-size: cover;
	display: flex;
	flex-direction: column;
	overflow: auto;
	margin: 0px;
	position: relative;
	align-items: center;
	height: 100%;
	widows: 100%;
}

.bform {
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

.title {
	font-size: 30px;
	font-weight: bold;
	display: flex;
	flex-direction: column;
	-webkit-box-align: center;
	align-items: center;
	background-color: rgb(160, 32, 16);
	color: rgb(255, 255, 255);
	width: 281px;
	border-color: white;
	border-radius: 10px;
}

.treeform {
	display: flex;
	flex-direction: column;
	-webkit-box-align: center;
	align-items: center;
	position: relative;
}

.log {
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
	cursor: pointer;
}

.sign {
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
	margin-bottom: 30px;
	cursor: pointer;
}

div.x0 {
	position: relative;
	grid-column: 4/9;
}

div.x1 {
	position: relative;
	grid-row-start: 2;
	grid-column: 3/9;
}

div.x2 {
	position: relative;
	grid-row-start: 2;
	grid-column: 5/9;
}

div.x3 {
	grid-row-start: 3;
	position: relative;
	grid-column: 3/9;
}

div.x4 {
	grid-row-start: 3;
	position: relative;
	grid-column: 6/9;
}

div.x5 {
	grid-row-start: 4;
	position: relative;
	width: 150;
	grid-column: 2/8;
}

div.x6 {
	grid-row-start: 4;
	position: relative;
	grid-column: 3/8;
}

div.x7 {
	grid-row-start: 4;
	position: relative;
	grid-column: 6/8;
}

.table {
	margin: 0px;
	padding: 10px;
	position: absolute;
	display: grid;
	grid-template-columns: repeat(8, 40px);
	grid-template-rows: repeat(3, 100px);
	margin-top: 90px;
	gap: 35px;
}
</style>

<title>My tree</title>
<script type="text/javascript">
	let nowUrl = window.document.location.href;

	function copyUrl() {
		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("??????????????? ?????????????????????.")

	}

	function popOpen() {

		var modalPop = $('.modal-wrap');
		var modalBg = $('.modal-bg');

		$(modalPop).show();
		$(modalBg).show();

	}

	function popClose() {
		var modalPop = $('.modal-wrap');
		var modalBg = $('.modal-bg');

		$(modalPop).hide();
		$(modalBg).hide();

	}
</script>
</head>

<body>
	<%
	request.setCharacterEncoding("UTF-8");
	LinkedList<TreeDTO> list01 = (LinkedList<TreeDTO>) request.getAttribute("list");
	String treename = (String) request.getAttribute("tree_nm");
	Integer memberNo = (Integer) session.getAttribute("memberNo");
	Integer treeNo = (Integer) request.getAttribute("tree_no");
	Integer treeMemberNo = (Integer) request.getAttribute("nowMemberNo");
	%>
	<div class="background">
		<div class="root">
			<audio src="../img/christmas.mp3" controls autoplay loop style="margin-top: 20px; margin-left: 20px;"></audio>
			<div class="bform">
				<div class="title">
					<%=treename%>??? ??????
				</div>
				<br />

				<div class="treeform" style="">
					<img src="../img/img_tree.png" width=700 height=600>

					<div class="table">
						<%
						for (int i = 0; i < list01.size(); i++) {
						%>
						<div class="x<%=i%>" style="cursor: pointer;">
							<form>
								<img src="../img/<%=i%>.png" width=100 height=100
									onClick="location.href='/tree/<%=treeNo%>/<%=list01.get(i).getMessage_no()%>'">
							</form>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>


			<%
			if (memberNo != null && Objects.equals(treeMemberNo, memberNo)) { //??????????????????
			%>
			<div class='bform'>
				<button type="submit" class="log"
					onClick="location.href='/tree/<%=treeNo%>/message-list'"
					style="cursor: pointer;">?????? ????????????</button>
				<button type="submit" class="sign" onClick="copyUrl()"
					style="cursor: pointer;">???????????? ????????????</button>
				<button type="submit" class="log" onClick="location.href='/logout'"
					style="cursor: pointer;">????????????</button>
			</div>
			<%
			} else if (memberNo == null) { // ????????? ?????? ????????? ??????
			%>
			<div class='bform'>
				<button type="submit" class="log"
					onClick="location.href='/tree/<%=treeNo%>/MessageForm'">
					?????? ????????????</button>
				<button type="submit" class="sign" onClick="location.href='/'"
					style="cursor: pointer;">?????? ?????? ?????????!</button>
			</div>
			<%
			} else { // ???????????? ???????????? ?????? ?????? ?????? ??? ???
			%>
			<div class='bform'>
				<button type="submit" class="sign"
					onClick="location.href='/tree/<%=treeNo%>/MessageForm'"
					style="cursor: pointer;">?????? ????????????</button>
				<button type="submit" class="log" onClick="location.href='/login'"
					style="cursor: pointer;">??? ????????? ??????</button>
			</div>
			<%
			}
			%>


		</div>

	</div>
</body>
</html>