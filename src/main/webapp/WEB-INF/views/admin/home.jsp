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
                        <div class="banner-text"><h2>관리자 페이지</h2></div>
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
                <div class="category-bar col-lg-3">         
                    
                <div class="manager-list col-lg-2">
                    <div class="mb-4">
                        <button class="state-btn btn"><a href="./banner-update.html">이벤트 배너 수정</a></button>
                    </div>
                    <div class="mb-4">
                        <button class="state-btn btn"><a href="./memberList">회원정보 관리</a></button>
                    </div>
                    <div>
                        <button class="state-btn btn"><a href="./add">관리자 추가</a></button>
                    </div>
                </div>

                </div>
                <div class="col-lg-9">
                    <!-- @@@@@@@@@@@@@@@@@@@@@@@@@  위탁상품 신청 목록  @@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                
                    <h2 class="mx-auto mb-4">위탁상품 신청 목록</h2>

                    <table class="boardTable table table-hover">
                        <thead class="table-success">
                            <tr>
                                <th>상품번호</th> <th>상품명</th> <th>카테고리</th> <th>이미지</th><th>상품가격</th><th>품질</th><th>등록여부</th> 
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="add-tr">
                                <th scope="row">1</th>
                                <td><a href="./board-details.html">목걸이</a></td>
                                <td>여성패션</td>
                                <td><img src="img/kong3.jpg" alt="" style="height: 100px; width: 120px;"></td>
                                <td>20000</td>
                                <td>
                                    <div class="mb-3">
                                    <select class="form-select" aria-label="Default select example" name="productQ" id="productQ${dto.productNum}">
                                    <option selected>품질</option>
                                    <option value="아주 좋음">아주 좋음</option>
                                    <option value="좋음">좋음</option>
                                    <option value="보통">보통</option>
                                    <option value="나쁨">나쁨</option>
                                    <option value="아주 나쁨">아주 나쁨</option>
                                    </select>
                                    </div>
                                </td>
                                <td>
                                <button class="product-add-btn btn">등록</button>
                                <button class="product-add-btn btn">삭제</button>
                                </td>
                            </tr>
                            <tr class="add-tr">
                                <th scope="row">1</th>
                                <td><a href="./board-details.html">목걸이</a></td>
                                <td>여성패션</td>
                                <td><img src="img/kong3.jpg" alt="" style="height: 100px; width: 120px;"></td>
                                <td>20000</td>
                                <td>
                                    <div class="mb-3">
                                    <select class="form-select" aria-label="Default select example" name="productQ" id="productQ${dto.productNum}">
                                    <option selected>품질</option>
                                    <option value="아주 좋음">아주 좋음</option>
                                    <option value="좋음">좋음</option>
                                    <option value="보통">보통</option>
                                    <option value="나쁨">나쁨</option>
                                    <option value="아주 나쁨">아주 나쁨</option>
                                    </select>
                                    </div>
                                </td>
                                <td>
                                <button class="product-add-btn btn">등록</button>
                                <button class="product-add-btn btn">삭제</button>
                                </td>
                            </tr>
                          
                           

                        </tbody>
                    </table>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination my-5">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">4</a></li>
                            <li class="page-item"><a class="page-link" href="#">5</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <style> 
                        h2{
                            text-align: center;
                        }
                        add-tr{
                            display: table-cell;
                            vertical-align: middle;
                        }
                        td{
                            text-align: center;
                        }
                    </style>

                      <!-- @@@@@@@@@@@@@@@@@@@@@@@@@  문의 내역  @@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                    
                      <h2 class="mx-auto mb-4">문의 내역</h2>

                    <table class="boardTable table table-hover">
                        <thead class="table-success">
                            <tr>
                                 <th scope="col">아이디</th>
						         <th scope="col">문의 제목</th>
						         <th scope="col">문의 내용</th>
						         <th scope="col">문의 카테고리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <c:forEach items="${inquiryDTOs}" var="inquiryDTO">
					                   <tr>
					                  <td>${inquiryDTO.memberId}</td>
					                  <td><a href="./detail?inquiryNum=${inquiryDTO.inquiryNum}">${inquiryDTO.inquiryTitle}</a></td>
					                  <td>${inquiryDTO.inquiryDetail}</td>
					                  <td>${inquiryDTO.inquiryCategory}</td>
					              </tr>
					          </c:forEach>
                            </tr>
                          
                        </tbody>
                    </table>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination my-5">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">4</a></li>
                            <li class="page-item"><a class="page-link" href="#">5</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
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
    
    <div id="inquiryList"></div>
    
    

	

	<!-- <h3>관리자 페이지 입니다.</h3>
	<a href="./add" class="btn btn-primary">관리자 추가하기</a>
	<a href="./memberList" class="btn btn-primary">멤버 리스트 보기</a> -->
	
	<script src="/resources/js/admin/list.js"></script>
	<c:import url="../template/footer.jsp"></c:import>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>