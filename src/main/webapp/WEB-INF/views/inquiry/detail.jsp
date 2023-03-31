<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
<link rel="stylesheet" href="/resources/css/inquiry/detail.css">
</head>
<body>
	<div hidden id="datas" data-inquiryNum = ${inquiryDTO.inquiryNum} data-inqCommentsNum=""></div>
	<c:import url="../template/header.jsp"></c:import>
	<!-- Banner Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <hr>
                </div>
                <div class="col-lg-12 text-center">
                    <div class="background-page">
                        <div class="banner-text"><h2>문의 사항</h2></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->
     <!-- 표 시작  -->
    

     <table class="table">
        <caption>표 제목</caption>
        <tr><th>No.</th><th>제목</th><th>작성자</th><th>작성일</th><th>카테고리</th></tr>
        <tr><td>1</td><td>${inquiryDTO.inquiryTitle}</td><td>${inquiryDTO.memberId}</td><td>2023-03-24</td><td>${inquiryDTO.inquiryCategory}</td></tr>        
    </table> 
        <br>
        <br>

        <div class="inquiry-text" >
            ${inquiryDTO.inquiryDetail}
        </div>
        <br>
        <br>
    

    <table class="table border-top-0">
        <caption>표 제목</caption>
        <tr><th>이전글</th><td>이미 위탁한 상품의 가격을 변경가능한가요?</td> </tr>
        <tr><th>다음글</th><td>위탁판매 배송기간은 보통 어떻게 되죠?</td></tr>
        <br>
    </table> 
    <br><br>
	<div class="form-floating">
		<textarea class="form-control" placeholder="댓글을 남겨 주세요" id="inqCommentsContents" style="height: 100px"></textarea>
		<input type="button" value="작성" id="submitBtn">
	</div>

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



	<!-- <div hidden id="datas" data-inquiryNum = ${inquiryDTO.inquiryNum} data-inqCommentsNum=""></div>

	작성자<h2>${inquiryDTO.memberId}</h2>
	제목<h2>${inquiryDTO.inquiryTitle}</h2>
	내용<h2>${inquiryDTO.inquiryDetail}</h2>
	카테고리<h2>${inquiryDTO.inquiryCategory}</h2>
	<div class="form-floating">
		<textarea class="form-control" placeholder="댓글을 남겨 주세요" id="inqCommentsContents" style="height: 100px"></textarea>
		<input type="button" value="작성" id="submitBtn">
	</div>
	<div id="commentsList"></div> -->

  
  <!-- Modal -->
  <!-- <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
  </div> -->

	<script src="/resources/js/inquiry/detail.js"></script>
	<c:import url="../template/footer.jsp"></c:import>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>