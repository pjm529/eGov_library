<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false" %>
<html>
<head>
	<title>라온도서관 > 나의도서관 > 좌석예약/조회 > 제1열람실</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mylib/sub3/readingRoom1_sb_page.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mylib/sub3/readingRoom1.css">
</head>
<body>

	<input type="hidden" class="reserveNo" value="${mySeatInfo.seatNo}">
	
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
                            <a href="${pageContext.request.contextPath}/mylib/loanHistory.do">나의도서관</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/mylib/reservationRoomPage.do">좌석예약/조회</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/mylib/readingRoom.do">제1열람실</a>
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

                        <div class="room-list">
                            <div class="list-btn">
                                <button class="active" onclick="rdRoom();">제 1열람실</button>
                                <button onclick="rdRoom2();">제 2열람실</button>
                                <button onclick="nbRoom();">노트북실</button>
                            </div>
                        </div>


                        <div class="seat-chart">
                            <div class="seat-wrapper">
                                <div class="line1">
                                    <div class="seat-list">
                                        <c:forEach var="seatsList" items="${seatsList}" begin="0" end="9">

                                            <c:if test="${seatsList.userId != null}">
                                                <c:set var="status" value="occupied" />
                                            </c:if>

                                            <c:if test="${seatsList.userId == null}">
                                                <c:set var="status" value="vacant" />
                                            </c:if>

                                            <c:if test="${seatsList.userId == loginId}">
                                                <button class="mine"
                                                    id="${seatsList.seatNo}">${seatsList.seatNo}</button>
                                            </c:if>

                                            <c:if test="${seatsList.userId != loginId}">
                                                <button class="${status}"
                                                    id="${seatsList.seatNo}">${seatsList.seatNo}</button>
                                            </c:if>

                                        </c:forEach>
                                    </div>

                                    <div class="seat-list">
                                        <c:forEach var="seatsList" items="${seatsList}" begin="10" end="19">

                                            <c:if test="${seatsList.userId != null}">
                                                <c:set var="status" value="occupied" />
                                            </c:if>

                                            <c:if test="${seatsList.userId == null}">
                                                <c:set var="status" value="vacant" />
                                            </c:if>

                                            <c:if test="${seatsList.userId == loginId}">
                                                <button class="mine"
                                                    id="${seatsList.seatNo}">${seatsList.seatNo}</button>
                                            </c:if>

                                            <c:if test="${seatsList.userId != loginId}">
                                                <button class="${status}"
                                                    id="${seatsList.seatNo}">${seatsList.seatNo}</button>
                                            </c:if>

                                        </c:forEach>
                                    </div>

                                    <div class="seat-list" style="height: 180px; overflow: hidden;">
                                        <c:forEach var="seatsList" items="${seatsList}" begin="20" end="27">

                                            <c:if test="${seatsList.userId != null}">
                                                <c:set var="status" value="occupied" />
                                            </c:if>

                                            <c:if test="${seatsList.userId == null}">
                                                <c:set var="status" value="vacant" />
                                            </c:if>

                                            <c:if test="${seatsList.userId == loginId}">
                                                <button class="mine"
                                                    id="${seatsList.seatNo}">${seatsList.seatNo}</button>
                                            </c:if>

                                            <c:if test="${seatsList.userId != loginId}">
                                                <button class="${status}"
                                                    id="${seatsList.seatNo}">${seatsList.seatNo}</button>
                                            </c:if>

                                        </c:forEach>
                                    </div>

                                    <div class="seat-list">
                                        <c:forEach var="seatsList" items="${seatsList}" begin="28" end="37">

                                            <c:if test="${seatsList.userId != null}">
                                                <c:set var="status" value="occupied" />
                                            </c:if>

                                            <c:if test="${seatsList.userId == null}">
                                                <c:set var="status" value="vacant" />
                                            </c:if>

                                            <c:if test="${seatsList.userId == loginId}">
                                                <button class="mine"
                                                    id="${seatsList.seatNo}">${seatsList.seatNo}</button>
                                            </c:if>

                                            <c:if test="${seatsList.userId != loginId}">
                                                <button class="${status}"
                                                    id="${seatsList.seatNo}">${seatsList.seatNo}</button>
                                            </c:if>

                                        </c:forEach>
                                    </div>
                                </div>


                                <div class="line2">
                                    <div class="seat-list-row">
                                        <c:forEach var="seatsList" items="${seatsList}" begin="38" end="53">

                                            <c:if test="${seatsList.userId != null}">
                                                <c:set var="status" value="occupied" />
                                            </c:if>

                                            <c:if test="${seatsList.userId == null}">
                                                <c:set var="status" value="vacant" />
                                            </c:if>

                                            <c:if test="${seatsList.userId == loginId}">
                                                <button class="mine"
                                                    id="${seatsList.seatNo}">${seatsList.seatNo}</button>
                                            </c:if>

                                            <c:if test="${seatsList.userId != loginId}">
                                                <button class="${status}"
                                                    id="${seatsList.seatNo}">${seatsList.seatNo}</button>
                                            </c:if>

                                        </c:forEach>
                                    </div>
                                </div>


                            </div>
                        </div>




                        <!-- 열람실 테이블 -->
                        <div class="wrapper-table">
                            <!-- 예약 x 테이블 -->
                            <c:if test="${mySeatInfo == null}">
                                <input type="hidden" name="seatNo" value="seatNo" class="input_selected_seat_no">

                                <table class="seat-info">
                                    <tbody>
                                        <tr>
                                            <th>열람실</th>
                                            <td>제 1열람실</td>
                                            <th class="left">좌석 번호</th>
                                            <td class="selected_seat_no"></td>
                                        </tr>
                                    </tbody>

                                </table>

                                <!-- </form> -->
                                <form id="booking_form" action="${pageContext.request.contextPath}/mylib/bookingSeat.do" method="post" onsubmit="return false;">
                                    <input id="seat_no" type="hidden" name="seatNo">
                                    <button class="reserve_btn booking_btn">예약하기</button>
                                </form>
                            </c:if>


                            <!-- 예약 o 테이블 -->
                            <c:if test="${mySeatInfo != null}">

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

                                <!-- 잔여 시간 -->
                                <fmt:formatDate var="checkinTime" value="${mySeatInfo.checkinYime}"
                                    pattern="HH:mm:ss" />
                                <fmt:formatDate var="checkoutTime" value="${mySeatInfo.checkoutYime}"
                                    pattern="HH:mm:ss" />

                                <fmt:parseNumber var="diffHour" value="${mySeatInfo.diffTime/(1000*60*60)}"
                                    integerOnly="true" />
                                <fmt:parseNumber var="diffMin" value="${mySeatInfo.diffTime/(1000*60) - diffHour*60}"
                                    integerOnly="true" />
                                <fmt:parseNumber var="diffSec"
                                    value="${mySeatInfo.diffTime/1000 - diffHour*60*60 - diffMin*60}"
                                    integerOnly="true" />

                                <c:if test="${diffMin < 10}">
                                    <c:set var="diffMin" value="0${diffMin}"></c:set>
                                </c:if>

                                <c:if test="${diffSec < 10}">
                                    <c:set var="diffSec" value="0${diffSec}"></c:set>
                                </c:if>

                                <c:set var="diffTime" value="${diffHour}:${diffMin}:${diffSec}"></c:set>

                                <input type="hidden" id="diffHour" value="${diffHour}">
                                <input type="hidden" id="diffMin" value="${diffMin}">
                                <input type="hidden" id="diffSec" value="${diffSec}">
                                
                                

                                <table class="reserve-info">
                                    <tbody>
                                        <tr>
                                            <th>열람실</th>
                                            <td colspan="2">${roomName}</td>
                                            <th class="left">좌석 번호</th>
                                            <td colspan="2">
                                                ${mySeatInfo.seatNo}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>예약 시간</th>
                                            <td class="checkin_time">${checkinTime}</td>
                                            <th class="left">반납 시간</th>
                                            <td class="checkout_time">${checkoutTime}</td>
                                            <th class="left">잔여 시간</th>
                                            <td id="time" style="color: blue; font-weight: bold;">${diffTime}</td>
                                        </tr>
                                    </tbody>

                                </table>
                                <div class="reserve-info-btn">
                                    <div style="float: left;">
                                        <form id="return_form" action="${pageContext.request.contextPath}/mylib/returnSeat.do" method="post"
                                            onsubmit="return false;">
                                            <button class="chk_out_btn return_btn">퇴실</button>
                                        </form>
                                    </div>

                                    <div style="float: right; margin-left: 10px;">
                                        <form id="extend_form" action="${pageContext.request.contextPath}/mylib/extendSeat.do" method="post"
                                            onsubmit="return false;">
                                            <button class="renew_btn extend_btn">연장</button>
                                        </form>
                                    </div>

                                    <form id="move_form" action="${pageContext.request.contextPath}/mylib/moveSeat.do" method="post" onsubmit="return false;">
                                        <input id="new_no" type="hidden" name="seatNo">
                                    </form>
                                </div>

                            </c:if>


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

        $(function () {
        	
        	// 예약된 좌석이 있으면 남은 시간 timer start
        	if($(".reserveNo").val() != ""){
        		var hours =  $("#diffHour").val();
                var minutes = $("#diffMin").val();
                var seconds = $("#diffSec").val();
                var totalSeconds = (60 * 60 * hours) + (60 * minutes) + parseInt(seconds, 10) - 1;
                var display = document.querySelector('#time');
                startTimer(totalSeconds, display);
        	}

            // class가 occupied인 button은 disabled 속성 사용해 버튼 비활성화
            $(".occupied").prop("disabled", true);

            $(".sub3").addClass("active");
            $(".submenu10").addClass("active");

            $(".booking_btn").hide();



            $(".mine").on("click", function (e) {
            	  alert("이미 예약된 좌석입니다.");
            });
            
            
            var today = new Date();
            var hours = parseInt(today.getHours());

            $(".vacant").on("click", function (e) {
                e.preventDefault();
                
                if(hours >= 18 || hours < 9){
                	alert("현재는 사용 불가한 시간입니다.");
                	return;
                }
				
                var seatNo = $(this).attr("id");

                if($(".reserveNo").val() != ""){

                    if (confirm("제 1열람실 " + seatNo + "번 좌석으로 이동하시겠습니까?")) {

                        var data = {
                            seatNo: seatNo
                        };

                        $.ajax({
                            type: "post",
                            url: "${pageContext.request.contextPath}/mylib/seatCheck.do",
                            data: data,
                            success: function (result) {

                                if (result == "success") {
                                    alert("좌석 이동이 완료되었습니다.");
                                    $("#move_form #new_no").val(seatNo);
                                    $("#move_form").attr("onsubmit", "return true;");
                                    $("#move_form").submit();

                                } else {
                                    alert("이미 예약된 좌석입니다.");
                                    location.reload();
                                }
                            }
                        });
                    }

                } else {

                    $(".vacant").css("background-color", "#284d70");
                    $(".vacant").css("border", "#4d445b");

                    $(this).css("background-color", "#ff6600");
                    $(this).css("border", "#ff6600");

                    $(".selected_seat_no").html(seatNo);
                    $(".input_selected_seat_no").val(seatNo);

                    $(".booking_btn").show();

                }

            })


            $(".booking_btn").on("click", function (e) {
                e.preventDefault();
                
                var seatNo = $(".input_selected_seat_no").val();

                if (confirm("제 1열람실 " + seatNo + "번 좌석을 예약하시겠습니까?")) {

                    var data = {
                        seatNo: seatNo
                    };

                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/mylib/seatCheck.do",
                        data: data,
                        success: function (result) {

                            if (result == "success") {
                            	alert("예약이 완료되었습니다.");
  		                      	$("#seat_no").val(seatNo);
  		                      	$("#booking_form").attr("onsubmit", "return true;");
  		                      	$("#booking_form").submit();

                            } else {
                                alert("이미 예약된 좌석입니다.");
                                location.reload();
                            }
                        }
                    });


                }


            })

            $(".return_btn").on("click", function () {

                if (confirm("좌석을 반납하시겠습니까?")) {
                	 alert("좌석 반납을 완료하였습니다.");
                     $("#return_form").attr("onsubmit", "return ture;");
                     $("#return_form").submit();
                }
            })

            $(".extend_btn").on("click", function (e) {
                e.preventDefault();

                var diffHour = $("#diffHour").val();
                var diffMin = $("#diffMin").val();
                var result = diffHour < 1 && diffMin < 30;
                var checkoutTime = "<c:out value='${mySeatInfo.checkoutTime}'/>";
                
                if (result == false || checkoutTime.includes("18:00:00")) {
                    alert("연장 가능한 시간이 아닙니다.");

                } else {
                    if (confirm("좌석을 연장하시겠습니까?")) {
                    	 alert("좌석 시간이 연장되었습니다.");
                         $("#extend_form").attr("onsubmit", "return true;");
                         $("#extend_form").submit();
                    }
                }
 
            })
            	
            	
        });

        function rdRoom() {
            location.href = "${pageContext.request.contextPath}/mylib/readingRoom.do";
        }

        function rdRoom2() {
            location.href = "${pageContext.request.contextPath}/mylib/readingRoom2.do";
        }

        function nbRoom() {
            location.href = "${pageContext.request.contextPath}/mylib/notebookRoom.do";
        }
        
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

    </script>

</body>
</html>
