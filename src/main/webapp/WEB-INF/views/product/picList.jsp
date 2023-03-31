<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container-fluid my-5">
	<div class="row mb-4 ">
		<h1 class="col-md-7 mx-auto text-center border-bottom border-dark pb-4">장바구니</h1>
	</div>
		<div class="row col-md-7 mx-auto">
		<div class="row">
			<c:forEach items="${productDTOs}" var="dto">
				<h5>productNum = ${dto.productNum}</h5>
				<h5>productTitle = ${dto.productTitle}</h5>
				<h5>productImgName=<img src="${dto.productImgName}" alt="" style="height: 100px;"></h5>
				<h5>productPrice = ${dto.productPrice}</h5>
			
				<button type="submit" class="btn btn-outline-danger col-3" id="picDelete">장바구니에서 삭제</button>
				
			</c:forEach>
			</div>
	
		</div>
		</div>

<script src="/resources/js/product/productPic.js"></script>
<c:import url="../template/common_js.jsp" ></c:import>
</body>
</html>