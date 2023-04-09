<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
 <!-- <table class="table table-success">
	<thead>
	  <tr>
		<th scope="col">글내용</th>
		<th scope="col">작성자</th>
	  </tr>
	</thead>
	<tbody>
			<c:forEach items="${reviewDTOs}" var="reviewDTO">
				<tr>
					<td><h5 id="reviewContents${reviewDTO.reviewNum}">${reviewDTO.reviewContents}</h5></td>
					<td><h5>${reviewDTO.memberId}</h5></td>
					<td><input type="button" value="수정하기" class="btn btn-primary update" data-update-reviewNum="${reviewDTO.reviewNum}" data-update-contents="${reviewDTO.reviewContents}"
					data-bs-toggle="modal" data-bs-target="#exampleModal" id="reviewUpdateBtn" ></td>
					<td><input type="button" value="삭제하기" data-delete-reviewNum="${reviewDTO.reviewNum}" class="btn btn-danger"></td>
				</tr>
			</c:forEach>
	</tbody>
  </table> -->

				<div class="col-lg-12">
					<div class="product__details__tab">
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc">
									<table class="table">
										<thead class="table-success">
											<tr>
												<th scope="col">글번호</th>
												<th scope="col">작성자</th>
												<th scope="col">글내용</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${reviewDTOs}" var="reviewDTO">
												<tr>
													<th scope="row">${reviewDTO.reviewNum}</th>
													<td>${reviewDTO.memberId}</td>
													<td>${reviewDTO.reviewContents}</td>
													<td>
														<c:if test="${member.memberId eq reviewDTO.memberId || member.memberRole eq 'admin'}">
															<button class="btn btn-danger" type="button" id="reviewDelBtn" data-reviewNum="${reviewDTO.reviewNum}">삭제</button>
														</c:if>
													</td>
												</tr>
											</c:forEach>
									</tbody>
									</table>
									<div class="input-group mb-3">
										<input type="text" class="form-control" placeholder="댓글을 작성해주세요" aria-label="Recipient's username" id="reviewContents" aria-describedby="button-add">
										<button class="btn btn-success" type="button" id="reviewAddBtn">등록</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
								
			
