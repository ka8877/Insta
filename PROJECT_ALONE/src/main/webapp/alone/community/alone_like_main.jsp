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
		<div class="row">
			<div class="col-md-9">
				<h2 class="page-title" >Find your Mate!</h2>


				<!-- 목적지 검색 -->
				<form id="search_form" action="/community/search.do" method="post">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group form-group-icon-left">
								<i class="fa fa-search input-icon input-icon-hightlight"></i>
								<label>어디 가실거에요?</label><!--  <input class="typeahead form-control"
									placeholder="서울특별시 종로구 사직로 161번지 경복궁 " type="text" /> -->
									<select id="desName" name="name" class="typeahead form-control">
									<option value="서울">서울</option>
									<option value="부산">부산</option>
									
									</select>
							</div>
						</div>
						<div class="col-md-6">
							
							<div class="input-daterange" data-date-format="yyyy/mm/dd">
								<div class="row">
									<div class="col-md-4">
										<div class="form-group form-group-icon-left">
											<i class="fa fa-calendar input-icon input-icon-hightlight"></i>
											<label>Start Date</label> 
												<c:choose>
													<c:when test="${not empty start}">
													 <input class="form-control" name="start"
												type="text" value="${start}"/>
													</c:when>
													<c:otherwise>
													 <input id="desDateIn" name="start" class="form-control"
												type="text" />
													</c:otherwise>
												</c:choose>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group form-group-icon-left">
											<i class="fa fa-calendar input-icon input-icon-hightlight"></i>
											<label>End Date</label> 
											
											<c:choose>
													<c:when test="${not empty end}">
													 <input class="form-control" name="end"
												type="text" value="${end}"/>
													</c:when>
													<c:otherwise>
													 <input id="desDateOut" name="end" class="form-control"
												type="text" />
													</c:otherwise>
												</c:choose>
											
										</div>
									</div>
									<div class="col-md-4" style="padding-top: 16px;">
										<input class="btn btn-primary mt10" type="submit" id="search_btn"
											value="Let's Go!" /> 
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				<div class="gap"></div>
<c:choose>
<c:when test="${mvo.monCharged == 0}">
<!-- 무료 회원 리스트 출력 -->
				<div id="popup-gallery">
					<div class="row row-col-gap">
						<c:forEach items="${curUserList}" var="l" varStatus="i">
							<div class="col-md-3">
								<a class="hover-img popup-gallery-image"
									href="#mfp-detail${i.index}" data-effect="mfp-zoom-out"> <img
									src="<c:choose>
									<c:when test="${l.monSex == 'm'}">
										/img/inye-img/man.png
									</c:when>
									<c:otherwise>
										/img/inye-img/woman.png
									</c:otherwise>
								</c:choose>"
									alt="Image Alternative text" title="Gaviota en el Top" /> <span
									class="hover-inner hover-inner-block hover-inner-bottom hover-inner-bg-black hover-hold">
										<span class="text-small"> <span class="col-md-9">
										
										<i class="
										<c:choose>
											<c:when test="${l.monSex == 'm'}">
												fa fa-male
											</c:when>
											<c:otherwise>
												fa fa-female
											</c:otherwise>
										</c:choose>
										"></i>
										
										&nbsp;${l.monName}</span>
											<span class="col-md-3"> <span class="like-cnt-span">${l.likesVO.likeCnt}</span>
										</span>
									</span>
								</span> <i class="fa fa-plus round box-icon-small hover-icon i round"></i>
								</a>

								<div class="mfp-hide" id="mfp-detail${i.index}">
									<div class="mfp-popup">
										<div class="col-md-6">
										
										<c:choose>
											<c:when test="${l.likesVO.isMatched == 'y'}">
											<div class="image-cover">
											<img
												src="<c:choose>
									<c:when test="${l.monSex == 'm'}">
										/img/inye-img/man.png
									</c:when>
									<c:otherwise>
										/img/inye-img/woman.png
									</c:otherwise>
								</c:choose>" />
												<div id="matched_text" class="text">
													Matched!
												</div>
											
											
											</div>
											</c:when>
											<c:otherwise>
											<div class="image-cover">
											<img
												src="<c:choose>
									<c:when test="${l.monSex == 'm'}">
										/img/inye-img/man.png
									</c:when>
									<c:otherwise>
										/img/inye-img/woman.png
									</c:otherwise>
								</c:choose>" />
												<div id="matched_text" class="text">
												</div>
											
											
											</div>
											</c:otherwise>
										</c:choose>
										
											
										</div>
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-12" style="color: #FFF">
													이름: ${l.monName}<br> 
													여행지: ${l.destinationVO.desName}<br> Date-in:
													${l.destinationVO.desDateIn}<br> Date-out:
													${l.destinationVO.desDateOut}

												</div>
												<div class="col-md-12">
													<div class="detail-intro-div">
														자기 소개 :<br> ${l.monIntro}
													</div>
												</div>
												<div class="col-md-12">
													<div class="loveball-div">
														<input type="hidden" name="index" id="index"
															value="${i.index}">
														<form class="like-form" id="like_form${i.index}">
															<input type="hidden" name="monPk" value="${monPk}">
															<input type="hidden" name="likeObject" value="${l.monPk}">
														</form>
														<c:choose>
															<c:when test="${empty l.likesVO.isMatched}">
																<button class="loveball-btn"
																	id="loveball_btn_default${i.index}">
																	Go! <img src="/img/inye-img/loveball.png" />
																</button>
															</c:when>
															<c:otherwise>
																<button class="loveball-btn"
																	id="loveball_btn_unlikedt${i.index}">
																	Liked! <img src="/img/inye-img/loveball_gray.png" />
																</button>
															</c:otherwise>
														</c:choose>



													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
</c:when>
<c:otherwise>
<!-- 유료회원 리스트 출력 -->
				<div id="popup-gallery">
					<div class="row row-col-gap">
						<c:forEach items="${curUserList}" var="l" varStatus="i">
							<div class="col-md-3">
								<a class="hover-img popup-gallery-image"
									href="#mfp-detail${i.index}" data-effect="mfp-zoom-out"> <img
									src="/img/profile/${l.monProfile}" width="250px" height="200px"
									alt="Image Alternative text" title="Gaviota en el Top" /> <span
									class="hover-inner hover-inner-block hover-inner-bottom hover-inner-bg-black hover-hold">
										<span class="text-small"> <span class="col-md-9">
										
										<i class="
										<c:choose>
											<c:when test="${l.monSex == 'm'}">
												fa fa-male
											</c:when>
											<c:otherwise>
												fa fa-female
											</c:otherwise>
										</c:choose>
										"></i>
										
										&nbsp;${l.monName}</span>
											<span class="col-md-3"> <span class="like-cnt-span">${l.likesVO.likeCnt}</span>
										</span>
									</span>
								</span> <i class="fa fa-plus round box-icon-small hover-icon i round"></i>
								</a>

								<div class="mfp-hide" id="mfp-detail${i.index}">
									<div class="mfp-popup">
										<div class="col-md-6">
										<c:choose>
											<c:when test="${l.likesVO.isMatched == 'y'}">
											<div class="image-cover">
											<img
												src="/img/profile/${l.monProfile}"/>
												<div id="matched_text" class="text">
													Matched!
												</div>
											
											
											</div>
											</c:when>
											<c:otherwise>
											<div class="image-cover">
											<img
												src="/img/profile/${l.monProfile}"/>
												<div id="matched_text" class="text">
												</div>
											
											
											</div>
											</c:otherwise>
										</c:choose>
											
										</div>
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-12" style="color: #FFF">
													이름: ${l.monName}<br> 생년월일: ${l.monBirthday}<br>
													여행지: ${l.destinationVO.desName}<br> Date-in:
													${l.destinationVO.desDateIn}<br> Date-out:
													${l.destinationVO.desDateOut}

												</div>
												<div class="col-md-12">
													<div class="detail-intro-div">
														자기 소개 :<br> ${l.monIntro}
													</div>
												</div>
												<div class="col-md-12">
													<div class="loveball-div">
														<input type="hidden" name="index" id="index"
															value="${i.index}">
														<form class="like-form" id="like_form${i.index}">
															<input type="hidden" name="monPk" value="${monPk}">
															<input type="hidden" name="likeObject" value="${l.monPk}">
														</form>
														<c:choose>
															<c:when test="${empty l.likesVO.isMatched}">
																<button class="loveball-btn"
																	id="loveball_btn_default${i.index}">
																	Go! <img src="/img/inye-img/loveball.png" />
																</button>
															</c:when>
															<c:otherwise>
						
																<button class="loveball-btn"
																	id="loveball_btn_unlikedt${i.index}">
																	Liked! <img src="/img/inye-img/loveball_gray.png" />
																</button>
															</c:otherwise>
														</c:choose>



													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

</c:otherwise>
</c:choose>
				
				
			<!-- PagingUtil -->
			${html}
			</div>



			<!-- Side bar -->
			<div class="col-md-3">
				<div class="sidebar-right">
					<div class="chat-sidebar">
					<div>&nbsp;&nbsp;매칭 리스트 </div>
					<hr>
						<c:forEach items="${msgList}" var="m" varStatus="mi">
						<div id="partner${m.mesReceiver}">
							<div class="sidebar-name col-md-10">
							<a class="" href="javascript:register_popup('${m.mesReceiver}', '${m.monstersVO.monName}');">
									<img class="round-img" src="/img/profile/${m.monstersVO.monProfile}" />
									&nbsp;${m.monstersVO.monName}
									<c:if test="${m.unread != 0}">
										<span id="unread${m.mesReceiver}">&nbsp;<font color="red">${m.unread}</font></span>
									</c:if>
								</a>
							</div>
							<div class="exit-mark col-md-2">
								<a href="javascript:cancel_matching('${m.mesReceiver}');">&#10005;</a>
							</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="gap"></div>
	<div class="chatroom"></div>
	<div id="floatMenu">
	<div class="image-cover">
	<img src="/img/inye-img/lovemonster.png">
	<div id="leftloveball" class="text2">
		${mvo.monLoveball}
	</div>
	</div>
	</div>
	
	
<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
$(document).ready(function() {
 
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
 
	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
 
		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */
 
		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);
 
	}).scroll();
 
});
</script>

<script>
function cancel_matching(id) {
		var obj = new Object();
		obj.monPk="${monPk}"
		obj.mesReceiver = id;
		swal({
				title: "메시지를 삭제하시겠어요?",					
				buttons : true,
			})
		.then(function(value){
			if(value == true) {
				 $.ajax({
					url : "/community/deleteMsg.do",
					headers : {
								'Content-Type' : 'application/json',
								},
					method : "post",
					data : JSON.stringify(obj),
					success : function(result) {
						$("#partner"+id).remove();
					}	
						
				}); 
			}
		});
		
	}

	//this function can remove a array element.
	Array.remove = function(array, from, to) {
		var rest = array.slice((to || from) + 1 || array.length);
		array.length = from < 0 ? array.length + from : from;
		return array.push.apply(array, rest);
	};

	//this variable represents the total number of popups can be displayed according to the viewport width
	var total_popups = 0;

	//arrays of popups ids
	var popups = [];

	//this is used to close a popup
	function close_popup(id) {
		for (var iii = 0; iii < popups.length; iii++) {
			if (id == popups[iii]) {
				Array.remove(popups, iii);

				document.getElementById(id).style.display = "none";

				calculate_popups();

				return;
			}
		}
	}

	//displays the popups. Displays based on the maximum number of popups that can be displayed on the current viewport width
	function display_popups(id) {
		var right = 220;

		var iii = 0;
		for (iii; iii < total_popups; iii++) {
			if (popups[iii] != undefined) {
				var element = document.getElementById(popups[iii]);
				element.style.right = right + "px";
				right = right + 320;
				element.style.display = "block";
			}
		}

		for (var jjj = iii; jjj < popups.length; jjj++) {
			var element = document.getElementById(popups[jjj]);
			element.style.display = "none";
		}
		
		$(".msg-btn").click(function(){
			var msg = $(this).closest("div").find("input[type=text]").val();
			
			if(msg != "") {
				var obj = new Object();
				obj.monPk="${monPk}"
				obj.mesReceiver = id;
				obj.mesCon = msg;
				var texts = "";
				$.ajax({
					url : "/community/msgTexts.do",
					headers : {
								'Content-Type' : 'application/json',
								},
					method : "post",
					data : JSON.stringify(obj),
					success : function(messages) {
						$.map(messages, function(unit,index){
							if(unit["monPk"] == obj.monPk){
								texts += '<div class="balloon-sent">';
								texts += unit["mesCon"];
								texts += '<br>';
								texts += unit["mesRegdate"];
								texts += '</div><br>';
							} else {
								texts += '<div class="balloon-got">';
								texts += unit["mesCon"];
								texts += '<br>';
								texts += unit["mesRegdate"];
								texts += '</div><br>'; 
							}
							
						}); 
						
						$("#msg_popup"+id).empty();
						$("#msg_popup"+id).append(texts);
						$("#msgbox"+id).val("");

					}
					
				});
			} else{
				swal("메시지 내용을 입력해주세요.");
			}
			
		});
	}

	//creates markup for a new popup. Adds the id to popups array.
	function register_popup(id, name) {
		
		var mon_pk = "${monPk}";
		var mes_receiver = id;
		var texts = "";
		var obj = new Object();
		obj.monPk = mon_pk;
		obj.mesReceiver = mes_receiver;
		
		$.ajax({
			url : "/community/msgTexts.do",
			headers : {
						'Content-Type' : 'application/json',
						},
			method : "post",
			data : JSON.stringify(obj),
			success : function(messages) {
	
				$.map(messages, function(unit,index){
					if(unit["monPk"] == mon_pk){
						texts += '<div class="balloon-sent">';
						texts += unit["mesCon"];
						texts += '<br><font color="black" size="1px">';
						texts += unit["mesRegdate"];
						texts += '</font></div><br>';
					} else {
						texts += '<div class="balloon-got">';
						texts += unit["mesCon"];
						texts += '<br><font color="black" size="1px">';
						texts += unit["mesRegdate"];
						texts += '</font></div><br>';
					}
					
				});
				$("#unread"+id).empty();
				createElements(texts, mes_receiver, name);
			}
		});
		
	}
	
	function createElements(texts, id, name){
		for (var iii = 0; iii < popups.length; iii++) {
			//already registered. Bring it to front.
			if (id == popups[iii]) {
				Array.remove(popups, iii);

				popups.unshift(id);

				calculate_popups(id);

				return;
			}
		}
		
		var element = '<div class="popup-box chat-popup" id="'+ id +'">';
		element = element + '<div class="popup-head">';
		element = element + '<div class="popup-head-left">' + name + '</div>';
		element = element
				+ '<div class="popup-head-right"><a href="javascript:close_popup(\''
				+ id + '\');">&#10005;</a></div>';
		element = element
				+ '<div style="clear: both"></div></div><div class="popup-messages" id="msg_popup'+id+'">'
				+texts+'</div><input id="msgbox'+id+'" name="msgbox" class="msgbox form-control-yiy" type="text" placeholder="입력하세요"/><button class="msg-btn btn btn-info">전송</button></div>';

				 $(".chatroom").append(element);
				
		popups.unshift(id);

		calculate_popups(id);
	}
	//calculate the total number of popups suitable and then populate the toatal_popups variable.
	function calculate_popups(id) {
		var width = window.innerWidth;
		if (width < 540) {
			total_popups = 0;
		} else {
			width = width - 200;
			//320 is width of a single popup box
			total_popups = parseInt(width / 320);
		}

		display_popups(id);

	}

	//recalculate when window is loaded and also when window is resized.
	window.addEventListener("resize", calculate_popups);
	window.addEventListener("load", calculate_popups);

	
</script>
<script>
$(function() {
	$(".loveball-btn").click(function() {
		var loveball_btn = $(".loveball-btn").attr('id');
		var like_form = $(".like-form").attr('id');
		var index = $("#index").val();
		if (loveball_btn.indexOf("default") != -1) {
			var form = $("#"+ like_form).serializeArray();
			var data = {};
			$.map(form,function(v) {
				return data[v.name] = v.value;
			});
			
			console.log("countLoveball 실행");
			$.ajax({
				url : "/community/countLoveball.do",
				headers : {
							'Content-Type' : 'application/json',
							},
				method : "post",
				data : JSON.stringify(data),
				success : function(loveball) {
					if(loveball > 0) {
						swal({
							title : "친구 하시겠어요?",
							icon : "/img/inye-img/hi.gif",
							buttons : {
										cancel : {
													text : "더 생각해 볼게요~",
													value : "no",
													visible : true,
													},
										confirm : {
													text : "네!",
													value : "yes",
													visible : true,
													},
										},
							})
							.then(function(value) {
								if (value == "yes") {
									var form = $("#"+ like_form).serializeArray();
									var data = {};
									$.map(form,function(v) {
										return data[v.name] = v.value;
															});
									$.ajax({
											url : "/community/addLike.do",
											headers : {
														'Content-Type' : 'application/json',
														},
											method : "post",
											data : JSON.stringify(data),
											success : function(map) {
										
												if (map.isMatched == 1) {
												
												swal({
													title : "친구되었당!",
													icon : "/img/inye-img/giphy.gif",
												});
												
												var add_msg_html = '<div id="partner"'+map.mvo.monPk+'>';
												add_msg_html+= '<div class="sidebar-name col-md-10">';
												add_msg_html+= '<a class="" href="javascript:register_popup(';
												add_msg_html+= "'"+map.mvo.monPk+"','"+map.mvo.monName+"')";
												add_msg_html+= '";>';
												add_msg_html+= '<img class="round-img" src="/img/profile/'+map.mvo.monProfile+'" />';
												add_msg_html+= '&nbsp;'+map.mvo.monName;
												add_msg_html+= '</a></div><div class="exit-mark col-md-2">';
												add_msg_html+= '<a href="javascript:cancel_matching('+map.mvo.monPk+');">&#10005;</a></div></div>';
												
												$(".chat-sidebar").append(add_msg_html);
												$("#matched_text").append("Matched!");
											}
									console.log(map.subject.monLoveball);
									$("#leftloveball").empty();
									$("#leftloveball").text(map.subject.monLoveball);
									
									$("#"+loveball_btn).empty();
									$("#"+loveball_btn).append("Liked! <img src='/img/inye-img/loveball_gray.png'/>");
									$("#"+loveball_btn).attr("id","loveball_btn_unliked"+ index);
									
									
									}
								});
							}
						});
					} else {
						var product = document.createElement("SELECT");
						product.id = "product";
						product.className = "typeahead form-control";
						
						$.ajax({
							url : "/community/productList.do",
							headers : {
										'Content-Type' : 'application/json',
										'Accept' : 'application/json'
										},
							method : "post",
							success : function(products) {
								 $.map(products, function(pvo,i){
									var option = document.createElement("OPTION");
									$.map(pvo, function(v, i){
										if(i == "proDetail"){
											option.text = v;
										} else if( i == "proPk") {
											option.value = v;
										}
									});
									product.add(option);
								}); 
							}
						});
						
					 	
						swal({
							title: "러브볼을 다 썼어요~ 충전가즈아!",					
							content : product,
							buttons : true,
							})
							.then(function(value){
								if(value == true) {
								var proPk = document.getElementById("product").value;
								var monPk = "${monPk}";
								Kakao.init("85ea84bf977b718430c0c5080c450249");
								Kakao.Auth.login({
									success : function(authObj){
										var access_token = "";
										$.map(authObj, function(v,i){
											if(i == "access_token"){
												access_token = v;
											}
										});
										
										var obj = new Object();
										obj.access_token = access_token;
										obj.proPk = proPk;
										obj.monPk = monPk;
										
										 $.ajax({
										 		url : "/community/kakaoPay.do",
												headers : {
												'Content-Type' : 'application/json',
															},
												method : "post",
												data : JSON.stringify(obj),
												success : function(resMap) {
													$.each(JSON.parse(resMap), function(i,v){
														if(i == "next_redirect_pc_url"){
														 window.location.href = v; 
														}
													});
												}
											});  
									},
									fail: function(err) {
										console.log(JSON.stringify(err));
									}
								});
					
								}
							});

						
					}
				}	
			});
			
			
			
		} else if (loveball_btn.indexOf("unliked") != -1) {
			swal({
				title : "정말 절교하실 거에요?ㅠㅠ",
				icon : "/img/inye-img/bye.gif",
				buttons : {
							cancel : {
								text : "더 생각해 볼게요~",
								value : "no",
								visible : true,
									},
							confirm : {
								text : "네..",
								value : "yes",
								visible : true,
									},
							},
		})
		.then(function(value) {
			if (value == "yes") {
				var form = $("#"+ like_form).serializeArray();
				var data = {};
				$.map(form,function(v) {
					return data[v.name] = v.value;
				});
				$.ajax({
					url : "/community/removeLike.do",
					headers : {
					'Content-Type' : 'application/json',
								},
					method : "post",
					data : JSON.stringify(data),
					success : function(isMatched) {
						$("#send_msg"+ index).remove();
						$("#matched_text").empty();
						$("#"+loveball_btn).empty();
						$("#"+loveball_btn).append("Go! <img src='/img/inye-img/loveball.png'/>");
						$("#"+loveball_btn).attr("id","loveball_btn_default"+index);
					 	$("#partner"+data.likeObject).remove(); 
							}
						});
					}
				});
			}
		});
	});
</script>
</body>
</html>