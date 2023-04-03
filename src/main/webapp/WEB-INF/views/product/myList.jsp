<%@page import="com.main.branch.product.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<div class="banner-text"><h2>마이페이지</h2></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<div class="row col-md-7 mx-auto">
		<table class="table table-hover">
				<thead>
					<tr>
						<th>상품번호</th> <th>상품명</th> <th>작성자</th> <th>날짜</th> <th>조회수</th>
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
	<!-- <form action="./myList" id="searchForm">
		<input hidden="hidden" id="page" name="page">
		
	</form> -->
	<script src="/resources/js/product/pageing.js"></script>
	<c:import url="../template/common_js.jsp"></c:import>
<c:import url="../template/footer.jsp"></c:import>
 </body>
</html>