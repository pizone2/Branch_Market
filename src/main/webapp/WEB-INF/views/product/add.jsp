<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위탁상품 추가</title>
<c:import url="../template/common_css.jsp"></c:import>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container-fluid my-5">
	<div class="row mb-4">
		<h1 class="col-md-7 mx-auto text-center border-bottom border-dark pb-4">위탁상품 추가</h1>
	</div>
	
		<div class="row justify-content-center">
		<form  class="col-4" action="./add" method="post" enctype="multipart/form-data">
		<div class="mb-3">
		    <label for="productTitle" class="form-label">상품명</label>
		    <input type="text" name="productTitle" class="form-control" id="productTitle" placeholder="상품명 입력">
	    </div>

		<div class="mb-3">
		    <label for="productPrice" class="form-label">상품 가격</label>
		    <input type="text" name="productPrice" class="form-control" id="productPrice" placeholder="상품 가격 입력">
	    </div>
	    
	    <div class="mb-3">
	    	<label for="productCategory" class="form-label">상품 카테고리</label>
		    <select class="form-select" aria-label="Default select example" name="productCategory" id="productCategory">
			  <option value="여성패션">여성패션</option>
			  <option value="남성패션">남성패션</option>
			  <option value="가구/인테리어">가구/인테리어</option>
			  <option value="생활/주방">생활/주방</option>
			  <option value="가전제품">가전제품</option>
			  <option value="전자기기(디지털,컴퓨터)">전자기기(디지털,컴퓨터)</option>
			  <option value="E쿠폰/티켓">E쿠폰/티켓</option>
			</select>
	    </div>
	    
		<div class="mb-3">
			<label for="productQ" class="form-label">상품 상태</label>
		    <select class="form-select" aria-label="Default select example" name="productQ" id="productQ">
			  <option value="좋음">아주 좋음</option>
			  <option value="좋음">좋음</option>
			  <option value="보통">보통</option>
			  <option value="나쁨">나쁨</option>
			  <option value="좋음">아주 나쁨</option>
			</select>
		</div>
		
 		

		<div class="mb-3">
			<label for="productDetail" class="form-label">상세설명</label>
			<textarea name="productDetail" class="form-control" id="productDetail" placeholder="설명 입력" rows="7"></textarea>
	    </div>
	    

<!-- 			<div id="fileList" class="my-5">
 				<div class="input-group mb-3">
					<input type="file" class="form-control" id="files" name="files">
					<button type="button" class="btn btn-outline-danger">X</button>
				</div> 
				<button type="button" class="btn btn-info" id="fileAdd">이미지 추가</button>
			</div> -->
						
			<div class="mb-3">
				<button class="my btn btn-primary" type="submit">상품 등록</button>
			</div>
	</form>
	</div>
</div>
  <!-- 	<script src="../resources/js/product/fileManager.js"></script> -->
	<script>
		$("#productDetail").summernote();
	</script> 
	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>