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
                <li><a href="#">${cateName }</a>
                </li>
                <c:if test="${boaGubun eq 2}">
                <li class="active">전체: 월간 BEST</li>
                </c:if>
                <c:if test="${boaGubun eq 3}">
                <li class="active">여행꿀팁</li>
                </c:if>
                <c:if test="${boaGubun eq 4}">
                <li class="active">맛집추천</li>
                </c:if>
                <c:if test="${boaGubun eq 5}">
                <li class="active">Q&A</li>
                </c:if>
                <c:if test="${boaGubun eq 6}">
                <li class="active">자유 게시판</li>
                </c:if>
            </ul>
              <div class="gap gap-small"></div>
            <div class="row">
                <div class="col-md-3">
                
                <!-- 카테고리 -->
                 <c:if test="${boaGubun eq 2}">
                 <aside class="booking-filters booking-filters-white">
                 		<h5 align="center" style="font-weight: bold">${cateName }</h5>
                        <ul class="list booking-filters-list">
                            <li>
                                     <div id="bold"><a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/cateBoardsAllList.do?catePk=${catePk }">전체 : 게시글 모아보기</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; "href="/bestBoardsList.do?catePk=${catePk }&boaGubun=2">월간 BEST</a></div>
                            </li>
                              <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${catePk }&boaGubun=3">여행꿀팁</a></div>
                            </li>
                            <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${catePk }&boaGubun=4">맛집추천</a></div>
                            </li>
                              <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${catePk }&boaGubun=5">Q&A</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${catePk }&boaGubun=6">자유 게시판</a></div>
                            </li>
                        </ul>
                    </aside>
                        </c:if>
                          <c:if test="${boaGubun eq 3}">
                 <aside class="booking-filters booking-filters-white">
                 		<h5 align="center" style="font-weight: bold">${cateName }</h5>
                        <ul class="list booking-filters-list">
                            <li>
                                     <div id="bold"><a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/cateBoardsAllList.do?catePk=${catePk }">전체 : 게시글 모아보기</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black"href="/bestBoardsList.do?catePk=${catePk }&boaGubun=2">월간 BEST</a></div>
                            </li>
                              <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer;  " href="/bestBoardsList.do?catePk=${catePk }&boaGubun=3">여행꿀팁</a></div>
                            </li>
                            <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${catePk }&boaGubun=4">맛집추천</a></div>
                            </li>
                              <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${catePk }&boaGubun=5">Q&A</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${catePk }&boaGubun=6">자유 게시판</a></div>
                            </li>
                        </ul>
                    </aside>
                        </c:if>
                          <c:if test="${boaGubun eq 4}">
                 <aside class="booking-filters booking-filters-white">
                 		<h5 align="center" style="font-weight: bold">${cateName }</h5>
                        <ul class="list booking-filters-list">
                            <li>
                                     <div id="bold"><a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/cateBoardsAllList.do?catePk=${catePk }">전체 : 게시글 모아보기</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black"href="/bestBoardsList.do?catePk=${catePk }&boaGubun=2">월간 BEST</a></div>
                            </li>
                              <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer;color: black   " href="/bestBoardsList.do?catePk=${catePk }&boaGubun=3">여행꿀팁</a></div>
                            </li>
                            <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; " href="/bestBoardsList.do?catePk=${catePk }&boaGubun=4">맛집추천</a></div>
                            </li>
                              <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${catePk }&boaGubun=5">Q&A</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${catePk }&boaGubun=6">자유 게시판</a></div>
                            </li>
                        </ul>
                    </aside>
                        </c:if>
                         <c:if test="${boaGubun eq 5}">
                 <aside class="booking-filters booking-filters-white">
                 		<h5 align="center" style="font-weight: bold">${cateName }</h5>
                        <ul class="list booking-filters-list">
                            <li>
                                     <div id="bold"><a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/cateBoardsAllList.do?catePk=${catePk }">전체 : 게시글 모아보기</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black"href="/bestBoardsList.do?catePk=${catePk }&boaGubun=2">월간 BEST</a></div>
                            </li>
                              <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer;color: black   " href="/bestBoardsList.do?catePk=${catePk }&boaGubun=3">여행꿀팁</a></div>
                            </li>
                            <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer;  color: black " href="/bestBoardsList.do?catePk=${catePk }&boaGubun=4">맛집추천</a></div>
                            </li>
                              <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer;" href="/bestBoardsList.do?catePk=${catePk }&boaGubun=5">Q&A</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/bestBoardsList.do?catePk=${catePk }&boaGubun=6">자유 게시판</a></div>
                            </li>
                        </ul>
                    </aside>
                        </c:if>
                        <c:if test="${boaGubun eq 6}">
                 <aside class="booking-filters booking-filters-white">
                 		<h5 align="center" style="font-weight: bold">${cateName }</h5>
                        <ul class="list booking-filters-list">
                            <li>
                                     <div id="bold"><a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black " href="/cateBoardsAllList.do?catePk=${catePk }">전체 : 게시글 모아보기</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black"href="/bestBoardsList.do?catePk=${catePk }&boaGubun=2">월간 BEST</a></div>
                            </li>
                              <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer;color: black   " href="/bestBoardsList.do?catePk=${catePk }&boaGubun=3">여행꿀팁</a></div>
                            </li>
                            <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer;  color: black " href="/bestBoardsList.do?catePk=${catePk }&boaGubun=4">맛집추천</a></div>
                            </li>
                              <li>
                                <div id="bold">  <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; color: black" href="/bestBoardsList.do?catePk=${catePk }&boaGubun=5">Q&A</a></div>
                            </li>
                            <li>
                                 <div id="bold"> <a class="booking-filters-title" id="leftCate" style="font-weight: bold; cursor:pointer; " href="/bestBoardsList.do?catePk=${catePk }&boaGubun=6">자유 게시판</a></div>
                            </li>
                        </ul>
                    </aside>
                        </c:if>
                    <!-- 카테고리 끝 -->
                    
                </div>
                <div class="col-md-9">
                
                	<!--  정렬하기 -->
                    <div class="nav-drop booking-sort">
                        <c:if test="${confirm eq 'day' }">
                        <h5 class="booking-sort-title"><a href="#">최신순</a><i class="fa fa-angle-down"></i><i class="fa fa-angle-up"></i></h5>
                        </c:if>
                        <c:if test="${confirm eq 'scnt' }">
                        <h5 class="booking-sort-title"><a href="#">스크랩순</a><i class="fa fa-angle-down"></i><i class="fa fa-angle-up"></i></h5>
                        </c:if>
                        <c:if test="${confirm eq 'rcnt' }">
                        <h5 class="booking-sort-title"><a href="#">댓글순</a><i class="fa fa-angle-down"></i><i class="fa fa-angle-up"></i></h5>
                        </c:if>
                        <ul class="nav-drop-menu">
                           <li onclick="location.href='/bestBoardsList.do?catePk=${catePk }&boaGubun=${boaGubun}'"><a href="/bestBoardsList.do?catePk=${catePk }&boaGubun=${boaGubun}">최신순</a>
                            </li>
                            <li onclick="location.href='/boardsScntBestList.do?catePk=${catePk }&boaGubun=${boaGubun}'"><a href="/boardsScntBestList.do?catePk=${catePk }&boaGubun=${boaGubun}">스크랩순</a>
                            </li>
                           <li onclick="location.href='/boardsRcntBestList.do?catePk=${catePk }&boaGubun=${boaGubun}'"><a href="/boardsRcntBestList.do?catePk=${catePk }&boaGubun=${boaGubun}">댓글순</a>
                        </ul>
                    </div>
                    	<!--  정렬하기 끝 -->
                    
                       <!--  리스트 뿌리기 -->
                     <c:forEach items="${boardsList }" var="b">
                    <ul class="booking-list">
                        <li>
                            <a class="booking-item" href="/boardsDetail.do?catePk=${catePk}&boaPk=${b.boaPk }&boaGubun=${b.boaGubun}">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="booking-item-img-wrap" style='height: 100px; width: 150px; object-fit: contain'>
                                           <img src="${b.boaUrl }" onerror="this.src='/img/no_images.jpg'" alt="이미지설명"  title="${b.boaTitle }" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"/>
                                            <div class="booking-item-img-num"><i class="fa fa-picture-o"></i>7</div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <h4 class="booking-item-title" style="font-weight: bold;">${b.boaTitle }</h4>
                                        <p class="booking-item-address" >강명준 님이 남긴 포스트입니다. &emsp;&emsp;&emsp;&emsp;&emsp;${b.boaRegdate }</p>
                                        <ul class="booking-item-features booking-item-features-small booking-item-features-sign">
                                            <li rel="tooltip" data-placement="top" title="스크랩"><i class="fa fa-thumbs-o-up"></i><span class="booking-item-feature-sign">x ${b.scnt }</span>
                                            </li>
                                            <li rel="tooltip" data-placement="top" title="댓글"><i class="fa fa-comment-o"></i><span class="booking-item-feature-sign">x ${b.rcnt }</span>
                                        </ul>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                    </c:forEach>
                    <!-- 리스트뿌리기 끝 -->
                    
                    <!-- 페이징처리 -->
                    <div class="row">
                        <div class="col-md-6">
                            <ul class="pagination">
                            	${PAGING }
                            </ul>
                        </div>
                         <form action="/boardsSearchGubun.do" id="searchForm">
                       <div class="col-md-6 text">  
                         <input placeholder="제목+내용" type="text" name="boardsSearch" />&nbsp;&nbsp;<i class="fa fa-search" style="cursor: pointer;" onclick="searchSumit()"></i>
                        <input type="hidden" value="${catePk }" name="catePk">
                        <input type="hidden" value="${boaGubun }" name="boaGubun">
                        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;<a class="btn btn-ghost btn-primary" href="/showBoardsInsert.do?catePk=${catePk }">포스트 작성</a>
                        </div></form>
                    </div>
                      <!-- 페이징처리 끝 -->

                </div>
            </div>
            <div class="gap"></div>
        </div>
        
        <script type="text/javascript">
        	function searchSumit() {
				document.getElementById('searchForm').submit();
			}
        </script>
</html>