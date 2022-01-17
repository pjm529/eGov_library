<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mylib/sub3/reservationRoomPage.css">
<title>라온도서관 > 나의 도서관 > 좌석예약/조회 > 열람실이용안내</title>

</head>
<body>
	
	<div class="header">
    <jsp:include page="../../layout/header.jsp"></jsp:include>
    </div>
		
	<div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>좌석예약/조회</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li style="background-image: none;">
                            <a href="${pageContext.request.contextPath}">
                                <img src="${pageContext.request.contextPath}/images/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/mylib/loanHistory.do">나의 도서관</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/mylib/reservationRoomPage.do">좌석예약/조회</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/mylib/reservationRoomPage.do">열람실이용안내</a>
                        </li>
                    </ul>

                </div>
            </div>
        </div>
        <div class="section">
            <div class="doc">

                <!-- 왼쪽 사이드바 -->
                <jsp:include page="../lnb.jsp"></jsp:include>

                <!-- 본문 -->
                <div class="content">
                    <div class="doc">
                        <div style="padding: 15px;">
                        	<!-- 열람실 이용 안내 -->
	                        <div class="service-wrap">
	                        	<h2><u>열람실 이용 안내</u></h2>
	                            <div class="service-info">
	                                <h3 style="margin-top: 10px;">이용시간</h3>
	                                <ul class="con">
	                                    <li>09:00 ~ 18:00</li>
	                                </ul>
	
	                                <h3>유의사항</h3>
	                                <ul class="con" style="margin-bottom: 20px;">
	                                    <li>열람실 이용 시간은 기본 3시간이며, 연장할 경우 2시간 단위로 이용 가능합니다.</li>
	                                    <li>흡연 및 음식물 반입을 금지합니다.</li>
	                                    <li>실내에서는 정숙하여 주십시오.</li>
	                                    <li>고의로 비품 및 시설을 훼손할 경우에는 변상 조치합니다.</li>
	                                    <li>학습 이외의 용도 사용 및 유의사항 위반 시 퇴실 조치합니다.</li>
	                                    <li>다음 이용자를 위하여 깨끗이 정리, 정돈해 주십시오.</li>
	                                </ul>
	                            </div>
	                        </div>
                        
                        	<!-- 나의 예약 현황 btn -->
                            <div class="my-booking-status">
                                <button class="my_info_btn" onclick="my_info_btn();">나의 예약현황</button>
                            </div>
							
							<!-- 좌석 배정 table -->
                            <div class="room-seat">
                                <h3>좌석배정</h3>
                                <table class="seat-info">
                                    <thead>
                                        <tr>
                                            <th>명칭</th>
                                            <th>전체</th>
                                            <th class="align-right">잔여좌석</th>
                                            <th>사용율</th>
                                            <th> </th>
                                            <th>운영상태</th>
                                            <th> </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="room-name">제 1열람실</td>
                                            <td class="align-center">54</td>
                                            <td class="align-right">${rd1UsingSeat}</td>
                                            <td class="progress">
                                                <progress value="${rd1UsedSeat}" max="54"></progress>
                                            </td>
                                            <td class="percent">
                                            	<div id="rd1UsedSeat"></div>
                                            	</td>
                                            <td>운영중</td>
                                            <td>
                                                <button class="room-go-btn"  onclick="rdRoom();">상세</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="room-name">제 2열람실</td>
                                            <td class="align-center">42</td>
                                            <td class="align-right">${rd2UsingSeat}</td>
                                            <td class="progress">
                                                <progress value="${rd2UsedSeat}" max="42"></progress>
                                            </td>
                                            <td class="percent">
                                            	<div id="rd2UsedSeat"></div>
                                            </td>
                                            <td>운영중</td>
                                            <td>
                                                <button class="room-go-btn" onclick="rdRoom2();">상세</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="room-name">노트북실</td>
                                            <td class="align-center">28</td>
                                            <td class="align-right">${nbUsingSeat}</td>
                                            <td class="progress">
                                                <progress value="${nbUsedSeat}" max="28"></progress>
                                            </td>
                                            <td class="percent">
                                            	<div id="nbUsedSeat"></div>
                                            </td>
                                            <td>운영중</td>
                                            <td>
                                                <button class="room-go-btn" onclick="nbRoom();">상세</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
	    <!-- footer -->
	    <jsp:include page="../../layout/footer.jsp"></jsp:include>
    
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

	<script>
	$(document).ready(function() {
		
		$(".sub3").addClass("active");
		$(".submenu8").addClass("active");
		
		var usedSeat = "<c:out value='${nbUsedSeat}'/>";
		var percent = (usedSeat/28) * 100;
		$('#nbUsedSeat').html(percent.toFixed(0) + "%");
		
		var rd1_usedSeat = "<c:out value='${rd1UsedSeat}'/>";
		var rd1_percent = (rd1_usedSeat/28) * 100;
		$('#rd1UsedSeat').html(rd1_percent.toFixed(0) + "%");
		
		var rd2_usedSeat = "<c:out value='${rd2UsedSeat}'/>";
		var rd2_percent = (rd2_usedSeat/28) * 100;
		$('#rd2UsedSeat').html(rd2_percent.toFixed(0) + "%");
		
	}); 
	
	
	/* 기준 위 부터 아래로 == 나의 예약 현황 | 좌석 배정 | 세미나실 */

	// 나의 예약 현황 btn 속성 추가
	function my_info_btn(){
		location.href = "${pageContext.request.contextPath}/mylib/myReservationInfo.do";
	}

	// 좌석 배정 상세 btn 속성 추가
	function rdRoom() {
		location.href = "${pageContext.request.contextPath}/mylib/readingRoom.do";
	}

	function rdRoom2() {
		location.href = "${pageContext.request.contextPath}/mylib/readingRoom2.do";
	}

	function nbRoom(){
		location.href = "${pageContext.request.contextPath}/mylib/notebookRoom.do";
	}
	</script>

</body>
</html>