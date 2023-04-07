<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    		<button readonly class="col-3 detail-state btn btn-secondary">${dto.boardCategory}</button>
                    		<button readonly class="col-3 detail-state btn btn-secondary mx-2">${dto.boardState}</button>
                    	</div>
                   		
                        <!--boardTitle-->
                        <h3>${dto.boardTitle}</h3>
                        <!--boardPrice-->
                        <div class="product__details__price">${dto.boardPrice}원</div>
                        <!--boardContents-->
                        <p>${dto.boardContents}</p>
                        <div class="co1-8">
                            <a href="#" class="btn-icon btn btn-success">채팅</a>
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
                        
                        <div class="product__details__pic__slider owl-carousel my-5">
	                        <c:if test="${not empty dto.boardImgDTOs}">
		                        <c:forEach begin="0" end="${dto.boardImgDTOs.size()-1}" step="1" var="i">
									<img data-imgbigurl="../resources/upload/board/${dto.boardImgDTOs[i].fileName}"
		                                src="../resources/upload/board/${dto.boardImgDTOs[i].fileName}" alt="" >
		                                <input type="hidden" name="fileNum" value="${dto.boardImgDTOs[i].fileNum}">
								</c:forEach>
							</c:if>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <table class="table">
                                        <thead class="table-success">
                                            <tr>
                                                <th scope="col">번호</th>
                                                <th scope="col">닉네임</th>
                                                <th scope="col">내용</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td>Mark</td>
                                                <td>내용1</td>
                                            </tr>
                                        </tbody>
                                    </table>
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
        <c:if test="${member.memberId eq dto.memberId}">
	        <button type="button" class="form-update btn btn-info" id="updatebtn" data-Img-num="${dto.dto.boardImgDTOs.fileNum}">수정</button>
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
                        <h2>Related Product</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../resources/upload/board/${dto.boardImgDTOs[0].fileName}"></div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../resources/upload/board/${dto.boardImgDTOs[0].fileName}"></div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../resources/upload/board/${dto.boardImgDTOs[0].fileName}"></div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../resources/upload/board/${dto.boardImgDTOs[0].fileName}"></div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!-- Related Product Section End -->

<!-- 채팅창  -->
<div class="container">
	<div>
		<!-- 헤드 부분 -->
		<aside id="sidebar_secondary" class="tabbed_sidebar ng-scope chat_sidebar bg-success-subtle">
			<div class="popup-head">
				<div class="popup-head-left pull-left"><a Design and Developmenta
						title="Gurdeep Osahan (Web Designer)" target="_blank"
						href="https://web.facebook.com/iamgurdeeposahan">
						<img class="md-user-image" alt="Gurdeep Osahan (Web Designer)"
							title="Gurdeep Osahan (Web Designer)"
							src="https://bootdey.com/img/Content/avatar/avatar1.png"
							title="Gurdeep Osahan (Web Designer)" alt="Gurdeep Osahan (Web Designer)">
						<h1>Gurdeep Osahan</h1><small><br> <span class="glyphicon glyphicon-briefcase"
								aria-hidden="true"></span> Web Designer</small>
					</a></div>
				<div class="popup-head-right pull-right">
					<button data-widget="remove" id="removeClass" class="chat-header-button pull-right"
						type="button"><img src="/resources/images/cancelBtn.png" alt=""></button>
				</div>
			</div>

			<!-- 메세지 리스트 -->
			<div id="chat" class="chat_box_wrapper chat_box_small chat_box_active"
				style="opacity: 1; display: block; transform: translateX(0px);">
				<div class="chat_box touchscroll chat_box_colors_a">
					<div id="messageList">
					</div>
				</div>
			</div>
			<!-- 메세지 제출폼 -->
			<div class="chat_submit_box">
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
	</div>
</div>



<script src="/resources/js/board/board.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>