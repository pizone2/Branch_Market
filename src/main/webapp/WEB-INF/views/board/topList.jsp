<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<table class="table table-hover">
		<thead class="table-success">
			<tr>
				<th>Num</th> <th>Title</th> <th>Writer</th> <th>Date</th> <th>Hit</th>  
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${boardDTOs}" var="dto">
				<tr>
					<td>${dto.boardNum}</td>
					<td>
						<a href="./detail?boardNum=${dto.boardNum}">${dto.boardTitle}</a>
					</td>
					<td>${dto.memberId}</td>
					<td>${dto.boardDate}</td>
					<td>${dto.boardHit}</td>
				</tr>
			</c:forEach>
		</tbody>
</table>
