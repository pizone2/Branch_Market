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
                    <div class="mypage-text">
		                <h4></h4>
		            </div>
            <div class="row">

            	<div class="category-bar col-lg-3 col-md-3">	
            	<div class="blog__sidebar">
                        <div class="blog__sidebar__item">
                            <h3>Category</h3>
                            <ul>
                                <li><a href="../event/event/list">이벤트 배너 수정 :)</a></li>
                                <li><a href="./memberList">회원정보 조회</a></li>
                                <li><a href="./add">관리자 추가</a></li>
                                <li><a id="getNaverDataBtn">테스트 데이터 넣기</a></li>
                            </ul>
                        </div>
                        
                    </div>
                 </div>
                <!-- <div class="category-bar col-lg-3 col-md-3">                             
	                <div class="manager-list col-lg-2 col-md-2">
	                    <div class="mb-3">
	                        <button class="state-btn btn"><a href="../event/event/list">이벤트 배너 수정</a></button>
	                    </div>
	                    <div class="mb-3">
	                        <button class="state-btn btn"><a href="./memberList">회원정보 관리</a></button>
	                    </div>
	                    <div>
	                        <button class="state-btn btn"><a href="./add">관리자 추가</a></button>
	                    </div>
	                </div>
                </div> -->
                
                
                <div class="col-lg-9 col-md-9 mt-5">
              
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
                    
                    <div id="productAddList"></div>
                    <div id="inquiryList" class="mt-5"></div>

               
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
    
    
    
    

	

	<!-- <h3>관리자 페이지 입니다.</h3>
	<a href="./add" class="btn btn-primary">관리자 추가하기</a>
	<a href="./memberList" class="btn btn-primary">멤버 리스트 보기</a> -->
	
	<script src="/resources/js/admin/list.js"></script>
	<c:import url="../template/footer.jsp"></c:import>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>