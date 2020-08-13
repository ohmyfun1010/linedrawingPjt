<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="${root }main">Line Drawing</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="${root }main">main <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a href='${root }board/review'
						class="nav-link">리뷰게시판</a></li>
					<li class="nav-item"><a href='${root }board/notice'
						class="nav-link">공지게시판</a></li>
					<c:choose>
						<c:when test="${loginUserBean.userLogin == true}">
							<li class="nav-item">
							<a href='${root }user/user_info' class="nav-link">내 정보</a>
							</li>
							<li class="nav-item">
							<a href='${root }user/logout' class="nav-link">로그아웃</a>
							</li>
							
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a href='${root }user/login'
								class="nav-link">로그인</a></li>
							<li class="nav-item"><a href='${root }user/join'
								class="nav-link">회원가입</a></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
		</div>
	</nav>


</body>
</html>