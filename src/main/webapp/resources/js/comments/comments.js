let rep =document.getElementById("rep")

// $(document).ready(function() {
// // // 답글 등록
// // $("#rep").on("click", function () {
//   // 답글 버튼 클릭 이벤트
//   $("#rep").click(function() {
//     // 부모 댓글의 ID 가져오기
//     var parentId = $(this).parent().parent().attr('id');
//     // 부모 댓글의 답글 폼 HTML 생성
//     // var replyFormHtml = '<form method="post" action="/submit-reply">' +
//     //   '<input type="hidden" name="parent_id" value="' + parentId + '">' +
//     //   '<textarea name="reply_content"></textarea>' +
//     //   '<button type="submit">Submit</button>' +
//     //   '</form>';
//     var replyFormHtml = '<br><div>답글창ㅇㅇㅇ</div>';
//     // 부모 댓글 아래에 답글 폼 삽입
//     $('#' + parentId).append(replyFormHtml);
//     alert("답글등록완료");
//   });  
// })

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
        '<form method="post" action="/submit-reply">' +
        '<input type="hidden" name="parent_id" value="' + parentId + '">' +
        '<textarea name="reply_content" class="w-100 form-control" placeholder="답글입력..."></textarea>' +
        '<button type="submit" class="btn btn-success mb-1 write_reply">등록</button>' +
        '</form>' +
        '</td>' +
        '</tr>';
      // 부모 댓글 아래에 답글 폼 삽입
      parentRow.after(replyFormHtml);
    });
  });

//댓글 등록
$("#replyAddBtn").on("click", function () {
    console.log("click")
     // 입력한 댓글 내용 가져오기
    var newReplyText = $('#newReplyText').val();
    
     // 서버로 전송할 데이터
     var data = {
        boardNum: {value: 3, jdbcType: 'INTEGER'},
        memberId: {value: '작성자 아이디', jdbcType: 'VARCHAR'},
        commentsContents: {value: newReplyText, jdbcType: 'VARCHAR'}
    };

     // AJAX 요청
    $.ajax({
    type: 'POST',
    url: '../comments/add',
    // contentType: 'application/json',
    // data: JSON.stringify(data),
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
        // }

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


//댓글 삭제
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
