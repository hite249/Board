<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>view</title>
	
	<script type="text/javascript" src="/resources/js/main/view.js"></script>
</head>
<body>


		<div class="table-responsive">
			<table class="table">


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

			<a href="/board01/modify.do?no=${item.no}">수정</a> <a
				href="javascript:deleteCheck();">삭제</a> <a href="/board01/board.do">목록</a>

			<input type="hidden" id="no" value="${item.no}" /></body>
</html>
