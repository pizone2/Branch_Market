<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위탁상품 상세 정보</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<link rel="stylesheet" href="/resources/css/review/review.css">
<div class="container-fluid my-5">
	<div id="datas" data-productNum = "${dto.productNum}"></div>
	
	<div class="row mb-4 ">
		<h1 class="col-md-7 mx-auto text-center border-bottom border-dark pb-4">위탁상품 상세 정보 페이지</h1>
	</div>
	
	<div class="row col-md-7 mx-auto">
		<div class="row">
			<div class="input-group mb-3 col">
			  <span class="input-group-text">제목</span>
			  <input type="text" readonly class="form-control" id="productTitle" value="${dto.productTitle}">
			</div>
			<div class="col">
				<c:if test="${checkPic eq 0}">
					<button type="submit" class="btn btn-outline-success col-3" id="picAdd" data-product-productNum="${dto.productNum}">장바구니에 추가</button>
				</c:if>
				<c:if test="${checkPic eq 1}">
					<button type="submit" class="btn btn-outline-danger col-3" id="picDelete">장바구니에서 삭제</button>
				</c:if>
			</div>
		</div>
			
		<div class="row">
			<div class="input-group mb-3 col">
				<span class="input-group-text">카테고리</span>
				<input type="text" readonly class="form-control" id="productCategory" value="${dto.productCategory}">
			</div>
		</div>
		
		<div class="input-group">
			<div class="input-group">
				<span class="input-group-text">내용</span>
				<span name="productDetail" readonly class="form-control" id="productDetail" rows="5" th:utext>${dto.productDetail}</span>
		</div>
		
		<div class="input-group mb-3 col">
			<span class="input-group-text">상품 품질</span>
			<input type="text" readonly class="form-control" id="productQ" value="${dto.productQ}">
		</div>
		
		<div class="input-group mb-3 col">
			<span class="input-group-text">상품 가격</span>
			<input type="text" readonly class="form-control" id="productPrice" value="${dto.productPrice}원">
		</div>
	    
	<div class="row col-md-7 mx-auto my-4 justify-content-center">
		<a href="./delete?productNum=${dto.productNum}" class="btn btn-outline-danger col-3" id="delete">상품 삭제</a>
		<a href="./update?productNum=${dto.productNum}" class="btn btn-outline-success col-3 mx-2">상품 수정</a>
		<a href="./list" class="btn btn-success col-3">목록으로</a>
	</div>	
</div>
</div>
</div>

<input type="button" value="리뷰 작성" id="reviewAddBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">
<div id="reviewList"></div>

  
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
		<div class="modal-header">
		  <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
		  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>

		<span class="star-input">
			<span class="input">
			  <input type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
			  <input type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
			  <input type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label>
			  <input type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
			  <input type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
			  <input type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label>
			  <input type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label>
			  <input type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label>
			  <input type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label>
			  <input type="radio" name="star-input" id="p10" value="10"><label for="p10">10</label>
			</span>
			<output for="star-input"><b id="reviewScore">0</b>점</output>
		  </span>

		<div class="modal-body">
		  <textarea name="" id="inputData" cols="30" rows="10"></textarea>
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="submitFormClose">Close</button>
		  <button type="button" class="btn btn-primary" id="submitDataBtn">Save changes</button>
		</div>
	  </div>
	</div>
  </div>
  
<script>
const del = document.getElementById("delete");
const frm = document.getElementById("frm");

del.addEventListener("click", function(){
    let check = window.confirm("정말 삭제하시겠습니까?");
    if(check){
        frm.setAttribute("action","./delete");
        frm.setAttribute("method","post");
        frm.submit();
    }

})
</script>
<script src="/resources/js/product/productPic.js"></script>
<script src="/resources/js/product/detail.js"></script>
<c:import url="../template/common_js.jsp" ></c:import>
</body>
</html>