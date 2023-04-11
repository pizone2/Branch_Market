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
                        <div class="banner-text"><h2>관리자 추가</h2></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
        <div class="checkout__form">
            <div class="row">
            <h4 class="join__title mx-auto">관리자 추가</h4>
            </div>
            <h3>&nbsp;</h3>
            <form action="./add" method="post" id="addForm">
                <div class="row" id="check_row">                       
                    <div class="col-lg-7 col-md-6 mx-auto">                           
                        <div class="checkout__input">
                            <!-- <p>ID<span>*</span></p> -->
                            <input type="text" name="memberId" id="memberId" placeholder="ID" class="checkout__input__add">                                
                        </div>
                         <div id="idMsg"></div>
                        <div class="checkout__input">
                            <!-- <p>PW<span>*</span></p> -->
                            <input type="password" name="memberPw" id="memberPw" placeholder="PW" class="checkout__input__add">                                
                        </div>
                        <div id="pwMsg"></div>
                        <div class="checkout__input">
                            <!-- <p>PW CHECK<span>*</span></p> -->
                            <input type="password" id="checkMemberPw" placeholder="PW CHECK" class="checkout__input__add">                                
                        </div>
                        <div id="checkPwMsg"></div>                                                                                                                           
                        <div class="checkout__input">
                            <!-- <p>EMAIL<span>*</span></p> -->
                            <input type="email" name="memberEmail" id="memberEmail" placeholder="EMAIL" class="checkout__input__add">                                
                        </div>
                            <div id="emailMsg"></div>                                                   
                        <div class="checkout__input">
                            <!-- <p>PHONE<span>*</span></p> -->
                            <input type="tel" name="memberPhone" id="memberPhone" placeholder="PHONE" class="checkout__input__add">                                
                        </div>                                                   
                       <div class="checkout__input d-flex mx-auto" style="width: 620px;">
                            <!-- <p>ADDRESS<span>*</span></p> -->
                            <!-- <input type="text" name="memberAddress" id="memberAddress" placeholder="ADDRESS" class="checkout__input__add"> -->
                           <input type="text" name="memberAddress" id="adminAddress" placeholder="ADDRESS" class="checkout__input__add">
                            <button id="adminSearchFormBtn" class="col-3" style="border: 0px;" type="button">주소검색</button>
                        </div>                                                                            
                            <button type="submit" id="submit1" class="site-btn mt-4">가입</button>                                                     
                    </div>
                </div>                    
            </form>
        </div>
    </div>
</section>






	<!--  <form action="./add" method="post" id="addForm">
        아이디 <input type="text" name="memberId" id="memberId">
        <div id="idMsg"></div>
        비밀번호 <input type="password" name="memberPw" id="memberPw">
        <div id="pwMsg"></div>
        비밀번호 확인<input type="password" id="checkMemberPw">
        <div id="checkPwMsg"></div>
        이메일 <input type="email" name="memberEmail" id="memberEmail">
        <div id="emailMsg"></div>
        핸드폰번호 <input type="tel" name="memberPhone" id="memberPhone">
        <div id="phoneMsg"></div>
        주소 <input type="text" name="memberAddress" id="memberAddress">
        <div id="addressMsg"></div>

        <input type="submit" value="회원가입" id="submit1">
    </form> -->
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
    <c:import url="../template/footer.jsp"></c:import>
    <script src="/resources/js/member/add.js"></script>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>