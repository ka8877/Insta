<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<script src="js/pixlr.js"></script>
	<script src="js/jquery.js"></script>	
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
</head>
  <div class="container">
            <h1 class="page-title">계정 비활성화</h1>
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
											<a href="/prodel4.do" style="text-decoration: none"><center>현재 사진 삭제</center></a>
										</h4>
									</div>
										<form name = "inputForm" id="inputForm" action = "/proup4.do" method = "post" enctype="multipart/form-data">
									<div class="modal-header">
										<h4 class="modal-title">
											<a style="text-decoration: none" onclick="document.all.file.click()"> <center>사진 업로드</center></a>
											<input type="file" name="file" id="monProfile" style="display: none;"/>											
										</h4>
									</div>
											</form>
									<div class="modal-footer">
										<h4 class="modal-title" data-dismiss="modal">
											<a href="/activate.do" style="text-decoration: none"><center>취소</center></a>
										</h4>
									</div>
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
               <center><h3>●계정 비활성화를 하시겠습니까?</h3></center>
               <br>
               <center><h4>계정 비활성화를 하시면 자신의 글 목록과 프로필을 볼 수 없습니다.</h4></center>
               <center><h4>계정 재활성화는 로그인 시 인증을 통해 가능합니다.</h4></center>
               <br>
               <br>
               	
               		<div class="user-profile-avatar text-center" >
               		<img src="/img/profile/${pro.monProfile}" style="width:100px;height:100px;border: 3px solid orange;border-radius: 70px;-moz-border-radius: 70px;
						-khtml-border-radius: 70px;-webkit-border-radius: 70px;">
               		 <h5><strong>${detail.monName}님</strong></h5>
               		</div>
               	<center><h5><strong>계정 비활성화를 하시려면 아래 버튼을 눌러주세요</strong></h5></center>
              
                <center>           
                <a href="/disabled.do" class="btn btn-primary mb20">계정 비활성화</a>
                </div>
                </center>  
            
               
        <div class="gap"></div>
        
		</div>
		</div>


</html>


