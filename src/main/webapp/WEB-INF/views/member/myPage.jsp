<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <c:import url="../template/common_css.jsp"></c:import>
    <!-- <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script> -->
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
                            <h2>내 계정</h2>
                            <img class=" user-img" src="/resources/images/profileImg.png" alt="">
                            <!--<img class=" best-img" src="img/cherryBlossom.png" alt="">-->
                        </div>
                        <div class="row" id="check_row">                       
                            <div class="col-lg-7 col-md-6 mx-auto">                           
                                <div class="checkout__input ">
                                    <input type="text" placeholder="아이디: ${member.memberId}" readonly>                             
                                </div>
                                <div class="checkout__input">
                                    <input type="text" placeholder="이메일: ${member.memberEmail}" readonly>                                
                                </div>                                              
                                <div class="checkout__input">
                                    <input type="text" placeholder="전화번호: ${member.memberPhone}" readonly>                                
                                </div>                                                   
                                <div class="checkout__input">
                                    <input type="text" placeholder="주소: ${member.memberAddress}" readonly>                                
                                </div>                                                   
                                <div class="checkout__input">
                                    <input type="text" placeholder="인기도: ${member.memberHit}" readonly>                                
                                </div>                                                   
                                <div class="checkout__input">
                                    <input type="text" placeholder="권한: ${member.memberRole}" readonly>                                                   
                                </div>                                                                            
                            </div>
                        </div>
                        <h3 style="text-align: center;">판매 중 상품</h3>
                        <table class="boardTable table table-hover">
                            <thead class="table-success">
                                <tr>
                                    <th>Num</th> <th>Title</th> <th>Writer</th> <th>Date</th> <th>Hit</th>  
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td><a href="./board-details.html">Detail Test</a></td>
                                    <td>내용1</td>
                                    <td>날짜1</td>
                                    <td>조회수1</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>J제목2</td>
                                    <td>내용2</td>
                                    <td>날짜2</td>
                                    <td>조회수2</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>제목3</td>
                                    <td>내용3</td>
                                    <td>날짜3</td>
                                    <td>조회수3</td>
                                </tr>
                                <tr>
                                    <th scope="row">4</th>
                                    <td>J제목2</td>
                                    <td>내용2</td>
                                    <td>날짜2</td>
                                    <td>조회수2</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    <div class="list">
        <!--권한을 가지고 있는 사람만 보임 -->
        <button class="form-update btn btn-info"><a href="/member/update">정보 수정</a></button>
       
        <form action="/member/delete" method="post">
            <button class="form-delete btn btn-danger" type="submit">회원 탈퇴</button>
        </form> 
    </div>
    <!-- Blog Details Section End -->

    
    <c:import url="../template/footer.jsp"></c:import>
 	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>