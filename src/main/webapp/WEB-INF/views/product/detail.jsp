<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위탁상품 상세 정보</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container-fluid">
	<div class="row">
	<h1>위탁상품 상세 정보</h1>
	
	<h3>${dto.productTitle}</h3>
	<h3>${dto.productDetail}</h3>
	<h3>${dto.productQ}</h3>
	<h3>${dto.productPrice}</h3>
		
		<div class="my-5">
				<%-- <c:if test="${dto.writer eq member.id}"> --%>
				<button id="update" type="submit" class="btn btn-info">수정</button>
				<button id="delete" type="button" class="btn btn-danger">삭제</button>
				<%-- </c:if> --%>
			
		</div>
	</div>
</div>

<c:import url="../template/common_js.jsp" ></c:import>
</body>
</html>