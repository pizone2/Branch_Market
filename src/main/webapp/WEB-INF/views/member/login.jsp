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

    <form action="./login" method="post">
        아이디 <input type="text" name="memberId" id="memberId" value="${cookie.cookieMemberId.value}">
        비밀번호 <input type="password" name="memberPw" id="memberPw" placeholder="10 ~ 20 자리로 입력 해주세요">
        아이디 저장<input type="checkbox" name="cookieMemberId" value="cookieMemberId" id="">
        <input type="submit" value="로그인">
    </form>

    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>