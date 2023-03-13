<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<!-- 댓글  -->
<c:forEach items="${list}" var="dto">
<div class="collapse" id="reply_card${dto.commentNum }">
    <section class="modal-section">
        <div class="card card-body">
            <!-- 댓글 목록 -->
            <div class="reply-list reply-list${dto.commentNum }">
                <!-- 댓글이 목록이 들어가는 곳 -->
            </div>
            <!-- 댓글 작성 => 로그인한 상태여야만 댓글작성 칸이 나온다. -->
            <%-- <c:if test="${not empty sessionScope.nick }"> --%>
                <div class="row reply_write">
                    <div class="col-1">
                        <a href="other_profile.do?other_nick=${dto.memberId }">
                            <img id="write_reply_profileImage" />
                                <%-- src="./upload/profile/${sessionScope.profile }" /> --%>
                        </a>
                    </div>
                    <div class="col-8" class="input_reply_div">
                        <input class="w-100 form-control" id="input_reply${dto.commentNum}"
                            type="text" placeholder="댓글입력...">
                    </div>
                    <div class="col-3 ">
                        <button type="button" idx="${dto.commentNum }"
                            class="btn btn-success mb-1 write_reply">댓글&nbsp;달기</button>
                    </div>
                </div>
            <%-- </c:if> --%>
        </div>
    </section>
</div>
</c:forEach>



</body>
</html>