<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>costagram</title>
   <meta charset="UTF-8">
   <meta name=viewport content="width=device-width, initial-scale=1">

   <link rel=icon href=favicon.ico sizes="16x16" type="image/png">

   <!-- Preloader css must be first -->

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
<body class="boxed">

<!--Pre-Loader-->
<div id="preloader"><img src="/insta/assets/custom/images/preloader.gif" alt="01"></div>
<!--/Pre-Loader-->

   <!-- Content -->
   <div id="page-content-wrapper" class="content-wrap">

      <!-- Header -->
      <header class="cbp-af-header toggled">
         <div class="cbp-af-inner">
            <div class="navbar navbar-default" role="navigation">
               <div class="container">
                  <!-- Brand and toggle get grouped for better mobile display -->
                  <div class="navbar-header"  >
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
         <!-- Post Feed -->
         <section id="articles" class="">
            <div class="container">
               <div class="row no-sidebar">	
               <form action="/searchName" method="post"> 
               <div class="col-md-5" ><input name="searchText" placeholder="검색 " id="searchText" ></div>
    			   <div> <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button></div>
    			   </form>		
                  <!--Content Column-->
                  <div class="col-md-12">
                     <div class="row">
                        <article id="01" class="post-block col-md-12 post hentry">
                           <div class="post-detail">
                              <div class="metas">
                                 Posted on: <a class="meta-date">${vo.regdate }</a>/&nbsp;
                                 Posted by: <a href="/searchName?searchText=${vo.mseq }" class="meta-author">${vo.memberName }</a>/&nbsp;
                                  location : <a class="meta-comment">${vo.location }</a>
                                 
                                 <form action="/searchHashtag" method="post"  id="hashtagForm">
                              <input type="hidden" id="aHashtag"  name="aHashtag">
                                 <c:forEach items="${hashtags}" var="hashtag" varStatus="sts">
                                 <div class="meta-cat">
                                 <a rel="category tag" class="hashAhref"  id="${hashtag}" >${hashtag }&nbsp;</a>
                              </div>
                              </c:forEach>
                              </form>
                              
                              </div>
                           </div>
                           <div class="img-wrap">
                                 <img class="img-responsive" src="/insta/instaImage/${vo.fileName }" alt="이미지 로딩이 안됐습니다.">
                           </div>
                           <div class="post-excerpt">
                              <p>${vo.con }</p>
                           </div>
                           <div class="">
                              <a class="btn btn-default tf-btn txt-link btn-rose-str"  onclick="showComment()" id="show">댓글보기</a>
                              <a class="btn btn-default tf-btn txt-link btn-rose-str"  onclick="hideComment()" style="display: none;" id="hide">댓글닫기</a>
                           </div>
                           <div id="comment" style="display: none;">
                          <c:forEach items="${replyList }" var="rList">
                           <span style="font-weight:bold">${rList.memberName }</span> : <span>${rList.replyCon }</span>
                           <span style="cursor: pointer; color: red;" onclick="location='/replyDelete?rseq=${rList.rseq}&cseq=${vo.cseq }'" title="댓글 삭제">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;X</span>
                           <br>
                           </c:forEach>
                           <form action="/replyInsert" method="post">
                           <input type="text" placeholder="댓글 달기...." style="width:400px; height: 30px;" id="replyCon" name="replyCon">
                           <input type="hidden" value="${vo.cseq }" id="cseq" name="cseq">
                           <input type="hidden" value="detailReply" name="kang" id="kang">
                           </form>
                           </div>
                        </article>
                     </div>
                  </div>

                  <!--/Content Column-->
                  
               </div>
            </div>
         </section>
         <!-- /Post Feed -->
      </div>
      <!-- /Content Sections -->

       <!-- Back to Top -->
       <div id="back-top"><a href="#top"></a></div>
       <!-- /Back to Top -->

   </div>
   <!-- /Content -->
<div id="image-cache" class="hidden"></div>

<script>
function showComment() {
	$("#comment").show();
	$("#show").hide();
	$("#hide").show();
}
</script>
<script>
function hideComment() {
	$("#comment").hide();
	$("#show").show();
	$("#hide").hide();
}
</script>

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

<script >
$('.hashAhref').click(function() { 
	var tagValue = $(this).attr("id");
	//alert(tagValue);
	$('#aHashtag').val(tagValue);
	$('#hashtagForm').submit();
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
