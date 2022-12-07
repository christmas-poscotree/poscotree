<%--
  Created by IntelliJ IDEA.
  User: coalong
  Date: 2022/12/07
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <h1>로그인</h1>
        <form method="post" action="/login">
            이메일 <input type="email" , name="email" required/> <br>
            비밀번호 <input type="password" , name="password" required/> <br>
            <input type="submit" value="로그인">
        </form>
    </body>
</html>
