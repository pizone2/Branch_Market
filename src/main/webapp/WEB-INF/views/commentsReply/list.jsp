<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
<table class="table table-striped">
	<c:forEach items="${list}" var="dto"> 
		<tr id="${dto.replyNum}">
			
		<td>${dto.replyNum}</td>
		<td>${dto.commentsNum}</td>
		<td>${dto.memberId}</td>	
		<td>${dto.replyContents}</td>	
		<td>${dto.replyRegDate}</td>
		
		<td>
			<button class="btn btn-danger del" id="del" data-replyNum-num="${dto.replyNum}">
				DELETE
			</button>		 			
			<button class="btn btn-info update" id="replies" data-bs-toggle="modal" data-target="#modifyModal"  data-replyNum="${dto.replyNum}">
				UPDATE
			</button>			
		</td>

	</c:forEach>
</table>
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
