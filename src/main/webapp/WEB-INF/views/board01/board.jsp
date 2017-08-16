<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>

<html>
<head>
<!-- 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	 -->
</head>
<!-- 
<script>
	function moveMain(){
		location.href="/main/main.do"
	}
	function moveBoard2(){
		location.href="/board02/board.do"
	}
</script> -->
<body>

	<!--  
	<div class="container">
		<h5>
			<a href="/main/main.do" class="btn btn-info" role="button" ">메인</a> <a href="/board02/board.do" class="btn btn-info" role="button" ">게시판2</a>
		</h5>
	-->	
		<input type="button" value ="메인" onclick="location.href='/main/main.do'" >
		<input type="button" value ="게시판02" onclick="location.href='/board02/board.do'" >
		<table>
		<br/>
		bla~ bla~ bla~ 글 갯수:${totalCount1}
		
	<!--  
		<div class="table-responsive">
			<table class="table">
	 -->		
	 			
	
	  
					<tr>
						<th>No</th>
						<th>Subject</th>
						<br/>
					</tr>
				
			
<c:forEach items="${listB}" var="item" varStatus="status">
<tr>
	<td>
		<a href="/board01/view.do?no=${item.no}">
			${item.rn}
		</a>
	</td>
	<td>${item.subject}</td>
</tr>
</c:forEach>
</table>

<a href="/board01/board.do?page=${firstBPage}" ><b> << </b></a>
<a href="/board01/board.do?page=${prevBPage}"> < </a>

<c:forEach begin="${beginB}" end="${endB}" var="item" varStatus="status">
	<span <c:if test="${param.page == item}">style='font-size:25px;'</c:if>>
		<a href="/board01/board.do?page=${item}">${item}</a>
	</span>
</c:forEach>
<a href="/board01/board.do?page=${nextBPage}"> ></a>
<a href="/board01/board.do?page=${lastBPage}" ><b> >> </b></a>
<!--  
<a href="/board01/write.do" class="btn btn-success" role="button">글쓰기</a>
-->
<!-- 
</div>

			
		</div>
		

	</div>
 -->
</body>
</html>