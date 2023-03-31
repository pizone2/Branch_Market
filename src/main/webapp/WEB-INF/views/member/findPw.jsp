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
                        <div class="banner-text"><h2>PW 찾기</h2></div>
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
                <h4 class="join__title mx-auto">PW 찾기</h4>
                </div>
                    <h3>&nbsp;</h3>
                    <form action="./findPw" method="post">
                    <div class="row" id="check_row">                       
                        <div class="col-lg-7 col-md-6 mx-auto">                           
                            <div class="checkout__input">
                                <p style="text-align: center;">가입시 기재한 ID 와 이메일을 입력해주세요.<span>*</span></p>
                                <div>
                                    <h3>&nbsp;</h3>
                                </div>  
                                <input type="text" name="memberId" id="" placeholder="ID" class="checkout__input__add">                                
                                <div>
                                    <h3>&nbsp;</h3>
                                </div>  
                                <input type="email" name="memberEmail" id="" placeholder="Email" class="checkout__input__add">                                
                            </div>  
                            <div>
                                <h3>&nbsp;</h3>
                            </div>                                                                                                                                                                            
                            <div class="information col-lg-6 mx-auto">
                                전송시 입력한 Email로  PW가 발송됩니다.
                            </div>                            
                                <h3>&nbsp;</h3>
                                <div class="d-flex justify-content-center">
                                    <button type="submit" class="site-btn mr-4">전송</button>                                                                                             
                                    </div>                                                                                                                              
                            </div> 
                    </div>
                    </form></div>                                    
            </div>        
    </section>

  <!--   <form action="./findPw" method="post">
        이메일로 임시 비밀번호 보냅니다<br>
        가입한 아이디 입력<input type="text" name="memberId" id="">
        가입한 이메일 입력<input type="email" name="memberEmail" id="">
        <input type="submit" value="비밀번호 찾기">
    </form> -->
    
    
	<script src="/resources/js/member/add.js"></script>
     <c:import url="../template/footer.jsp"></c:import>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>