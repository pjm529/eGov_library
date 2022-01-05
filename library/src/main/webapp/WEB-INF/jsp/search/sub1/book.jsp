<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>라온도서관 > 자료검색 > 도서검색</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/search/book.css">
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
                    <h3>도서검색</h3>
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
                            <a href="${pageContext.request.contextPath}/search/book.do">도서검색</a>
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

                            <!-- 검색 -->
                            <div class="search">
                                <form action="" method="get" onsubmit="return false;">
                                	<input type="hidden" name="amount" value="${cri.amount }">
                                	<input type="hidden" name="page" value="1">
                                    <select name="type">
                                    
                                    	<c:if test="${empty page.cri.type}">
                                    	<option value="Title" selected="selected">도서명</option>
                                        <option value="Author">저자명</option>
                                    	</c:if>
                                    
                                    	<c:if test="${page.cri.type == 'Title' }">
                                    	<option value="Title" selected="selected">도서명</option>
                                        <option value="Author">저자명</option>
                                    	</c:if>
                                    	
                                    	<c:if test="${page.cri.type == 'Author' }">
                                    	<option value="Title">도서명</option>
                                        <option value="Author" selected="selected">저자명</option>
                                    	</c:if>
                                        
                                    </select>
                                    <input type="text" style="height: 34px;"name="keyword" 
                                    	value="${cri.keyword }" autocomplete="off">
									
                                    <button id="search_btn" class="btn">검색</button>
                                </form>

                            </div>
                            <!-- 도서 수 -->
                            <div class="inline">
                                <form action="">
                                	<c:if test="${not empty total }">
                                	<span style="margin-right: 10px;"> 검색된 도서 수 : <b>${total }</b> 권</span>
                                	</c:if>
                                	
                                	<c:if test="${empty total }"> 
                                	<span style="margin-right: 10px;"> 검색된 도서 수 : <b>0</b> 권</span>
                                	</c:if>
                                	
                                    
                                    <select name="amount">
                                        <c:if test="${cri.amount == 10 }">
	                                    <option value="10" selected="selected">10건씩 보기</option>
	                                    <option value="20">20건씩 보기</option>
	                                    <option value="30">30건씩 보기</option>
	                                    <option value="40">40건씩 보기</option>
	                                    </c:if>
	                                    
	                                    <c:if test="${cri.amount == 20 }">
	                                    <option value="10">10건씩 보기</option>
	                                    <option value="20" selected="selected">20건씩 보기</option>
	                                    <option value="30">30건씩 보기</option>
	                                    <option value="40">40건씩 보기</option>
	                                    </c:if>
	                                    
	                                    <c:if test="${cri.amount == 30 }">
	                                    <option value="10">10건씩 보기</option>
	                                    <option value="20">20건씩 보기</option>
	                                    <option value="30" selected="selected">30건씩 보기</option>
	                                    <option value="40">40건씩 보기</option>
	                                    </c:if>
	                                    
	                                    <c:if test="${page.cri.amount == 40 }">
	                                    <option value="10">10건씩 보기</option>
	                                    <option value="20">20건씩 보기</option>
	                                    <option value="30">30건씩 보기</option>
	                                    <option value="40" selected="selected">40건씩 보기</option>
	                                    </c:if>
                                    </select>
                                    <input type="hidden" name="page" value="1">
                                	<input type="hidden" name="type" value="${cri.type }">
                                	<input type="hidden" name="keyword" value="${cri.keyword }">
                                    <button class="btn">이동</button>
                                </form>

                            </div>

                            <!-- 테이블 -->
                            <div class="table-wrap">
                            	<c:if test="${not empty list}">
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
                                            <img src="${list.bookCover }" style="width: 135px;">
                                            </td>
                                            <td style="text-align: left">
                                            	<p><b>도서명</b> : ${list.bookTitle}</p>
                                            	<p><b>저자명</b> : ${list.bookAuthor }</p>
                                            	<p><b>출판사</b> : ${list.bookPublisher }</p>
                                            	<p><b>출간일</b> : ${list.bookPubDate }</p>
                                            	
                                            	<c:if test="${list.count == 2}">
                                            	<p><b>상태</b> : <span style="color: red;">대출불가</span></p>
                                            	</c:if>
                                            	
                                            	<c:if test="${list.count != 2}">
                                            	<p><b>상태</b> : 대출가능</p>
                                            	</c:if>
                                            	
                                            </td>
                                            <td>
                                            	<form action="${pageContext.request.contextPath}/search/bookDetail.do" method="get">
													<input type="hidden" name="amount" value="${page.cri.amount }">
													<input type="hidden" name="page" value="${page.cri.page }">
													<input type="hidden" name="type" value="${page.cri.type }">
													<input type="hidden" name="keyword" value="${page.cri.keyword }">
													<input type="hidden" name="bookIsbn" value="${list.bookIsbn }">
													<button class="btn2">도서 정보</button>
												</form>
                                            </td>
                                        </tr>
										</c:forEach>

                                    </tbody>
                                </table>
                                </c:if>
                            </div>
                        </div>
                        
                         <div class="pageInfo" style="text-align: center">
		
							<c:if test="${page.prev }">
								<a class="not" href="${page.startPage - 1}">이전</a>
							</c:if>
							
							<c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
							
								<c:if test="${num != 0}">
									<a class="${page.cri.page == num ? "current":"not" }"  href="${num }">${num }</a>
								</c:if>
								
							</c:forEach>
							
							<c:if test="${page.next }">
								<a class="not" href="${page.endPage + 1}">다음</a>
							</c:if>
						</div>
                        
                        <c:if test="${empty list}">
                        
                        	<c:if test="${empty cri.keyword}">
							<div style="margin-top: 50px; text-align: center;">
								<h3>자료를 검색해주세요.</h3>
							</div>
                        	</c:if>
                        	
                        	<c:if test="${not empty cri.keyword}">
							<div style="margin-top: 50px; text-align: center;">
								<h3>찾으시는 자료가 없습니다.</h3>
							</div>
							</c:if>
                        </c:if>
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
	
	<!-- footer -->
	<jsp:include page="../../layout/footer.jsp"></jsp:include>
	<script>
		$(function() {
			$(".sub1").addClass("active");
			
			let moveForm = $(".moveForm");
			
			$(".pageInfo a").on("click", function(e) {
				e.preventDefault();
				moveForm.find("input[name = 'page']").val($(this).attr("href"));
				moveForm.submit();
				
			});
			

			// 검색 버튼을 누를 시 공백이면 alert
			$("#search_btn").on("click", function(e){
				let keyword = $("input[name='keyword']").val();
				if(keyword == ""){ 
					alert("검색어를 입력해주세요.");
				} else {
					$("form").attr("onsubmit", "return true");
					$("form").submit();
				}
				
			});
		});
	</script>

</body>
</html>
