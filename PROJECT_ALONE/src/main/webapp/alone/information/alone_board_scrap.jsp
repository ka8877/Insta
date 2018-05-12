<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<h2 class="page-title">MY SCRAP</h2>
</div>
	<div class="row">
		<div class="col-md-3">
			<aside class="user-profile-sidebar">
				<div class="user-profile-avatar text-center">
					 <img src="/img/profile/${mVO.monProfile }" alt="Image Alternative text" title="AMaze"  onerror="this.src='/img/no_images.jpg'" />
                            <h5>${mVO.monName }</h5>
                            <p>${mVO.monEmail }</p>
				</div>

				<!-- 기능 버튼 추가시 여기에 li 태그추가 -->
				<ul class="list user-profile-nav">
					<li><a href="/hot_spot_scrap_page.do"><i
							class="fa fa-mail-forward"></i>여행지 스크랩페이지</a></li>
				</ul>
			</aside>
		</div>

		<!--  좌측 탭  -->

		<div class="col-md-9">
			<h3 class="mb20">Board</h3>
			    <!--  리스트 뿌리기 -->
                     <c:forEach items="${boardsList }" var="b">
                    <ul class="booking-list">
                        <li>
                               <a class="booking-item" href="/boardsDetail.do?catePk=${b.catePk}&boaPk=${b.boaPk }&boaGubun=${b.boaGubun}">
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
		</div>
	</div>
</div>
  <div class="gap"></div>
