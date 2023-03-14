
//댓글 등록
$("#replyAddBtn").on("click", function () {
    console.log("test")
     // 입력한 댓글 내용 가져오기
    var newReplyText = $('#newReplyText').val();
    
     // 서버로 전송할 데이터
    var data = {boardNum: 1,
                memberId:'작성자 아이디',
                commentsContents: newReplyText          
                };
    
     // AJAX 요청
    $.ajax({
    type: 'POST',
    url: '../comments/add',
    contentType: 'application/json',
    data: JSON.stringify(data),
    success: function(result) {
         // 성공적으로 댓글을 추가한 경우, 페이지 리로드
        location.reload();
    },
    error: function(error) {
         // 오류가 발생한 경우, 적절한 처리를 수행
        console.log(error);
    }
    });
});


//댓글 삭제
$(document).on("click", ".del", function() {
    console.log("delete")
    var commentNum = $(this).data("comment-num");
    var deleteUrl = "delete/";
    // + commentNum

$.ajax({
    type: "DELETE",
    url: deleteUrl,
    success: function() {
        location.reload(); // 성공적으로 삭제한 경우, 페이지 리로드
    },
    error: function(error) {
        console.log(error);
    }
    });
});
