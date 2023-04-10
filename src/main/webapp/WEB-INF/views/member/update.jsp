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
                        <div class="banner-text"><h2>회원정보 수정</h2></div>
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
            <h4 class="join__title mx-auto">회원정보 수정</h4>
            </div>
            <h3>&nbsp;</h3>
            <form action="./update" method="post">
                <div class="row" id="check_row">                       
                    <div class="col-lg-7 col-md-6 mx-auto">                           
                        <div class="checkout__input">
                            <!-- <p>ID<span>*</span></p> -->
                            <input type="text" name="memberId" id="memberId" readonly="readonly" value="${memberDTO.memberId}" class="checkout__input__add">                                
                        </div>
                        <div class="checkout__input">
                            <!-- <p>EMAIL<span>*</span></p> -->
                            <input  type="email" name="memberEmail" id="memberEmail" value="${memberDTO.memberEmail}" placeholder="asd" class="checkout__input__add">                                
                        </div>                                                   
                        <div class="checkout__input">
                            <!-- <p>PHONE<span>*</span></p> -->
                            <input type="tel" name="memberPhone" id="memberPhone" value="${memberDTO.memberPhone}" class="checkout__input__add">                                
                        </div>                                                   
                        <div class="checkout__input">
                            <!-- <p>ADDRESS<span>*</span></p> -->
                            <input type="text" name="memberAddress" id="memberAddress" value="${memberDTO.memberAddress}" class="checkout__input__add">
                        </div>                                                                            
                        <div class="checkout__input">
                            <!-- <p>PW<span>*</span></p> -->
                            <input type="password" name="memberPw" id="memberPw" placeholder="PW" class="checkout__input__add">                                
                            <button type="submit" class="site-btn mt-5">수정하기</button>                                                     
                        </div>                                                                                                                                              
                    </div>
                </div>                    
            </form>
        </div>
    </div>
</section>


    <%-- <form action="./update" method="post">
        아이디 <input type="text" name="memberId" id="memberId" readonly="readonly" value="${memberDTO.memberId}">
        이메일 <input type="email" name="memberEmail" id="memberEmail" value="${memberDTO.memberEmail}">
        핸드폰번호 <input type="tel" name="memberPhone" id="memberPhone" value="${memberDTO.memberPhone}">
        주소 <input type="text" name="memberAddress" id="memberAddress" value="${memberDTO.memberAddress}">
        
        비밀번호 확인<input type="password" name="memberPw" id="memberPw" placeholder="10 ~ 20 자리로 입력 해주세요">
        <input type="submit" value="수정하기" class="btn btn-primary">
    </form> --%>
    
    
	<script src="/resources/js/member/add.js"></script>
     <c:import url="../template/footer.jsp"></c:import>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>