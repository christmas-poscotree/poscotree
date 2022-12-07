<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>메인 페이지</title>
</head>
<body>


    <a href="t2">메세지 메인 이동</a><br/>
    <a href="t1">링크1</a><br/>

    <a href="login">로그인</a><br/>
    <a href="trees/create">트리 생성하기</a><br/>
    <a href="tree/{tree_no}/{message_no}">메세지 보기</a>
    <a href="tree/{tree_no}/message-list}">리스트 보기</a>

    <a href="tree/create">트리 생성하기</a><br/>

    <a href="login">내 트리로 로그인</a><br/>
    <a href="signup">내 트리 만들기</a><br/>
</body>
