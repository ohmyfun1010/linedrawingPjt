<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<title>Shop Homepage - Start Bootstrap Template</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap core CSS -->
<link href="${root }resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${root }resources/css/shop-homepage.css" rel="stylesheet">
<script src="${root }resources/vendor/jquery/jquery.min.js"></script>
<script
	src="${root }resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<style>
.loginform {
	margin-bottom: 100px;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div class="container loginform" style="margin-top: 100px">
		<div class="card shadow">
			<div class="card-body">
				<h4 class="card-title">공지 게시판</h4>
				<table class="table table-hover" id='board_list'>
					<thead>
						<tr>
							<th class="text-center d-none d-md-table-cell">글번호</th>
							<th class="w-50">제목</th>
							<th class="text-center d-none d-md-table-cell">작성자</th>
							<th class="text-center d-none d-md-table-cell">작성날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var='obj' items="${list }">
							<tr>
								<td class="text-center d-none d-md-table-cell">${obj.content_idx }</td>
								<td><a href='${root }board/notice_read?content_idx=${obj.content_idx}&page=${page}'>${obj.content_subject }</a></td>
								<td class="text-center d-none d-md-table-cell">관리자</td>
								<td class="text-center d-none d-md-table-cell">${obj.content_date }</td>

							</tr>
						</c:forEach>

					</tbody>
				</table>


				<div class="d-none d-md-block">
					<ul class="pagination justify-content-center">
						<c:choose>
							<c:when test="${pageButtonBean.prevPage <= 0 }">
								<li class="page-item disabled"><a href="#"
									class="page-link">이전</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="${root }board/notice?pagepage=${pageButtonBean.prevPage}"
									class="page-link">이전</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var='idx' begin="${pageButtonBean.min }" end="${pageButtonBean.max }">
							<c:choose>
								<c:when test="${idx == pageButtonBean.currentPage }">
									<li class="page-item active"><a
										href="${root }board/notice?page=${idx}" class="page-link">${idx }</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a
										href="${root }board/notice?page=${idx}" class="page-link">${idx }</a>
									</li>
								</c:otherwise>
							</c:choose>

						</c:forEach>


						<c:choose>
							<c:when test="${pageButtonBean.max >= pageButtonBean.pageCnt }">
								<li class="page-item disabled"><a href="#"
									class="page-link">다음</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="${root }board/notice?page=${pageButtonBean.nextPage}"
									class="page-link">다음</a></li>
							</c:otherwise>
						</c:choose>

					</ul>
				</div>

				<c:if test="${user_name eq '오지석'}">
				<div class="text-right">
				<a href="${root }board/notice_write?page=${page}" class="btn btn-primary">글쓰기</a>
				</div>
				</c:if>
			</div>
		</div>
	</div>


	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
</body>
</html>