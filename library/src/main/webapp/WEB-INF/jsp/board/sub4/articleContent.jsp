<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<html>
<head>
   <title>라온도서관 > 열린공간 > 분실물찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/sub4/content_page.css">
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
                    <h3>분실물찾기</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li style="background-image: none;">
                            <a href="/board/articleList">
                                <img src="${pageContext.request.contextPath}/images/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/board/noticeList.do">열린공간</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/board/articleList.do">분실물찾기</a>
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

                            <!-- 테이블 -->
                            <div class="table-wrap">
                                <table class="bbs-edit">
                                    <tbody>
                                        <!-- 제목 -->
                                        <tr>
                                            <td class="bbs-title" colspan="6">
                                                <b>${article.articleTitle}</b>
                                            </td>
                                        </tr>

                                        <!-- 작성자 | 작성일 | 조회수 -->
                                        <tr>
                                            <th class="first">작성자</th>
                                            <td style="width: 15%;">관리자</td>
                                                <th class="first">작성일</th>
                                                <td>
                                                    <fmt:formatDate var="articleRegDate"
                                                        value="${article.articleRegDate}" pattern="yyyy-MM-dd" />
                                                    ${articleRegDate}
                                                </td>
                                                <th class="first">조회수</th>
                                                <td>${article.articleViews}</td>
                                        </tr>

                                        <!-- 본문 내용 -->
                                        <tr>
                                            <td colspan="6">
                                                <div class="bbs-content" style="width:950px; overflow: auto;">
                                                    <p>${article.articleContent}</p>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                                <!-- 이전글, 다음글 -->
                                <table class="article-board">
                                    <tbody>
                                        <tr class="board-prev first">
                                            <td class="prev" style="border-right: 1px solid #dee1e7"><img
                                                    src="${pageContext.request.contextPath}/images/board/sub1/angle_up.png" class="angle"> 이전글
                                            </td>


                                            <c:if test="${articlePre.articleNo == null}">
                                                <td class="td2">이전글이 없습니다.</td>
                                            </c:if>

                                            <c:if test="${articlePre.articleNo != null}">
                                                <td class="td2">
                                                    <input type="hidden" value="${articlePre.articleNo}">
                                                    <a
                                                        href="${pageContext.request.contextPath}/board/articleContent.do?articleNo=${articlePre.articleNo}&amount=${cri.amount}&page=${cri.page}">${articlePre.articleTitle}</a>
                                                </td>
                                            </c:if>


                                        </tr>

                                        <tr class="board-next">
                                            <td class="next" style="border-right: 1px solid #dee1e7;"><img
                                                    src="${pageContext.request.contextPath}/images/board/sub1/angle_down.png" class="angle"> 다음글
                                            </td>

                                            <c:if test="${articleNext.articleNo == null}">
                                                <td class="td2">다음글이 없습니다.</td>
                                            </c:if>

                                            <c:if test="${articleNext.articleNo != null}">
                                                <td class="td2">
                                                    <input type="hidden" value="${articleNext.articleNo}">
                                                    <a
                                                        href="/board/articleContent?articleNo=${articleNext.articleNo}&amount=${cri.amount}&page=${cri.page}">${articleNext.articleTitle}</a>
                                                </td>
                                            </c:if>

                                        </tr>
                                    </tbody>
                                </table>

                                <!-- 글쓰기 btn -->
                                <div class="list_wrap">

                                    <!-- '목록으로' 눌렀을 때 처음 봤던 게시물 해당목록 페이지로 가기 -->
                                    <form action="${pageContext.request.contextPath}/board/articleList.do" method="get">
                                        <input type="hidden" name="amount" value="${cri.amount}">
                                        <input type="hidden" name="page" value="${cri.page}">
                                        <input type="hidden" name="type" value="${cri.type}">
                                        <input type="hidden" name="keyword" value="${cri.keyword}">
                                        <button class="list_btn">목록으로</button>
                                    </form>
                                </div>
                                <sec:authorize access="hasRole('ROLE_ADMIN')">
                                    <div class="delete_wrap">
                                        <!-- '삭제하기' 눌렀을 때 처음 봤던 게시물 해당목록 페이지로 가기 -->
                                        <form action="${pageContext.request.contextPath}/board/articleDelete.do" method="get"
                                            onsubmit="return confirm('삭제하시겠습니까?');">
                                            <input type="hidden" name="articleNo" value="${article.articleNo}">
                                            <input type="hidden" name="amount" value="${cri.amount}">
                                            <input type="hidden" name="page" value="${cri.page}">
                                            <input type="hidden" name="type" value="${cri.type}">
                                            <input type="hidden" name="keyword" value="${cri.keyword}">
                                            <button class="delete_btn">삭제하기</button>
                                        </form>
                                    </div>

                                    <div class="update_wrap">
														
                                        <button class="update_btn" style="margin-right: 20px;"
                                            onclick="location.href='${pageContext.request.contextPath}/board/articleModifyForm?articleNo=${article.articleNo}&amount=${cri.amount}&page=${cri.page}'">
                                            	수정하기</button>
                                    </div>
                                </sec:authorize>

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

    $(document).ready(function () {
        $(".sub4").addClass("active");

    });

</script>

</body>
</html>