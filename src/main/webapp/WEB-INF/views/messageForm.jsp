<%@page import="java.sql.PreparedStatement"%> <%@page
import="repository.MessageRepository"%> <%@ page language="java"
contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
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
  width: 90%;
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
    margin-left: 80px;
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
        <meta charset="EUC-KR" />
        <title>MessageForm</title>
    </head>
    <div class="background">
    <body>
    <%
    	String treeNo = (String) request.getAttribute("tree_No");
    %>

        <h1>메세지를 입력하세요:)</h1>
        <form method="post" action="/tree/<%= treeNo %>/send" accept-charset="UTF-8">
            <textarea rows="10" cols="50" class="log" name="message" placeholder="메세지 작성하세요"></textarea><br />
            <textarea rows="1" cols="50" class="log" name="sender" placeholder="보내는 사람쓰세요"></textarea><br />
             <input style = "margin-left : 100px"class="sign" type="submit" value="insert" />
        </form>
        </div>
    </body>
</html>
