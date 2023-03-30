<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
			<c:forEach items="${eventDTOs}" var="dto">
                    <img alt="" src="/resources/upload/event/${dto.fileName}">
             </c:forEach>
             
   <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
	  <c:forEach items="${eventDTOs}" var="dto" varStatus="i">
	    <div class="carousel-item ${i.count eq 1 ? 'active': '' }" data-bs-interval="3000">
	      <img alt="" src="/resources/upload/event/${dto.fileName}">
	    </div>
	    </c:forEach>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
    <c:import url="../template/common_js.jsp"></c:import>
</body>
</html>



