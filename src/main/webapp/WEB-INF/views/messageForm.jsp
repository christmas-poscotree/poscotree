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
    margin: 0px auto;
    background: linear-gradient(rgb(245, 200, 184) 5%, rgb(252, 244, 233), rgb(252, 244, 233), rgb(252, 244, 233), rgb(252, 244, 233));
    display: flex;
    flex-direction: column;
    overflow: auto;
}
</style>
        <meta charset="EUC-KR" />
        <title>MessageForm</title>
    </head>
    <body>
    <%
    	String treeNo = (String) request.getAttribute("tree_No");
    %>
        <h1>�޼����� �Է��ϼ���:)</h1>
        <form method="post" action="/tree/<%= treeNo %>/send" accept-charset="UTF-8">
            <textarea rows="10" cols="50" name="message" placeholder="���� ���� ������ �Է��ϼ���." > </textarea><br />
            <textarea rows="1" cols="50" name="sender" placeholder="�г����� �Է����ּ���." ></textarea><br />
            <input type="submit" value="insert" />
        </form>
    </body>
</html>
