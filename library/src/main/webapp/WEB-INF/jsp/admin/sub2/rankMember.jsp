<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 관리자 > 도서관련 > 회원대출순위</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/sub1/memberList.css"> 
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
                    <h3>회원대출순위</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="${pageContext.request.contextPath}">
                                <img src="${pageContext.request.contextPath}/images/common/navi_home_icon.gif">
                            </a>
                        </li> 
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/memberList.do">관리자</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/loanHistory.do">도서관련</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/list.do">회원대출순위</a>
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
                                    <input type="hidden" name="page" value="1">
                                    <button class="btn">이동</button>
                                </form>

                            </div>

                            <!-- 테이블 -->
                            <c:if test="${not empty rankList}">
                            <div class="table-wrap">
                                <table>
                                    <thead>
                                        <tr>
                                        	<th style="width: 60px;">순위</th>
                                            <th style="width: 100px;">아이디</th>
                                            <th style="width: 100px;">이름</th>
                                            <th style="width: 100px;">전화번호</th>
                                            <th style="width: 235px;">이메일</th>
                                            <th style="width: 90px;">생년월일</th>
                                            <th style="width: 90px;">회원가입일</th>
                                            <th style="">대출권수</th>
	                                	</tr>
                                    </thead>
                                    <tbody>
                                   	 

	                                    <c:forEach var="list" items="${rankList}">
	                                    <c:set var="i" value="${i+1}" />
										<tr>
											<td>${i}</td>
											<td class="">${list.userId}</td>
											<td class="left" style="padding-left: 15px;">${list.userName}</td>
											<td>${list.userTel}</td>
											<td>${list.userEmail}</td>
											<td>${list.userBirth}</td>
											<td>${list.userRegDate}</td>
											<td>${list.count}권</td>
										</tr>
										</c:forEach>
	                                        
                                    </tbody>
                                </table>
                                
                                <br>
                            </div>
                            </c:if>
							
                        </div>
                        <c:if test="${empty rankList}">
							<h2>검색 된 순위가 없습니다.</h2>
						</c:if>
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
			$(".submenu5").addClass("active");
		});
		
	</script>	


</body>
</html>