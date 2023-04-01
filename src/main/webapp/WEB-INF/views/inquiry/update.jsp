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
    <title>inquiry update</title>
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
                        <div class="banner-text"><h2>문의사항</h2></div>
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
                <form action="./update" method="post">
                    <input type="hidden" name="inquiryNum" value="${inquiryDTO.inquiryNum}">
                    <div class="row">
                        <h4 class="join__title mx-auto">문의사항 수정</h4>
                    </div>

                    <!-- <form action="./update" method="post"> 
                        내용<textarea name="inquiryDetail" id="inquiryDetail" cols="30" rows="10">${inquiryDTO.inquiryDetail}</textarea>
                        카테고리
                        <select name="inquiryCategory" id="pet-select">
                            <option value="환불/취소">환불/취소</option>
                            <option value="신고">신고</option>
                            <option value="배송">배송</option>
                            <option value="기타">기타</option>
                        </select>
                        <input type="submit" value="글 작성">
                    </form> -->

                    <div class="row">                       
                        <div class="col-lg-7 col-md-6 mx-auto">                           
                            <div class="checkout__input">
                                <input type="text" placeholder="제목" class="checkout__input__add" name="inquiryTitle" value="${inquiryDTO.inquiryTitle}">                                
                            </div>                                                                                               
                            <div class="input-category">
                                <select name="inquiryCategory" id="pet-select" class="form-select" aria-label="Default select example">
                                    <option value="환불/취소">환불/취소</option>
                                    <option value="신고">신고</option>
                                    <option value="배송">배송</option>
                                    <option value="기타">기타</option>
                                </select> 
                            </div>
                            <h1>&nbsp;</h1>
                            <div class="container">
                                <textarea class="summernote" name="inquiryDetail" id="inquiryDetail" cols="30" rows="10">${inquiryDTO.inquiryDetail}</textarea>    
                            </div>

                            <h3>&nbsp;</h3>
                            <div class="d-flex justify-content-center">
                                <button type="button" class="site-btn mr-4"><a href="/">취소</a></button>                                                     
                                <button type="submit" class="site-btn">수정</button>     
                            </div>   
                            <h1>&nbsp;</h1>                                                                                                                      
                        </div> 
                    </div>                    
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->




    <c:import url="../template/common_js.jsp"></c:import>
    <script>
    	$('#inquiryDetail').summernote();
    </script>
</body>
</html>