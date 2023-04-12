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
<title>나의 위탁상품 리스트</title>
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
						<h2>내 신청 상품 내역</h2>
					</div>
					<table class="boardTable table table-hover">
						<thead class="table-success">
							<tr>
								<th>상품번호</th> <th>상품명</th> <th>작성자</th> <th>가격</th> <th>조회수</th> <th>판매여부</th> 
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${productDTOs}" var="dto"> 
								<tr>
									<td><a>${dto.productNum}</a></td>
									<td><a href="./detail?productNum=${dto.productNum}">${dto.productTitle}</a></td>
									<td><a>${dto.memberId}</a></td>
									<td><a><fmt:formatNumber value="${dto.productPrice}" pattern="#,###"/></a></td>
									<td><a>${dto.productHit}</a></td>
									<td>
										${dto.state eq 1 ?'<a class="text-success">판매완료</a>':'<a class="text-primary">판매중</a>'}
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
			<!-- paging -->
			<div class="mx-auto">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
					
						<li class="page-item ${pager.before ? 'disabled' : ''}">
							<a class="page-link" href="./myList?page=1" aria-label="Previous">
							  <span aria-hidden="true">&laquo;</span>
							</a>
						  </li>
						
						
						  <li class="page-item ${pager.before ? 'disabled' : ''}">
							<a class="page-link" href="./myList?page=${pager.startNum-1}" aria-label="Previous">
							  <span aria-hidden="true">&lsaquo;</span>
							</a>
						  </li>
						  
						  
						  <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							  <li class="page-item"><a class="page-link" href="./myList?page=${i}">${i}</a></li>
						  </c:forEach>
						  
						  
						   <li class="page-item ${pager.after eq false ? 'disabled' : ''}">
							<a class="page-link"  href="./myList?page=${pager.lastNum+1}" aria-label="Next">
							  <span aria-hidden="true">&rsaquo;</span>
							</a>
						  </li>
						  
						  
						  <li class="page-item ${pager.after eq false ? 'disabled' : ''}">
							<a class="page-link"  href="./myList?page=${pager.totalPage}" aria-label="Next">
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
<div class="list">
	<!--권한을 가지고 있는 사람만 보임 -->
	<button class="form-update btn btn-info"><a href="./member-update.html"></a>정보 수정</button>
	<button class="form-delete btn btn-danger"><a href="#"></a>회원 탈퇴</button>
</div>
<!-- Blog Details Section End -->
	
<script src="/resources/js/product/pageing.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
<c:import url="../template/footer.jsp"></c:import>
 </body>
</html>