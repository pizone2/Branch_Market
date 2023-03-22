<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

productPicMyList
<c:forEach items="${productDTOs}" var="dto">
	<h5>productNum = ${dto.productNum}</h5>
	<h5>productTitle = ${dto.productTitle}</h5>
	<h5>productImgName=<img src="${dto.productImgName}" alt="" style="height: 100px;"></h5>
	<h5>productPrice = ${dto.productPrice}</h5>
</c:forEach>