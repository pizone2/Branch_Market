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

	<section class="hero hero-normal">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<hr>
				</div>
				<div class="col-lg-12 text-center">
					<div class="background-page">
						<div class="banner-text"><h2>위탁 판매</h2></div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <form action="./update" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <h4 class="join__title mx-auto">위탁 판매 상품 수정</h4>
                    </div>
                    <div class="row">                       
                        <div class="col-lg-7 col-md-6 mx-auto"> 
							<input type="hidden" name="productNum" value="${dto.productNum}">
                            
							<div class="mb-4">
								<label for="productTitle" class="form-label">상품명</label>
								<input type="text" name="productTitle" value="${dto.productTitle}" class="form-control" id="productTitle" placeholder="상품명 입력">
							</div>
					
							<div class="mb-4">
								<label for="productPrice" class="form-label">상품 가격</label>
								<input type="text" name="productPrice" value="${dto.productPrice}" class="form-control" id="productPrice" placeholder="상품 가격 입력">
							</div>
							
							<div class="mb-5 pb-3">
								<div class="mx-auto">
									<label for="productCategory" class="form-label">상품 카테고리</label>
								</div>
								<select class="form-select" aria-label="Default select example" name="productCategory" id="productCategory">
								  <option selected>${dto.productCategory}</option>
								  <option value="여성패션">여성패션</option>
								  <option value="남성패션">남성패션</option>
								  <option value="가구/인테리어">가구/인테리어</option>
								  <option value="생활/주방">생활/주방</option>
								  <option value="가전제품">가전제품</option>
								  <option value="전자기기">전자기기</option>
								  <option value="E쿠폰/티켓">E쿠폰/티켓</option>
								  <option value="기타">기타</option>
								</select>
							</div>
					
							<div class="mb-4">
								<label for="productDetail" class="form-label">상세설명</label>
								<textarea name="productDetail" class="form-control" id="productDetail" placeholder="설명 입력" rows="7">${dto.productDetail}</textarea>
							</div>
                            
							<h3>&nbsp;</h3>
							<div class="d-flex justify-content-center">
								<button type="button" class="site-btn mr-4"><a href="./list">취소</a></button>                                                     
								<button type="submit" class="site-btn">수정</button>     
							</div>   
							<h1>&nbsp;</h1> 

                        </div> 
                    </div>                    
                </form>
            </div>
        </div>
    </section>

  <!-- 	<script src="../resources/js/product/fileManager.js"></script> -->
	<script>
		$("#productDetail").summernote();
	</script> 
	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>