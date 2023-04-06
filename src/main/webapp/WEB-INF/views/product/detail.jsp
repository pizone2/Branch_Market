<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <div id="datas" data-productNum="${dto.productNum}"></div>

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
                                            <img class="product__details__pic__item--large" src="${dto.productImgName}"
                                                alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="product_details col-lg-6 col-md-6 ">
                                    <div class="product__details__text">
                                        <h3>${dto.productTitle}</h3>
                                        <div class="product__details__price mb-3 mt-3"
                                            style="width: 200px; overflow: hidden; text-overflow: ellipsis;">
                                            <fmt:formatNumber value="${dto.productPrice}" pattern="#,###" />원
                                        </div>
                                        <div class="mt-3">
                                            <p>카테고리 : ${dto.productCategory}
                                                상품 품질 : ${dto.productQ}</p>
                                        </div>
                                        <div class="co1-8">
                                            <a href="../product/picList" class="btn-icon btn btn-success">구매</a>
                                            <div id="picIcon">
                                                <c:if test="${checkPic eq 0}">
                                                    <a href="#" class="heart-icon" id="picAdd"><i
                                                            class="icon-heart fa fa-shopping-cart" type="submit"
                                                            data-product-productNum="${dto.productNum}"></i></a>
                                                </c:if>
                                                <c:if test="${checkPic eq 1}">
                                                    <a href="#" class="heart-icon" id="picDelete"><i
                                                            class="icon-heart fa fa-check" type="submit"></i></a>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <section class="related-product mx-auto mt-5">
                                    <div class="container mt-5">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="section-title related__product__title mt-5">
                                                    <h2>상품 상세 내용</h2>
                                                </div>
                                                <h3>${dto.productDetail}</h3>
                                            </div>
                                        </div>
                                    </div>
                                </section>

                                    </div>
                                    <div id="reviewList">

                                    </div>
                                </div>
                            </div>
                    </section>
                <div class="list">
                        <c:if test="${member.memberRole eq 'admin'}">
                            <!--권한을 가지고 있는 사람만 보임 -->
                            <a href="./update?productNum=${dto.productNum}"><button
                                    class="form-update btn btn-info">수정</button></a>
                            <a data-productNum="${dto.productNum}"><button
                                    class="form-delete btn btn-danger del">삭제</button></a>
                        </c:if>
                    <!--모든 사람에게 보임 -->
                    <a href="./list"><button class="form-list btn btn-success">목록으로</button></a>
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
                                    <div class="product__item__pic set-bg" data-setbg="${dto.productImgName}"></div>
                                    <div class="product__item__text">
                                        <h6><a href="./detail?productNum=${dto.productNum}">${dto.productTitle}</a></h6>
                                        <h5>
                                            <fmt:formatNumber value="${dto.productPrice}" pattern="#,###" />원
                                        </h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Related Product Section End -->

                </div>


                <!-- <input type="button" value="리뷰 작성" id="reviewAddBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">
<div id="reviewList"></div> -->


                <!-- <script>
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
</script> -->
                <script src="/resources/js/product/productPic.js"></script>
                <script src="/resources/js/product/detail.js"></script>
                <c:import url="../template/common_js.jsp"></c:import>
                <c:import url="../template/footer.jsp"></c:import>
            </body>

            </html>