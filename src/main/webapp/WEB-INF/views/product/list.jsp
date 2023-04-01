<%@page import="com.main.branch.product.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
								<i class="fa fa-bars"></i>
								<span>카테고리</span>
							</div>
							<ul>
								<li><a href="#">모두보기</a></li>
								<li><a href="#">여성패션</a></li>
								<li><a href="#">남성패션</a></li>
								<li><a href="#">가구/인테리어</a></li>
								<li><a href="#">생활/주방</a></li>
								<li><a href="#">가전제품</a></li>
								<li><a href="#">전자기기</a></li>
								<li><a href="#">E쿠폰/티켓</a></li>
								<li><a href="#">기타</a></li>
							</ul>
						</div>
						<div class="hero__search my-3">
							<div class="hero__search_btn">
								<form class="row g-3" action="./list" method="get" id="searchForm">
									<input type="hidden" name="page" value="1" id="page">
								  <div class="col-auto">
									<select class="form-select" name="kind" id="kind" aria-label="Default select example">
									  <option value="title" ${pager.kind eq 'productTitle' ? 'selected':''} >제목</option>
									  <option value="contents" ${pager.kind eq 'productDetail' ? 'selected':''}>내용</option>
									</select>
								  </div>
								  <div class="col-auto">
									<input type="text" class="form-control" value="${pager.search}"" name="search" id="search" placeholder="검색어를 입력하세요">
									<button type="submit" class="btn btn-success mb-3">검색</button>
								  </div>
								</form>
							</div>
						</div>
						<div>
							<button class="state-btn btn mb-3"><a href="./add">위탁 판매 등록</a></button>
							<button class="state-btn btn"><a href="./addList">위탁 판매 등록 신청</a></button>
						</div>
					</div>
					</form>
					<div class="col-lg-9">
						<div class="row">
								<c:forEach items="${list}" var="dto"> <!-- dto는 page 영역에 담김 -->
									<c:if test="${dto.state eq 0}">
										<c:if test="${dto.productQ ne null}">

										<div class="col-lg-4 col-md-6 col-sm-6">
											<div class="product__item">
												<div class="product__item__pic set-bg" data-setbg="${dto.productImgName}">
													<!-- <img src="${dto.productImgName}" alt="" style="height: 100px;"></td> -->
												</div>
												<div class="product__item__text">
													<h6><a href="./detail?productNum=${dto.productNum}">${dto.productTitle}</a></h6>
												</div>
												<div class="product__item__text">
													<h6><a>${dto.productPrice}</a>원</h6>
												</div>
											</div>
										</div>
										
										</c:if>
									</c:if>
								</c:forEach>
						</div>
						<div class="mx-auto">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
								
									<li class="page-item ${pager.before ? 'disabled' : ''}">
										<a class="page-link" href="./list?page=1&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
										  <span aria-hidden="true">&laquo;</span>
										</a>
									  </li>
									
									
									  <li class="page-item ${pager.before ? 'disabled' : ''}">
										<a class="page-link" href="./list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
										  <span aria-hidden="true">&lsaquo;</span>
										</a>
									  </li>
									  
									  
									  <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
										  <li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
									  </c:forEach>
									  
									  
									   <li class="page-item ${pager.after eq false ? 'disabled' : ''}">
										<a class="page-link"  href="./list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" aria-label="Next">
										  <span aria-hidden="true">&rsaquo;</span>
										</a>
									  </li>
									  
									  
									  <li class="page-item ${pager.after eq false ? 'disabled' : ''}">
										<a class="page-link"  href="./list?page=${pager.totalPage}&kind=${pager.kind}&search=${pager.search}" aria-label="Next">
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