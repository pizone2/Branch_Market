<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board add</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<div class="container-fluid my-5">
	<div class="row mb-4 ">
		<h1 class="col-md-7 mx-auto text-center border-bottom border-dark pb-4">Board Add Page</h1>
	</div>
	<div class="row col-md-7 mx-auto">
		<form action="./add" method = "post" enctype="multipart/form-data">
	    	<div class="row col-md-4 mx-auto my-5">
	        	<div class="fw-bold fs-5 col-12">
	           		<p>작성자</p>
	           		<input type="text" name="writer" readonly="readonly" class="form-control" id="writer" placeholder="이름 입력"><br>
	        	</div>
	         	<div class="fw-bold fs-5 col-12">
	            	<p>제목</p>
	            	<input type="text" name="title" class="form-control" id="title" placeholder="제목 입력"><br>
	        	 </div>  
		         <div class="fw-bold fs-5 col-12">
		            <p>내용</lp>
		            <textarea name="contents" class="form-control" id="contents" rows="3" placeholder="내용 입력"></textarea><br>
		         </div>
		       
		         <div class="row justify-content-center my-5">
		         	<button type="button" class="btn btn-outline-primary col-3">올리기</button>
		         </div>
	     	</div>
	   </form>
	</div>
</div>

</body>
</html>