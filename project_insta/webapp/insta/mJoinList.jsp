<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>가입회원내역</title>
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
		<div class="row">
			<div class="col-md-12">
			${loginedUser } 님 환영합니다.  <a href="/instaLogin">[로그아웃]</a>
				<div class="panel panel-default">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" style="cursor: pointer"></a><a href="/MemberListServlet">가입회원내역</a></li>
						<li class=""><a data-toggle="tab" style="cursor: pointer"></a><a href="/ReportMember">신고회원내역</a></li>
						<li class=""><a data-toggle="tab" style="cursor: pointer"></a><a href="/ReportReplyServlet">신고댓글관리</a></li>
						<li class=""><a data-toggle="tab" style="cursor: pointer"></a><a href="/ReportConListServlet">신고게시글관리</a></li>
						<li class=""><a data-toggle="tab"style="cursor: pointer"></a><a href="/ReportMemberListServlet">신고회원관리</a></li>
					</ul>
					<div class="panel-body">
						<div class="table-responsive">
										<form action="/MemberDeleteServlet"  method="post" class="sonForm" >
										<input type="hidden" name="mseq" id="mseq" >
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
								<tr>		
										<th>NO.회원번호</th>
										<th>E-Mail</th>
										<th>회원 이름</th>
										<th>회원 아이디</th>
										<th>회원 가입 날짜</th>
										<th>회원 삭제</th>
										
																			
									</tr>
								</thead>
								<tbody>	
								<c:forEach items="${I_LIST1}" var="vo" varStatus="sts">							
									<tr class="odd gradeX">									
										<td>${vo.mseq}</td>
										<td>${vo.email}</td>
										<td>${vo.name}</td>
										<td>${vo.userName}</td>
										<td>${vo.memberRegdate}</td>
									<td><button type="button" class="btn btn-primary" onclick="son('${vo.mseq}')">
									<i class="fa fa-edit " ></i> 회원삭제</button></td>									
									</tr>
								</c:forEach>
								</tbody>
						</table>
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
function son(prm) {
	if(confirm('댓글삭제하시겠습니까?')){
		//document.sonForm.rseq.value = prm;
		console.log('haha');
		$('#mseq').val(prm);
		$('.sonForm').submit();
	}else{
		alert('취소');
		}
	}
</script>

<a href="/MemberListServlet?INSTA=LIST">리스트이동!!!!!!!!!!!!!!!!!!!</a>

</body>
</html>
