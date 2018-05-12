<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Highdmin - Responsive Bootstrap 4 Admin Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <!--venobox lightbox-->
        <link rel="stylesheet" href="/css/magnific-popup.css"/>
        
	    
        <!-- App css -->
        <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="/css/style.css" rel="stylesheet" type="text/css" />

        <script src="/js/modernizr.min.js"></script>

		 <!-- GOOGLE FONTS -->
	    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet' type='text/css'>
	    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600' rel='stylesheet' type='text/css'>
	    <link rel="stylesheet" href="/css/font-awesome.css">
	    
    </head>

    <body style="margin-bottom: 0px;padding-bottom: 0px;">
        <div class="wrapper" style="margin-right:auto;margin-left:auto;background-color:#737373;padding-top: 0px;">
	        <!-- <div class="row">
	        	<div class="col-lg-12 col-md-12 col-sm-12">
					<h1 class="display-1" style="text-align:center;font-family:'Roboto', arial, helvetica, sans-serif;color:white;">Display 1<br><br></h1>
					
				</div>
            </div> -->

                <!-- SECTION FILTER
                        ================================================== -->
                        <!-- 
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 ">
                                <div class="portfolioFilter text-center gallery-second">
                                    <a href="#" data-filter="*" class="current">All</a>
                                    <a href="#" data-filter=".webdesign">Web Design</a>
                                    <a href="#" data-filter=".graphicdesign">Graphic Design</a>
                                    <a href="#" data-filter=".illustrator">Illustrator</a>
                                    <a href="#" data-filter=".photography">Photography</a>
                                </div>
                            </div>
                        </div>
						 -->
                        <div class="port" style="width:100%;background-color:black;padding-top:8%;padding-right:5%;padding-left:5%;padding-bottom: 10%;margin-bottom: 0%;">
                            <div class="portfolioContainer">
                            	
                                <div class="col-sm-6 col-md-4">
                                    <a href="/recommend.do">
                                        <div class="portfolio-masonry-box">
                                            <div class="portfolio-masonry-img" >
                                            <div style="transform: translate(50%,50%);">
                                                <img  src="/img/일정추천-edit.png" class="thumb-img" alt="work-thumbnail" align="middle" style="height: auto;transform: translate(-50%,-50%);">
                                            </div>
                                            </div>
                                            <div class="portfolio-masonry-detail">
                                                <h4 class="font-18">일정 추천</h4>
                                                <p>Schedule recommendation</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>

                                <div class="col-sm-6 col-md-4">
                                    <a href="/eventList.do">
                                        <div class="portfolio-masonry-box">
                                            <div class="portfolio-masonry-img" >
                                                <img src="/img/세부일정관리.png" class="thumb-img img-fluid" alt="work-thumbnail" >
                                            </div>
                                            <div class="portfolio-masonry-detail">
                                                <h4 class="font-18">세부 일정 관리</h4>
                                                <p>Detailed schedule management</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
								
                                <div class="col-sm-6 col-md-4">
                                    <a href="/hot_spot_list.do" >
                                        <div class="portfolio-masonry-box" >
                                            <div class="portfolio-masonry-img">
                                            	<div style="transform: translate(50%,50%);">
                                                	<img src="/img/관광지추천-edit.png" class="thumb-img" alt="work-thumbnail" style="height: auto;transform: translate(-50%,-50%);">
                                           		</div>
                                            </div>
                                            <div class="portfolio-masonry-detail">
                                                <h4 class="font-18">관광지 정보</h4>
                                                <p>Tourist Destination Information</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
								
                                <div class="col-sm-6 col-md-4">
                                    <a href="/community/main.do" >
                                        <div class="portfolio-masonry-box">
                                            <div class="portfolio-masonry-img">
                                            <div style="transform: translate(50%,50%);">
                                                <img src="/img/커뮤니티-edit.png" class="thumb-img" alt="work-thumbnail" style="height: auto;transform: translate(-50%,-50%);">
                                            </div>
                                            </div>
                                            <div class="portfolio-masonry-detail">
                                                <h4 class="font-18">커뮤니티</h4>
                                                <p>Community</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>

                                <div class="col-sm-6 col-md-4">
                                    <a href="/profile.do" >
                                        <div class="portfolio-masonry-box">
                                            <div class="portfolio-masonry-img">
                                                <img src="/img/마이페이지.png" class="thumb-img img-fluid" alt="work-thumbnail" >
                                            </div>
                                            <div class="portfolio-masonry-detail">
                                                <h4 class="font-18">마이 페이지</h4>
                                                <p>My Page</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>

                                <div class="col-sm-6 col-md-4">
                                    <a href="/hot_spot_scrap_page.do" >
                                        <div class="portfolio-masonry-box">
                                            <div class="portfolio-masonry-img">
                                                <img src="/img/스크랩.png" class="thumb-img img-fluid" alt="work-thumbnail">
                                            </div>
                                            <div class="portfolio-masonry-detail">
                                                <h4 class="font-18">스크랩</h4>
                                                <p>Scrap List</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>

                            </div>
                        </div> <!-- End row -->

            <!-- </div> --> <!-- end container -->
        </div>
        <!-- end wrapper -->


        <!-- jQuery  -->
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="/js/popper.min.js"></script>
        <script src="/js/bootstrap.min.js"></script>
        <script src="/js/waves.js"></script>
        <script src="/js/nicescroll.js"></script>

        <script type="text/javascript" src="/js/isotope.pkgd.min.js"></script>
        <script type="text/javascript" src="/js/jquery.magnific-popup.min.js"></script>

        <!-- App js -->
        <script src="/js/jquery.core.js"></script>
        <script src="/js/jquery.app.js"></script>

        <script type="text/javascript">
            $(window).on('load', function () {
                var $container = $('.portfolioContainer');
                $container.isotope({
                    filter: '*',
                    animationOptions: {
                        duration: 750,
                        easing: 'linear',
                        queue: false
                    }
                });

                $('.portfolioFilter a').click(function(){
                    $('.portfolioFilter .current').removeClass('current');
                    $(this).addClass('current');

                    var selector = $(this).attr('data-filter');
                    $container.isotope({
                        filter: selector,
                        animationOptions: {
                            duration: 750,
                            easing: 'linear',
                            queue: false
                        }
                    });
                    return false;
                });
            });
            $(document).ready(function() {
                $('.image-popup').magnificPopup({
                    type: 'image',
                    closeOnContentClick: true,
                    mainClass: 'mfp-fade',
                    gallery: {
                        enabled: true,
                        navigateByImgClick: true,
                        preload: [0,1] // Will preload 0 - before current, and 1 after the current image
                    }
                });
            });
        </script>
		
    </body>
</html>