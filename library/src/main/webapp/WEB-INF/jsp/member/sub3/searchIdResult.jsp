<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 회원관련 > 아이디찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/searchId.css">
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
                    <h3>아이디찾기</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="" style="background-image: none;">
                            <a href="/">
                                <img src="${pageContext.request.contextPath}/images/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/member/login.do">회원관련</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/member/searchId.do">아이디찾기</a>
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

                    <form action="${pageContext.request.contextPath}/member/login.do" id="search_id_form">

                        <table>
                            
                            <tr>
                                <th class="first">
                                    <span style="color: red;">*</span>
                              		 아이디
                                </th>
                                <td class="last">
                                    <input class="id_input" autocomplete="off" value="${searchId }" readonly> <br>
                                </td>
                            </tr>
                        </table>

                        <div class="search_id_button_wrap">
                            <input type="submit" class="search_id_button" value="로그인하러 가기">
                        </div>
                    </form>

                </div>

            </div>
        </div>
    </div>
	 <!-- footer -->
	 <jsp:include page="../../layout/footer.jsp"></jsp:include>
    <script>
    	$(function(){
    		
    		$(".sub3").addClass("active");
    	});
    	
    </script>

</body>
</html>