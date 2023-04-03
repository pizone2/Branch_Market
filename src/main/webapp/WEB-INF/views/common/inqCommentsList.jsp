<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
  <div class="container mt-5">

	<div class="row  d-flex justify-content-center">

		<div class="col-md-10">

			<!-- <div class="headings d-flex justify-content-between align-items-center mb-3">
				<h5>Unread comments(6)</h5>
			</div> -->
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="댓글을 작성해주세요" aria-label="Recipient's username" id="inqCommentsContents" aria-describedby="button-addon2">
				<button class="btn btn-outline-secondary" type="button" id="submitBtn">등록</button>
			</div>
			
			<c:forEach items="${inqCommentsDTOs}" var="inqCommentsDTO" varStatus="i">
				<div class="card p-3 ${i.first ? 'mt-2' : ''}">
					<div class="d-flex justify-content-between align-items-center">
				<div class="user d-flex flex-row align-items-center">
					<img src="https://i.imgur.com/hczKIze.jpg" width="30" class="user-imgs rounded-circle mr-2">
					<span><small class="font-weight-bold comments-name">${inqCommentsDTO.memberId}</small> <small class="font-weight-bold">
						<h5 id="inqCommentsContents${inqCommentsDTO.inqCommentsNum}">${inqCommentsDTO.inqCommentsContents}</h5>
					</small></span>                    
				</div>
				</div>
				<div class="action d-flex justify-content-between mt-2 align-items-center">
					<div class="reply px-4">
						<span class="dots"></span>
						<small class="" data-toggle="modal" data-target="#ModalCommentsUpdateForm" data-update-inqCommentsNum="${inqCommentsDTO.inqCommentsNum}">
                            수정
                        </small>
						<span class="dots"></span>
						<small type="button" data-delete-inqCommentNum="${inqCommentsDTO.inqCommentsNum}">삭제</small>              
					</div>                   
				</div>
				</div>
			</c:forEach>         
		</div>            
	</div>        
</div>



<!-- 댓글 수정 모달 -->
<div id="ModalCommentsUpdateForm" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title fs-5" id="exampleModalLabel">댓글 수정하기</h3>
			</div>
            <div class="modal-body">
				<div class="form-group">
					<label class="control-label">댓글 내용</label>
					<div>
						<input type="text" class="form-control input-lg" value="" id="updateContents">
					</div>
				</div>
            </div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success modalModBtn"  data-comment-num="" id="updateSaveBtn" onclick="location.reload()">
					수정
				</button>
				<button type="button" class="btn btn-default pull-left" data-bs-dismiss="modal" id="updateModalCloseBtn" onclick="location.reload()" >
					닫기
				</button>
			</div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- -------------------------------------------------------------------- -->
  <!-- <table class="table table-success">
	<thead>
	  <tr>
		<th scope="col">글내용</th>
		<th scope="col">작성자</th>
	  </tr>
	</thead>
	<tbody>
			<c:forEach items="${inqCommentsDTOs}" var="inqCommentsDTO">
				<tr>
					<td><h5 id="inqCommentsContents${inqCommentsDTO.inqCommentsNum}">${inqCommentsDTO.inqCommentsContents}</h5></td>
					<td><h5>${inqCommentsDTO.memberId}</h5></td>
					<td><input type="button" value="수정하기" class="btn btn-primary" data-update-inqCommentsNum="${inqCommentsDTO.inqCommentsNum}"
					data-bs-toggle="modal" data-bs-target="#exampleModal" ></td>
					<td><input type="button" value="삭제하기" data-delete-inqCommentNum="${inqCommentsDTO.inqCommentsNum}" class="btn btn-danger"></td>
				</tr>
			</c:forEach>
	</tbody>
  </table> -->
  
		  <!-- pagining -->
			<!-- <div class = "row" id="pagining">
					   <nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item" data-page="1">
							<a class="page-link" data-page="1" aria-label="Previous" href="#">
							  <span aria-hidden="true">&laquo;</span>
							</a>
						  </li>
						  
						  <li class="page-item ${pager.before?'disabled':''}" data-page="${pager.startNum - 1}">
							<a class="page-link" data-page="${pager.startNum - 1}" aria-label="Previous" href="#">
							  <span aria-hidden="true">&lsaquo;</span>
							</a>
						  </li>
						  <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
								  <li class="page-item" data-page="${i}"><a class="page-link" data-page="${i}" href="#">${i}</a></li>
						  </c:forEach>
  
  
						  <li class="page-item ${pager.after eq false ? 'disabled' : ''}" data-page="${pager.lastNum + 1}">
							<a class="page-link" data-page="${pager.lastNum + 1}" aria-label="Next" href="#">
							  <span aria-hidden="true">&rsaquo;</span>
							</a>
						  </li>
						  <li class="page-item" data-page="${pager.totalPage}">
							<a class="page-link" data-page="${pager.totalPage}" aria-label="Next" href="#">
							  <span aria-hidden="true">&raquo;</span>
							</a>
						  </li>
						</ul>
					  </nav>
			  </div> -->
				  
				  <!-- 검색창 -->
				  <!-- <div class = "row">
						<input type="hidden" name="page" id="page">
						<input type="hidden" name="category" id="category" value="${pager.category}">


						<div class="col-auto">
							<label for="kind" class="visually-hidden">Kind</label>
							<select name="kind" class="form-select" id="kind" aria-label="Default select example">
							<option value="memberId" ${pager.kind eq 'memberId' ? 'selected' : ''} >작성자</option>
							<option value="inqCommentsContents" ${pager.kind eq 'inqCommentsContents' ? 'selected' : ''}>내용</option>
							</select>
						</div>
						<div class="col-auto">
							<label for="search" class="visually-hidden">Search</label>
							<input type="text" class="form-control" name="search" id="search" placeholder="검색어를 입력 하세요." value="${pager.search}">
						</div>
						<div class="col-auto">
							<button type="submit" class="btn btn-primary mb-3" id="searchBtn">검색</button>
						</div>
				  </div> -->


  
  
    