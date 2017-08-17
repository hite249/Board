<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>


	
	
<title>게시판2</title>
	<script type="text/javascript" src="/resources/js/jquery/jquery-3.2.1.min.js"></script>
</head>



 
<body>
	<input type="button" value ="메인" onclick="location.href='/main/main.do'" >
	<input type="button" value ="게시판01" onclick="location.href='/board01/board.do'" >

<table>
<br/>
글갯수 : ${board02TotalCount}
<c:forEach items="${board02List}" var="item" varStatus="status">
<tr>
	<td>
		 <a href="/board02/view.do?no=${item.no}">
			${item.rn}
		</a>
	</td>
	<td>${item.subject}</td>
</tr>
</c:forEach>
</table>
<a href="/board02/board.do?page=${board02FirstPage}">처음</a>
<a href="/board02/board.do?page=${board02PrevPage}">이전</a>
<c:forEach begin="${begin}" end="${end}" var="item" varStatus="status">
	<span <c:if test="${param.page == item}">style='font-size:20px;'</c:if>>
		<a href="/board02/board.do?page=${item}">${item}</a>
	</span>
</c:forEach>
<a href="/board02/board.do?page=${board02NextPage}">다음</a>
<a href="/board02/board.do?page=${board02LastPage}">끝</a>
</body>



</html>