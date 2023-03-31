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
    <form action="./add" method="post">
        제목<input type="text" name="inquiryTitle">
        내용<textarea name="inquiryDetail" id="inquiryDetail" cols="30" rows="10"></textarea>
        카테고리
        <select name="inquiryCategory" id="pet-select">
            <option value="환불/취소">환불/취소</option>
            <option value="신고">신고</option>
            <option value="배송">배송</option>
            <option value="기타">기타</option>
        </select>
        <input type="submit" value="글 작성">
    </form>
    <c:import url="../template/common_js.jsp"></c:import>
    <script>
    	$('#inquiryDetail').summernote();
    </script>
</body>
</html>