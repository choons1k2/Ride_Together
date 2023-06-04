<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="./include/head.jsp" %>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link href="/resources/web/css/main.css" rel="stylesheet">	
<link href="/resources/web/css/main-slide.css" rel="stylesheet">	
</head>
<body>

	<%@ include file="./include/header.jsp" %>
	
	
	<section style="margin-bottom: 50px">
		<div class="container board-container" >


			 			
			
			<div class="list con">
				<div class="title text-center"><h3 class="text-center">출퇴근은 물론, 다양한 곳  함께 타요.</h3></div>
			<div class="reservation_list_wrap on">
    <div class="index_res_list">
        
            <ul>
                                    <li>
                        <ul class="reservation_ul">
                                                        <li type="0" rel="res_trip_layer">
                                                                    <button type="button" class="res_type_link" value="id_air">
                                        <strong class="res_air"></strong><span>공항</span>
                                    </button>
                                                            </li>
                            <li type="0" rel="res_trip_layer">
                                                                    <button type="button" class="res_type_link" value="id_train">
                                        <strong class="res_train"></strong><span>철도역</span>
                                    </button>
                                                            </li>
                            <li type="0" rel="res_trip_layer">
                                                                    <button type="button" class="res_type_link" value="id_ship">
                                        <strong class="res_ship"></strong><span class="long">여객선터미널</span>
                                    </button>
                                                            </li>
                            <li type="0" rel="res_trip_layer">
                                                                    <button type="button" class="res_type_link" value="id_calt">
                                        <strong class="res_calt"></strong><span class="long">도심공항터미널<br class="pc_chk">(코엑스)</span>
                                    </button>
                                                            </li>
                            <li type="0" rel="res_trip_layer">
                                                                    <button type="button" class="res_type_link" value="id_golf">
                                        <strong class="res_golf"></strong><span>골프</span>
                                    </button>
                                                            </li>
                            <li class="list_info_div">
                                <div class="res_type_txt res_trip_layer" id="res_trip_layer">
                                    <img src="https://tagogayo.co.kr/assets//img/reservation/res_type_point_new.png" class="res_type_point">
                                    <i class="sup_badge hidden">골프장 콜밴 100% 활용법</i>
                                    <strong>집에서 공항, 공항에서 집까지 이용하는 서비스</strong>
                                    <span>(경유지, 유아카시트, 공항영접 피켓서비스, 반려동물 동승, 외국어 가능 운전기사 선택, paypal 결제, 블루멤버스 포인트 결제 가능)</span>
                                    <a><img src="https://tagogayo.co.kr/assets//img/common/reser_btn_img.png">예약하러 가기</a>
                                </div>
                                                            </li>
                        </ul>
                    </li>
                                                    <li>
                        <ul class="reservation_ul">
                                                        <li type="1" rel="res_purpose_layer">
                                <button type="button" class="res_type_link" value="id_wedding">
                                    <strong class="res_wedding"></strong><span>웨딩</span>
                                </button>
                            </li>
                            <li type="1" rel="res_purpose_layer">
                                <button type="button" class="res_type_link" value="id_trip">
                                    <strong class="res_trip"></strong><span>여행투어</span>
                                </button>
                            </li>
                            <li type="1" rel="res_purpose_layer">
                                <button type="button" class="res_type_link" value="id_hospital">
                                    <strong class="res_hospital"></strong><span>병원동행</span>
                                </button>
                            </li>
                                                            <li type="1" rel="res_purpose_layer">
                                    <button type="button" class="res_type_link" value="id_gomsin">
                                        <strong class="res_gomsin"></strong><span class="long">군인입소/휴가</span>
                                    </button>
                                </li>
                                                        <li type="1" rel="res_purpose_layer">
                                <button type="button" class="res_type_link" value="id_show">
                                    <strong class="res_show"></strong><span class="long">공연&amp;페스티벌</span>
                                </button>
                            </li>
                            <li class="list_info_div">
                                <div class="res_type_txt res_purpose_layer" id="res_purpose_layer">
                                    <img src="https://tagogayo.co.kr/assets//img/reservation/res_type_point_new.png" class="res_type_point">
                                    <strong>집에서 공항, 공항에서 집까지 이용하는 서비스</strong>
                                    <span>(경유지, 유아카시트, 공항영접 피켓서비스, 반려동물 동승, 외국어 가능 운전기사 선택, paypal 결제, 블루멤버스 포인트 결제 가능)</span>
                                    <a><img src="https://tagogayo.co.kr/assets//img/common/reser_btn_img.png">예약하러 가기</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <ul class="reservation_ul">
                            <li type="2" rel="res_show_layer">
                                <button type="button" class="res_type_link" value="id_company">
                                    <strong class="res_company"></strong><span>기업행사</span>
                                </button>
                            </li>
                            <li type="2" rel="res_show_layer">
                                <button type="button" class="res_type_link" value="id_mt">
                                    <strong class="res_mt"></strong><span>대학교/MT</span>
                                </button>
                            </li>
                                                            <li type="2" rel="res_show_layer">
                                    <button type="button" class="res_type_link" value="id_school">
                                        <strong class="res_school"></strong><span class="long">등·하교/학교이동</span>
                                    </button>
                                </li>
                                                        <li type="2" rel="res_show_layer">
                                <button type="button" class="res_type_link" value="id_meeting">
                                    <strong class="res_meeting"></strong><span>동호회</span>
                                </button>
                            </li>
                            <li type="2" rel="res_show_layer">
                                <button type="button" class="res_type_link" value="id_limousine">
                                    <strong class="res_limousine"></strong><span>리무진차량</span>
                                </button>
                            </li>
                            <li class="list_info_div">
                                <div class="res_type_txt res_show_layer" id="res_show_layer">
                                    <img src="https://tagogayo.co.kr/assets//img/reservation/res_type_point_new.png" class="res_type_point">
                                    <strong>집에서 공항, 공항에서 집까지 이용하는 서비스</strong>
                                    <span>(경유지, 유아카시트, 공항영접 피켓서비스, 반려동물 동승, 외국어 가능 운전기사 선택, paypal 결제, 블루멤버스 포인트 결제 가능)</span>
                                    <a><img src="https://tagogayo.co.kr/assets//img/common/reser_btn_img.png">예약하러 가기</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <ul class="reservation_ul">
                            <li type="3" rel="res_etc_layer">
                                                                    <button type="button" class="res_type_link" value="id_semina">
                                        <strong class="res_semina"></strong><span>세미나</span>
                                    </button>
                                                            </li>
                            <li type="3" rel="res_etc_layer">
                                <button type="button" class="res_type_link" value="id_ski">
                                    <strong class="res_ski"></strong><span>스키장</span>
                                </button>
                            </li>
                            <li type="3" rel="res_etc_layer">
                                <button type="button" class="res_type_link" value="id_sports">
                                    <strong class="res_sports"></strong><span>스포츠관람</span>
                                </button>
                            </li>
                            <li type="3" rel="res_etc_layer">
                                <button type="button" class="res_type_link" value="id_religion">
                                    <strong class="res_religion"></strong><span>종교행사</span>
                                </button>
                            </li>
                            <li type="3" rel="res_etc_layer">
                                <button type="button" class="res_type_link" value="id_park">
                                    <strong class="res_park"></strong><span>테마파크</span>
                                </button>
                            </li>
                            <li class="list_info_div">
                                <div class="res_type_txt res_etc_layer" id="res_etc_layer">
                                    <img src="https://tagogayo.co.kr/assets//img/reservation/res_type_point_new.png" class="res_type_point">
                                    <strong>집에서 공항, 공항에서 집까지 이용하는 서비스</strong>
                                    <span>(경유지, 유아카시트, 공항영접 피켓서비스, 반려동물 동승, 외국어 가능 운전기사 선택, paypal 결제, 블루멤버스 포인트 결제 가능)</span>
                                    <a><img src="https://tagogayo.co.kr/assets//img/common/reser_btn_img.png">예약하러 가기</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <ul class="reservation_ul">
                            <li type="4" rel="res_etc_layer2">
                                <button type="button" class="res_type_link" value="id_vip">
                                    <strong class="res_vip"></strong><span>VIP의전</span>
                                </button>
                            </li>

                            <li type="4" rel="res_etc_layer2">
                                <button type="button" class="res_type_link" value="id_etc">
                                    <strong class="res_etc"></strong><span>기타</span>
                                </button>
                            </li>

                            <li class="list_info_div">
                                <div class="res_type_txt res_etc_layer2" id="res_etc_layer2">
                                    <img src="https://tagogayo.co.kr/assets//img/reservation/res_type_point_new.png" class="res_type_point">
                                    <strong>집에서 공항, 공항에서 집까지 이용하는 서비스</strong>
                                    <span>(경유지, 유아카시트, 공항영접 피켓서비스, 반려동물 동승, 외국어 가능 운전기사 선택, paypal 결제, 블루멤버스 포인트 결제 가능)</span>
                                    <a><img src="https://tagogayo.co.kr/assets//img/common/reser_btn_img.png">예약하러 가기</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                            </ul>
            </div>
</div>
			</div>
					
						

			
	
	
		<div class="list con mt-5">
				<div class="title text-center"><h3>이동을 이어, 생활을 연결합니다.</h3></div>
		
		    <div class="text-center">
		    	<img src="/resources/web/images/main2.png">
		    </div>
		  </div>			
			
			
			
		
			
			<div class="row" id="main-board" ㄴ>
			
				
				<div class="col-xs-11 col-sm-6 col-md-6" style="border-right: 2px solid #eee;">
					<!-- 게시판1 -->
				  <div class="notice">
				      <h4><a href="/ride/together/list">함께 타요</a></h4>
				      <ul>
				      	<c:forEach items="${rideList}" var="row">
				        	<li><a href="/ride/together/read/${row.bno}?page=1">${row.title}</a><span><fmt:formatDate value="${row.createdDate}"  pattern="yyyy-MM-dd"/> </span></li>
				      	</c:forEach>		
				      </ul> 
				      <a href="/ride/together/list" class="more ir_pm" title="더보기"><span class="fas fa-plus-circle" aria-hidden="true"></span></a>
				  </div>
				<!-- //게시판1 -->
				</div>
				
			  <div class="col-xs-11 col-sm-6 col-md-6" >
			  					<!-- 게시판2 -->
				  <div class="notice">
				      <h4><a href="/board/free/list">자유게시판</a></h4>
				      <ul>
				      	<c:forEach items="${freeList}" var="row">
				        	<li><a href="/board/free/read/${row.bno}?page=1">${row.title}</a><span><fmt:formatDate value="${row.createdDate}"  pattern="yyyy-MM-dd"/> </span></li>
				      	</c:forEach>
				      </ul> 
				      <a href="/board/free/list" class="more ir_pm" title="더보기"><span class="fas fa-plus-circle" aria-hidden="true"></span></a>
				  </div>
				<!-- //게시판2 -->
				

				</div>
								
			</div>
			
			
					
					
		</div>

	</section>


	<%@ include file="./include/nav-bottom.jsp"%>
	<%@ include file="./include/footer.jsp"%>

	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>
//갤러리
$(".ban").slick({    
	   infinite: true,
       slidesToShow: 1,
       slidesToScroll: 1,
       autoplay:true,
       autoplaySpeed:3000,
       fade:true,
       dots:true,
       responsive: [ // 반응형 웹 구현 옵션	 
		
			{ 
				breakpoint: 479, //화면 사이즈 479px
				settings: {	
					//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
					slidesToShow:1 
				} 
			}
		]
});
</script>
</body>
</html>


