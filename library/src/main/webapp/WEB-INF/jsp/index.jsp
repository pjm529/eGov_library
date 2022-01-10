<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index/main_header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index/footer.css">
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <!-- xeion = 아이콘 사용을 위한 CDN -->
    <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <!-- slick 사용을 위한 CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index/main-header.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index/main.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index/tab.js"></script>
</head>
<body>

    <div id="warp">
        <div id="header">
            <div class="tnb">
                <div class="main-section">
                    <div class="util">
                    	<sec:authorize access="isAnonymous()">
                        <a href="${pageContext.request.contextPath}/member/login.do">로그인</a><span class="text-bar"></span>
                        <a href="${pageContext.request.contextPath}/member/signupCheck.do">회원가입</a>
                        </sec:authorize>
                        
                        <!-- 로그인 시 -->
						<sec:authorize access="isAuthenticated()">
						<span style="color: #fff; font-weight: bold; font-size: 0.875em;"> 
							<sec:authentication property="principal.member.userName" />님 
						</span>
						<span class="text-bar"></span>
					    <span><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></span>
					    <span class="text-bar"></span>
					    <span><a href="${pageContext.request.contextPath}/mylib/myPage.do">정보수정</a></span>
					    
					    <!-- 관리자 권한을 가지고 있을 경우 -->
					    <sec:authorize access="hasRole('ROLE_ADMIN')">
					    <span class="text-bar"></span>
					    <span><a href="${pageContext.request.contextPath}/admin/memberList.do">관리자메뉴</a></span>
					    </sec:authorize>
						</sec:authorize>
                    </div>
                </div>
            </div>
            <!-- 하단 nav(본 메뉴) 작업 시작하기 -->
            <div class="gnb">
                <div class="container">
                    <h1 class="logo">
                        <a id="logoLink" href="${pageContext.request.contextPath}" title="라온도서관 메인화면" role="button"><span
                                class="hide">대구광역시립라온도서관</span></a>
                    </h1>
                    <ul class="gnb-ul">
                        <li class="gnb-li">
                            <a class="Depth" href="${pageContext.request.contextPath}/search/book.do">
                                <span class="">자료검색</span>
                            </a>
                            <ul class="sub-menu sm01" style="display: none;">
                                <li>
                                    <a class="" href="${pageContext.request.contextPath}/search/book.do">도서검색</a>
                                    <a class="" href="${pageContext.request.contextPath}/search/bestBook.do">대출베스트</a>
                                    <a class="" href="${pageContext.request.contextPath}/search/recommendBook.do">추천도서</a>
                                </li>
                            </ul>
                        </li>
                        <li class="gnb-li">
                            <a class="Depth" href="${pageContext.request.contextPath}/info/signUp.do">
                                <span class="">이용안내</span>
                            </a>
                            <ul class="sub-menu sm02">
                                <li>
                                    <a class="" href="${pageContext.request.contextPath}/info/signUp.do">회원가입 안내</a>
                                    <a class="" href="${pageContext.request.contextPath}/info/openingHours.do">이용시간 및 휴관일</a>
                                    <a class="" href="${pageContext.request.contextPath}/info/loanBook.do">도서 대출 및 반납</a>
                                </li>
                            </ul>
                        </li>
                        <li class="gnb-li">
                            <a class="Depth" href="${pageContext.request.contextPath}/board/noticeList.do">
                                <span class="">열린공간</span>
                            </a>
                            <ul class="sub-menu sm03">
                                <li>
                                    <a class="" href="${pageContext.request.contextPath}/board/noticeList.do">공지사항</a>
                                    <a class="" href="${pageContext.request.contextPath}/board/FAQ.do">자주묻는질문</a>
                                    <a class="" href="${pageContext.request.contextPath}/board/qnaBoardList.do">묻고답하기</a>
                                    <a class="" href="${pageContext.request.contextPath}/board/articleList.do">분실물찾기</a>
                                    <a class="" href="${pageContext.request.contextPath}/board/calendar.do">도서관일정</a>
                                </li>
                            </ul>
                        </li>
                        <li class="gnb-li">
                            <a class="Depth" href="${pageContext.request.contextPath}/intro/greeting.do">
                                <span class="">도서관소개</span>
                            </a>
                            <ul class="sub-menu sm04">
                                <li>
                                    <a class="" href="${pageContext.request.contextPath}/intro/greeting.do">인사말</a>
                                    <a class="" href="${pageContext.request.contextPath}/intro/history.do">연혁</a>
                                    <a class="" href="${pageContext.request.contextPath}/intro/road.do">찾아오시는길</a>
                                </li>
                            </ul>
                        </li>
                        <li class="gnb-li">
                            <a class="Depth" href="${pageContext.request.contextPath}/mylib/loanHistory.do">
                                <span class="">나의도서관</span>
                            </a>
                            <ul class="sub-menu sm05">
                                <li>
                                    <a class="" href="${pageContext.request.contextPath}/mylib/loanHistory.do">도서관련</a>
                                    <a class="" href="${pageContext.request.contextPath}/mylib/hope.dp">희망도서신청/조회</a>
                                    <a class="" href="${pageContext.request.contextPath}/mylib/reservationRoomPage.do">좌석예약/조회</a>
                                    <a class="" href="${pageContext.request.contextPath}/mylib/myPage.do">개인정보</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <a id="site-map-Link" class="site-map" href="#a" title="사이트맵">
                        <img src="${pageContext.request.contextPath}/images/index/sitemap1.png" alt="사이트맵">
                    </a>
                </div>
            </div>
            <!-- Quick메뉴 -->
            <div class="search-area">
                <div class="container">
                    <div class="search-wrap">
                        <div class="searchbox">
                            <div class="box">
                            	<form action="${pageContext.request.contextPath}/search/book.do" method="get" id="search_form">
                            		<select id="op-01" class="select-op" title="검색창 옵션" name="type">
	                                    <option value="Title">도서명</option>
	                                    <option value="Author">저자명</option>
	                                </select>
	                                <input id="inputForm" class="mainInput" type="text" placeholder="검색어를 입력하세요."
	                                    title="검색창" name="keyword" autocomplete="off">
	                                <div class="btn-box">
	                                    <a class="search-btn" onclick="submit();">
	                                        <span class="hide">검색</span>
	                                    </a>
	                                </div>
                            	</form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Quick메뉴 -->
            <div class="Quick-area">
                <h2>주요 서비스 안내</h2>
                <ul class="icons">
                    <li>
                        <div class="icon_img">
                            <a href="${pageContext.request.contextPath}/search/book.do"><img src="${pageContext.request.contextPath}/images/index/infornation.png">
                        </div>
                        <class="contents1_bold">자료검색</class></a>
                    <li>
                        <div class="icon_img">
                            <a href="${pageContext.request.contextPath}/mylib/hope.do"><img src="${pageContext.request.contextPath}/images/index/book.png">
                        </div>
                        <class="contents1_bold">희망도서신청</class></a>
                    </li>
                    <li>
                        <div class="icon_img">
                            <a href="${pageContext.request.contextPath}/mylib/loanHistory.do"><img src="${pageContext.request.contextPath}/images/index/my-info.png">
                        </div>
                        <class="contents1_bold">대출내역조회</class></a>
                    </li>
                    <li>
                        <div class="icon_img">
                            <a href="${pageContext.request.contextPath}/board/calendar.do"><img src="${pageContext.request.contextPath}/images/index/calendar.png">
                        </div>
                        <class="contents1_bold">도서관 일정</class></a>
                    </li>
                    <li>
                        <div class="icon_img">
                            <a href="${pageContext.request.contextPath}/info/signUp.do"><img src="${pageContext.request.contextPath}/images/index/library.png">
                        </div>
                        <class="contents1_bold">이용안내</class></a>
                    </li>
                    <li>
                        <div class="icon_img">
                            <a href="${pageContext.request.contextPath}/mylib/reservationRoomPage.do"><img src="${pageContext.request.contextPath}/images/index/reservation.png">
                        </div>
                        <class="contents1_bold">자리예약하기</class></a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 헤더영역 끝 -->
        <!-- 메인영역 시작-->
        <div id="main">
            <!-- <main 01> : 공지사항 / 좌석예약 -->
            <div class="library-info">
                <div class="inner">
                    <!-- main01-1 공지사항 안내	 -->
                    <div class="libray-notice">
                        <h3>공지사항</h3>
                        <a class="btn-more" href="${pageContext.request.contextPath}/board/noticeList.do" title="공지사항 더보기">more</a>
                        <ul class="notice-list">
                            
                       	<c:forEach var="noticeList" items="${noticeList}" begin="0" end="4">
                       		<li class="w-label">
                        		<a href="${pageContext.request.contextPath}/board/noticeContent.do?notice_no=${noticeList.notice_no }">
	                                 <span class="tit" style="width: 230px;">
	                                     <span class="label">공지</span>
	                                     ${noticeList.notice_title}
	                                 </span>
	                                 <span class="date">
	                                 	<fmt:formatDate var="notice_reg_date" value="${noticeList.notice_reg_date}" pattern="yyyy-MM-dd"/>
										${notice_reg_date}
	                                 </span>
								</a>
                            </li>
                       	</c:forEach>
                        </ul>
                    </div>
                    <!-- 공지사항 종료 -->
                    <!-- main01-2 휴관일 및 예약현황 -->
                    <div class="bbs-box-center">
                        <div class="month-wrap">
                            <div class="month-slide-wrap">
                                <div class="month-slide">
                                    <p id="calendarYear">${year }</p>
                                    <span>년</span>
                                    <div>
                                        <span><em>${month }</em><i>월</i></span>
                                    </div>
                                    <script>
                                        $('.month-slide > div').slick();
                                    </script>
                                </div>
                                <!--    <a href="#" class="month-control btn-prev"><p class="hide">이전버튼</p></a>
                                <a href="#" class="month-control btn-next"><p class="hide">다음버튼</p></a>        -->
                            </div>
                            <div class="month-info">
                                <p class="tit">휴관일</p>
                                <p class="con">
                                	<c:forEach var="cal_list" items="${cal_list}">
                                		<span>${cal_list.start }</span>
                                	</c:forEach>
                                </p>
                            </div>
                            <div class="month-detail">
                                <span class="sinfo">※ 매주 월요일, 법정·임시공휴일</span>
                            </div>
                        </div>
                        <!-- 도서관 좌석 예약현황 시작 -->
                        <div class="person_cnt fclear">
                            <div>
                                <h1>제 1열람실</h1>
                                <div>
                                    <div>잔여석</div>
                                    <div><strong id="mainCnt">${rd1Room_usingSeat}</strong>석</div>
                                </div>
                            </div>
                            <div>
                                <h1>제 2열람실</h1>
                                <div>
                                    <div>잔여석</div>
                                    <div><strong id="subCnt">${rd2Room_usingSeat}</strong>석</div>
                                </div>
                            </div>
                            <div>
                                <h1>노트북실</h1>
                                <div>
                                    <div>잔여석</div>
                                    <div><strong id="subCnt">${nbRoom_usingSeat}</strong>석</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 휴관일 및 좌석현황 종료 -->
                    <!-- <main01-03 : main-banner-box -->
                    <div class="main-banner-box">
                        <div class="slidewrap">
                        	<c:forEach var="banner_list" items="${banner_list}">
                              	<div style="display:flex; justify-content: center; align-items: center;"><img src="${banner_list.path }"
                                    style="height: 240px;"></div>
                            </c:forEach>
                        </div>
                    </div>
                    <!-- 메인-베너 슬라이드 JS -->
                    <script type="text/javascript">
                        $('.slidewrap').slick({
                            slidesToShow: 1,
                            slidesToScroll: 1,
                            autoplay: true,
                            autoplaySpeed: 3000,
                        });
                    </script>
                </div>
            </div>
            <!-- <main 04> : 추천도서 및 대출BEST 작업 시작 -->
            <div class="book-slide-wrap">
                <div class="slide-inner">
                    <!-- bookList Tab 설정 -->
                    <div class="book-slide-top">
                        <ul class="book-tab" style="display: block;">
                            <li class="on">
                                <a href="${pageContext.request.contextPath}/search/recommendBook.do">추천도서</a>
                            </li>
                            <li class="">
                                <a href="${pageContext.request.contextPath}/search/bestBook.do">대출BEST</a>
                            </li>
                        </ul>
                        <h1 class="hide">추천도서</h1>
                        <ul id="recomended" class="book-slide">
                            <c:forEach var="rec_list" items="${rec_list}">
                            	<div>
                            	<a href="${pageContext.request.contextPath}/search/recommendBookDetail.do?book_isbn=${rec_list.book_isbn }&year=${year}&month=${month}">
                            	<img src="${rec_list.book_cover }" style="width:155px; height: 220px;"></a></div>
                            </c:forEach>            
                            
                        </ul>
                        <h1 class="hide">대출BEST</h1>
                        <ul id="bestBook" class="book-slide" style="display: none;">
                           <c:forEach var="best_list" items="${best_list}">
                            	<div>
                            	<a href="${pageContext.request.contextPath}/search/bestBookDetail.do?book_isbn=${best_list.book_isbn }&year=${year}&month=${month}">
                            	<img src="${best_list.book_cover }" style="width:155px; height: 220px;"></a></div>
                            </c:forEach>
                        </ul>
                        
                        <script>
                            $('.book-slide').slick({
                                infinite: true,
                                slidesToShow: 5,
                                slidesToScroll: 5,
                                setPosition: 0, //깨짐 방지
                                autoplay: false,
                                autoplaySpeed: 5000
                            });
                        </script>
                    </div>
                </div>
            </div>
            <!-- 추천도서 / 대출 Best 종료 -->
            <!-- main 06 : sub-banner-box 영역 작업 시작 -->
            <div class="section-sub-banner">
                <div class="sub-banner-wrap">
                    <div class="sub-banner-box">
                        <div class="sub-banner">
                            <!-- 아래는 배너 이전/다음 버튼 설정하기 위한 영역(slick 사용으로 무의미하여 주석처리) -->
                            <!-- <div class="sub-banner-control">
                                <a class="prev" href="#prev">
                                    <img src="../images/sub-banner-prev.png" alt="이전버튼">
                                    <span class="hide">이전</span>
                                </a>
                                <a class="next" href="#next">
                                    <img src="../images/sub-banner-next.png" alt="다음버튼">
                                    <span class="hide">다음</span> 
                                </a>
                            </div> -->
                        </div>
                        <!-- 각 기관 / 도서관 사이트 Link -->
                        <div class="sub-banner-wrapper">
                            <div class="banner-box">
                                <div class="box-viewport">
                                    <ul class="banner-roll">
                                        <li class="box-clone">
                                            <div>
                                                <a href="https://www.moe.go.kr/main.do" target="_blank"
                                                    title="새창으로 열립니다.">
                                                    <img src="https://library.daegu.go.kr/data/banner/h50/1604998776620"
                                                        alt="교육부">
                                                </a>
                                            </div>
                                            <div>
                                                <a href="https://www.mcst.go.kr/kor/main.jsp" target="_blank"
                                                    title="새창으로 열립니다.">
                                                    <img src="https://library.daegu.go.kr/data/banner/h50/1604998795516"
                                                        alt="문화체육관광부">
                                                </a>
                                            </div>
                                            <div>
                                                <a href="https://www.nl.go.kr/" target="_blank" title="새창으로 열립니다.">
                                                    <img src="https://library.daegu.go.kr/data/banner/h50/1604998739526"
                                                        alt="국립중앙도서관">
                                                </a>
                                            </div>
                                            <div>
                                                <a href="https://www.nanet.go.kr/main.do" target="_blank"
                                                    title="새창으로 열립니다.">
                                                    <img src="https://library.daegu.go.kr/data/banner/h50/1604998726710"
                                                        alt="국회도서관">
                                                </a>
                                            </div>
                                            <div>
                                                <a href="http://library.daegu.go.kr/dgportal/index.do" target="_blank"
                                                    title="새창으로 열립니다.">
                                                    <img src="https://library.daegu.go.kr/data/banner/h50/1604998714499"
                                                        alt="대구지역공공도서관통합검색">
                                                </a>
                                            </div>
                                            <div>
                                                <a href="https://books.nl.go.kr/" target="_blank" title="새창으로 열립니다.">
                                                    <img src="https://library.daegu.go.kr/data/banner/h50/1604998808119"
                                                        alt="책이음서비스">
                                                </a>
                                            </div>
                                            <div>
                                                <a href="https://books.nl.go.kr/" target="_blank" title="새창으로 열립니다.">
                                                    <img src="https://library.daegu.go.kr/data/banner/h50/1604998819744"
                                                        alt="책바다">
                                                </a>
                                            </div>
                                            <div>
                                                <a href="https://cn.nld.go.kr/index.do" target="_blank"
                                                    title="새창으로 열립니다.">
                                                    <img src="https://library.daegu.go.kr/data/banner/h50/1604998831241"
                                                        alt="책나래">
                                                </a>
                                            </div>
                                            <div>
                                                <a href="https://www.nl.go.kr/NL/contents/N30502000000.do"
                                                    target="_blank" title="새창으로 열립니다.">
                                                    <img src="https://library.daegu.go.kr/data/banner/h50/1604998843575"
                                                        alt="사서에게 물어보세요">
                                                </a>
                                            </div>
                                            <div>
                                                <a href="https://www.data4library.kr/" target="_blank"
                                                    title="새창으로 열립니다.">
                                                    <img src="https://library.daegu.go.kr/data/banner/h50/1604999269162"
                                                        alt="도서관 정보나루">
                                                </a>
                                            </div>
                                            <div>
                                                <a href="https://www.daegu.go.kr/index.do" target="_blank"
                                                    title="새창으로 열립니다.">
                                                    <img src="https://library.daegu.go.kr/data/banner/h50/1604998696328"
                                                        alt="대구광역시청">
                                                </a>
                                            </div>
                                            <div>
                                                <a href="https://www.data.go.kr/index.do" target="_blank"
                                                    title="새창으로 열립니다.">
                                                    <img src="https://library.daegu.go.kr/data/banner/h50/1604998879701"
                                                        alt="공공데이터포털">
                                                </a>
                                            </div>
                                        </li>
                                        <script>
                                            $('.box-clone').slick({
                                                lazyLoad: 'ondemand',
                                                slidesToShow: 5,
                                                slidesToScroll: 1,
                                                autoplay: true,
                                                autoplaySpeed: 5000,
                                            });
                                            $('.play').on('click', function () {
                                                $('.box-clone').slick('slickPlay');
                                            });
                                            $('.pause').on('click', function () {
                                                $('.box-clone').slick('slickPause');
                                            }
                                            );
                                        </script>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- main 작업 영역 종료 -->
        <!-- footer영역 작업 시작 -->
        <div id="footer">
            <div class="bottom">
                <div class="bottom-section" style="position: relative;">
                    <div class="site-link">
                        <div class="top-info">
                            <div class="foot-info">
                                <div class="info">
                                    <a href="#a">개인정보처리방침</a><span class="text-bar"></span>
                                    <a href="#a">영상정보처리방침</a><span class="text-bar"></span>
                                    <a href="#a">이용약관</a><span class="text-bar"></span>
                                    <a href="#a">도서관서비스헌장</a><span class="text-bar"></span>
                                    <a href="#a">저작권보호정책</a><span class="text-bar"></span>
                                    <a href="#a">뷰어다운로드</a>
                                </div>
                            </div><br>
                            <!-- 주소영역 -->
                            <div class="address">
                            
                            	<div class="team" style="float: right;">
									<p>조장 : 박준모</p>
									<p>조원 : 김혜인, 신혜리, 장준화, 천종부</p>
								</div>
								
                                <p>대구광역시 서구 서대구로 7길 2(내당동, 대구광역시립라온도서관)
                                    <span></span>TEL 053-555-1333
                                    <span></span>FAX 053-566-3318<br>
                                    Copyright @ 라온도서관.<br>
                                    All right reserved.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
	function submit() {
		if($("#inputForm").val() == ""){
			alert("검색어를 입력하세요.");
		} else {
			$("#search_form").submit();	
		}
	}
</script>
</html>