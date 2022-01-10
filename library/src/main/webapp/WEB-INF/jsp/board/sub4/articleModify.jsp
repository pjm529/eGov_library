<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
   <title>라온도서관 > 열린공간 > 분실물찾기</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/sub4/write_page.css">
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
                            <a href="${pageContext.request.contextPath}/board/articleList.do">
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
                                <form action="/board/articleModify" method="post" role="form" onsubmit="return false;">
                                    <input id="article_no" type="hidden" name="articleNo" value="${article.articleNo}">
                                    <input type="hidden" name="amount" value="${cri.amount}">
                                    <input type="hidden" name="page" value="${cri.page}">
                                    <input type="hidden" name="type" value="${cri.type}">
                                    <input type="hidden" name="keyword" value="${cri.keyword}">

                                    <table class="bbs-edit">
                                        <tbody>
                                            <tr>
                                                <th class="first">제목</th>
                                                <td colspan="3">
                                                    <input type="text" style="width: 80%; height: 27px;" id="article_title"
                                                        name="article_title" value="${article.articleTitle}" autocomplete="off"
                                                         maxlength="50">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="first">작성자</th>
                                                <td>
                                                    <input type="hidden" name="writerName" value="${article.writerName}"
                                                        readonly="readonly">
                                                    <span>관리자</span>
                                                </td>
                                                <th class="first">작성일</th>
                                                <td>
                                                    <fmt:formatDate var="articleRegDate"
                                                        value="${article.articleRegDate}" pattern="yyyy-MM-dd" />
                                                    ${articleRegDate}
                                            </tr>

                                            <tr>
                                                <td colspan="4" style="padding: 8px 0px;">
                                                    <textarea id="popContent" name="articleContent">
                                                    ${article.articleContent}</textarea>
                                                </td>
                                            </tr>

                                        </tbody>

                                    </table>

                                    <!-- 글쓰기 btn -->
                                    <div class="write">
                                        <button class="write_btn" type="submit">수정하기</button>
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
	        filebrowserImageUploadUrl: "/upload?boardName=article",
	        height: 500
	    });
		
		 $(".sub4").addClass("active");
		 
		$(".write_btn").on("click", function () {
	
	        var article_title = $("#article_title").val();
	
	        if (article_title == "") {
	
	            $("#article_title").focus();
	
	            return false;
	        }
	
	        if (confirm('수정하시겠습니까?')) {
	            $("form").attr("onsubmit", "return true;");
	            $("form").submit();
	        }
	    });
	});


</script>
</body>
</html>