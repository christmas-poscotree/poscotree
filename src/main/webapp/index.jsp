<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>

<meta charset="UTF-8">

<script type="text/javascript">
	window.onload = function() {

		function onClick() {
			document.querySelector('.modal_wrap').style.display = 'block';
			document.querySelector('.black_bg').style.display = 'block';
		}
		function offClick() {
			document.querySelector('.modal_wrap').style.display = 'none';
			document.querySelector('.black_bg').style.display = 'none';
		}

		document.getElementById('modal_btn').addEventListener('click', onClick);
		document.querySelector('.modal_close').addEventListener('click',
				offClick);

	};
</script>

<style type="text/css">
.modal_wrap {
	display: none;
	width: 500px;
	height: 500px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -250px 0 0 -250px;
	background: #eee;
	z-index: 2;
}

.black_bg {
	display: none;
	position: absolute;
	content: "";
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	top: 0;
	left: 0;
	z-index: 1;
}

.modal_close {
	width: 26px;
	height: 26px;
	position: absolute;
	top: -30px;
	right: 0;
}

.modal_close a {
	display: block;
	width: 100%;
	height: 100%;
	background: url(https://img.icons8.com/metro/26/000000/close-window.png);
	text-indent: -9999px;
}

.modal_btn {
	margin: 20px auto;
}

.title {
	position: relative;
	margin-top: 50px;
	margin-left: 50px;
	font-style: normal;
	font-weight: bold;
	font-size: 20px;
	line-height: 30px;
	text-align: left;
}

.content {
	margin-top: 30px;
	margin-left: 50px;
}

.img-size {
	padding-right: 5px;
	with: 20px;
	height: 20px;
}

.background {
	padding: 0px;
	border: 0px;
	font: inherit;
	vertical-align: baseline;
	min-height: calc(var(- -vh, 1vh)* 100);
	width: 100%;
	margin: 0px auto;
	background-image: url( "../img/ssnow.gif" );
	background-size: cover;
	display: flex;
	flex-direction: column;
	overflow: auto;
	height: 100%;
}

.form {
	margin: 0px;
	padding: 0px;
	border: 0px;
	font: inherit;
	vertical-align: baseline;
	display: flex;
	flex-direction: column;
	-webkit-box-align: center;
	align-items: center;
	font-family: Nanum Pen Script;
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
	margin-top: 50px;
	margin-bottom: 20px;
	cursor: pointer;
}

.log2 {
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
	margin-top: 50px;
	margin-bottom: 20px;
	margin-left: 100px;
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
	margin: 10px;
	cursor: pointer;
}

.imag {
	text-align: center;
	padding: 0px;
	border: 0px;
	font: inherit;
	vertical-align: baseline;
	margin: 0px auto;
}

.pic_tree {
	text-align: center;
	margin: 0px;
	padding: 0px;
	border: 0px;
	font: inherit;
	vertical-align: baseline;
	width: 600px;
	height: 500px;
	margin-top: 27px;
}


      p {
        font-family: "Arial Black", sans-serif;
        font-size: 36px;
        font-weight: bold;
        color: #F44336;
        display: flex;
        justify-content: space-around;
      }
      .s3 { text-shadow: 2px 8px 6px rgba(0,0,0,0.2), 0px -3px 20px rgba(255,255,255,0.4);}

</style>

<title>메인 페이지</title>
</head>
<body>

	<div class="background">
		<p class="s3">꾸며줘! 나의 트리</p>
		<div class="form">
			<!-- 원래는 로그인 페이지에서 로그인 누르면!  -->
			<div class="imag">
				<img src="../img/img_tree.png" class="pic_tree" />
			</div>
			<button type="submit" class="log" onClick="location.href='/login'">내
				트리로 로그인</button>
			<button type="submit" class="sign" onClick="location.href='/signup'">트리
				만들기</button>
			<!-- 여기는 모달 시작 -->
			<button type='button' id="modal_btn" class="log modal_btn"
				style="margin-top: 20px;">이용방법</button>
			<div class="black_bg"></div>
			<div class="modal_wrap">
				<div class="modal_close">
					<a href="#">close</a>
				</div>
				<div>
					<button type="button" class="log2">나만의 트리 만들기 방법</button>
					<div class="title">
						<img src="/img/3.png" class="img-size" />크리스마스 트리 이용 방법
					</div>
					<div class="content">
						<img src="/img/0.png" class="img-size" />회원가입을 해요.<br> <br>
						<img src="/img/0.png" class="img-size" />나만의 트리를 만들어요.<br> <br>
						<img src="/img/0.png" class="img-size" />친구에게 나의 트리를 공유해요.<br>
						<br>
					</div>
				</div>
				<!-- 여기는 모달 끝 -->
			</div>
		</div>
</body>
