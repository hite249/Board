<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
	<script type="text/javascript" src="/resources/js/jquery/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/main/view.js"></script>
</head>
<body>

<table>
<tr>
	<th>번호</th>
	<td>${item.no}</td>
</tr>
<tr>
	<th>제목</th>
	<td>${item.subject}</td>
</tr>
<tr>
	<th>내용</th>
	<td>${item.content}</td>
</tr>
</table>
<a href="/main/modify.do?no=${item.no}">수정</a>
<a href="javascript:deleteCheck();">삭제</a>
<a href="/main/main.do">목록</a>

<input type="hidden" id="no" value="${item.no}" />
</body>
</html>
