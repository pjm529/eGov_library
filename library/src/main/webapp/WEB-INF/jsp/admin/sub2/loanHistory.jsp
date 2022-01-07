<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 관리자 > 도서관련 > 대출내역</title>
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
                    <h3>대출내역</h3>
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
                            <a href="${pageContext.request.contextPath}/admin/loanHistory.do">대출내역</a>
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

                            <!--검색-->
                            <div class="search">
                                <form action="" onsubmit="return false;">
                                    <input type="hidden" name="amount" value="${page.cri.amount }">
                                    <input type="hidden" name="page" value="1">
                                    <select name="type">

                                        <c:if test="${empty page.cri.type}">
                                            <option value="userId" selected="selected">아이디</option>
                                            <option value="bookTitle">도서명</option>
                                            <option value="bookIsbn">ISBN</option>
                                            <option value="loanDate">대출날짜</option>
                                        </c:if>


                                        <c:if test="${page.cri.type == 'userId'}">
                                            <option value="userId" selected="selected">아이디</option>
                                            <option value="bookTitle">도서명</option>
                                            <option value="bookIsbn">ISBN</option>
                                            <option value="loanDate">대출날짜</option>
                                        </c:if>

                                        <c:if test="${page.cri.type == 'bookTitle' }">
                                            <option value="userId">아이디</option>
                                            <option value="bookTitle" selected="selected">도서명</option>
                                            <option value="bookIsbn">ISBN</option>
                                            <option value="loanDate">대출날짜</option>
                                        </c:if>

                                        <c:if test="${page.cri.type == 'bookIsbn' }">
                                            <option value="userId">아이디</option>
                                            <option value="bookTitle">도서명</option>
                                            <option value="bookIsbn" selected="selected">ISBN</option>
                                            <option value="loanDate">대출날짜</option>
                                        </c:if>
                                        
                                        <c:if test="${page.cri.type == 'loanDate' }">
                                            <option value="userId">아이디</option>
                                            <option value="bookTitle">도서명</option>
                                            <option value="bookIsbn">ISBN</option>
                                            <option value="loanDate" selected="selected">대출날짜</option>
                                        </c:if>

                                    </select>
                                    <input type="text" name="keyword" value="${page.cri.keyword }"
                                        autocomplete="off">
                                    <button id="search_btn" class="btn">검색</button>

                                </form>

                            </div>
                            <!-- 대출 도서 수 -->
                            <div class="inline">
                                <form action="">

                                    <span style="margin-right: 10px;"> 대출 중 : <b>${total }</b> 건</span>
                                    <select name="amount">

                                        <c:if test="${page.cri.amount == 10 }">
                                            <option value="10" selected="selected">10건씩 보기</option>
                                            <option value="20">20건씩 보기</option>
                                            <option value="30">30건씩 보기</option>
                                            <option value="40">40건씩 보기</option>
                                        </c:if>

                                        <c:if test="${page.cri.amount == 20 }">
                                            <option value="10">10건씩 보기</option>
                                            <option value="20" selected="selected">20건씩 보기</option>
                                            <option value="30">30건씩 보기</option>
                                            <option value="40">40건씩 보기</option>
                                        </c:if>

                                        <c:if test="${page.cri.amount == 30 }">
                                            <option value="10">10건씩 보기</option>
                                            <option value="20">20건씩 보기</option>
                                            <option value="30" selected="selected">30건씩 보기</option>
                                            <option value="40">40건씩 보기</option>
                                        </c:if>

                                        <c:if test="${page.cri.amount == 40 }">
                                            <option value="10">10건씩 보기</option>
                                            <option value="20">20건씩 보기</option>
                                            <option value="30">30건씩 보기</option>
                                            <option value="40" selected="selected">40건씩 보기</option>
                                        </c:if>

                                    </select>
                                    <input type="hidden" name="page" value="1">
                                    <input type="hidden" name="type" value="${page.cri.type }">
                                    <input type="hidden" name="keyword" value="${page.cri.keyword }">
                                    <button id="list_btn" class="btn">이동</button>
                                </form>

                            </div>

                            <!-- 테이블 -->
                            <c:if test="${not empty loanHistory }">
                            <div class="table-wrap">
                                <table>
                                    <thead>
                                        <tr>
                                            <th style="width: 100px;">아이디</th>
                                            <th style="">도서명</th>
                                            <th style="">ISBN</th>
                                            <th style="width: 90px;">대출날짜</th>
                                            <th style="width: 90px">반납날짜</th>
                                            <th style="width: 90px">반납예정일</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:forEach var="loanHistory" items="${loanHistory}">
                                            <tr>
                                                <td>${loanHistory.userId }</td>
                                                <td>${loanHistory.bookTitle }</td>
                                                <td>${loanHistory.bookIsbn}</td>
                                                <td>${loanHistory.loanDate }</td>
                                                <c:if test="${empty loanHistory.returnDate }">
												<td><span style="color:red; font-weight: bold">미반납</span></td>
												</c:if>
												
												<c:if test="${not empty loanHistory.returnDate }">
												<td>${loanHistory.returnDate }</td>
												</c:if>
                                                <td>${loanHistory.returnPeriod }</td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>

                                <br>

                                <div class="pageInfo" style="">

                                    <c:if test="${page.prev }">
                                        <a class="not" href="${page.startPage - 1}">이전</a>
                                    </c:if>

                                    <c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
                                        <a class="${page.cri.page == num ? " current":"not" }"
                                            href="${num }"><span>${num }</span></a>
                                    </c:forEach>

                                    <c:if test="${page.next }">
                                        <a class="not" href="${page.endPage + 1}">다음</a>
                                    </c:if>
                                </div>
                            </div>
                            </c:if>

                        </div>
                        <c:if test="${empty loanHistory }">
                        <br>
                        <h2>조회 된 도서가 없습니다.</h2>
                        </c:if>

                    </div>

                </div>

            </div>
        </div>
    </div>

    <form method="get" class="moveForm">
        <input type="hidden" name="amount" value="${page.cri.amount }">
        <input type="hidden" name="page" value="${page.cri.page }">
        <input type="hidden" name="type" value="${page.cri.type }">
        <input type="hidden" name="keyword" value="${page.cri.keyword }">
    </form>

    <!-- footer -->
    <jsp:include page="../../layout/footer.jsp"></jsp:include>


    <script>

        $(function () {
            $(".sub2").addClass("active");
            $(".submenu1").addClass("active");

            let moveForm = $(".moveForm");

            //pageInfo의 a태그를 누르면 a태그의 href 속성을 가져와서 moveForm의 page에 넣고 moveForm이 submit됨
            $(".pageInfo a").on("click", function (e) {
                e.preventDefault();
                moveForm.find("input[name = 'page']").val($(this).attr("href"));
                moveForm.submit();
            });

            // 검색 버튼을 누를 시 공백이면 alert
            $("#search_btn").on("click", function (e) {
                let keyword = $("input[name='keyword']").val();
                if (keyword == "") {
                    alert("검색어를 입력해주세요.");
                } else {
                    $("form").attr("onsubmit", "return true");
                    $("form").submit();
                }

            });

        });

    </script>

</body>
</html>