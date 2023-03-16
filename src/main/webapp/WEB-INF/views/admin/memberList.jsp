<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>

<table class="table table-success">
  <thead>
    <tr>
      <th scope="col">아이디</th>
      <th scope="col">비밀번호</th>
      <th scope="col">이메일</th>
      <th scope="col">핸드폰 번호</th>
      <th scope="col">주소</th>
      <th scope="col">인기도</th>
      <th scope="col">권한</th>
    </tr>
  </thead>
  <tbody>
	   	<c:forEach items="${memberDTOs}" var="memberDTO">
	   	  	<tr>
				<td><h2>${memberDTO.memberId}</h2></td>
				<td><h2>${memberDTO.memberPw}</h2></td>
				<td><h2>${memberDTO.memberEmail}</h2></td>
				<td><h2>${memberDTO.memberPhone}</h2></td>
				<td><h2>${memberDTO.memberAddress}</h2></td>
				<td><h2>${memberDTO.memberHit}</h2></td>
				<td><h2>${memberDTO.memberRole}</h2></td>
			</tr>
		</c:forEach>
  </tbody>
</table>

		<!-- pagining -->
	      <div class = "row" id="pagining">
		        	 <nav aria-label="Page navigation example">
					  <ul class="pagination">
					  	<li class="page-item" data-page="1">
					      <a class="page-link" data-page="1" aria-label="Previous" href="#">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    
					    <li class="page-item ${pager.before?'disabled':''}" data-page="${pager.startNum - 1}">
					      <a class="page-link" data-page="${pager.startNum - 1}" aria-label="Previous" href="#">
					        <span aria-hidden="true">&lsaquo;</span>
					      </a>
					    </li>
					    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
    						    <li class="page-item" data-page="${i}"><a class="page-link" data-page="${i}" href="#">${i}</a></li>
					    </c:forEach>


					    <li class="page-item ${pager.after eq false ? 'disabled' : ''}" data-page="${pager.lastNum + 1}">
					      <a class="page-link" data-page="${pager.lastNum + 1}" aria-label="Next" href="#">
					        <span aria-hidden="true">&rsaquo;</span>
					      </a>
					    </li>
					    <li class="page-item" data-page="${pager.totalPage}">
					      <a class="page-link" data-page="${pager.totalPage}" aria-label="Next" href="#">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
			</div>
				
				<!-- 검색창 -->
				<div class = "row">
					  <form class="row g-3" action="./memberList" method="get" id="paginingForm">
						  <input type="hidden" name="page" id="page">
						  <div class="col-auto">
						    <label for="kind" class="visually-hidden">Kind</label>
						    <select name="kind" class="form-select" id="kind" aria-label="Default select example">
							  <option value="memberId" ${pager.kind eq 'memberId' ? 'selected' : ''}>아이디</option>
							  <option value="memberAddress" ${pager.kind eq 'memberAddress' ? 'selected' : ''}>주소</option>
							</select>
						  </div>
						  <div class="col-auto">
						    <label for="search" class="visually-hidden">Search</label>
						    <input type="text" class="form-control" name="search" id="search" placeholder="검색어를 입력 하세요." value="${pager.search}">
						  </div>
						  <div class="col-auto">
						    <button type="submit" class="btn btn-primary mb-3">검색</button>
						  </div>
					</form>
				</div>
	
				<script src="/resources/js/member/memberList.js"></script>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>
