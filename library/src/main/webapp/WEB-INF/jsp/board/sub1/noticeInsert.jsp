<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
	<title>라온도서관 > 열린공간 > 공지사항</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/sub1/notice_write_page.css">
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
                    <h3>공지사항</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li style="background-image: none;">
                            <a href="${pageContext.request.contextPath}">
                                <img src="${pageContext.request.contextPath}/images/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/board/noticeList.do">열린공간</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/board/noticeList.do">공지사항</a>
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

                            <c:set var="now" value="<%=new java.util.Date()%>" />
                            <fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd" />

                            <div class="table-wrap">
                                <form action="${pageContext.request.contextPath}/board/insertNotice.do" method="post" onsubmit="return false" role="form">
                                    <input type="hidden" name="writerName" 
                                    value="<sec:authentication property="principal.member.userName"/>">

                                    <table class="bbs-edit">
                                        <tbody>
                                            <tr>
                                                <th class="first">제목</th>
                                                <td colspan="3">
                                                    <input type="text" style="width: 80%; height: 27px;"
                                                        placeholder="제목을 작성해 주세요" name="noticeTitle" id="noticeTitle"
                                                        autocomplete="off" required="required" maxlength="50">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="first">작성자</th>
                                                <td>관리자</td>
                                                <th class="first">작성일</th>
                                                <td>${today}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="padding: 8px 0px;">
                                                    <textarea id="popContent" name="notice_content"></textarea>
                                                </td>
                                            </tr>

                                        </tbody>

                                    </table>

                                    <!-- 글쓰기 btn -->
                                    <div class="write">
                                        <button class="write_btn" type="submit">작성완료</button>
                                        <button class="list_btn"
                                            onclick="location.href='${pageContext.request.contextPath}/board/noticeList.do'">목록으로</button>
                                    </div>

                                </form>

                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>
    
    <!-- footer -->
    <jsp:include page="../../layout/footer.jsp"></jsp:include>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
<script>
    $(function () {
    	CKEDITOR.replace('popContent', {
            filebrowserImageUploadUrl: "${pageContext.request.contextPath}/imageUpload.do?boardName=notice",
            height: 500
        });

        $(".sub1").addClass("active");

        $(".write_btn").on("click", function () {

            var noticeTitle = $("#noticeTitle").val();

            if (noticeTitle == "") {

                $("#noticeTitle").focus();

                return false;
            }

            if (confirm('등록하시겠습니까?')) {
                $("form").attr("onsubmit", "return true;");
                $("form").submit();
            }
        });

    })

</script>

</body>
</html>
