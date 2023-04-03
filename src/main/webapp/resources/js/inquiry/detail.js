let inquiryNum = $('#datas').attr('data-inquiryNum');
$('.del').click((e)=>{
    let inquiryNum = $(e.target).attr('data-inquiryNum');
    let isGo = confirm('정말 삭제 하시겠습니까?');
    console.log(isGo);
    if(isGo == true){
        $.ajax({
            url:'./delete',
            type:'post',
            data:{
                'inquiryNum':inquiryNum
            },
            success:(response)=>{
                response = response.trim();
                if(response == 'true'){
                    alert('삭제가 완료 되었습니다!');
                }else{
                    alert('삭제 실패!')
                }
                location.href = "./myList";
            }
        })
    }
})

// ----------------------------- 댓글 리스트
function getCommentList(page, kind, search,inquiryNum){
    $.ajax({
        url: '/inqComments/list?inquiryNum=' + inquiryNum + '&page=' + page + '&kind=' + kind + '&search=' + search + '&inquiryNum=' + inquiryNum,
        type:'get',
        success:(response)=>{
            response = response.trim();
            $('#commentsList').html(response);        
        },
        error:(response)=>{

        }
    })
};
getCommentList(1,"","",inquiryNum);

// ---------------------------- 댓글 추가
$('#commentsList').on('click','#submitBtn',(e)=>{
    $.ajax({
        url:'/inqComments/add',
        type:'post',
        data:{
            'inquiryNum':inquiryNum,
            'inqCommentsContents':$('#inqCommentsContents').val()
        },
        success:(response)=>{
            response = response.trim();
            if(response == 'true'){
                alert('댓글이 추가 되었습니다');
            }else{
                alert('댓글 추가 실패');
            }
            $('#inqCommentsContents').val("");
            getCommentList(1,"","",inquiryNum);
        }
    })
})

// ------------------- 댓글 수정
$('#commentsList').on('click','small[data-update-inqCommentsNum]',(e)=>{
    console.log(e.target);
    let inqCommentsNum = $(e.target).attr('data-update-inqCommentsNum');
    $('#datas').attr('data-inqCommentsNum',inqCommentsNum);

    let contents = $('#inqCommentsContents' + inqCommentsNum).html();
    $('#updateContents').val(contents);
})
$('#commentsList').on('click','#updateSaveBtn',()=>{
    $.ajax({
        url:'/inqComments/update',
        type:'post',
        data:{
            'inqCommentsNum':$('#datas').attr('data-inqCommentsNum'),
            'inqCommentsContents':$('#updateContents').val()
        },
        success:(response)=>{
            response = response.trim();
            if(response == 'true'){
                alert('댓글이 수정 되었습니다');
            }else{
                alert('댓글 수정 실패');
            }
            $('#updateModalCloseBtn').click();
            getCommentList(1,"","",inquiryNum);
        }
    })
})
// ----------------- 삭제하기
$('#commentsList').on('click','small[data-delete-inqCommentNum]',(e)=>{
    let inqCommentsNum = $(e.target).attr('data-delete-inqCommentNum');
    $('#datas').attr('data-inqCommentsNum',inqCommentsNum);

    $.ajax({
        url:'/inqComments/delete',
        type:'post',
        data:{
            'inqCommentsNum':$('#datas').attr('data-inqCommentsNum')
        },
        success:(response)=>{
            response = response.trim();
            if(response == 'true'){
                alert('댓글이 삭제 되었습니다');
            }else{
                alert('댓글 삭제 실패');
            }
            getCommentList(1,"","",inquiryNum);
        }
    })
})
// ------------------- 페이지 검색
$('#commentsList').on('click','.page-link',(e)=>{
    let page = $(e.target).attr('data-page')
    getCommentList(page,$('#kind').val(),$('#search').val(),inquiryNum);
})
$('#commentsList').on('click','#searchBtn',(e)=>{
    getCommentList(1,$('#kind').val(),$('#search').val(),inquiryNum);
})

// &laquo; &lsaquo; &rsaquo; &raquo; 