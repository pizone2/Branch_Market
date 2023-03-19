<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<button class="btn btn-info update" id="replies" data-bs-toggle="modal" data-bs-target="#modifyModal"  data-comment-num="${dto.commentsNum}">
					UPDATE
				</button>
				<button class="btn btn rep" data-comment-num="${dto.commentsNum}">
					답글달기
				</button>
			</td>
		</tr>
		
		<tr>
			<td colspan="6">
				<div class="replayList" id="replyList${dto.commentsNum}" data-commentsNum="${dto.commentsNum}"></div>
			</td>
		</tr> 
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
                <h4 class="modal-title">댓글 수정창</h4>
            </div>
            <div class="modal-body">
            
                <div class="form-group">
                    <label for="reply_text">댓글 내용</label>
                    <input class="form-control" id="reply_text" name="reply_text" placeholder="댓글 내용을 입력해주세요">
                </div>
            
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-bs-dismiss="modal" id="closeModal">닫기</button>
                <button type="button" class="btn btn-success modalModBtn"  data-comment-num="" id="contentsConfirm">수정</button>
                
            </div>
        </div>
    </div>
</div> 

<script src="/resources/js/comments/list.js"></script>