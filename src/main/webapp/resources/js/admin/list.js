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


// ------------------------ 네이버 데이터 넣기
$('#getNaverDataBtn').click(()=>{
	console.log("아무거나")
    let searchList = ['여성패션','남성패션','가구/인테리어','생활/주방','가전제품','전자기기(디지털,컴퓨터)','E쿠폰/티켓'];
    let productQ = ['아주 좋음','좋음','보통','나쁨','매우 나쁨'];
    let boardState = ['판매','구매'];

    for(let search of searchList){
        $.ajax({
            type:"GET",
            url:"/member/getNaverData?search=" + search,
            success:(response)=>{
                response = JSON.parse(response);
  
                $(response.items).each((index,item)=>{
                    item.title = item.title.replace(/<[^>]*>?/g, '');
                    if(item.title.length <= 40){
                        $.ajax({
                            async:false,
                            url:"/product/insertNaverData",
                            type:'post',
                            data:{
                                'memberId':'admin',
                                'productTitle':item.title,
                                'productPrice':item.lprice,
                                'productDetail':item.title + " 상품 입니다 많은 구매 바랍니다",
                                'productQ':productQ[Math.floor(Math.random() * productQ.length)],
                                'productCategory':search,
                                'productImgName':item.image
                            },
                            success:(response)=>{
                                console.log(response);
                            }
                        })
                        $.ajax({
                            async:false,
                            url:"/board/add",
                            type:'post',
                            data:{
                                'memberId':'admin',
                                'boardTitle':item.title,
                                'boardPrice':item.lprice,
                                'boardContents':item.title + " 상품 입니다 많은 구매 바랍니다",
                                'boardState':boardState[Math.floor(Math.random() * boardState.length)],
                                'boardCategory':search
                            },
                            success:(response)=>{
                                console.log(1);
                            }
                        })
                    }
                })
               

            }
        })
    }

})
