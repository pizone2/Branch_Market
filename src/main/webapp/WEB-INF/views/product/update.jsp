<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위탁상품 수정</title>
<c:import url="../template/common_css.jsp"></c:import>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container-fluid">

	<div class="row justify-content-center my-4">
		<h1 class="col-md-7 text-center">위탁상품 수정</h1>
	</div>
	
	<div class="row justify-content-center my-4">
		<form class="col-md-7" action="./update" method="post" enctype="multipart/form-data">
			<input type="hidden" name="num" value="${dto.productNum}">
			
			<div class="mb-3">
			  <label for="title" class="form-label">제목</label>
			  <input type="text" name="title" class="form-control" value="${dto.productTitle}" id="title" placeholder="상품명 입력">
			</div>
	
			<div class="mb-3">
			  <label for="contents" class="form-label">상품 상세 내용</label>
			  <textarea name="contents" class="form-control" id="contents" placeholder="내용 입력" rows="7">${dto.productDetail}</textarea>
			</div>
			
			<div id="fileList" class="my-5">	
				<button type="button" class="btn btn-info" id="fileAdd">추가</button>
				
				<c:forEach items="${dto.boardFileDTOs}" var="fileDTO">
					<div class="input-group mb-3 my-3">
						  <div class="input-group-text">
						    <input class="form-check-input mt-0 deleteCheck" type="checkbox" name="fileNum" value="${fileDTO.fileNum}" aria-label="Checkbox for following text input">
						  </div>
						  <input type="text" disabled value="${fileDTO.oriName}" class="form-control" aria-label="Text input with checkbox">
					</div>
				</c:forEach>
			</div>
						
			<div class="mb-3 my-5">
				<button class="my btn btn-primary" type="submit">글쓰기</button>
			</div>
		
		</form>
	</div>
</div>

<script src="../resources/js/fileManager.js"></script>
<script>
	setMax(5);
	/* setParam('addFiles'); */
	setCount('${dto.boardFileDTOs.size()}');
	$("#contents").summernote();
</script>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>