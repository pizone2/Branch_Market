//@@@@@@@@@@@@@@@@@@@@@@@  답급 삭제  @@@@@@@@@@@@@@@@@@@@@@@@@@@@
$(document).on("click", ".del", function() {
    console.log("delete")
    var replyNum = $(this).data("replyNum");

$.ajax({
    type: "POST",
    url: '../commentsReply/delete?replyNum='+ replyNum,
    success: function() {
        location.reload(); // 성공적으로 삭제한 경우, 페이지 리로드
    },
    error: function(error) {
        console.log(error);
    }
    });
});