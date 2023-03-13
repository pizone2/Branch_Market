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
    <form action="./update" method="post">
        아이디 <input type="text" name="memberId" id="memberId" readonly="readonly" value="${memberDTO.memberId}">
        이메일 <input type="email" name="memberEmail" id="memberEmail" value="${memberDTO.memberEmail}">
        핸드폰번호 <input type="tel" name="memberPhone" id="memberPhone" value="${memberDTO.memberPhone}">
        주소 <input type="text" name="memberAddress" id="memberAddress" value="${memberDTO.memberAddress}">
        
        비밀번호 확인<input type="password" name="memberPw" id="memberPw" placeholder="10 ~ 20 자리로 입력 해주세요">
        <input type="submit" value="수정하기" class="btn btn-primary">
    </form>

    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>