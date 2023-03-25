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
	<c:forEach items="${roomDTOs}" var="dto">
		<h5>채팅방 번호 ${dto.roomNum}</h5>
		<h5>채팅방 제목 <a href="./room/${dto.roomNum}">${dto.roomTitle}</a></h5>
	</c:forEach>
	
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>