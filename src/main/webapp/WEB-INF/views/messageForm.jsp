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
    width: 768px;
    width: 100%;
    margin: 0px;
    background: linear-gradient(rgb(245, 200, 184) 5%, rgb(252, 244, 233), rgb(252, 244, 233), rgb(252, 244, 233), rgb(252, 244, 233));
    background-image: url( "/img/ssnow.gif" );
  	background-size:cover;
    display: flex;
    flex-direction: column;
    overflow: auto;
}

.sign{
	width: 288px;
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
    margin-left: 50px;
    cursor: pointer;
}

.btn {
	margin : 0px auto;
	cursor: pointer;
}

.caption {
	text-align: left;
	margin: 20px;
	font-size: 30px;
	font-weight: 600;
}

    
    .img-size {
    padding-right: 5px;
    with: 20px;
    height: 20px;
    }
    
    .log{
    border-width: 1.5px;
    border-style: dashed;
    border-color: white;
    border-radius: 2px;
    background-color: rgb(175, 32, 16);
    outline: rgb(175, 32, 16) solid 9px;
    font-weight: 200;
    font-size: 15px;
    color: white;
    font-weight: bold;
    margin-bottom: 20px;  
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
		<div style="margin: 20px auto;">
        <h1>메세지를 남겨보세요:)</h1>
        </div>
        <div style="margin: 100px auto;">
        <form method="post" action="/tree/<%= treeNo %>/send" accept-charset="UTF-8">
            <textarea rows="10" cols="40" class="log" name="message" placeholder="메세지"></textarea><br />
            <textarea rows="1" cols="40" class="log" name="sender" placeholder="보내는 사람"></textarea><br />
            <div style="margin: 10px auto;">
            <input class="sign" type="submit" value="보내기" /><br>
            <button class="sign" type="button" style="margin-top: 30px;" onClick="history.go(-1)">이전으로</button>
            </div>
        </form>
        </div>
        </div>
    </body>
</html>