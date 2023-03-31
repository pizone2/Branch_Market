<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
    <form action="./update" method="post">
    	<input type="hidden" name="noticeNum" value="${noticeDTO.noticeNum}">
    	
        제목<input type="text" name="noticeTitle" value="${noticeDTO.noticeTitle}">
        내용<textarea name="noticeContents" id="noticeContents" cols="30" rows="10">${noticeDTO.noticeContents}</textarea>
        <input type="submit" value="글 작성">
    </form>
    <c:import url="../template/common_js.jsp"></c:import>
    <script>
    	$('#noticeContents').summernote();
    </script>
</body>
</html>