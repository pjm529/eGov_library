<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>라온도서관 > 열린공간 > 묻고답하기</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/sub3/enquiry_modify_page.css">
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
                                <form action="${pageContext.request.contextPath}/board/enquiryModify.do" method="post" onsubmit="return false;">
                                	<input type="hidden" name="enquiryNo" value="${enquiry.enquiryNo}" >
                                	<input type="hidden" name="writerId" value="writerId">
                                    <input type="hidden" name="writerName" value="writerName">
                                    <input type="hidden" name="amount" value="${cri.amount}">
                                	<input type="hidden" name="page" value="${cri.page}">
                                	<input type="hidden" name="type" value="${cri.type}">
                                	<input type="hidden" name="keyword" value="${cri.keyword}">
                                    
                                    <table class="bbs-edit">
                                        <tbody>
                                            <tr>
                                                <th class="first">제목</th>
                                                <td colspan="3">
                                                    <input type="text" style="width: 80%; height: 27px;"
                                                        placeholder="제목을 작성해 주세요"
                                                        name="enquiryTitle" id="title" maxlength="50" autocomplete="off"
                                                        value="<c:out value='${enquiry.enquiryTitle}'/>">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="first">작성자</th>
                                                <td>${enquiry.writerName}</td>
                                                <th class="first">작성일</th>
                                                <td>
                                                ${fn:substring(enquiry.enquiryRegDate, 0, 11)}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="padding: 8px 0px;">
                                                    <textarea id="popContent" name="enquiryContent">
                                                    	<c:out value='${enquiry.enquiryContent}'/></textarea>
                                                </td>
                                            </tr>
                                        </tbody>

                                    </table>

                                    <!-- 글쓰기 btn -->
                                    <div class="write">
                                        <input type="submit" class="write_btn" value="수정하기" style="margin-top: 40px;">
                                    </div>

                                </form>
                                
                                <div class="list_wrap">
                                	<form action="${pageContext.request.contextPath}/board/qnaBoardList.do" method="get">
                                		<input type="hidden" name="amount" value="${cri.amount}">
                                		<input type="hidden" name="page" value="${cri.page}">
                                		<input type="hidden" name="type" value="${cri.type}">
                                		<input type="hidden" name="keyword" value="${cri.keyword}">
                                		<button class="list_btn">목록으로</button>
                                	</form>
                                </div>
                                
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
	$(function() {
		
		CKEDITOR.replace('popContent' , {
			 filebrowserImageUploadUrl: "/upload?boardName=qna",
			 height: 500                                                  
	     });

		
		$(".sub3").addClass("active");
		
		$(".write_btn").on("click", function() {
			
			var title = $("#title").val();

	        if (title == "") {

	            $("#title").focus();
	             
	            return false;
	        }
	         
			if(confirm('수정하시겠습니까?')) {
				$("form").attr("onsubmit", "result true");
				$("form").submit();
			}
		});
		
		
	});

</script>

</body>
</html>