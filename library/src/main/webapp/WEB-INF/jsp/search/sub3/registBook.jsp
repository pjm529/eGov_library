<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 추천도서 > 추천도서등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/search/popup.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" 
 integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
 crossorigin="anonymous"></script>
</head>
<body>

    <div class="container">

        <div class="section">
            <div class="doc">
                <!-- 본문 -->
                <div class="content">
                    <div class="doc">
                        <div class="wrapper-bbs">

                            <!--검색-->
                            <div class="search">
                                <form action="" method="get">
                                    <input type="hidden" name="amount" value="${cri.amount}">
                                    <input type="hidden" name="page" value="1">

                                    <select name="type">
                                        <option value="Title" selected="selected">도서명</option>
                                    </select>

                                    <input type="text" style="height: 34px;" name="keyword" value="${cri.keyword}"
                                        autocomplete="off">

                                    <button id="search_btn" class="btn">검색</button>
                                </form>
                            </div>

							<c:if test="${not empty list }">
                            <!-- 테이블 -->
                            <div class="table-wrap">
                                <table>
                                    <thead>
                                        <tr>
                                            <th style="width: 135px;">이미지</th>
                                            <th>도서 정보</th>
                                            <th style="width: 50px;"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="list" items="${list}">
                                            <tr>
                                                <td class="">
                                                    <img src="${list.bookCover}" style="width: 135px;">
                                                </td>
                                                <td style="text-align: left">
                                                    <p><b>도서명</b> : ${list.bookTitle}</p>
                                                    <p><b>저자명</b> : ${list.bookAuthor}</p>
                                                    <p><b>출판사</b> : ${list.bookPublisher}</p>
                                                    <p><b>출간일</b> : ${list.bookPubDate}</p>
                                                </td>
                                                <td>
                                                    <form id="regist" action="${pageContext.request.contextPath}/search/regist.do" method="post">
                                                        <input type="hidden" name="bookTitle"
                                                            value="${list.bookTitle}">
                                                        <input type="hidden" name="bookAuthor"
                                                            value="${list.bookAuthor}">
                                                        <input type="hidden" name="bookIsbn" value="${list.bookIsbn}">
                                                        <input type="hidden" name="bookCover"
                                                            value="${list.bookCover}">
                                                        <input type="hidden" name="bookPubDate"
                                                            value="${list.bookPubDate}">
                                                        <input type="hidden" name="bookPublisher"
                                                            value="${list.bookPublisher}">
                                                        <button class="btn add_btn">추가</button>
                                                    </form>

                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                            </c:if>
                            <c:if test="${empty list}">
                        
	                        	<c:if test="${empty cri.keyword}">
		                        	<br><br>
		                        	<div>
		                        		<h3 style="width:250px;">자료를 검색해주세요.</h3>
		                        	</div>
	                        	</c:if>
	                        	
	                        	<c:if test="${not empty cri.keyword}">
	                        		<br><br>
	                        		<div>
										<h3 style="width:250px;">찾으시는 자료가 없습니다.</h3>
									</div>
								</c:if>
	                        </c:if>
                        </div>
                        <br>
                        <div class="pageInfo" style="text-align: center">

                            <c:if test="${page.prev }">
                                <a class="not" href="${page.startPage - 1}">이전</a>
                            </c:if>

                            <c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">

                                <c:if test="${num != 0}">
                                    <a class="${page.cri.page == num ? " current":"not" }" href="${num }">${num
                                        }</a>
                                </c:if>

                            </c:forEach>

                            <c:if test="${page.next }">
                                <a class="not" href="${page.endPage + 1}">다음</a>
                            </c:if>
                        </div>
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

    <script>
        $(function () {
            let moveForm = $(".moveForm");

            $(".pageInfo a").on("click", function (e) {
                e.preventDefault();
                moveForm.find("input[name = 'page']").val($(this).attr("href"));
                moveForm.submit();

            });
            $(".add_btn").on("click", function () {
                if (confirm("추천 도서를 등록하시겠습니까?")) {
                    alert("추천도서가 등록되었습니다.")
                    $(this).attr("onsubmit", "return true");
                    $(this).submit();
                } else {
                    alert("등록이 취소되었습니다.")
                }
            });
        });

    </script>

</body>
</html>