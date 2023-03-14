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
 //이벤트 아이디 바꾸기
    <form action="./updatePw" method="post" id="updateForm">
        현재 비밀번호 입력<input type="password" name="memberPw">
        변경 할 비밀번호 입력<input type="password" name="changeMemberPw" id="changeMemberPw" placeholder="10 ~ 20 자리로 입력 해 주세요">
        <div id = "changeMemberPwMsg"></div>
        변경 할 비밀번호 확인<input type="password" name="checkMemberPw" id="checkMemberPw">
        <div id = "checkMemberPwMsg"></div>
        <input type="button" value="변경하기" id="btn">
    </form>

    <script src="/resources/js/member/updatePw.js"></script>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>