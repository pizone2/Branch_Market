<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<div class="container-fluid my-5">
	<div class="row mb-4 ">
		<h1 class="col-md-7 mx-auto text-center border-bottom border-dark pb-4">Board List Page</h1>
	</div>
	<div class="row col-md-7 mx-auto">
	
		<!-- BoardList -->
		<table class="table table-hover">
			<thead class="table-success">
				<tr>
					<th>Num</th> <th>Title</th> <th>Writer</th> <th>Date</th> <th>Hit</th>  
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.boardNum}</td>
						<td>
							<a href="./detail?boardNum=${dto.boardNum}">${dto.boardTitle}</a>
						</td>
						<td>${dto.memberId}</td>
						<td>${dto.boardDate}</td>
						<td>${dto.boardHit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- paseing -->
		<div class="row col-md-7 mx-auto">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			    <li class="page-item ${pager.before?'disabled':'' }">
			      <a class="page-link" href="./list?page=1&kind=${pager.kind}&search=${pager.search}" aria-label="Previous" data-board-page="1">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li class="page-item ${pager.before?'disabled':'' }">
			      <a class="page-link" href="./list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous" data-board-page="${pager.startNum-1}">
			        <span aria-hidden="true">&lsaquo;</span>
			      </a>
			    </li>
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    <li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}" data-board-page="${i}">${i}</a></li>
			     </c:forEach>
			     <li class="page-item ${pager.after eq false?'disabled' :''}" >
			      <a class="page-link" href="./list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}"  aria-label="Next" data-board-page="${pager.lastNum+1}">
			        <span aria-hidden="true">&rsaquo;</span>
			      </a>
			    </li>
			    <li class="page-item ${pager.after eq false?'disabled' :''}" >
			      <a class="page-link" href="./list?page=${pager.totalPage}&kind=${pager.kind}&search=${pager.search}"  aria-label="Next" data-board-page="${pager.totalPage}">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		</div>	
		
		<!-- 검색창 -->	
		<div class="row">
			<form class="row g-3" action="./list" method="get" id="searchForm">
				<input type="hidden" name="page" value="1" id="page">
			  <div class="col-auto">
			    <label for="kind" class="visually-hidden">kind</label>
			    <select class="form-select" name="kind" id="kind" aria-label="Default select example">
				  <option value="title" ${pager.kind eq 'boardTitle' ? 'selected':''} >Title</option>
				  <option value="contents" ${pager.kind eq 'boardContents' ? 'selected':''}>Contents</option>
				  <option value="writer" ${pager.kind eq 'memberId' ? 'selected':''}>writer</option>
				</select>
			  </div>
			  <div class="col-auto">
			    <label for="search" class="visually-hidden">search</label>
			    <input type="text" class="form-control" value="${pager.search}"" name="search" id="search" placeholder="검색어를 입력하세요">
			  </div>
			  <div class="col-auto">
			    <button type="submit" class="btn btn-success mb-3">검색</button>
			  </div>
			</form>
		</div>
		
		<!-- BoardAdd -->
		<div>
			<a href="./add" class="btn btn-outline-success col-3">게시물 올리기</a>
		</div>
	</div>
</div>
</body>
</html>