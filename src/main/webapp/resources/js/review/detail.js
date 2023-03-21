let reviewNum = $('#datas').attr('data-reviewNum');

// ----------------------------- 댓글 리스트
function getCommentList(page, kind, search,reviewNum){
    $.ajax({
        url: '/review/list?reviewNum=' + reviewNum + '&page=' + page + '&kind=' + kind + '&search=' + search + '&reviewNum=' + reviewNum,
        type:'get',
        success:(response)=>{
            response = response.trim();
            $('#commentsList').html(response);        
        },
        error:(response)=>{

        }
    })
};
getCommentList(1,"","",reviewNum);

// ---------------------------- 댓글 추가
$('#submitBtn').click(()=>{
    $.ajax({
        url:'/review/add',
        type:'post',
        data:{
            'reviewNum':reviewNum,
            'reviewContents':$('#reviewContents').val()
        },
        success:(response)=>{
            response = response.trim();
            if(response == 'true'){
                alert('댓글이 추가 되었습니다');
            }else{
                alert('댓글 추가 실패');
            }
            $('#reviewContents').val("");
            getCommentList(1,"","",reviewNum);
        }
    })
})
// ------------------- 댓글 수정
$('#commentsList').on('click','input[data-update-reviewNum]',(e)=>{
    let reviewNum = $(e.target).attr('data-update-reviewNum');
    $('#datas').attr('data-reviewNum',reviewNum);

    let contents = $('#reviewContents' + reviewNum).html();
    $('#updateContents').val(contents);
})
$('#updateSaveBtn').click(()=>{
    $.ajax({
        url:'/review/update',
        type:'post',
        data:{
            'reviewNum':$('#datas').attr('data-reviewNum'),
            'reviewContents':$('#updateContents').val()
        },
        success:(response)=>{
            response = response.trim();
            if(response == 'true'){
                alert('댓글이 수정 되었습니다');
            }else{
                alert('댓글 수정 실패');
            }
            $('#updateModalCloseBtn').click();
            getCommentList(1,"","",reviewNum);
        }
    })
})
// ----------------- 삭제하기
$('#commentsList').on('click','input[data-delete-reviewNum]',(e)=>{
    let reviewNum = $(e.target).attr('data-delete-reviewNum');
    $('#datas').attr('data-reviewNum',reviewNum);

    $.ajax({
        url:'/review/delete',
        type:'post',
        data:{
            'reviewNum':$('#datas').attr('data-reviewNum')
        },
        success:(response)=>{
            response = response.trim();
            if(response == 'true'){
                alert('댓글이 삭제 되었습니다');
            }else{
                alert('댓글 삭제 실패');
            }
            getCommentList(1,"","",reviewNum);
        }
    })
})
// ------------------- 페이지 검색
$('#commentsList').on('click','.page-link',(e)=>{
    let page = $(e.target).attr('data-page')
    getCommentList(page,$('#kind').val(),$('#search').val(),reviewNum);
})
$('#commentsList').on('click','#searchBtn',(e)=>{
    getCommentList(1,$('#kind').val(),$('#search').val(),reviewNum);
})

// &laquo; &lsaquo; &rsaquo; &raquo; 