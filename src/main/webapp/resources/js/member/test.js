// ------------------- 카카오 결제

// $.ajax({
//     url:'/kakaoPay/ready',
//     type:'post',
//     success:(response)=>{
//         response = response.trim();
//         response = JSON.parse(response);
//         console.log(response);
//         console.log('jojo');
//     }
// })
// -----------------------------

// let adminKey = '';
// let tid = '';
// let partner_order_id = '가맹점 주문번호';
// let partner_user_id = '회원 아이디';

// $('#buyBtn').click(()=>{
//     $.ajax({
//         url:'https://kapi.kakao.com/v1/payment/ready',
//         type:'post',
//         headers:{
//             'Authorization':'KakaoAK ' + adminKey,
//             'Content-type':'application/x-www-form-urlencoded;charset=utf-8'
//         },
//         data:{
//             'cid':'TC0ONETIME',
//             'partner_order_id':partner_order_id,
//             'partner_user_id':partner_user_id,
//             'item_name':'테스트 상품명', // 상품명
//             'quantity':2, //상품수량
//             'total_amount':100, //상품총액
//             'tax_free_amount':10, //비과세 금액
//             'approval_url':'http://localhost/member/test', // 사용자가 결제 승인 했을때 url?pg_token=??? 으로 redirect 요청할 url
//             'cancel_url':'http://localhost/member/test',
//             'fail_url':'http://localhost/member/test'
//         },
//         success:(response)=>{
//             console.log(response);
//             // tid(결제 고유번호) 저장
//             tid = response.tid;
//             // pc 모바일 체크, 조건 더 추가 해야함..
//             let isMobile = /Mobi/i.test(window.navigator.userAgent);
//             if(isMobile == false){
//                 location.href = response.next_redirect_pc_url
//             }else{
//                 location.href = response.next_redirect_mobile_url
//             }
//         }
//     })   
// })
// // ----------- 카카오 결제 사용자가 승인 눌렀을때
// let params = new URL(location.href).searchParams;
// let pg_token = params.get('pg_token');
// if(pg_token != null){
//     $.ajax({
//         url:'https://kapi.kakao.com/v1/payment/approve',
//         type:'post',
//         data:{
//             'cid':'TC0ONETIME',
//             'tid':tid,
//             'partner_order_id':partner_order_id,
//             'partner_user_id':partner_user_id,
//             'pg_token':pg_token
//         },
//         headers:{
//             'Authorization':'KakaoAK ' + adminKey,
//             'Content-type':'application/x-www-form-urlencoded;charset=utf-8'
//         },
//         success:(response)=>{
//             console.log(response);
//         }
//     })
// }



// ------------------------ 네이버 데이터 넣기
let searchList = ['여성패션','남성패션','가구/인테리어','생활/주방','가전제품','전자기기(디지털,컴퓨터)','E쿠폰/티켓']
let productQ = ['아주 좋음','좋음','보통','나쁨','매우 나쁨'];
let cnt = 0;

for(let search of searchList){
    $.ajax({
        type:"GET",
        url:"/member/getNaverData?search=" + search,
        success:(response)=>{
            response = JSON.parse(response);
            $(response.items).each((index,item)=>{
                item.title = item.title.replace(/<[^>]*>?/g, '');
                $.ajax({
                    async:false,
                    url:"/product/insertNaverData",
                    type:'post',
                    data:{
                        'memberId':'admin',
                        'productTitle':item.title,
                        'productPrice':item.lprice,
                        'productDetail':item.title + " 상품 입니다 많은 구매 바랍니다",
                        'productQ':productQ[Math.floor(Math.random() * productQ.length)],
                        'productCategory':search,
                        'productImgName':item.image
                    },
                    success:(response)=>{
                        console.log(response);
                    }
                })
            })

        }
    })
}


//------------------------------------------------------------------------------------

// // 인가코드 받기 --------------------------------
// Kakao.init('8a7051837bf4ec9e76d7f86597cbca09'); // jk
// function loginWithKakao() {
//     Kakao.Auth.authorize({
//         redirectUri: 'http://localhost/member/test',
//     })
// }

// // 토큰 받기 --------------------------------
// const urlParams = new URL(location.href).searchParams;
// const code = urlParams.get('code');
// if(code != null){
//     $.ajax({
//         url:'https://kauth.kakao.com/oauth/token',
//         type:'POST',
//         data:{
//             'grant_type':'authorization_code',
//             'client_id':'eddbc5ef2ee1d292eb4abdeded74c44b', // rk
//             'redirect_uri':'http://localhost/member/test',
//             'code':code
//         },
//         beforSend:(xhr)=>{
//             xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded;charset=utf-8')
//         },
//         success:(response)=>{
//             let access_token = response.access_token;
//             Kakao.Auth.setAccessToken(access_token);
//             Kakao.API.request({
//                 url: '/v2/user/me'
//               })
//             .then(function(response) {
//                 console.log(response);
//                 console.log("name : " + response.properties.nickname)
//             })
//             .catch(function(error) {
//                 console.log(error);
//             });
//         },
//         error:(response)=>{
//             console.log(response);
//         }
//     })
// }

// Kakao.Auth.logout()
//   .then(function(response) {
//     console.log(Kakao.Auth.getAccessToken()); // null
//   })
//   .catch(function(error) {
//     console.log('Not logged in.');
//   });

// $.ajax({
//     url:'/member/postTest',
//     type:'get',
//     success:(response)=>{
//         console.log(response);
//     }
// })

