<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false" %>
<html>
<head>
   <title>라온도서관 > 열린공간 > 자주묻는질문</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/sub2/FAQ.css">
<body>

	<div class="header">
    <jsp:include page="../../layout/header.jsp"></jsp:include>
    </div>

    <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>자주묻는질문</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="${pageContext.request.contextPath}">
                                <img src="${pageContext.request.contextPath}/images/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/board/noticeList.do">열린공간</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/board/FAQ.do">자주묻는질문</a>
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
                    <div class="accordion">
                        <input type="radio" name="accordion" id="answer01">
                            <label for="answer01">회원탈퇴는 어떻게 해야 하나요?<em></em></label>
                            <div>
                                <p>
			                                    나의도서관 회원 탈퇴 메뉴에서 회원 탈퇴를 진행하실 수 있습니다.<br>
			                                    회원 탈퇴시 연체된 도서가 있을경우 탈퇴가 불가능합니다.
                                </p>
                            </div>
                         <!-- 기존'의 질문 종료 -->
                        <!-- 다음 질문을 추가 -->
                        <input type="radio" name="accordion" id="answer02">
                        <label for="answer02">희망도서 신청은 어떻게 하나요?<em></em></label>
                        <div>
                            <p>
			                                홈페이지접속 > 로그인 > 나의도서관 > 희망도서신청/조회 신청<br>
			                                신청 확인 후 처리 절차에 따라 도서가 구비됩니다.
                            </p>
                        </div>
                        <!-- 기존의 질문 종료 -->
                        <!-- 다음 질문을 추가 -->
                        <input type="radio" name="accordion" id="answer03">
                        <label for="answer03">회원가입은 어떻게 해야하나요?<em></em></label>
                        <div> 
                            <p>
                                <b>대출회원가입</b><br>
                                	도서관 대출회원으로 가입하시면 도서관 자료를 무료로 빌려가실 수 있습니다.<br><br><br>
 
                                <b>가입대상</b><br>
                                 - 주민등록상 대구광역시, 경산시, 칠곡군 거주자<br>
                                 - 다만, 직장 및 학교가 대구광역시, 경산시, 칠곡군 소재(증명서 제출)<br><br><br>

                                <b>가입 방법</b><br>
                              	  라온도서관 홈페이지 접속 -> 이메일 인증 후 홈페이지 회원가입<br><br>
                            </p>
                        </div>
                        <input type="radio" name="accordion" id="answer04">
                        <label for="answer04">주차장은 어떻게 사용하나요?<em></em></label>
                        <div>
                            <p>
                                	도서관 뒤편, 좌측편에 주차장이 마련되어 있으며, 도서관 운영시간은(평일 09시~18시, 주말 09시~17시)입니다.<br>
                            </p>    
                        </div>    
                    </div>	                
                </div>

            </div>
        </div>
    </div>
    
    <jsp:include page="../../layout/footer.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
   $(function() {
   		$(".sub2").addClass("active");  
   })
</script>
</body>
</html>