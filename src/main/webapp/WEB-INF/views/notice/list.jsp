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
	<c:import url="../template/header.jsp"></c:import>
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
                                <th>상품번호</th> <th>제목</th><th>작성자</th><th>작성일</th> <th>조회수</th>
                            </tr>
                        </thead>
                        <tbody>
							<c:forEach items="${noticeDTOs}" var="dto">
								<tr scope="row">
									<td>${dto.r}</td>
									<td><a href="./detail?noticeNum=${dto.noticeNum}" style="color: cadetblue;">${dto.noticeTitle}</a></h2></td>
									<td><a href="/member/myPage?memberId=${dto.memberId}" style="color: steelblue;">${dto.memberId}</a></td>
									<td>${dto.date}</td>
									<td>${dto.noticeHit}</td>		
								</tr>
							</c:forEach>
                        </tbody>
                      </table>
                      
                </div>

                <!-- pagining -->
	     		 <div class = "row col-12 d-flex justify-content-center" id="pagining">
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
								  <input type="text" class="form-control" name="search" id="search" placeholder="제목을 입력 하세요." value="${pager.search}">
								  <button type="submit" class="btn btn-success text-white" style="width: 100px;">검색</button>
								</div>
						  </form>
						  <c:if test="${not empty member and member.memberRole eq 'admin'}">
							  <button class="btn btn-success mt-2 text-white"><a href="./add">공지사항 올리기</a></button>
						  </c:if>
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
