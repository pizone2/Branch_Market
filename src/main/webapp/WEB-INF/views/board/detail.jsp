<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Detail</title>
<c:import url="../template/common_css.jsp"></c:import>
<link rel="stylesheet" href="/resources/css/chat/chatPage.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/comments.css">
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<!-- Banner Section Begin -->
		 <section class="hero hero-normal">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<hr>
					</div>
					
				</div>
			</div>
		</section>
		<!-- Banner Section End -->
<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<c:if test="${not empty dto.boardImgDTOs}">
								<img class="product__details__pic__item--large" src="../resources/upload/board/${dto.boardImgDTOs[0].fileName}">
							</c:if>
							<c:if test="${empty dto.boardImgDTOs}">
								<img class="product__details__pic__item--large" src="../../resources/images/noImg.png">
							</c:if>
                        </div>
                    </div>
                </div>
                <div class="product_details col-lg-6 col-md-6">
                	<div hidden id="datas" data-boardNum = "${dto.boardNum}" data-sendId="${sessionScope.id}" data-receiveId="${dto.memberId}"></div>
                    <div class="product__details__text">
                    	<div class="row">
                    		<div class="col-3 detail-state">${dto.boardCategory}</div>
                    		<div class="col-3 detail-state mx-2">${dto.boardState}</div>
                    	</div>
                   		
                        <!--boardTitle-->
                        <h3>${dto.boardTitle}</h3>
                        <!--boardPrice-->
                        <div class="product__details__price"><fmt:formatNumber value="${dto.boardPrice}" pattern="#,###" />원</div>
                        <!--boardID-->
                        <p><a href="../../member/myPage?memberId=${dto.memberId}" style='color: gray;'><i style='font-size:18px;' class='fas mx-2'>&#xf56b;</i>${dto.memberId}</p>
                        
                        <c:if test="${not empty member}">
	                        <!--boardSub-->
	                        <div class="co1-8">
	                            <a href="#" class="btn-icon btn btn-success" id="chatBtn">채팅</a>
	                            <a href="#" class="heart-icon"><i class="icon-heart fa fa-heart"></i></a>
	                            <div id="picIcon">
	                                <c:if test="${checkPic eq 0}">
	                                	<a href="./detail?boardNum=${dto.boardNum}" class="heart-icon" id="picAdd">
	                                		<i class="icon-heart fa fa-heart" type="submit" data-board-boardNum="${dto.boardNum}"></i>
	                                	</a>
	                               	</c:if>
	                                <c:if test="${checkPic eq 1}">
	                                	<a href="./detail?boardNum=${dto.boardNum}" class="heart-icon" id="picDelete">
	                                		<i class="icon-heart fa fa-check" type="submit"></i>
	                                	</a>
	                                </c:if>
	                            </div>
	                        </div>
                        </c:if>
                        
                        <div class="product__details__pic__slider owl-carousel my-5">
	                        <c:if test="${not empty dto.boardImgDTOs}">
	                        	<c:if test="${dto.boardImgDTOs.size()>1}">
			                        <c:forEach begin="0" end="${dto.boardImgDTOs.size()-1}" step="1" var="i">
			                        	<div class="row">
											<img data-imgbigurl="../resources/upload/board/${dto.boardImgDTOs[i].fileName}"
			                                src="../resources/upload/board/${dto.boardImgDTOs[i].fileName}" alt="" >
			                                <input type="hidden" name="fileNum" value="${dto.boardImgDTOs[i].fileNum}">
			                        	</div>
									</c:forEach>
								</c:if>
								<c:if test=""></c:if>
							</c:if>
                        </div>
                    </div>
                </div>
                 <section class="related-product mx-auto mt-5">
                                    <div class="container mt-5">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="section-title related__product__title mt-5">
                                                    <h2>상품 상세 내용</h2>
                                                </div>
                                                <h4>${dto.boardContents}</h3>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    
                                    <!-- 댓글  -->
									<div id="commentsList"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="list">
        <!--권한을 가지고 있는 사람만 보임 -->
        <c:if test="${member.memberId eq dto.memberId or member.memberRole eq 'admin'}">
	        <a href="./update?boardNum=${dto.boardNum}" type="button" class="form-update btn btn-info" id="updatebtn">수정</button>
	        <a href="./delete?boardNum=${dto.boardNum}" id="del"><button class="form-delete btn btn-danger">삭제</button></a>
        </c:if>
        <!--모든 사람에게 보임 -->
        <a href="./list"><button class="form-list btn btn-success">목록으로</button></a>
    </div>
    </div>
<!-- Product Details Section End -->

<!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>관련 중고 상품</h2>
                    </div>
                </div>
            </div>
            <div class="row">
    <c:forEach items="${resultList}" var="list">
        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="product__item">
                <div class="product__list d-flex justify-content-between">
                    <div class="product__list__item mx-auto">
                    	<c:if test="${empty list.boardImgDTOs[0].fileName}">
							<div class="product__item__pic set-bg" data-setbg="/resources/images/noImg.png"></div>
						</c:if>
						<c:if test="${not empty list.boardImgDTOs[0].fileName}">
							<div class="product__item__pic set-bg" data-setbg="/resources/upload/board/${list.boardImgDTOs[0].fileName}"></div>
						</c:if>
                        <div class="product__item__text">
                            <h6><a href="./detail?boardNum=${list.boardNum}">${list.boardTitle}</a></h6>
                            <h5><fmt:formatNumber value="${list.boardPrice}" pattern="#,###" />원</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>              
        </div>
    </section>
<!-- Related Product Section End -->

<!-- 채팅창  -->
<div class="container" style="position: absolute; z-index: 1;">
    <div>
        <!-- 헤드 부분 -->
        <aside id="sidebar_secondary" class="tabbed_sidebar ng-scope chat_sidebar bg-success-subtle">
            <div class="popup-head" id="messageHead">
                <div class="popup-head-left pull-left" id="chatHead"><a Design and Developmenta
                        title="Gurdeep Osahan (Web Designer)" target="_blank"
                        href="#">
                        <img class="md-user-image" alt="Gurdeep Osahan (Web Designer)"
                            title="Gurdeep Osahan (Web Designer)"
                            src="https://cdn-icons-png.flaticon.com/512/5580/5580909.png"
                            title="Gurdeep Osahan (Web Designer)" alt="Gurdeep Osahan (Web Designer)">
                        <h1>상대방</h1><small><br> <span class="glyphicon glyphicon-briefcase"
                                aria-hidden="true"></span>Developer</small>
                    </a></div>
                <div class="popup-head-right pull-right">
                    <button data-widget="remove" id="removeClass" class="chat-header-button pull-right"
                        type="button"><img src="/resources/images/cancelBtn.png" alt=""></button>
                </div>
            </div>

            <!-- 메세지 리스트 -->
            <div id="chat" class="chat_box_wrapper chat_box_small chat_box_active"
                style="opacity: 1; display: block; transform: translateX(0px); background-color: palegreen;">
                <div class="chat_box touchscroll chat_box_colors_a">
                    <div id="messageList">
                    </div>
                </div>
            </div>
            <!-- 메세지 제출폼 -->
            <div class="chat_submit_box" style="background-color: palegreen;">
                <div class="uk-input-group">
                    <div class="gurdeep-chat-box">
                        <span style="vertical-align: sub;" class="uk-input-group-addon">
                            <a href="#"><i class="fa fa-smile-o"></i></a>
                        </span>
                        <input type="text" placeholder="Type a message" id="submit_message" name="submit_message"
                            class="md-input" onkeypress="pressEnter(event)">
                        <a href="#" style="padding-right: 3px;" onclick="send();"><img src="/resources/images/msgSubmitBtn.png" style="height: 10%;width: 10%;vertical-align: middle;"></a>
                    </div>
                </div>			
            </div>
        </aside>
    </div>
</div>


<script src="/resources/js/chat/chatPage.js"></script>
<script src="/resources/js/board/board.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>