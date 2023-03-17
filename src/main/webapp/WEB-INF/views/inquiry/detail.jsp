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
	<div hidden id="datas" data-inquiryNum = ${inquiryDTO.inquiryNum} data-inqCommentsNum=""></div>

	작성자<h2>${inquiryDTO.memberId}</h2>
	제목<h2>${inquiryDTO.inquiryTitle}</h2>
	내용<h2>${inquiryDTO.inquiryDetail}</h2>
	카테고리<h2>${inquiryDTO.inquiryCategory}</h2>
	<div class="form-floating">
		<textarea class="form-control" placeholder="댓글을 남겨 주세요" id="inqCommentsContents" style="height: 100px"></textarea>
		<input type="button" value="작성" id="submitBtn">
	</div>
	<div id="commentsList"></div>

  
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
		<div class="modal-header">
		  <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
		  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
			<textarea name="" id="updateContents" cols="30" rows="10"></textarea>
		<div class="modal-footer">
		  <button type="button" id="updateModalCloseBtn" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		  <button type="button" class="btn btn-primary" id="updateSaveBtn">Save changes</button>
		</div>
	  </div>
	</div>
  </div>

	<script src="/resources/js/inquiry/detail.js"></script>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>