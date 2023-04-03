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
                <form action="#">
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
                                <input type="text" placeholder="제목" class="checkout__input__add">                                
                            </div>                           
                            <div class="input-state">
                                <select class="form-select" aria-label="Default select example">
                                    <!-- <option selected>판매</option> -->
                                    <option value="1">판매</option>
                                    <option value="2">구매</option>    
                                </select> 
                            </div>                                                                                   
                            <div class="input-category">
                                <select class="form-select" aria-label="Default select example">
                                    <option selected>문의 카테고리</option>
                                    <option value="1">생활가전</option>
                                    <option value="2">노트북/PC</option>
                                    <option value="3">패션잡화</option>
                                </select> 
                            </div>
                            <h1>&nbsp;</h1>
                            <div class="container">
                                <textarea class="summernote" name="editordata"></textarea>    
                            </div>

                            <h3>&nbsp;</h3>
                            <div class="d-flex justify-content-center">
                                <button type="submit" class="site-btn mr-4"><a href="./board-list.html">취소</a></button>                                                     
                                <button type="submit" class="site-btn"><a href="./board-list.html">추가</a></button>     
                            </div>   
                            <h1>&nbsp;</h1>                                                                                                                      
                        </div> 
                    </div>                    
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End --> 

<div class="container-fluid my-5">
	<div class="row mb-4 ">
		<h1 class="col-md-7 mx-auto text-center border-bottom border-dark pb-4">Board Add Page</h1>
	</div>
	<div class="row col-md-7 mx-auto">
		<form action="./add" method = "post" enctype="multipart/form-data">
	    	<div class="row">
	        	<div class="fw-bold fs-5 col-12">
	           		<p>작성자</p>
	           		<input type="text" name="memberId" value="${memberId}"  readonly="readonly" class="form-control" id="memberId" placeholder="이름 입력"><br>
	        	</div>
	         	<div class="fw-bold fs-5 col-12">
	            	<p>제목</p>
	            	<!--  <div class="fw-bold fs-5 col-12">
						<label class="btn btn-outline-success" for="boardState1">판매</label>
			        	 <input id="boardState1" type="radio" class="btn-check" name="boardState" vlaue="1">
						<label class="btn btn-outline-success" for="boardState2">구매</label>
						<input id="boardState2" type="radio" class="btn-check" name="boardState" vlaue="2"  >
					</div>-->
					
					<div class="row">
						<div class="form-check">
							<input class="btn-check" type="radio" name="boardState" id="boardState" value="판매" checked>
							<label class="btn btn-outline-success" for="boardState">판매</label>
							<input class="btn-check" type="radio" name="boardState" id="boardState1" value="구매">
							<label class="btn btn-outline-success" for="boardState1">구매</label>
						</div>
					</div>
					
	            	<input type="text" name="boardTitle" class="form-control my-2" id="boardTitle" placeholder="제목 입력"><br>
	        	 </div>
	        	 <div class="fw-bold fs-5 col-12">
		            <p>카테고리</p>
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
		         <div class="fw-bold fs-5 col-12">
	           		<p>가격</p>
	           		<input type="text" name="boardPrice" class="form-control" id="boardPrice" placeholder="가격 입력"><br>
	        	</div>
		         <div class="fw-bold fs-5 col-12 my-4">
		            <p>내용</lp>
		            <textarea name="boardContents" class="form-control my-2" id="boardContents" rows="8" placeholder="내용 입력"></textarea><br>
		         </div>
		       
		         <div class="row justify-content-center my-5">
		         	<button type="submit" class="btn btn-outline-success col-3">올리기</button>
		         </div>
	     	</div>
	   </form>
	</div>
</div>
<script>
   $("#boardContents").summernote({
	   height:250
   });
</script>
<c:import url="../template/common_js.jsp"></c:import>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>