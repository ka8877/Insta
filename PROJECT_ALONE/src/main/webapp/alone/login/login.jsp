<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html class="full">

<head>
    <title>Traveler - Login register</title>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="keywords" content="Template, html, premium, themeforest" />
    <meta name="description" content="Traveler - Premium template for travel companies">
    <meta name="author" content="Tsoy">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- GOOGLE FONTS -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600' rel='stylesheet' type='text/css'>
    <!-- /GOOGLE FONTS -->
    
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/font-awesome.css">
    <link rel="stylesheet" href="/css/icomoon.css">
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="stylesheet" href="/css/mystyles.css">
    <script src="/js/modernizr.js"></script>
	<style>
	.booking-item:hover, .booking-item.active{
	color: #737373;
    box-shadow: 0 2px 1px rgba(0,0,0,0.2);
	}
	
	</style>
	
</head>

<body class="full">

    <!-- /FACEBOOK WIDGET -->
    <div class="global-wrap">

        <div class="full-page">
            <div class="bg-holder full">
                <div class="bg-mask"></div>
                <div class="bg-img" style="background-image:url(/img/login.jpg);"></div>
                <div class="bg-holder-content full text-white">
                
                	<!-- home logo -->
                    <a class="logo-holder" href="index.html">
                        <img src="/img/logo.png" alt="Image Alternative text" title="Image Title" />
                    </a>
                    <div class="full-center">
                        <div class="container">
                            <div class="row row-wrap" data-gutter="60">
                                <div class="col-md-4">
                                    
                                </div>
                                <div class="col-md-4" style="text-align: center;">
                                    <h1 class="owl-cap-title fittext" style="font-size: 100px;">login</h1>
                                    <br>
                                    <br>
                                    <br>
                                    <form>
                                        <!-- <a class=" btn btn-lg animate-icon-border-fadeout" > -->
                                        <a class="booking-item btn btn-lg btn-danger" href="/oauthCode.do" style="border: 1px solid #ffffff;">
                                        	<i class="fa fa-google-plus" ></i> &emsp; | &emsp; &emsp;&emsp;&emsp;Sign in &emsp;&emsp;&emsp;&emsp;
                                        </a>
                                    </form>
                                </div>
                                <div class="col-md-4">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <ul class="footer-links">
                        
                    </ul>
                </div>
            </div>
        </div>



        <script src="/js/jquery.js"></script>
        <script type="text/javascript">
        $(document).ready(function() { 
			if("${disabled}" == 1){ 
				alert('계정을 비활성화 하셨습니다\n\n우린 널 거부한다 연락도 하지마');
			} 
        }); 
        
		</script>
        <script src="/js/bootstrap.js"></script>
        <script src="/js/slimmenu.js"></script>
        <script src="/js/bootstrap-datepicker.js"></script>
        <script src="/js/bootstrap-timepicker.js"></script>
        <script src="/js/nicescroll.js"></script>
        <script src="/js/dropit.js"></script>
        <script src="/js/ionrangeslider.js"></script>
        <script src="/js/icheck.js"></script>
        <script src="/js/fotorama.js"></script>
        <script src="/js/typeahead.js"></script>
        <script src="/js/card-payment.js"></script>
        <script src="/js/magnific.js"></script>
        <script src="/js/owl-carousel.js"></script>
        <script src="/js/fitvids.js"></script>
        <script src="/js/tweet.js"></script>
        <script src="/js/countdown.js"></script>
        <script src="/js/gridrotator.js"></script>
        <script src="/js/custom.js"></script>
        
        
    </div>
</body>

</html>


