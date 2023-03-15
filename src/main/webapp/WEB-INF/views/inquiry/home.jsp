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
	<a href="./add">문의글 작성</a>
	<a href = "./list?category=환불/취소">환불/취소 카테고리</a>
	<a href = "./list?category=신고">신고 카테고리</a>
	<a href = "./list?category=배송">배송 카테고리</a>
	<a href = "./list?category=기타">기타 카테고리</a>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>