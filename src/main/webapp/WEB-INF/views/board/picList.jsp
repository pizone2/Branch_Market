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
	boardPicList
	<c:forEach items="${boardDTOs}" var="boardDTO">
		<h5>boardNum = ${boardDTO.boardNum}</h5>
		<h5>boardTitle = ${boardDTO.boardTitle}</h5>
	</c:forEach>
	
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>