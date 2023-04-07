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

$.ajax({
    url:'/product/myProductPicCount',
    type:'post',
    success:function(res){
        res = res.trim();
        $('#myProductPicCount').html(res);
    }
})

$.ajax({
    url:'/board/myBoardPicTotalCount',
    type:'post',
    success:function(res){
        res = res.trim();
        $('#myBoardPicTotalCount').html(res);
    }
})