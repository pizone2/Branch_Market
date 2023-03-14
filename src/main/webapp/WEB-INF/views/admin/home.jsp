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
	<h3>관리자 페이지 입니다.</h3>
	<a href="./add" class="btn btn-primary">관리자 추가하기</a>
	<a href="./memberList" class="btn btn-primary">멤버 리스트 보기</a>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>