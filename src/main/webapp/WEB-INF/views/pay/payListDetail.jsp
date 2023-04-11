<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <c:import url="../template/common_css.jsp"></c:import>
    <!-- <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script> -->
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
       
	<section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <hr>
                </div>
                <div class="col-lg-12 text-center">
                    <div class="background-page">
                        <div class="banner-text"><h2>구매 상세내역</h2></div>
                    </div>
                </div>
            </div>
            <div class="row col-lg-12 mx-auto my-3">
		<table class="table table-hover">
				<thead class = "table-success">
					<tr>
						<th>상품 이미지</th>
						<th>상품 이름</th>
						<th>상품 가격</th>
						<th>상품 품질</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
					<c:forEach items="${productDTOs}" var="dto">
							<tr>
								<td>
									<img alt="" src="${dto.productImgName}" height="100px">
								</td>
								<td><a href="/product/detail?productNum=${dto.productNum}">${dto.productTitle}</a></td>
								<td><fmt:formatNumber value="${dto.productPrice }"/>원</td>
								<td><a>${dto.productQ}</a></td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
        </div>
    </section>
    
    
    
    <c:import url="../template/footer.jsp"></c:import>
 	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>