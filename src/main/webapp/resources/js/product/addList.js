$('.addConfirmBtn').click(function(){
    let productNum = $(this).attr('data-productNum');
    console.log(confirm);
    let productQ = $('#productQ' + productNum).val();
    console.log(productQ);
    $.ajax({
        url:"./addConfirm",
        type:"post",
        data:({
            'productNum':productNum,
            'productQ':productQ
        }),
        success:(response)=>{
            response = response.trim();
            location.href ="./list";
        }

    })
});