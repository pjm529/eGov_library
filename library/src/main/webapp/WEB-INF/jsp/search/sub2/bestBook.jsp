<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>라온도서관 > 자료검색 > 대출베스트</title>
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
                    <h3>대출베스트</h3>
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
                            <a href="${pageContext.request.contextPath}/search/bestBook.do">대출베스트</a>
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
							<!-- 년월 -->
                            <div class="inline">
                                <form action="">
                                	검색년월:
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
                                            	<p><b>대출 수</b> : ${list.totalCount }</p>
                                            	
                                            	<c:if test="${list.count == 2}">
                                            	<p><b>상태</b> : <span style="color: red;">대출불가</span></p>
                                            	</c:if>
                                            	
                                            	<c:if test="${list.count != 2}">
                                            	<p><b>상태</b> : 대출가능</p>
                                            	</c:if>
                                            </td>
                                            <td>
                                            	<form action="${pageContext.request.contextPath}/search/bestBookDetail.do" method="get">
													<input type="hidden" name="bookIsbn" value="${list.bookIsbn }">
													<input type="hidden" name="year" value="${date.year }">
													<input type="hidden" name="month" value="${date.month }"> 
													<button class="btn2">도서 정보</button>
												</form>
                                            </td>
                                        </tr>
										</c:forEach>

                                    </tbody>
                                </table>
                                </c:if>
                            </div>
                            
                            <c:if test="${empty list }">
                            <br>
	                        <h2>대출 베스트 도서가 없습니다.</h2>
	                        </c:if>
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
			$(".sub2").addClass("active");
		});
	</script>

</body>
</html>
