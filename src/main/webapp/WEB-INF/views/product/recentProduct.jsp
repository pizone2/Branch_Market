<%@page import="com.main.branch.product.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 위탁상품 리스트</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
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
                        <div class="banner-text"><h2>MyPage</h2></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->
   

	<!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="mypage-text">
                <h4></h4>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-5 order-md-1 order-2">
                    <div class="blog__sidebar">
                    
                        <div class="blog__sidebar__item">
                            <h3>Category</h3>
                            <ul>
                                <li><a href="/member/myPage">내 계정</a></li>
                                <li><a href="/board/myList">내 게시글</a></li>
                                <li><a href="/product/myList">내 신청 상품 내역</a></li>
                                <li><a href="/pay/payList">내 구매 내역</a></li>
                                <li><a href="/inquiry/myList">내 문의 내역</a></li>
                                <li><a href="/product/recentProduct">최근 본 상품 :)</a></li>
                            </ul>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="blog__details__text">
                        <div style="text-align : center;">
                            <h2>최근 본 상품 리스트</h2>
                        </div>
                        <table class="table table-hover">
							<thead class = "table-success">
								<tr>
									<th>상품번호</th>
									<th>상품명</th>
									<th>카테고리</th>
									<th>이미지</th>
									<th>품질</th>
									<th>상품 가격</th>
								</tr>
							</thead>
							<tbody class="table-group-divider">
								<c:forEach items="${productDTOs}" var="dto"> 
									<tr>
										<td><a>${dto.productNum}</a></td>
										<td><a href="./detail?productNum=${dto.productNum}">${dto.productTitle}</a></td>
										<td><a>${dto.productCategory}</a></td>
										<td><img src="${dto.productImgName}" alt="" style="height: 100px;"></td>
										<td><a>${dto.productQ}</a></td>
										<td><a>
										<fmt:formatNumber value="${dto.productPrice}" pattern="###,###"></fmt:formatNumber>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>



<!-- <div class="container-fluid my-5">
	<div class="row mb-4">
		<h1 class="col-md-7 mx-auto text-center border-bottom border-dark pb-4">최근 본 상품 리스트</h1>
	</div>
	
	<div class="row col-md-7 mx-auto">
		<table class="table table-hover">
				<thead>
					<tr>
						<th>상품번호</th>
						<th>상품명</th>
						<th>카테고리</th>
						<th>이미지</th>
						<th>품질</th>
						<th>상품 가격</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
					<c:forEach items="${productDTOs}" var="dto"> 
					
						<tr>
							<td><a>${dto.productNum}</a></td>
							<td><a href="./detail?productNum=${dto.productNum}">${dto.productTitle}</a></td>
							<td><a>${dto.productCategory}</a></td>
							<td><img src="${dto.productImgName}" alt="" style="height: 100px;"></td>
							<td><a>${dto.productQ}</a></td>
							<td><a>${dto.productPrice}</a></td>
						</tr>
				
					</c:forEach>
				</tbody>
			</table>
			
	</div>
</div> -->
	<c:import url="../template/footer.jsp"></c:import>
	<c:import url="../template/common_js.jsp"></c:import>
 </body>
</html>