<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 관리자 > 일정목록</title>
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
                    <h3>일정목록</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="/">
                                <img src="${pageContext.request.contextPath}/images/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/memberList.do">관리자</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/calendarList.do">일정목록</a>
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

                            <div class="inline">
                                <form action="">
                                	일정년월:
                                    <select name="year" style="width: 75px;">
                                        <c:forEach var="i" begin="2020" end="2025">
                                    		<option value="${i}" ${i== date.year ? "selected=selected":'' }>
                                    		${i }년
                                    		</option>
                                    	</c:forEach>
                                    </select>
                                    <select name="month" style="width: 60px;">
                                    	<c:forEach var="i" begin="1" end="12">
                                    		<option value="${i}" ${i== date.month ? "selected=selected":'' }>
                                    		${i }월
                                    		</option>
                                    	</c:forEach>
                                    </select>
                                    <button class="btn">이동</button>
                                </form>

                            </div>

                            <!-- 테이블 -->
                            
                            <div class="table-wrap">
                            	<c:if test="${not empty calendarList }">
                                <table>
                                    <thead>
                                        <tr>
                                            <th style="width: 100px;">아이디</th>
                                            <th style="width: 100px;">날짜</th>
                                            <th style="width: 235px;">일정내용</th>
                                            <th style="width: 100px;">등록일</th>
                                            <th style="width: 60px;">권한</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:forEach var="list" items="${calendarList}">
                                            <tr>
                                                <td class="">${list.userId }</td>
                                                <td>${list.start}</td>
                                                <td>${list.title}</td>
                                                <td>${list.regDate }</td>
                                                <td>
                                                    <form action="${pageContext.request.contextPath}/admin/calDelete.do" method="post"
                                                        onsubmit="return false;">
                                                        <input type="hidden" name="year" value="${date.year }">
                                                        <input type="hidden" name="month" value="${date.month }">
                                                        <input type="hidden" name="calNo" value="${list.calNo }">
                                                        <button class="btn2">삭제</button>
                                                    </form>

                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                                </c:if>
                                
                                <c:if test="${empty calendarList }">
                                <br>
                                <h2>등록 된 일정이 없습니다.</h2>
                                </c:if>

                                <br>

                                <div style="float: right;">
                                    <button class="add_btn btn">추가</button>
                                </div>

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
            $(".sub4").addClass("active");

            $(".btn2").on("click", function () {

                if (confirm("일정을 삭제하시겠습니까?")) {
                    alert("일정을 삭제하였습니다.")
                    $("form").attr("onsubmit", "return true");
                    $("form").submit();
                }
            })

            $('.add_btn').on("click", function (e) {

                e.preventDefault();
                let popUrl = "${pageContext.request.contextPath}/admin/calPopUp.do";
                let popOption = "width = 700px, height=250px, top=300px, scrollbars=no, resizeable=no";
                window.open(popUrl, "일정 추가", popOption);
            });

        });

    </script>

</body>
</html>