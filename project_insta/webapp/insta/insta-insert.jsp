<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<link href="/insta/assets/custom/css/preloader.css" property='stylesheet' rel="stylesheet" type="text/css" media="screen" />

<!-- JS -->
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="/insta/assets/vendor/animatedheader/js/modernizr.custom.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- CSS -->
<link href="/insta/assets/vendor/bootstrap/css/bootstrap.min.css" property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="/insta/assets/vendor/pe-icon-7-stroke/css/pe-icon-7-stroke.css" property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="/insta/assets/vendor/fontawesome/css/font-awesome.min.css" property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="/insta/assets/vendor/owl-carousel/assets/owl.carousel.css" property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="/insta/assets/custom/css/style.css?ver=1.9" property='stylesheet' rel="stylesheet" type="text/css" media="screen" />


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
			<!-- Page Content -->
			<section id="articles" class="">
				<div class="container">
					<div class="row">
					<form action="/searchName" method="post"> 
               <div class="col-md-5" ><input name="searchText" placeholder="검색 " id="searchText" ></div>
    			   <div> <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button></div>
    			   </form>	
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
									<textarea id="txt" name="txt" placeholder="설명을 입력 ... ( 해시태그는 #을 입력)" rows="7" cols="30" ></textarea>
								</div>
								<input type="hidden"  id="hashtag" name="hashtag">
								<div class="e-divider-1"></div>
								<div class="e-divider-2"></div>
								<!-- Google Map -->
										<div class="form-group">
										<input id="pac-input" class="controls" type="text" placeholder="사진의 위치를 지정하세요." name="searchGoogle">
											    <div id="map"></div>
										</div>
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
	
	<script type="text/javascript">

$(function() {
	var list = "${listName}";
	console.log("${listName}")
	var list2 = list.slice(0,-1);
	var list3 = list2.substring(1);
	var availableCity = list3.split(",");
	var trimAvailableCity = [];
	$.each(availableCity, function(i, v){
		trimAvailableCity.push(v.trim());
		//console.log(trimAvailableCity);
	}); 
	console.log(trimAvailableCity)
    $("#searchText").autocomplete({
        source: trimAvailableCity,
        select: function(event, ui) {
            
        },
        focus: function(event, ui) {
            return false;
            //event.preventDefault();
        }
    });
});
</script>
	
	
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
      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 37.48089, lng: 126.88257350000003},
          zoom: 15
        });
        var input = /** @type {!HTMLInputElement} */(
            document.getElementById('pac-input'));

        var types = document.getElementById('type-selector');
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map);

        var infowindow = new google.maps.InfoWindow();
        var marker = new google.maps.Marker({
          map: map,
          anchorPoint: new google.maps.Point(0, -29)
        });

        autocomplete.addListener('place_changed', function() {
          infowindow.close();
          marker.setVisible(false);
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
            window.alert("No details available for input: '" + place.name + "'");
            return;
          }

          // If the place has a geometry, then present it on a map.
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
          }
          marker.setIcon(/** @type {google.maps.Icon} */({
            url: place.icon,
            size: new google.maps.Size(71, 71),
            origin: new google.maps.Point(0, 0),
            anchor: new google.maps.Point(17, 34),
            scaledSize: new google.maps.Size(35, 35)
          }));
          marker.setPosition(place.geometry.location);
          marker.setVisible(true);

          var address = '';
          if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
          }

          infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
          infowindow.open(map, marker);
        });

        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
        function setupClickListener(id, types) {
          var radioButton = document.getElementById(id);
          radioButton.addEventListener('click', function() {
            autocomplete.setTypes(types);
          });
        }

        setupClickListener('changetype-all', []);
        setupClickListener('changetype-address', ['address']);
        setupClickListener('changetype-establishment', ['establishment']);
        setupClickListener('changetype-geocode', ['geocode']);
      }
    </script>
	<!-- JS -->
	<script src="/insta/assets/vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/insta/assets/vendor/animatedheader/js/classie.js"></script>
	<script src="/insta/assets/vendor/animatedheader/js/cbpAnimatedHeader.js"></script>
	<script src="/insta/assets/vendor/sticky-scroll/js/jquery.stickit.min.js" type="text/javascript"></script>
	<script src="/insta/assets/vendor/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
	<!-- Custom scripts -->
	<script src="/insta/assets/custom/js/script.js" type="text/javascript"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDd5qVqhzCXiTl4_8pGuLEdXEk6pWeMlgY&libraries=places&callback=initMap" async defer></script>

</body>
</html>
