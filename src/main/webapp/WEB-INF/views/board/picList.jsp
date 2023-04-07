<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
				<div id="datas" data-productNum="${dto.boardNum}"
                     data-member-id="${member.memberId}"
                     data-member-email="${member.memberEmail}"
                     data-member-phone="${member.memberPhone}"
                     data-member-address="${member.memberAddress}"
                ></div>

<!-- Banner Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <hr>
                </div>
                <div class="col-lg-12 text-center">
                    <div class="background-page">
                        <div class="banner-text"><h2>찜 목록</h2></div>
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
            
            
               <%--  <div class="category-bar col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                        <form class="row g-3" action="./list" method="get" id="searchForm">
                        <input type="hidden" id="page" name="page">
                            <i class="fa fa-bars"></i>
                            <span>카테고리</span>
                        </div>
                        <ul >
							<li><a href="./list?category=여성패션" value="여성패션">여성패션</a></li>
							<li><a href="./list?category=남성패션" value="남성패션">남성패션</a></li>
							<li><a href="./list?category=가구/인테리어" value="가구/인테리어">가구/인테리어</a></li>
							<li><a href="./list?category=생활/주방" value="생활/주방">생활/주방</a></li>
							<li><a href="./list?category=가전제품" value="가전제품">가전제품</a></li>
							<li><a href="./list?category=전자기기" value="전자기기">전자기기</a></li>
							<li><a href="./list?category=E쿠폰/티켓" value="E쿠폰/티켓">E쿠폰/티켓</a></li>
							<li><a href="./list?category=기타" value="기타">기타</a></li>
                       	</ul>
                      
                    </div>
                    <div class="state-btn-form row my-3">
                        <div class="col-6">
                            <button class="state-btn btn"><a href="./list?state=판매" value="판매">판매</a></button>
                        </div>
                        <div class="col-6">
                            <button class="state-btn btn"><a href="./list?state=구매" value="구매">구매</a></button>
                        </div>
                    </div>
                    <div class="hero__search">
                        <div class="hero__search_btn">
                            <form class="row g-3" action="./list" method="get" id="searchForm">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" value="${pager.search}" name="search" id="search" placeholder="검색어를 입력하세요">
                                    <button type="submit" class="btn btn-outline-success">검색</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div>
                    	<c:if test="${not empty member}">
                        	<a href="./add"><button class="state-btn btn">게시물 올리기</button></a>
                        </c:if>
                    </div>
                     	</form>
                </div> --%>
                <div class="col-lg-12">
                    <!-- BoardList -->
					<table class="table table-hover">
						<thead class="table-success">
							<tr>
								<th>Num</th> <th>Title</th> <th>Writer</th> <th>Date</th> <th>Hit</th>  
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${boardDTOs}" var="dto">
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
					 <nav aria-label="Page navigation example">
                        <ul class="pagination">
                        
                           <li class="page-item ${pager.before ? 'disabled' : ''}">
                              <a class="page-link" href="./picList?page=1&kind=${pager.kind}&search=${pager.search}&category=${pager.category}&state=${pager.state}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span> 
                              </a>
                             </li>
                             <li class="page-item ${pager.before ? 'disabled' : ''}">
                              <a class="page-link" href="./picList?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}&category=${pager.category}&state=${pager.state}" aria-label="Previous">
                                <span aria-hidden="true">&lsaquo;</span>
                              </a>
                             </li>
                             
                             
                             <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                                <li class="page-item"><a class="page-link" href="./picList?page=${i}&kind=${pager.kind}&search=${pager.search}&category=${pager.category}&state=${pager.state}">${i+1}</a></li>
                             </c:forEach>
                             
                             
                              <li class="page-item ${pager.after eq false ? 'disabled' : ''}">
                              <a class="page-link"  href="./picList?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}&category=${pager.category}&state=${pager.state}" aria-label="Next">
                                <span aria-hidden="true">&rsaquo;</span>
                              </a>
                             </li>
                             
                             
                             <li class="page-item ${pager.after eq false ? 'disabled' : ''}">
                              <a class="page-link"  href="./picList?page=${pager.totalPage}&kind=${pager.kind}&search=${pager.search}&category=${pager.category}&state=${pager.state}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                              </a>
                             </li>
                     </ul>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Hero Section End -->

<c:import url="../template/common_js.jsp"></c:import>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>



boardPicList
<c:forEach items="${boardDTOs}" var="dto">
	<h5>boardNum = ${dto.boardNum}</h5>
	<h5>boardTitle = ${dto.boardTitle}</h5>
</c:forEach>