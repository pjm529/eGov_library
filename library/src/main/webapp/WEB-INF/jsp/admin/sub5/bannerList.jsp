<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 관리자 > 배너목록</title>
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
                    <h3>배너목록</h3>
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
                            <a href="${pageContext.request.contextPath}/admin/bannerList.do">배너목록</a>
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
                            	<c:if test="${not empty banner_list }">
                                <table>
                                    <thead>
                                        <tr>
                                            <th style="width: 100px;">배너</th>
                                            <th style="width: 100px;">등록일</th>
                                            <th style="width: 60px;">권한</th>
                                        </tr>
                                    </thead>
                                    <tbody>
									
                                        <c:forEach var="list" items="${bannerList}">
                                            <tr>
                                                <td><img src="${list.path }"></td>
                                                <td>${list.regDate }</td>
                                                <td>
                                                    <form action="${pageContext.request.contextPath}/admin/bannerDel.do" method="post"
                                                        onsubmit="return false;">
                                                        <input type="hidden" name="path" value="${list.path }">
                                                        <button class="btn2">삭제</button>
                                                    </form>

                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                                </c:if>
                                
                                <c:if test="${empty bannerList }">
                                <br>
                                <h2>등록 된 배너가 없습니다.</h2>
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
            $(".sub5").addClass("active");

            $(".btn2").on("click", function () {

                if (confirm("배너를 삭제하시겠습니까?")) {
                    alert("배너를 삭제하였습니다.")
                    $("form").attr("onsubmit", "return true");
                    $("form").submit();
                }
            });
            
            $('.add_btn').on("click", function (e) {

                e.preventDefault();
                let popUrl = "${pageContext.request.contextPath}/admin/bannerPopUp.do";
                let popOption = "width = 700px, height=200px, top=300px, scrollbars=no, resizeable=no";
                window.open(popUrl, "배너 추가", popOption);
            });

        });

    </script>

</body>
</html>