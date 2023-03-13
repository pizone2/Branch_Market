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
	아이디 <input type="text" name="memberId" id="memberId" readonly="readonly" value="${memberDTO.memberId}">
    이메일 <input type="email" name="memberEmail" id="memberEmail" value="${memberDTO.memberEmail}">
    핸드폰번호 <input type="tel" name="memberPhone" id="memberPhone" value="${memberDTO.memberPhone}">
    주소 <input type="text" name="memberAddress" id="memberAddress" value="${memberDTO.memberAddress}">
    
    <c:if test="${member.memberId eq memberDTO.memberId}">
	    <form action="./delete" method="post">
	        <input type="hidden" name="memberId" value="${memberDTO.memberId}">
	        <input type="submit" value="탈퇴하기" class="btn btn-danger">
	    </form>
    </c:if>
    
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>