<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원정보 상세보기</title>
<!-- 
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/shortcodes.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/jquery.sidr.custom.css">
-->

<!-- Full Calender CSS -->
<link href="/insta/resources/css/fullcalendar.css" rel="stylesheet">
<!-- Owl Carousel CSS -->
<link href="/insta/resources/css/owl.carousel.css" rel="stylesheet">
<!-- Pretty Photo CSS -->
<link href="/insta/resources/css/prettyPhoto.css" rel="stylesheet">
<!-- Bx-Slider StyleSheet CSS -->
<link href="/insta/resources/css/jquery.bxslider.css" rel="stylesheet">
<!-- Font Awesome StyleSheet CSS -->
<link href="/insta/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/insta/resources/svg/style.css" rel="stylesheet">
<!-- Widget CSS -->
<link href="/insta/resources/css/widget.css" rel="stylesheet">
<!-- Typography CSS -->
<link href="/insta/resources/css/typography.css" rel="stylesheet">

<!-- Custom Main StyleSheet CSS -->
<link href="/insta/resources/css/style.css" rel="stylesheet">
<!-- Color CSS -->
<link href="/insta/resources/css/color.css" rel="stylesheet">
<!-- Responsive CSS -->
<link href="/insta/resources/css/responsive.css" rel="stylesheet">
<!-- SELECT MENU -->
<link href="/insta/resources/css/selectric.css" rel="stylesheet">

<!-- TABLE STYLES-->
<link href="/insta/resources/report/bootstrap.css" rel="stylesheet" />
<link href="/insta/resources/report/font-awesome.css" rel="stylesheet" />
<link href="/insta/resources/report/custom.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link href="/insta/resources/report/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />
<link rel=icon href=favicon.ico sizes="16x16" type="image/png">
<!-- Preloader css must be first -->
<link href="/insta/assets/custom/css/preloader.css" property='stylesheet'
	rel="stylesheet" type="text/css" media="screen" />

<!-- CSS -->
<link href="/insta/assets/vendor/bootstrap/css/bootstrap.min.css"
	property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="/insta/assets/vendor/pe-icon-7-stroke/css/pe-icon-7-stroke.css"
	property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="/insta/assets/vendor/fontawesome/css/font-awesome.min.css"
	property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="/insta/assets/vendor/owl-carousel/assets/owl.carousel.css"
	property='stylesheet' rel="stylesheet" type="text/css" media="screen" />
<link href="/insta/assets/custom/css/style.css" property='stylesheet'
	rel="stylesheet" type="text/css" media="screen" />
	
</head>

<body>
  
	<div id="page-inner">
	
		<hr />
		<div class="row">
			<div class="col-md-12">
			  <h1 class="center"><strong> 신고 회원 상세 보기</strong></h1>
	         <p >신고회원상세보기</p>
			${loginedUser } 님 환영합니다.  <a href="/instaLogin">[로그아웃]</a>
				<div class="panel panel-default">
					<ul class="nav nav-tabs">
				
					</ul>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
								<tr>
										<th>회원 번호</th>
										<th>이메일</th>
										<th>회원 아이디</th>
										<th>이름</th>
										<th>회원 가입 날짜</th>
										<th>회원 신고 날짜</th>
										
																			
									</tr>
								</thead>
								<tbody>	
														
									<tr class="odd gradeX">									
										<td>${DETAIL_VO.mseq}</td>
										<td>${DETAIL_VO.email}</td>
										<td>${DETAIL_VO.userName}</td>
										<td>${DETAIL_VO.name}</td>
										<td>${DETAIL_VO.memberRegdate}</td>
										<td>${DETAIL_VO.reportMemRegdate}</td>																			
									</tr>							
								</tbody>
					</table>
				<form method="post" action= "/ReportDetailMemberList?mseq=${vo.mseq}">
				<input type="button" value="홈으로 가기" onClick="javascript:history.go(-1)">
				<input type="button" value="회원 일시 정지/탈퇴" onClick="goPage()">
				</form>

						</div>
					</div>
				</div>
				<!--End Advanced Tables -->
			</div>
		</div>
		<!-- /. PAGE INNER  -->
	</div>
	<!-- /. PAGE WRAPPER  -->

	<!--Bootstrap core JavaScript-->
	<script src="/insta/resources/js/jquery.js"></script>
	<script src="/insta/resources/js/bootstrap.min.js"></script>
	<!--Bx-Slider JavaScript-->
	<script src="/insta/resources/js/jquery.bxslider.min.js"></script>
	<!--Owl Carousel JavaScript-->
	<script src="/insta/resources/js/owl.carousel.min.js"></script>
	<!--Pretty Photo JavaScript-->
	<script src="/insta/resources/js/jquery.prettyPhoto.js"></script>
	<!--Full Calender JavaScript--> 
	<script src="/insta/resources/js/moment.min.js"></script>
	<script src="/insta/resources/js/fullcalendar.min.js"></script>
	<script src="/insta/resources/js/jquery.downCount.js"></script>
	<!--Image Filterable JavaScript-->
	<script src="/insta/resources/js/jquery-filterable.js"></script>
	<!--Accordian JavaScript-->
	<script src="/insta/resources/js/jquery.accordion.js"></script>
	<!--Number Count (Waypoints) JavaScript-->
	<script src="/insta/resources/js/waypoints-min.js"></script>
	<!--v ticker-->
	<script src="/insta/resources/js/jquery.vticker.min.js"></script>
	<!--select menu-->
	<script src="/insta/resources/js/jquery.selectric.min.js"></script>
	<!--Side Menu-->
	<script src="/insta/resources/js/jquery.sidr.min.js"></script>
	<!--Custom JavaScript-->
	<script src="/insta/resources/js/custom.js"></script>
	<!-- DATA TABLE SCRIPTS -->
	<script src="/insta/resources/report/bootstrap.min.js"></script>
	<script src="/insta/resources/report/jquery.metisMenu.js"></script>
	<script src="/insta/resources/report/dataTables/jquery.dataTables.js"></script>
	<script src="/insta/resources/report/dataTables/dataTables.bootstrap.js"></script>
<!-- JS -->
<script src="/insta/assets/vendor/animatedheader/js/modernizr.custom.js"></script>

<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
			
		});
</script>

<script>
function goPage() {
	//location.href = "/ReportDetailMemberList?mseq=${vo.mseq}";
location.href = "/ReportMemberListServlet";
}
</script>


</body>
</html>
