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
			<div class="input-group mb-3 col">
			  <span class="input-group-text">제목</span>
			  <input type="text" readonly class="form-control" id="boardTitle" value="${dto.boardTitle}">
			</div>
			<div class="col-auto">
				<button type="button" class="btn btn-outline-success" data-bs-toggle="button" aria-pressed="true">Pic</button>
			</div>
		</div>
		
		<div class="row">
			<div class="input-group mb-3 col">
			  <span class="input-group-text">판매구매</span>
			  <input type="text" readonly class="form-control" id="boardState" value="${dto.boardState}">
			</div>
			<div class="input-group mb-3 col">
			  <span class="input-group-text">가격</span>
			  <input type="text" readonly class="form-control" id="boardPrice" value="${dto.boardPrice}">
			</div>
			<div class="input-group mb-3 col">
			  <span class="input-group-text">카테고리</span>
			  <input type="text" readonly class="form-control" id="boardCategory" value="${dto.boardCategory}">
			</div>
		</div>
		
		<div class="row">
			<div class="input-group mb-3 col">
			  <span class="input-group-text">내용</span>
			  <%-- <textarea name="boardContents" readonly class="form-control" id="boardContents" rows="5" placeholder="내용 입력">${dto.boardContents}</textarea> --%>
			  <span name="boardContents" readonly class="form-control" id="boardContents" rows="5" th:utext>${dto.boardContents}</span>
			</div>
		</div>
	    
	<div class="row col-md-9 mx-auto my-4 justify-content-center">
		<a href="./delete?boardNum=${dto.boardNum}" class="btn btn-outline-danger col-3" id="delete">게시물 삭제</a>
		<a href="./update?boardNum=${dto.boardNum}" class="btn btn-outline-success col-3 mx-2">게시물 수정</a>
		<a href="./list" class="btn btn-success col-3">목록으로</a>
	</div>
</div>
</div>
<script>
const del = document.getElementById("delete");
const frm = document.getElementById("frm");

del.addEventListener("click", function(){
    let check = window.confirm("정말 삭제ㄱ?");
    if(check==true){
        frm.setAttribute("action","./delete");
        frm.setAttribute("method","post");
        frm.submit();
    }else{
    	return false;
    }

})
</script>
</body>
</html>