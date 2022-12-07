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
</style>
<title>messageView</title>
</head>
<body>
<div class="background">
	<h>MessageView</h>
	<h1>${message }</h1>
	<h1>${sender }</h1>
	<%
		String message = (String) request.getAttribute("message");
		String name = (String) request.getAttribute("sender");
	%>
	</div>
</body>
</html>