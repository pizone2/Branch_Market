<%@page import="com.main.branch.product.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위탁상품 신청 목록</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container-fluid my-5">
	<div class="row mb-4">
		<h1 class="col-md-7 mx-auto text-center border-bottom border-dark pb-4">위탁상품 신청 목록</h1>
	</div>
	
	<div class="row col-md-7 mx-auto">
		<table class="table table-hover">
				<thead>
					<tr>
						<th>상품번호</th>
						<th>상품명</th>
						<th>카테고리</th>
						<th>이미지</th>
						<th>상품 가격</th>
						<th>품질</th>
						<th>등록여부</th>
						
					</tr>
				</thead>
				<tbody class="table-group-divider">
					<c:forEach items="${list}" var="dto">
					<c:if test="${dto.productQ eq null}">
						<tr>
							<td><a>${dto.productNum}</a></td>
							<td><a>${dto.productTitle}</a></td>
							<td><a>${dto.productCategory}</a></td>
							<td><img src="${dto.productImgName}" alt="" style="height: 100px;"></td>
							<td><a>${dto.productPrice}</a></td>

							<td>
								<div class="mb-3">
									<select class="form-select" aria-label="Default select example" name="productQ" id="productQ${dto.productNum}">
									<option selected>${dto.productQ}</option>
									<option value="좋음">아주 좋음</option>
									<option value="좋음">좋음</option>
									<option value="보통">보통</option>
									<option value="나쁨">나쁨</option>
									<option value="좋음">아주 나쁨</option>
									</select>
								</div>
					 		</td>
					 		<td>
						 		<div class="row col-md-7 mx-4">
									<a class="btn btn-primary col-2 addConfirmBtn" data-productNum="${dto.productNum}">등록</a>
								</div>
							</td>
						</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			
				<!-- paging -->
		<div class="row">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			  	<li class="page-item">
			      <a class="page-link" href="#" aria-label="Previous" data-board-page="1">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			  
			  
			    <li class="page-item ${pager.before?'disabled':''}">
			      <a class="page-link" href="#" aria-label="Previous" data-board-page="${pager.startNum-1}">
			        <span aria-hidden="true">&lsaquo;</span>
			      </a>
			    </li>
			    
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    <li class="page-item"><a class="page-link" href="#" data-board-page="${i}"  >${i}</a></li>
			    </c:forEach>
			    
			    <li class="page-item ${pager.after eq false ? 'disabled':''}"><%-- ${pager.after eq false ? 'disabled':''} --%>
	
			      <a class="page-link" href="#"  aria-label="Next" data-board-page="${pager.lastNum+1}">
			      
			        <span aria-hidden="true">&rsaquo;</span>
			      </a>
			    </li>
			    
			    <li class="page-item"><%-- ${pager.after eq false ? 'disabled':''} --%>
	
			      <a class="page-link" href="#"  aria-label="Next" data-board-page="${pager.totalPage}">
			      
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			    
			  </ul>
			</nav>
		</div>
			
			<!-- 검색창 -->
			<div class="row">
				<form class="row g-3" action="./addList" method="get" id="searchForm">
				<input type="hidden" id="page" name="page">
				  <div class="col-auto">
				    <label for="kind" class="visually-hidden">Kind</label>
				    <select class="form-select" name="kind" id="kind" aria-label="Default select example">
						<option value="title">상품명</option>
						<option value="contents">상품내용</option>
					  </select>
				  </div>
				  <div class="col-auto">
				    <label for="search" class="visually-hidden">Search</label>
				    <input type="text" class="form-control" name="search" id="search" placeholder="검색어를 입력하세요">
				  </div>
				  <div class="col-auto">
				    <button type="submit" class="btn btn-primary mb-3">검색</button>
				  </div>
				</form>
			</div>
			
			</div>
		</div>
	
		<script src="/resources/js/product/pageing.js"></script>
		<script src="/resources/js/product/addList.js"></script>
		<c:import url="../template/common_js.jsp"></c:import>
 </body>
</html>