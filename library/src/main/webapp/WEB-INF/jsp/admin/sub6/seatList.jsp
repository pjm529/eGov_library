<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 관리자 > 열람실이용정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/sub4/calendarList.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" 
 integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
 crossorigin="anonymous"></script>
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
                    <h3>열람실이용정보</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="${pageContext.request.contextPath}">
                                <img src="${pageContext.request.contextPath}/images/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/memberList.do">관리자</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/seatList.do">열람실이용정보</a>
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
                <div class="content" style="">
                    <div class="doc">
                        <div class="wrapper-bbs" style="">

                            <!-- 테이블 -->
                            
                            <div class="table-wrap">
                            	<c:if test="${not empty seatList }">
                                <table>
                                    <thead>
                                        <tr>
                                       		<th style="width: 100px;">좌석번호</th>
                                        	<th style="width: 100px;">아이디</th>
                                            <th style="width: 90px;">입실시간</th>
                                            <th style="width: 90px;">퇴실예정시간</th>
                                            <th style="width: 60px;">퇴실</th>
                                        </tr>
                                    </thead>
                                    <tbody>
									
                                        <c:forEach var="list" items="${seatList}">
                                            <tr>
                                                <td>${list.seatNo}</td>
                                                <td>${list.userId}</td>
                                                <td>${list.checkinTime}</td>
                                                <td>${list.checkoutTime}</td>
                                                <td>
                                                    <form action="${pageContext.request.contextPath}/admin/seatReturn.do" method="post"
                                                        onsubmit="return false;">
                                                        <input type="hidden" name="userId" value="${list.userId}">
                                                        <button class="btn2">퇴실</button>
                                                    </form>

                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                                </c:if>
                                
                                <c:if test="${empty seatList }">
                                <br>
                                <h2>열람실을 이용 중인 회원이 없습니다.</h2>
                                </c:if>

                                <br>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- footer -->
    <jsp:include page="../../layout/footer.jsp"></jsp:include>

    <script>

        $(function () {
            $(".sub6").addClass("active");

            $(".btn2").on("click", function () {

                if (confirm("퇴실 처리하시겠습니까?")) {
                    alert("퇴실 처리되었습니다.")
                    $("form").attr("onsubmit", "return true");
                    $("form").submit();
                }
            });
            
        });

    </script>

</body>
</html>