<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Home</title>
	<c:import url="./template/common_css.jsp"></c:import>
	<link href="https://fonts.googleapis.com/css?family=Roboto|Oswald:300,400" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/resources/css/home.css">

</head>
<body>
	<c:import url="./template/header.jsp"></c:import>
       
	 <!-- Banner Section Begin -->
	 <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <hr>
                </div>
                <div class="col-lg-12 text-center">
                    <div class="background-page">
                        <div class="banner-text"><h2>Branch Market</h2></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->


	<section class="hero">
        <div class="container">
            <div class="row d-flex">
				
				<!--최근 공지사항-->
            	<div class="col-md-6 my-5">
            		<ul class="list-group">
					  <li class="list-group-item"><h4 class="pt-4">공지사항</h4></li>
                       <c:forEach items="${noticeTopDTOs}" var="dto">
	                       	<li class="list-group-item border-top">
	                            <p><a href="/notice/detail?noticeNum=${dto.noticeNum}" class="m-b-0 font-medium p-0" data-abc="true">제목: ${dto.noticeTitle }</a></p>
	                            <div>${dto.noticeContents}</div>
	                       	</li>
                       </c:forEach>
					</ul> 
            	</div>
				<!--최근 공지사항 end-->

				<!--event slide-->
                
				<div class="col-md-6">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">

						<ol class="carousel-indicators">
							<c:forEach items="${eventDTOs}" var="dto" varStatus="i">
								<li data-target="#myCarousel" data-slide-to="${i.count}" class="${i.first ? 'active':''}"></li>
							</c:forEach>
						</ol>   

						<div class="carousel-inner">
							<c:forEach items="${eventDTOs}" var="dto" varStatus="i">
							  <div class="item ${i.count eq 1 ? 'active': '' }">
								<img alt="" src="/resources/upload/event/${dto.fileName}">
							  </div>
							</c:forEach>
						</div>
						<!-- Carousel controls -->
						<a class="carousel-control left" href="#myCarousel" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a class="carousel-control right" href="#myCarousel" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
				</div>
		
				<!--event slide end-->

    		</div>
  		  </div>
    </section>
    
	<!-- product -->
	 <h1 class="home-main-title text-center home-hot-title">
        위탁판매 인기 게시글
    </h1>

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                
                	<c:forEach items="${productDTOs}" var="dto">
                		<div class="col-lg-10">
                        	<div class="categories__item set-bg" data-setbg="${dto.productImgName }">
                           		 <h5><a href="/product/detail?productNum=${dto.productNum}">${dto.productCategory}</a></h5>
	                        </div>
	                    </div>
                	</c:forEach>
                </div>
            </div>
        </div>
    </section>
	<!-- product end -->

	
    <c:import url="./template/footer.jsp"></c:import>
	<c:import url="./template/common_js.jsp"></c:import>
</body>
</html>
