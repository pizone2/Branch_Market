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
<c:import url="../template/header.jsp"></c:import>

<!-- Banner Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <hr>
                </div>
                <div class="col-lg-12 text-center">
                    <div class="background-page">
                        <div class="banner-text"><h2>이벤트 배너 관리</h2></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->
    
    
    
        <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad col-lg-8 mx-auto">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>                                    
                                    <th class="shoping__product">
                                        <label>
                                            
                                            <span class="product-name">Banners</span>
                                        </label>
                                    </th>
                                    <!-- <th><button class="banner-btn btn">삭제</button></th> -->
                                    <th><button class="banner-btn btn" data-toggle="modal" data-target="#ModalLoginForm">배너 등록</button></th>
                                    
                                
                                </tr>
                            </thead>
                            <tbody>
                              <c:forEach items="${eventDTOs}" var="dto" varStatus="i">
                                <tr>
                                    <td class="shoping__cart__item" >
                                        <!-- <input type="checkbox" id="acc" name="chk">  --> 
                                        <h8>&nbsp;</h8>   
                                                                                                            
                                        <img src="/resources/upload/event/${dto.fileName}" alt="" style="width: 200px; height: 200px;">
                                        <h5>${dto.oriName}</h5>
                                        

                                    </td>
                                    <td class="banner_update_btn">
                                        <button class="member-btn btn update"  data-toggle="modal" data-target="#ModalImageUpdateForm" data-eventNum="${dto.eventNum}">이미지 수정</button>
                                    </td>
                                    <td class="shoping__cart__item__close">                                   
                                        <span class="icon_close fileDbDel" data-fileIndex="${i.count}" data-eventNum="${dto.eventNum}" data-fileName="${dto.fileName}"></span>
                                    </td> 
                                </tr>
                               </c:forEach>
                           
                            </tbody>
                                                     
                        </table>
                    </div>
                </div>
            </div>
            
        </div>
    </section>
    <!-- Shoping Cart Section End -->


    <!-- Contact Form Begin -->
    <div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- 배너 등록 모달 -->
<div id="ModalLoginForm" class="modal fade">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <h3 class="mb-4">배너 이미지 등록하기</h3>
                
                    <input type="hidden" name="_token" value="">
                    <div class="form-group">
                        <!-- <label class="control-label">배너명</label>
                        <div>
                            <input type="text" class="form-control input-lg" name="name" value="">
                        </div> -->
                    </div>
                    <div class="form-group">
                        <label class="control-label">배너 이미지</label>
                    <input type="button" id="fileAddBtn" value="파일 추가">
					<form action="./add" method="post" enctype="multipart/form-data">
				        <div id="fileAddList"></div>
				        
				        <div class="form-group mt-4" style="text-align: center;">
                        <div >
                            <button type="submit" class="btn btn-success">
                                등록
                            </button>
                            <button type="submit" class="btn btn-success">
                                취소
                            </button>
                        </div>
                    </div>
				    </form>
                        
                    </div>
                
                   
                
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 배너 수정 모달 -->

<div id="ModalImageUpdateForm" class="modal fade">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <h3 class="mb-4">배너 이미지 수정하기</h3>
                <form action="./update" method="post" id="imageUpdateForm" enctype="multipart/form-data">
                    <div class="form-group">
                        <!-- <label class="control-label">배너명</label>
                        <div>
                            <input type="text" class="form-control input-lg" name="name" value="">
                        </div> -->
                    </div>
                    <div class="form-group">
                        <label class="control-label">배너 이미지</label>
                        <input type="file" name="fileName" id="updateFile">
                    </div>
                    <div class="form-group mt-4" style="text-align: center;">
                        <div>
                            <button type="button" class="btn btn-success" data-eventNum="" id="eventConfirm">
                                수정
                            </button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                취소
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
    







<%-- 



			<c:forEach items="${eventDTOs}" var="dto">
                    <img alt="" src="/resources/upload/event/${dto.fileName}">
             </c:forEach>
             
   <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-inner">
		  <c:forEach items="${eventDTOs}" var="dto" varStatus="i">
		    <div class="carousel-item ${i.count eq 1 ? 'active': '' }" data-bs-interval="3000">
		      <img alt="" src="/resources/upload/event/${dto.fileName}">
		    </div>
		    </c:forEach>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
</div>


 --%>

	<script src="/resources/js/event/fileManager.js"></script>
	<c:import url="../template/footer.jsp"></c:import>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>



