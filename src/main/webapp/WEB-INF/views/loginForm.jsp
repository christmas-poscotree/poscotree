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
        <meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
        <style type="text/css">
      @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

        * {
            font-family: Nanum Pen Script;
        }

        body {
            background-color: #1BBC9B;
        }

        div {
            margin: 250px auto;
            width: 300px;
            background-color: #EEEFF1;
            border-radius: 5px;
            text-align: center;
            padding: 20px;
        }

        input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border-radius: 5px;
            border: none;
        }

        .in {
            margin-bottom: 10px;
        }

        #btn {
            background-color: #1BBC9B;
            margin-bottom: 30px;
            color: white;
            cursor: pointer;
        }

        a {
            text-decoration: none;
            color: #9B9B9B;
            font-size: 12px;
        }
        </style>
    </head>
    <body>
    <div>
    <header>
            <h2>로그인</h2>
        </header>
        <form method="post" action="/login">
			<input type="email" name="email" required class="in" placeholder="이메일"/> <br>   
            <input type="password" name="password" required class="in" placeholder="비밀번호"/> <br>
            <input type="submit" value="로그인" id="btn">
        </form>
    </div>    
    </body>
</html>
