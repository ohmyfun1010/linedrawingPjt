<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">

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
<script>
function checkUserIdExist(){
	
	var user_id = $("#user_id").val();

	if(user_id.length == 0){
		alert('아이디를 입력해주세요'); 
		document.getElementById("user_id").focus();
		return
	
	} 
	
	$.ajax({
		url : '${root}user/checkUserIdExist/' + user_id,
		type : 'get',
		dataType : 'text',
		success : function(result){
			if(result.trim() == 'true'){
				alert('사용할 수 있는 아이디입니다');
				$("#userIdExist").val('true');
			} else {
				alert('사용할 수 없는 아이디 입니다');
				$("#userIdExist").val('false');
			}
		}
	})
}

function resetUserIdExist(){
	$("#userIdExist").val('false')
}

</script>
 <script>
 function buttonclick(){
	// document.form1.aaaa.focus();	 
	 document.getElementById("aaaa").focus();
 }

</script>
</head>

<body>

	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div class="container loginform" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<form:form action="join_pro" method="post"
							modelAttribute="joinUserBean" name="form1">
							<form:hidden path="userIdExist"/>
							<div class="form-group">
								<form:label path="user_name">이름</form:label>
								<form:input path="user_name" class='form-control' />
								<form:errors path="user_name" style='color:red' />
							</div>
							<div class="form-group">
							<form:label path="user_id">아이디</form:label>
							<div class="input-group">
								<form:input path="user_id" id="user_id" class='form-control' onkeypress="resetUserIdExist()"/>
								<div class="input-group-append">
									<button type="button" class="btn btn-primary" onclick='checkUserIdExist()'>중복확인</button>
								</div>
							</div>
							<form:errors path="user_id" style='color:red'/>
						</div>
							<div class="form-group">
								<form:label path="user_pw">비밀번호</form:label>
								<form:password path="user_pw" class='form-control' />
								<form:errors path='user_pw' style='color:red' />
							</div>
							<div class="form-group">
								<form:label path="user_pw2">비밀번호 확인</form:label>
								<form:password path="user_pw2" class='form-control' />
								<form:errors path='user_pw2' style='color:red' />
							</div>
							<div class="form-group">
								<div class="text-right">
									<form:button class='btn btn-primary'>등록</form:button>
								</div>
							</div>
							
						</form:form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />

	<!-- Bootstrap core JavaScript -->


</body>

</html>
