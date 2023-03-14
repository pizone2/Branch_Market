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
    <form action="./findId" method="post">
        가입한 이메일 입력 바랍니다 <input type="email" name="memberEmail" id="">
        <input type="submit" value="아이디 찾기">
    </form>

    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>