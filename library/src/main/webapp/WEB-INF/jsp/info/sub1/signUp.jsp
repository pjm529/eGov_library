<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
	<title>라온도서관 > 이용안내 > 회원가입안내</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/sub1/signUp.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/sb_page.css">
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
                    <h3>회원가입안내</h3>
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
                            <a href="${pageContext.request.contextPath}/info/signUp.do">회원가입안내</a>
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
                <!-- 60행까지는 기존 sub_page와 동일         -->
                        <div class="doc-body con17" id="contentArea">
                            <div class="body">
                                <div class="doc-body">
                                    <div class="roomicon">
                                        <div class="inner icowrap">
                                            <span class="ico ico5"></span>
                                            <strong>회원가입 안내</strong>
                                            <p>
					                           "라온도서관에 회원가입하셔서 도서관을 
					                                                편리하게 이용하시고 더불어 다양한 혜택을 누리세요." <br>회원 가입을 하시면
					                                                도서 대출 및 열람실을 이용할 수 있으며 희망 도서를 신청할 수 있으며
					                                                도서관을 쉽고 편리하게 이용할 수 있습니다.
                                            </p>
                                            <!-- 회원가입 화면으로 연결 -->
                                            <p class="basic_btn">
                                                <a href="#a" class="btn_go newWin" target="_blank" tutle="새창으로 열립니다."></a> 
                                        </div>
                                    </div>
                                    <h3>회원가입은 어떻게 할 수 있나요?</h3>
                                        <div class="step_box01">
                                            <ul class="mode">
                                                <li class="step01">
                                                    <div>
                                                        <h4>STEP 01</h4>
                                                        <h5>홈페이지 접속,<br>
                                                        	회원가입 메뉴</h5>
                                                    </div>
                                                </li>
                                                <li class="arr">
                                                    <div>
                                                        <img src="https://library.daegu.go.kr/data/menuResources/h35/17/1602747627060.png">
                                                    </div>
                                                </li>
                                                <li class="step02">
                                                    <div>
                                                        <h4>STEP 02</h4>
                                                        <h5>회원정보 입력,<br>
                                                           	  이메일 인증</h5>
                                                    </div>
                                                </li>
                                                <li class="arr">
                                                    <div>
                                                        <img src="https://library.daegu.go.kr/data/menuResources/h35/17/1602747627060.png">
                                                    </div>
                                                </li>
                                                <li class="step03">
                                                    <div>
                                                        <h4>STEP 03</h4>
                                                        <h5>회원가입 완료,<br>
                                                           	  홈페이지 이용</h5>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <h3>구비서류</h3>
                                        <div class="rsv-info"></div>
                                        <div class="auto-scroll">
                                            <table class="tbl-type01" summary="구비서류 안내표">
                                                <caption>구비서류</caption>
                                                <colgroup>
                                                    <col width="22%"></col1>
                                                    <col width="22%"></co12>
                                                    <col width="*"></col13>
                                                </colgroup>
                                                <thead>
                                                    <tr class="first">
                                                        <th scope="col" class="first th1">구분</th>
                                                        <th scope="col" class="first th1">세부내용</th> 
                                                    </tr>
                                                </thead>    
                                                    <tr class="first">
                                                        <th scope="col" class="first th1">발급 가능대상</th>
                                                        <td class="left last td1" colspan="2">
                                                            <ul class="con">
                                                                <li>주민등록상 대구시민(경산시, 칠곡군도 여기에 해당)</li>
                                                                <li>타지역 거주자 중 대구소재 학생 또는 직장인</li>
                                                                <li>대구에 거주 중인 외국인 등록자</li>
                                                            </ul>
                                                        </td>
                                                    </tr>
                                                        
                                                </tbody>
                                            </table>
                                        </div>

                                        <!-- 유의사항 -->
                                        <h3>유의사항</h3>
                                        <ul class="con">
                                            <li>가입하셨던 이메일로 재가입은 불가능합니다.</li>
                                        </ul>
                                    </div>
                                    <div id="menuRatingDiv"></div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="../../layout/footer.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>

	$(".sub1").addClass("active");
	
</script>
</body>
</html>
