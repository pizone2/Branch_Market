<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board add</title>
<c:import url="../template/common_css.jsp"></c:import>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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
                        <div class="banner-text"><h2>중고 거래</h2></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!-- Banner Section End -->

<!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <form action="./add" method = "post" enctype="multipart/form-data">
                    <div class="row">
                        <h4 class="join__title mx-auto">게시물 등록</h4>
                    </div>
                    <div class="row">                       
                        <div class="col-lg-7 col-md-6 mx-auto"> 
	                        <div class="fw-bold fs-5 col-12">
				           		<p>작성자</p>
				           		<input type="text" name="memberId" value="${memberId}"  readonly="readonly" class="form-control" id="memberId" placeholder="이름 입력"><br>
				        	</div>
                            <div class="checkout__input">
                                <input type="text" placeholder="제목" name="boardTitle" id="boardTitle" class="checkout__input__add">                                
                            </div>    
                            <div class="row">
	                            <div class="input-state col-6" >
	                                <select class="form-select" name="boardState" id="boardState" aria-label="Default select example">
	                                    <!-- <option selected>판매</option> -->
	                                    <option value="판매">판매</option>
	                                    <option value="구매">구매</option>    
	                                </select> 
	                            </div>                                                                                   
	                            <div class="input-category col-6">
	                                <select class="form-select" name="boardCategory" id="boardCategory" aria-label="Default select example">
	                                    <option name="boardCategory" id="boardCategory">카테고리를 선택해주세요</option>
										<option value="여성패션">여성패션</option>
										<option value="남성패션">남성패션</option>
										<option value="가구/인테리어">가구/인테리어</option>
										<option value="생활/주방">생활/주방</option>
										<option value="가전제품">가전제품</option>
										<option value="전자기기">전자기기</option>
										<option value="E쿠폰/티켓">E쿠폰/티켓</option>
										<option value="기타">기타</option>
	                                </select> 
	                            </div>
                            </div>
                            <div class="checkout__input">
                                <input type="text" placeholder="가격" name="boardPrice" id="boardPrice" class="checkout__input__add"> 
                                                             
                            </div>                    
                            <div class="container">
                                <textarea class="summernote" name="boardContents"></textarea>    
                            </div>
                            
                            <!-- FILE 추가 -->
                            <div id="addFile">       
						         <button id="fileAdd" type="button" class="btn btn-success my-3">파일 추가</button>
						         
						         
					   		</div> 
					   		<p class="mx-3">이미지 파일은 최대 5개까지 추가 가능합니다</p>

                            <div class="d-flex justify-content-center my-5">
                                <button type="text" class="site-btn mr-4"><a href="./list">취소</a></button>     
                                <button type="submit" class="site-btn">추가</button>   
                            </div>                                                                                                                     
                        </div> 
                    </div>                    
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End --> 
<script src="../resources/js/board/fileManager.js"></script>
<script>
   $("#boardContents").summernote({
	   height:250
   });
</script>
<c:import url="../template/common_js.jsp"></c:import>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>