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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mylib/sub3/myReservationInfo.css">
<title>라온도서관 > 나의도서관 > 좌석예약/조회 > 나의예약현황</title>
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
                            <a href="${pageContext.request.contextPath}/mylib/myReservationInfo.do">나의예약현황</a>
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
                        <h2>나의 예약 현황</h2>
                        <hr style="border: 1px solid #dadada;">
                        <div class="wrapper-table">
                            <div class="seat-info">
                                <h3>좌석 예약 현황</h3>

                                
                                
                                <!-- 열람실 좌석 예약 현황이 없다면, -->
                                <c:if test="${mySeatInfo == null}">
                                	<table class="seat-reserve-info">
                                    <tbody>
                                        <tr>
                                            <th>열람실</th>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th>좌석 번호</th>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th>예약 시간</th>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th>반납 시간</th>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th>잔여 시간</th>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                                </c:if>
                                
                                <!-- 열람실 좌석 예약 현황이 있다면, -->
                                <c:if test="${mySeatInfo != null}"> 
                                	<input type="hidden" class="reserveNo" value="${mySeatInfo.seatNo}">
                                	<div class="reserve-info-btn">
	                                    <!-- 퇴실 -->
			                            <div>
			                            	<form id="return_form" action="${pageContext.request.contextPath}/mylib/returnSeat.do" method="post" onsubmit="return false;">
			                                	<button class="chk_out_btn return_btn">퇴실</button>
			                                </form>
		                                </div>
		                                <!-- 연장 -->
		                                <div>
			                            	<form id="extend_form" action="${pageContext.request.contextPath}/mylib/extendSeat.do" method="post" onsubmit="return false;">
			                                	<button class="extend_btn renew_btn">연장</button>
			                                </form>
		                                </div>
	                                </div>
	                                <fmt:formatDate var="checkinTime" value="${mySeatInfo.checkinTime}" pattern="HH:mm:ss"/>
	                            	<fmt:formatDate var="checkoutTime" value="${mySeatInfo.checkoutTime}" pattern="HH:mm:ss"/>
	                            	
	                            	<fmt:parseNumber var="diffHour" value="${mySeatInfo.diffTime/(1000*60*60)}" integerOnly="true" />
	                            	<fmt:parseNumber var="diffMin" value="${mySeatInfo.diffTime/(1000*60) - diffHour*60}" integerOnly="true" />
	                            	<fmt:parseNumber var="diffSec" value="${mySeatInfo.diffTime/1000 - diffHour*60*60 - diffMin*60}" integerOnly="true" />
		                    		
		                    		<c:if test="${diffMin < 10}">
		                    			<c:set var="diffMin" value="0${diffMin}" />
		                    		</c:if>
		                    		
		                    		<c:if test="${diffSec < 10}">
		                    			<c:set var="diffSec" value="0${diffSec}" />
		                    		</c:if>
		                    		
		                    		<c:set var="diffTime" value="${diffHour}:${diffMin}:${diffSec}" />
		                    		
		                    		<input type="hidden" id="diffHour" value="${diffHour}">
	                                <input type="hidden" id="diffMin" value="${diffMin}">
	                                <input type="hidden" id="diffSec" value="${diffSec}">
	                                
	                                <!-- 열람실 명 -->
	                                <c:if test="${mySeatInfo.seatNo < 54}">
	                                    <c:set var="roomName" value="제 1열람실" />
	                                </c:if>
	                                <c:if test="${mySeatInfo.seatNo >= 54 && mySeatInfo.seatNo < 98}">
	                                    <c:set var="roomName" value="제 2열람실" />
	                                </c:if>
	                                <c:if test="${mySeatInfo.seatNo >= 98 }">
	                                    <c:set var="roomName" value="노트북실" />
	                                </c:if>
									
	                                <table class="seat-reserve-info">
	                                    <tbody>
	                                        <tr>
	                                            <th>열람실</th>
	                                            <td>${roomName}</td>
	                                        </tr>
	                                        <tr>
	                                            <th>좌석 번호</th>
	                                            <td>${mySeatInfo.seatNo}</td>
	                                        </tr>
	                                        <tr>
	                                            <th>예약 시간</th>
	                                            <td>${checkinTime}</td>
	                                        </tr>
	                                        <tr>
	                                            <th>반납 시간</th>
	                                            <td>${checkoutTime}</td>
	                                        </tr>
	                                        <tr>
	                                            <th class="left">잔여 시간</th>
	                                            <td id="time">${diffTime}</td>
	                                        </tr>
	                                    </tbody>
	                                </table>
                                </c:if>

                                <div class="info-text">
                                    <span>
                                        &#8251; <b>자리 이동</b>의 경우 열람실 예약 페이지에서 확인 가능
                                    </span>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
     <!-- footer -->
    <jsp:include page="../../layout/footer.jsp"></jsp:include>

    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        
        
    <script>
    	$(function() {
    		$(".sub3").addClass("active");
    		$(".submenu9").addClass("active");
    		
    		// 예약된 좌석이 있으면 남은 시간 timer start
        	if($(".reserveNo").val() != ""){
        		var hours =  $("#diffHour").val();
                var minutes = $("#diffMin").val();
                var seconds = $("#diffSec").val();
                var totalSeconds = (60 * 60 * hours) + (60 * minutes) + parseInt(seconds, 10) - 1;
                var display = document.querySelector('#time');
                startTimer(totalSeconds, display);
        	}
    		
    		
    		$(".booking_delete_btn").on("click", function(e) {
    			
    			if(confirm("예약을 취소하시겠습니까?")) {
    				alert("예약 취소가 완료되었습니다.");
    				$("#room_delete_form").attr("onsubmit", "return ture;");
    				$("#room_delete_form").submit();
    			}	
    			
    		});
    		
    		
    		/* 퇴실 btn click 시, 좌석 반납 */
    		$(".return_btn").on("click", function(e) {
    			
    			if(confirm("좌석을 반납하시겠습니까?")) {
    				alert("좌석 반납이 완료되었습니다.");
    				$("#return_form").attr("onsubmit", "return ture;");
    				$("#return_form").submit();
    			}	
    			
    		});
    		
    		
    		/* 자리 연장 */
    		$(".extend_btn").on("click", function(e) {
    			
    			e.preventDefault();
    			
    	      	var diffHour = $("#diffHour").val();
    	        var diffMin = $("#diffMin").val();
    	        var result = diffHour < 1 && diffMin < 30;	/* 30분 이하로만 자리 연장 가능 */
    	        var checkoutTime = "<c:out value='${mySeatInfo.checkoutTime}'/>";
    	        
    			var seatNo = "<c:out value='${mySeatInfo.seatNo}'/>";
    			
    			if(result == false || checkoutTime.includes("18:00:00")){ 
    				// checkout_time에 '18'이라는 문자열이 포함되어 있으면, 좌석 연장 여부 묻지 않고 연장 불가 메시지 바로 뜨게 함
    				alert("연장 가능한 시간이 아닙니다.");
    			}else {
    	            if(confirm("좌석을 연장하시겠습니까?")){
    	               alert(seatNo + "번 좌석 시간이 연장되었습니다.");
    					$("#extend_form").attr("onsubmit", "return true;");
    					$("#extend_form").submit();
    	            }
    			}
    		});
    		
    		function startTimer(totalSeconds, display) {
            	
    	       	  var timer = totalSeconds;
    	       	  var hours;
    	       	  var minutes;
    	       	  var seconds;
    	       	  var interval = setInterval(function () {
    	       		if(timer <= 0) {
    	       	      clearInterval(interval);
    	       	      alert("퇴실되었습니다.");
    	       	      location.reload();
    	         	}
    	       		
    	       	    hours = parseInt(timer / 60 / 60, 10);
    	       	    minutes = parseInt(timer / 60 - (hours * 60), 10);
    	       	    seconds = parseInt(timer % 60, 10);

    	       	    minutes = minutes < 10 ? "0" + minutes : minutes;
    	       	    seconds = seconds < 10 ? "0" + seconds : seconds;
    	       	    
    				if(hours < 1 && minutes < 30) {
    					display.style.color = "red";	
    				}
    				
    	  	    	display.textContent = hours + ":" + minutes + ":" + seconds;
    				
    	  	    	timer--;
    	  	    	
    	       	  }, 1000);
    		}
    		
		});
    
    </script>

</body>
</html>