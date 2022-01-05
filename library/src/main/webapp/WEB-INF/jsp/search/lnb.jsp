<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="lnb">
    <h2>
        <b>자료검색</b>
    </h2>
    <ul class="subMenu">
        <li class="sub1">
            <a href="${pageContext.request.contextPath}/search/book.do">도서검색</a>
        </li>
        <li class="sub2">
            <a href="${pageContext.request.contextPath}/search/bestBook.do">대출베스트</a>
        </li> 
        <li class="sub3">
            <a href="${pageContext.request.contextPath}/search/recommendBook.do">추천도서</a>
        </li> 
    </ul>
</div>