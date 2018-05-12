<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>costagram</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link rel='stylesheet prefetch'
	href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>

<link rel="stylesheet" href="/insta/resources/css/login/style.css">

</head>
<body>
	<!-- jQuery/Bootstrap login window -->

	<div id="wrapper">
		
		<div id="loginWindow">
			<form action = "/instaLogin" method = "post">
			<div class="page-header">
				<p class="left">
					<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
				</p>
				<h1>Login</h1>
			</div>
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1">USERID</span> <input
					type="text" class="form-control" name = "email" id = "email" placeholder="아이디"
					aria-describedby="basic-addon1">
			</div>
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon2">PASSWD</span> <input
					type="password" class="form-control" name = "password" id = "password" placeholder="패스워드"
					aria-describedby="basic-addon2">
			</div>
			<button class="btn btn-danger" type="submit" onclick="check_submit()">로그인</button>
			</form>
			<a href="/insta/member-insert.jsp" style = "float: right">회원가입</a>
		</div>
		
		
	</div>

	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="/insta/resources/js/index.js"></script>
	
	<script>
	function check_submit() {
		var email = $('#email').val();
		var password = $('#password').val();
		
		if(email === ''){
			$('#email').focus();
			alert("이메일을 입력하세요.")
			return false;
		}else if(password === ''){
			$('#password').focus();
			alert("비밀번호를 입력하세요.")
			return false;
		}
		return true;
	}
	 </script>
	
</body>
</html>