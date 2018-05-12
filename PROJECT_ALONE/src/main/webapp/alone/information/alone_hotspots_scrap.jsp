<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

   
  <div class="container">
            <h2 class="page-title">MY SCRAP</h2>
        </div>

             
                 <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <aside class="user-profile-sidebar">
                        <div class="user-profile-avatar text-center">
                            <img src="/img/profile/${LVL_MON_VO.monProfile }" alt="Image Alternative text" title="AMaze" onerror="this.src='/img/no_images.jpg'"  />
                            <h5>${LVL_MON_VO.monName }</h5>
                            <p>${LVL_MON_VO.monEmail }</p>
                        </div>
                        
                        <!-- 기능 버튼 추가시 여기에 li 태그추가 -->
                        <ul class="list user-profile-nav">
                            <li><a href="/hot_board_scrap_page.do"><i class="fa fa-mail-forward"></i>보드 스크랩페이지</a>
                            </li>
                          
                            <!-- <li><a href="user-profile-wishlist.html"><i class="fa fa-heart-o"></i>Wishlist</a>
                            </li> -->
                        </ul>
                    </aside>
                </div>
                  <!--  좌측 탭  -->      
                
            
                
                <div class="col-md-9">
                 <h3 class="mb20">Hot Spots</h3>
                    <div class="row row-wrap">
                    
                    <!-- 스크랩된 관광지 리스트  스크랩 삭제만 가능-->
                    <c:forEach var = "scr" items = "${LVL_SCR_LIST}">
                     <div class="col-md-3" >
                    <div class="thumb">
                        <header class="thumb-header">
                            <a class="hover-img" href="/hot_spot_detail.do?hotPk=${scr.hotPk}">
                                <img height="130px" src="${scr.hotPicUrl}" alt="Image Alternative text" title="hotel PORTO BAY LIBERDADE" />
                                <h5 class="hover-title-center">Show Now</h5>
                            </a>
                        </header>
                        <div class="thumb-caption">
                            
                            <h5 class="thumb-title"><a class="text-darken" href="#">${scr.hotName }</a></h5>
                            <p class="mb0"><small><a href="/hotspots_scrap_page_delete.do?hotPk=${scr.hotPk}&monPk=${monPk}"><i class="fa fa-heart"></i> 스크랩 삭제</small></a>
                            </p>                     
                        </div>
                    </div>
                </div>
                    </c:forEach>
                    
  
                    </div>
                   </div>   
                  </div>
                   
                   
                   
                   
                   
                   
                   
                   
                   
      




 </div>
</body>
</html>