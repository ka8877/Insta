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
	input[type=submit] {
  background-color: #0693cd;
  border: 0;
  border-radius: 5px;
  cursor: pointer;
  color: #fff;
  font-size:16px;
  font-weight: bold;
  line-height: 1.4;
  padding: 10px;
  width: 180px
}
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
function goPage(prm1, prm2) {

	myForm.ACTIONSTR.value = prm1;
	myForm.method = prm2;
	/*if(prm == "LIST") {
		myForm.method = "get";
	else
		myForm.method = "post";*/
		myForm.submit();
}
	
	
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
						</div>
					</div>
					<div class="container">
						<div class="bordered">
							<!-- Collect the nav links, forms, and other content for toggling -->
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
				</div>
			</div>
		</header>
		<!-- / Header -->
		<!-- Content Sections -->
		<div id="content">

			<!--Author-info-->
			<section class="author-info">
				<div class="author-avatar">
				<form name="myForm" class="myForm" action="/ProfileServlet?ACTIONSTR=UPDATE" method="post">
				
					<center><table class="type03" width="500" border="1" cellpadding="0" cellspacing="0" style="width: 559px; ">
						<tr>
							<th>이름</th>
							<th><input type="text" name="name" value="${vo.name}"></th>
						</tr>
						<tr>
							<th>사용자이름</th>
							<th><input type="text" name="username" value="${vo.userName}"></th>
						</tr>
						<tr>
							<th>웹사이트</th>
							<th><input type="text" name="website" value="${vo2.website}"></th>
						</tr>
						<tr>
							<th>소개</th>
							<th><textarea name="intro" rows="5" cols="50" >${vo2.intro}
							</textarea>
							</th>
						</tr>
						
						<tr>
							<th>이메일</th>
							<th><input type="text" name="email" value="${vo.email}"></th>
						</tr>
						<tr>
							<th>전화번호</th>
							<th><input type="text" name="phone"></th>
						</tr>
						<tr>
							<th>성별</th>
							<td><select name="gender" >
									<option value="notting">선택 안 함</option>
									<option value="male">남성</option>
									<option value="female">여성</option>
							</select></th>
						</tr>
						<tr>
						  <th colspan="2" align="center">
							<center><input type="submit" id=uptbtn value="제출"></center>
							</th>
						</tr>
						</table></center>
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
