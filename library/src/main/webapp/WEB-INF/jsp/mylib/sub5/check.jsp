<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 나의도서관 > 개인정보 > 마이페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mylib/sub5/myPage.css">
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
                    <h3>마이페이지</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="" style="background-image: none;">
                            <a href="${pageContext.request.contextPath}">
                                <img src="${pageContext.request.contextPath}/images/common/navi_home_icon.gif"> 
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/mylib/loanHistory.do">나의도서관</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/mylib/myPage.do">개인정보</a> 
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/mylib/myPage.do">마이페이지</a>
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
                <div class="content" style="text-align: center;">
					<h2>비밀번호 확인</h2>
                    <form method="POST" onsubmit="return false;">
						<input class="input_pw" type="password" style="width: 500px;" placeholder="비밀번호를 입력해주세요"><br><br>
                        <button class="btn">확인</button>
                    </form>

                </div>

            </div>
        </div>
    </div>
    
    <!-- footer -->
    <jsp:include page="../../layout/footer.jsp"></jsp:include>

    <script>
        $(function () {
            $(".sub5").addClass("active");
            $(".submenu3").addClass("active");
            
            $(".btn").on("click", function(){
            	
            	let user_pw = $(".input_pw").val();
            	
            	if (user_pw == "") {
            		
            		alert("비밀번호를 입력해주세요.");
            		$(".input_pw").focus();
            		
            	} else {
            		
            		let data = {
                			userPw: user_pw
                	}
                	
                	// 비밀번호 검사
                    $.ajax({

                        type: "post",
                        url: "${pageContext.request.contextPath}/mylib/checkPw.do",
                        data: data,
                        success: function (result) {

                        	// 입력한 비밀번호와 회원의 비밀번호 일치 시
                            if (result == "success") {
                            	$("form").attr("onsubmit", "return true;")
                            	$("form").submit();
                            } else {
                            	alert("비밀번호가 올바르지 않습니다.");
                            	location.reload();
                            }
                        }

                    }); // ajax 종료
            	}
            	
            });

        });
    </script>

</body>

</html>