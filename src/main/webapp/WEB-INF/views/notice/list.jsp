<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Notice List</title>
	<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>

	<!-- private Integer noticeNum;
	private String memberId;
	private String noticeTitle;
	private String noticeContents;
	private Date noticeDate;
	private Integer noticeHit; -->
	 <!-- Banner Section Begin -->
	 <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <hr>
                </div>
                <div class="col-lg-12 text-center">
                    <div class="background-page">
                        <div class="banner-text"><h2>공지사항</h2></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                
                <div class="col-lg-12 mx-auto">
                    
                    <table class="boardTable table table-hover">
                        <thead class="table-success">
                            <tr>
                                <th>Num</th> <th>Title</th><th>writer</th><th>Date</th> <th>Hit</th> <th>업데이트</th> <th>삭제</th>
                            </tr>
                        </thead>
                        <tbody>
							<c:forEach items="${noticeDTOs}" var="dto">
								<tr scope="row">
									<td><h2>${dto.noticeNum}</h2></td>
									<td><a href="./detail?noticeNum=${dto.noticeNum}"><h2>${dto.noticeTitle}</h2></a></td>
									<td><h2>${dto.memberId}</h2></td>
									<td><h2>${dto.noticeDate}</h2></td>
									<td><h2>${dto.noticeHit}</h2></td>
									<td><a class="btn btn-primary" href="./update?noticeNum=${dto.noticeNum}">업데이트</a></td>
									<td><button class="btn btn-danger del" data-noticeNum="${dto.noticeNum}">삭제</button></td>			
								</tr>
							</c:forEach>
                        </tbody>
                      </table>
                      
                </div>

                <!-- pagining -->
	     		 <div class = "row col-12" id="pagining">
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

                <div class="col-4">
                    <div class="hero__search">
                        <div class="hero__search_btn">
							<form class="row g-5" action="./list" method="get" id="paginingForm">
								<input type="hidden" name="page" id="page">
								<div class="col-auto d-flex justify-content-between">
								  
								  <select name="kind" class="form-select" id="kind" aria-label="Default select example">
									<option value="noticeTitle" ${pager.kind eq 'noticeTitle' ? 'selected' : ''} >제목</option>
									<option value="noticeContents" ${pager.kind eq 'noticeContents' ? 'selected' : ''}>내용</option>
								  </select>
								  <input type="text" class="form-control" name="search" id="search" placeholder="검색어를 입력 하세요." value="${pager.search}">
								  <button type="submit" class="btn btn-primary" style="width: auto;">검색</button>
								</div>
						  </form>
						  <button class="add-btn btn btn-danger"><a href="./add">공지사항 올리기</a></button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- Hero Section End -->

				
				<!-- 검색창
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
				</div> -->
	
				<c:import url="../template/footer.jsp"></c:import>
				<script src="/resources/js/notice/list.js"></script>
  				<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>
