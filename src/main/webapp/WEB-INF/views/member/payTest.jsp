<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <c:import url="../template/common_css.jsp"></c:import>
            <!-- iamport.payment.js -->
            <!-- <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script> -->
            <script src="https://cdn.iamport.kr/v1/iamport.js"></script>


        </head>

        <body>
            <button id="importBtn" onclick="requestPay()">결제하기</button>


            <script>

                var IMP = window.IMP;
                IMP.init("imp77318106");

                var today = new Date();
                var hours = today.getHours(); // 시
                var minutes = today.getMinutes();  // 분
                var seconds = today.getSeconds();  // 초
                var milliseconds = today.getMilliseconds();
                var makeMerchantUid = hours + minutes + seconds + milliseconds;
                var merchant_uid = "IMP" + makeMerchantUid;


                function requestPay() {
                IMP.request_pay({
                    pg : 'kakaopay',
                    pay_method : 'card',
                    merchant_uid: merchant_uid,
                    name : '당근123',
                    amount : 10,

                    buyer_email : 'Iamport@chai.finance',
                    buyer_name : '아임포트 기술지원팀',
                    buyer_tel : '010-1234-5678',
                    buyer_addr : '서울특별시 강남구 삼성동',
                    buyer_postcode : '123-456'
                },
                    function (rsp) {
                        console.log(rsp);
                        if (rsp.success) {
                            // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
                            // jQuery로 HTTP 요청
                            jQuery.ajax({
                                url: "{서버의 결제 정보를 받는 가맹점 endpoint}",
                                method: "POST",
                                headers: { "Content-Type": "application/json" },
                                data: {
                                imp_uid: rsp.imp_uid,            // 결제 고유번호
                                merchant_uid: rsp.merchant_uid   // 주문번호
                                }
                        })
                        .done(function (data) {
                            // 가맹점 서버 결제 API 성공시 로직
                        })
                        } else {
                        alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
                        }
                    });
                }

            </script>

            <c:import url="../template/common_js.jsp"></c:import>
        </body>

        </html>