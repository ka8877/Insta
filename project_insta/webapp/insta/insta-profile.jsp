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
<link href="/insta/assets/custom/css/preloader.css" property='stylesheet'
	rel="stylesheet" type="text/css" media="screen" />

<!-- JS -->
<script src="/insta/assets/vendor/animatedheader/js/modernizr.custom.js"></script>

<!-- CSS -->
<link href="/insta/assets/vendor/bootstrap/css/bootstrap.min.css"
	property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="/insta/assets/vendor/pe-icon-7-stroke/css/pe-icon-7-stroke.css"
	property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="/insta/assets/vendor/fontawesome/css/font-awesome.min.css"
	property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="/insta/assets/vendor/owl-carousel/assets/owl.carousel.css"
	property='stylesheet' rel="stylesheet" type="text/css" media="screen" />

<link href="/insta/assets/custom/css/style.css?ver=1.6" property='stylesheet'
	rel="stylesheet" type="text/css" media="screen" />

</head>


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
				<div class="author-avatar" >
				 <div class="avatar img-circle" data-target="#my_picture_name" data-toggle="modal" >
				        <img src="/insta/instaImage/${pvo.myPictureName}"  width="100%" alt="이미지를 로딩중 입니다."></div>
							<br>
							<div class="modal fade" id="my_picture_name">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header" div style="height: auto; width: 100%; border:1px solid skyblue;">
										<h4 class="modal-title">
											<span style="color:#A5A095" ><center>프로필 사진 바꾸기</center></span>
										</h4>
									</div>
									
									<div class="modal-header">
										<h4 class="modal-title">
											<a href="/insertProfile" style="text-decoration: none"> <center>현재 사진 삭제</center></a>
										</h4>
									</div>
										<form name = "inputForm" id="inputForm" action = "/insertProfile" method = "post" enctype="multipart/form-data">
									<div class="modal-header">
										<h4 class="modal-title">
											<a style="text-decoration: none" onclick="document.all.file.click()"> <center>사진 업로드</center></a>
											<input type="file" name="file" id="my_file_name" style="display: none;"/>
											
										</h4>
									</div>
											</form>
									<div class="modal-footer">
										<h4 class="modal-title" data-dismiss="modal">
											<a href="blog-profile.html" style="text-decoration: none"><center>취소</center></a>
										</h4>
									</div>
								</div>
							</div>
						</div>
									
							
				</div>
				<div class="author-head">
					<h2 class="author-title">
						<span class="author-heading">${LVL_SESS_USERNAME}<a>&nbsp;&nbsp;
								<a href="/ProfileServlet?ACTIONSTR=PROFILE" class="btn btn-rose" style="text-decoration: none"> 프로필 편집</button>
						</a>
						</span>
							
						<button class="btn btn-default" data-target="#layerpop"
							data-toggle="modal">
							<img src="/insta/assets/custom/images/option.png" width="20">
						</button>
						<br>
						<div class="modal fade" id="layerpop">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header" div style="height: auto; width: 100%; border:1px solid skyblue;">
										<h4 class="modal-title">
											<a href="/ProfileServlet?ACTIONSTR=PASSWORD" style="text-decoration: none"><center>비밀번호변경</center></a>
										</h4>
									</div>
									<div class="modal-header">
										<h4 class="modal-title">
											<a href="/ProfileServlet?ACTIONSTR=MEMDELETE" style="text-decoration: none"><center>회원탈퇴</center></a>
										</h4>
									</div>
									<div class="modal-header">
										<h4 class="modal-title">
											<a href="/ProfileServlet?ACTIONSTR=LIST" style="text-decoration: none"><center>알림</center></a>
										</h4>
									</div>
									<div class="modal-body">
										<h4 class="modal-title">
											<a href="/instaLogin" style="text-decoration: none"><center>로그아웃</center></a>
										</h4>
									</div>
									<div class="modal-footer">
										<h4 class="modal-title" data-dismiss="modal">
											<a href="blog-profile.html" style="text-decoration: none"><center>취소</center></a>
										</h4>
									</div>
								</div>
							</div>
						</div>
						
					</h2>
					<div class="metas">
						게시물: <a class="meta-date" style="text-decoration: none">${count}</a>/&nbsp; 
						<!-- Button trigger modal -->
						<a data-toggle="modal"
							data-target="#myModal" >팔로워:${requesterCnt }</a>

						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">팔로워</h4>
									</div>
									<c:forEach items="${requesterList }" var="r">
									<div class="modal-body">
	                                    <span class="meta-date">${r.memberName } 님과 ${r.regdate } 에 팔로워 하기 시작했습니다.</span>
									</div>
									</c:forEach>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
						</a>/&nbsp; 
							<a data-toggle="modal"
							data-target="#myModal2" >팔로우:${followerCnt }</a>

						<!-- Modal -->
						<div class="modal fade2" id="myModal2" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel2" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
										</button>
											<h4 class="modal-title" id="myModalLabel">팔로우</h4>
									</div>
									<c:forEach items="${followerList }" var="f">
									<div class="modal-body">
	                                    <span class="meta-date">${f.memberName } 님과 ${f.regdate } 에 팔로우 하기 시작했습니다.</span>
									</div>
									</c:forEach>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<h2 class="author-title">
						<span class="author-heading"> &nbsp;&nbsp;</span>
					</h2>
					<hr>
					<center>
						<a href="#!" style="text-decoration: none">게시물</a> &nbsp;&nbsp;
					</center>

				</div>
			</section>
			<br>
			<!-- Author-info -->

			<!-- Post Feed -->
			<section id="articles" class="post-grid">
				<div class="container">
					<div class="row no-sidebar">

						<!--Content Column-->
						<div class="col-md-12 flex">
							<div class="row row-flex row-flex-wrap">
								<c:forEach items="${list}" var="v">
								<article id="01"
									class="post-block col-md-4 post type-post status-publish format-standard has-post-thumbnail hentry">
									<div class="box">
										<div class="img-wrap">
											<a href="/searchDetail?cseq=${v.cseq}"> <img class="img-responsive"
												src="/insta/instaImage/${v.fileName}" alt="이미지를 불러올수 없습니다.">
												
											</a>
										</div>
									</div>
								</article>
								</c:forEach>
							</div>
						</div>
						<!--/Content Column-->
					</div>
				</div>
			</section>
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
		<script>
	$(function(){
		$("#my_file_name").click(function(){

			$("input:file").change(function() {
				var file = $(this).val();
				if(file != null ){
					
				  $("#inputForm").submit();
				} else {
					alert("파일을 선택하세요");
				}
				});

			
		});
	});

</script>
	<script src="/insta/assets/vendor/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="/insta/assets/vendor/animatedheader/js/classie.js"></script>
	<script src="/insta/assets/vendor/animatedheader/js/cbpAnimatedHeader.js"></script>
	<script src="/insta/assets/vendor/sticky-scroll/js/jquery.stickit.min.js"
		type="text/javascript"></script>
	<script src="/insta/assets/vendor/owl-carousel/owl.carousel.min.js"
		type="text/javascript"></script>



	<!-- Custom scripts -->
	<script src="/insta/assets/custom/js/script.js" type="text/javascript"></script>

</body>
</html>
