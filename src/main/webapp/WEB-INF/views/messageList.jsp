<%@page import="domain.TreeDTO"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
		 pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		
		<script type="text/javascript">
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

<style type="text/css">
.background{
    padding: 0px;
    border: 0px;
    font: inherit;
    vertical-align: baseline;
    min-height: calc(var(--vh,1vh) * 100);
    width: 100%;
    margin: 0px auto;
    background-image: url( "/img/ssnow.gif" );
  	background-size:cover;
    display: flex;
    flex-direction: column;
    overflow: auto;
}

#customers {
  font-family: Arial, Helvetica, sans-serif;
  width: 50%;
  margin: 200px auto;
  border-collapse: collapse;
  table-layout: fixed;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 3px;
  padding-left: 10px;
}

#customers tr{background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
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

.sign2{
	width: 50px;
    height: 30px;
    border-width: 1.5px;
    text-align: center;
    border-color: white;
    border-radius: 2px;
    background: #04AA6D;
    font-weight: 400;
    font-size: 14px;
    font-family: Nanum Pen Script;
    line-height: 20px;
    color: white;
    margin-top: 5px;
    margin-bottom: 5px;
    margin-left: 100px;
}

.btn {
	margin : 0px auto;
}

.caption {
	text-align: left;
	margin: 20px;
	font-size: 30px;
	font-weight: 600;
}


.modal_wrap{
        display: none;
        width: 500px;
        height: 500px;
        position: absolute;
        top:50%;
        left: 50%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 2;
    }
    .black_bg{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 100%;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        z-index: 1;
    }
    .modal_close{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -30px;
        right: 0;
    }
    .modal_close a{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }
    .modal_btn {
    	margin: 20px auto;
    }
    
    .title {
    position: relative;
    margin-top : 50px;
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
    
    .log{
	width: 281px;
    height: 40px;
    border-width: 1.5px;
    border-style: dashed;
    border-color: white;
    border-radius: 2px;
    background-color: rgb(175, 32, 16);
    outline: rgb(175, 32, 16) solid 9px;
    font-weight: 400;
    font-size: 23px;
    line-height: 20px;
    color: white;
    margin-top: 50px;
    margin-bottom: 10px;
    margin-left: 100px;
    font-weight: bold;
}


</style>
<script>
    window.onload = function() {
 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
    }
 
    document.getElementById('modal_btn').addEventListener('click', onClick);
    document.querySelector('.modal_close').addEventListener('click', offClick);
 
};
</script>


<title>MessageList</title>
</head>
<body>


<div class="background">
	<%
		LinkedList<TreeDTO> list01 = (LinkedList<TreeDTO>)request.getAttribute("list");
		String num = "1";
	%>

	
	<table id="customers">
	<caption class="caption">받은 메세지</caption>
		<tr>
			<th>메세지</th>
			<th> 보낸사람</th>
			<th> 받은 메세지 : <%= list01.size() %></th>
		</tr>
		<% for(int i = 0; i < list01.size(); i++) {%>
		<tr>
			<td> <%=list01.get(i).getMessage() %> </td>
			<td> <%=list01.get(i).getSender() %> </td>
			<td>
				<form method="post" action="/tree/<%= num %>/<%= list01.get(i).getMessage_no()%>">
					<input type="hidden" name="_method" value="delete">
					<input type="submit" value="삭제" class="sign2">
				</form>
			</td>
		</tr>
		<% } %>
	</table>

	<div class="btn">
	<button type="submit" class="sign" onClick="location.href='/login'">처음으로</button>
	</div>
	
	<!-- 여기는 모달 시작 -->
	<button type='button' id="modal_btn" class="sign modal_btn">이용방법</button>
<div class="black_bg"></div>
<div class="modal_wrap">
    <div class="modal_close"><a href="#">close</a></div>
    <div>
    	<button type="button" class="log">나만의 트리 만들기</button>
        <div class="title"> <img src="/img/3.png" class="img-size"/>크리스마스 트리 이용 방법</div>
        <div class="content">
        <img src="/img/0.png" class="img-size"/>회원가입을 해요.<br><br>
        <img src="/img/0.png" class="img-size"/>나만의 트리를 만들어요.<br><br>
        <img src="/img/0.png" class="img-size"/>친구에게 나의 트리를 공유해요.<br><br>
        </div>
    </div>
<div></div>
<!-- 여기는 모달 끝 -->

</div>



</body>
</html>