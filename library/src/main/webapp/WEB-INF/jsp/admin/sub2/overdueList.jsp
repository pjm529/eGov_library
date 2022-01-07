<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 관리자 > 도서관련 > 연체중도서</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/sub1/memberList.css">
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
                    <h3>연체중도서</h3>
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
                            <a href="${pageContext.request.contextPath}/admin/loanHistory.do">도서관련</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/overdueList.do">연체중도서</a>
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
                            <!-- 연체 도서 수 -->
                            <div class="inline">
                                <span style="margin-right: 10px;"> 연체 중 : <b>${total }</b> 건</span>
                            </div>
                            <br>
                            <!-- 테이블 -->
							<c:if test="${not empty overdueList }">
                            <form action="${pageContext.request.contextPath}/admin/overdueMail.do" method="get" onsubmit="return false;">
                                <button class="btn2" style="">메일</button>
                                <div class="table-wrap" style="overflow: auto; height: 500px;">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th style=""><input type="checkbox" class="chk-all"></th>
                                                <th style="width: 100px;">아이디</th>
                                                <th style="">도서명</th>
                                                <th style="">ISBN</th>
                                                <th style="width: 90px;">대출날짜</th>
                                                <th style="width: 90px;">반납예정일</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach var="list" items="${overdueList}">
                                                <tr>
                                                    <td><input type="checkbox" name="userEmail" class="chk"
                                                            value="${list.userEmail},${list.returnPeriod},${list.bookTitle}"></td>
                                                    <td>${list.userId }</td>
                                                    <td>${list.bookTitle }</td>
                                                    <td>${list.bookIsbn}</td>
                                                    <td>${list.loanDate }</td>
                                                    <td>${list.returnPeriod}</td>

                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>

                            </form>
							</c:if>
							
							<c:if test="${empty overdueList }">
								<h2 style="text-align: center;">연체 된 도서가 없습니다.</h2>
							</c:if>
							
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
            $(".sub2").addClass("active");
            $(".submenu3").addClass("active");
            $(".btn2").on("click", function () {
                let cnt = $("input[name=userEmail]:checkbox:checked").length;

                if (cnt > 0) {
                    if (confirm("메일을 전송하시겠습니까?")) {
                        alert("메일이 전송되었습니다.")
                        $("form").attr("onsubmit", "return true;");
                        $("form").submit();
                    }

                } else {
                    alert("회원을 선택해주세요");
                }

            });

            $(".chk-all").on("click", function () {
                $(".chk").prop("checked", this.checked);
            })

        });

    </script>

</body>
</html>