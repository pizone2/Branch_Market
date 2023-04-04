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
<c:import url="../template/header.jsp"></c:import>
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
		        	 	<input type="radio" class="btn-check" ${dto.boardState eq "판매"?'checked':''} name="boardState" value="판매" id="boardState" checked>
						<label class="btn btn-outline-success" for="boardState">판매</label>
						<input type="radio" class="btn-check" ${dto.boardState eq "구매"?'checked':''} name="boardState" value="구매" id="boardState1">
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
	        	  	<select class="form-select" aria-label="Default select example" name="boardCategory" id="boardCategory">
					  <option name="boardCategory" id="boardCategory">카테고리를 선택해주세요</option>
					  <option for="boardCategory" ${dto.boardCategory eq "여성패션"?'selected':''} value="여성패션">여성패션</option>
					  <option for="boardCategory" ${dto.boardCategory eq "남성패션"?'selected':''} value="남성패션">남성패션</option>
					  <option for="boardCategory" ${dto.boardCategory eq "가구/인테리어"?'selected':''} value="가구/인테리어">가구/인테리어</option>
					  <option for="boardCategory" ${dto.boardCategory eq "생활/주방"?'selected':''} value="생활/주방">생활/주방</option>
					  <option for="boardCategory" ${dto.boardCategory eq "가전제품"?'selected':''} value="가전제품">가전제품</option>
					  <option for="boardCategory" ${dto.boardCategory eq "전자기기"?'selected':''} value="전자기기">전자기기</option>
					  <option for="boardCategory" ${dto.boardCategory eq "E쿠폰/티켓"?'selected':''} value="E쿠폰/티켓">E쿠폰/티켓</option>
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
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>