    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style>
	 #bold a:hover {cursor: pointer; text-decoration:underline;}
</style>
</head>
        <div class="container">
            <ul class="breadcrumb">
                <li><a href="#">커뮤니티</a>
                </li>
                <li><a href="#">게시판</a>
                </li>
                <li><a href="#">${bVO.cateName}</a>
                </li>
                <li class="active">전체: 게시글 모아보기</li>
            </ul>
            
            <!--  모달창 -->
            <div class="mfp-with-anim mfp-hide mfp-dialog mfp-search-dialog" id="search-dialog">
            </div>
              <!--  모달창 끝 -->
          <div class="gap gap-small"></div>
            <div class="row">
            	
                <div class="col-md-3">
                <!-- 카테고리 -->
                 <c:if test="${boaGubun eq 1}">
                               <aside class="booking-filters booking-filters-white">
                 		<h5 align="center" style="font-weight: bold">${bVO.cateName}</h5>
                        <ul class="list booking-filters-list">
                            <li>
                           <div id="bold"><a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer;" href="/cateBoardsAllList.do?catePk=${bVO.catePk }">전체 : 게시글 모아보기</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black  "href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=2">월간 BEST</a></div>
                            </li>
                              <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=3">여행꿀팁</a></div>
                            </li>
                            <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=4">맛집추천</a></div>
                            </li>
                              <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=5">Q&A</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=6">자유 게시판</a></div>
                            </li>
                        </ul>
                    </aside>
                </c:if>
                 <c:if test="${boaGubun eq 2}">
                 <aside class="booking-filters booking-filters-white">
                 		<h5 align="center" style="font-weight: bold">커뮤니티</h5>
                        <ul class="list booking-filters-list">
                            <li>
                                     <div id="bold"><a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/cateBoardsAllList.do?catePk=${bVO.catePk }">전체 : 게시글 모아보기</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; "href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=2">월간 BEST</a></div>
                            </li>
                              <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=3">여행꿀팁</a></div>
                            </li>
                            <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=4">맛집추천</a></div>
                            </li>
                              <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=5">Q&A</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=6">자유 게시판</a></div>
                            </li>
                        </ul>
                    </aside>
                        </c:if>
                          <c:if test="${boaGubun eq 3}">
                 <aside class="booking-filters booking-filters-white">
                 		<h5 align="center" style="font-weight: bold">커뮤니티</h5>
                        <ul class="list booking-filters-list">
                            <li>
                                     <div id="bold"><a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/cateBoardsAllList.do?catePk=${bVO.catePk }">전체 : 게시글 모아보기</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black"href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=2">월간 BEST</a></div>
                            </li>
                              <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer;  " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=3">여행꿀팁</a></div>
                            </li>
                            <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=4">맛집추천</a></div>
                            </li>
                              <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=5">Q&A</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=6">자유 게시판</a></div>
                            </li>
                        </ul>
                    </aside>
                        </c:if>
                          <c:if test="${boaGubun eq 4}">
                 <aside class="booking-filters booking-filters-white">
                 		<h5 align="center" style="font-weight: bold">커뮤니티</h5>
                        <ul class="list booking-filters-list">
                            <li>
                                     <div id="bold"><a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/cateBoardsAllList.do?catePk=${bVO.catePk }">전체 : 게시글 모아보기</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black"href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=2">월간 BEST</a></div>
                            </li>
                              <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer;color: black   " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=3">여행꿀팁</a></div>
                            </li>
                            <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=4">맛집추천</a></div>
                            </li>
                              <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=5">Q&A</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=6">자유 게시판</a></div>
                            </li>
                        </ul>
                    </aside>
                        </c:if>
                         <c:if test="${boaGubun eq 5}">
                 <aside class="booking-filters booking-filters-white">
                 		<h5 align="center" style="font-weight: bold">커뮤니티</h5>
                        <ul class="list booking-filters-list">
                            <li>
                                     <div id="bold"><a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/cateBoardsAllList.do?catePk=${bVO.catePk }">전체 : 게시글 모아보기</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black"href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=2">월간 BEST</a></div>
                            </li>
                              <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer;color: black   " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=3">여행꿀팁</a></div>
                            </li>
                            <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer;  color: black " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=4">맛집추천</a></div>
                            </li>
                              <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer;" href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=5">Q&A</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=6">자유 게시판</a></div>
                            </li>
                        </ul>
                    </aside>
                        </c:if>
                        <c:if test="${boaGubun eq 6}">
                 <aside class="booking-filters booking-filters-white">
                 		<h5 align="center" style="font-weight: bold">커뮤니티</h5>
                        <ul class="list booking-filters-list">
                            <li>
                                     <div id="bold"><a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/cateBoardsAllList.do?catePk=${bVO.catePk }">전체 : 게시글 모아보기</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black"href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=2">월간 BEST</a></div>
                            </li>
                              <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer;color: black   " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=3">여행꿀팁</a></div>
                            </li>
                            <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer;  color: black " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=4">맛집추천</a></div>
                            </li>
                              <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black" href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=5">Q&A</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; " href="/bestBoardsList.do?catePk=${bVO.catePk }&boaGubun=6">자유 게시판</a></div>
                            </li>
                        </ul>
                    </aside>
                        </c:if>
                    <!-- 카테고리 끝 -->
                </div>
                <div class="col-md-9">
                    <!--  상세내용 -->
                <header class="booking-item-header">
                    <div class="row">
                        <div class="col-md-9" style="">
                            <h4 class="lh1em">${bVO.boaTitle}</h4>
                            <ul class="list list-inline text-small">
                                <li><i class="fa fa-home"></i><a class="popup-text" href="#search-dialog" data-effect="mfp-zoom-out">강명준</a>
                                </li>
                                <li><i class="fa fa-phone"></i> ${bVO.boaRegdate }</li>
                            </ul>
                            <hr/>
                        </div>
                    </div>
                </header>
                 <div class="gap gap-small"></div>
                <div class="row">
                    <div class="col-md-10">
                        <div class="tabbable booking-details-tabbable">
                                ${bVO.boaCon }
                        </div>
                    </div>
                </div>
                <div class="gap"></div>
                <div class="gap gap-small"></div>
                <form action="/boardsDelete.do" method="post" id="boardsDelete" >
                <p class="booking-item-review-rate" id="scraps">
                								<c:if test="${scrapcall eq true }">
                								<span id="delete">
                								<a onclick="scrapDelete()" style="cursor: pointer;"><i class="fa fa-heart"></i>좋아요
                                             	<b class="text-color"> ${cnt }</b></a>&nbsp;&nbsp;&nbsp;
                								</span></c:if>
                								<c:if test="${scrapcall eq false }">
                								<span id="insert">
                									<a onclick="scrapInsert()" style="cursor: pointer;"><i class="fa fa-heart-o"></i>좋아요
                                          		   <b class="text-color"> ${cnt }</b></a>&nbsp;&nbsp;&nbsp;
                								</span></c:if>
                                            <a href="" id="rcnt"><i class="fa fa-comment-o"></i> 댓글 <b class="text-color">${rCnt }</b></a>&nbsp;&nbsp;&nbsp;
                                            <c:if test="${bVO.monPk eq monPk }">
                                            <a class="btn btn-ghost btn-primary btn-sm" href="/showBoardsUpdate.do?boaPk=${bVO.boaPk }&catePk=${bVO.catePk}" >게시글 수정</a>&nbsp;&nbsp;&nbsp;
                                            <a class="btn btn-ghost btn-primary btn-sm" onclick="test()">게시글 삭제</a>		
                                            </c:if>									
                                            <input type="hidden" name="boaPk" value="${bVO.boaPk }">
                                           <input type="hidden" name="boaGubun" value="${boaGubun }">
                                             <input type="hidden" name="catePk" value="${bVO.catePk }">
                                            </p> 
                                            </form>
                                    <input type="text" placeholder="댓글을 남겨주세요."  size="100" id="regist"/> <a class="btn btn-ghost btn-primary btn-sm" onclick="registReply(${bVO.boaPk})">저장</a>
                                    <div class="gap gap-small"></div>
                <div class="row row-wrap">
                    <div class="col-md-8" id="replyList">
                        <ul class="booking-item-reviews list">
                    <c:forEach items="${rList }" var="r">
                    <li>
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="booking-item-review-person">
                                            <a class="booking-item-review-person-avatar round" href="#">
                                                <img src="" onerror="this.src='/img/noImage.jpg'" />
                                            </a>
                                            <p class="booking-item-review-person-name"><a href="#">${r.monName }</a>
                                            </p>
                                           <p class="booking-item-review-person-loc">${r.repRegdate }</p>
                                        </div>
                                    </div>
                                    <div class="col-md-10">
                                        <div class="booking-item-review-content">
                                            <span>${r.repCon }
                                            </span><a style="cursor: pointer;" onclick="deleteReply(${r.repPk},${bVO.boaPk })"><strong>&emsp;&emsp;&emsp;x</strong></a>
                                        </div>
                                    </div>
                                </div>
                                </li>
                        </c:forEach>
                            </ul>
                        </div>
                         <div class="col-md-4">
                         </div>
                        </div>
            <div class="gap gap-small"></div>
        </div>
                    <!-- 상세내용 끝 -->

                </div>
            </div>
            <div class="gap"></div>
            
            <script type="text/javascript">
            	function registReply(id) {
            		value = $("#regist").val(); 
            		console.log('value');
            		if(value==''){
            			alert('댓글을 입력하세요.');
            			$("#regist").focus();
            			return;
            		}
            		$.ajax({
						type:'GET',
						url: "/replyInsert.do",
						data:{
							boaPk:id,
							repCon:value
						},
						success: function(resultData){
							$("#replyList").empty();
							var replyHtml = "";
							$("#rcnt").empty();
							var rcntHtml = "";
							rcntHtml += '<a href="" id="rcnt"><i class="fa fa-comment-o"></i> 댓글 <b class="text-color">'+resultData[0].rcnt+'</b></a>';
							$("#rcnt").append(rcntHtml);
							$.each(resultData, function(index, r) {      
								replyHtml += '<ul class="booking-item-reviews list"><li>';
								replyHtml += '<div class="row">';
								replyHtml += '<div class="col-md-2">';
								replyHtml += '<div class="booking-item-review-person">';
								replyHtml += '<a class="booking-item-review-person-avatar round" href="#">';
								replyHtml += '<img src="img/50x50.png" alt="Image Alternative text" title="Bubbles" />';
								replyHtml += '</a>';
								replyHtml += '<p class="booking-item-review-person-name"><a href="#">'+r.monName+'</a>';
								replyHtml += '</p>';
								replyHtml += '<p class="booking-item-review-person-loc">' +r.repRegdate+'</p>';
								replyHtml += '</div>';
								replyHtml += '</div>';
								replyHtml += '<div class="col-md-10">';
								replyHtml += '<div class="booking-item-review-content">';
								replyHtml += '<span>'+r.repCon+'</span><a style="cursor: pointer;" onclick="deleteReply('+r.repPk+','+r.boaPk+' )"><strong>&emsp;&emsp;&emsp;x</strong></a></div>';
								replyHtml += '</div>';
								replyHtml += '</div>';
								replyHtml += '</li></ul>';
							});
							$("#replyList").append(replyHtml);
							$("#regist").val("");
						}
					});
				}
            </script>
            
            <script type="text/javascript">
            	function deleteReply(rid, bid) {
            		$.ajax({
						type:'GET',
						url: "/replyDelete.do",
						data:{
							repPk:rid,
							boaPk:bid
						},
						success: function(resultData){ 
							$("#replyList").empty();
							var replyHtml = "";
							$("#rcnt").empty();
							var rcntHtml = "";
							rcntHtml += '<a href="" id="rcnt"><i class="fa fa-comment-o"></i> 댓글 <b class="text-color">'+resultData[0].rcnt+'</b></a>';
							$("#rcnt").append(rcntHtml);
							$.each(resultData, function(index, r) {      
								replyHtml += '<ul class="booking-item-reviews list"><li>';
								replyHtml += '<div class="row">';
								replyHtml += '<div class="col-md-2">';
								replyHtml += '<div class="booking-item-review-person">';
								replyHtml += '<a class="booking-item-review-person-avatar round" href="#">';
								replyHtml += '<img src="img/50x50.png" alt="Image Alternative text" title="Bubbles" />';
								replyHtml += '</a>';
								replyHtml += '<p class="booking-item-review-person-name"><a href="#">'+r.monName+'</a>';
								replyHtml += '</p>';
								replyHtml += '<p class="booking-item-review-person-loc">' +r.repRegdate+'</p>';
								replyHtml += '</div>';
								replyHtml += '</div>';
								replyHtml += '<div class="col-md-10">';
								replyHtml += '<div class="booking-item-review-content">';
								replyHtml += '<span>'+r.repCon+'</span><a style="cursor: pointer;" onclick="deleteReply('+r.repPk+','+r.boaPk+' )"><strong>&emsp;&emsp;&emsp;x</strong></a></div>';
								replyHtml += '</div>';
								replyHtml += '</div>';
								replyHtml += '</li></ul>';
							});
							$("#replyList").append(replyHtml);
							$("#regist").val("");
						}
					});
				}
            </script>
            
             <script type="text/javascript">
            	function scrapDelete() {
            		var bid = "${bVO.boaPk}";
            		/* var mid = 로그인세션 */
            		$.ajax({
						type:'GET',
						url: "/boardsScrapDelete.do",
						data:{
							boaPk:bid
						},
						success: function(cnt){
							$("#delete").empty();
							$("#insert").empty();
							var scrapHtml = "";
									scrapHtml += '<a onclick="scrapInsert()" style="cursor: pointer;"><i class="fa fa-heart-o"></i>좋아요<b class="text-color">'+cnt+'</b></a>&nbsp;&nbsp;&nbsp;';
							$("#delete").append(scrapHtml);
							$("#insert").append(scrapHtml);
						}
					});
				}
            </script>
            
             <script type="text/javascript">
            	function scrapInsert() {
            		var bid = "${bVO.boaPk}";
            		/* var mid = 로그인세션 */
            		$.ajax({
						type:'GET',
						url: "/boardsScrapInsert.do",
						data:{
							boaPk:bid
						},
						success: function(cnt){
							$("#insert").empty();
							$("#delete").empty();
							var scrapHtml = "";
							scrapHtml += '<a onclick="scrapDelete()" style="cursor: pointer;"><i class="fa fa-heart"></i>좋아요<b class="text-color">'+cnt+'</b></a>&nbsp;&nbsp;&nbsp;';
							$("#insert").append(scrapHtml);
							$("#delete").append(scrapHtml);
						}
					});
				}
            </script>
            
            <script type="text/javascript">
            	function test(boaPk, boaGubun, catePk) {
            		if(confirm('정말로 삭제 하시겠습니까?')==true){
            			document.getElementById('boardsDelete').submit();
            		}else{
            			return;
            		}
				}
            </script>
</html>



