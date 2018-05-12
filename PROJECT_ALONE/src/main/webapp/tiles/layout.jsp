<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE HTML>
<html>

<head>
    <title>ComeAlone</title>

    <meta content="text/html;charset=utf-8" http-equiv="Content-Type">
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
    <link rel="stylesheet" href="/css/mystyles.css?ver=0.2">
    
    <script src="/js/modernizr.js"></script>
</head>

<body>
    <!-- FACEBOOK WIDGET -->
    <div id="fb-root"></div>
    <script>
        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s);
            js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
    <!-- /FACEBOOK WIDGET -->
    <div class="global-wrap">
    
        <header id="main-header">
           <tiles:insertAttribute name="top" />
        </header>

        <div class="container">
           <tiles:insertAttribute name="body" />
        </div>

        <footer id="main-footer">
           <tiles:insertAttribute name="footer" />
        </footer>

        <script src="/js/jquery.js"></script>
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
        <script src="/js/custom.js?ver=0.1"></script>
    </div>
</body>
</html>