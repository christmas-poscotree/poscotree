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
        <h1>�޼��� �Է��ϼ���:)</h1>
        <form method="post" action="tree/{tree_no}/send" accept-charset="UTF-8">
            <textarea name="message">�޼��� : </textarea><br />
            <input type="text" name="sender" /><br />
            <input type="submit" value="insert" />
        </form>
    </body>
</html>
