$('.del').click(function(){
    let notifyNum = $(this).attr('data-notifyNum');
    $.ajax({
        type:'post',
        url:'./delete',
        data:{
            'notifyNum':notifyNum
        },
        success:(res)=>{
            console.log(res);
        }
    })
    location.reload();
})