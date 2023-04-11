<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <h2 class="mx-auto mb-4">문의 내역</h2>

                    <table class="boardTable table table-hover">
                        <thead class="table-success">
                            <tr>
                                 <th scope="col">아이디</th>
						         <th scope="col">문의 제목</th>
						         <th scope="col">문의 내용</th>
						         <th scope="col">문의 카테고리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <c:forEach items="${inquiryDTOs}" var="inquiryDTO">
					                   <tr>
					                  <td>${inquiryDTO.memberId}</td>
					                  <td><a href="../inquiry/detail?inquiryNum=${inquiryDTO.inquiryNum}">${inquiryDTO.inquiryTitle}</a></td>
					                  <td>${inquiryDTO.inquiryDetail}</td>
					                  <td>${inquiryDTO.inquiryCategory}</td>
					              </tr>
					          </c:forEach>
                            </tr>
                          
                        </tbody>
                    </table>

<%-- <table class="table table-success">
  <thead>
    <tr>
      <th scope="col">아이디</th>
      <th scope="col">문의 제목</th>
      <th scope="col">문의 내용</th>
      <th scope="col">문의 카테고리</th>
    </tr>
  </thead>
  <tbody>
	   	<c:forEach items="${inquiryDTOs}" var="inquiryDTO">
	   	  	<tr>
				<td><h2>${inquiryDTO.memberId}</h2></td>
				<td><a href="./detail?inquiryNum=${inquiryDTO.inquiryNum}"><h2>${inquiryDTO.inquiryTitle}</h2></a></td>
				<td><h2>${inquiryDTO.inquiryDetail}</h2></td>
				<td><h2>${inquiryDTO.inquiryCategory}</h2></td>
			</tr>
		</c:forEach>
  </tbody>
</table> --%>

		<!-- pagining -->
	      <!-- <div class = "row" id="pagining"> -->
		        	 <nav aria-label="Page navigation example">
					  <ul class="pagination">
					  	<li class="page-item" data-page="1">
					      <span class="page-link" data-page="1" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </span>
					    </li>
					    
					    <li class="page-item ${pager.before?'disabled':''}" data-page="${pager.startNum - 1}">
					      <span class="page-link" data-page="${pager.startNum - 1}" aria-label="Previous">
					        <span aria-hidden="true">&lsaquo;</span>
					      </span>
					    </li>
					    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
    						    <li class="page-item" data-page="${i}"><span class="page-link" data-page="${i}">${i}</span></li>
					    </c:forEach>


					    <li class="page-item ${pager.after eq false ? 'disabled' : ''}" data-page="${pager.lastNum + 1}">
					      <span class="page-link" data-page="${pager.lastNum + 1}" aria-label="Next">
					        <span aria-hidden="true">&rsaquo;</span>
					      </span>
					    </li>
					    <li class="page-item" data-page="${pager.totalPage}">
					      <span class="page-link" data-page="${pager.totalPage}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </span>
					    </li>
					  </ul>
					</nav>
			<!-- </div> -->
			<h2>&nbsp</h2>
				
				<!-- 검색창 -->
				
				
				<div class = "row" style="margin-left: 22%;">
				
					<div class="fw-bold fs-5 col-12">
							<select name="kind" class="form-select" id="kind" aria-label="Default select example">
							  <option value="inquiryTitle" ${pager.kind eq 'inquiryTitle' ? 'selected' : ''} >제목</option>
							  <option value="inquiryDetail" ${pager.kind eq 'inquiryDetail' ? 'selected' : ''}>내용</option>
							</select>
					
					</div>
				
				
				
				
			<!-- 		  <form class="row g-3" action="#" method="get" id="paginingForm"> -->
						  <input type="hidden" name="page" id="page" class="page">
						  <input type="hidden" name="category" id="category" value="${pager.category}">
						  <div class="d-inline-block">
						    <!-- <label for="kind" class="visually-hidden">Kind</label> -->
						   
						  </div>
						  <div class="d-inline-block">
						    <!-- <label for="search" class="visually-hidden">Search</label> -->
						    <input type="text" class="form-control" name="search" id="search" style="width: 400px; margin-left: 15px" placeholder="검색어를 입력 하세요." value="${pager.search}">
						  </div>
						  <div class="d-inline-block">
						    <button type="submit" class="btn btn-outline-success inqSearchBtn">검색</button>
						  </div>
					<!-- </form> -->
				</div>
	
				<!-- <script src="/resources/js/inquiry/list.js"></script> -->

