function getinquiryList(page,kind,search) {
    $.ajax({
        url:'/inquiry/list',
		type:'get',
		data:{
			'page':page,
			'kind':kind,
			'search':search
		},
        success:(response)=>{
            response = response.trim();
            $('#inquiryList').html(response);
        }
    })
}

function getproductAddList(page,kind,search,category) {
    $.ajax({
        url:'/product/addList',
		type:'get',
		data:{
			'page':page,
            'kind':kind,
            'search':search,
            'category':category
		},
        success:(response)=>{
            response = response.trim();
            $('#productAddList').html(response);
        }
    })
}

getinquiryList(1);
getproductAddList(1);

$('#productAddList').on('click','.page-link',function(){
    let page = $(this).attr('data-board-page');
    let kind = $('#productAddList').find('#kind').val();
    let search = $('#productAddList').find('#search').val();
    let category = $('#productAddList').find('#category').val();
    
    console.log(page)
    console.log(kind)
    console.log(search)
    console.log(category)    
    
    getproductAddList(page,kind,search,category)
    
})

$('#productAddList').on('click','.productSearchBtn',function(){
    let page = $(this).attr('data-board-page');
    let kind = $('#productAddList').find('#kind').val();
    let search = $('#productAddList').find('#search').val();
    let category = $('#productAddList').find('#category').val();

    getproductAddList(page,kind,search,category)

})

$('#inquiryList').on('click','.page-link',function(){
	let page = $(this).attr('data-page');
    let kind = $('#inquiryList').find('#kind').val();
    let search = $('#inquiryList').find('#search').val();
    
    console.log(page)
    console.log(kind)
    console.log(search)
    

    getinquiryList(page,kind,search);
})

$('#inquiryList').on('click','.inqSearchBtn',function(){
    let page = $(this).attr('data-page');
    let kind = $('#inquiryList').find('#kind').val();
    let search = $('#inquiryList').find('#search').val();

    getinquiryList(page,kind,search);
})

$('#productAddList').on('click','.addConfirmBtn',function(){
    let productNum = $(this).attr('data-productNum');
    console.log(confirm);
    let productQ = $('#productQ' + productNum).val();
    console.log(productQ);
    $.ajax({
        url:"../product/addConfirm",
        type:"post",
        data:({
            'productNum':productNum,
            'productQ':productQ
        }),
        success:(response)=>{
            response = response.trim();
            // location.href ="../product/list";
        
            let page = $(this).attr('data-board-page');
            let kind = $('#productAddList').find('#kind').val();
            let search = $('#productAddList').find('#search').val();
            let category = $('#productAddList').find('#category').val();
            
            console.log(page)
            console.log(kind)
            console.log(search)
            console.log(category)    
            
            getproductAddList(page,kind,search,category);
        
        
        
        
        }

    })
});


