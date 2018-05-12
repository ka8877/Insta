<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>costagram</title>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name=viewport content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keywords" content="">

<link rel=icon href=favicon.ico sizes="16x16" type="image/png">

<!-- Preloader css must be first -->
<link href="/insta/assets/custom/css/preloader.css"
	property='stylesheet' rel="stylesheet" type="text/css" media="screen" />

<!-- JS -->
<script src="/insta/assets/vendor/animatedheader/js/modernizr.custom.js"></script>

<!-- CSS -->
<link href="/insta/assets/vendor/bootstrap/css/bootstrap.min.css"
	property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link
	href="/insta/assets/vendor/pe-icon-7-stroke/css/pe-icon-7-stroke.css"
	property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="/insta/assets/vendor/fontawesome/css/font-awesome.min.css"
	property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="/insta/assets/vendor/owl-carousel/assets/owl.carousel.css"
	property='stylesheet' rel="stylesheet" type="text/css" media="screen" />

<link href="/insta/assets/custom/css/style.css" property='stylesheet'
	rel="stylesheet" type="text/css" media="screen" />

</head>
<style>
table.type03 {
	border-collapse: collapse;
	line-height: 1.5;
	border-top: none;
	border-left: none;
}

table.type03 th {
	width: 147px;
	padding: 10px;
	color: #153d73;
	border-right: none;
	border-bottom: none;
}

table.type03 td {
	width: 349px;
	padding: 10px;
	border-right: none;
	border-bottom: none;
}
</style>

<script>
function goPage(){
	var password = $('#password').val();
	var confirm1 = $('#confirm').val();

	var passVal = "${LVL_SESS_PASSWORD}"; 

	if(password != passVal){
       alert("비밀번호를 정확하게 입력해주세요.");
       password.focus();
    } else if(password!=confirm1) {
       alert("비밀번호가 일치하지 않습니다.");
       confirm1.focus();
       } else if(password === ''){
			$('#password').focus();
			alert("비밀번호를 입력하세요.")
			return false;
       }else if(confirm1 === ''){
				$('#confirm').focus();
				alert("비밀번호 확인을 입력하세요.")
				return false;
      } else if(confirm("정말 삭제하시겠습니까??")){
		myForm.method = "post";
        myForm.submit();
        alert("계정이 삭제되었습니다.");	
	}
	else{
		alert("삭제가 취소되었습니다."); //취소시 이벤트 처리
	}
    };

</script>

<body class="boxed">

	<!--Pre-Loader-->
	<div id="preloader">
		<img src="/insta/assets/custom/images/preloader.gif" alt="01">
	</div>
	<!--/Pre-Loader-->


	<!-- Content -->
	<div id="page-content-wrapper" class="content-wrap">

		<!-- Header -->
		<header class="cbp-af-header toggled">
			<div class="cbp-af-inner">
				<div class="navbar navbar-default" role="navigation">
					<div class="container">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<h1 class="text-center">
								<a href="/homeList">costagram</a>
							</h1>
							<div class="col-md-5">
								<p>
									<input class="newsletter-email" type="email" name="ne"
										placeholder="검색 ">
								</p>
							</div>
						</div>
					</div>
					<nav
						class="collapse navbar-collapse navbar-ex1-collapse e-centered">
						<!--<i class="nav-decor-left flaticon-christmas-rose"></i>-->
						<ul class="nav navbar-nav">
							     <li><a href="/homeList">HOME</a></li>
                           <li><a href="/searchList">SEARCH</a></li>
                           <li><a href="/insertContent">PHOTO</a></li>
                           <li><a href="/newfeedList">NEWS FEED</a></li>
                           <li><a href="/ProfileServlet">PROFILE</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
		<!-- / Header -->
		<!-- Content Sections -->
		<div id="content">

			<!--Author-info-->
			<section class="author-info">
				<div class="author-avatar">
					<form name="myForm" class="myForm" action="/MemberDeleteServlet2"
						method="post">
						<center>
							<table class="type03" width="100" height="100" border="1"
								cellpadding="0" cellspacing="0" style="width: 559px;">

								<tr>
									<th>비밀번호 입력</th>
									<th><input type="password" name="password" id="password"></th>
								</tr>
								<tr>
									<th>비밀번호 확인</th>
									<td><input type="password" name="confirm" id="confirm">
									</th>
								</tr>

								<tr>
									<th colspan="2" align="center">
										<center>
											<button class="btn btn-danger" type="button"
												onclick="goPage()" id="dd">회원탈퇴</button>
										</center>
								</tr>
							</table>
						</center>
					</form>
				</div>
			</section>
			<br>
			<!-- Author-info -->

			<!-- Post Feed -->

			<!-- /Post Feed -->

			<!-- Back to Top -->
			<div id="back-top">
				<a href="#top"></a>
			</div>
			<!-- /Back to Top -->
		</div>
		<!-- /Content -->

	</div>


	<div id="image-cache" class="hidden"></div>


	<!-- JS -->
	<script src="/insta/assets/vendor/jquery/js/jquery-2.2.0.min.js"
		type="text/javascript"></script>
	<script src="/insta/assets/vendor/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="/insta/assets/vendor/animatedheader/js/classie.js"></script>
	<script
		src="/insta/assets/vendor/animatedheader/js/cbpAnimatedHeader.js"></script>
	<script
		src="/insta/assets/vendor/sticky-scroll/js/jquery.stickit.min.js"
		type="text/javascript"></script>
	<script src="/insta/assets/vendor/owl-carousel/owl.carousel.min.js"
		type="text/javascript"></script>



	<!-- Custom scripts -->
	<script src="/insta/assets/custom/js/script.js" type="text/javascript"></script>

</body>
</html>
