<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH12tWJRl_6JyAnWqtt-yACdhnDxWrmyM&callback=initMap"></script>
    <script>
    
    var selcon = [];
    var lineCo = [];
    var map;
    var linePath;
	var lineOnoff=0;
    
	function initMap() {		
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 7,
          center: {lat:36.3382195, lng:127.41504459999999} //대충 남한 허리 부분... 대한민국 대전광역시 중구
        	//서울정중앙 {lat:37.5511694, lng:126.98822659999996}
        });
        
        var myIcon = new google.maps.MarkerImage("img/route/test_marker3.png", null, null, null, null);//new google.maps.Size(32,32)
     
        
		<c:forEach items="${list}" var="ls" varStatus="st">
		 	var hot${st.count} = '${ls.hotName}'; 
			var latlng${st.count} = {lat: parseFloat('${ls.hotLat}'), lng: parseFloat('${ls.hotLng}')};
			var contentString${st.count} = "${ls.hotName} "+
				"<input class=\"btn btn-primary btn-xs\" type=\"button\" id=\"dust\" value=\"추가\" onClick=\"addLog('${ls.hotName}', {lat: parseFloat(\'${ls.hotLat}\'), lng: parseFloat(\'${ls.hotLng}\')}, lineCo)\">";
			var marker${st.count} = new google.maps.Marker({
				position: latlng${st.count},
	            map: map,
	            icon: myIcon,
	            title: hot${st.count}
	        	});
	        var infowindow${st.count} = new google.maps.InfoWindow({
	        	content: contentString${st.count}
	        	});
	        google.maps.event.addListener(marker${st.count}, 'click', function() {
	        	infowindow${st.count}.open(map, marker${st.count});
	        	});
		</c:forEach>
      }
	
	function erase(){
	      var lo_table = document.getElementById("TblAttach");
	      var row_index = lo_table.rows.length-1; 
			for (var i=1; i<=row_index; i++) {
				lo_table.deleteRow(lo_table.rows.length-1);
					  }
		if(lineCo != []){
			if(lineOnoff==1){
			linePath.setMap(null);
			}
		}
		selcon = [];
		lineCo = [];		
	}
	
	function addLog(a, latlng, lineCo){
		if(pushReturn(a, selcon)==1){
			addItem(a);
		}
		
		if(pushReturn(latlng, lineCo)==1){
	 		if(lineOnoff==1){
				delLine();
			}
			
			if(lineCo.length>1){
				addLine();
			}
		}	
	}
	
	function pushReturn(a, b){
		if(b.length==0){
			b.push(a);
			return 1;
		} else {
			for (var i=0; i<b.length; i++) {
				  if(JSON.stringify(b[i])==JSON.stringify(a)){
					  return 0;
					  }
				}
		} 
		b.push(a); return 1;
	}
		
 	function addLine(){
 		if(lineOnoff==0){
 			var lineSymbol = {path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW};
 			linePath = new google.maps.Polyline({
 			    path: lineCo,
 			    icons: [{
 						  icon: lineSymbol,
 						  repeat:'50px',
 						  offset: '100%'
 						}],
 					 geodesic: true,
 					 strokeColor: '#FF0000',
 					 strokeOpacity: 0.7,
 					 strokeWeight: 1.5
 				   });
	 		linePath.setMap(map);
	 		lineOnoff=1;
 		}
	}
	
	function delLine(){
		linePath.setMap(null);
		lineOnoff=0;
	} 
		
	function addItem(a) {
	      var lo_table = document.getElementById("TblAttach");
	      var row_index = lo_table.rows.length; // 테이블(TR) row 개수
	      newTr = lo_table.insertRow(row_index);
	      newTr.idName = "newTr" + row_index;
	 
	      newTd=newTr.insertCell(0);
	      newTd.align = "center";
	      newTd.innerHTML= a;
	 
	      newTd=newTr.insertCell(1);
	      newTd.align = "center";
	      newTd.width = "1%";
	      newTd.innerHTML= "<input type='button' class='btn btn-default' value='Ⅹ' onClick='rowDelete(this)'>";
	}
		
	 function rowDelete(obj){
		 var num = $(obj).parent().parent().index()-1;
		  $(obj).parent().parent().remove();
		  selcon.splice(num, 1);
		  lineCo.splice(num, 1);		  
	 		if(lineOnoff==1){
				delLine();
			}
			if(lineCo.length>1){
				addLine();
			}
		  
		 }
	
	function inputSc(){
		if(selcon.length==0){
			alert("내용물이 없어요...");
		} else {
			var addr ="";
			for(a=0; a<selcon.length; a++){
				addr+=selcon[a];
				if(a!=selcon.length-1){
					addr+=", ";		
				}
			}
			var mseq = "${monPk}";
			if(mseq != "") {
				
				var data = new Object();
				data.location = addr;
				data.startDate = routePick.start.value+"";
				data.endDate = routePick.end.value+""; 
				
				
				//var data = {startDate:"111", endDate:"222"};
				console.log(data);
				$.ajax({
					url: "/eventInsert.do",
					headers: {
		                  "Content-Type" : "application/json"
		              }, 	
					method: "post",
					data: JSON.stringify(data),
					success: function(res){
						console.log("입력되었습니다.");
					}					
				});
			} else {
				alert("회원이 아닙니다.");
			}
		}
	}
    </script>
</head>
<body>
        <div class="container">
            <h1 class="page-title">새 일정 만들기</h1>
            <div style="text-align:right;margin: 10px 50px 10px 50px">
            <input class="btn btn-info btn-lg" type='button' value='추천 일정에서 선택하기' onclick = 'location.href="/recommend.do"'>
            </div>
        </div>

        <div class="container">
        </div>
        <div id="map" style="border:1px dashed #BDBDBD;height:400px;"></div>
        <div class="container">
            <div class="gap"></div>
            <div class="row">
            
	        	<div style="width:100%;">
	                <div class="col-md-7" style="width:50%;float:left">
	                	<p style="text-align:right;line-height:4.1em">
						<input class="btn btn-warning btn-lg" type='button' id='bat' value='목록 비우기' onClick='erase()'>
						</p>
						<div id="layer1">
						      <table border=1 width=100% id="TblAttach">
						      <tr>
						            <td width="100" align=center colspan=2><h4 style="line-height:2.1em">일정에 넣은 관광지</h4></td>
						      </tr>
						      </table>
						</div>										
	                </div>
	                <div style="float:left">
	                <form name="routePick" >
					<div class="input-daterange" data-date-format="yyyy/mm/dd">
						<div class="form-group form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-hightlight"></i>
							<label>Departing</label>
							<input class="form-control" name="start" type="text" />
						</div>
						<div class="form-group form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-hightlight"></i>
							<label>Returning</label>
							<input class="form-control" name="end" type="text" />
						</div>
					</div>                                                       
		            </form>
						<p style="text-align:center;line-height:4.1em">
						<input class="btn btn-warning btn-lg" type='button' id='mist' value='일정에 투입' onClick='inputSc()'>
						</p>			
					</div>
				</div>
        
                
                <div class="col-md-3" style="float:right">
                    <aside class="sidebar-right">
                    <!-- 적당히 써있는데 더 적당히 써서 수정하면 될듯 -->
                        <ul class="address-list list">
                            <li>
                                <h5>Email</h5><a href="#">GODinye@gamil.com</a>
                            </li>
                            <li>
                                <h5>Phone Number</h5><a href="#">국번없이 112</a>
                            </li>
                            <li>
                                <h5>Skype</h5><a href="#">contact_traveller</a>
                            </li>
                            <li>
                                <h5>Address</h5><address>Republic of Korea<br/>Seoul<br/>somewhere<br/></address>
                            </li>
                        </ul>
                    </aside>
                </div>
                
            </div>
            <div class="gap"></div>
        </div>
</body>
</html>