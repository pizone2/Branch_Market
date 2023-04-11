<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <h3 style="text-align: center;">판매 중 상품</h3>
<table class="boardTable table table-hover">
    <thead class="table-success">
        <tr>
            <th>상품번호</th> <th>썸네일</th> <th>제목</th> <th>품질</th> <th>카테고리</th> <th>조회수</th>  
        </tr>
    </thead>
    <tbody>
    	<c:forEach items="${productDTOs}" var="dto">
	 		<tr>
	 			<td scope="row">${dto.r}</td>
	 			<td><img src="${dto.productImgName}" style="height: 100px"></td>
	         	<td><a href="/product/detail?productNum=${dto.productNum}">${dto.productTitle}</a></td>
	         	<td>${dto.productQ}</td>
	         	<td>${dto.productCategory}</td>
	            <td>${dto.productHit}</td>
	 		</tr>
 		</c:forEach>
    </tbody>
</table>

<!-- paging -->
<div class="mx-auto">
    <nav aria-label="Page navigation example">
        <ul class="pagination">
        
            <li class="page-item ${pager.before ? 'disabled' : ''}">
                <a class="page-link" data-page="1" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
            
            
              <li class="page-item ${pager.before ? 'disabled' : ''}">
                <a class="page-link" data-page="${pager.startNum-1}" aria-label="Previous">
                  <span aria-hidden="true">&lsaquo;</span>
                </a>
              </li>
              
              
              <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                  <li class="page-item"><a class="page-link" data-page="${i}">${i}</a></li>
              </c:forEach>
              
              
               <li class="page-item ${pager.after eq false ? 'disabled' : ''}">
                <a class="page-link" data-page="${pager.lastNum+1}" aria-label="Next">
                  <span aria-hidden="true">&rsaquo;</span>
                </a>
              </li>
              
              
              <li class="page-item ${pager.after eq false ? 'disabled' : ''}">
                <a class="page-link" data-page="${pager.totalPage}" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
        </ul>
  </nav>
</div>