$('.del').click((e)=>{
    let noticeNum = $(e.target).attr('data-noticeNum');
    let isGo = confirm('정말 삭제 하시겠습니까?');
    console.log(isGo);
    if(isGo == true){
        $.ajax({
            url:'./delete',
            type:'post',
            data:{
                'noticeNum':noticeNum
            },
            success:(response)=>{
                response = response.trim();
                if(response == 'true'){
                    alert('삭제가 완료 되었습니다!');
                }else{
                    alert('삭제 실패!')
                }
                location.href = "./list";
            }
        })
    }
})