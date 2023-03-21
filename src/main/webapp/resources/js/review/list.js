$('.page-link').click((e)=>{
    let pageNum = $(e.target).attr('data-page');
    $('#page').val(pageNum);
    $('#paginingForm').submit();
})
$('.del').click((e)=>{
    let reviewNum = $(e.target).attr('data-reviewNum');
    let isGo = confirm('정말 삭제 하시겠습니까?');
    console.log(isGo);
    if(isGo == true){
        $.ajax({
            url:'./delete',
            type:'post',
            data:{
                'reviewNum':reviewNum
            },
            success:(response)=>{
                response = response.trim();
                if(response == 'true'){
                    alert('삭제가 완료 되었습니다!');
                }else{
                    alert('삭제 실패!')
                }
                location.href = "/";
            }
        })
    }
})