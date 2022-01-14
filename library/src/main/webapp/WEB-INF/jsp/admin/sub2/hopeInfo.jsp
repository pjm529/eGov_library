<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 관리자 > 도서관련 > 희망도서신청내역</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/sub2/hopeInfo.css">
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
                    <h3>희망도서신청내역</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="" style="background-image: none;">
                            <a href="${pageContext.request.contextPath}">
                                <img src="${pageContext.request.contextPath}/images/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admim/memberList.do">관리자</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/loanHistory.do">도서관련</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/hopeHistory.do">희망도서신청내역</a>
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
                <div class="content" style="/* border: 1px solid brown; */">

                    <table>
                    	<!-- 신청자 -->
                        <tr>
                            <th class="first">
                              	  신청자 ID
                            </th>
                            <td class="last">
                                <input class="id_input" autocomplete="off"
                                 value="${hope.userId }" readonly="readonly"> <br>
                            </td>
                        </tr>
                        
                        <!-- 제목 -->
                        <tr>
                            <th class="first">
                             	   제목
                            </th>
                            <td class="last">
                                <input class="title_input" autocomplete="off"
                                 value="${hope.bookTitle }" readonly="readonly"> <br>
                            </td>
                        </tr>
                        
                        <!-- 저자 -->
                        <tr>
                            <th class="first">
                          	      저자
                            </th>
                            <td class="last">
                                <input class="author_input" autocomplete="off"
                                 value="${hope.bookAuthor }" readonly="readonly"> <br>
                            </td>
                        </tr>
                        
                        <!-- 출판사 -->
                        <tr>
                            <th class="first">
                            	    출판사
                            </th>
                            <td class="last">
                                <input class="publisher_input" autocomplete="off"
                                 value="${hope.bookPublisher }" readonly="readonly"> <br>
                            </td>
                        </tr>
                        
                        <!-- 연도 -->
                        <tr>
                            <th class="first">
                          	      연도
                            </th>
                            <td class="last">
                                <input class="pubDate_input" autocomplete="off"
                                 value="${hope.bookPubDate }" readonly="readonly"> <br>
                            </td>
                        </tr>
                        
                        <!-- ISBN -->
                        <tr>
                            <th class="first">
                                ISBN
                            </th>
                            <td class="last">
                                <input class="isbn_input" autocomplete="off"
                                 value="${hope.bookIsbn }" readonly="readonly"> <br>
                            </td>
                        </tr>
                        
                        <!-- 비고 -->
                        <tr>
                            <th class="first">
                      	          비고
                            </th>
                            <td class="last">
                                <input class="note_input" autocomplete="off"
                                 value="${hope.note }" readonly="readonly"> <br>
                            </td>
                        </tr>
                        
                        <!-- 가격 -->
                        <tr>
                            <th class="first">
                      	          가격
                            </th>
                            <td class="last">
                                <input class="price_input" autocomplete="off"
                                 value="${hope.bookPrice }" readonly="readonly"> <br>
                            </td>
                        </tr>
                        
                        <c:if test="${not empty hope.cancelReason }">
                        <tr>
                            <th class="first">
                            	   취소사유
                            </th>
                            <td class="last">
                                <input class="cancel_input" autocomplete="off"
                                 value="${hope.cancelReason }" readonly="readonly"> <br>
                            </td>
                        </tr>
                        </c:if>
                        
                        <!-- 상태 -->
                        <tr>
                            <th class="first">
                             	   상태
                            </th>
                            
							<td class="last">
							<c:if test="${hope.hopeStatus == 0 }">
                                <input class="status_input" autocomplete="off"
                                 value="처리중" readonly="readonly"> <br>
                            </c:if>
                            
                            <c:if test="${hope.hopeStatus == -1 }">
                            <input class="status_input" autocomplete="off"
                                 value="취소" readonly="readonly"> <br>
                            </c:if>
                            
                            <c:if test="${hope.hopeStatus == 1 }">
                            <input class="status_input" autocomplete="off"
                                 value="소장중" readonly="readonly"> <br>
                            </c:if>
                            </td>
                        </tr>
                        
                        <!-- 신청일 -->
                        <tr>
                            <th class="first">
                         	       신청일
                            </th>
                            <td class="last">
                                <input class="reg_date_input" autocomplete="off"
                                 value="${hope.hopeRegDate }" readonly="readonly"> <br>
                            </td>
                        </tr>

                    </table>
					<br>
					<div class="hope_cancel_wrap">
                    	<form action="${pageContext.request.contextPath}/admin/hopeCancel.do" method="post" onsubmit="return false;">
                    		<input type="hidden" name="amount" value="${cri.amount }">
							<input type="hidden" name="page" value="${cri.page }">
							<input type="hidden" name="type" value="${cri.type }">
							<input type="hidden" name="hopeNo" value="${hope.hopeNo }">
							<input type="hidden" class="reason" name="cancelReason">
							<button id="cancel_btn" class="btn">취소</button>
                    	</form>
                    </div>
                    
                    <div class="hope_own_wrap">
                    	<form action="${pageContext.request.contextPath}/admin/hopeOwn.do" method="post" onsubmit="return false;">
                    		<input type="hidden" name="amount" value="${cri.amount }">
							<input type="hidden" name="page" value="${cri.page }">
							<input type="hidden" name="type" value="${cri.type }">
							<input type="hidden" name="hopeNo" value="${hope.hopeNo }">
							<button id="own_btn" class="btn">소장</button>
                    	</form>
                    </div>
                    
                    
                    
                    <div class="hope_history_wrap">
                    	<form action="${pageContext.request.contextPath}/admin/hopeHistory.do" method="get">
                    		<input type="hidden" name="amount" value="${cri.amount }">
							<input type="hidden" name="page" value="${cri.page }">
							<input type="hidden" name="type" value="${cri.type }">
							<button class="btn">목록</button>
                    	</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- footer -->
	<jsp:include page="../../layout/footer.jsp"></jsp:include>

    <script>
    
	    $(function(){
			$(".sub2").addClass("active");
			$(".submenu4").addClass("active");
			$("#cancel_btn").on("click", function(){
				if(confirm("해당 도서를 취소처리 하시겠습니까?")) {
					$(".reason").val(prompt("취소사유를 입력하세요"));
					
					if($(".reaseon").val() == null || $(".reaseon").val() == "" || $(".reaseon").val().length < 2){
						alert("취소 사유를 입력해주세요.");
						return false;
					}
					
					alert("취소처리 되었습니다.");
					$("form").attr("onsubmit", "return true;");
					$("form").submit();
				}
	   		});
			
			$("#own_btn").on("click", function(){
				if(confirm("해당 도서를 소장처리 하시겠습니까?")) {
					alert("소장처리 되었습니다.");
					$("form").attr("onsubmit", "return true;");
					$("form").submit();
				}
	   		});
		});
		
    </script>

</body>

</html>