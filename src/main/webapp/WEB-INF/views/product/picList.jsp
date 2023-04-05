<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>장바구니</title>
                <c:import url="../template/common_css.jsp"></c:import>
                <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
            </head>

            <body>
                <c:import url="../template/header.jsp"></c:import>
                <div id="datas" data-productNum="${dto.productNum}"
                     data-member-id="${member.memberId}"
                     data-member-email="${member.memberEmail}"
                     data-member-phone="${member.memberPhone}"
                     data-member-address="${member.memberAddress}"
                ></div>

                <section class="hero hero-normal">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <hr>
                            </div>
                            <div class="col-lg-12 text-center">
                                <div class="background-page">
                                    <div class="banner-text">
                                        <h2>장바구니</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="shoping-cart spad col-lg-8 mx-auto">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="shoping__cart__table">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="shoping__product">
                                                    <label>
                                                        <input type="checkbox" id="chkAll" onclick="checkAll()">
                                                        <span class="product-name">위탁 상품</span>
                                                    </label>
                                                </th>
                                                <th>상품 품질</th>
                                                <th>가격</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${productDTOs}" var="dto" varStatus="i">
                                                <tr>
                                                    <td class="shoping__cart__item">
                                                        <input type="checkbox" id="acc" class="chk"
                                                            data-price=${dto.productPrice}
                                                            data-productNum=${dto.productNum}
                                                            data-productCount=${productDTOs.size()}
                                                            data-productTitle="${dto.productTitle}">
                                                        <h8>&nbsp;</h8>

                                                        <div style="display: flex; align-items: center;">
                                                            <img src="${dto.productImgName}" alt=""
                                                              style="width: 200px; height: 200px;">
                                                        
                                                            <h5 style="margin-left: 1rem;">
                                                              <a href="./detail?productNum=${dto.productNum}">${dto.productTitle}</a>
                                                            </h5>
                                                          </div>
                                                    </td>

                                                    <td class="shoping__cart__Quantity">
                                                        ${dto.productQ}
                                                    </td>

                                                    <td class="shoping__cart__price">
                                                        <fmt:formatNumber value="${dto.productPrice}" pattern="#,###" />
                                                        원
                                                    </td>
                                                    <td class="shoping__cart__item__close picDelete">
                                                        <form action="./picDelete" method="post">
                                                            <input type="hidden" name="productNum" value="${dto.productNum}">
                                                                <button type="submit" class="btn btn-danger">삭제</button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="shoping__cart__btns">
                                    <a href="./list" class="primary-btn cart-btn">쇼핑 계속하기</a>

                                </div>
                            </div>
                            <div class="col-lg-6"></div>
                            <div class="col-lg-6 " id="shoping__checkout__parents">
                                <div class="shoping__checkout">
                                    <!-- <h5>장바구니 </h5> -->
                                    <ul>
                                        <li>총 주문금액 <span id="totalPrice">0원</span></li>
                                    </ul>
                                    <button type="button" class="primary-btn" onclick="requestPay()">주문하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <script src="/resources/js/product/productPicList.js"></script>
                <c:import url="../template/common_js.jsp"></c:import>
                <c:import url="../template/footer.jsp"></c:import>

                <script>

                  
    
                </script>

            </body>

            </html>