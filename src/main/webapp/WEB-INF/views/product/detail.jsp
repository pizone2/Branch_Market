<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ page import="com.main.branch.product.*" %>

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
                                            <img class="product__details__pic__item--large mx-auto" src="${dto.productImgName}"
                                                alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="product_details col-lg-6 col-md-6">
                                    <div class="product__details__text">
                                        <h3>${dto.productTitle}</h3>
                                        <div class="product__details__price mb-3 mt-3"
                                            style="width: 200px; overflow: hidden; text-overflow: ellipsis;">
                                            <fmt:formatNumber value="${dto.productPrice}" pattern="#,###" />원
                                        </div>
                                        <div class="mb-3 ">
                                            <div class="row">
                                                <div class="col-3 detail-state">
                                                    <span>${dto.productCategory}</span>
                                                </div>
                                                <div class="col-3 detail-state mx-2">
                                                    <span>${dto.productQ}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="co1-8">
                                            <a href="../product/picList" id="picBuy" class="btn-icon btn btn-success">구매</a>
                                            <c:if test="${not empty member}">
                                                <div id="picIcon">
                                                    <c:if test="${checkPic eq 0}">
                                                        <a href="#" class="heart-icon" id="picAdd"><i
                                                                class="icon-heart fa fa-shopping-cart" type="submit"
                                                                data-product-productNum="${dto.productNum}"></i></a>
                                                    </c:if>
                                                        <c:if test="${checkPic eq 1}">
                                                            <a href="#" class="heart-icon" id="picDel">
                                                                <i class="icon-heart fa fa-check" type="submit"></i></a>
                                                    </c:if>
                                                </div>
                                            </c:if>
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
                            <div id="reviewList"></div>
                   
                </section>
                <div class="list">
                        <c:if test="${member.memberRole eq 'admin'}">
                            <!--권한을 가지고 있는 사람만 보임 -->
                            <a href="./update?productNum=${dto.productNum}"><button
                                    class="form-update btn btn-info">수정</button></a>
                            <a>
                                <form action="/product/delete" method="post">
                                    <input type="hidden" name="productNum" value="${dto.productNum}">
                                    <button type="submit" data-productNum="${dto.productNum}"
                                    class="form-delete btn btn-danger del">삭제</button>
                                </form>
                            </a>
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

                            <c:forEach items="${resultList}" var="dto">
                                <div class="col-lg-3 col-md-4 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__list d-flex justify-content-between mr">

                                            <div class="product__list__item mx-auto">
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
                            </c:forEach>

                        </div>
                </section>
                <!-- Related Product Section End -->
                </div>

    <script src="/resources/js/product/productPic.js"></script>
    <script src="/resources/js/product/detail.js"></script>
    <c:import url="../template/common_js.jsp"></c:import>
    <c:import url="../template/footer.jsp"></c:import>
</body>
</html>