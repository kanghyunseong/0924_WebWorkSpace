<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL 사용을 위한 태그 라이브러리 선언 (필수) --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Planner</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css">

<style>
.navbar-brand {
	background-image:
		url("${pageContext.request.contextPath}/resources/img/logo.jpeg");
	background-size: contain;
	background-repeat: no-repeat;
	background-position: center;
	width: 120px;
	height: 60px;
	display: inline-block;
}

body {
	background-color: #e0dfda;
}

.card-img-top {
	object-fit: contain;
	height: 200px;
	width: 100%;
	padding: 15px;
}

#calendar {
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/"></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNav">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="#">서비스 소개</a></li>
						<li class="nav-item"><a class="nav-link" href="#">게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="#">사진 게시판</a></li>

						<c:choose>
							<c:when test="${ empty sessionScope.userInfo }">
								<li class="nav-item"><a class="nav-link" href="#"
									data-toggle="modal" data-target="#login-modal">로그인</a></li>
								<li class="nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/signUp">회원가입</a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/update">내정보</a></li>
								<li class="nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/logout"
									onclick="return confirm('정말 로그아웃 하시겠습니까?');">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<hr style="border: 1px solid #ccc; margin-top: 0;">

	<main class="container py-5">
		<div class="row">
			<div class="col-md-4 mb-4">
				<div class="card shadow h-100">
					<img
						src="${pageContext.request.contextPath}/resources/img/card_schedule.png"
						class="card-img-top" alt="일정 관리">
					<div class="card-body d-flex flex-column">
						<h5 class="card-title">일정 관리</h5>
						<p class="card-text">월별, 주별, 일별로 당신의 스케줄을 손쉽게 관리하고 중요한 약속을 놓치지
							마세요.</p>
						<a href="#" class="btn btn-primary mt-auto">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-4">
				<div class="card shadow h-100">
					<img
						src="${pageContext.request.contextPath}/resources/img/card_goal.png"
						class="card-img-top" alt="목표 설정">
					<div class="card-body d-flex flex-column">
						<h5 class="card-title">목표 설정</h5>
						<p class="card-text">장기적인 목표를 설정하고 진행 상황을 추적하며 동기를 부여받으세요.</p>
						<a href="#" class="btn btn-primary mt-auto">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-4">
				<div class="card shadow h-100">
					<img
						src="${pageContext.request.contextPath}/resources/img/card_todo.png"
						class="card-img-top" alt="할 일 목록">
					<div class="card-body d-flex flex-column">
						<h5 class="card-title">할 일 목록</h5>
						<p class="card-text">매일의 할 일을 목록으로 만들어 체계적으로 관리하고 생산성을 높여보세요.</p>
						<a href="#" class="btn btn-primary mt-auto">자세히 보기</a>
					</div>
				</div>
			</div>
		</div>

		<div id="calendar" class="mt-5"></div>
	</main>


	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">로그인</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="${pageContext.request.contextPath}/login"
					method="post">
					<div class="modal-body">
						<div class="form-group">
							<label for="userId">아이디</label> <input type="text"
								class="form-control" name="userId" required>
						</div>
						<div class="form-group">
							<label for="userPwd">비밀번호</label> <input type="password"
								class="form-control" name="userPwd" required>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary">로그인</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%-- jQuery와 Bootstrap JS --%>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>