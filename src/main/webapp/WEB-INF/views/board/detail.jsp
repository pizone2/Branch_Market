<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Detail</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<div class="container-fluid my-5">
	<div class="row mb-4 ">
		<h1 class="col-md-7 mx-auto text-center border-bottom border-dark pb-4">Board Detail Page</h1>
	</div>
	<div class="row col-md-7 mx-auto">
	<div class="row">
	    <div class="fw-bold fs-5 col-12">
	    	<input type="text" readonly class="form-control-plaintext" id="boardTitle" value="${dto.boardTitle}">
	    </div>
	    <div class="fw-bold fs-5 col-12">
	    	<input type="text" readonly class="form-control-plaintext" id="boardTitle" value="${dto.boardState}">
	    	<input type="text" readonly class="form-control-plaintext" id="boardTitle" value="${dto.boardPrice}">
	    </div>
	    <h3>${dto.boardContents}</h3>
	</div>
	<div class="row col-md-7 mx-auto my-2">
		<a href="./delete?boardNum=${dto.boardNum}" class="btn btn-outline-danger col-3" id="delete">게시물 삭제</a>
		<a href="./update?boardNum=${dto.boardNum}" class="btn btn-outline-success col-3 mx-2">게시물 수정</a>
		<a href="./list" class="btn btn-success col-3">목록으로</a>
	</div>
</div>
<script>
const del = document.getElementById("delete");
const frm = document.getElementById("frm");

del.addEventListener("click", function(){
    let check = window.confirm("정말 삭제ㄱ?");
    if(check){
        frm.setAttribute("action","./delete");
        frm.setAttribute("method","post");
        frm.submit();
    }

})
</script>
</body>
</html>