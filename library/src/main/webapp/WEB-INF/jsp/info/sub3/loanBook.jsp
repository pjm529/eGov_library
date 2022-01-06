<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
   <title>라온도서관 > 이용안내 > 도서대출/반납/예약</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/sub3/sb_page.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/sub3/loanBook.css">

<style>
 .wrapper-bbs{
	padding-top: 20px;
 	}

.bbs-content b {
	font-size: 140%;
	font-weight: 800;
	padding: 10px 15px;
	}

.bbs-title {
	height: 40px;
	}

.bbs-content {
	min-height: 240px;
	}

p {
	margin: 0;
	padding: 20px 15px;
	line-height: 150%;
	word-break: keep-all;
	font-size: 15px;
	font-weight: normal;
	color: #464646;
	}
</style>   
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
                    <h3>도서대출/반납/예약</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li style="background-image: none;">
                            <a href="${pageContext.request.contextPath}">
                                <img src="${pageContext.request.contextPath}/images/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/info/signUp.do">이용안내</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/info/loanBook.do">도서대출/반납/예약</a>
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

                            <div class="doc-body">

                                <h3>대출자격</h3>

                                <ul class="con">
                                    <li>주민등록상 대구광역시 거주자</li>
                                    <li>대구광역시 소재 학교 재학생 및 직장인</li>
                                </ul>

                                <h3>대출권수 및 대출기간</h3>

                                <ul class="con">
                                    <li>일반회원 : 1인당 1회 10권 (대출일포함 15일)</li>
                                    <li>우수회원 : 1인당 1회 15권 (대출일포함 15일)</li>
                                    <ul>
                                        <li class="dep01">대출시 본인회원증으로만 대출가능</li>
                                        <li class="dep01">대출 연장 불가</li>
                                    </ul>
                                </ul>

                                <h3>대출 불가능 자료</h3>

                                <ul class="con">
                                    <li>희귀자료 및 고서 등 귀중본자료</li>
                                    <li>참고자료 및 행정자료</li>
                                    <li>연속간행물 및 음악CD자료</li>
                                    <li>기타 대출제한이 필요하다고 인정되는 자료</li>
                                </ul>
                                
                                <h3>도서대출</h3>

                                <ul class="con">
                                    <li>홈페이지에서 도서 신청 후 방문 수령</li>
                                    <ul>
                                    	<li class="dep01">도서 신청 후 다음 날까지 도서 수령 가능</li>
                                    	<li class="dep01">신청 후 도서 미 수령 시 도서 대출 불가 7일</li>
                                    	<li class="dep01">부득이한 경우 도서관 문의</li>
                                    </ul>
                                </ul>

                                <h3>도서반납</h3>

                                <ul class="con">
                                    <li>직접 도서관 방문을 통한 반납</li>
                                    <li>택배를 이용한 도서 반납</li>
                                    <ul>
                                    	<li class="dep01">택배 도착 일 기준 반납 처리</li>
                                        <li class="dep01">택배비 이용자 부담</li>
                                    </ul>
                                </ul>
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
    $(function () {
        $(".sub3").addClass("active");
    })

</script>
</body>
</html>