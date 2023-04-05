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
							<img class="product__details__pic__item--large" src="img/cute.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="product_details col-lg-6 col-md-6">
                	<div hidden id="datas" data-boardNum = "${dto.boardNum}" data-sendId="${sessionScope.id}" data-receiveId="${dto.memberId}"></div>
                    <div class="product__details__text">
                        <!--boardTitle-->
                        <h3>${dto.boardTitle} ${dto.boardCategory} ${dto.boardState}</h3>
                        <!--boardPrice-->
                        <div class="product__details__price">${dto.boardPrice}원</div>
                        <!--boardContents-->
                        <p>${dto.boardContents}</p>
                        <div class="co1-8">
                            <a href="#" class="btn-icon btn btn-success">채팅</a>
                            <a href="#" class="heart-icon"><i class="icon-heart fa fa-heart"></i></a>
                        </div>
                        
                        <div class="product__details__pic__slider owl-carousel my-5">
                            <img data-imgbigurl="img/kong.jpg"
                                src="img/kong.jpg" alt="">
                            <img data-imgbigurl="img/kong2.jpg"
                                src="img/kong2.jpg" alt="">
                            <img data-imgbigurl="img/kong3.jpg"
                                src="img/kong3.jpg" alt="">
                            <img data-imgbigurl="img/kong4.jpg"
                                src="img/kong4.jpg" alt="">
                            <img data-imgbigurl="img/kong5.jpg"
                                src="img/kong5.jpg" alt="">
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
        <a href="./update?boardNum=${dto.boardNum}"><button class="form-update btn btn-info">수정</button></a>
        <a href="./delete?boardNum=${dto.boardNum}"><button class="form-delete btn btn-danger">삭제</button></a>
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
                        <div class="product__item__pic set-bg" data-setbg="img/kong.jpg"></div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/kong2.jpg"></div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/kong3.jpg"></div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/kong5.jpg"></div>
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

<script>
const del = document.getElementById("delete");
const frm = document.getElementById("frm");

del.addEventListener("click", function(){
    let check = window.confirm("정말 삭제ㄱrrrrrrrrrrr?");
    if(check){
        frm.setAttribute("action","./delete");
        frm.setAttribute("method","post");
        frm.submit();
    }

})
</script>

<script src="/resources/js/board/board.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>