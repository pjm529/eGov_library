<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
	<title>라온도서관 > 자료검색 > 추천도서</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/search/bookDetail.css">
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
                    <h3>추천도서</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="${pageContext.request.contextPath}">
                                <img src="${pageContext.request.contextPath}/images/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/search/book.do">자료검색</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/search/recommendBook.do">추천도서</a>
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

                            <!-- 테이블 -->
                            <div class="table-wrap">
                                <h2>도서의 상세 내용을 확인하세요</h2>
                                <table>
                                    <thead>
                                        <tr>
                                            <th style="width: 200px;">이미지</th>
                                            <th style="">도서 정보</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="">
                                                <img src="${book.bookCover }" style="width: 200px;">
                                            </td>
                                            <td class="" style="text-align: left;">
                                                <h2>${book.bookTitle }</h2>
                                                <p><b>저자명</b> : ${book.bookAuthor }</p>
                                                <p><b>출판사</b>: ${book.bookPublisher }</p>
                                                <p><b>출간일</b> : ${book.bookPubDate }</p>
                                                <p>
                                                <b>가격</b>: 
                                                <fmt:formatNumber value="${book.priceStandard }" type="currency"/>
                                                </p>
                                                <sec:authorize access="hasRole('ROLE_ADMIN')">
                                                <form action="${pageContext.request.contextPath}/search/deleteBook.do" method="post" onsubmit="return false;">
                                                	<input type="hidden" name="recNo" value="${recNo}">
	                                                <input type="hidden" name="page" value="${cri.page}">
	                                                <input type="hidden" name="year" value="${date.year}">
	                        						<input type="hidden" name="month" value="${date.month}">
						                        	<input type="submit" class="btn" value="삭제" style="float: right;">
						                        </form>
						                        </sec:authorize>
                                            </td>
	
                                        </tr>
                                    
                                    </tbody>
                               
                                </table>

                            </div>

                        </div>

                    </div>
                    <div style="display: flex; justify-content: center; align-items: center;">
                    
                        <form id="loan" onsubmit="return false;" method="post">
                        	<sec:authorize access="isAuthenticated()">
							<input type="hidden" class="userEmail" name="userEmail" 
								value=<sec:authentication property="principal.member.userEmail"/>>
							</sec:authorize>
							
							<sec:authorize access="isAnonymous()">
							<input type="hidden" class="userEmail" name="userEmail">
							</sec:authorize>
							
							<input type="hidden" name="bookTitle" value="${book.bookTitle }">
							<input type="hidden" name="bookAuthor" value="${book.bookAuthor }">
							<input type="hidden" class="bookIsbn" name="bookIsbn" value="${book.bookIsbn }">
							<input type="hidden" name="bookCover" value="${book.bookCover }">
							<input type="hidden" name="bookPubDate" value="${book.bookPubDate }">
							<input type="hidden" name="bookPublisher" value="${book.bookPublisher }">
							<input type="hidden" name="year" value="${date.year}">
                        	<input type="hidden" name="month" value="${date.month}">
							<input type="hidden" name="page" value="${cri.page }">
                            <button id="loan_btn" class=" btn2">대출 (<c:out value="${2 - book.count}" /> / 2)</button>
                        </form>

                        <span>　</span>

                        <form action="${pageContext.request.contextPath}/search/recommendBook.do">
                        	<input type="hidden" name="year" value="${date.year}">
                        	<input type="hidden" name="month" value="${date.month}">
							<input type="hidden" name="page" value="${cri.page }">
                            <button class="btn3" style="display: flex; justify-content: center; align-items: center;">
                                <img src="${pageContext.request.contextPath}/images/search/book_icon.png" style="width: 30px;">　목록
                            </button>
                        </form>

                    </div>

                    <h3>책 소개</h3>
                    <div style="border: 1px solid #ccc; height: 500px;">
                       	 상품 설명
                        ${book.description}

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
			
			$(".btn").click(function(){
				if (confirm("해당 추천도서를 삭제하시겠습니까?")){
					alert("삭제되었습니다.");
					$("form").attr("onsubmit", "return true;");
					$("form").submit();
				} else {
					alert("삭제가 취소되었습니다.");
				}
			})
			 
			$("#loan_btn").click(function() {
				
				let email = $('.userEmail').val(); 
				let bookIsbn = $('.bookIsbn').val(); 
				
				if(email == "") {
					alert("로그인 후 이용해주세요");
					location.href="${pageContext.request.contextPath}/member/login.do";
				} else {
					
					if (confirm("도서를 대출하시겠습니까?")) {
						let data = {
		           				bookIsbn: bookIsbn
		           		};
						
						$.ajax({
		           			type: "post",
		           			url: "${pageContext.request.contextPath}/search/statusChk.do",
		           			data: data,
		           			success: function(result) {
		           				
		           				if (result == "success") {
		           					alert("대출이 완료되었습니다.");
		           					$("#loan").attr("action", "${pageContext.request.contextPath}/search/loan.do?detail=rec");
		           					$("#loan").attr("onsubmit", "return true;");
		           					$("#loan").submit();
		       						
		           				} else if (result == "loan"){
		           					alert("이미 대출 중인 도서입니다.");
		           				} else {
		           					alert("대출이 불가능한 상태입니다.");
		           					location.reload();
		           				}
		           			}
		           		});
					}
				} 
					
			});
		});
	</script>
			

</body>
</html>
