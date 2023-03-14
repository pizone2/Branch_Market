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

    <form action="./findPw" method="post">
        이메일로 임시 비밀번호 보냅니다<br>
        가입한 아이디 입력<input type="text" name="memberId" id="">
        가입한 이메일 입력<input type="email" name="memberEmail" id="">
        <input type="submit" value="비밀번호 찾기">
    </form>

    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>