<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기는 포워드 페이지</title>
</head>
<body>
	<h1>여기는 포워드 페이지야</h1>
	
	<jsp:forward page="footer.jsp" />
	
	<!-- 
		URL 에는 httpL//localhost:4000/action/forward.do가 찍혀있음
		
		URL은 그대로고 화면만 바뀜
	 -->
</body>
</html>