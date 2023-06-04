<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/head.jsp" %>
<style type="text/css">
#form1 {
	padding-left: 20px;
	padding-right: 20px;
	margin-top: 40px;
	margin-bottom: 40px;
}
.calendar-table tbody .available:first-child {
	color: #dc3545;
}
.calendar-table tbody .available:last-child {
	color: #03A9F4;
}
.select2-selection.select2-selection--single{
	height: 40px !important;
	border-color: #f7d953;
}
.select2-container--default .select2-selection--single {
   border-color: #f7d953 !important;
}
.select2-container--default .select2-selection--single .select2-selection__rendered {
    color: #555 !important;
    line-height: 40px !important;
}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${KAKAO_APP_KEY}&libraries=services"></script>
  <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css'>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</head>
<body>
	<c:import url="../include/header.jsp" />

	<section id="warp">
		<div class="container board-container" >
		        <ul class="board-left-tab"  id="pageTitle" >
            		<li>함께 타요</li>       
            	</ul>
            	
			<ul class="board-right-tab" style="float: none; text-align: right;display:block;  height: 50px;">
				<li><a class="button right-board" href="/ride/together/list">목록 보기</a></li>
			</ul>            	
            	
			<div class="panel panel-warning" style="border: 1px solid #dadada;">
				<div class="panel-title box-subject" style="border-bottom: 1px solid #dadada;">함께 타요 등록하기</div>
				<div class="container boardWriteForm" style="width: 100%;">

					<form name="form1" id="form1" action="/ride/together/write" enctype="multipart/form-data" method="post">


						<p>
							<input class="form-control tooltipstered winput" 	id="title" min="1" maxlength="50" required aria-required="true" 
							name="title" placeholder="제목을 입력해주세요 (최대 50자)" />
						</p>
						<p class="error">
							<form:errors path="title" />
						</p>


					<br>
					<p class="mt-5">
						<select class="form-control" name="startPlace" id="startPlace" >
						   <option value=""  >출발지역을 선택해 주세요.</option>
						  <c:forEach items="${dongList}" var="row">
						  	 <option value="${row.dongId}">${row.city} ${row.gu} ${row.dong}</option>
						  </c:forEach>
						</select>
						
						<script type="text/javascript">
						$(document).ready(function() {
						    $('#startPlace').select2();
						});
						</script>	
						
						

					</p>


					<br>
					<p>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-9">
							<input type="text" name="zoneCode" id="zoneCode" style="display: none">	
							<input id="address" type="text" name="address" class="form-control tooltipstered" 
							style="border: 1px solid #f7d953;"
							readonly="readonly"  placeholder="출발지 주소를 입력해 주세요.">		
						</div>
						
						<div class="col-xs-12 col-sm-12 col-md-3">
							<input type="button" onclick="sample5_execDaumPostcode()" 
								style="width: 60%;"
							value="출발지 주소 검색" class="btn-black">
							
							<a class="btn btn-primary "  target="_blank" href="https://map.kakao.com/" style="width: 100px;color: #fff">카카오맵</a>
						</div>
					</div>
					
					 <input type="hidden" name="latitude" id="latitude">
					 <input type="hidden" name="longitude" id="longitude">	
					 <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>			
					</p>
					
					
					<br>
					<p class="mt-5">
						<select class="form-control" name="place" id="place">
						   <option value=""  >도착지역을 선택해 주세요.</option>
						  <c:forEach items="${dongList}" var="row">
						  	 <option value="${row.dongId}">${row.city} ${row.gu} ${row.dong}</option>
						  </c:forEach>
						</select>
						
					<script type="text/javascript">
						$(document).ready(function() {
						    $('#place').select2();
						});
						</script>	
					</p>

	
					<br>
					<p>
					 	<span>함께타요 기간선택</span>
						<input type="text" id="ridePeriod" name="ridePeriod" class="form-control tooltipstered winput"  />
					</p>
					
	
	
	
					<br>
					<p>
					 	<span>요일선택</span>
					 	<div>
						<input type="checkbox" name="rideDay" value="월" > 월 &nbsp;	
						<input type="checkbox" name="rideDay" value="화"> 화 &nbsp;	
						<input type="checkbox" name="rideDay" value="수"> 수 &nbsp;	
						<input type="checkbox" name="rideDay" value="목"> 목 &nbsp;	
						<input type="checkbox" name="rideDay" value="금"> 금 &nbsp;	
						<input type="checkbox" name="rideDay" value="토"> 토 &nbsp;	
						<input type="checkbox" name="rideDay" value="일"> 일 &nbsp;	
						</div>
					
					</p>
					
	
	
						
					<br>
					<p>
					 	<span>시간선택</span>
						<input type="time" id="rideTime" name="rideTime" class="form-control tooltipstered winput"  />
					</p>
	
	
	
					<br>
					<p>
										
					 	<span>가격</span>
					 <div class="row">
					 
					 </div>
					 <div></div>
					 	<select name="ridePricePeriod" class="form-control" style="width: 30%;display: inline;">
					 		<option value="1일">1일</option>
					 		<option value="1주일">1주일</option>
					 		<option value="1개월">1개월</option>
					 	</select >
						<input type="number" id="ridePrice" name="ridePrice" class="form-control tooltipstered winput"  
						style="width: 60%; margin-left:5%; display: inline;" />
					</p>
	
	
	
	
	
					
					<br>

						<c:choose>
							<c:when test="${empty sessionScope.USER }">

								<p>
									<input class="form-control tooltipstered winput" min="1" maxlength="10" 								
									required aria-required="true" name="username" placeholder="작성자를 입력해주세요 (최대10자)" />
								</p>
								<p class="error">
									<form:errors path="username" />
								</p>

								<p>
									<input type="password" class="form-control tooltipstered winput" min="4" maxlength="4" required aria-required="true" name="boardPassword" placeholder="비밀번호를 입력해주세요 (4자)" />
								</p>
								<p class="error">
									<form:errors path="boardPassword" />
								</p>

							</c:when>
							<c:otherwise>
								<p>
									<input type="hidden" name="uid" value="${sessionScope.USER.uid }" >
								</p>
								<p>
									<input class="form-control tooltipstered winput" readonly="readonly" name="username" value="${sessionScope.USER.username }" /> <input type="hidden" name="userId"
										value="${sessionScope.USER.userId }" />
								</p>
							</c:otherwise>
						</c:choose>

						<input type="hidden" name="imgCnt" id="imgCnt" />



						<textarea id="summernote" name="content"></textarea>
					
					    <div style="margin: 20px 0px">	
							<div class="image-container">
							    <img style="width: 250px;" id="preview-image" src="">
							    <span>차량인증 이미지</span>
							    <input style="display: block;" type="file" id="input-image"  name="uploadfile" accept="image/*" >
							</div>					
						</div>
						 
						<input class="button form-control tooltipstered wsubmit" type="button"
						 onclick="writeBtn()" value="등록하기" style="color: #000">	
					
						
						
						<p class="error">
							<form:errors path="content" />
						</p>

					</form>
				</div>
			</div>
		</div>



	</section>


	   <%@ include file="../include/nav-bottom.jsp" %>
	   <%@ include file="../include/footer.jsp" %>
	<script src="/resources/web/js/summernote-ko-KR.js"></script>



<script src='https://cdn.jsdelivr.net/momentjs/latest/moment.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js'></script>

<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	<script>	
	function writeBtn(){
		
		const title =$("#title").val();	
		const startPlace =$("#startPlace").val();	
		const place =$("#place").val();		
		const address =$("#address").val();
		const ridePeriod =$("#ridePeriod").val();
		const rideDay =$("input:checkbox[name=rideDay]:checked").length;
		const rideTime=$("#rideTime").val();
		const ridePrice=$("#ridePrice").val();
		
/* 		const content =$('#summernote').summernote('code');
		console.log("content :",content ); */
		
		
		const uploadfile=$("#input-image").val();
		
		
		
		if(!title){
			alert("제목을 입력해 주세요.");
			$("#title").focus();
			return;	
		}
		
		
		if(!startPlace){
			alert("출발지역을 입력선택해 주세요.");
			$("#startPlace").focus();
			return;	
		}
		
		

		if(!address){
			alert("출발지 주소를 입력해 주세요.");
			$("#address").focus();
			return;	
		}
		
		
		if(!place){
			alert("도착지역을 선택해 주세요.");
			$("#place").focus();
			return;	
		}

		
		if(!ridePeriod){
			alert("기간을 선택해 주세요.");
			$("#ridePeriod").focus();
			return;	
		}
		
	
		if(rideDay==0){
			alert("요일을 선택해 주세요.");
			$("input:checkbox[name=rideDayCheckBox]").focus();
			return;	
		}

		
		if(!rideTime){
			alert("시간을 입력해 주세요.");
			$("#rideTime").focus();
			return;	
		}
		
		if(!ridePrice){
			alert("가격을 입력해 주세요.");
			$("#ridePrice").focus();
		}
		
		
		
		
		$("#form1").submit();
		
	}	
	
		function readImage(input) {

		    // 인풋 태그에 파일이 있는 경우
		    if(input.files && input.files[0]) {

		        // 이미지 파일인지 검사 (생략)

		        // FileReader 인스턴스 생성
		        const reader = new FileReader()

		        // 이미지가 로드가 된 경우
		        reader.onload = e => {
		            const previewImage = document.getElementById("preview-image")
		            previewImage.src = e.target.result
		        }

		        // reader가 이미지 읽도록 하기
		        reader.readAsDataURL(input.files[0])
		    }
		}

		// input file에 change 이벤트 부여
		const inputImage = document.getElementById("input-image")
		inputImage.addEventListener("change", e => {
		    readImage(e.target)
		})
		
			$('.toolbar_unit:last-child').css('display', 'none');
			$('.toolbar_unit:first-child').css('display', 'none');
			$(document).ready(
					function() {
						$('#summernote').summernote(
								{
									tabsize : 4,
									height : 500,
									lang : 'ko-KR',
									callbacks : {
										onImageUpload : function(files, editor,
												welEditable) {
											sendFile(files[0], editor,
													welEditable);
										}
									}
								});

						function sendFile(file, editor, welEditable) {
							data = new FormData();
							data.append("file", file);
							console.log('image upload:', file);
							$
									.ajax({
										url : "/summernote/upload",
										data : data,
										cache : false,
										contentType : false,
										processData : false,
										type : 'POST',
										success : function(data) {
											var image = $('<img>').attr('src',
													'' + data);
											$('#summernote').summernote(
													"insertNode", image[0]);
											$("#imgCnt").val("1");

											//console.log(data);
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											console.log(textStatus + " "
													+ errorThrown);
										}
									});
						}
					});
			
			
		</script>		
		
		
		
		<script>	
			
			/** 다음 주소 처리 */
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				mapOption = {
					center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
					level: 5 // 지도의 확대 레벨
				};

			//지도를 미리 생성
			var map = new daum.maps.Map(mapContainer, mapOption);
			//주소-좌표 변환 객체를 생성
			var geocoder = new daum.maps.services.Geocoder();
			//마커를 미리 생성
			var marker = new daum.maps.Marker({
				position: new daum.maps.LatLng(37.537187, 127.005476),
				map: map
			});


			function sample5_execDaumPostcode() {
				new daum.Postcode({
					oncomplete: function(data) {

						var zoneCode = data.zonecode;

						var addr = data.address; // 최종 주소 변수
						// 주소 정보를 해당 필드에 넣는다.
						document.getElementById("address").value = addr;

						document.getElementById("zoneCode").value = zoneCode;

						// 주소로 상세 정보를 검색
						geocoder.addressSearch(data.address, function(results, status) {
							// 정상적으로 검색이 완료됐으면
							if (status === daum.maps.services.Status.OK) {

								var result = results[0]; //첫번째 결과의 값을 활용

								$("#latitude").val(result.y);
								$("#longitude").val(result.x);
								
								// 해당 주소에 대한 좌표를 받아서
								var coords = new daum.maps.LatLng(result.y, result.x);
								// 지도를 보여준다.
								mapContainer.style.display = "block";
								map.relayout();
								// 지도 중심을 변경한다.
								map.setCenter(coords);
								// 마커를 결과값으로 받은 위치로 옮긴다.
								marker.setPosition(coords)
							}
						});



					}
				}).open();
			}
			
			
			const today = moment();
			
			
			
			$(function () {
	            $('#ridePeriod').daterangepicker({
	                "locale": {
	                    "format": "YYYY-MM-DD",
	                    "separator": " ~ ",
	                    "applyLabel": "확인",
	                    "cancelLabel": "취소",
	                    "fromLabel": "From",
	                    "toLabel": "To",
	                    "customRangeLabel": "Custom",
	                    "weekLabel": "W",
	                    "daysOfWeek": ["월", "화", "수", "목", "금", "토", "일"],
	                    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	                  
	                    
	                },
	                "minDate": today.add(0,'days').format('YYYY-MM-DD'),
	                "startDate": today.add(1,'days').format('YYYY-MM-DD'),
	                "endDate": today.add(1,'months').format('YYYY-MM-DD'),
	                "drops": "down",
	                
	                
	            }, function (start, end, label) {
	                console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
	            });
	        });
		</script>



</body>
</html>