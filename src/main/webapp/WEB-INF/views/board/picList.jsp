<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

boardPicList
<c:forEach items="${boardDTOs}" var="dto">
	<h5>boardNum = ${dto.boardNum}</h5>
	<h5>boardTitle = ${dto.boardTitle}</h5>
</c:forEach>