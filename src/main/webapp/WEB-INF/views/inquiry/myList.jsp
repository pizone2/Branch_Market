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
    <title>Ogani | Template</title>
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
                            <h2>내 문의 내역</h2>
                        </div>
                        <table class="boardTable table table-hover">
                            <thead class="table-success">
                                <tr>
                                    <th>문의번호</th> <th>제목</th> <th>작성자</th> <th>카테고리</th>
                                </tr>
                            </thead>
                            <tbody>	
								<c:forEach items="${inquiryDTOs}" var="inquiryDTO">
									<tr>
										<td scope="row">${inquiryDTO.r}</td>
										<td><a href="./detail?inquiryNum=${inquiryDTO.inquiryNum}">${inquiryDTO.inquiryTitle}</a></td>
										<td>${inquiryDTO.memberId}</td>
										<td>${inquiryDTO.inquiryCategory}</td>

										<!-- <td><button class="btn btn-danger del" data-inquiryNum="${inquiryDTO.inquiryNum}">삭제</button></td> -->
									</tr>
								</c:forEach>
										
                            </tbody>
                        </table>
                    </div>
                    
					<div class = "row mx-auto d-flex justify-content-center" id="pagining">
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
				   <div class = "row mx-auto my-3 d-flex justify-content-end">
						 <form class="row g-3" action="./myList" method="get" id="paginingForm">
							 <input type="hidden" name="page" id="page">
							 <!-- <input type="hidden" name="category" id="category" value="${pager.category}"> -->
							 <select name="category" id="category" style="padding: 0px">
							   <option ${pager.category eq '환불/취소' ? 'selected' : ''} value="환불/취소">환불/취소</option>
							   <option ${pager.category eq '신고' ? 'selected' : ''} value="신고">신고</option>
							   <option ${pager.category eq '배송' ? 'selected' : ''} value="배송">배송</option>
							   <option ${pager.category eq '기타' ? 'selected' : ''} value="기타">기타</option>
							   <option ${pager.category eq '' ? 'selected' : ''} value="">모두</option>
						   </select>
   
							 <div class="col-auto" style="padding: 0px">
							   <!-- <label for="kind" class="visually-hidden">Kind</label> -->
							   <select name="kind" class="form-select" id="kind" aria-label="Default select example">
								 <option value="inquiryTitle" ${pager.kind eq 'inquiryTitle' ? 'selected' : ''} >제목</option>
								 <option value="inquiryDetail" ${pager.kind eq 'inquiryDetail' ? 'selected' : ''}>내용</option>
							   </select>
							 </div>
							 <div class="col-auto" style="padding: 0px">
							   <!-- <label for="search" class="visually-hidden">Search</label> -->
							   <input type="text" class="form-control" name="search" id="search" placeholder="검색어를 입력 하세요." value="${pager.search}">
							 </div>
							 <div class="col-auto" style="padding: 0px">
							   <button type="submit" class="btn btn-success mb-3">검색</button>
							 </div>
					   </form>
				   </div>

                </div>
            </div>
        </div>
    </section>


	<div class="container">
		<!-- pagining -->
	      
		</div>
				<c:import url="../template/footer.jsp"></c:import>
				<script src="/resources/js/inquiry/list.js"></script>
  				<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>
