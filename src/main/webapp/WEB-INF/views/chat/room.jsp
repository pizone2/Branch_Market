<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../template/common_css.jsp"></c:import>
<title>Simple Chat</title>
</head>
<body>
    <div>
        <button type="button" onclick="closeSocket();">대회방 나가기</button>
    	<br/><br/><br/>
  		메세지 입력 : 
        <input type="text" id="sender" value="${sessionScope.id}" style="display: none;">
        <input type="text" id="messageinput">
        <button type="button" onclick="send();">메세지 전송</button>
        <button type="button" onclick="clearText();">대화내용 지우기</button>
        
        <!-- 1 : 1 채팅이 아닐때만 보임 -->
        <c:if test="${empty oneToOneChat }">
			<button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">초대하기</button>
		</c:if>
    </div>
	
    <!-- Server responses get written here -->
    <div id="messages">
		<c:if test="${not empty messageDTOs}">
			<c:forEach items="${messageDTOs}" var="dto">
				<c:if test="${sessionScope.id eq dto.sendId }">
					<br> 나 : ${dto.contents}
				</c:if>
				<c:if test="${sessionScope.id ne dto.sendId }">
					<br> ${dto.sendId} : ${dto.contents}
				</c:if>
			</c:forEach>
		</c:if>
	</div>
    
  
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
		<div class="modal-header">
		  <h1 class="modal-title fs-5" id="exampleModalLabel">초대하기</h1>
		  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<textarea id="inviteMemberText" cols="30" rows="10"></textarea>
		<div class="modal-footer">
		  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="modalCloseBtn">Close</button>
		  <button type="button" class="btn btn-primary" id="modalSubmitBtn">초대하기</button>
		</div>
	  </div>
	</div>
  </div>


    <c:import url="../template/common_js.jsp"></c:import>
  <script src="/resources/js/chat/room.js"></script>

</body>
</html>

	<!-- private Integer messageNum;
	private Integer roomNum;
	private String sendId;
	private String receiveId;
	private String contents;
	private Date sendDate;
	private Integer isRead; -->