<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알람</title>
<c:import url="../template/common_css.jsp"></c:import>
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
                        <div class="banner-text"><h2>알람</h2></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
<div class="container-fluid my-5">
	
	

	<div class="row col-md-7 mx-auto">
		<table class="table table-hover">
				<thead class = "table-success">
					<tr>
						<th>알람 번호</th>
						<th>알림 메세지</th>
						<th>등록 날짜</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
					<c:forEach items="${list}" var="dto">
							<tr>
								<td><a>${dto.r}</a></td>
								<td><a>${dto.notifyMessage}</a></td>
								<td><a>${dto.notifyDate}</a></td>
								<td>
									<img src="/resources/images/x.png" alt="" style="height: 30px; width: 30px;" class="del" data-notifyNum="${dto.notifyNum}">
								</td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
			
				<!-- paging -->
		<div class="row mx-auto">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			  
			  	<li class="page-item">
			      <a class="page-link" href="./list?page=1" aria-label="Previous" data-board-page="1">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			  
			    <li class="page-item ${pager.before?'disabled':''}">
			      <a class="page-link" href="./list?page=${pager.startNum-1}" aria-label="Previous" data-board-page="${pager.startNum-1}">
			        <span aria-hidden="true">&lsaquo;</span>
			      </a>
			    </li>
			    
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    <li class="page-item"><a class="page-link" href="./list?page=${i}" data-board-page="${i}" >${i}</a></li>
			    </c:forEach>
			    
			    <li class="page-item ${pager.after eq false ? 'disabled':''}"><%-- ${pager.after eq false ? 'disabled':''} --%>
			      <a class="page-link" href="./list?page=${pager.lastNum+1}"  aria-label="Next" data-board-page="${pager.lastNum+1}">
			        <span aria-hidden="true">&rsaquo;</span>
			      </a>
			    </li>
			    
			    <li class="page-item${pager.after eq false ? 'disabled':''}">
			      <a class="page-link" href="./list?page=${pager.totalPage}"  aria-label="Next" data-board-page="${pager.totalPage}">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			    
			  </ul>
			</nav>
		</div>
		</div>
			
		</div>
	
		<script src="/resources/js/notify/list.js"></script>
		<c:import url="../template/footer.jsp"></c:import>
		<c:import url="../template/common_js.jsp"></c:import>
 </body>
</html>