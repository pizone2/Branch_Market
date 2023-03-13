<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<div class="container-fluid my-5">
	<div class="row mb-4 ">
		<h1 class="col-md-7 mx-auto text-center border-bottom border-dark pb-4">Board List Page</h1>
	</div>
	<div class="row col-md-7 mx-auto">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Num</th> <th>Title</th> <th>Writer</th> <th>Date</th> <th>Hit</th>  
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="dto">
					<td>${dto.boardNum}</td>
					<td>${dto.boardTitle}</td>
					<td>${dto.boardWriter}</td>
					<td>${dto.boardDate}</td>
					<td>${dto.boardHit}</td>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<a href="./add" class="btn btn-outline-primary col-3">게시물 올리기</a>
		</div>
	</div>
</div>
</body>
</html>