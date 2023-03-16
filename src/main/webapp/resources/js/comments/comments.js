let rep =document.getElementById("rep")
//@@@@@@@@@@@@@@@@@@@@@@@@@ 답글달기 폼 생성@@@@@@@@@@@@@@@@@@@@@@@
$(document).ready(function() {
    // 답글 버튼 클릭 이벤트
    $('.rep').click(function() {
      // 부모 댓글의 ID 가져오기
    var parentId = $(this).data('comment-num');
      // 부모 댓글의 행 요소 가져오기
    var parentRow = $('#' + parentId);
      // 답글 폼이 이미 삽입되어 있는지 확인
    var replyForm = parentRow.next('.reply-form');
    if (replyForm.length > 0) {
        // 답글 폼이 이미 삽입되어 있다면, 답글 폼을 숨기거나 삭제
        replyForm.toggle();
        return;
    }
      // 부모 댓글의 답글 폼 HTML 생성
    var replyFormHtml = '<tr class="reply-form">' +
        '<td colspan="6">' +
        '<form>' +
        '<input type="hidden" id="newReplyText" name="parent_id" value="' + parentId + '">' +
        '<textarea name="reply_content" class="w-100 form-control" placeholder="답글입력..."></textarea>' +
        '<button class="btn btn-success add mb-1 write_reply">등록</button>' +
        '</form>' +
        '</td>' +
        '</tr>';
      // 부모 댓글 아래에 답글 폼 삽입
    parentRow.after(replyFormHtml);
    });
});
// @@@@@@@@@@@@@@@@@@@@@@@@@@@  답글 등록  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
$(document).on("click", ".add", function(e) {
    console.log("답글등록 TEST")

    var newReplyText = $('#newReplyText').val();
// AJAX 요청
$.ajax({
    type: 'POST',
    url: '../commentsReply/add',
    data: {
        commentsNum: 3,
        memberId: '작성자 아이디',
        replyContents: newReplyText
    },
    jdbcTypeForNull: 'NULL',
    
    success: function(result) {
        if (result) {
            alert("완료");
        } else {
            alert("전송된 값 없음");
        }
            // 성공적으로 댓글을 추가한 경우, 페이지 리로드
        location.reload();
    },
    error: function(error) {
            // 오류가 발생한 경우, 적절한 처리를 수행
            alert(error);
        }
    });
});
// @@@@@@@@@@@@@@@@@@@@@@@@@@@  댓글 등록  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
$("#replyAddBtn").on("click", function () {
    console.log("click")
     // 입력한 댓글 내용 가져오기
    // var commentNum = $(this).data("comment-num");
    
    var newReplyText = $('#newReplyText').val();
     // AJAX 요청
    $.ajax({
    type: 'POST',
    url: '../comments/add',
    data: {
        boardNum: 3,
        memberId: '작성자 아이디',
        commentsContents: newReplyText
    },
    jdbcTypeForNull: 'NULL',
    
    success: function(result) {
        // if (result != 0) {
        //     for (i = 0; i < result.size(); i++) {
        //         $("#붙일놈시작").append('<td>${result.add}</td>');
        //     }
        // 
        if (result) {
            alert("완료");
        } else {
            alert("전송된 값 없음");
        }
         // 성공적으로 댓글을 추가한 경우, 페이지 리로드
        location.reload();
    },
    error: function(error) {
         // 오류가 발생한 경우, 적절한 처리를 수행
            alert(error);
        }
    });
});
//@@@@@@@@@@@@@@@@@@@@  댓글 수정 @@@@@@@@@@@@@@@@@@@@@@@@@
// 댓글 모달
$(document).on("click", ".update", function(e) {
    e.preventDefault();
    $('#modifyModal').modal("show");
});

$(document).on("click", ".modalModBtn", function(e) {
    console.log("댓글 수정창의 수정 버튼")
    var commentNum = $(this).data("comment-num");
    // var commentNum = $(this).parent().data("comment-num");
        // var commentNum = 9;

    // 입력한 댓글 내용 가져오기
        var reply_text = $('#reply_text').val(); 
    // 서버로 전송할 데이터
    var data = {
                commentsNum: commentNum,
                commentsContents: reply_text
                }   

    $.ajax({
        type: "POST",
        url: '../comments/update',
        // ?commentsNum='+ commentNum,
        data: data,
        
        success: function() {
            location.reload(); // 성공적으로 한 경우, 페이지 리로드
            alert("good")
        },
        error: function(error) {
            console.log(error);
            alert("error")
        }
        });
        console.log("Num 값 확인 : "+commentNum)
        console.log("Text 값 확인 : "+reply_text)
});
//@@@@@@@@@@@@@@@@@@@@  댓글 삭제  @@@@@@@@@@@@@@@@@@@@@@@@@@
$(document).on("click", ".del", function() {
    console.log("delete")
    var commentNum = $(this).data("comment-num");
    
    // + commentNum

$.ajax({
    type: "POST",
    url: '../comments/delete?commentsNum='+ commentNum,
    success: function() {
        location.reload(); // 성공적으로 삭제한 경우, 페이지 리로드
    },
    error: function(error) {
        console.log(error);
    }
    });
});
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
