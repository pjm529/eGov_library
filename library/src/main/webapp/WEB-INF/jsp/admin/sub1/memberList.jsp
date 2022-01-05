<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 관리자 > 회원관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/memberList.css">
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
                    <h3>회원관리</h3>
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
                            <a href="${pageContext.request.contextPath}/admin/memberList.do">회원관리</a>
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

                            <!--검색-->
                            <div class="search">
                                <form action="" onsubmit="return false;">
                              		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                              		<input type="hidden" name="page" value="1">
                                    <select name="type">
                                    
                                    	<c:if test="${empty pageMaker.cri.type}">
                                    	<option value="userId" selected="selected">아이디</option>
                                        <option value="userName">이름</option>
                                        <option value="userTel">전화번호</option>
                                        <option value="userEmail">이메일</option>
                                        <option value="userRegDate">회원가입일</option>
                                    	</c:if>
                                    	
                                    
                                    	<c:if test="${pageMaker.cri.type == 'userId'}">
                                    	<option value="userId" selected="selected">아이디</option>
                                        <option value="userName">이름</option>
                                        <option value="userTel">전화번호</option>
                                        <option value="userEmail">이메일</option>
                                        <option value="userRegDate">회원가입일</option>
                                    	</c:if>
                                    	
                                    	<c:if test="${pageMaker.cri.type == 'userName' }">
                                    	<option value="userId">아이디</option>
                                        <option value="userName" selected="selected">이름</option>
                                        <option value="userTel">전화번호</option>
                                        <option value="userEmail">이메일</option>
                                        <option value="userRegDate">회원가입일</option>
                                    	</c:if>
                                    	
                                    	<c:if test="${pageMaker.cri.type == 'userTel' }">
                                    	<option value="userId">아이디</option>
                                        <option value="userName">이름</option>
                                        <option value="userTel" selected="selected">전화번호</option>
                                        <option value="userEmail">이메일</option>
                                        <option value="userRegDate">회원가입일</option>
                                    	</c:if>
                                    	
                                    	<c:if test="${pageMaker.cri.type == 'userEmail' }">
                                    	<option value="userId">아이디</option>
                                        <option value="userName">이름</option>
                                        <option value="userTel">전화번호</option>
                                        <option value="userEmail" selected="selected">이메일</option>
                                        <option value="userRegDate">회원가입일</option>
                                    	</c:if>
                                    	
                                    	<c:if test="${pageMaker.cri.type == 'userRegDate' }">
                                    	<option value="userId">아이디</option>
                                        <option value="userName">이름</option>
                                        <option value="userTel">전화번호</option>
                                        <option value="userEmail">이메일</option>
                                        <option value="userRegDate" selected="selected">회원가입일</option>
                                    	</c:if>
                                        
                                    </select>
                                    <input type="text" name="keyword" value="${pageMaker.cri.keyword }"
                                    	autocomplete="off">
                                    <button id="search_btn" class="btn">검색</button>
                                    
                                </form>

                            </div>
                            <!-- 회원 수 -->
                            <div class="inline">
                                <form action="">
                                	
                                    <span style="margin-right: 10px;"> 총 회원 : <b><c:out value="${total}"/></b> 명</span>
                                    <select name="amount">
                                    	
	                                    <c:if test="${pageMaker.cri.amount == 10 }">
	                                    <option value="10" selected="selected">10명씩 보기</option>
	                                    <option value="20">20명씩 보기</option>
	                                    <option value="30">30명씩 보기</option>
	                                    <option value="40">40명씩 보기</option>
	                                    </c:if>
	                                    
	                                    <c:if test="${pageMaker.cri.amount == 20 }">
	                                    <option value="10">10명씩 보기</option>
	                                    <option value="20" selected="selected">20명씩 보기</option>
	                                    <option value="30">30명씩 보기</option>
	                                    <option value="40">40명씩 보기</option>
	                                    </c:if>
	                                    
	                                    <c:if test="${pageMaker.cri.amount == 30 }">
	                                    <option value="10">10명씩 보기</option>
	                                    <option value="20">20명씩 보기</option>
	                                    <option value="30" selected="selected">30명씩 보기</option>
	                                    <option value="40">40명씩 보기</option>
	                                    </c:if>
	                                    
	                                    <c:if test="${pageMaker.cri.amount == 40 }">
	                                    <option value="10">10명씩 보기</option>
	                                    <option value="20">20명씩 보기</option>
	                                    <option value="30">30명씩 보기</option>
	                                    <option value="40" selected="selected">40명씩 보기</option>
	                                    </c:if>
                                        
                                    </select>
                                    <input type="hidden" name="page" value="1">
                                    <input type="hidden" name="type" value="${pageMaker.cri.type }">
									<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
                                    <button id="list_btn" class="btn">이동</button>
                                </form>

                            </div>

                            <!-- 테이블 -->
                            <c:if test="${not empty memberList }">
                            <div class="table-wrap">
                                <table>
                                    <thead>
                                        <tr>
                                            <th style="width: 100px;">아이디</th>
                                            <th style="width: 100px;">이름</th>
                                            <th style="width: 100px;">전화번호</th>
                                            <th style="width: 235px;">이메일</th>
                                            <th style="width: 90px;">생년월일</th>
                                            <th style="width: 50px;">대출불가</th>
                                            <th style="width: 90px;">회원가입일</th>
                                            <th style="width: 60px;">정보</th>
	                                </tr>
                                    </thead>
                                    <tbody>
                                    
	                                    <c:forEach var="memberList" items="${memberList}">
										<tr>
											<td class="">${memberList.userId }</td>
											<td class="left" style="padding-left: 15px;">${memberList.userName }</td>
											<td>${memberList.userTel}</td>
											<td>${memberList.userEmail}</td>
											<td>${memberList.userBirth }</td>
											
											<c:if test="${memberList.userOverdueDate == 0 }">
											<td>대출가능</td>
											</c:if>
											
											<c:if test="${memberList.userOverdueDate != 0 }">
											<td>${memberList.userOverdueDate }일</td>
											</c:if>
											
											<td>${memberList.userRegDate }</td>
											<td>
												<form action="${pageContext.request.contextPath}/admin/memberView.do" method="get">
													<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
													<input type="hidden" name="page" value="${pageMaker.cri.page }">
													<input type="hidden" name="type" value="${pageMaker.cri.type }">
													<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
													<input type="hidden" name="userId" value="${memberList.userId }">
													<button class="btn2">정보</button>
												</form>
											
											</td>
										</tr>
										</c:forEach>
	                                        
                                    </tbody>
                                </table>
                                
                                <br>
                                
                                <div class="pageInfo" style="">
	
									<c:if test="${pageMaker.prev }">
										<a class="not" href="${pageMaker.startPage - 1}">이전</a>
									</c:if>
									
									<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
										<a class="${pageMaker.cri.page == num ? "current":"not" }" href="${num }"><span>${num }</span></a>
									</c:forEach>
									
									<c:if test="${pageMaker.next }">
										<a class="not" href="${pageMaker.endPage + 1}">다음</a>
									</c:if>
								</div>
                            </div>
                            </c:if>

                        </div>
						<c:if test="${empty memberList }">
						<br>
						<h2>조회 된 회원이 없습니다.</h2>
						</c:if>
                    </div>

                </div>

            </div>
        </div>
    </div>
    
    <form method="get" class="moveForm"> 
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="page" value="${pageMaker.cri.page }">
		<input type="hidden" name="type" value="${pageMaker.cri.type }">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	</form>
    
    <!-- footer -->
    <jsp:include page="../../layout/footer.jsp"></jsp:include>


	<script>
		
		$(function() {
			$(".sub1").addClass("active");
			
			let moveForm = $(".moveForm");
			
			//pageInfo의 a태그를 누르면 a태그의 href 속성을 가져와서 moveForm의 page에 넣고 moveForm이 submit됨
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