<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Detail</title>
<c:import url="../template/common_css.jsp"></c:import>
<link rel="stylesheet" href="/resources/css/chat/chatPage.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

</head>
<body>
<div class="container-fluid my-5">
	<div hidden id="datas" data-boardNum = "${dto.boardNum}" data-sendId="${sessionScope.id}" data-receiveId="${dto.memberId}"></div>


	<div class="row mb-4 ">
		<h1 class="col-md-7 mx-auto text-center border-bottom border-dark pb-4">Board Detail Page</h1>
	</div>
	<div class="row col-md-7 mx-auto">
		<div class="row">
			<div class="input-group mb-3 col">
			  <span class="input-group-text">제목</span>
			  <input type="text" readonly class="form-control" id="boardTitle" value="${dto.boardTitle}">
			</div>
			<div class="col">
				<c:if test="${checkPic eq 0}">
					<button type="submit" class="btn btn-outline-success col-3" id="picAdd" data-board-boardNum="${dto.boardNum}">Pic</button>
				</c:if>
				<c:if test="${checkPic eq 1}">
					<button type="submit" class="btn btn-outline-danger col-3" id="picDelete">Pic</button>
				</c:if>
			</div>
		</div>
		
		<div class="row">
			<div class="input-group mb-3 col">
			  <span class="input-group-text">판매구매</span>
			  <input type="text" readonly class="form-control" id="boardTitle" value="${dto.boardState}">
			</div>
			<div class="input-group mb-3 col">
			  <span class="input-group-text">가격</span>
			  <input type="text" readonly class="form-control" id="boardPrice" value="${dto.boardPrice}">
			</div>
			<div class="input-group mb-3 col">
			  <span class="input-group-text">카테고리</span>
			  <input type="text" readonly class="form-control" id="boardCategory" value="${dto.boardCategory}">
			</div>
		</div>
		
		<div class="input-group">
		  <span class="input-group-text">내용</span>
		  <%-- <textarea name="boardContents" readonly class="form-control" id="boardContents" rows="5" placeholder="내용 입력">${dto.boardContents}</textarea> --%>
		  <span name="boardContents" readonly class="form-control" id="boardContents" rows="5" th:utext>${dto.boardContents}</span>
		</div>
	    
	<div class="row col-md-7 mx-auto my-4 justify-content-center">
		<a href="./delete?boardNum=${dto.boardNum}" class="btn btn-outline-danger col-3" id="delete">게시물 삭제</a>
		<a href="./update?boardNum=${dto.boardNum}" class="btn btn-outline-success col-3 mx-2">게시물 수정</a>
		<a href="./list" class="btn btn-success col-3">목록으로</a>
		<c:if test="${sessionScope.id ne dto.memberId }">
			<input type="button" class="btn btn-primary" value="채팅하기" id="chatBtn">
		</c:if>
	</div>	
</div>
<div id="commentsList"></div>


<!-- 채팅창  -->
<div class="container">
	<div>
		<!-- 헤드 부분 -->
		<aside id="sidebar_secondary" class="tabbed_sidebar ng-scope chat_sidebar bg-success-subtle">
			<div class="popup-head">
				<div class="popup-head-left pull-left"><a Design and Developmenta
						title="Gurdeep Osahan (Web Designer)" target="_blank"
						href="https://web.facebook.com/iamgurdeeposahan">
						<img class="md-user-image" alt="Gurdeep Osahan (Web Designer)"
							title="Gurdeep Osahan (Web Designer)"
							src="https://bootdey.com/img/Content/avatar/avatar1.png"
							title="Gurdeep Osahan (Web Designer)" alt="Gurdeep Osahan (Web Designer)">
						<h1>Gurdeep Osahan</h1><small><br> <span class="glyphicon glyphicon-briefcase"
								aria-hidden="true"></span> Web Designer</small>
					</a></div>
				<div class="popup-head-right pull-right">
					<button data-widget="remove" id="removeClass" class="chat-header-button pull-right"
						type="button"><img src="/resources/images/cancelBtn.png" alt=""></button>
				</div>
			</div>

			<!-- 메세지 리스트 -->
			<div id="chat" class="chat_box_wrapper chat_box_small chat_box_active"
				style="opacity: 1; display: block; transform: translateX(0px);">
				<div class="chat_box touchscroll chat_box_colors_a">
					<div id="messageList">
					</div>
				</div>
			</div>
			<!-- 메세지 제출폼 -->
			<div class="chat_submit_box">
				<div class="uk-input-group">
					<div class="gurdeep-chat-box">
						<span style="vertical-align: sub;" class="uk-input-group-addon">
							<a href="#"><i class="fa fa-smile-o"></i></a>
						</span>
						<input type="text" placeholder="Type a message" id="submit_message" name="submit_message"
							class="md-input" onkeypress="pressEnter(event)">
						<a href="#" style="padding-right: 3px;" onclick="send();"><img src="/resources/images/msgSubmitBtn.png" style="height: 10%;width: 10%;vertical-align: middle;"></a>
					</div>
				</div>			
			</div>
	</div>
</div>

<script>
const del = document.getElementById("delete");
const frm = document.getElementById("frm");

del.addEventListener("click", function(){
    let check = window.confirm("정말 삭제ㄱrrrrrrrrrrr?");
    if(check){
        frm.setAttribute("action","./delete");
        frm.setAttribute("method","post");
        frm.submit();
    }

})
</script>
  <c:import url="../template/common_js.jsp"></c:import>
  <script src="/resources/js/board/board.js"></script>

</body>
</html>