<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
<!-- <script src="https://cdn.iamport.kr/v1/iamport.js"></script> -->

</head>
<body>

<a id="kakao-login-btn" href="javascript:loginWithKakao()">
  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
    alt="카카오 로그인 버튼" />
</a>
<p id="token-result"></p>

<form action="/kakaoPay/ready" method="post" id="buyForm">
    <img src="/resources/images/payment_icon_yellow_small.png" alt=""  id="buyBtn">
</form>

<input type="button" value="네이버 데이터 가져오기" id="getNaverDataBtn">

<div id="testAjax"></div>



<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
    <script src="/resources/js/member/test.js"></script>
    <c:import url="../template/common_js.jsp"></c:import>


    

</body>
</html>