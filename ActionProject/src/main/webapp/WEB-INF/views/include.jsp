<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인크루드~~</title>
</head>
<body>

	<h1>include</h1>

	<p>다른 페이지를 포함할 때 사용</p>
	<%--
	<%@ include file="footer.jsp" %>
 	--%>

	<h4>JSP표준 액션 태그를 이용한 방식 (동적 incldue)</h4>

	<jsp:include page="footer.jsp"></jsp:include>
	<jsp:include page="footer.jsp" />

	<!-- 
		XML기반기술이기 떄문에 반드시 시작태그와 종료태그가 쌍으로 존재해야함!!
		닫는 태그를 작성하지 않는다면 500 에러 발생!!
	 -->

	<hr>
	<!-- name은 내 맘대대로 밸류도 내마음대로 -->
	<!-- Content영역에 주석넣지않기! -->

	<jsp:include page="footer.jsp">
		<jsp:param value="Hi" name="test" />
	</jsp:include>
	
	<br>

	<jsp:include page="footer.jsp">
		<jsp:param value="bye" name="test" />
	</jsp:include>
</body>
</html>