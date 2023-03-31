<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
    <form action="./roomAdd" method="post" id="makeRoomForm">
        <input type="text" name="roomTitle" id="" placeholder="방 제목 입력">
        <input type="button" value="참가자 추가하기" id="addParticipantsBtn">
        <input type="hidden" name="participants" value="${sessionScope.id}" id="sendId">
        <div id="participantList"></div>
        <input type="button" value="방 만들기" id="makeRoomBtn">
    </form>

    <script src="/resources/js/chat/roomAdd.js"></script>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>