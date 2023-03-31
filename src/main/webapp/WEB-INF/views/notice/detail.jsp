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
    <title>Notice Detail</title>
<c:import url="../template/common_css.jsp"></c:import>
<link rel="stylesheet" href="/resources/css/notice/detail.css">
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div hidden id="datas" data-noticeNum = ${noticeDTO.noticeNum}></div>

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

    <!-- 표 시작  -->
    <section class="checkout spad">
        <div class="container">
            <div class="col-lg-12">
                <table class="table">
                    <caption>표 제목</caption>
                    <tr><th>No.</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>
                    <tr><td>1</td><td>${noticeDTO.noticeTitle}</td><td>${noticeDTO.memberId}</td><td>${noticeDTO.noticeDate}</td><td>${noticeDTO.noticeHit}</td></tr>        
                </table> 
					${noticeDTO.noticeContents}
					<table class="table border-top-0">
						<caption>표 제목</caption>
						<tr><th>이전글</th><td>이미 위탁한 상품의 가격을 변경가능한가요?</td> </tr>
						<tr><th>다음글</th><td>위탁판매 배송기간은 보통 어떻게 되죠?</td></tr>
						<br>
                </table> 
                <br><br>
                <div class="list">
                    <!--권한을 가지고 있는 사람만 보임 -->
                    <button class="btn btn-info"><a href="./notice-update.html"></a> 수정 </button>
                    <button class="btn btn-danger"><a href="#"></a> 삭제 </button>
                    <!--모든 사람에게 보임 -->
                    <button class="btn btn-success"><a href="./notice-list.html"></a>목록으로</button>
                </div>
            </div>
        </div>
    </section>

  
	<c:import url="../template/footer.jsp"></c:import>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>