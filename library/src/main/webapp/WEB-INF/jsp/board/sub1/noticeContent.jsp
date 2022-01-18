<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<html>
<head>
	<title>라온도서관 > 열린공간 > 공지사항</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/sub1/notice_content_page.css">
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
                            <div class="table-wrap">
                                <table class="bbs-edit">
                                    <tbody>
                                        <!-- 제목 -->
                                        <tr>
                                            <td class="bbs-title" colspan="6">
                                                <b>${noticeContent.noticeTitle}</b>
                                            </td>
                                        </tr>

                                        <!-- 작성자 | 작성일 | 조회수 -->
                                        <tr>
                                            <th class="first">작성자</th>
                                            <td style="width: 15%;">관리자</td>
                                            <th class="first">작성일</th>
                                            <td>
                                                <fmt:formatDate var="noticeRegDate"
                                                    value="${noticeContent.noticeRegDate}" pattern="yyyy-MM-dd" />
                                                ${noticeRegDate}
                                            </td>
                                            <th class="first">조회수</th>
                                            <td>${noticeContent.noticeViews}</td>
                                        </tr>

                                        <!-- 본문 내용 -->
                                        <tr>
                                            <td colspan="6">
                                                <div class="bbs-content" style="width:950px; overflow: auto;">
                                                    <p>${noticeContent.noticeContent}</p>

                                                    <!-- 첨부 파일 -->
                                                    <div class="panel-body">
                                                        <div class='uploadResult'>
                                                            <ul>

                                                            </ul>
                                                        </div>

                                                        <div class="downloadAreaWrap">
                                                            <div class="downloadAreaTitle">첨부파일</div>
                                                            <div class="downloadArea">
                                                                <ul>

                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                                <table class="bbs-posts">
                                    <tr class="board-prev">
                                        <td class="prev" style="border-right: 1px solid #dee1e7"><img
                                                src="${pageContext.request.contextPath}/images/board/sub1/angle_up.png" class="angle"> 이전글</td>

                                        <c:choose>

                                            <c:when test="${posts[0].noticeNo == null}">
                                                <td class="posts_title">이전글이 없습니다.</td>
                                                <td class="posts_writer"></td>
                                            </c:when>


                                            <c:when test="${posts[0].noticeNo > noticeContent.noticeNo}">
                                                <td class="posts_title">이전글이 없습니다.</td>
                                                <td class="posts_writer"></td>
                                            </c:when>

                                            <c:otherwise>
                                                <td class="posts_title">
                                                	<a href="${posts[0].noticeNo}"><c:out value="${posts[0].noticeTitle}"/></a>
                                                </td>
                                                <td class="posts_writer"></td>
                                            </c:otherwise>
                                        </c:choose>

                                    </tr>

                                    <tr class="board-next">
                                        <td class="next" style="border-right: 1px solid #dee1e7;"><img
                                                src="${pageContext.request.contextPath}/images/board/sub1/angle_down.png" class="angle"> 다음글</td>

                                        <c:choose>
                                            <c:when test="${posts[0].noticeNo > noticeContent.noticeNo}">
                                                <td class="posts_title">
                                                	<a href="${posts[0].noticeNo}"><c:out value="${posts[0].noticeTitle}"/></a>
                                                </td>
                                                <td class="posts_writer"></td>
                                            </c:when>

                                            <c:otherwise>
                                                <c:if test="${posts[1] == null}">
                                                    <%-- <c:if test="${fn:length(posts) == 1}"> --%>
                                                        <td class="posts_title">다음글이 없습니다.</td>
                                                        <td class="posts_writer"></td>
                                                </c:if>
                                                <c:if test="${posts[1] != null}">
                                                    <td class="posts_title">
                                                  		<a href="${posts[1].noticeNo}"><c:out value="${posts[1].noticeTitle}"/></a>
                                                    </td>
                                                    <td class="posts_writer"></td>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose>

                                    </tr>
                                </table>


                                <!-- 글쓰기 btn -->
                                <div class="list_wrap">
                                    <form action="${pageContext.request.contextPath}/board/noticeList.do" method="get">
                                        <input type="hidden" name="amount" value="${cri.amount}">
                                        <input type="hidden" name="page" value="${cri.page}">
                                        <input type="hidden" name="type" value="${cri.type}">
                                        <input type="hidden" name="keyword" value="${cri.keyword}">
                                        <button class="list_btn">목록으로</button>
                                    </form>
                                </div>
                                <sec:authorize access="hasRole('ROLE_ADMIN')">
                                    <div class="delete_wrap">
                                        <form action="${pageContext.request.contextPath}/board/noticeDelete.do" method="get" onsubmit="return false"
                                            class="delete_form">
                                            <input type="hidden" name="noticeNo" id="noticeNo"
                                                value="${noticeContent.noticeNo}">
                                            <input type="hidden" name="amount" value="${cri.amount}">
                                            <input type="hidden" name="page" value="${cri.page}">
                                            <input type="hidden" name="type" value="${cri.type}">
                                            <input type="hidden" name="keyword" value="${cri.keyword}">

                                            <input type="hidden" name="uuid" id="uuid">
                                            <input type="hidden" name="fileType" id="fileType">
                                            <button class="delete_btn"
                                                style="background-color: #518d7d; border: 1px solid #3e6b5f;">삭제하기</button>
                                        </form>
                                    </div>

                                    <div class="update_wrap">
                                        <form action="${pageContext.request.contextPath}/board/noticeModifyPage.do" method="get">
                                            <input type="hidden" name="noticeNo" value="${noticeContent.noticeNo}">
                                            <input type="hidden" name="amount" value="${cri.amount}">
                                            <input type="hidden" name="page" value="${cri.page}">
                                            <input type="hidden" name="type" value="${cri.type}">
                                            <input type="hidden" name="keyword" value="${cri.keyword}">
                                            <button class="update_btn" style="margin-right: 20px;">수정하기</button>
                                        </form>
                                    </div>
                                </sec:authorize>

                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>
    
    <form action="" method="get" class="moveForm">
      <input type="hidden" name="page" value="${cri.page}">
      <input type="hidden" name="amount" value="${cri.amount}">
      <input type="hidden" name="type" value="${cri.type}">
      <input type="hidden" name="keyword" value="${cri.keyword}">
      <input type="hidden" name="noticeNo" value="">
   </form>
    
    <!-- footer -->
    <jsp:include page="../../layout/footer.jsp"></jsp:include>

<script>
    $(function () {

        $(".sub1").addClass("active");

 		var moveForm = $(".moveForm");
        
        $(".posts_title a").on("click", function(e) {
	         e.preventDefault();
	         moveForm.find("input[name = 'noticeNo']").val($(this).attr("href"));
	         moveForm.attr("action", "${pageContext.request.contextPath}/board/noticeContent.do");
	         moveForm.submit();
	         
	    }) 

        $(".delete_btn").on("click", function (e) {
            e.preventDefault();
            if (confirm("삭제하시겠습니까?")) {
                alert("게시물이 삭제되었습니다.");
                $(".delete_form").attr("onsubmit", "result true");
                $(".delete_form").submit();
            } else {
            	alert("취소 되었습니다.");
            }
        })

    });

    /* 첨부 파일 다운로드 */
    (function () {

        $(".downloadAreaWrap").hide();

        var noticeNo = $("#noticeNo").val();

        $.getJSON("${pageContext.request.contextPath}/board/getNoticeAttachList.do", { noticeNo: noticeNo }, function (arr) {

            var str = "";
            var str2 = "";

            $(arr).each(function (i, attach) {
                str2 += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";

                //image type
                if (attach.file_type) {
                    str2 += "<span><a href='#' class='attached_file_name'><img src='${pageContext.request.contextPath}/images/board/sub1/image_icon.png' class='attached_image_icon'> " + attach.fileName + "</a></span><br/>";

                } else {
                    str2 += "<span><a href='#' class='attached_file_name'><img src='${pageContext.request.contextPath}/images/board/sub1/file_icon.png' class='attached_file_icon'> " + attach.fileName + "</a></span><br/>";
                }

                str2 += "</div>";
                str2 + "</li>";

            });
            $(".downloadArea ul").html(str2);

            if ($(".downloadArea li").length) {
                $(".downloadAreaWrap").show();
            }

        });//end getjson

    })();//end function

    $(".downloadArea").on("click", "li a", function (e) {
        e.preventDefault();

        var liObj = $(this).closest("li");

        var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));

        self.location = "${pageContext.request.contextPath}/downloadNoticeFile.do?fileName=" + path;

    });

</script>


</body>
</html>