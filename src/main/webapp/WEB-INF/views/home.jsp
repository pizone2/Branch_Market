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
       
	


	<section class="hero">
        <div class="container">
            <div class="row d-flex">
				
				<!--최근 공지사항-->
            	<%-- <div class="col-md-6 my-5 ">
            	
            		<div class="card border-light mb-3">
					  <div class="card-header" style="font-size: 20px;background-color: rgb(203, 233, 209);font-weight: bold;">공지사항</div>
					  <div class="card-body">
						  <c:forEach items="${noticeTopDTOs}" var="dto">
		                       	 <h5 class="card-title"><a href="/notice/detail?noticeNum=${dto.noticeNum}" class="m-b-0 font-medium p-0" data-abc="true">제목: ${dto.noticeTitle }</a></h5>
		                         <p class="card-text">${dto.noticeContents}</p>
		                         <hr>
	                       </c:forEach>
					  </div>
					</div>
            	</div> --%>
				<!--최근 공지사항 end-->

				<!--event slide-->
                
				<div class="col-md-12">
				<hr>
					<div id="myCarousel" class="carousel slide" data-ride="carousel">

						<ol class="carousel-indicators">
							<c:forEach items="${eventDTOs}" var="dto" varStatus="i">
								<li data-target="#myCarousel" data-slide-to="${i.count}" class="${i.first ? 'active':''}"></li>
							</c:forEach>
						</ol>   

						<div class="carousel-inner">
							<c:forEach items="${eventDTOs}" var="dto" varStatus="i">
							  <div class="item ${i.count eq 1 ? 'active': '' }" style="background-color:azure">
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
    
    <c:if test="${not empty productDTOs }">
		<!-- product -->
		<section class="hero">
        <div class="container">
            <div class="row d-flex ">
				 <h1 class="home-main-title text-center home-hot-title my-5 col-lg-12" style="font-weight: bold">
			        위탁판매 인기 게시글
			    </h1>
		    </div>
	    	<div class="row">
	   			<hr class="border border-success border-2 opacity-50 col-md-2 mx-auto">
   			</div>
	    </div>
	    </section>
	
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
	</c:if>
	
	<c:if test="${not empty boardSellTopDTOs or not empty boardBuyTopDTOs }">
		
		<section class="hero">
		       <div class="container">
		            <div class="row d-flex mt-4">
						<h1 class="home-main-title text-center home-hot-title my-5 col-lg-12" style="font-weight: bold">
					        중고거래 인기 게시글
					    </h1>
			   		</div>
			   		<div class="row">
			   			<hr class="border border-success border-2 opacity-50 col-md-2 mx-auto">
		   			</div>
		    	</div>
	    </section>
	
	    <div class="container">
	        <div class="wrapper">
	        <h1></h1>
	        </div>
	    </div>
	
	    <section class="hero">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-6"> <!--판매-->
	                    <div class="row d-flex justify-content-center mt-100 mb-100">
	                        
	                                
	                    <div class="col-lg-12">
	                        
	                        <div class="card">
	                            <div class="card-body text-center" style="background-image: url('/resources/images/mainTableTitle.png')">
	                                <h4 class="card-title m-b-0" style="font-weight: bold;">판매</h4>
	                            </div>
	                            <ul class="list-style-none" style="background-image: url('/resources/images/leaves.png');width: 100%">
	                       		    <c:forEach items="${boardSellTopDTOs}" var="dto">
		                                <li class="d-flex no-block card-body border-top">
		                                    <i class="fa fa-gift w-30px m-t-5"></i>
		                                    <div>
		                                        <a href="/board/detail?boardNum=${dto.boardNum}" class="m-b-0 font-medium p-0" data-abc="true">${dto.boardTitle}</a>
		                                        <span class="text-muted">${dto.boardContents}</span>
		                                    </div>
		                                    <div class="ml-auto">
		                                        <div class="tetx-right">
		                                            <h5 class="text-muted m-b-0">${dto.boardDate}</h5>
		                                        </div>
		                                    </div>
		                                </li>
		                            </c:forEach>
	                            </ul>
	                        </div>
	
	                    </div>
	                    </div>
	                </div>
	                
	                <div class="col-lg-6"> <!--구매-->
	                    <div class="row d-flex justify-content-center mt-100 mb-100">
	                        
	                                
	                    <div class="col-lg-12">
	                        
	                        <div class="card">
	                            <div class="card-body text-center" style="background-image: url('/resources/images/mainTableTitle.png')">
	                                <h4 class="card-title m-b-0" style="font-weight: bold;">구매</h4>
	                            </div>
	                            <ul class="list-style-none" style="background-image: url('/resources/images/leaves.png');width: 100%">
	                       		    <c:forEach items="${boardBuyTopDTOs}" var="dto">
		                                <li class="d-flex no-block card-body border-top">
		                                    <i class="fa fa-gift w-30px m-t-5"></i>
		                                    <div>
		                                        <a href="/board/detail?boardNum=${dto.boardNum}" class="m-b-0 font-medium p-0" data-abc="true">${dto.boardTitle}</a>
		                                        <span class="text-muted">${dto.boardContents}</span>
		                                    </div>
		                                    <div class="ml-auto">
		                                        <div class="tetx-right">
		                                            <h5 class="text-muted m-b-0">${dto.boardDate}</h5>
		                                        </div>
		                                    </div>
		                                </li>
		                            </c:forEach>
	                            </ul>
	                        </div>
	
	                    </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	    <!-- Categories Section End -->
	</c:if>
    <c:import url="./template/footer.jsp"></c:import>
	<c:import url="./template/common_js.jsp"></c:import>
</body>
</html>
