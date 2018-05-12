<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>insta</title>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name=viewport content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keywords" content="">

<link rel=icon href=favicon.ico sizes="16x16" type="image/png">

<!-- Preloader css must be first -->
<link href="/insta/assets/custom/css/preloader.css" property='stylesheet' rel="stylesheet" type="text/css" media="screen" />

<!-- JS -->
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="/insta/assets/vendor/animatedheader/js/modernizr.custom.js"></script>

<!-- CSS -->
<link href="/insta/assets/vendor/bootstrap/css/bootstrap.min.css" property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="/insta/assets/vendor/pe-icon-7-stroke/css/pe-icon-7-stroke.css" property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="/insta/assets/vendor/fontawesome/css/font-awesome.min.css" property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="/insta/assets/vendor/owl-carousel/assets/owl.carousel.css" property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="/insta/assets/custom/css/style.css" property='stylesheet' rel="stylesheet" type="text/css" media="screen" />



</head>
<body class="boxed single-post single-format-standard">

	<!--Pre-Loader-->
	<div id="preloader">
		<img src="/insta/assets/custom/images/preloader.gif" alt="01">
	</div>
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
							<form action="/searchName" method="post">
								<div class="col-md-5">
									<input name="searchText" placeholder="검색 " id="searchText">
								</div>
								<div>
									<button type="submit" class="btn btn-primary">
										<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
									</button>
								</div>
							</form>
						</div>
					</div>
					<div class="container">
						<div class="bordered">
							<!-- Collect the nav links, forms, and other content for toggling -->
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
				</div>
			</div>
		</header>
		<!-- / Header -->

		<!-- Content Sections -->
		<div id="content">
			<!-- Page Content -->
			<section id="articles" class="">
				<div class="container">
					<div class="row">
						<article id="01" class="page-block col-md-12 page hentry">
							<div class="e-divider-2"></div>
							<div class="e-divider-6"></div>
							<div class="inner-content"></div>
							<div class="page-detail text-center">
								<h2 class="entry-title page-title">
									<a href="#!">사진 등록</a>
								</h2>
							</div>
							<div class="e-divider-6"></div>
							<div class="inner-content"></div>
						</article>
					</div>
				</div>
			</section>
			<!-- /Page Content -->

			<!-- Feedback Block -->
			<section id="feedback-block" class="e-block-null text-center">
				<div class="container padding-side-60">
					<div class="row">
						<div class="col-md-12 e-centered">
							<div class="e-divider-2"></div>
							<div id="form-messages"></div>
							
							<form method="POST" name="f" action="/insertContent" class="wpcf7-form" enctype="multipart/form-data">
								<div class="e-divider-1"></div>
								<div class="field">
									<textarea id="txt" name="txt" placeholder="설명을 입력 ... ( 해시태그는 #을 입력)" rows="7" cols="30" required></textarea>
								</div>
								<input type="hidden"  id="hashtag" name="hashtag">
								<div class="e-divider-1"></div>
								<div class="e-divider-2"></div>
								<!-- Google Map -->
										<div id="map" style="height: 500px"></div>
								<!-- /Google Map -->
								<div class="e-divider-1"></div>
								<div class="e-divider-2"></div>
								<!-- 사진 업로드 -->

								<div class="filebox bs3-primary preview-image">
									<input class="upload-name" value="파일선택" disabled="disabled"  style="width: 200px;" name="upload-name"> 
									<label for="input_file" >업로드</label>
									<input type="file" id="input_file" name="input_file" class="upload-hidden">
								</div>
								
								<div class="e-divider-1"></div>
								<div class="e-divider-2"></div>
								<!--/사진 등록  -->
								<div class="field text-center">
									<button class="btn btn-lg btn-blk" id="getTag" type="submit">사진 올리기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="e-divider-6"></div>
			</section>
			<!-- /Feedback Block -->
		</div>
		<!-- /Content Sections -->
		<!-- Back to Top -->
		<div id="back-top">
			<a href="#top"></a>
		</div>
		<!-- /Back to Top -->
	</div>
	<!-- /Content -->
	<div id="image-cache" class="hidden"></div>
	
	<script>
		$(document)
				.ready(
						function() {
							var fileTarget = $('.filebox .upload-hidden');
							fileTarget.on('change', function() {
								if (window.FileReader) {
									// 파일명 추출
									var filename = $(this)[0].files[0].name;
								}
								else {
									// Old IE 파일명 추출
									var filename = $(this).val().split('/')
											.pop().split('\\').pop();
								}
								;
								$(this).siblings('.upload-name').val(filename);
							});
							//preview image 
							var imgTarget = $('.preview-image .upload-hidden');
							imgTarget
									.on(
											'change',
											function() {
												var parent = $(this).parent();
												parent.children(
														'.upload-display')
														.remove();
												if (window.FileReader) {
													//image 파일만
													if (!$(this)[0].files[0].type
															.match(/image\//))
														return;
													var reader = new FileReader();
													reader.onload = function(e) {
														var src = e.target.result;
														parent
																.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
													}
													reader
															.readAsDataURL($(this)[0].files[0]);
												}
												else {
													$(this)[0].select();
													$(this)[0].blur();
													var imgSrc = document.selection
															.createRange().text;
													parent
															.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

													var img = $(this).siblings(
															'.upload-display')
															.find('img');
													img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
															+ imgSrc + "\")";
												}
											});
						});
	</script>
	
	<script type="text/javascript">
	$("#getTag").on("click", function() {
	  var txt = $("#txt").val();
	  var tags = [];
	  txt = txt.replace(/#[^#\s,;]+/gm, function(tag) {
	    tags.push(tag);
	  });
	  $("#hashtag").val(tags);
	});
</script>

 <script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 37.48089, lng: 126.88257350000003},
          zoom: 15
        });
      }
    </script>
	<!-- JS -->
	  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCAl3t-PlgHHhw0c3FWFk9P8kWawtsHVDE&callback=initMap" async defer></script>
	<script src="/insta/assets/vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/insta/assets/vendor/animatedheader/js/classie.js"></script>
	<script src="/insta/assets/vendor/animatedheader/js/cbpAnimatedHeader.js"></script>
	<script src="/insta/assets/vendor/sticky-scroll/js/jquery.stickit.min.js" type="text/javascript"></script>
	<script src="/insta/assets/vendor/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
	<!-- Custom scripts -->
	<script src="/insta/assets/custom/js/script.js" type="text/javascript"></script>

</body>
</html>
