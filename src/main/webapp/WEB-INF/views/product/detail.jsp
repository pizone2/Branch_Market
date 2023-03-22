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

<div id="datas" data-productNum = "${dto.productNum}"></div>
<div class="container-fluid">
	<div class="row">
		<h1>위탁상품 상세 정보</h1>
		
		<h3>${dto.productTitle}</h3>
		<h3>${dto.productDetail}</h3>
		<h3>${dto.productQ}</h3>
		<h3>${dto.productPrice}원</h3>
		
		<div class="row col-md-7">
				<a class="btn btn-primary col-2" href="./list">목록으로</a>
				<a class="btn btn-info col-2" href="./update?productNum=${dto.productNum}">수정</a>
				<a class="btn btn-danger col-2" href="./delete?productNum=${dto.productNum}">삭제</a>
			</div>
		</div>
	</div>
	
			<div class="col">
				<c:if test="${checkPic eq 0}">
					<button type="submit" class="btn btn-outline-success col-3" id="picAdd" data-product-productNum="${dto.productNum}">장바구니에 추가</button>
				</c:if>
				<c:if test="${checkPic eq 1}">
					<button type="submit" class="btn btn-outline-danger col-3" id="picDelete">장바구니에서 삭제</button>
				</c:if>
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
  
<script src="/resources/js/product/detail.js"></script>
<c:import url="../template/common_js.jsp" ></c:import>
</body>
</html>