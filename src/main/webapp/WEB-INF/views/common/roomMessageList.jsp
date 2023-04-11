<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${messageDTOs}" var="dto">
	<c:if test="${sessionScope.id eq dto.sendId}">
         <div class="chat_message_wrapper chat_message_right">
             <div class="chat_user_avatar">
                 <a href="#" target="_blank">
                     <img alt="Gurdeep Osahan (Web Designer)" title="Gurdeep Osahan (Web Designer)"
                         src="https://cdn-icons-png.flaticon.com/512/5580/5580909.png" class="md-user-image">
                 </a>
             </div>
             <ul class="chat_message">
                <li>
                     <p>${dto.contents}</p>
                 </li>
                 <li>
                     <p><span class="chat_message_time">${dto.sendDate.hours}:${dto.sendDate.minutes}</span> </p>
                 </li>
             </ul>
         </div>
	</c:if>
	<c:if test="${sessionScope.id ne dto.sendId}">
         <div class="chat_message_wrapper">
             <div class="chat_user_avatar">
                 <a href="#" target="_blank">
                     <img alt="Gurdeep Osahan (Web Designer)" title="Gurdeep Osahan (Web Designer)"
                         src="https://cdn-icons-png.flaticon.com/512/5580/5580909.png" class="md-user-image">
                 </a>
             </div>
             <ul class="chat_message">
                 <li>
                     <p>${dto.contents}</p>
                 </li>
                 <li>
                     <p><span class="chat_message_time">${dto.sendDate.hours}:${dto.sendDate.minutes}</span> </p>
                 </li>
             </ul>
         </div>
	</c:if>
</c:forEach>