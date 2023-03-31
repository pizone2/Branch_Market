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

<section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <hr>
                </div>
                <div class="col-lg-12 text-center">
                    <div class="background-page">
                        <div class="banner-text"><h2>로그인</h2></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="checkout spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
        <div class="checkout__form">
            <div class="row">
            <h4 class="join__title mx-auto">로그인</h4>
            </div>
            <h3>&nbsp;</h3>
            <form action="./login" method="post">
                <div class="row" id="check_row">                       
                    <div class="col-lg-7 col-md-6 mx-auto">                           
                        <div class="checkout__input">
                            <!-- <p>ID<span>*</span></p> -->
                            <input type="text" name="memberId" id="memberId" value="${cookie.cookieMemberId.value}" placeholder="ID" class="checkout__input__add">                                
                        </div>                                                                          
                        <div class="checkout__input">
                            <!-- <p>PW<span>*</span></p> -->
                            <input type="password" name="memberPw" id="memberPw" placeholder="PW" class="checkout__input__add">
                            <div class="checkout__input__checkbox">
                                <label for="acc">                                    
                                            Remember ID?
                                    <input type="checkbox" name="cookieMemberId" value="cookieMemberId" id="acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div>                                                                           
                        <h3>&nbsp;</h3>
                            <button type="button" class="site-btn"><a href="./findId">ID 찾기</a></button>                                                     
                            <button type="button" class="site-btn"><a href="./findPw">PW 찾기</a></button>                                                     
                            <button type="submit" class="site-btn">로그인</button>                                                     
                        </div> 
                    </div>
                </div>                    
            </form>
        </div>
    </div>
</section>

    <%-- <form action="./login" method="post">
        아이디 <input type="text" name="memberId" id="memberId" value="${cookie.cookieMemberId.value}">
        비밀번호 <input type="password" name="memberPw" id="memberPw" placeholder="10 ~ 20 자리로 입력 해주세요">
        아이디 저장<input type="checkbox" name="cookieMemberId" value="cookieMemberId" id="" checked>
        <input type="submit" value="로그인">
    </form> --%>
    
	<script src="/resources/js/member/add.js"></script>
     <c:import url="../template/footer.jsp"></c:import>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>