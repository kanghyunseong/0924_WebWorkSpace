<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style>
    body {
        background-color: #f8f9fa;
    }
    .container {
        max-width: 800px;
        margin-top: 50px;
        margin-bottom: 50px;
        background-color: white;
        padding: 40px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .input-group-append .btn {
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
    }
</style>
</head>
<body>

    <div class="container">
        <h1 class="text-center mb-4">회원가입</h1>
        <form action="${pageContext.request.contextPath}/signUp" method="post" id="join-form">

            <div class="form-group">
                <label for="userId">아이디</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="영문, 숫자 포함 5자 이상" required>
                    <div class="input-group-append">
                        <button type="button" class="btn btn-outline-primary">중복확인</button>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="userPwd">비밀번호</label>
                <input type="password" class="form-control" id="userPwd" name="userPwd" required>
            </div>

            <div class="form-group">
                <label for="userPwdCheck">비밀번호 확인</label>
                <input type="password" class="form-control" id="userPwdCheck" required>
                <small id="pwd-check-msg" class="form-text"></small>
            </div>

            <div class="form-group">
                <label for="userName">이름</label>
                <input type="text" class="form-control" id="userName" name="userName" required>
            </div>
            
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="example@example.com">
            </div>

            <div class="form-group">
                <label for="phone">연락처</label>
                <input type="tel" class="form-control" id="phone" name="phone" placeholder="'-' 없이 숫자만 입력">
            </div>
            <div class="d-flex justify-content-center mt-5">
                <button type="submit" class="btn btn-primary btn-lg mx-2">회원가입</button>
                <button type="reset" class="btn btn-secondary btn-lg mx-2">다시작성</button>
            </div>
        </form>
    </div>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        // 비밀번호 일치 확인
        document.getElementById('userPwdCheck').addEventListener('keyup', function() {
            const pwd = document.getElementById('userPwd').value;
            const pwdCheck = this.value;
            const msgEl = document.getElementById('pwd-check-msg');

            if (pwd === pwdCheck) {
                msgEl.textContent = '비밀번호가 일치합니다.';
                msgEl.style.color = 'green';
            } else {
                msgEl.textContent = '비밀번호가 일치하지 않습니다.';
                msgEl.style.color = 'red';
            }
        });

        // 다음 주소 API 함수
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    document.getElementById('postcode').value = data.zonecode; // 우편번호
                    document.getElementById("address").value = data.address; // 기본 주소
                    document.getElementById("detailAddress").focus(); // 상세주소로 포커스 이동
                }
            }).open();
        }
    </script>
</body>
</html>