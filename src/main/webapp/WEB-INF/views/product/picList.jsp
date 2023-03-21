<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

productPicList
<c:forEach items="${productDTOs}" var="dto">
	<h5>boardNum = ${dto.productNum}</h5>
	<h5>boardTitle = ${dto.productTitle}</h5>
	<h5><img src="${dto.productImgName}" alt="" style="height: 100px;"></h5>
	<h5><a>${dto.productPrice}</a></h5>
</c:forEach>