<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Notice Update</title>
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
                        <div class="banner-text"><h2>공지사항</h2></div>
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
                <!-- <form action="./update" method="post">
                    <input type="hidden" name="noticeNum" value="${noticeDTO.noticeNum}">
                    
                    제목<input type="text" name="noticeTitle" value="${noticeDTO.noticeTitle}">
                    내용<textarea name="noticeContents" id="noticeContents" cols="30" rows="10">${noticeDTO.noticeContents}</textarea>
                    <input type="submit" value="글 작성">
                </form> -->
                <form action="./update" method="post">
                    <input type="hidden" name="noticeNum" value="${noticeDTO.noticeNum}">
                    <div class="row">
                        <h4 class="join__title mx-auto">공지사항 수정</h4>
                    </div>
                    <div class="row">                       
                        <div class="col-lg-7 col-md-6 mx-auto">                           
                            <div class="checkout__input">
                                <input name="noticeTitle" value="${noticeDTO.noticeTitle}" type="text" placeholder="제목" class="checkout__input__add">                                
                            </div>  
                            <div class="container">
                                <textarea name="noticeContents" id="noticeContents" cols="30" rows="10" class="summernote">
                                    ${noticeDTO.noticeContents}
                                </textarea>    
                            </div>

                            <h3>&nbsp;</h3>
                            <div class="d-flex justify-content-center">
                                <button type="button" class="site-btn mr-4"><a href=".list">취소</a></button>                                                     
                                <button type="submit" class="site-btn">업데이트</button>     
                            </div>   
                            <h1>&nbsp;</h1>                                                                                                                      
                        </div> 
                    </div>                    
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

    <c:import url="../template/footer.jsp"></c:import>
    <c:import url="../template/common_js.jsp"></c:import>
    <script>
    	$('#noticeContents').summernote();
    </script>
</body>
</html>