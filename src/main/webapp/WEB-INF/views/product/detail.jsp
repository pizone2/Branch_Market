<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	
	<!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                
                <div class="col-lg-12">

                    <hr>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="${dto.productImgName}" alt="">
                        </div>
                        
                    </div>
                </div>
                <div class="product_details col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3 >${dto.productTitle}</h3>
                        <div class="product__details__price mb-3 mt-3">
							<fmt:formatNumber value="${dto.productPrice}" pattern="#,###"/>원
						</div>
                        <div class="mt-3">
							<p>상품 품질 : ${dto.productQ}</p>
						</div>
                        <div class="co1-8">
                            <a href="../product/picList" class="btn-icon btn btn-success">구매</a>
							<c:if test="${checkPic eq 0}">
								<a href="#" class="heart-icon"><i class="icon-heart fa fa-shopping-cart" type="submit" id="picAdd" data-product-productNum="${dto.productNum}"></i></a>
							</c:if>
							<c:if test="${checkPic eq 1}">
								<a href="#" class="heart-icon"><i class="icon-heart fa fa-shopping-cart" type="submit" id="picDelete"></i></a>
							</c:if>
                        </div>
                        
					<div class="product__details__pic__slider owl-carousel my-5">
						<img data-imgbigurl="${dto.productDetail}"
							src="" alt="">
					</div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <table class="table">
                                        <thead class="table-success">
                                            <tr>
                                                <th scope="col">번호</th>
                                                <th scope="col">닉네임</th>
                                                <th scope="col">내용</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td>Mark</td>
                                                <td>내용1</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder="리뷰를 작성해주세요"aria-describedby="button-add">
                                        <button class="btn btn-success" type="button" id="button-add">등록</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="list">
        <!--권한을 가지고 있는 사람만 보임 -->
        <button class="form-update btn btn-info"><a href="./update?productNum=${dto.productNum}">수정</a></button>
        <button class="form-delete btn btn-danger"><a href="./delete?productNum=${dto.productNum}" id="delete">삭제</a></button>
		
        <!--모든 사람에게 보임 -->
        <button class="form-list btn btn-success"><a href="./list">목록으로</a></button>
    </div>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>관련 위탁 상품</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/kong.jpg"></div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/kong2.jpg"></div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/kong3.jpg"></div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/kong5.jpg"></div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->

</div>
</div>
</div>

<!-- <input type="button" value="리뷰 작성" id="reviewAddBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">
<div id="reviewList"></div> -->

  
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
		  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="submitFormClose">취소</button>
		  <button type="button" class="btn btn-primary" id="submitDataBtn">확인</button>
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
<c:import url="../template/common_js.jsp"></c:import>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>