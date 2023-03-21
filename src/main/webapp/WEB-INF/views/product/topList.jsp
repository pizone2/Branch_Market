<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<table class="table table-hover">
		<thead class="table-success">
			<tr>
				<th>상품번호</th>
				<th>상품명</th>
				<th>이미지</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${productDTOs}" var="dto">
				<tr>
					<td><a>${dto.productNum}</a></td>
					<td>
						<a href="./detail?productNum=${dto.productNum}">${dto.productTitle}</a>
					</td>
					<td><img src="${dto.productImgName}" alt="" style="height: 100px;"></td>
					<td><a>${dto.memberId}</a></td>
					<td><a>${dto.productHit}</a></td>
				</tr>
			</c:forEach>
		</tbody>
</table>
