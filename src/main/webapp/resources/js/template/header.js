$.ajax({
    url:'/chat/totalUnreadMessageCnt',
    type:'post',
    success:function(res){
        res = res.trim();
        console.log(res);
        $('#totalUnreadMessage').html(res);
    },
    error:function(res){
        $('#totalUnreadMessage').html(0);
    }
})