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
                        <div class="banner-text"><h2>비밀번호 수정</h2></div>
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
            <h4 class="join__title mx-auto">비밀번호 수정</h4>
            </div>
            <h3>&nbsp;</h3>
            <form action="./updatePw" method="post" id="updateForm">
                <div class="row" id="check_row">                       
                    <div class="col-lg-7 col-md-6 mx-auto">                           
                       
                        <div class="checkout__input">
                            <!-- <p>PW<span>*</span></p> -->
                            <input type="password" name="memberPw" placeholder="현재 비밀번호를 입력해주세요." class="checkout__input__add">                                
                        </div>                                                                                                                                              
                        <div class="checkout__input">
                            <!-- <p>PW<span>*</span></p> -->
                            <input type="password" name="changeMemberPw" id="changeMemberPw" placeholder="변경 할 비밀번호를 입력해주세요.(10~20자리)" class="checkout__input__add">                                
                        </div>                                                                                                                                              
                        <div id = "changeMemberPwMsg"></div>                             
                        <div class="checkout__input">
                            <!-- <p>ADDRESS<span>*</span></p> -->
                            <input  type="password" name="checkMemberPw" id="checkMemberPw" placeholder="변경 할 비밀번호를 확인." class="checkout__input__add">
                            <div id = "checkMemberPwMsg"></div>
                            <button type="submit" class="site-btn mt-5" id="btn">변경하기</button>                                                     
                        </div>                                                                            
                    </div>
                </div>                    
            </form>
        </div>
    </div>
</section>







<!-- 
 //이벤트 아이디 바꾸기
    <form action="./updatePw" method="post" id="updateForm">
        현재 비밀번호 입력<input type="password" name="memberPw">
        변경 할 비밀번호 입력<input type="password" name="changeMemberPw" id="changeMemberPw" placeholder="10 ~ 20 자리로 입력 해 주세요">
        <div id = "changeMemberPwMsg"></div>
        변경 할 비밀번호 확인<input type="password" name="checkMemberPw" id="checkMemberPw">
        <div id = "checkMemberPwMsg"></div>
        <input type="submit" value="변경하기" id="btn">
    </form> -->
	
	<script src="/resources/js/member/add.js"></script>
     <c:import url="../template/footer.jsp"></c:import>
    <script src="/resources/js/member/updatePw.js"></script>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>