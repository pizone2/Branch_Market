<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board myList</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
       
        <!-- Banner Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <hr>
                </div>
                <div class="col-lg-12 text-center">
                    <div class="background-page">
                        <div class="banner-text"><h2>MyPage</h2></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->
   

	<!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="mypage-text">
                <h4></h4>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-5 order-md-1 order-2">
                    <div class="blog__sidebar">
                    
                        <div class="blog__sidebar__item">
                            <h3>Category</h3>
                            <ul>
                                <li><a href="/member/myPage">내 계정</a></li>
                                <li><a href="/board/myList">내 게시글</a></li>
                                <li><a href="/product/myList">내 신청 상품 내역</a></li>
                                <li><a href="/pay/payList">내 구매 내역</a></li>
                                <li><a href="/inquiry/myList">내 문의 내역</a></li>
                                <li><a href="/product/recentProduct">최근 본 상품 :)</a></li>
                            </ul>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="blog__details__text">
                        <div style="text-align : center;">
                            <h2>내 게시글</h2>
                        </div>
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
						<div class="row">

							<!-- paseing -->
		<div class="row col-md-7 mx-auto ">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item ${pager.before?'disabled':'' }">
						<a class="page-link text-success" href="./myList?page=1&kind=${pager.kind}&search=${pager.search}&category=${pager.category}&state=${pager.state}" aria-label="Previous" data-board-page="1">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<li class="page-item ${pager.before?'disabled':'' }">
						<a class="page-link text-success" href="./myList?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}&category=${pager.category}&state=${pager.state}" aria-label="Previous" data-board-page="${pager.startNum-1}">
							<span aria-hidden="true">&lsaquo;</span>
						</a>
					</li>
					<c:if test="${empty pager.lastRow}">
						<li class="page-item"><a class="page-link text-success" href="./myList?page=1&kind=${pager.kind}&search=${pager.search}&category=${pager.category}&state=${pager.state}" data-board-page=1>1</a></li>
					</c:if>
					<c:if test="${not empty pager.perPage}">
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<li class="page-item"><a class="page-link text-success" href="./myList?page=${i}&kind=${pager.kind}&search=${pager.search}&category=${pager.category}&state=${pager.state}" data-board-page="${i}">${i}</a></li>
						</c:forEach>
					</c:if>
					<li class="page-item ${pager.after eq false?'disabled' :''}" >
						<a class="page-link text-success" href="./myList?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}&category=${pager.category}&state=${pager.state}"  aria-label="Next" data-board-page="${pager.lastNum+1}">
							<span aria-hidden="true">&rsaquo;</span>
						</a>
					</li>
					<li class="page-item ${pager.after eq false?'disabled' :''}" >
						<a class="page-link text-success" href="./myList?page=${pager.totalPage}&kind=${pager.kind}&search=${pager.search}&category=${pager.category}&state=${pager.state}"  aria-label="Next" data-board-page="${pager.totalPage}">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>
			</nav>
		</div>	


						</div>
                    </div>
                    <div class = "row" style="margin-left: 22%;">
                    <form class="row g-3" action="./myList" method="get" id="searchForm">
                      <input type="hidden" name="page" value="1" id="page">
                       
                       <div class="fw-bold fs-5 col-12 d-flex ">

                              
                         <select class="form-select" name="category" id="category" aria-label="Default select example">
                          <option ${pager.category eq '' ? 'selected':''} value="">모두 보기</option>
                          <option ${pager.category eq '여성패션' ? 'selected':''} value="여성패션">여성패션</option>
                          <option ${pager.category eq '남성패션' ? 'selected':''} value="남성패션">남성패션</option>
                            <option ${pager.category eq '가구/인테리어' ? 'selected':''} value="가구/인테리어">가구/인테리어</option>
                            <option ${pager.category eq '생활/주방' ? 'selected':''} value="생활/주방">생활/주방</option>
                            <option ${pager.category eq '가전제품' ? 'selected':''} value="가전제품">가전제품</option>
                            <option ${pager.category eq '전자기기(디지털,컴퓨터)' ? 'selected':''} value="전자기기(디지털,컴퓨터)">전자기기(디지털,컴퓨터)</option>
                          <option ${pager.category eq 'E쿠폰/티켓' ? 'selected':''} value="E쿠폰/티켓">E쿠폰/티켓</option>
                          <option ${pager.category eq '기타' ? 'selected':''} value="기타">기타</option>
                        </select>
                         
                           
                           
                              
                         <select class="form-select" name="state" id="state" aria-label="Default select example">
                          <option value="">모두</option>
                          <option ${pager.state eq '판매' ? 'selected':''} value="판매">판매</option>
                          <option ${pager.state eq '구매' ? 'selected':''} value="구매">구매</option>
                         </select>
                         
                         <select class="form-select" name="kind" id="kind" aria-label="Default select example">
                          <option value="title" ${pager.kind eq 'title' ? 'selected':''} >Title</option>
                          <option value="contents" ${pager.kind eq 'contents' ? 'selected':''}>Contents</option>
                        </select>
                         
                          </div>
                      
                        
                      <div class="d-inline-block">
                       
                        
                      </div>
                      <div class="d-inline-block">
                        
                        <input type="text" class="form-control" value="${pager.search}"" name="search" style="width: 400px; margin-left: 15px" id="search" placeholder="검색어를 입력하세요">
                      </div>
                      <div class="d-inline-block">
                        <button type="submit" class="btn btn-success mb-3">검색</button>
                      </div>
                    </form>
                    </div>
                    


                </div>
              </div>
          </div>
    </section>

    
    <c:import url="../template/footer.jsp"></c:import>
 	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>
	