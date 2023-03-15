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

	작성자<h2>${inquiryDTO.memberId}</h2>
	제목<h2>${inquiryDTO.inquiryTitle}</h2>
	내용<h2>${inquiryDTO.inquiryDetail}</h2>
	카테고리<h2>${inquiryDTO.inquiryCategory}</h2>
	<div id="commentsList"></div>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>