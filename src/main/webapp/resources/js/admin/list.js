function getinquiryList() {
    $.ajax({
        url:'/inquiry/list',

        success:(response)=>{
            response = response.trim();
            $('#inquiryList').html(response);
        }
    })
}

getinquiryList();

