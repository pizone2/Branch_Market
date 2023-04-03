function getinquiryList() {
    $.ajax({
        url:'/inquiry/list',

        success:(response)=>{
            response = response.trim();
            $('#inquiryList').html(response);
        }
    })
}

function getproductAddList() {
    $.ajax({
        url:'/product/addList',

        success:(response)=>{
            response = response.trim();
            $('#productAddList').html(response);
        }
    })
}

getinquiryList();
getproductAddList();

