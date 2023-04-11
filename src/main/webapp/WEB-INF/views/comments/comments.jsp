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
	<button type="button" id="replyAddBtn"class="btn btn-outline-success mb-1 write_reply">
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
                <button type="button" class="btn btn-default pull-left" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-success modalModBtn"  data-comment-num="" id="contentsConfirm">수정</button>
                <button type="button" class="btn btn-danger modalDelBtn">삭제</button>
            </div>
        </div>
    </div>
<script src="/resources/js/comments/comments.js"></script>