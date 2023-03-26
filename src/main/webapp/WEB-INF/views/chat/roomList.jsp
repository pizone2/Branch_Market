<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
	<a href="./roomAdd">방 만들기</a>
		<!-- 검색창 -->
		<div class = "row">
			<form class="row g-3" action="./roomList" method="get" id="paginingForm">
				<div class="col-auto">
				  <label for="search" class="visually-hidden">Search</label>
				  <input type="text" class="form-control" name="search" id="search" placeholder="제목을 입력 하세요." value="${pager.search}">
				</div>
				<div class="col-auto">
				  <button type="submit" class="btn btn-primary mb-3">검색</button>
				</div>
		  </form>
	  </div>
	<c:forEach items="${roomDTOs}" var="dto">
		<h5>채팅방 번호 ${dto.roomNum}</h5>
		<h5>채팅방 제목 <a href="./room/${dto.roomNum}">${dto.roomTitle}</a></h5>
		<h5>안 읽은 메세지 수 ${dto.unReadCnt}</h5>
	</c:forEach>
	

    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>