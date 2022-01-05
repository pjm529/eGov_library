<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 관리자 > 회원관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/sub1/mail.css">
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
                        <li class="" style="background-image: none;">
                            <a href="/">
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
                <div class="content">

                    <form id="join_form" method="POST" onsubmit="return false;">

                        <table>
                            <!-- ID -->
                            <tr>
                                <th class="first">
                                 	   아이디
                                </th>
                                <td class="last">
                                    <input class="id_input" autocomplete="off" 
                                    value="${member.userId }" readonly> <br>
                                </td>
                            </tr>

                            <!-- name -->
                            <tr>
                                <th class="first">
                              	      이름
                                </th>
                                <td class="last">
                                    <input class="name_input" autocomplete="off" name="userName"
                                    value="${member.userName }" readonly> <br>
                                </td>
                            </tr>


                            <!-- email -->
                            <tr>
                                <th class="first">
                                  	  이메일
                                </th>
                                <td class="last">
                                    <input class="mail_input" style="width: 50%;" autocomplete="off" name="userEmail"
                                    value="${member.userEmail }" readonly>
                                </td>
                            </tr>
                            
                            <!-- 제목 -->
                            <tr>
                                <th class="first">
                               	     제목
                                </th>
                                <td class="last">
                                    <input style="width: 50%;" autocomplete="off" name="mailTitle">
                                </td>
                            </tr>
                            
                            <!-- 내용 -->
                            <tr>
                                <th class="first">
                               	     내용
                                </th>
                                <td class="last">
                                	<textarea rows="10" cols="80" name="mailContent" class="mail_content" style="resize: none;"></textarea>
                                </td>
                            </tr>

                        </table>
						<br>
						<button id="send_btn" class="btn" style="float:right;">발송</button>
                    </form>
                    
                    <div class="member_list_wrap">
                    	<form action="/admin/member-list" method="get">
                    		<input type="hidden" name="amount" value="${cri.amount }">
							<input type="hidden" name="page" value="${cri.page }">
							<input type="hidden" name="type" value="${cri.type }">
							<input type="hidden" name="keyword" value="${cri.keyword }">
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
    		$(".sub1").addClass("active");
    		$("#send_btn").on("click", function(){
    			if(confirm("메일을 발송하시겠습니까?")){
   					alert("메일이 발송되었습니다.")
       				$("form").attr("onsubmit", "return true;");
   					$("form").attr("action", "${pageContext.request.contextPath}/admin/mailSend.do");
       				$("form").submit();
    			}
    		})
    		
    	})


    </script>

</body>

</html>