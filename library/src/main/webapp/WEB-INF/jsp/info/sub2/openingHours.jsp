<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
	<title>라온도서관 > 이용안내 > 이용시간 및 휴관일</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/sb_page.css">
</head>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" 
  crossorigin="anonymous"></script>
<body>

	<div class="header">
    <jsp:include page="../../layout/header.jsp"></jsp:include>
    </div>

    <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>이용시간 및 휴관일</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="${pageContext.request.contextPath}">
                                <img src="${pageContext.request.contextPath}/images/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/info/signUp.do">이용안내</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/info/openingHours.do">이용시간 및 휴관일</a>
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
                        <div class="wrapper-bbs">
                        
                        <h3>이용시간</h3>
                            <!-- 테이블 -->
                            <div class="table-wrap">
                                <table>
                                    <thead>
                                        <tr>
                                            <th style="width: 27%;" colspan="2">구분</th>
                                            <th style="width: 10%;">평일</th>
                                            <th style="width: 10%;">토·일요일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td style="width: 9%;">1층</td>
                                            <td>어린이·유아자료실</td>
                                            <td>09:00 ~ 18:00</td>
                                            <td rowspan="5">09:00 ~ 17:00</td>
                                        </tr>
                                        <tr>
                                        	<td rowspan="2">2층</td>
                                        	<td>종합자료실(일반·참고 자료실)</td>
                                        	<td rowspan="2">09:00 ~ 22:00</td>
                                        </tr>
                                        <tr>
                                        	<td>디지털자료실</td>
                                        </tr>
                                        <tr>
                                        	<td rowspan="2">3층</td>
                                        	<td>시청각실</td>
                                        	<td rowspan="2">09:00 ~ 18:00</td>
                                        </tr>
                                        <tr>
                                        	<td>강좌실</td>
                                        </tr>
                                        <tr>
                                        	<td>4층</td>
                                        	<td colspan="1">1열람실, 2열람실, 노트북실</td>
                                        	<td colspan="2">09:00 ~ 18:00</td>
                                        </tr>
                                    </tbody>
                                </table>
                                              
                            </div>
                        
                        <h3>휴관일</h3>
                        <ul class="con">
                        	<li>
                        		<b>정기휴관일 : </b>
                        		매주 월요일, 법정공휴일(일요일을 제외한 관공서 공휴일)
                        	</li>
                        	<li>
                        		<b>임시휴관일</b>
                        	</li>
                        		<ul>
                        			<li>자료정리·점검 및 시설물 보수·정비 등을 위한 날</li>
                        			<li>도서관 및 기타 사정으로 도서관장이 지정한 날</li>
                        		</ul>
                        </ul>
                        
                        <h3>이용수칙</h3>
                        <ul class="con">
                        	<li>1인 10권 15일간 대출 가능합니다.</li>
                        	<li>회원증은 본인만 사용할 수 있으며, 타인에게 대여할 수 없습니다.</li>
                        	<li>대출시 회원증을 제시하여 주시기 바랍니다.</li>
                        	<li>연체된 경우 연체된 일수만큼 대출이 정지됩니다.</li>
                        	<li>도서 분실 · 훼손시 도서관 규정에 따라 변상합니다.</li>
                        	<li>참고도서, 연속간행물, 디지털자료 등은 대출할 수 없습니다.</li>
                        	<li>휴대전화는 진동 또는 무음으로 해주시고, 통화는 자료실 밖에서 합니다.</li>
                        	<li>자료실에서는 음식물 반입, 잡담 등 타인에게 방해되는 행위를 자제해 주시기 바랍니다.</li>
                        </ul>
                        

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>
    
    <!-- footer -->
    <jsp:include page="../../layout/footer.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>

	$(".sub2").addClass("active");
	
</script>
</body>
</html>
