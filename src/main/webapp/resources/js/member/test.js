
// ------------------------ 네이버 데이터 넣기
$('#getNaverDataBtn').click(()=>{
    let searchList = ['여성패션','남성패션','가구/인테리어','생활/주방','가전제품','전자기기(디지털,컴퓨터)','E쿠폰/티켓'];
    let productQ = ['아주 좋음','좋음','보통','나쁨','매우 나쁨'];
    let boardState = ['판매','구매'];

    for(let search of searchList){
        $.ajax({
            type:"GET",
            url:"/member/getNaverData?search=" + search,
            success:(response)=>{
                response = JSON.parse(response);
  
                $(response.items).each((index,item)=>{
                    item.title = item.title.replace(/<[^>]*>?/g, '');
                    if(item.title.length <= 40){
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
                    }
                })
                $(response.items).each((index,item)=>{
                    item.title = item.title.replace(/<[^>]*>?/g, '');
                    if(item.title.length <= 40){
                        $.ajax({
                            async:false,
                            url:"/board/add",
                            type:'post',
                            data:{
                                'memberId':'admin',
                                'boardTitle':item.title,
                                'boardPrice':item.lprice,
                                'boardContents':item.title + " 상품 입니다 많은 구매 바랍니다",
                                'boardState':boardState[Math.floor(Math.random() * boardState.length)],
                                'boardCategory':search
                            },
                            success:(response)=>{
                                console.log(1);
                            }
                        })
                    }
                })

            }
        })
    }

})
$('#buyBtn').click(()=>{
    $('#buyForm').submit();
})


//------------------------ 카카오 로그인

// // 인가코드 받기 --------------------------------
// Kakao.init(''); // jk
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
//             'client_id':'', // rk
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

