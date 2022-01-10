<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
</head>
<body>    
	<div class="tnb">
		<div class="tnb_menu">  
			<!-- 미 로그인 시 -->
			<sec:authorize access="isAnonymous()">
			<span><a href="${pageContext.request.contextPath}/member/login.do">로그인</a></span>
			<span>|</span>
		    <span><a href="${pageContext.request.contextPath}/member/signUpCheck.do">회원가입</a></span>
			</sec:authorize>
			
			<!-- 로그인 시 -->
			<sec:authorize access="isAuthenticated()">
			<span><sec:authentication property="principal.member.userName"/>님</span>
			<span>|</span>
		    <span><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></span>
		    <span>|</span>
		    <span><a href="${pageContext.request.contextPath}/mylib/myPage.do">정보수정</a></span>
		    
		    <!-- 관리자 권한을 가지고 있을 경우 -->
		    <sec:authorize access="hasRole('ROLE_ADMIN')">
		    <span>|</span>
		    <span><a href="${pageContext.request.contextPath}/admin/memberList.do">관리자메뉴</a></span>
		    </sec:authorize>
			</sec:authorize>
		</div>	
	</div>
	
	    
	    
	<div class="navi">
	    <div>
	        <ul class="header_menu">
	            <li>
	                <div style=" width: 250px; height: 90px; margin-right: 250px;">
	                	<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/images/common/header_logo.png"></a>
	                </div>
	            </li>
	            <li class="header_menu1"><span><a href="${pageContext.request.contextPath}/search/book.do">자료검색</a></span></li>
	            <li class="header_menu2"><span><a href="${pageContext.request.contextPath}/info/signUp.do">이용안내</a></span></li>
	            <li class="header_menu3"><span><a href="${pageContext.request.contextPath}/board/noticeList.do">열린공간</a></span></li>
	            <li class="header_menu4"><span><a href="${pageContext.request.contextPath}/intro/greeting.do">도서관소개</a></span></li>
	            <li class="header_menu5"><span><a href="${pageContext.request.contextPath}/mylib/loanHistory.do">나의도서관</a></span></li>
	        </ul>
	    </div>
	</div>
	
	<div class="header_submenu header_sub1">
	    <ul class="header_submenu1">
	        <li><span><a href="${pageContext.request.contextPath}/search/book.do">도서검색</a></span></li>
	        <li><span><a href="${pageContext.request.contextPath}/search/bestBook.do">대출베스트</a></span></li>
	        <li><span><a href="${pageContext.request.contextPath}/search/recommendBook.do">추천도서</a></span></li>
	    </ul>
	</div>
	
	<div class="header_submenu header_sub2">
	    <ul class="header_submenu2">
	        <li><span><a href="${pageContext.request.contextPath}/info/signUp.do">회원가입안내</a></span></li>
	        <li><span><a href="${pageContext.request.contextPath}/info/openingHours.do">이용시간 및 휴관일</a></span></li>
	        <li><span><a href="${pageContext.request.contextPath}/info/loanBook.do">도서대출/반납/예약</a></span></li>
	    </ul>
	</div>
	
	<div class="header_submenu header_sub3">
	    <ul class="header_submenu3">
	        <li><span><a href="${pageContext.request.contextPath}/board/noticeList.do">공지사항</a></span></li>
	        <li><span><a href="${pageContext.request.contextPath}/board/FAQ.do">자주묻는질문</a></span></li>
	        <li><span><a href="${pageContext.request.contextPath}/board/qnaBoardList.do">묻고답하기</a></span></li>
	        <li><span><a href="${pageContext.request.contextPath}/board/articleList.do">분실물찾기</a></span></li>
	        <li><span><a href="${pageContext.request.contextPath}/board/calendar.do">도서관일정</a></span></li>
	    </ul>
	</div>
	
	<div class="header_submenu header_sub4">
	    <ul class="header_submenu4">
	        <li><span><a href="${pageContext.request.contextPath}/intro/greeting.do">인사말</a></span></li>
	        <li><span><a href="${pageContext.request.contextPath}/intro/history.do">연혁</a></span></li>
	        <li><span><a href="${pageContext.request.contextPath}/intro/road.do">찾아오시는길</a></span></li>
	    </ul>
	</div>
	
	<div class="header_submenu header_sub5">
	    <ul class="header_submenu5">
	        <li><span><a href="${pageContext.request.contextPath}/mylib/loanHistory.do">도서관련</a></span></li>
	        <li><span><a href="${pageContext.request.contextPath}/mylib/hope.do">희망도서신청/조회</a></span></li>
	        <li><span><a href="${pageContext.request.contextPath}/mylib/reservationRoomPage.do">좌석예약/조회</a></span></li>
	        <li><span><a href="${pageContext.request.contextPath}/mylib/myPage.do">개인정보</a></span></li>
	    </ul>
	</div>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" 
  crossorigin="anonymous"></script>
<script>
    $(function () {
        $(".header_menu1, .header_sub1").on({
            "mouseover": function () {
                $(".header_sub1").css("display", "block");
            },
            "mouseleave": function () {
                $(".header_sub1").css("display", "none");
            }
        })

        $(".header_menu2, .header_sub2").on({
            "mouseover": function () {
                $(".header_sub2").css("display", "block");
            },
            "mouseleave": function () {
                $(".header_sub2").css("display", "none");
            }
        })

        $(".header_menu3, .header_sub3").on({
            "mouseover": function () {
                $(".header_sub3").css("display", "block");
            },
            "mouseleave": function () {
                $(".header_sub3").css("display", "none");
            }
        })

        $(".header_menu4, .header_sub4").on({
            "mouseover": function () {
                $(".header_sub4").css("display", "block");
            },
            "mouseleave": function () {
                $(".header_sub4").css("display", "none");
            }
        })

        $(".header_menu5, .header_sub5").on({
            "mouseover": function () {
                $(".header_sub5").css("display", "block");
            },
            "mouseleave": function () {
                $(".header_sub5").css("display", "none");
            }
        })
    })

</script>
</body>
</html>