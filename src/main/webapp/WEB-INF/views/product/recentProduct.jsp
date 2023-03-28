<%@page import="com.main.branch.product.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 위탁상품 리스트</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container-fluid my-5">
	<div class="row mb-4">
		<h1 class="col-md-7 mx-auto text-center border-bottom border-dark pb-4">최근 본 상품 리스트</h1>
	</div>
	
	<div class="row col-md-7 mx-auto">
		<table class="table table-hover">
				<thead>
					<tr>
						<th>상품번호</th>
						<th>상품명</th>
						<th>카테고리</th>
						<th>이미지</th>
						<th>품질</th>
						<th>상품 가격</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
					<c:forEach items="${productDTOs}" var="dto"> 
					
						<tr>
							<td><a>${dto.productNum}</a></td>
							<td><a href="./detail?productNum=${dto.productNum}">${dto.productTitle}</a></td>
							<td><a>${dto.productCategory}</a></td>
							<td><img src="${dto.productImgName}" alt="" style="height: 100px;"></td>
							<td><a>${dto.productQ}</a></td>
							<td><a>${dto.productPrice}</a></td>
						</tr>
				
					</c:forEach>
				</tbody>
			</table>
			
	</div>
</div>
	<c:import url="../template/common_js.jsp"></c:import>
 </body>
</html>