<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
<!-- <div class="container mt-5"> -->

	<div class="row  d-flex justify-content-center mb-2">

		<div class="col-md-10">

			
			<c:forEach items="${list}" var="dto" varStatus="i">
				<div class="card p-3 ${i.first ? 'mt-2' : ''}">
					<div class="d-flex justify-content-between align-items-center">
				<div class="user d-flex flex-row align-items-center">
					<img src="https://i.imgur.com/hczKIze.jpg" width="30" class="user-imgs rounded-circle mr-2">
					<span><small class="font-weight-bold comments-name">${dto.memberId}</small> <small class="font-weight-bold">
						<h5>${dto.replyContents}</h5>
					</small></span>                    
				</div>
				</div>
				<div class="action d-flex justify-content-between mt-2 align-items-center">
					<div class="reply px-4">
						
						<span class="dots"></span>
						<small class="button update newDate" id="replies" data-bs-toggle="modal" data-target="#modifyModal"  data-comment-num="${dto.replyNum}">
                            수정
                        </small>
						<span class="dots"></span>
						<small class="button del" id="del${dto.replyNum}" data-comment-num="${dto.replyNum}">
							삭제
						</small>              
					</div>                   
				</div>
				</div>
			</c:forEach>         
		</div>            
	</div>        
<!-- </div> -->



<%-- 
<table class="table table-striped">
	<c:forEach items="${list}" var="dto"> 
		<tr id="${dto.replyNum}" style="background-color:bisque ;">
			
		<td>${dto.replyNum}</td>
		<td>${dto.commentsNum}</td>
		<td>${dto.memberId}</td>	
		<td>${dto.replyContents}</td>	
		<td>${dto.replyRegDate}</td>
		
		<td>
			<button class="btn btn-danger del" id="del${dto.replyNum}" data-comment-num="${dto.replyNum}">
				DELETE
			</button>		 			
			<button class="btn btn-info update newDate" id="replies" data-bs-toggle="modal" data-target="#modifyModal"  data-comment-num="${dto.replyNum}">
				UPDATE
			</button>			
		</td>

	</c:forEach>
</table> --%>
<!-- @@@@@@@@@@@@@@@@@@@@@@  UPDATE 댓글모달창 @@@@@@@@@@@@@@@@@@@@@@@-->
<!-- <div class="modal fade" id="modifyModal" role="dialog">
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
    </div> -->
