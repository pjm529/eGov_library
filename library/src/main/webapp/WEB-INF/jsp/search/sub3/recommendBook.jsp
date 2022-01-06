<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<html>
<head>
	<title>라온도서관 > 자료검색 > 추천도서</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/search/recommendBook.css">
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
                <div class="content">
                    <div class="doc">
                        <div class="wrapper-bbs">
                        	<sec:authorize access="hasRole('ROLE_ADMIN')">
							<div>
								<form>
	        						<input class="btn add_btn" type="submit" value="등록" style="float:left;">
	        					</form>
							</div>
							</sec:authorize>
                            <!-- 도서 수 -->
                            <div class="inline">
                                <form action="">
                                	추천년월:
                                    <select name="year" style="width: 75px;">
                                        <c:forEach var="i" begin="2020" end="2022">
                                    		<option value="${i}" ${i== date.year ? "selected=selected":'' }>
                                    		${i }년
                                    		</option>
                                    	</c:forEach>
                                    </select>
                                    <select name="month" style="width: 60px;">
                                    	<c:forEach var="i" begin="1" end="12">
                                    		<option value="${i}" ${i== date.month ? "selected=selected":'' }>
                                    		${i }월
                                    		</option>
                                    	</c:forEach>
                                    </select>
                                    <input type="hidden" name="page" value="1">
                                    <button class="btn">이동</button>
                                </form>

                            </div>

							<c:if test="${not empty list }">
                            <!-- 테이블 -->
                            <div class="recommend_book">
                                <div class="clear_box"></div>
                                <c:forEach var="list" items="${list}">
                                    <div class="row">
                                        <div class="thumb">
                                        	<a href="${pageContext.request.contextPath}/search/recommendBookDetail.do?bookIsbn=${list.bookIsbn }&year=${date.year}&month=${date.month}&page=${page.cri.page}">
                                            <img src="${list.bookcover }" style="width: 118px;" title="${list.booktitle }">
                                            </a>
                                        </div>

                                        <div class="book_info">
                                            <ul>
                                                <li>
                                                	<a href="${pageContext.request.contextPath}/search/recommendBookDetail.do?bookIsbn=${list.bookIsbn }&year=${date.year}&month=${date.month}&page=${page.cri.page}">
                                                    <h3 class="hide" title="${list.bookTitle }">${list.bookTitle } </h3>
                                                    </a>
                                                <li>
                                                <li><b>저자</b> : ${list.bookAuthor }</li>
                                                <li><b>출판사</b> : ${list.bookPublisher }</li>
                                                <li><b>출판년도</b> : ${list.bookPubDate }</li>
                                            </ul>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            </c:if>
                            
                        </div>
						<c:if test="${empty list }">
						<br>
                        <h2>등록된 추천 도서가 없습니다.</h2>
                        </c:if>
                    </div>
                </div>
			
            </div>
            
        </div>
        <div class="pageInfo" style="text-align: center; width:970px; margin-left: 600px;">
								
	         <c:if test="${page.prev }">
	             <a class="not" href="${page.startPage - 1}">이전</a>
	         </c:if>
	
	         <c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
	
	             <c:if test="${num != 0}">
	                 <a class="${page.cri.page == num ? " current":"not" }" href="${num }">${num }</a>
	             </c:if>
	
	         </c:forEach>
	
	         <c:if test="${page.next }">
	             <a class="not" href="${page.endPage + 1}">다음</a>
	         </c:if>
	     </div>  
            
    </div>

    <form method="get" class="moveForm">
        <input type="hidden" name="year" value="${year }">
        <input type="hidden" name="month" value="${month }">
        <input type="hidden" name="page" value="${page.cri.page }">
    </form>

	<br><br><br>
    <!-- footer -->
    <jsp:include page="../../layout/footer.jsp"></jsp:include>
    <script>
        $(function () {
            $(".sub3").addClass("active");

            let moveForm = $(".moveForm");

            $(".pageInfo a").on("click", function (e) {
                e.preventDefault();
                moveForm.find("input[name = 'page']").val($(this).attr("href"));
                moveForm.submit();

            });
            
			$('.add_btn').on("click",function(e){
				
				e.preventDefault();
				
				let popUrl = "${pageContext.request.contextPath}/search/registBook.do";
				let popOption = "width = 710px, height=600px, top=300px, scrollbars=no, resizeable=no";
				window.open(popUrl,"도서 등록" ,popOption);
				
			});

        });
    </script>

</body>
</html>
