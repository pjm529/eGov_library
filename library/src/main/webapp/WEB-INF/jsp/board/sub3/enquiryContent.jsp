<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>라온도서관 > 열린공간 > 묻고답하기</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/sub3/enquiry_content_page.css">
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
                    <h3>묻고답하기</h3>
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
                            <a href="${pageContext.request.contextPath}/board/qnaBoardList.do">묻고답하기</a>
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
                            <input type="hidden" value="${enquiry.enquiryNo}" name="${enquiry.enquiryNo}">
                                <table class="bbs-edit">
                                    <tbody>
                                        <!-- 제목 -->
                                        <tr>
                                            <td class="bbs-title" colspan="6">
                                            	<div style="width: 970px; height:auto; white-space: normal;">
                                            		<b><c:out value="${enquiry.enquiryTitle}"/></b> 
                                            	</div> 
                                            </td>
                                        </tr>

                                        <!-- 작성자 | 작성일 | 조회수 -->
                                        <tr>
                                            <th class="first">작성자</th>
                                            <td style="width: 15%;">${enquiry.writerName}</td>
                                            <th class="first">작성일</th>
                                            <td>
                                            	${fn:substring(enquiry.enquiryRegDate, 2, 16)}
                                            	<c:if test="${not empty enquiry.enquiryModifyDate}">
	                                            	<span style="font-size:12px;">(${fn:substring(enquiry.enquiryModifyDate, 2, 16)} 수정)</span>
	                                            </c:if>
                                            </td>
                                            <th class="first" style="width: 100px;">조회수</th>
                                            <td>${enquiry.enquiryHits + 1}</td>
                                        </tr>

                                        <!-- 본문 내용 -->
                                        <tr>
                                            <td colspan="6">
                                                <div class="bbs-content" style="width:950px; overflow: auto;">
                                                    <p>${enquiry.enquiryContent}</p>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                                <!-- 글쓰기 btn -->
                                <div class="list_wrap">
                                	<form action="${pageContext.request.contextPath}/board/qnaBoardList.do" method="get">
                                		<input type="hidden" name="amount" value="${cri.amount}">
                                		<input type="hidden" name="page" value="${cri.page}">
                                		<input type="hidden" name="type" value="${cri.type}">
                                		<input type="hidden" name="keyword" value="${cri.keyword}">
                                		<button class="list_btn">목록으로</button>
                                	</form>
                                </div>
                                
                                   
                                <div class="delete_wrap">
	                               <form action="${pageContext.request.contextPath}/board/enquiryDelete.do" method="post" onsubmit="return false" class="delete_form">
	                               		<input type="hidden" name="enquiryNo" value="${enquiry.enquiryNo}">
	                               		<input type="hidden" name="amount" value="${cri.amount}">
	                               		<input type="hidden" name="page" value="${cri.page}">
                                		<input type="hidden" name="type" value="${cri.type}">
                                		<input type="hidden" name="keyword" value="${cri.keyword}">
	                               		<button class="delete_btn">삭제하기</button>
	                               	</form>
	                            </div>
                                
								<div class="update_wrap">
									<form action="${pageContext.request.contextPath}/board/enquiryModifyPage.do" method="post">
	                               		<input type="hidden" name="enquiryNo" value="${enquiry.enquiryNo}">
	                               		<input type="hidden" name="amount" value="${cri.amount}">
	                               		<input type="hidden" name="page" value="${cri.page}">
                                		<input type="hidden" name="type" value="${cri.type}">
                                		<input type="hidden" name="keyword" value="${cri.keyword}">
	                               		<button class="update_btn" style="margin-right: 20px;">수정하기</button>
	                               	</form>
								</div>  
								
								<sec:authorize access="hasRole('ROLE_ADMIN')">
							    <div class="answer_wrap">
									<form action="${pageContext.request.contextPath}/board/answerWritePage.do" method="get">
	                               		<input type="hidden" name="enquiryNo" value="${enquiry.enquiryNo}">
	                               		<input type="hidden" name="amount" value="${cri.amount}">
	                               		<input type="hidden" name="page" value="${cri.page}">
                                		<input type="hidden" name="type" value="${cri.type}">
                                		<input type="hidden" name="keyword" value="${cri.keyword}">
	                               		<button class="update_btn" style="margin-right: 20px;">답변하기</button>
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

    <!-- footer -->
    <jsp:include page="../../layout/footer.jsp"></jsp:include>

<script>
	$(function() {
		
		$(".sub3").addClass("active");
		
		
		var moveForm = $(".moveForm");
		
		$(".delete_btn").on("click", function(e) {
			e.preventDefault();
			if(confirm("삭제하시겠습니까?")){
				alert("게시물이 삭제되었습니다.");
				$(".delete_form").attr("onsubmit", "result true");
				$(".delete_form").submit();
			}else{
			}
		});
				
	});
	
	
	function noEvent() { // 새로고침 조회 수 + 방지
		if (event.keyCode == 116) {
			event.keyCode= 2;
			return false;
		}else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82)){
			return false;
		}
	}
	
	document.onkeydown = noEvent;
</script>  

</body>
</html>