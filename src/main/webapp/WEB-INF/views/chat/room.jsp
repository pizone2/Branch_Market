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
        <button type="button" onclick="openSocket();">대화방 참여</button>
        <button type="button" onclick="closeSocket();">대회방 나가기</button>
    	<br/><br/><br/>
  		메세지 입력 : 
        <input type="text" id="sender" value="${sessionScope.id}" style="display: none;">
        <input type="text" id="messageinput">
        <button type="button" onclick="send();">메세지 전송</button>
        <button type="button" onclick="javascript:clearText();">대화내용 지우기</button>
    </div>
	
	<c:if test="${not empty messageDTOs}">
		<c:forEach items="${messageDTOs}" var="dto">
			<c:if test="${sessionScope.id eq dto.sendId }">
				나 : ${dto.contents} <br>
			</c:if>
			<c:if test="${sessionScope.id ne dto.sendId }">
				${dto.sendId} : ${dto.contents} <br>
			</c:if>
		</c:forEach>
	</c:if>
	
    <!-- Server responses get written here -->
    <div id="messages">
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