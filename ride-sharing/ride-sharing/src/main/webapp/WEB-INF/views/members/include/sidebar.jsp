<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.sidebar-dark .sidebar-brand ,.sidebar-dark .nav-item.active .nav-link, .sidebar .nav-item .nav-link span, .sidebar-dark .nav-item.active .nav-link i
, .sidebar-dark .sidebar-heading{
	color: #000;
}
.sidebar-dark .nav-item .nav-link i{
color:#5a5c69;
}
.sidebar .nav-item .nav-link span:hover, .sidebar-dark .nav-item .nav-link:hover span{
	color: #fff;
}
</style>

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-warning sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-start" href="/members">
         			         
           
              <span class="sidebar-brand-icon" style="width: 55px;">
						<img src="/resources/web/images/car.png" class="car" style="width: 100%" >     
				</span>
                 <div class="sidebar-brand-text mx-3">함께 <span style="background: #000;padding: 0px 15px;color: #fff;">타요</span></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="/">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>메인으로</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>


            <li class="nav-item">
                <a class="nav-link" href="/members">
                    <i class="fas fa-home "></i>
                    <span>마이페이지</span></a>
            </li>

            <li class="nav-item ${menuName eq 'member' ? 'active' :'' }">
                <a class="nav-link" href="/members/profile">
                    <i class="fas fa-user-tie fa-fw"></i>
                    <span>회원정보 보기</span></a>
            </li>
            
            <li class="nav-item ${menuName eq 'scrap' ? 'active' :'' }">
                <a class="nav-link" href="/members/scrap/list">
                    <i class="fas fa-fw fa-thumbtack"></i>
                    <span>스크랩 보기</span></a>
            </li>	
            
            <li class="nav-item  ${menuName eq 'note' ? 'active' :'' }">
                <a class="nav-link" href="/members/note/receiveList">
                   <i class="far fa-paper-plane  fa-fw"></i>
                    <span> 쪽지함</span></a>
            </li>             


            <!-- Divider -->
            <hr class="sidebar-divider">



        </ul>
        <!-- End of Sidebar -->
    