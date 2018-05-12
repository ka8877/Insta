<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Don't come</title>

  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH12tWJRl_6JyAnWqtt-yACdhnDxWrmyM&callback=initMap"></script>
    <script>
    var selcon = [];
    var selnum = [];
    var lineCo = [];
    var map;
    var linePath;
	var lineOnoff=0;
    
	function initMap() {		
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 11,
          center: {lat:37.5511694, lng:126.98822659999996} //서울정중앙
        });
        
        var myIcon = new google.maps.MarkerImage("img/route/test_marker3.png", null, null, null, null);//new google.maps.Size(32,32)
      
		<c:forEach items="${list}" var="ls" varStatus="st">
		 	var hot${st.count} = '${ls.hotName}'; 
			var latlng${st.count} = {lat: parseFloat('${ls.hotLat}'), lng: parseFloat('${ls.hotLng}')};
			var contentString${st.count} = "${ls.hotPk}번 ${ls.hotName} "+
				"<input class=\"btn btn-primary btn-xs\" type=\"button\" id=\"dust\" value=\"추가\" onClick=\"addLog('${ls.hotName}', '${ls.hotPk}', {lat: parseFloat(\'${ls.hotLat}\'), lng: parseFloat(\'${ls.hotLng}\')}, lineCo)\">";
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
		selnum = [];
		lineCo = [];		
	}
	
	function addLog(hotname, hotpk, latlng, lineCo){
		if(pushReturn(hotname, selcon)==1){
			pushReturn(hotpk, selnum);
			addItem(hotname, hotpk);
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
		
	function addItem(hotname, hotpk) {
	      var lo_table = document.getElementById("TblAttach");
	      var row_index = lo_table.rows.length; // 테이블(TR) row 개수
	      newTr = lo_table.insertRow(row_index);
	      newTr.idName = "newTr" + row_index;
	 
	      newTd=newTr.insertCell(0);
	      newTd.align = "center";
	      newTd.innerHTML= hotname;

	      newTd=newTr.insertCell(1);
	      newTd.align = "center";
	      newTd.innerHTML= hotpk;     
	      
	      newTd=newTr.insertCell(2);
	      newTd.align = "center";
	      newTd.width = "1%";
	      newTd.innerHTML= "<input type='button' class='btn btn-default' value='Ⅹ' onClick='rowDelete(this)'>";
	}
		
	 function rowDelete(obj){
		 var num = $(obj).parent().parent().index()-1;
		  $(obj).parent().parent().remove();
		  selcon.splice(num, 1);
		  selnum.splice(num, 1);
		  lineCo.splice(num, 1);		  
	 		if(lineOnoff==1){
				delLine();
			}
			if(lineCo.length>1){
				addLine();
			}		  
		 }
	
	function inputSc(){
		if(selnum.length==0){
			alert("내용물이 없어요...");
		} else if(confirm('선택한 루트로 일정을 입력할까요?')){
			alert('이제 돌이킬 수 없습니다.');
			insertR.hotArray.value = selnum;
			insertR.submit();
		}
	}
    </script>
</head>
<body>
        <div class="container">
            <h1 class="page-title">일정 내용물 입력 : ${vo.rouName}</h1>
			<h4 style="text-align:right;line-height:2.1em">${vo.rouDetail}</h4>
            <div style="text-align:right;margin: 10px 50px 10px 50px">
            <input class="btn btn-info btn-lg" type='button' value='일정 입력으로 돌아가기' onclick = 'location.href="/route_input.do"'>
            <input class="btn btn-info btn-lg" type='button' value='관광지 추가하기' onclick = 'location.href="/spot_input.do"'>
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
	                	<form id=insertR action="/route_detail_insert.do" method="post">
		                	<p style="text-align:right;line-height:4.1em">	
		                	<input type='hidden' name='hotArray'>
		                	<input type='hidden' name='rouPk' value='${vo.rouPk}'>
		                	<input class="btn btn-warning btn-lg" type='button' id='mist' value='일정에 투입' onClick='inputSc()'>
							<input class="btn btn-warning btn-lg" type='button' id='bat' value='목록 비우기' onClick='erase()'>
							</p>
						</form>
						<div id="layer1">
						      <table border=1 width=100% id="TblAttach">
						      <tr>
						            <td width="100" align=center colspan=3><h4 style="line-height:2.1em">일정에 넣은 관광지</h4></td>
						      </tr>
						      </table>
						</div>										
	                </div>
				</div>
        
                
                <div class="col-md-5" style="float:right">
                    <aside class="sidebar-right">
						<img src="${vo.rouImg}"><br>                      
                        <ul class="address-list list">
                            <li>
                            	<h5>밈에는 정의가 없다</h5>아무거나 막 써놔라<br>되는대로 막 써놔라<br>그럴싸하게 써놔라<br>믿음직하게 써놔라
                            	<br><input type='button' value='POP TEAM EPIC' onClick='alert("이런 개잡놈을 봤나")'>
                            </li>
                        </ul>
                    </aside>
                </div>
                
            </div>
            <div class="gap"></div>
        </div>
</body>
</html>