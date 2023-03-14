let check = [0,0];

$('#changeMemberPw').blur(()=>{
    let len = $('#changeMemberPw').val().length;
    console.log(len);
    if(10 <= len && len <=20){
        check[0] = 1;
        $('#changeMemberPwMsg').html('');
    }else{
        check[0] = 0;
        $('#changeMemberPwMsg').html('10 ~ 20 자리로 입력 해 주세요');
    }
})

$('#checkMemberPw').blur(()=>{
    if( $('#changeMemberPw').val() ==  $('#checkMemberPw').val()){
        check[1] = 1;
        $('#checkMemberPwMsg').html('')
    }else{
        check[1] = 0;
        $('#checkMemberPwMsg').html('비밀번호가 다릅니다')
    }
})

$('#btn').click(()=>{
    if(check.includes(0)){
        $('#changeMemberPw').blur();
        $('#checkMemberPw').blur();
    }else{
        $('#updateForm').submit();
    }
})