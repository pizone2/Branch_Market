<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<c:import url="../template/common_css.jsp"></c:import>
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
						<div class="banner-text"><h2>장바구니</h2></div>
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
                                            <input type="checkbox" id="cbx_chkAll" onclick="checkAll()">
                                            <span class="product-name">위탁 상품</span>
                                        </label>
                                    </th>
									<th>상품 품질</th>
                                    <th>가격</th>
									<th></th>
                                </tr>
                            </thead>
                            <tbody>
								<c:forEach items="${productDTOs}" var="dto">
                                <tr>
                                    <td class="shoping__cart__item" >
                                        <input type="checkbox" id="acc" name="chk"> 
                                        <h8>&nbsp;</h8>   
                                                                                                            
                                        <img src="${dto.productImgName}" alt="" style="width: 200px; height: 200px;">
                                        <h5><a href="./detail?productNum=${dto.productNum}">${dto.productTitle}</a></h5>
                                    </td>

									<td class="shoping__cart__Quantity">
                                        ${dto.productQ}
                                    </td>

                                    <td class="shoping__cart__price">
                                        <fmt:formatNumber value="${dto.productPrice}" pattern="#,###"/>원
                                    </td>
									
										<td class="shoping__cart__item__close" id="picDelete">
											<span class="icon_close" type="submit" >
											</span>
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
                <div class="col-lg-6 " id="shoping__checkout__parents" >
                    <div class="shoping__checkout">
                        <!-- <h5>장바구니 </h5> -->
                        <ul>                           
                            <li>총 주문금액 <span id="totalPrice"></span>원</li>
                        </ul>
                        <a href="#" class="primary-btn">주문하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

<script src="/resources/js/product/productPicList.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>