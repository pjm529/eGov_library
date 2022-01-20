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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/sub1/reply.css">
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
                                                <b><c:out value="${noticeContent.noticeTitle}"/></b>
                                            </td>
                                        </tr>

                                        <!-- 작성자 | 작성일 | 조회수 -->
                                        <tr>
                                            <th class="first">작성자</th>
                                            <td style="width: 15%;">관리자</td>
                                            <th class="first">작성일</th>
                                            <td>
                                                <fmt:formatDate var="noticeRegDate"
                                                    value="${noticeContent.noticeRegDate}" pattern="yy-MM-dd HH:ss" />
                                                ${noticeRegDate} 
                                                <c:if test="${not empty noticeContent.noticeModifyDate}">
                                                	 <fmt:formatDate var="noticeModifyDate"
                                                    value="${noticeContent.noticeModifyDate}" pattern="yy-MM-dd HH:ss" />
                                                	<span style="font-size:12px;">(${noticeModifyDate} 수정)</span>
                                                </c:if>
                                            </td>
                                            <th class="first" style="width: 100px;">조회수</th>
                                            <td>${noticeContent.noticeViews}</td>
                                        </tr>
                                        
                                        <!-- 본문 내용 -->
                                        <tr>
                                            <td colspan="6">
                                                <div class="bbs-content" style="width:950px; overflow: auto;">
                                                    <p>${noticeContent.noticeContent}</p>
                                                    
                                                    <c:if test="${not empty attachList}">
                                                    <!-- 첨부 파일 -->
                                                    <div class="panel-body">
                                                        <div class="downloadAreaWrap">
                                                            <div class="downloadAreaTitle">첨부파일</div>
                                                            <div class="downloadArea" style="margin-bottom: 0px;">
                                                                <ul>
																	<c:forEach var="attach" items="${attachList}">
																	<li data-path="${attach.uploadPath}" 
																		data-uuid="${attach.uuid}" data-filename="${attach.fileName}" 
																		data-type="${attach.fileType}" >
																		<div>
                    														<span>
                    															<a href='#' class='attached_file_name'>
                    															<img src='${pageContext.request.contextPath}/images/board/sub1/file_icon.png'
                    																class='attached_file_icon'><c:out value="${attach.fileName}"/>
                    															</a>
                    														</span>
                    														<br>
													                    </div>
												                    </li>
												                    </c:forEach>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>
                                
                                <!-- ============================================= 댓글 div============================================= -->
                                <div class="reply">
                                	<div class="reply_input">
                                		<b>댓글</b>
                                		<form id="reply_form" method="POST" onsubmit="return false">
                                			<input type="hidden" name="amount" value="${cri.amount}"> 
	                                        <input type="hidden" name="page" value="${cri.page}">
	                                        <input type="hidden" name="type" value="${cri.type}">
	                                        <input type="hidden" name="keyword" value="${cri.keyword}">
                                			<input type="hidden" name="noticeNo" value="${noticeContent.noticeNo}"> 
                                			<input type="hidden" name="writerName" value="<sec:authentication property="principal.member.userName"/>"> 
                                			<!-- 미 로그인 시 -->
											<sec:authorize access="isAnonymous()">
											<textarea placeholder="로그인 후 사용가능합니다." disabled="disabled"></textarea>
											</sec:authorize>
											
											<!-- 로그인 시 -->
											<sec:authorize access="isAuthenticated()">
											<textarea placeholder="내용을 입력해주세요." name="replyContent" class="reply_textarea"></textarea>
											</sec:authorize>
                                			
                                		 	<button type="submit">댓글 작성</button>
                                		</form>
                                	</div>
                                	
                                	<div class="reply_list"> 
                                		<div>
                                			<b>관리자</b> <span class="reply_date">2022.01.20 10:00</span>
                                			<div class="reply_content">
                                				<span>댓글 내용입니다.</span> 
                                			</div>
                                		</div>
                                		
                                		<div>
                                			<b>관리자</b> <span class="reply_date">2022.01.20 10:00</span>
                                			<div class="reply_content">
                                				<span>댓글 내용입니다.</span> 
                                			</div>
                                		</div>
                                	</div>
                                </div>
                                <!-- ============================================= 댓글 div============================================= -->

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
                                        <form action="${pageContext.request.contextPath}/board/noticeDelete.do" method="post" onsubmit="return false"
                                            class="delete_form">
                                            <input type="hidden" name="noticeNo" id="noticeNo"
                                                value="${noticeContent.noticeNo}">
                                            <input type="hidden" name="amount" value="${cri.amount}">
                                            <input type="hidden" name="page" value="${cri.page}">
                                            <input type="hidden" name="type" value="${cri.type}">
                                            <input type="hidden" name="keyword" value="${cri.keyword}">
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


<sec:authorize access="isAnonymous()">
<!-- 미 로그인 시  -->
<script>
	$(function(){
        $("#reply_form button").on("click", function(){
        	alert("로그인 후 이용해주세요"); 
        	location.href="${pageContext.request.contextPath}/member/login.do";
        });
	});
</script>
</sec:authorize>


<sec:authorize access="isAuthenticated()">
<!-- 로그인 시 -->
<script>
	$(function(){
		
		
        $("#reply_form button").on("click", function(){
        	let reply = $(".reply_textarea").val();
        	
        	if (reply == "") {
        		
        		alert(" 댓글을 입력해주세요");
        		return;
        	}
        	
        	$("form").attr("action", "${pageContext.request.contextPath}/board/replyInsert.do");
        	$("form").attr("onsubmit", "return true;");
        	$("form").submit();
        });
	});
</script>
</sec:authorize>

<!-- 공용 -->
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
        });
        
        $(".downloadArea").on("click", "li a", function (e) {
            e.preventDefault();

            var liObj = $(this).closest("li");

            var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));

            self.location = "${pageContext.request.contextPath}/board/downloadNoticeFile.do?path=" + path + "&fileName=" + liObj.data("filename");
        });
        
    });

</script>


</body>
</html>