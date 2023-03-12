$.ajax({
    type:"GET",
    url:"/member/getNaverData",
    success:(response)=>{
    	console.log(response);
     //   response = JSON.parse(response);
        console.log(response.items);
        for(let item of response.items){
            console.log(item);
        }
    }
})

//------------------------------------------------------------------------------------

// 인가코드 받기 --------------------------------
Kakao.init('8a7051837bf4ec9e76d7f86597cbca09'); // jk
function loginWithKakao() {
    Kakao.Auth.authorize({
        redirectUri: 'http://localhost/member/test',
    }).then(()=>{

    })
}
// 토큰 받기 --------------------------------
const urlParams = new URL(location.href).searchParams;
const code = urlParams.get('code');
if(code != null){
    $.ajax({
        url:'https://kauth.kakao.com/oauth/token',
        type:'POST',
        data:{
            'grant_type':'authorization_code',
            'client_id':'eddbc5ef2ee1d292eb4abdeded74c44b', // rk
            'redirect_uri':'http://localhost/member/test',
            'code':code
        },
        beforSend:(xhr)=>{
            xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded;charset=utf-8')
        },
        success:(response)=>{
            let access_token = response.access_token;
            // console.log(response);
            // console.log(access_token);
            Kakao.Auth.setAccessToken(access_token);
            Kakao.API.request({
                url: '/v2/user/me'
              })
            .then(function(response) {
                console.log(response);
                console.log("name : " + response.properties.nickname)
            })
            .catch(function(error) {
                console.log(error);
            });
        },
        error:(response)=>{
            console.log(response);
        }
    })
}


// Kakao.Auth.logout()
//   .then(function(response) {
//     console.log(Kakao.Auth.getAccessToken()); // null
//   })
//   .catch(function(error) {
//     console.log('Not logged in.');
//   });


//   function getCookie(name) {
//     var parts = document.cookie.split(name + '=');
//     if (parts.length === 2) { return parts[1].split(';')[0]; }
//   }