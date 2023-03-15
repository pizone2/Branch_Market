<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board update</title>
<c:import url="../template/common_css.jsp"></c:import>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
<div class="container-fluid my-5">
	<div class="row mb-4 ">
		<h1 class="col-md-7 mx-auto text-center border-bottom border-dark pb-4">Board Update Page</h1>
	</div>
	
	<div class="row col-md-7 mx-auto">
		<form action="./update" method = "post">
			<input type="hidden" name="boardNum" value="${dto.boardNum}">
			
	    	<div class="row">
	        	<div class="fw-bold fs-5 col-12">
	           		<p>작성자</p>
	           		<input type="text" name="memberId" readonly="readonly" value="${dto.memberId}" class="form-control" id="memberId" placeholder="이름 입력"><br>
	        	</div>
	        	
	         	<div class="fw-bold fs-5 col-12">
	            	<p>제목</p>
	            	<div class="form-check">
		        	 	<input type="radio" class="btn-check" ${dto.boardState eq "판매"?'checked':''} name="boardState" vlaue="판매" id="boardState" checked>
						<label class="btn btn-outline-success" for="boardState">판매</label>
						<input type="radio" class="btn-check" ${dto.boardState eq "구매"?'checked':''} name="boardState" vlaue="구매" id="boardState1">
						<label class="btn btn-outline-success" for="boardState1">구매</label>
					</div>
					<div class="fw-bold fs-5 col-12">
	            	<input type="text" name="boardTitle" class="form-control my-2" value="${dto.boardTitle}" id="boardTitle" placeholder="제목 입력"><br>
	            	</div>
	        	 </div>
	        	 
	        	 <div class="fw-bold fs-5 col-12">
		            <p>가격</lp>
		            <input type="text" name="boardPrice" class="form-control my-2" value="${dto.boardPrice}" id="boardPrice" placeholder="가격 입력"><br>
		         </div>
	        	 
	        	 <div class="fw-bold fs-5 col-12">
		            <p>카테고리</lp>
	        	  	<select class="form-select" aria-label="Default select example">
					  <option name="boardCategory" id="boardCategory">카테고리를 선택해주세요</option>
					  <option for="boardCategory" ${dto.boardCategory eq "여성패션"?'selected':''} value="여성패션">여성패션</option>
					  <option for="boardCategory" ${dto.boardCategory eq "남성패션"?'selected':''} value="남성패션">남성패션</option>
					  <option for="boardCategory" ${dto.boardCategory eq "기타"?'selected':''} value="기타">기타</option>
					</select>
		         </div>
		         <div class="fw-bold fs-5 col-12 my-4">
		            <p>내용</lp>
		            <textarea name="boardContents" class="form-control my-2" id="boardContents" rows="8" placeholder="내용 입력">${dto.boardContents}</textarea><br>
		         </div>
		       
		         <div class="row justify-content-center my-5">
		         	<button type="submit" class="btn btn-outline-success col-3">올리기</button>
		         </div>
	     	</div>
	   </form>
	</div>
</div>
<script>
   $("#boardContents").summernote();
</script>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>