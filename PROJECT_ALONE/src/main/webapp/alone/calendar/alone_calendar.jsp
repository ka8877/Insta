<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Highdmin - Responsive Bootstrap 4 Admin Dashboard</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!--calendar css-->
<link href="/css/fullcalendar.min.css" rel="stylesheet" />

<!-- App css -->
<link href="/css/bootstrap.min.css" rel="stylesheet" />
<link href="/css/icons.css" rel="stylesheet" />
<link href="/css/style.css" rel="stylesheet" />


<script src="/js/modernizr.min.js"></script>



</head>




<body>

	<div class="wrapper" style="padding-top: 50px; padding-bottom: 100px;">
		<div class="container-fluid">

			<!-- Page-Title -->
			<div class="row">
				<div class="col-sm-12">
					<div class="page-title-box">
						<div class="btn-group pull-right">
							<!-- 
                                <ol class="breadcrumb hide-phone p-0 m-0">
                                    <li class="breadcrumb-item"><a href="#">Highdmin</a></li>
                                    <li class="breadcrumb-item"><a href="#">Apps</a></li>
                                    <li class="breadcrumb-item active">Calendar</li>
                                </ol>
                                 -->
						</div>
						<h1 class="display-1" style="text-align: lift; font-family: 'Roboto', arial, helvetica, sans-serif;">세부일정 관리</h1>
						<br>
					</div>
				</div>
			</div>
			<!-- end page title end breadcrumb -->

			<div class="row">
				<div class="col-lg-12">

					<div class="card-box" style="padding: 0">
						<div class="row">

							<div class="col-lg-3">
									<br><br><br><br>
								<a href="#" data-toggle="modal" data-target="#add-category"
									class="btn btn-lg btn-custom btn-block waves-effect m-t-20 waves-light">
									<i class="fi-circle-plus"></i> Create New Event
								</a>

								<div id="external-events" class="m-t-20">
									<br>
									<p class="text-muted">Drag and drop your event or click in
										the calendar</p>
									<div class="external-event bg-success" data-class="bg-success">
										<i class="mdi mdi-checkbox-blank-circle mr-2 vertical-middle"></i>New
										Theme Release
									</div>
									<div class="external-event bg-info" data-class="bg-info">
										<i class="mdi mdi-checkbox-blank-circle mr-2 vertical-middle"></i>My
										Event
									</div>
									<div class="external-event bg-warning" data-class="bg-warning">
										<i class="mdi mdi-checkbox-blank-circle mr-2 vertical-middle"></i>Meet
										manager
									</div>
									<div class="external-event bg-purple" data-class="bg-purple">
										<i class="mdi mdi-checkbox-blank-circle mr-2 vertical-middle"></i>Create
										New theme
									</div>
								</div>

								<div class="checkbox checkbox-primary mt-3">
									<input type="checkbox" id="drop-remove"> <label
										for="drop-remove"> Remove after drop </label>
								</div>

								<div class="mt-5 d-none d-xl-block"></div>


							</div>
							<br><br><br><br>
							<!-- end col-->

							<div class="col-lg-9">
								<div id="calendar"></div>
								
							</div>

							<!-- end col -->
						</div>
						<!-- end row -->
					</div>

					<!-- BEGIN MODAL -->
					<div class="modal fade" id="event-modal" tabindex="-1">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header text-center border-bottom-0 d-block">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title">Add New Event</h4>
								</div>
								<div class="modal-body"></div>
								<div class="modal-footer border-0 pt-0">
									<button type="button" class="btn btn-light waves-effect"
										data-dismiss="modal">Close</button>
									<button type="button"
										class="btn btn-success save-event waves-effect waves-light">Create
										event</button>
									<button type="button"
										class="btn btn-danger delete-event waves-effect waves-light"
										data-dismiss="modal">Delete</button>
								</div>
							</div>
						</div>
					</div>

					<!-- Modal Add Category -->
					<div class="modal fade" id="add-category" tabindex="-1">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header text-center border-bottom-0 d-block">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title mt-2">Add a category</h4>
								</div>
								<div class="modal-body p-4">
									<form role="form">
										<div class="form-group">
											<label class="control-label">Category Name</label> <input
												class="form-control form-white" placeholder="Enter name"
												type="text" name="category-name" />
										</div>
										<div class="form-group">
											<label class="control-label">Choose Category Color</label> 
											<select class="form-control form-white"
												data-placeholder="Choose a color..." name="category-color" style="height: 34px;">
												<option value="success">Success</option>
												<option value="danger">Danger</option>
												<option value="info">Info</option>
												<option value="pink">Pink</option>
												<option value="primary">Primary</option>
												<option value="warning">Warning</option>
												<!-- <option value="inverse">Inverse</option> -->
											</select>
										</div>

									</form>

									<div class="text-right">
										<button type="button" class="btn btn-light waves-effect"
											data-dismiss="modal">Close</button>
										<button type="button"
											class="btn btn-custom ml-1 waves-effect waves-light save-category"
											data-dismiss="modal">Save</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- END MODAL -->
				</div>
				<!-- end col-12 -->
			</div>
			<!-- end row -->

		</div>
		<!-- end container -->
	</div>
	<!-- end wrapper -->



	<!-- jQuery  -->

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/waves.js"></script>
	<script src="/js/jquery.slimscroll.js"></script>

	<!-- Jquery-Ui -->
	<script src="/js/jquery-ui.min.js"></script>

	<!-- SCRIPTS -->
	<script src="/js/moment.js"></script>
	<script src='/js/fullcalendar.min.js'></script>
	<!-- <script src="/js/jquery.calendar.js"></script> -->



	<script type="text/javascript">
            
			var evtArr = new Array();
        	
			<c:forEach items="${list}" var="evo">
				var sdate = new Date("${evo.startDate}");
				var edate = new Date("${evo.endDate}");
				var title = '${evo.summary}';
				var id = '${evo.evtId}';
				var className = '${evo.colorId}';
	        	
				var json = {
					title : title,
					start : sdate,
					end : edate,
					id : id,
					className : className
				};
	        	
	        	evtArr.push(json);
	        </c:forEach>
	       	
        
		
		
		


!function($) {
    "use strict";

    var CalendarApp = function() {
    	console.log("CalendarApp");
        this.$body = $("body")
        this.$modal = $('#event-modal'),
        this.$event = ('#external-events div.external-event'),
        this.$calendar = $('#calendar'),
        this.$saveCategoryBtn = $('.save-category'),
        this.$categoryForm = $('#add-category form'),
        this.$extEvents = $('#external-events'),
        this.$calendarObj = null
    };


    /* on drop */
    CalendarApp.prototype.onDrop = function (eventObj, date) { 
    
    	console.log("CalendarApp.prototype.onDrop");
    	console.log(date);
    	console.log(date.format());
    	console.log(eventObj[0].dataset.class);
    	console.log(eventObj[0].innerText);
    	
    	var insert = new Object();
    	insert.summary = eventObj[0].innerText;
    	insert.colorId = eventObj[0].dataset.class;
    	insert.startDate = date.format();
        var $this = this;
    	
    	var id = new Object();
    	
		$.ajax({
    		
        	url:"/eventInsert.do",
        	headers:{
        		'Content-Type':'application/json'
        	},
        	type:"post",
        	data: JSON.stringify(insert),
        	success:function(result){
        		console.log(result);
        		console.log(result.summary);
        		console.log(result.evtId);
        		console.log(result.htmlLink);
        		id = result.evtid;
        		
		        // retrieve the dropped element's stored Event Object
		        var originalEventObject = eventObj.data('eventObject');
		        var $categoryClass = eventObj.attr('data-class');
		        console.log($categoryClass);
		        // we need to copy it, so that multiple events don't have a reference to the same object
		        var copiedEventObject = $.extend({}, originalEventObject);
		        // assign it the date that was reported
		        copiedEventObject.start = date;
		        copiedEventObject.id = result.evtId;
		        if ($categoryClass)
		            copiedEventObject['className'] = [$categoryClass];
		        // render the event on the calendar
	        	console.log(copiedEventObject);
				$this.$calendar.fullCalendar('renderEvent', copiedEventObject, true);
        	}
        });
		
        // is the "remove after drop" checkbox checked?
        if ($('#drop-remove').is(':checked')) {
            // if so, remove the element from the "Draggable Events" list
            eventObj.remove();
        }
		
		
    },
    
    
    /* on click on event */
   /* 기존 event 변경 model 설정 */
    CalendarApp.prototype.onEventClick =  function (calEvent, jsEvent, view) {
    	
        var $this = this;
        var form = $("<form></form>");
    	
    	var getEvt = new Object();
    	getEvt.evtId = calEvent.id;
    	var evtMap = new Object();
    	
    	$.ajax({
    		
        	url:"/eventGet.do",
        	headers:{
        		'Content-Type':'application/json'
        	},
        	type:"post",
        	data: JSON.stringify(getEvt),
        	success:function(result){
        		console.log(result);
        		evtMap.summary = result.summary;
        		evtMap.description = 'dddd';
        		console.log(evtMap.description);
        		if(result.description === undefined || result.description === null){
        			evtMap.description = '세부 일정이 없습니다';
        			console.log(evtMap.description);
        		} else {
        			evtMap.description = result.description
        			console.log(evtMap.description);
        		}
        		
        		evtMap.htmlLink = result.htmlLink
		        form.append("<h4 class='modal-title'>" + evtMap.summary + "</h4><br>");
		        form.append("<div class='input-group m-b-15'><br><div style='width:98%;'>" + evtMap.description + "</div><span class='input-group-btn'><button type='button' id='edit' class='btn btn-success btn-md waves-effect waves-light'><i class='fa fa-edit'></i> 수정</button></span></div><br><a class='btn btn-outline-danger waves-light waves-effect' data-dismiss='modal' href='"+ evtMap.htmlLink +"'>Google Calendar</a></div>");
        	}
        });
    	
        $this.$modal.modal({
            backdrop: 'static'
        });
    	
        $this.$modal.find('.delete-event').show().end().find('.save-event').hide().end().find('.modal-body').empty().prepend(form).end().find('.delete-event').unbind('click').click(function () {
			$this.$calendarObj.fullCalendar('removeEvents', function (ev) {
            	console.log();
            	console.log(ev);
            	console.log(calEvent);
            	if(ev._id == 'orb2l7lmjppfs8k97j3b3lkju4'){
            		console.log('몇번');
            	}
            	if (ev._id === calEvent._id){
            		
            		var del = new Object();
            		console.log(ev.id)
            		del.evtId = ev.id;
            		console.log(del);
	                
            		$.ajax({
	                	url:"/eventDelete.do",
	                	headers:{
	                		'Content-Type':'application/json'
	                	},
	                	type:"POST",
	                	data: JSON.stringify(del),
	                	success:function(result){
	                		console.log(result);
	                	}
	                });
            		
            	}
            	
                return (ev._id == calEvent._id);
            });
            $this.$modal.modal('hide');
        });
        
        
        $this.$modal.find("form").on('click', function (e) {
        	console.log(e);
        	var target = e.target.id;
        	console.log(target);
        	if(target == 'edit'){
        		
	        	form.empty();
	            form.append("<div class='input-group m-b-15'><input class='form-control' type=text value='" + evtMap.summary + "' />&nbsp;<span class='input-group-btn'><button type='button' id='save' class='btn btn-success btn-md waves-effect waves-light'><i class='fa fa-check'></i> Save</button></span></div><br><div><textarea id='textarea' class='form-control' placeholder='일정의 내용을 기입해 주세요'></textarea></div>");
	        	
	            $("#save").one("click", function(){
	            	
	        		calEvent.title = form.find("input[type=text]").val();
	        		console.log(form.find("textarea#textarea").val());
	                var description = form.find("textarea#textarea").val();
	                
	                
	                var update = new Object();
	                update.summary = calEvent.title;
	                update.evtId = calEvent.id;
	                update.description = description;
	                
	                console.log(update.summary);
	                console.log(update.evtId);
	                
	                $.ajax({
	                	
	                	url:"/eventUpdate.do",
	                	headers:{
	                		'Content-Type':'application/json'
	                	},
	                	type:"POST",
	                	data: JSON.stringify(update),
	                	
	                	success:function(result){
	                		console.log(result);
	                		console.log(result.summary);
	                		console.log(result.description);
	                		console.log(result.htmlLink);
	                		$this.$calendarObj.fullCalendar('updateEvent', calEvent);
	                	}
	                });
	                
	                $this.$modal.modal('hide');
	                return false;
	        		
	        	});
        	}
        });
        
    },
    /* 기존 event 변경 model 설정 end */
    
    /* on select */
    CalendarApp.prototype.onSelect = function (start, end, allDay) {
    	console.log("CalendarApp.prototype.onSelect");
    	
    	console.log(allDay);
    	
        var $this = this;
        console.log($this);
            $this.$modal.modal({
                backdrop: 'static'
            });
            var form = $("<form></form>");
            form.append("<div class='row'></div>");
            form.find(".row")
                .append("<div class='col-md-6'><div class='form-group'><label class='control-label'>Event Name</label><input class='form-control' placeholder='Insert Event Name' type='text' name='title'/></div></div>")
                .append("<div class='col-md-6'><div class='form-group'><label class='control-label'>Category</label><select class='form-control' name='category' style='height: 34px;'></select></div></div>")
                .find("select[name='category']")
                .append("<option value='bg-danger'>Danger</option>")
                .append("<option value='bg-success'>Success</option>")
                .append("<option value='bg-purple'>Purple</option>")
                .append("<option value='bg-primary'>Primary</option>")
                .append("<option value='bg-pink'>Pink</option>")
                .append("<option value='bg-info'>Info</option>")
                .append("<option value='bg-warning'>Warning</option></div></div>");
            $this.$modal.find('.delete-event').hide().end().find('.save-event').show().end().find('.modal-body').empty().prepend(form).end().find('.save-event').unbind('click').click(function () {
               
            	form.submit();
            });
            $this.$modal.find('form').on('submit', function () {
                var title = form.find("input[name='title']").val();
                var beginning = form.find("input[name='beginning']").val();
                var ending = form.find("input[name='ending']").val();
                var categoryClass = form.find("select[name='category'] option:checked").val();
                
                if (title !== null && title.length != 0) {
                	
                	console.log("fffffffffffffffffffffffZ"+categoryClass);
                	
					var insert = new Object();
					insert.summary = title;
					insert.startDate = start;
					insert.endDate = end;
					insert.colorId = categoryClass;
					$.ajax({
                    	url:"/eventInsert.do",
                    	headers:{
                    		'Content-Type':'application/json'
                    	},
                    	type:"post",
                    	data: JSON.stringify(insert),
                    	
                    	success:function(result){
                    		
                    		console.log(result);
                    		console.log(result.summary);
                    		console.log(result.evtId);
                    		console.log(result.htmlLink);
                    		
		                    $this.$calendarObj.fullCalendar('renderEvent', {
		                        title: result.summary,
		                        start:start,
		                        end: end,
		                        allDay: false,
		                        className: categoryClass,
		                        id: result.evtId
		                    }, true);  
                    	}
                    });
                    $this.$modal.modal('hide');
                    
                }
                else{
                    alert('You have to give a title to your event');
                }
                return false;
                
            });
            $this.$calendarObj.fullCalendar('unselect');
    },
    /* model 창 js설정  end */
    
    CalendarApp.prototype.enableDrag = function() {
        
    	console.log("CalendarApp.prototype.enableDrag");
        //init events
        $(this.$event).each(function () {
            // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
            // it doesn't need to have a start or end
            var eventObject = {
                title: $.trim($(this).text()) // use the element's text as the event title
            };
            // store the Event Object in the DOM element so we can get to it later
            $(this).data('eventObject', eventObject);
            // make the event draggable using jQuery UI
            $(this).draggable({
                zIndex: 999,
                revert: true,      // will cause the event to go back to its
                revertDuration: 0  //  original position after the drag
            });
        });
    },
    
    CalendarApp.prototype.evtResize =  function (event) {
    	console.log('이건 리사이즈야 함수야');
    	console.log(event);
    	console.log(event.end); 
    	console.log(event._end.format()); 
    	
    	var update = new Object();
        update.evtId = event.id;
        update.endDate = event._end.format();
		        
        $.ajax({
        	
        	url:"/eventUpdate.do",
        	headers:{
        		'Content-Type':'application/json'
        	},
        	type:"POST",
        	data: JSON.stringify(update),
        	
        	success:function(result){
        		console.log(result);
        		console.log(result.summary);
        		console.log(result.description);
        		console.log(result.htmlLink);
        	}
        });
    	
    },
    
    CalendarApp.prototype.evtDrop =  function (event) {
    	console.log('이건 드롭 함수야');
    	console.log(event);
    	console.log(event._end.format()); 
    	console.log(event._start.format()); 
    	
    	var update = new Object();
        update.evtId = event.id;
        update.endDate = event._end.format();
        update.startDate = event._start.format();
		      
        $.ajax({
        	
        	url:"/eventUpdate.do",
        	headers:{
        		'Content-Type':'application/json'
        	},
        	type:"POST",
        	data: JSON.stringify(update),
        	
        	success:function(result){
        		console.log(result);
        		console.log(result.summary);
        		console.log(result.description);
        		console.log(result.htmlLink);
        	}
        });
        
    }
    
	/*  CalendarApp.prototype. */

	/* Initializing */
    CalendarApp.prototype.init = function() {
    	
    	console.log("CalendarApp.prototype.init");
    	
        this.enableDrag();
        /*  Initialize the calendar  */
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        var form = '';
        var today = new Date($.now());
        
        var $this = this;
        $this.$calendarObj = $this.$calendar.fullCalendar({
            slotDuration: '00:15:00', /* If we want to split day time each 15minutes */
            minTime: '00:00:00',
            maxTime: '24:00:00',
            defaultView: 'month',  
            handleWindowResize: true,   
            height: $(window).height() - 200,   
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            events: evtArr,
            editable: true,
            droppable: true, // this allows things to be dropped onto the calendar !!!
            eventLimit: true, // allow "more" link when too many events
            selectable: true,
            /* selectHelper: true, */
            drop: function(date) { $this.onDrop($(this), date); },
            select: function (start, end, allDay) { $this.onSelect(start, end, allDay); }, 
            /* eventDragStop: function( event, jsEvent, ui, view ) { console.log(event.end); console.log(event._end); console.log('이건 드래그스톱이야');
            	$this.ResizeStop(event);
            }, */
			eventDrop: function(event) { console.log(event.start.format());console.log(event.end.format()); console.log('이건 드롭이야');
				$this.evtDrop(event);
			},
            eventResize: function(event) { console.log(event._end);console.log(event.end); console.log(event._end._d); console.log('이건 리사이즈야'); 
            	$this.evtResize(event);
            },
            eventClick: function(calEvent, jsEvent, view) { $this.onEventClick(calEvent, jsEvent, view); }

        });
        

        //on new event 새로운 이벤트 카테고리 생성 -- 필요없음
        this.$saveCategoryBtn.on('click', function(){
        	
            var categoryName = $this.$categoryForm.find("input[name='category-name']").val();
            var categoryColor = $this.$categoryForm.find("select[name='category-color']").val();
            if (categoryName !== null && categoryName.length != 0) {
                $this.$extEvents.append('<div class="external-event bg-' + categoryColor + '" data-class="bg-' + categoryColor + '" style="position: relative;"><i class="mdi mdi-checkbox-blank-circle mr-2 vertical-middle"></i>' + categoryName + '</div>')
                $this.enableDrag();
            }

        });
    },

   //init CalendarApp
    $.CalendarApp = new CalendarApp, $.CalendarApp.Constructor = CalendarApp
    
}(window.jQuery),

//initializing CalendarApp
function($) {
	console.log("init");
    "use strict";
    $.CalendarApp.init()
}(window.jQuery);

		
		
		
		
		
		</script>


	<!-- App js -->
	<script src="/js/jquery.core.js"></script>
	<script src="/js/jquery.app.js"></script>

</body>
</html>


