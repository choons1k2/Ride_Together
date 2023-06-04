<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
      <nav class="sidebar sidebar-offcanvas danger" id="sidebar">
        <ul class="nav">
          
          
          <li class="nav-item">
            <a class="nav-link" href="${home}/">            
              <i class="menu-icon mdi mdi-home"></i> 
              <span class="menu-title">사이트홈</span>              
            </a>
          </li>
    
          <li class="nav-item">
            <a class="nav-link" href="/members">
              <i class="menu-icon mdi mdi-account-card-details"></i>
              <span class="menu-title">마이페이지</span>
            </a>
          </li>
          
    
     
     

    
            
         
         
         
				<c:if test="${USER.role eq 'ROLE_ADMIN'}">  
				      <li class="nav-item">
			            <a class="nav-link collapsed" data-bs-toggle="collapse" 
			           	 href="#form-members" aria-expanded="false" aria-controls="form-members">
			              <i class="menu-icon mdi mdi-account-multiple-outline"></i>
			              <span class="menu-title">회원관리</span>
			              <i class="menu-arrow"></i>
			            </a> 
		         	<div class="collapse" id="form-members">
		              <ul class="nav flex-column sub-menu">
		                 <li class="nav-item"> 
		                 	<a class="nav-link" href="#" onclick="location.href='${home}/admin/member/memberList'"> 회원목록</a>
		                 </li>
		
		                 <li class="nav-item"> 
		                 	<a class="nav-link" href="#" onclick="location.href='${home}/admin/member/memberWrite'"> 회원등록</a>
		                 </li>
		              </ul>
		            </div>
		          </li>
          
      		 </c:if>


       
	         <li class="nav-item ${menuName eq '쪽지관리'  ?  'active':''}">
	           <a class="nav-link" href="#" onclick="location.href='${home}/admin/note/receiveList'">
	            <i class="far fa-paper-plane menu-icon"></i> 
	             <span class="menu-title">쪽지관리</span>
	           </a>
	         </li>
	    
       

       
  
 
          
          

        </ul>
      </nav>