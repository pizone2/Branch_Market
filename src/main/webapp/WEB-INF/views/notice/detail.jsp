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
	<div hidden id="datas" data-noticeNum = ${noticeDTO.noticeNum}></div>

	작성자<h2>${noticeDTO.memberId}</h2>
	제목<h2>${noticeDTO.noticeTitle}</h2>
	내용<h2>${noticeDTO.noticeContents}</h2>
	조회수<h2>${noticeDTO.noticeHit}</h2>

  
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>