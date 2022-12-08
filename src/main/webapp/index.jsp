<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    /* background: linear-gradient(rgb(245, 200, 184) 5%, rgb(252, 244, 233), rgb(252, 244, 233), rgb(252, 244, 233), rgb(252, 244, 233)); */
    display: flex;
    flex-direction: column;
    overflow: auto;
}

.form{
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
.imag{
	text-align: center;
    padding: 0px;
    border: 0px;
    font: inherit;
    vertical-align: baseline;
    margin: 0px auto;
    }
    .pic_tree{
        text-align: center;
	    margin: 0px;
	    padding: 0px;
	    border: 0px;
	    font: inherit;
	    vertical-align: baseline;
	    width: 300px;
	    height: 315.16px;
	    margin-top: 27px;
    }
</style>

<title>메인 페이지</title>
</head>
<body>

	<div class="background">
		<div class="form">
	<!-- 원래는 로그인 페이지에서 로그인 누르면!  -->
			<div class="imag">
						<img src="../img/img_tree.png" class="pic_tree"/>
			</div>
			<button type="submit" class="log" onClick="location.href='/login'">내 트리로 로그인</button>
		    
		    
		    <button type="submit" class="sign" onClick="location.href='/signup'">트리 만들기</button>
		     
	    </div>
	    </div>
</body>
