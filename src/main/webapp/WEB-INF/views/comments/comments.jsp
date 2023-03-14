<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>

<!--  -->
<table class="table table-striped">
	<c:forEach items="${list}" var="dto"> 
		<tr>
			
			
		</td>
		<td>${dto.commentsNum}</td>
		<td>${dto.boardNum}</td>
		<td>${dto.memberId}</td>	
		<td>${dto.commentsContents}</td>	
		<td>${dto.commentsRegDate}</td>
		
		<td>
			
			<button class="btn btn-danger del" id="del" data-comment-num="${dto.commentsNum}">DELETE</button>		
			
			
			<button class="btn btn-info update" data-bs-toggle="modal" data-bs-target="#contentsModal" data-comment-num="${dto.commentsNum}">UPDATE</button>
			
		</td>	
	</c:forEach>
</table>
<div class="col-8" class="input_reply_div">
	<input class="w-100 form-control" id="newReplyText"type="text" placeholder="댓글입력...">
</div>
<div class="col-3 ">
	<button type="button" id="replyAddBtn"class="btn btn-success mb-1 write_reply">댓글&nbsp;달기</button>
</div>



<!-- <script src="/src/main/webapp/resources/js/comments/comments.js"></script> -->
<script src="../resources/js/comments/comments.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>