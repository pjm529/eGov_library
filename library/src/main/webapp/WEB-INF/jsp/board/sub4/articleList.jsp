<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<html>
<head>
   <title>라온도서관 > 열린공간 > 분실물찾기</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/sub4/sb_page.css">
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
                        <li class="first" style="background-image: none;">
                            <a href="/">
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
                            
                            <!-- 게시물 수 -->
                          	<div class="inline">
                            	<form action="">
                            		<input type="hidden" name="type" value="${page.cri.type}">
                                   	<input type="hidden" name="keyword" value="${page.cri.keyword}">
	                                
	                                <span style="margin-right: 10px;"> 총 게시물 : <b>${total}</b> 건</span>	                                
	                                <select name="amount">
	                                
	                                 <c:if test="${page.cri.amount == 10}">
	                                       <option value="10" selected="selected">10개씩 보기</option>
	                                       <option value="20">20개씩 보기</option>
	                                       <option value="30">30개씩 보기</option>
	                                       <option value="40">40개씩 보기</option>
	                                 </c:if>
                                   
                                    <c:if test="${page.cri.amount == 20 }"> 
                                       <option value="10">10개씩 보기</option>
                                       <option value="20" selected="selected">20개씩 보기</option>
                                       <option value="30">30개씩 보기</option>
                                       <option value="40">40개씩 보기</option>
                                   	</c:if>
                                                                      
                                   	<c:if test="${page.cri.amount == 30 }"> 
                                       <option value="10">10개씩 보기</option>
                                       <option value="20">20개씩 보기</option>
                                       <option value="30" selected="selected">30개씩 보기</option>
                                       <option value="40">40개씩 보기</option>
                                   	</c:if>
                                                                 
                                 	<c:if test="${page.cri.amount == 40 }"> 
                                       <option value="10">10개씩 보기</option>
                                       <option value="20">20개씩 보기</option>
                                       <option value="30">30개씩 보기</option>
                                       <option value="40" selected="selected">40개씩 보기</option>
                                   </c:if>

								  </select>
								 <input type="hidden" name="page" value="1">  
								 <button class="btn">이동</button>
							</form>
                         </div>
						
                            <!-- 테이블 -->
                            <div class="table-wrap">
                            	<c:if test="${not empty articleList }">
                                <table>
                                    <thead>
                                        <tr>
                                            <th style="width: 12%;">번호</th>
                                            <th>제목</th>
                                            <th style="width: 18%;">작성자</th>
                                            <th style="width: 12%;">작성일</th>
                                            <th style="width: 15%;">조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="articleList" items="${articleList}">
                                        <tr>
                                            <td class="num">${articleList.articleNo}</td>
                                            <td class="left articleContent" style="padding-left: 15px;">
                                            	<div class="hide">
	                                            	<a href="${articleList.articleNo}">
	                                            		<c:out value="${articleList.articleTitle}"/>
	                                            	</a>
                                            	</div>
                                            </td>
                                			<td>관리자</td>
                                            <td>
                                               <fmt:formatDate var="articleRegDate" value="${articleList.articleRegDate}" pattern="yyyy-MM-dd"/>
                                    				${articleRegDate}
                                            </td>
                                          <td>${articleList.articleViews}</td>
                                        </tr>
                                    </c:forEach>   
                                    </tbody>
                                </table>
                                </c:if>
                                <c:if test="${empty articleList }">
                                <br>
                                <h2>조회된 게시글이 없습니다.</h2>
								</c:if>
            
                             <!-- 글쓰기 btn --> 
                             <sec:authorize access="hasRole('ROLE_ADMIN')">
                             <button class="write_btn" onclick="location.href='${pageContext.request.contextPath}/board/articleInsertPage.do'" 
                             	style="cursor: pointer">글쓰기</button>
                             </sec:authorize>
                             
                             <br>
                             
                             <!-- 페이징 -->
                              <div class="pageInfo" style=""> 
		                           <c:if test="${page.prev }">
		                              <a class="not" href="${page.startPage - 1}">이전</a>
		                           </c:if>
		                           
		                           <c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
		                              <a class="${page.cri.page == num ? "current":"not" }" href="${num }"><span>${num }</span></a>
		                           </c:forEach>
		                           
		                           <c:if test="${page.next }">
		                              <a class="not" href="${page.endPage + 1}">다음</a>
		                           </c:if>
	                        </div>
                            
                            <br>
                            
                            <!-- 검색 -->  
                           	<div class="searchBox">   
                             	<form action="" method="get">
	                             	<input type="hidden" name="page" value="1">
									<input type="hidden" name="amount" value="${page.cri.amount}">
									
										<select name="type">
                                		<c:choose>
                                			<c:when test="${page.cri.type eq 'title'}">
                                				<option value="TC">제목+내용</option>
		                                		<option value="title" selected="selected">제목</option>
		                                		<option value="content">내용</option>
                                			</c:when>
                                			
                                			<c:when test="${page.cri.type eq 'content'}">
                                				<option value="TC">제목+내용</option>
		                                		<option value="title">제목</option>
		                                		<option value="content" selected="selected">내용</option>
                                			</c:when>
                                		
                                			<c:otherwise>
                                				<option value="TC" selected="selected">제목+내용</option>
		                                		<option value="title">제목</option>
		                                		<option value="content">내용</option>
                                			</c:otherwise>
                                		</c:choose>
                                		</select>	
									
									
		                              	<c:choose>
			                              <c:when test="${fn:length(page.cri.keyword) == 0}">
			                              	<input type="text" name="keyword" placeholder="검색어를 입력하세요" autocomplete="off">
			                              </c:when>
			                              	
			                              <c:otherwise>
			                              	<input type="text" name="keyword" value="${page.cri.keyword}" autocomplete="off">
			                              </c:otherwise>                             
		                              </c:choose>
	                              
	                              <input class="search_btn" type="submit" value="검색">
                              	</form>
                             </div>       
                                           
                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>

	<form action="" method="get" class="moveForm">
      <input type="hidden" name="page" value="${page.cri.page}">
      <input type="hidden" name="amount" value="${page.cri.amount}">
      <input type="hidden" name="keyword" value="${page.cri.keyword}">
      <input type="hidden" name="type" value="${page.cri.type}">
   </form>
   
   <form action="" method="get" class="moveForm2">
      <input type="hidden" name="page" value="${page.cri.page}">
      <input type="hidden" name="amount" value="${page.cri.amount}">
      <input type="hidden" name="type" value="${page.cri.type}">
      <input type="hidden" name="keyword" value="${page.cri.keyword}">
      <input type="hidden" name="articleNo" value="">
   </form>
   
    <!-- footer -->
    <jsp:include page="../../layout/footer.jsp"></jsp:include>
   
<script>
   $(function() {
   		$(".sub4").addClass("active");  
      
		var moveForm = $(".moveForm");
		var moveForm2 = $(".moveForm2");
      
      
      	$(".pageInfo a").on("click", function(e) {			
			
      		/*  새로고침(reload) 방지 */
      		e.preventDefault();			
			moveForm.find("input[name = 'page']").val($(this).attr("href"));
			moveForm.submit();			
		})
		
		$(".articleContent a").on("click", function(e) {
	         e.preventDefault();
	         moveForm2.find("input[name = 'articleNo']").val($(this).attr("href"));
	         moveForm2.attr("action", "${pageContext.request.contextPath}/board/articleContent.do");
	         moveForm2.submit();
	         
	      }) 
		
		
   })
</script>
</body>
</html>