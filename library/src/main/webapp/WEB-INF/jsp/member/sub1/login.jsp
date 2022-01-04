<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 회원관련 > 로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/login.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" 
 integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
 crossorigin="anonymous"></script>
</head>
<body>

    <div class="header">
    </div>

    <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>로그인</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="${pageContext.request.contextPath}">
                                <img src="${pageContext.request.contextPath}/images/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/member/login.do">회원관련</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/member/login.do">로그인</a>
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
                        <h2><span style="color: rgb(101, 101, 255);">라온도서관</span> 방문을 환영합니다.</h2>
                        <div class="wrapper-bbs">

                            <div>

                                <div class="login_img">
                                    <img src="${pageContext.request.contextPath}/images/member/mem_loginimg.png">
                                </div>

                                <div class="loginForm">
                                    <form action="${pageContext.request.contextPath}/member/login.do" method="post">
                                        <input class="id_input" type="text" name="userId" placeholder="아이디"
                                            autocomplete="off" required>
                                        <p style="font-size: 5px;"></p>
                                        <input class="pw_input" type="password" name="userPw" placeholder="비밀번호"
                                            autocomplete="off" required>
                                        <button class="login_btn">로그인</button>
                                    </form>
                                </div>

                                <div class="login_menu">
                                    <span><a href="${pageContext.request.contextPath}/member/signUpCheck.dp">회원가입 ▶</a>　</span>
                                    <span><a href="${pageContext.request.contextPath}/member/searchId.do">아이디 찾기 ▶</a>　</span>
                                    <span><a href="${pageContext.request.contextPath}/member/searchPw.do">비밀번호 찾기 ▶</a></span>
                                    <p style="font-size: 20px;"></p>
                                </div>

                                <div class="tit">
                                    <hr>
                                    <span>※ 로그인 후 시스템을 이용할 수 있습니다.</span>
                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>

    <!-- footer -->
    <script>
        $(function () {
            $(".sub1").addClass("active");
        });

    </script>

</body>
</html>