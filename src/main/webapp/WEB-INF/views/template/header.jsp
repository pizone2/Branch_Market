<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
    <div class="humberger__menu__logo">
        <a href="./home.jsp"><img src="/resources/images/exLogo.png" alt=""></a>
    </div>
    <div class="humberger__menu__cart">
        <ul>
            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
        </ul>
        <div class="header__cart__price">item: <span>$150.00</span></div>
    </div>
    <div class="humberger__menu__widget">
        <div class="header__top__right__language">
            <img src="/resources/images/language.png" alt="">
            <div>English</div>
            <span class="arrow_carrot-down"></span>
            <ul>
                <li><a href="#">Spanis</a></li>
                <li><a href="#">English</a></li>
            </ul>
        </div>
        <div class="header__top__right__auth">
            <a href="#"><i class="fa fa-user"></i> Login</a>
        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <li><a href="/board/list">중고 게시판</a></li>
            <li><a href="/product/detail">위탁 판매</a></li>
            <li><a href="/inquiry/list">문의사항</a></li>
            <li><a href="/notice/list">공지사항</a></li>
            <li><a href="#">마켓 정보</a></li>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="header__top__right__social">
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-pinterest-p"></i></a>
    </div>
    <div class="humberger__menu__contact">
        <ul>
            <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
            <li>Free Shipping for all Order of $99</li>
        </ul>
    </div>
</div>
<!-- Humberger End -->

<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="header__top__left">
                        <ul style="font-weight: 600;">
                        	<c:if test="${not empty member}">
                        		<i style='font-size:24px;' class='fas mx-2'>&#xf56b;</i>${member.memberId}님 환영합니다
                        	</c:if>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="header__top__right">
                        <div class="header__top__right__auth">
                        	<c:if test="${not empty member}">
                        		<a href="/member/logout"><i class="fa fa-user"></i>logout</a>
                        	</c:if>
                            <c:if test="${empty member}">
                        		<a href="/member/login"><i class="fa fa-user"></i>Login</a>
                        	</c:if>
                        </div>
                        <div class="header__top__right__auth mx-3">
	                        <c:if test="${not empty member}">
	                        	 <a href="/notify/list"><i class="fa fa-bell" aria-hidden="true"></i>Notify</a>
	                        </c:if>
	                        <c:if test="${empty member}">
                            	<a href="/member/addAgree"><i class="fa fa-user"></i>Join</a>
                            </c:if>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
                <div class="header__logo">
                    <a href="/"><img src="/resources/images/exLogo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-8">
                <nav class="header__menu">
                    <ul>
                        <li><a href="/board/list">중고 거래</a></li>
                        <li><a href="/product/list">위탁 판매</a></li>
                        <li><a href="/notice/list">공지사항</a></li>
                        <c:if test="${not empty member}">
                       	  <c:if test="${member.memberRole eq 'member'}">
                       	  	 <li><a href="/inquiry/add">문의하기</a></li>
                      	  </c:if>
                      	  
                      	  <li><a href="/member/myPage?memberId=${member.memberId}">마이페이지</a></li>
                      	  
                      	  <c:if test="${member.memberRole eq 'admin'}">
                      	 	 <li><a href="/admin/home">관리자페이지</a></li>
                      	  </c:if>
                        </c:if>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-2">
            		<c:if test="${not empty member}">
	                    <div class="header__cart" style="padding-left: 0px;">
	                        <ul>
	                            <li><a href="/chat/myRoomList"><i class="fa fa-commenting"></i> <span id="totalUnreadMessage" class="mx-1"></span></a></li>
	                            <li><a href="/board/picList"><i class="fa fa-heart"></i> <span id="myBoardPicTotalCount" class="mx-1">1</span></a></li>
	                            <li><a href="/product/picList"><i class="fa fa-shopping-cart"></i> <span id="myProductPicCount" class="mx-1">3</span></a></li>
	                        </ul>
	                    </div>
                    </c:if>
                </div>
            </div>
        </div>


    </div>
</header>
<script src="/resources/js/template/header.js"></script>
<!-- Header Section End -->

