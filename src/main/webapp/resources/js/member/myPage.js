function getMySellList(page){
    $.ajax({
        url:'/product/mySellList',
        type:'get',
        data:{
            'page':page
        },
        success:(res)=>{
            console.log(res);
            res = res.trim();
            $('#mySellList').html(res);
        }
    })
}
getMySellList(1)

$('#mySellList').on('click','.page-link',function(){
    let page = $(this).attr('data-page');
    console.log(this);
    console.log(page);
    getMySellList(page);
})