<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- 댓글 목록을 출력할 HTML 코드 -->
	<table id="rtb">
		<thead>
			<tr>
				<th width='100'>번호</th>
				<th>내용</th>
				<th width='100'>작성자</th>
				<th width='100'>작성일</th>
				<th width='80'>관리</th>
			</tr>
		</thead>
		<tbody>
			<!-- 댓글 목록이 여기에 추가됩니다. -->
		</tbody>
	</table>

	<!-- 댓글 목록을 불러오는 버튼 -->
	<button onclick="getReplyList()">댓글 목록 불러오기</button>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	<table align="center" width="500" border="1" id="rtb">
		<thead>
			<td colspan="4"><b id="rCount">댓글목록</b></td>
		</thead>
		<tbody>
		</tbody>

        <div class="my-5" id="commentListResult">


        </div>
<!--  -->
<table class="table table-striped">
	<c:forEach items="${list}" var="dto"> 
		<tr id="${dto.commentsNum}">
			
		<td>${dto.commentsNum}</td>
		<td>${dto.boardNum}</td>
		<td>${dto.memberId}</td>	
		<td>${dto.commentsContents}</td>	
		<td>${dto.commentsRegDate}</td>
		
		<td>
			<button class="btn btn-danger del" id="del" data-comment-num="${dto.commentsNum}">
				DELETE
			</button>		 			
			<button class="btn btn-info update" id="replies" data-bs-toggle="modal" data-target="#modifyModal"  data-comment-num="${dto.commentsNum}">
				UPDATE
			</button>
			<button class="btn btn rep" id="rep" data-comment-num="${dto.commentsNum}">
				답글달기
			</button>
		</td>
		
	</c:forEach>
</table>

<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@  댓글등록  @@@@@@@@@@@@@@@@@@@@@@@-->
<div class="col-8" class="input_reply_div">
	<input class="w-100 form-control" id="newReplyText"type="text" placeholder="댓글입력...">
</div>
<div class="col-3 ">
	<button type="button" id="replyAddBtn"class="btn btn-success mb-1 write_reply">
		등록
	</button>
</div>

<!-- @@@@@@@@@@@@@@@@@@@@@@  UPDATE 댓글모달창 @@@@@@@@@@@@@@@@@@@@@@@-->
<div class="modal fade" id="modifyModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">댓글 수정창</h4>
            </div>
            <div class="modal-body">
            
                <div class="form-group">
                    <label for="reply_text">댓글 내용</label>
                    <input class="form-control" id="reply_text" name="reply_text" placeholder="댓글 내용을 입력해주세요">
                </div>
               
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-success modalModBtn"  data-comment-num="" id="contentsConfirm">수정</button>
                <button type="button" class="btn btn-danger modalDelBtn">삭제</button>
            </div>
        </div>
    </div>



<script>

//@@@@@@@@@@@@@@@@@@@@@@@@@ 답글달기 폼 생성@@@@@@@@@@@@@@@@@@@@@@@
let rep =document.getElementById("rep")
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
//@@@@@@@@@@@@@@@@@@@@@@@@@@@  답글 등록  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
$(document).on("click", ".add", function(e) {
  console.log("답글등록 TEST")

  var newReplyText = $('#newReplyText').val();
//AJAX 요청
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
//@@@@@@@@@@@@@@@@@@@@@@@@ ReplyList @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


$(document).ready(function(){
  getReplyList();
})
  

function getReplyList() {
  
  $.ajax({
      url : "../commentsReply/list",

      type : "get",
      success : function(result) { //댓글목록 불러오는 함수
          var tableBody = $('#rtb tbody'); //$는 의미없음 그냥 변수명 중 하나
          tableBody.html(''); //tbody를 초기화 시켜야 댓글 목록의 중첩을 막을수 있음 아니면 등록할떄마다 append로 이어짐
          $('#rCount').text("댓글 ("+result.length+")") //댓글수 출력
          if (result != null) {
              console.log(result[0]);
              console.log(Object.keys(result.getList))
              for ( var i in result) {

                  console.log("제발 좀...")
                  var tr = $("<tr>");
                  var rNum = $("<td width='100'>").text(result[i].replyNum);
                  var rContent = $("<td>").text(result[i].replyContents);
                  var rMemberId = $("<td width='100'>").text(result[i].memberId);
                  var rDate = $("<td width='100'>").text(result[i].commentsReplyRegDate);
                  var btnArea = $("<td width='80'>").append("<a href='modifyreply(${commentsReply.commentsNum})'>수정</a>").append("<a href='#'>삭제</a>");
                  console.log(rNum)            
                  tr.append(rNum);
                  tr.append(rContent);
                  tr.append(rMemberId);
                  tr.append(rDate);
                  tr.append(btnArea);
                  tableBody.append(tr);

              }
          }

      },
      error : function() {
          console.log("요청실패");

      }
  })

}

//@@@@@@@@@@@@@@@@@@@@@@@@@@@  댓글 등록  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
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
//@@@@@@@@@@@@@@@@@@@@  댓글 UPDATE @@@@@@@@@@@@@@@@@@@@@@@@@
$(document).on("click", ".update", function(e) {
  console.log("UPDATE ON CLICK")
  let num = $(this).attr("data-comment-num");
  $("#commentsContents").val($("#commentsContents"+num).text());
  $("#contentsConfirm").attr("data-comment-num", num);
  e.preventDefault();
  $('#modifyModal').modal("show");
});

$("#contentsConfirm").click(function(){
  
  fetch('../comments/update', {
      method:'POST',
      headers:{
          "Content-type":"application/x-www-form-urlencoded"
      },
      body: "commentsNum="+$(this).attr("data-comment-num")+"&commentsContents="+$('#reply_text').val()
  }).then( (response) => response.text())
    .then( (res) => {
      if(res.trim()>0){
          alert('수정 성공');
          $("#closeModal").click();
          getList(1);            
      }else {
          alert('수정 실패');
      }
    })
    .catch(()=>{
      alert('관리자에게 문의 하세요');
    })
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

</script>