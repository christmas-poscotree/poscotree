<%@page import="domain.TreeDTO"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
		 pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">

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

#customers {
  font-family: Arial, Helvetica, sans-serif;
  width: 90%;
  margin: 200px auto;
  border-collapse: collapse;
  table-layout: fixed;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

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
    margin-top: 9px;
    margin-bottom: 9px;
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

</style>
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
		</div>
</body>
</html>