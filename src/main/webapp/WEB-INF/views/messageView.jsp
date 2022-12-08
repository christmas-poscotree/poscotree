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
    width: 100%;
    margin: 0px auto;
  	background-image: url( "../../img/ssnow.gif" );
  	background-size:cover;

    display: flex;
    flex-direction: column;
    overflow: auto;
}
.mess{
	margin-left:40%;
    overflow: hidden;
    box-sizing: border-box;
    min-height: 183px;
    width: 293px;
    margin-top: 33px;
    padding: 25px;
    background: rgb(255, 255, 255);
    border: 1px solid rgb(217, 217, 217);
    border-radius: 7px;
    text-align: center;
    font-size: 13px;
    font-family: Nanum Pen Script;
    line-height: 19px;
    resize: none;
    height: 180px;
    
    text-align: center;
    
    height: fit-content;
  
    box-sizing: border-box;
    border: 2px dashed rgb(164, 214, 203);
    border-radius: 3px;
    box-shadow: white 0px 0px 0px 8px, rgb(164, 214, 203) 0px 0px 0px 10px;
}
.send{    text-align: center;
    margin: 0px;
    padding: 0px;
    border: 0px;
    font: inherit;
    vertical-align: baseline;
    margin-bottom: 10px;
    font-size: 12px;
    color: rgb(110, 110, 110);
    }

</style>
<title>messageView</title>
</head>
<body>
<div class="background">

	<div class="mess" >
	<h1>${message }</h1>
	
	<div class="send">
		<h3>From. ${sender }</h3>
	
	</div>
	</div>
	<%
		String message = (String) request.getAttribute("message");
		String name = (String) request.getAttribute("sender");
	%>
	</div>
</body>
</html>