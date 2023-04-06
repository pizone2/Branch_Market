const memberId = $('#mySellList').attr('data-memberId');

function getMySellList(page){
    $.ajax({
        url:'/product/mySellList',
        type:'get',
        data:{
            'page':page,
            'memberId':memberId
        },
        success:(res)=>{
            res = res.trim();
            $('#mySellList').html(res);
        }
    })
}
getMySellList(1)

$('#mySellList').on('click','.page-link',function(){
    let page = $(this).attr('data-page');
    getMySellList(page);
})

$('#hitUpdateBtn').click(function(){
        $.ajax({
            url:'/member/hitUpdate',
            type:'post',
            data:{
                'memberId':memberId
            },
            success:function(res){
                res = res.trim();
                console.log(res);
                if(res != '0'){
                    alert('인기도를 올렸습니다');
                }else{

                }
                location.href = "./myPage?memberId=" + memberId;
            }
        })
    }
)