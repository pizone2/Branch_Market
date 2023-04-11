let check = [0,0,0,0,0,0];

$('#memberId').blur(()=>{
    $.ajax({
        async:false,
        url:"/member/checkMemberUnique",
        type:"GET",
        data:{
            "memberId":$('#memberId').val()
        },
        success:(response)=>{
            response = response.trim();
            if(response == 'true'){
                $('#idMsg').html('좋은 아이디네요!')
                check[0] = 1;
            }else{
                $('#idMsg').html('아이디가 중복 되었습니다')
                check[0] = 0;
            }
        }
    })

    if($('#memberId').val() == ''){
        $('#idMsg').html('값을 넣어주세요.')
    }
})

$('#memberPw').blur(()=>{
    let pwLength = $('#memberPw').val().length;
    if(10 <= pwLength && pwLength <= 20){
        $('#pwMsg').html('');
        check[1] = 1;
    }else{
        $('#pwMsg').html('10 ~ 20 자리로 입력 해주세요!');
        check[1] = 0;
    }
})

$('#checkMemberPw').blur(()=>{
    if($('#memberPw').val() == $('#checkMemberPw').val()){
        $('#checkPwMsg').html('');
        check[2] = 1;
    }else{
        $('#checkPwMsg').html('비밀번호가 다릅니다');
        check[2] = 0;
    }
})

$('#memberEmail').blur(()=>{
    if($('#memberEmail').val().length != 0){
        $('#emailMsg').html('');
        check[3] = 1;
    }else{
        $('#emailMsg').html('이메일을 입력 해 주세요')
        check[3] = 0;
    }
})

$('#memberPhone').blur(()=>{
    if($('#memberPhone').val().length != 0){
        $('#phoneMsg').html('');
        check[4] = 1;
    }else{
        $('#phoneMsg').html('전화번호를 입력 해 주세요')
        check[4] = 0;
    }
})

$('#memberAddress').blur(()=>{
    if($('#memberAddress').val().length != 0){
        $('#addressMsg').html('');
        check[5] = 1;
    }else{
        $('#addressMsg').html('주소를 입력 해 주세요')
        check[5] = 0;
    }
})

$('#submit1').click(()=>{
    if(check.includes(0)){
        $('#memberId').trigger('blur');
        $('#memberPw').trigger('blur');
        $('#checkMemberPw').trigger('blur');
        $('#memberEmail').trigger('blur');
        $('#memberPhone').trigger('blur');
        $('#memberAddress').trigger('blur');
    }else{
        $('#addForm').submit();
    }
})

$('#searchFormBtn').click(()=>{
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            console.log(data.address);
            $('#memberAddress').val(data.address);
        }
    }).open();
})


$('#adminSearchFormBtn').click(function(){
	console.log("admin")
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            var roadAddr = data.roadAddress;
            console.log(roadAddr)
            //document.getElementById("sample4_extraAddress").innerHTML = roadAddr;
            $('#adminAddress').val(data.address);
        }
    }).open();
})



