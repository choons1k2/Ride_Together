<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../include/head.jsp" />
<link href="/resources/web/css/style-type-2.css" rel="stylesheet">

</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<section id="warp">
		<div class="container board-container" >

		
		<div class="row">
		 	<div class="col-xs-12 col-sm-12 col-md-12">						
			<div class="bn-box con">
				<h1 class="warp-title">함께 타요</h1>
				
			</div>	
			</div>
		</div> 
			
			<div class="row">					
				<form method="get" action="/ride/together/list" >
				   <div class="col-xs-12 col-sm-12 col-md-6">
					<ul class="board-search board-search-top">
						<li><select name="searchType" >
								
								<option value="s" <c:out value="${pageMaker.searchType eq 's' ? 'selected' : '' }" />>출발지역</option>
								<option value="e" <c:out value="${pageMaker.searchType eq 'e' ? 'selected' : '' }" />>도착지역</option>
								<option value="t" <c:out value="${pageMaker.searchType eq 't' ? 'selected' : '' }" />>제목</option>
								<option value="c" <c:out value="${pageMaker.searchType eq 'c' ? 'selected' : '' }" />>내용</option>
								<option value="w" <c:out value="${pageMaker.searchType eq 'w' ? 'selected' : '' }" />>작성자</option>
								<option value="tcw" <c:out value="${pageMaker.searchType eq 'tcw' ? 'selected' : '' }" />>제목+내용+작성자</option>
						</select></li>
						<li>
							<input type="search" name="keyword" value="${pageMaker.keyword }" placeholder="검색어 입력" >
						</li>
						<li><input type="submit" value="검색" class="button border-search-submit"></li>
					</ul>
			  </div>				
			 	 <div class="col-xs-12 col-sm-12 col-md-6">	
					<ul class="board-right-tab" >							
						<c:if test="${not empty USER }">
							<li><a class="button right-board" href="/ride/together/write">등록하기</a></li>
						</c:if>
					</ul>
					</div>
				</form>							
		  </div>
		  
		  

		<div class="row">
			 <div class="col-xs-12 col-sm-12 col-md-12">						 
			 	
			<div class="list con">
				<ul class="row">
					<c:forEach items="${list}" var="row" varStatus="status">
						<li  class="cell ${status.index %4 ==0? 'on':''}  ${(status.count%4==0) ? 'on3':'' }" onclick="location.href='/ride/together/read/${row.bno}?keyword=${param.keyword}&st=${param.st}'" >
							<div class="img-box">
								<c:choose>
									<c:when test="${empty row.fileName}">
										<img src="/resources/web/images/no_image.png"  alt="${row.title}">
									</c:when>
									<c:otherwise>
										<img src="/displayFile?fileName=${row.fileName}"  alt="${row.title}">	
									</c:otherwise>
								</c:choose>								
							</div>
							<div class="product-name"><h3>
							
							    <c:choose>
						           <c:when test="${fn:length(row.title) > 25}">
						            <c:out value="${fn:substring(row.title,0,25)}"/>....
						           </c:when>
						           <c:otherwise>
						            <c:out value="${row.title}"/>
						           </c:otherwise> 
						          </c:choose>
          
							
							</h3></div>
							
							<div data-toggle="tooltip" title="출발지역">
								<span class="red"><i class="fas fa-compass red" title="출발지역"  data-toggle="tooltip"></i> 출발:</span>
								<span class="f-15">${row.startPlaceDong}</span>
							</div>
							<div data-toggle="tooltip" title="도착지역" >
								<span class="blue"><i class="far fa-compass blue" title="도착지역"  data-toggle="tooltip"></i> 도착:</span> 
								<span class="f-15">${row.placeDong}</span>
							</div>
							
							<div class="d-flex justify-content-end">
							  <span>${row.ridePricePeriod}</span>&nbsp;
								<span>
								<fmt:formatNumber pattern="#,###" value="${row.ridePrice}" />
								원</span>
							</div>
							<div class="cell-bottom">
								<div class="username"><i class="fa fa-user"></i> ${row.username }							
									<span class="likeCnt">
										<span class="thumb" style="color: #666666"> 
										 <img class="board-star-img" src="/resources/web/images/star_grey.png">&nbsp;${row.likeCnt}
										</span>
									</span>
								</div>	
								
	 						
								<div class="date-and-view">
									
									<div class="date"><i class="fa fa-calendar"></i>	
									${row.rideDay} (${row.rideTime})								 	
									 
									</div>									
										
					
									<c:if test="${row.replyCnt>0 }">
										<span class="board-comments">
										<i class="fa fa-comments" title="댓글"></i> ${row.replyCnt} </span>
									</c:if>
									
									<span class="board-view">					
										<i class="fa fa-eye"  title="조회수" ></i> ${row.viewCnt}						
									</span>	
								</div>
						    </div>																
						</li>																	
				  </c:forEach>


				</ul>
				
				<c:if test="${empty list }">
						<h2 class="text-center" style="font-size: 1.5rem">검색 처리된 데이터가 없습니다.</h2>													
				</c:if>
			</div>
			 			
			 </div>
		 </div>
			
			
			${pagination }
			

		
		
			<div id="boardFooterAd"></div>

		</div>

	</section>


	<%@ include file="../include/nav-bottom.jsp"%>
	<%@ include file="../include/footer.jsp"%>
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   

});
</script>
</body>
</html>