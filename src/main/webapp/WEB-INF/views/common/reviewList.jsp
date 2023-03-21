<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
  <table class="table table-success">
	<thead>
	  <tr>
		<th scope="col">글내용</th>
		<th scope="col">작성자</th>
	  </tr>
	</thead>
	<tbody>
			<c:forEach items="${reviewDTO}" var="reviewDTO">
				<tr>
					<td><h5 id="reviewContents${reviewDTO.reviewNum}">${reviewDTO.reviewContents}</h5></td>
					<td><h5>${reviewDTO.memberId}</h5></td>
					<td><input type="button" value="수정하기" class="btn btn-primary" data-update-reviewNum="${reviewDTO.reviewNum}"
					data-bs-toggle="modal" data-bs-target="#exampleModal" ></td>
					<td><input type="button" value="삭제하기" data-delete-reviewNum="${reviewDTO.reviewNum}" class="btn btn-danger"></td>
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
						<input type="hidden" name="page" id="page">
						<input type="hidden" name="category" id="category" value="${pager.category}">


						<div class="col-auto">
							<label for="kind" class="visually-hidden">Kind</label>
							<select name="kind" class="form-select" id="kind" aria-label="Default select example">
							<option value="memberId" ${pager.kind eq 'memberId' ? 'selected' : ''} >작성자</option>
							<option value="inqCommentsContents" ${pager.kind eq 'inqCommentsContents' ? 'selected' : ''}>내용</option>
							</select>
						</div>
						<div class="col-auto">
							<label for="search" class="visually-hidden">Search</label>
							<input type="text" class="form-control" name="search" id="search" placeholder="검색어를 입력 하세요." value="${pager.search}">
						</div>
						<div class="col-auto">
							<button type="submit" class="btn btn-primary mb-3" id="searchBtn">검색</button>
						</div>
				  </div>
