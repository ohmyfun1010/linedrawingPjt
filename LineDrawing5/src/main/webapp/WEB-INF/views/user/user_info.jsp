<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style>
.loginform {
	margin-bottom: 100px;
}
</style>
<script>
	 function deletereally()
	{
		var ret = confirm("아이디를 삭제하시겠습니까?");
		if(ret==true){
			location.href="${root }user/user_info_delete";
		}
		else if(ret==false){
			location.href="${root}user/user_info"
		}
	} 
</script>
</head>
<body>

<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

<div class="container loginform" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
						<div class="form-group">
							<label for="user_name">회원이름</label> 
							<input type="text"
								id="user_name" name="user_name"
								class="form-control" value="${userinfo.user_name}" disabled="disabled" />
						</div>
						<div class="form-group">
							<label for="user_id">회원ID</label> 
							<input type="text"
								id="user_id" name="user_id"
								class="form-control" value="${userinfo.user_id}" disabled="disabled" />
						</div>
						<div class="form-group">
							<label for="user_pw">회원PW</label> 
							<input type="text"
								id="user_pw" name="user_pw"
								class="form-control" value="${userinfo.user_pw}" disabled="disabled" />
						</div>
						
						<div class="form-group text-right">
							<a href="${root }user/pw_change" class='btn btn-primary'>비밀번호 변경</a>
							<a href="#" onclick = 'deletereally()' class="btn btn-danger">회원탈퇴</a>
						</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>

<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>

</body>
</html>
    