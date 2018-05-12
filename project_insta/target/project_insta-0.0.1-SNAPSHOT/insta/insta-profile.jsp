<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>Amber | The Blog Html5 Template</title>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name=viewport content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keywords" content="">

<link rel=icon href=favicon.ico sizes="16x16" type="image/png">

<!-- Preloader css must be first -->
<link href="assets/custom/css/preloader.css" property='stylesheet'
	rel="stylesheet" type="text/css" media="screen" />

<!-- JS -->
<script src="assets/vendor/animatedheader/js/modernizr.custom.js"></script>

<!-- CSS -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="assets/vendor/pe-icon-7-stroke/css/pe-icon-7-stroke.css"
	property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="assets/vendor/fontawesome/css/font-awesome.min.css"
	property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="assets/vendor/owl-carousel/assets/owl.carousel.css"
	property='stylesheet' rel="stylesheet" type="text/css" media="screen" />

<link href="assets/custom/css/style.css" property='stylesheet'
	rel="stylesheet" type="text/css" media="screen" />

</head>
<script>


</script>
<body class="boxed">

	<!--Pre-Loader-->
	<div id="preloader">
		<img src="assets/custom/images/preloader.gif" alt="01">
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
								<a href="index.html">instagram</a>
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
							<li><a href="#!">HOME</a></li>
							<li><a href="#!">SEARCH</a></li>
							<li><a href="#!">PHOTO</a></li>
							<li><a href="#!">NEWS FEED</a></li>
							<li><a href="#!">PROFILE</a></li>
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
				 <button img alt="" src="assets/custom/images/userpic05.jpg"
						class="avatar img-circle" data-target="#my_picture_name"
							data-toggle="modal"></button>
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
											<a href="/FileUploadServlet" style="text-decoration: none"><center>현재 사진 삭제</center></a>
										</h4>
									</div>
									<div class="modal-header">
										<h4 class="modal-title">
											<a href="/FileUploadServlet" style="text-decoration: none"><center>사진 업로드</center></a>
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
							
							
							
				</div>
				<div class="author-head">
					<h2 class="author-title">
						<span class="author-heading">god_guheon<a>&nbsp;&nbsp;
								<button type="button" class="btn btn-rose" style="text-decoration: none">프로필 편집</button>
						</a>
						</span>

						<button class="btn btn-default" data-target="#layerpop"
							data-toggle="modal">
							<img alt="" src="assets/custom/images/images.png" width="20">
						</button>
						<br>
						<div class="modal fade" id="layerpop">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header" div style="height: auto; width: 100%; border:1px solid skyblue;">
										<h4 class="modal-title">
											<a href="/ProfileServlet" style="text-decoration: none"><center>비밀번호변경</center></a>
										</h4>
									</div>
									<div class="modal-header">
										<h4 class="modal-title">
											<a href="/ProfileServlet" style="text-decoration: none"><center>허가된앱</center></a>
										</h4>
									</div>
									<div class="modal-header">
										<h4 class="modal-title">
											<a href="/ProfileServlet" style="text-decoration: none"><center>알림</center></a>
										</h4>
									</div>
									<div class="modal-body">
										<h4 class="modal-title">
											<a href="/ProfileServlet" style="text-decoration: none"><center>로그아웃</center></a>
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
						게시물: <a href="#!" class="meta-date" style="text-decoration: none">211</a>/&nbsp; 
						<!-- Button trigger modal -->
						<button class="btn btn-default" data-toggle="modal"
							data-target="#myModal" >팔로워:33</button>

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
									<div class="modal-body"></div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
						</a>/&nbsp; 
							<button class="btn btn-default" data-toggle="modal"
							data-target="#myModal2" >팔로우:28</button>

						<!-- Modal -->
						<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel2" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title2" id="myModalLabel2">팔로우</h4>
									</div>
									<div class="modal-body"></div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<h2 class="author-title">
						<span class="author-heading">임구헌</span>
					</h2>
					<hr>
					<center>
						<a href="#!" style="text-decoration: none">게시물</a> &nbsp;&nbsp;<a
							href="" style="text-decoration: none">저장됨</a>
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

								<article id="01"
									class="post-block col-md-4 post type-post status-publish format-standard has-post-thumbnail hentry">
									<div class="box">
										<div class="img-wrap">
											<a href="blog-post.html"> <img class="img-responsive"
												src="assets/custom/images/demo01/10.jpg" alt="">
											</a>
										</div>
									</div>
								</article>

								<article id="02" class="post-block col-md-4 post hentry">
									<div class="box">
										<div class="img-wrap">
											<div class="owl-carousel owl-theme">
												<div class="item">
													<img class="img-responsive"
														src="assets/custom/images/demo01/09.jpg" alt="01">
												</div>
												<div class="item">
													<img class="img-responsive"
														src="assets/custom/images/demo01/11.jpg" alt="01">
												</div>
												<div class="item">
													<img class="img-responsive"
														src="assets/custom/images/demo01/03.jpg" alt="01">
												</div>
												<div class="item">
													<img class="img-responsive"
														src="assets/custom/images/demo01/01.jpg" alt="01">
												</div>
											</div>
										</div>
									</div>
								</article>

								<article id="03" class="post-block col-md-4 post hentry">
									<div class="box">
										<div class="img-wrap">
											<div class="embed-responsive embed-responsive-16by9 vimeo"
												data-src="https://player.vimeo.com/video/134300640?color=ffffff&byline=0&portrait=0"
												data-width="640" data-height="268"></div>
										</div>
									</div>
								</article>

								<article id="04" class="post-block col-md-4 post hentry">
									<div class="box">
										<div class="img-wrap">
											<a href="blog-post.html"> <img class="img-responsive"
												src="assets/custom/images/demo01/03.jpg" alt="01">
											</a>
										</div>
									</div>
								</article>

								<article id="05" class="post-block col-md-4 post hentry">
									<div class="box">
										<div class="img-wrap">
											<div class="embed-responsive embed-responsive-16by9 youtube"
												data-width="560" data-height="315"
												data-src="https://www.youtube.com/embed/T0q-KnaheFE?rel=0&amp;controls=0&amp;showinfo=0"></div>
										</div>
									</div>
								</article>

								<article id="06" class="post-block col-md-4 post hentry">
									<div class="box">
										<div class="img-wrap soundcloud" data-width="560"
											data-height="166"
											data-src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/249027617&amp;color=ff5500&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false"></div>
									</div>
								</article>

								<article id="07" class="post-block col-md-4 post hentry">
									<div class="box">
										<div class="img-wrap">
											<a href="blog-post.html"><img class="img-responsive"
												src="assets/custom/images/demo01/03.jpg" alt="01"></a>
										</div>
									</div>
								</article>

								<article id="08" class="post-block col-md-4 post hentry">
									<div class="box">
										<div class="img-wrap">
											<a href="blog-post.html"><img class="img-responsive"
												src="assets/custom/images/demo01/08.jpg" alt=""></a>
										</div>
									</div>
								</article>

								<article id="09" class="post-block col-md-4 post hentry">
									<div class="box">
										<div class="img-wrap">
											<a href="blog-post.html"><img class="img-responsive"
												src="assets/custom/images/demo01/05.jpg" alt=""></a>
										</div>
									</div>
								</article>

								<article id="10" class="post-block col-md-4 post hentry">
									<div class="box">
										<div class="img-wrap">
											<a href="blog-post.html"><img class="img-responsive"
												src="assets/custom/images/demo01/09.jpg" alt=""></a>
										</div>
									</div>
								</article>

								<article id="11" class="post-block col-md-4 post hentry">
									<div class="box">
										<div class="img-wrap">
											<a href="blog-post.html"><img class="img-responsive"
												src="assets/custom/images/demo01/11.jpg" alt=""></a>
										</div>
									</div>
								</article>

								<article id="12" class="post-block col-md-4 post hentry">
									<div class="box">
										<div class="img-wrap">
											<a href="blog-post.html"><img class="img-responsive"
												src="assets/custom/images/demo01/07.jpg" alt=""></a>
										</div>
									</div>
								</article>
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
	<script src="assets/vendor/jquery/js/jquery-2.2.0.min.js"
		type="text/javascript"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="assets/vendor/animatedheader/js/classie.js"></script>
	<script src="assets/vendor/animatedheader/js/cbpAnimatedHeader.js"></script>
	<script src="https://maps.google.com/maps/api/js?sensor=false"
		type="text/javascript"></script>
	<script src="assets/vendor/sticky-scroll/js/jquery.stickit.min.js"
		type="text/javascript"></script>
	<script src="assets/vendor/owl-carousel/owl.carousel.min.js"
		type="text/javascript"></script>



	<!-- Custom scripts -->
	<script src="assets/custom/js/script.js" type="text/javascript"></script>

</body>
</html>
