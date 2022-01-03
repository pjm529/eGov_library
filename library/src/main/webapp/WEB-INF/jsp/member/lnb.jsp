<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="lnb">
    <h2>
        <b>회원관련</b>
    </h2>
    <ul class="subMenu">
        <li class="sub1">
            <a href="${pageContext.request.contextPath}/member/login.do">로그인</a>
        </li>
        <li class="sub2">
            <a href="${pageContext.request.contextPath}/member/signupCheck.do">회원가입</a>
        </li>
        <li class="sub3">
            <a href="${pageContext.request.contextPath}/member/searchId.do">아이디 찾기</a>
        </li>
        <li class="sub4">
            <a href="${pageContext.request.contextPath}/member/searchPw.do">비밀번호 찾기</a>
        </li>
    </ul>
</div>