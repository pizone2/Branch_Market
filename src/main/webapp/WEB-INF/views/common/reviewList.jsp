<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
 <!-- <table class="table table-success">
	<thead>
	  <tr>
		<th scope="col">글내용</th>
		<th scope="col">작성자</th>
	  </tr>
	</thead>
	<tbody>
			<c:forEach items="${reviewDTOs}" var="reviewDTO">
				<tr>
					<td><h5 id="reviewContents${reviewDTO.reviewNum}">${reviewDTO.reviewContents}</h5></td>
					<td><h5>${reviewDTO.memberId}</h5></td>
					<td><input type="button" value="수정하기" class="btn btn-primary update" data-update-reviewNum="${reviewDTO.reviewNum}" data-update-contents="${reviewDTO.reviewContents}"
					data-bs-toggle="modal" data-bs-target="#exampleModal" id="reviewUpdateBtn" ></td>
					<td><input type="button" value="삭제하기" data-delete-reviewNum="${reviewDTO.reviewNum}" class="btn btn-danger"></td>
				</tr>
			</c:forEach>
	</tbody>
  </table> -->
  
		  <!-- pagining -->
			 <!-- <div class = "row" id="pagining">
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
			  </div> -->
				  
				  <!-- 검색창 -->
				   <!-- <div class = "row">
					<form action="./list" method="get" id="paginingForm">
						<input type="hidden" name="page" id="page">
						<input type="hidden" name="category" id="category" value="${pager.category}">
						<div class="col-auto">
							<label for="kind" class="visually-hidden">Kind</label>
							<select name="kind" class="form-select" id="kind" aria-label="Default select example">
							<option value="memberId" ${pager.kind eq 'memberId' ? 'selected' : ''} >작성자</option>
							<option value="reviewContents" ${pager.kind eq 'reviewContents' ? 'selected' : ''}>내용</option>
							</select>
						</div>
						<div class="col-auto">
							<label for="search" class="visually-hidden">Search</label>
							<input type="text" class="form-control" name="search" id="search" placeholder="검색어를 입력 하세요." value="${pager.search}">
						</div>
						<div class="col-auto">
							<button type="submit" class="btn btn-primary mb-3" id="searchBtn">검색</button>
						</div>
					</form>
				  </div>  -->




				  <div class="col-lg-12">
                    <div class="product__details__tab">
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <table class="table">
                                        <thead class="table-success">
                                            <tr>
                                                <th scope="col">글내용</th>
												<th scope="col">작성자</th>
                                                <th scope="col">평점</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${reviewDTOs}" var="dtos"> 
                                            <tr>
                                                <td>${dtos.memberId}</td>
                                                <td>${dtos.reviewContents}</td>
                                                <td>${dtos.reviewScore}</td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
										<!-- <div class="input-group mb-3">
											<input type="button" class="btn btn-success" value="리뷰 작성" id="reviewAddBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">
										</div> -->
                                    </table>

								<!-- pagining -->
								 <div class = "mx-auto" ><!--id="pagining" -->
									<nav aria-label="Page navigation example">
									<ul class="pagination">
										<li class="page-item ${pager.before ? 'disabled' : ''}">
											<a class="page-link" href="./detail?productNum=${dto.productNum}/review?page=1&kind=${pager.kind}&search=${pager.search}&category=${pager.category}" aria-label="Previous">
											  <span aria-hidden="true">&laquo;</span>
											</a>
										  </li>
										
										
										  <li class="page-item ${pager.before ? 'disabled' : ''}">
											<a class="page-link" href="./list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}&category=${pager.category}" aria-label="Previous">
											  <span aria-hidden="true">&lsaquo;</span>
											</a>
										  </li>
										  
										  
										  <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
											  <li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}&category=${pager.category}">${i}</a></li>
										  </c:forEach>
										  
										  
										   <li class="page-item ${pager.after eq false ? 'disabled' : ''}">
											<a class="page-link"  href="./list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}&category=${pager.category}" aria-label="Next">
											  <span aria-hidden="true">&rsaquo;</span>
											</a>
										  </li>
										  
										  
										  <li class="page-item ${pager.after eq false ? 'disabled' : ''}">
											<a class="page-link"  href="./list?page=${pager.totalPage}&kind=${pager.kind}&search=${pager.search}&category=${pager.category}" aria-label="Next">
											  <span aria-hidden="true">&raquo;</span>
											</a>
										</li>
									</ul>
									</nav>
								</div>
					   
								<!-- 검색창 -->
								<div class = "row">
									<form action="./list" method="get" id="paginingForm">
										<input type="hidden" name="page" id="page">
										<input type="hidden" name="category" id="category" value="${pager.category}">
										<div class="col-auto">
											<label for="kind" class="visually-hidden"></label>
											<select name="kind" class="form-select" id="kind" aria-label="Default select example">
											<option value="memberId" ${pager.kind eq 'memberId' ? 'selected' : ''} >작성자</option>
											<option value="reviewContents" ${pager.kind eq 'reviewContents' ? 'selected' : ''}>내용</option>
											</select>
										</div>
										<div class="col-auto">
											<label for="search" class="visually-hidden"></label>
											<input type="text" class="form-control" name="search" id="search" placeholder="검색어를 입력 하세요." value="${pager.search}">
										</div>
										<div class="col-auto">
											<button type="submit" class="btn btn-primary mb-3" id="searchBtn">검색</button>
										</div>
									</form>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
								
			
