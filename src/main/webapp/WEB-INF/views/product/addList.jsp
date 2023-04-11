<%@page import="com.main.branch.product.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../template/common_css.jsp"></c:import>

 <h2 class="mx-auto mb-4">위탁상품 신청 목록</h2>
		<table class="boardTable table table-hover">
                        <thead class="table-success">
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
									<option value="아주 좋음">아주 좋음</option>
									<option value="좋음">좋음</option>
									<option value="보통">보통</option>
									<option value="나쁨">나쁨</option>
									<option value="아주 나쁨">아주 나쁨</option>
									</select>
								</div>
					 		</td>
					 		<td>
						 		<!-- <div class="row col-md-7 mx-4"> -->
									<a class="btn btn-outline-success addConfirmBtn" data-productNum="${dto.productNum}">등록</a>
								<!-- </div> -->
							</td>
						</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			
			
			
				<!-- paging -->
		<!-- <div class="row"> -->
			<nav aria-label="Page navigation example ">
			  <ul class="pagination">
			  
			  	<li class="page-item" data-board-page="1">
			      <span class="page-link"  aria-label="Previous" data-board-page="1">
			        <span aria-hidden="true">&laquo;</span>
			      </span>
			    </li>
			  
			    <li class="page-item ${pager.before?'disabled':''}">
			      <span class="page-link"  aria-label="Previous" data-board-page="${pager.startNum-1}">
			        <span aria-hidden="true">&lsaquo;</span>
			      </span>
			    </li>
			    
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			   <li class="page-item" data-page="${i}"><span class="page-link" data-board-page="${i}">${i}</span></li>
			    </c:forEach>
			    
			    <li class="page-item ${pager.after eq false ? 'disabled':''}" data-board-page="${pager.lastNum+1}"><%-- ${pager.after eq false ? 'disabled':''} --%>
			      <span class="page-link"   aria-label="Next" data-board-page="${pager.lastNum+1}">
			        <span aria-hidden="true">&rsaquo;</span>
			      </span>
			    </li>
			    
			    <li class="page-item${pager.after eq false ? 'disabled':''}">
			      <span class="page-link"   aria-label="Next" data-board-page="${pager.totalPage}">
			        <span aria-hidden="true">&raquo;</span>
			      </span>
			    </li>
			    
			  </ul>
			</nav>
			
			<h2>&nbsp</h2>
		<!-- </div> -->
			
			<!-- 검색창 -->
			<div class = "row" style="margin-left: 22%;">
				<!-- <form class="row g-3" action="#" method="get" id="searchForm"> -->
				<input type="hidden" id="page" name="page" class="page">
				<div class="fw-bold fs-5 col-12">
		           <!--  <p>카테고리</p> -->
	        	  	<select class="form-select" name="category" id="category" aria-label="Default select example">
					  <option ${pager.category eq '' ? 'selected':''} value="">모두 보기</option>
					  <option ${pager.category eq '여성패션' ? 'selected':''} value="여성패션">여성패션</option>
					  <option ${pager.category eq '남성패션' ? 'selected':''} value="남성패션">남성패션</option>
				      <option ${pager.category eq '가구/인테리어' ? 'selected':''} value="가구/인테리어">가구/인테리어</option>
				      <option ${pager.category eq '생활/주방' ? 'selected':''} value="생활/주방">생활/주방</option>
				      <option ${pager.category eq '가전제품' ? 'selected':''} value="가전제품">가전제품</option>
				      <option ${pager.category eq '전자기기' ? 'selected':''} value="전자기기">전자기기</option>
					  <option ${pager.category eq 'E쿠폰/티켓' ? 'selected':''} value="E쿠폰/티켓">E쿠폰/티켓</option>
					  <option ${pager.category eq '기타' ? 'selected':''} value="기타">기타</option>
					</select>
					<select class="form-select" name="kind" id="kind" aria-label="Default select example">
						<option ${pager.kind eq 'title' ? 'selected' : '' } value="title">상품명</option>
						<option ${pager.kind eq 'contents' ? 'selected' : '' } value="contents">상품내용</option>
					  </select>
	         </div>
	         
	       	 <div class="d-inline-block">
				    <!-- <label for="kind" class="visually-hidden">Kind</label> -->
				    
				  </div>
				  <div class="d-inline-block">
				    <!-- <label for="search" class="visually-hidden">Search</label> -->
				    <input type="text" class="form-control" value="${pager.search}" name="search" id="search"  style="width: 400px; margin-left: 15px" placeholder="검색어를 입력하세요">
				  </div>
				  
				   <div class="d-inline-block">
				    <button type="submit" class="btn btn-outline-success productSearchBtn">검색</button>
				  </div>
				</form>
			</div>
			
			</div>
		</div>
	
<!-- 		 <script src="/resources/js/product/pageing.js"></script> -->
		<!-- <script src="/resources/js/product/addList.js"></script> -->
		