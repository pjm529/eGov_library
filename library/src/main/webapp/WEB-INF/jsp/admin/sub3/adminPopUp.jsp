<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 관리자 > 관리자권한</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/sub3/popUp.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" 
 integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
 crossorigin="anonymous"></script>
</head>
<body>

    <div class="container">
        <div class="section">
            <div class="doc">
                <!-- 본문 -->
                <div class="content">
                    <div class="doc">
                        <div class="wrapper-bbs">

                            <!--검색-->
                            <div class="search">
                                <form action="">
                                    <select name="type">
                                        <option value="userId" selected="selected">아이디</option>
                                    </select>
                                    <input type="text" name="keyword" autocomplete="off" value="${member.userId }">
                                    <button id="search_btn" class="btn">검색</button>

                                </form>

                            </div>

                            <!-- 테이블 -->
                            <div class="table-wrap">
                                <table>
                                    <thead>
                                        <tr>
                                            <th style="width: 100px;">아이디</th>
                                            <th style="width: 100px;">이름</th>
                                            <th style="width: 100px;">전화번호</th>
                                            <th style="width: 235px;">이메일</th>
                                            <th style="width: 90px;">회원가입일</th>
                                            <th style="width: 60px;">권한</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:if test="${not empty member}">
                                    	<tr>
											<td class="">${member.userId }</td>
											<td class="left" style="padding-left: 15px;">${member.userName}</td>
											<td>${member.userTel}</td>
											<td>${member.userEmail}</td>
											<td>${member.userRegDate}</td>
											
											<td>
												<form action="${pageContext.request.contextPath}/master/grant.do" 
													method="post" onsubmit="return false;">
													<input type="hidden" id="userId" name="userId" value="${member.userId }">
													<button class="add_btn btn">추가</button>
												</form>
											
											</td>
										</tr>
										</c:if>
                                    </tbody>
                                </table>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
		$(function(){
			$(".add_btn").on("click", function(){
				let id = $('#userId').val(); 
				
				let data = {
           				userId: id
           		};
				
				$.ajax({
					type: "post",
           			url: "${pageContext.request.contextPath}/master/adminChk.do",
           			data: data,
					success: function(result) {
           				
           				if (result == "success") {
           					alert("관리자 권한이 부여되었습니다.")
							$("form").attr("onsubmit", "return true");
           					$("form").submit();
           					
           				} else {
           					alert("이미 관리자 권한을 가지고 있습니다.");
           				}
           			}
				});
				
			});
			
		});

    </script>


</body>
</html>