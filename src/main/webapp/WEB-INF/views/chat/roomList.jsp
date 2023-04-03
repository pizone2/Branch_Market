<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
<link rel="stylesheet" href="/resources/css/chat/chatPage.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	
	<input type="hidden" id="datas">
	<input type="hidden" id="sender" value="${sessionScope.id}">
	<a href="./roomAdd">방 만들기</a>
		<!-- 검색창 -->
		<div class = "row">
			<form class="row g-3" action="./roomList" method="get" id="paginingForm">
				<div class="col-auto">
				  <label for="search" class="visually-hidden">Search</label>
				  <input type="text" class="form-control" name="search" id="search" placeholder="제목을 입력 하세요." value="${pager.search}">
				</div>
				<div class="col-auto">
				  <button type="submit" class="btn btn-primary mb-3">검색</button>
				</div>
		  </form>
	  </div>
	<c:forEach items="${roomDTOs}" var="dto">
		<h5>채팅방 번호 ${dto.roomNum}</h5>
		<h5>채팅방 제목 <a href="./room/${dto.roomNum}">${dto.roomTitle}</a></h5>
		<h5>안 읽은 메세지 수 ${dto.unReadCnt}</h5>
		<button class="enterChatBtn" data-roomNum = ${dto.roomNum}>채팅하기</button>
	</c:forEach>
	

	<!-- 채팅창  -->
	<div class="container" style="position: absolute; z-index: 1;">
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
                    style="opacity: 1; display: block; transform: translateX(0px); background-color: palegreen;">
                    <div class="chat_box touchscroll chat_box_colors_a">
                        <div id="messageList">
						</div>
                    </div>
                </div>
				<!-- 메세지 제출폼 -->
                <div class="chat_submit_box" style="background-color: palegreen;">
                    <div class="uk-input-group">
                        <div class="gurdeep-chat-box">
                            <span style="vertical-align: sub;" class="uk-input-group-addon">
                                <a href="#"><i class="fa fa-smile-o"></i></a>
                            </span>
                            <input type="text" placeholder="Type a message" id="submit_message" name="submit_message"
                                class="md-input">
							<a href="#" style="padding-right: 3px;" onclick="send();"><img src="/resources/images/msgSubmitBtn.png" style="height: 10%;width: 10%;vertical-align: middle;"></a>
                        </div>
                    </div>			
                </div>
        </div>
    </div>
    </div>


	<c:import url="../template/footer.jsp"></c:import>
    <c:import url="../template/common_js.jsp"></c:import>
	<script src="/resources/js/chat/roomList.js"></script>
</body>
</html>