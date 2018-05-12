<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>

<head>
	<script src="/js/pixlr.js"></script>
	<script src="/js/jquery.js"></script>
<!-- 	<script src="/js/custom2.js"></script> -->
<script>
$(function(){
	$("#monProfile").click(function(){

		$("input:file").change(function() {
			var file = $(this).val();
			console.log(file);
			if(file != null ){
				
				
			   $("#inputForm").submit(); 
			} else {
				alert("파일을 선택하세요");
			}
			});			
	});
});

	
</script>
<script>
function goPage(param){
	$("#galPk").val(param);
	var check = confirm("사진을 삭제하시겠습니까?");
	if(check==true){
		 $("#delForm").submit();	
		alert("사진이 삭제되었습니다.");
	}else{		
		alert("사진삭제가 취소되었습니다.");
		}
		};	 
</script>
<script>
$(function (){
	$("#galUrl").click(function(){

		$("input:file").change(function() {
			var file1 = $(this).val();
			console.log(file1);		
			if(file1 != null ){
			   $("#inputForm2").submit(); 
		} else {
			alert("파일을 선택하세요");
		}
		});			
	});
});

	
</script>



</head>

<body>

        <div class="container">
            <h1 class="page-title">내 여행사진</h1>
        </div>




         <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <aside class="user-profile-sidebar">
                        <div class="user-profile-avatar text-center" >
                            <img src="/img/profile/${pro.monProfile}" alt="" title="AMaze" data-target="#my_picture_name" data-toggle="modal"/>
                            <div class="modal fade" id="my_picture_name">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header" div style="height: auto; width: 100%; border:1px solid orange;">
										<h4 class="modal-title">
											<span style="color:#A5A095" ><center>프로필 사진 바꾸기</center></span>
										</h4>
									</div>									
									<div class="modal-header">
										<h4 class="modal-title">
											<a href="/prodel2.do" style="text-decoration: none"><center>현재 사진 삭제</center></a>
										</h4>
									</div>
										<form name = "inputForm" id="inputForm" action = "/proup2.do" method = "post" enctype="multipart/form-data">
									<div class="modal-header">
										<h4 class="modal-title">
											<a style="text-decoration: none" onclick="document.all.file.click()"> <center>사진 업로드</center></a>
											<input type="file" name="file" id="monProfile" style="display: none;"/>											
										</h4>
									</div>
									<div class="modal-footer">
										<h4 class="modal-title" data-dismiss="modal">
											<a href="/gallery.do" style="text-decoration: none"><center>취소</center></a>
										</h4>
									</div>
								 </form>
							   </div>
							 </div>
						   </div>
                            <h5>${detail.monName}</h5>
                            <p>${detail.monName}님 환영합니다!</p>
                        </div>
                        <ul class="list user-profile-nav">
                            <li><a href="/profile.do"><i class="fa fa-user"></i>프로필 편집</a>                
                            </li>
                            <li><a href="/gallery.do"><i class="fa fa-camera"></i>내 여행사진</a>
                            </li>     
                            <li><a href="/payment.do"><i class="fa fa-credit-card"></i>결제내역 확인</a>
                            </li>
                            <li><a href="/activate.do"><i class="fa fa-cog"></i>계정 비활성화</a>
                            </li>
                            <li><a href="javascript:pixlr.overlay.show({service:'express'});">
                            <i class="fa fa-camera"></i>사진 편집 기능</a>
                            </li>     
                            
                        </ul>
                    </aside>
                </div>
                
                <form id= "inputForm2" action="/galup.do" method="post" enctype="multipart/form-data">		
                <div class="col-md-9" >
                    <a class="btn btn-primary mb20" onclick="document.all.file1.click()">	
                    <i class="fa fa-plus-circle" ></i> 사진 추가</a><input type="file" name="file1" id="galUrl" style="display: none;" />	
                    </div>
                    </form>
               
             <div class="container">
            <div id="popup-gallery">
                <div class="row row-col-gap">
                    <div class="row">
                        <div class="col-lg-8" style="height:700px;width:800px;">
                            <c:forEach items="${gallery}" var="v">               
                             <div class="lgh-col-4" >                     
                              <form name="delForm" id="delForm" action="/galdel.do" method="post">
                              <input type="hidden"  name="galPk" id="galPk">
                            <button type="button" class="fa fa-ban" id="dd" style="border: none;color:orange; background-color: rgba( 0, 0, 0, 0.5 );width:30px;height:30px; position:absolute;z-index:100 " onclick="goPage(${v.galPk})">                					                                              
                            </button>                                                                
                        <a class="hover-img popup-gallery-image" href="#${v.galPk}" data-effect="mfp-zoom-out">
                            <img src="/img/gallery/${v.galUrl}" alt="" width="30" height="220" title="Gaviota en el Top" /><i class="fa fa-plus round box-icon-small hover-icon i round"></i>
                        <div class="mfp-hide" id="${v.galPk}" >
                        <div class="col-md-12" >
                        <div class="col-md-2"></div>
                        <div class="col-md-8" >
                            <img  src="/img/gallery/${v.galUrl}"/>
                            </div>
                            </div>
                       </div>
                        </a>                
							</form>							                                   
                                 </div>                                                      
                               </c:forEach>   
                               </div>  					
     					<div class="center-block clearfix" style="margin-left:320px;">${paging}</div> 
                               		<div class="hover-inner-bottom ">
                            		</div>
                            </div>
                        </div>                                          
                    </div> 
                    </div>
                                    
                    <div class="gap gap-small"></div>
        <div class="gap"></div>


      </div>
  </div>
</html>


