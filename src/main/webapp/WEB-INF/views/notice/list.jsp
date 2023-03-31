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

	<!-- private Integer noticeNum;
	private String memberId;
	private String noticeTitle;
	private String noticeContents;
	private Date noticeDate;
	private Integer noticeHit; -->
	
<table class="table table-success">
  <thead>
    <tr>
      <th scope="col">공지사항 번호</th>
      <th scope="col">아이디</th>
      <th scope="col">제목</th>
      <th scope="col">작성날짜</th>
       <th scope="col">조회수</th>
    </tr>
  </thead>
  <tbody>
	   	<c:forEach items="${noticeDTOs}" var="dto">
	   	  	<tr>
				<td><h2>${dto.noticeNum}</h2></td>
				<td><h2>${dto.memberId}</h2></td>
				<td><a href="./detail?noticeNum=${dto.noticeNum}"><h2>${dto.noticeTitle}</h2></a></td>
				<td><h2>${dto.noticeContents}</h2></td>
				<td><h2>${dto.noticeHit}</h2></td>
				<td><a class="btn btn-primary" href="./update?noticeNum=${dto.noticeNum}">업데이트</a></td>
				<td><button class="btn btn-danger del" data-noticeNum="${dto.noticeNum}">삭제</button></td>			
			</tr>
		</c:forEach>
  </tbody>
</table>
		<a class="btn btn-primary" href="./add">추가</a>
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
					  <form class="row g-3" action="./list" method="get" id="paginingForm">
						  <input type="hidden" name="page" id="page">
						  <div class="col-auto">
						    <label for="kind" class="visually-hidden">Kind</label>
						    <select name="kind" class="form-select" id="kind" aria-label="Default select example">
							  <option value="noticeTitle" ${pager.kind eq 'noticeTitle' ? 'selected' : ''} >제목</option>
							  <option value="noticeContents" ${pager.kind eq 'noticeContents' ? 'selected' : ''}>내용</option>
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
	
				<script src="/resources/js/notice/list.js"></script>
  				<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>
