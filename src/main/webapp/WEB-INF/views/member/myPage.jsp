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
            	
            	<c:if test="${member.memberId eq memberDTO.memberId}">
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
                </c:if>
                
                <div class="col-lg-8 col-md-7 order-md-1 order-1 mx-auto">
                    
                    <div class="blog__details__text">
                        <div style="text-align : center;">
                            <h2>${memberDTO.memberHit >= 10 ? '<i class="fa fa-star" aria-hidden="true"></i>': ''} 
                            	${memberDTO.memberId} 계정</h2>
                            <img class=" user-img" src="https://cdn-icons-png.flaticon.com/512/5580/5580909.png" alt="">
                            <!--<img class=" best-img" src="img/cherryBlossom.png" alt="">-->
                        </div>
                        <div class="row" id="check_row">                       
                            <div class="col-lg-7 col-md-6 mx-auto">                           
                                <div class="checkout__input ">
                                    <input type="text" placeholder="아이디: ${memberDTO.memberId}" readonly>                             
                                </div>
                                <div class="checkout__input">
                                    <input type="text" placeholder="이메일: ${memberDTO.memberEmail}" readonly>                                
                                </div>                                              
                                <div class="checkout__input">
                                    <input type="text" placeholder="전화번호: ${memberDTO.memberPhone}" readonly>                                
                                </div>                                                   
                                <div class="checkout__input">
                                    <input type="text" placeholder="주소: ${memberDTO.memberAddress}" readonly>                                
                                </div>                                                   
                                <div class="checkout__input">
                                    <input type="text" placeholder="인기도: ${memberDTO.memberHit}" data-memberHit=" ${memberDTO.memberHit}" readonly>                                
                                </div>                                                   
                                <div class="checkout__input">
                                    <input type="text" placeholder="권한: ${memberDTO.memberRole}" readonly>                                                   
                                </div>   
                                <c:if test="${member.memberId ne memberDTO.memberId}">
                                	<a class="btn btn-success mx-2" id="hitUpdateBtn" style="color: white;">인기도 올리기</a>  
                                </c:if>                                                                       
                            </div>
                        </div>
                        <div id="mySellList" data-memberId = "${memberDTO.memberId}"></div>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    
    
  <c:if test="${member.memberId eq memberDTO.memberId}">
    <div class="list">
        <!-- 권한을 가지고 있는 사람만 보임 -->
        
        <a href="/member/updatePw"><button class="form-list btn btn-success">비번 수정</button></a>
       
        <a class="form-update btn btn-info" href="/member/update">정보 수정</a>
       
        <form action="/member/delete" method="post">
            <button class="form-delete btn btn-danger" type="submit">회원 탈퇴</button>
        </form> 
    </div>
</c:if>

    <!-- Blog Details Section End -->

    <script src="/resources/js/member/myPage.js"></script>
    <c:import url="../template/footer.jsp"></c:import>
 	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>