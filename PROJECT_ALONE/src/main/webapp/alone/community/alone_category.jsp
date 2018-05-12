<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
   <link rel="stylesheet" href="/assets/css/style.min.css?ver=0.99">
   <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
</head>

 <div class="gap"></div>
        <main class="content  container">

        <div class="row">
            <div class="col-lg-9">

                <div class="row">
                    <div class="col-md-4">
                        <div class="cat">
                            <h4 class="cat__title">
                                <a >유적지</a>
                                <span class="cat__toggle" data-toggle="cat" data-target="#work_business">
                                    <img src="/assets/i/expand-button.svg" width="15" alt="Toggle Cat">
                                </span>
                            </h4>
                            <c:forEach items="${a }" var="list">
                            <ul class="cat__list" id="work_business">
                                <li class="cat__list-item">
                                    <a href="/cateBoardsAllList.do?catePk=${list.catePk }&cateName=${list.cateName }">${list.cateName }</a>
                                </li>
                            </ul>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="cat">
                            <h4 class="cat__title">
                                <a>종교</a>
                                <span class="cat__toggle" data-toggle="cat" data-target="#transport">
                                    <img src="/assets/i/expand-button.svg" width="15" alt="Toggle Cat">
                                </span>
                            </h4>
                              <c:forEach items="${b }" var="list">
                            <ul class="cat__list" id="transport">
                                <li class="cat__list-item">
                                   <a href="/cateBoardsAllList.do?catePk=${list.catePk }&cateName=${list.cateName }">${list.cateName }</a>
                                </li>
                            </ul>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="cat">
                            <h4 class="cat__title">
                                <a>전시</a>
                                <span class="cat__toggle" data-toggle="cat" data-target="#real_estate">
                                    <img src="/assets/i/expand-button.svg" width="15" alt="Toggle Cat">
                                </span>
                            </h4>
                                <c:forEach items="${c }" var="list">
                            <ul class="cat__list" id="real_estate">
                                <li class="cat__list-item">
                                     <a href="/cateBoardsAllList.do?catePk=${list.catePk }&cateName=${list.cateName }">${list.cateName }</a>
                                </li>
                            </ul>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="cat">
                            <h4 class="cat__title">
                                <a>거리</a>
                                <span class="cat__toggle" data-toggle="cat" data-target="#building">
                                    <img src="/assets/i/expand-button.svg" width="15" alt="Toggle Cat">
                                </span>
                            </h4>
                                <c:forEach items="${d }" var="list">
                            <ul class="cat__list" id="building">
                                <li class="cat__list-item">
                                    <a href="/cateBoardsAllList.do?catePk=${list.catePk }&cateName=${list.cateName }">${list.cateName }</a>
                                </li>
                            </ul>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="cat">
                            <h4 class="cat__title">
                                <a>공원</a>
                                <span class="cat__toggle" data-toggle="cat" data-target="#electronics">
                                    <img src="/assets/i/expand-button.svg" width="15" alt="Toggle Cat">
                                </span>
                            </h4>
                            <c:forEach items="${e }" var="list">
                            <ul class="cat__list" id="electronics">
                                <li class="cat__list-item">
                                   <a href="/cateBoardsAllList.do?catePk=${list.catePk }&cateName=${list.cateName }">${list.cateName }</a>
                                </li>
                            </ul>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="cat">
                            <h4 class="cat__title">
                                <a>건축물</a>
                                <span class="cat__toggle" data-toggle="cat" data-target="#clothes_shoes">
                                    <img src="/assets/i/expand-button.svg" width="15" alt="Toggle Cat">
                                </span>
                            </h4>
                            <c:forEach items="${f }" var="list">
                            <ul class="cat__list" id="clothes_shoes">
                                <li class="cat__list-item">
                                  <a href="/cateBoardsAllList.do?catePk=${list.catePk }&cateName=${list.cateName }">${list.cateName }</a>
                                </li>
                            </ul>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="cat">
                            <h4 class="cat__title">
                                <a>교육</a>
                                <span class="cat__toggle" data-toggle="cat" data-target="#for_home">
                                    <img src="/assets/i/expand-button.svg" width="15" alt="Toggle Cat">
                                </span>
                            </h4>
                            <c:forEach items="${g }" var="list">
                            <ul class="cat__list" id="for_home">
                                <li class="cat__list-item">
                                     <a href="/cateBoardsAllList.do?catePk=${list.catePk }&cateName=${list.cateName }">${list.cateName }</a>
                                </li>
                            </ul>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="cat">
                            <h4 class="cat__title">
                                <a>자연</a>
                                <span class="cat__toggle" data-toggle="cat" data-target="#manufacturing">
                                    <img src="/assets/i/expand-button.svg" width="15" alt="Toggle Cat">
                                </span>
                            </h4>
                            <c:forEach items="${h }" var="list">
                            <ul class="cat__list" id="manufacturing">
                                <li class="cat__list-item">
                                 <a href="/cateBoardsAllList.do?catePk=${list.catePk }&cateName=${list.cateName }">${list.cateName }</a>
                                </li>
                            </ul>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="cat">
                            <h4 class="cat__title">
                                <a>문화</a>
                                <span class="cat__toggle" data-toggle="cat" data-target="#for_children">
                                    <img src="/assets/i/expand-button.svg" width="15" alt="Toggle Cat">
                                </span>
                            </h4>
                            <c:forEach items="${i }" var="list">
                            <ul class="cat__list" id="for_children">
                                <li class="cat__list-item">
                                   <a href="/cateBoardsAllList.do?catePk=${list.catePk }&cateName=${list.cateName }">${list.cateName }</a>
                                </li>
                            </ul>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="cat">
                            <h4 class="cat__title">
                                <a>테마파크</a>
                                <span class="cat__toggle" data-toggle="cat" data-target="#animals">
                                    <img src="/assets/i/expand-button.svg" width="15" alt="Toggle Cat">
                                </span>
                            </h4>
                            <c:forEach items="${j }" var="list">
                            <ul class="cat__list" id="animals">
                                <li class="cat__list-item">
                                    <a href="/cateBoardsAllList.do?catePk=${list.catePk }&cateName=${list.cateName }">${list.cateName }</a>
                                </li>
                            </ul>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="cat">
                            <h4 class="cat__title">
                                <a>스포츠</a>
                                <span class="cat__toggle" data-toggle="cat" data-target="#agriculture">
                                    <img src="/assets/i/expand-button.svg" width="15" alt="Toggle Cat">
                                </span>
                            </h4>
                            <c:forEach items="${k }" var="list">
                            <ul class="cat__list" id="agriculture">
                                <li class="cat__list-item">
                                   <a href="/cateBoardsAllList.do?catePk=${list.catePk }&cateName=${list.cateName }">${list.cateName }</a>
                                </li>
                            </ul>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="cat">
                            <h4 class="cat__title">
                                <a>기타</a>
                                <span class="cat__toggle" data-toggle="cat" data-target="#hobbies">
                                    <img src="/assets/i/expand-button.svg" width="15" alt="Toggle Cat">
                                </span>
                            </h4>
                            <c:forEach items="${l }" var="list">
                            <ul class="cat__list" id="hobbies">
                                <li class="cat__list-item">
                                    <a href="/cateBoardsAllList.do?catePk=${list.catePk }&cateName=${list.cateName }">${list.cateName }</a>
                                </li>
                            </ul>
                            </c:forEach>
                        </div>
                    </div>
                </div><!-- /.row -->

            </div><!-- /.col-lg-9 -->

            <div class="col-lg-3">
                <div class="ads__banners">
                    <div class="banner">
                        <a href="http://hanatour.cjworldis.com/app/wsv/packageproduct/pk-12000.asp?pkg_code=CHA894180419NXP"><img src="/img/seoul.jpg" width="200" height="300" alt=""></a>
                        <div class="banner__price">75%할인</div>
                        <div class="banner__title">299,000원</div>
                        <div class="banner__text">[얼론투어][서울] 서울직행 에어텔 마카오2박/3박 에어텔 경유가능 [특급~초특급] </div>
                    </div>
                </div>

                <div class="ads__banners">
                    <div class="banner">
                        <a href="http://hanatour.cjworldis.com/app/wsv/packageproduct/pk-12000.asp?pkg_code=PGA417180419TW0"><img src="/img/hi.jpg" width="200" height="200" alt=""></a>
                        <div class="banner__price">57%할인</div>
                        <div class="banner__title">758,000원</div>
                        <div class="banner__text">[얼론투어][괌] 에어텔5일(롯데 아일랜드 파셜오션디럭스/호텔조식/무료픽업/면세점 1만원)</div>
                    </div>
                </div>

                <div class="ads__banners">
                    <div class="banner">
                        <a href="http://www.tourbaksa.com/item/detail.asp?gateway_site=Y0990&M1=1&M2=127&M3=1581&M4=2043&M5=0&Good_YY=APBD&good_seq=11&AirIDX=1&EV_YM=APBDTW&EV_SEQ=2812&utm_source=coocha_shopping&utm_medium=coochashopping_cpc&utm_campaign=shopping&utm_term=APBD11-1"><img src="/img/hi2.jpg" width="200" height="300" alt=""></a>
                        <div class="banner__price">77%할인</div>
                        <div class="banner__title">999,000원</div>
                        <div class="banner__text">[얼론투어][세부] 플랜테이션베이 리조트 3박5일 에어텔, 쿠폰가능 , 호텔예약까지..</div>
                    </div>
                </div>
            </div><!-- /.col-lg-3 -->
        </div><!-- /.row -->

    </main><!-- /.container -->
<script type="text/javascript">
$(function(){
$(".box1").hover(function(){
     $(this).append("<div class='view'></div>");
     var num = $(this).index();
     $(".pop1 .bb").eq(num).clone().appendTo(".view",this);
},function(){
     $(".view",this).remove();
});
});
</script>

