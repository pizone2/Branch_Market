<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                        <div class="banner-text"><h2>결제내역</h2></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    

     <div class="container-fluid my-5">
		<form class="row col-md-7 mx-auto d-flex justify-content-end" action="./payList" method="get" id="paginingForm">
			<input type="hidden" name="page" id="page">
			<div class="col-auto">
			<!-- <label for="kind" class="visually-hidden">Kind</label> -->
			<select name="kind" class="form-select" id="kind" aria-label="Default select example">
				<option value="productTitle">주문명</option>
			</select>
			</div>
			<div class="col-auto">
			<!-- <label for="search" class="visually-hidden">Search</label> -->
			<input type="text" class="form-control" name="search" id="search" placeholder="검색어를 입력 하세요." value="${pager.search}">
			</div>
			<div class="col-auto">
			<button type="submit" class="btn btn-outline-success">검색</button>
			</div>
		</form>

	<div class="row col-md-7 mx-auto">
		<table class="table table-hover">
				<thead class = "table-success">
					<tr>
						<th>주문 번호</th>
						<th>주문명</th>
						<th>결제 날짜</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
					<c:forEach items="${payDTOs}" var="dto">
							<tr>
								<td><a>${dto.merchantUid}</a></td>
								<td><a href="./payListDetail?merchantUid=${dto.merchantUid}">${dto.productTitle}</a></td>
								<td><a>${dto.payDate}</a></td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
			
				<!-- paging -->
		<div class="row mx-auto">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			  
			  	<li class="page-item">
			      <a class="page-link" href="#" aria-label="Previous" data-page="1">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			  
			    <li class="page-item ${pager.before?'disabled':''}">
			      <a class="page-link" href="#" aria-label="Previous" data-page="${pager.startNum-1}">
			        <span aria-hidden="true">&lsaquo;</span>
			      </a>
			    </li>
			    
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    <li class="page-item"><a class="page-link" href="#" data-page="${i}" >${i}</a></li>
			    </c:forEach>
			    
			    <li class="page-item ${pager.after eq false ? 'disabled':''}"><%-- ${pager.after eq false ? 'disabled':''} --%>
			      <a class="page-link" href="#"  aria-label="Next" data-page="${pager.lastNum+1}">
			        <span aria-hidden="true">&rsaquo;</span>
			      </a>
			    </li>
			    
			    <li class="page-item${pager.after eq false ? 'disabled':''}">
			      <a class="page-link" href="#"  aria-label="Next" data-page="${pager.totalPage}">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			    
			  </ul>
			</nav>
		</div>
		
	</div>
			
		</div>

	<script src="/resources/js/pay/payList.js"></script>
    <c:import url="../template/footer.jsp"></c:import>
 	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>