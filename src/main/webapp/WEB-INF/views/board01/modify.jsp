<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>수정</title>
	<script type="text/javascript" src="/resources/js/jquery/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/main/modify.js"></script>
</head>
<body>
<form name="frm" action="/board01/update.do" method="post">
<input type="hidden" name="no" value="${item.no}" />
<table>
<tr>
	<th>제목</th>
	<td><input type="text" name="subject" id="subject" value="${item.subject}" /></td>
</tr>
<tr>
	<th>내용</th>
	<td><input type="text" name="content" id="content" value="${item.content}" /></td>
</tr>
<tr>
	<th>?????</th>
	<td><a href="javascript:updateCheck();">업데이트</a></td>
</tr>
</table>
</form>

<a href="/board01/view.do?no=${item.no}">상세보기</a>
<a href="/board01/board.do">목록</a>
</body>
</html>
