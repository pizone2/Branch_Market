<%@page import="com.main.branch.product.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위탁상품</title>
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
							<div class="banner-text"><h2>위탁 판매</h2></div>
						</div>
					</div>
					
				</div>
			</div>
		</section>
		<!-- Banner Section End -->
	
		<!-- Hero Section Begin -->
		<section class="hero">
			<div class="container">
				<div class="row">
					<div class="category-bar col-lg-3">
						<div class="hero__categories">
							<div class="hero__categories__all">
								<form class="row g-3" action="./list" method="get" id="searchForm">
								<input type="hidden" id="page" name="page">
								<i class="fa fa-bars"></i>
								<span>카테고리</span>
							</div>
							<ul>
								<li><a href="./list?category= " value="">모두보기</a></li>
								<li><a href="./list?category=여성패션" value="여성패션">여성패션</a></li>
								<li><a href="./list?category=남성패션" value="남성패션">남성패션</a></li>
								<li><a href="./list?category=가구/인테리어" value="가구/인테리어">가구/인테리어</a></li>
								<li><a href="./list?category=생활/주방" value="생활/주방">생활/주방</a></li>
								<li><a href="./list?category=가전제품" value="가전제품">가전제품</a></li>
								<li><a href="./list?category=전자기기" value="전자기기">전자기기</a></li>
								<li><a href="./list?category=E쿠폰/티켓" value="E쿠폰/티켓">E쿠폰/티켓</a></li>
								<li><a href="./list?category=기타" value="기타">기타</a></li>
							</ul>
						</div>
						 

						<div class="hero__search mt-4">
							<div class="hero__search_btn">
								<form class="row g-3" action="./list" method="get" id="searchForm">
									<div class="input-group mb-3">
										<input type="text" class="form-control" value="${pager.search}" name="search" id="search" placeholder="검색어를 입력하세요">
										<button type="submit" class="btn btn-outline-success">검색</button>
									</div>
								</form>
							</div>
						</div>
						<div>
							<a href="./add"><button class="state-btn btn">위탁 판매 등록</button></a>
						</div>
					</div>
					</form>
					<div class="col-lg-9">
						<div class="row">
								<c:forEach items="${list}" var="dto"> <!-- dto는 page 영역에 담김 -->

										<div class="col-lg-4 col-md-6 col-sm-6">
											<div class="product__item">
												<div class="product__item__pic set-bg" data-setbg="${dto.productImgName}">
												</div>
												<div class="product__item__text">
													<h6><a href="./detail?productNum=${dto.productNum}">${dto.productTitle}</a></h6>
												</div>
												<div class="product__item__text">
													<h6><a><fmt:formatNumber value="${dto.productPrice}" pattern="#,###"/></a>원</h6>
												</div>
											</div>
										</div>
										
								</c:forEach>
						</div>
						<div class="mx-auto">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
								
									<li class="page-item ${pager.before ? 'disabled' : ''}">
										<a class="page-link" href="./list?page=1&kind=${pager.kind}&search=${pager.search}&category=${pager.category}" aria-label="Previous">
										  <span aria-hidden="true">&laquo;</span>
										</a>
									  </li>
									
									
									  <li class="page-item ${pager.before ? 'disabled' : ''}">
										<a class="page-link" href="./list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}&category=${pager.category}" aria-label="Previous">
										  <span aria-hidden="true">&lsaquo;</span>
										</a>
									  </li>
									  
									  
									  <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
										  <li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}&category=${pager.category}">${i}</a></li>
									  </c:forEach>
									  
									  
									   <li class="page-item ${pager.after eq false ? 'disabled' : ''}">
										<a class="page-link"  href="./list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}&category=${pager.category}" aria-label="Next">
										  <span aria-hidden="true">&rsaquo;</span>
										</a>
									  </li>
									  
									  
									  <li class="page-item ${pager.after eq false ? 'disabled' : ''}">
										<a class="page-link"  href="./list?page=${pager.totalPage}&kind=${pager.kind}&search=${pager.search}&category=${pager.category}" aria-label="Next">
										  <span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</ul>
						  </nav>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Hero Section End -->
	
		<script src="/resources/js/product/pageing.js"></script>
		<c:import url="../template/common_js.jsp"></c:import>
		<c:import url="../template/footer.jsp"></c:import>
 </body>
</html>