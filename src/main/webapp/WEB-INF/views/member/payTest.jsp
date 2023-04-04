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

                // 사전검사
                $.ajax({
                    url: "./startPay",
                    method: "get",
                    headers: { "Content-Type": "application/json" },
                    data: {
                        merchant_uid: merchant_uid, // 가맹점 주문번호
                        amount: 10, // 결제 예정금액
                    },
                    success: (res) => {
                        console.log(res);
                    }
                })

                // IMP.request_pay({
                //     pg: 'kakaopay',
                //     pay_method: 'card',
                //     merchant_uid: merchant_uid, // 상점에서 관리하는 주문 번호
                //     name: '주문명:결제테스트',
                //     amount: 10,
                //     buyer_email: 'iamport@siot.do',
                //     buyer_name: '구매자이름',
                //     buyer_tel: '010-1234-5678',
                //     buyer_addr: '서울특별시 강남구 삼성동',
                //     buyer_postcode: '123-456'
                // }, function (rsp) {
                //     console.log(rsp);
                //     if (rsp.success) {
                //         //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                //         jQuery.ajax({
                //             url: "/member/payComplete", //cross-domain error가 발생하지 않도록 주의해주세요
                //             type: 'get',
                //             // dataType: 'json',
                //             data: {
                //                 imp_uid: rsp.imp_uid
                //                 //기타 필요한 데이터가 있으면 추가 전달
                //             }
                //         }).done(function (data) {
                //             // html 이 넘어옴
                //             console.log(data);
                //             //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                //             if (everythings_fine) {
                //                 var msg = '결제가 완료되었습니다.';
                //                 msg += '\n고유ID : ' + rsp.imp_uid;
                //                 msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                //                 msg += '\결제 금액 : ' + rsp.paid_amount;
                //                 msg += '카드 승인번호 : ' + rsp.apply_num;

                //                 alert(msg);
                //             } else {
                //                 //[3] 아직 제대로 결제가 되지 않았습니다.
                //                 //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                //             }
                //         });
                //     } else {
                //         var msg = '결제에 실패하였습니다.';
                //         msg += '에러내용 : ' + rsp.error_msg;

                //         alert(msg);
                //     }
                // });

        function requestPay() {
            IMP.request_pay({
                pg : 'kcp',
                pay_method : 'card',
                merchant_uid: merchant_uid,
                name : '당근 10kg',
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