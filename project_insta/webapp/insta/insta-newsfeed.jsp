<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
   <link href="/insta/assets/custom/css/preloader.css" property='stylesheet' rel="stylesheet" type="text/css" media="screen"/>

   <!-- JS -->
   <script src="/insta/assets/vendor/animatedheader/js/modernizr.custom.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <!-- CSS -->
   <link href="/insta/assets/vendor/bootstrap/css/bootstrap.min.css" property='stylesheet' rel="stylesheet" type="text/css" media="screen"/>
   <link href="/insta/assets/vendor/pe-icon-7-stroke/css/pe-icon-7-stroke.css" property='stylesheet' rel="stylesheet" type="text/css" media="screen"/>
   <link href="/insta/assets/vendor/fontawesome/css/font-awesome.min.css" property='stylesheet' rel="stylesheet" type="text/css" media="screen"/>
   <link href="/insta/assets/vendor/owl-carousel/assets/owl.carousel.css" property='stylesheet' rel="stylesheet" type="text/css" media="screen"/>

   <link href="/insta/assets/custom/css/style.css" property='stylesheet' rel="stylesheet" type="text/css" media="screen"/>
</head>
<body class="boxed single-post single-format-standard">

<!--Pre-Loader-->
<div id="preloader"><img src="/insta/assets/custom/images/preloader.gif" alt="01"></div>
   <!-- Content -->
   <div id="page-content-wrapper" class="content-wrap">

    <!-- Header -->
    <header class="cbp-af-header toggled">
         <div class="cbp-af-inner">
            <div class="navbar navbar-default" role="navigation">
               <div class="container">
                  <!-- Brand and toggle get grouped for better mobile display -->
                  <div class="navbar-header">
                     <h1 class="text-center"><a href="/homeList">costagram</a></h1>
                  </div>
               </div>
               <div class="container">
                  <div class="bordered">
                     <!-- Collect the nav links, forms, and other content for toggling -->
                        <nav class="collapse navbar-collapse navbar-ex1-collapse e-centered">
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
         <!-- Articles -->
                     <div class="container">
                     <form action="/searchName" method="post"> 
               		 <div class="col-md-5" ><input name="searchText" placeholder="검색 " id="searchText" ></div>
    			     <div> <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button></div>
    			   </form>	
                  <div class="bordered">
                      <!--Resent Posts Widget-->
                        <div class="e-divider-3"></div>
                        <aside id="resent-widget" class="widget widget_recent_post">
                           <div class="title widget-title center"  >&emsp;&emsp;&emsp;팔로우</div>
                           <div>
                           <c:forEach items="${list }" var="f">
                           <section class="author-info">
                           <div class="author-avatar" >
						 <div class="avatar img-circle" >
				        <img src="/insta/instaImage/${f.myPictureName}"  width="100%" alt="이미지를 로딩중..."></div>
                                 <div class="media-body">
                                    <h4 class="media-heading">
                                       <a href="/searchName?searchText=${f.requesterSeq }">회원 님이 ${f.memberName } 님을 팔로우 하였습니다. ${f.regdate }</a>
                                    </h4>
                                 </div>
                              </div>
                              </section>
                              </c:forEach>
                           </div>
                           <div class="clearfix"></div>
                        </aside>
                        <!--/Resent Posts Widget-->
                  </div>
               </div>
         <!-- /Articles -->
         
      <!-- footer -->
      <!-- /footer -->

       <!-- Back to Top -->
       <div id="back-top"><a href="#top"></a></div>
       <!-- /Back to Top -->

   </div>
   <!-- /Content -->
</div>

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

<!-- JS -->
<script src="/insta/assets/vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/insta/assets/vendor/animatedheader/js/classie.js"></script>
<script src="/insta/assets/vendor/animatedheader/js/cbpAnimatedHeader.js"></script>
<script src="/insta/assets/vendor/sticky-scroll/js/jquery.stickit.min.js" type="text/javascript"></script>
<script src="/insta/assets/vendor/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
<!-- Custom scripts -->
	<script src="/insta/assets/custom/js/script.js" type="text/javascript"></script>

</body>
</html>
