<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.project.model.vo.Member"%>

<%
// Controller에서 전달된 회원 정보를 세션에서 가져옵니다.
Member loginUser = (Member) session.getAttribute("userInfo");

// 만약 로그인 정보가 없다면 로그인 페이지로 리다이렉트합니다.
if (loginUser == null) {
	response.sendRedirect(request.getContextPath() + "/login");
	return; // 코드 실행 중단
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	background-color: #fff;
	padding: 20px 40px;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	width: 400px;
}

h2 {
	text-align: center;
	color: #333;
}

table {
	width: 100%;
	margin-top: 20px;
}

S
th, td {
	padding: 10px 0;
	text-align: left;
}

input[type="text"], input[type="password"], input[type="email"] {
	width: 95%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[readonly] {
	background-color: #e9e9e9;
}

.btn-container {
	text-align: center;
	margin-top: 20px;
}

.btn {
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}

.btn-primary {
	background-color: #007bff;
	color: white;
}

.btn-secondary {
	background-color: #6c757d;
	color: white;
}
</style>
</head>
<body>

	<div class="container">
		<h2>회원 정보 수정</h2>
		<form action="<%=request.getContextPath()%>/update" method="post">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="userId"
						value="<%=loginUser.getUserId()%>" readonly></td>
				</tr>
				<tr>
					<th>새 비밀번호</th>
					<td><input type="password" name="userPwd"> <br> <small>비밀번호
							변경을 원치 않으면 비워두세요.</small></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="userName"
						value="<%=loginUser.getUserName()%>" required></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="email"
						value="<%=loginUser.getEmail()%>" required></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="phone"
						value="<%=loginUser.getPhone()%>" required></td>
				</tr>
			</table>
			<div class="btn-container">
				<button type="submit" class="btn btn-primary">수정하기</button>
				<button type="button" class="btn btn-secondary"
					onclick="history.back();">취소</button>
			</div>
		</form>
	</div>

</body>
</html>