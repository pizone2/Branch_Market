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
                        <div class="banner-text"><h2>약관동의 하기</h2></div>
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
                <h4 class="join__title mx-auto">약관동의 하기</h4>
                </div>
                    <h3>&nbsp;</h3>
                    <div class="row" id="check_row">                       
                        <div class="col-lg-7 col-md-6 mx-auto">                           
                            <div class="checkout__input">
                                 제 1조 (목 적)
       							 이 서비스 이용약관(이하 “약관”이라 합니다)은 가지마켓㈜(이하 “회사”라 합니다)
                                <div>
                                    <h3>&nbsp;</h3>
                                </div>
                                  동의합니다<input class="form-check-input" type="checkbox" value="" id="check1">
                                <div>
                                    <h3>&nbsp;</h3>
                                </div>  
                                제 2 조 (용어의 정의)
       							이 약관에서 사용하는 용어의 정의는 다음 각호와 같으며, 정의되지 않은 용어에 대한 해석은 관계법령 및 서비스별 안내에서 정하는 바에 따릅니다.                          
                            	<div>
                                <h3>&nbsp;</h3>
                            	</div>                                                                                                                                                                            
                           		<div class="information col-lg-6 mx-auto">
                           	  	    동의합니다<input class="form-check-input" type="checkbox" value="" id="check2">
                          		</div>  
                            </div>  
                                                    
                            <h3>&nbsp;</h3>
                            <div class="d-flex justify-content-center">
                                  <button type="submit" class="site-btn mr-4"><a href="#"  id="submit">다음으로</a></button>                                                                                             
                            </div>                                                                                                                              
                            </div> 
                    </div>
                    </div>                                    
            </div>        
    </section>









   <!--  <div>
        제 1조 (목 적)
        이 서비스 이용약관(이하 “약관”이라 합니다)은 가지마켓㈜(이하 “회사”라 합니다)
    </div>
    동의합니다<input class="form-check-input" type="checkbox" value="" id="check1">
    <div>
        제 2 조 (용어의 정의)
        이 약관에서 사용하는 용어의 정의는 다음 각호와 같으며, 정의되지 않은 용어에 대한 해석은 관계법령 및 서비스별 안내에서 정하는 바에 따릅니다.
    </div>
    동의합니다<input class="form-check-input" type="checkbox" value="" id="check2">
    <div><a href="#" class="btn btn-primary" id="submit">다음으로</a></div>
 -->


	
     <c:import url="../template/footer.jsp"></c:import>
    <script src="/resources/js/member/addAgree.js"></script>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>