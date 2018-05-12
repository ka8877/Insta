<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<<title>costagram</title>
<script src="//static.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>

<link rel="shortcut icon" type="image/x-icon"
	href="https://static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico">
<link rel="mask-icon" type=""
	href="https://static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg"
	color="#111">


<link rel="stylesheet prefetch"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<link rel="stylesheet prefetch"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style type="text/css">
body {
	display: table-cell;
	vertical-align: middle;
	background-color: #e0f2f1 !important;
}

html {
	display: table;
	margin: auto;
}

html, body {
	height: 100%;
}

.medium-small {
	font-size: 0.9rem;
	margin: 0;
	padding: 0;
}

.login-form {
	width: 280px;
}

.login-form-text {
	text-transform: uppercase;
	letter-spacing: 2px;
	font-size: 0.8rem;
}

.login-text {
	margin-top: -6px;
	margin-left: -6px !important;
}

.margin {
	margin: 0 !important;
}

.pointer-events {
	pointer-events: auto !important;
}

.input-field>.material-icons {
	padding-top: 10px;
}

.input-field div.error {
	position: relative;
	top: -1rem;
	left: 3rem;
	font-size: 0.8rem;
	color: #FF4081;
	-webkit-transform: translateY(0%);
	-ms-transform: translateY(0%);
	-o-transform: translateY(0%);
	transform: translateY(0%);
}
</style>
</head>
<body>
	<div id="login-page" class="row">
  <div class="col s12 z-depth-4 card-panel">
    <form class="login-form" action="/MemberInsertServlet" method="post" id="myForm">
      <div class="row">
        <div class="input-field col s12 center">
          <h4>회원가입</h4>
          <p class="center">아래의 정보를 입력해주세요</p>
        </div>
      </div>


      <div class="row margin">
        <div class="input-field col s12">
          <!-- <i class="mdi-social-person-outline prefix"></i> -->
          <i class="material-icons prefix">email</i>
          <input id="email" name="email" type="text" style="cursor: auto;" />
          <label for="email">이메일 주소</label>
        </div>
      </div>
		
      <div class="row margin">
        <div class="input-field col s12">
          <!-- <i class="mdi-social-person-outline prefix"></i> -->
          <i class="material-icons prefix">account_circle</i>
          <input id="name" name="name" type="text"/>
          <label for="name">성명</label>
        </div>
      </div>
      
      <div class="row margin">
        <div class="input-field col s12">
          <!-- <i class="mdi-social-person-outline prefix"></i> -->
          <i class="material-icons prefix">account_circle</i>
          <input id="userName" name="userName" type="text"/>
          <label for="userName">사용자 이름</label>
        </div>
      </div>
      
      <div class="row margin">
        <div class="input-field col s12">
          <!-- <i class="mdi-action-lock-outline prefix"></i> -->
          <i class="material-icons prefix">vpn_key</i>
          <input id="password" name="password" type="password" />
          <label for="password">비밀번호</label>
        </div>
      </div>



      <div class="row">
        <div class="input-field col s12">
          <button class="btn waves-effect waves-light col s12" type="button" onclick="check_submit()">회원가입</button>
          
        </div>
        <div class="input-field col s12">
          <p class="margin center medium-small sign-up">이미 계정이 있으신가요? <a href="/insta/insta-login.jsp">로그인</a></p>
        </div>
      </div>


    </form>
  </div>
</div>
	

	<script>
		$(".login-form").validate({
			rules : {
				username : {
					required : true,
					minlength : 4
				},
				email : {
					required : true,
					email : true
				},
				password : {
					required : true,
					minlength : 5
				},
				cpassword : {
					required : true,
					minlength : 5,
					equalTo : "#password"
				}
			},
			//For custom messages
			messages : {
				username : {
					required : "Enter a username",
					minlength : "Enter at least 4 characters"
				}
			},
			errorElement : 'div',
			errorPlacement : function(error, element) {
				var placement = $(element).data('error');
				if (placement) {
					$(placement).append(error)
				} else {
					error.insertAfter(element);
				}
			}
		});
	</script>
	<script>
	function check_submit() {
		var email = $('#email').val();
		var name = $('#name').val();
		var userName = $('#userName').val();
		var password = $('#password').val();
		var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; 
		var regPw = /^[a-z0-9]{5,15}$/;

		if(email === ''){
			$('#email').focus();
			alert("이메일을 입력하세요.")
			return false;
		}else if(name === ''){
			$('#name').focus();
			alert("성명을 입력하세요.")
			return false;
		}else if(userName === ''){
			$('#userName').focus();
			alert("사용자 이름을 입력하세요.")
			return false;
		}else if(password === ''){
			$('#password').focus();
			alert("비밀번호를 입력하세요.")
			return false;
		}else if(regEmail.test(email) === false){
			$('#email').focus();
			alert("올바른 이메일 형식을 입력하세요.");
			return false;
		}else if(regPw.test(password) === false){
			$('#password').focus();
			alert("비밀번호는 5자이상 15자 이하입니다.");
			return false;	
					
		}else{
			alert("회원가입이 성공적으로 되었습니다.")
			document.getElementById("myForm").submit();
		}
	}
	 </script>
</body>
</html>