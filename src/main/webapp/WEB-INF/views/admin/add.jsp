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
	 <form action="./add" method="post" id="addForm">

        아이디 <input type="text" name="memberId" id="memberId">
        <div id="idMsg"></div>
        비밀번호 <input type="password" name="memberPw" id="memberPw">
        <div id="pwMsg"></div>
        비밀번호 확인<input type="password" id="checkMemberPw">
        <div id="checkPwMsg"></div>
        이메일 <input type="email" name="memberEmail" id="memberEmail">
        <div id="emailMsg"></div>
        핸드폰번호 <input type="tel" name="memberPhone" id="memberPhone">
        <div id="phoneMsg"></div>
        주소 <input type="text" name="memberAddress" id="memberAddress">
        <div id="addressMsg"></div>

        <input type="submit" value="회원가입" id="submit1">
    </form>
    <script src="/resources/js/member/add.js"></script>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>