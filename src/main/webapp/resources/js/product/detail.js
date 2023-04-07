const productNum = $('#datas').attr('data-productNum');


function getReviewList(){
    $.ajax({
        url:'/review/list?productNum=' + productNum,
        type:'get',
        success:(response)=>{
            response = response.trim();
            $('#reviewList').html(response);
        }
    })
}
getReviewList();


$('#reviewList').on('click','#reviewAddBtn',(e)=>{
    $.ajax({
        url:'/review/add',
        type:'post',
        data:{
            productNum: productNum,
            reviewContents:$('#reviewContents').val()
        },
        success:(response)=>{
            response = response.trim();
            if(response == 'true'){
                alert('댓글이 추가 되었습니다');
            }else{
                alert('댓글 추가 실패');
            }
            $('#reviewContents').val("");
            getReviewList();
        },
        error: function(){
            console.log(productNum)
        }
    })
})

$('#reviewList').on('click','#reviewDelBtn',(e)=>{
    const reviewNum = $('#datas').attr('data-reviewNum');
    console.log(reviewNum)
    $.ajax({
        url:'/review/delete',
        type:'post',
        data:{
            reviewNum: reviewNum
        },
        success:(response)=>{
            response = response.trim();
            if(response == 'true'){
                alert('댓글이 삭제 되었습니다');
            }else{
                alert('댓글 삭제 실패');
            }
            $('#reviewContents').val("");
            getReviewList();
        }
    })
})