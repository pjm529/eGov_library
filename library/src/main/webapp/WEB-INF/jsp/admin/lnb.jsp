<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
    
<div class="lnb">
    <h2>
        <b>관리자</b>
    </h2>
    <ul class="subMenu">
        <li class="sub1">
            <a href="${pageContext.request.contextPath}/admin/memberList.do">회원관리</a>
        </li>
        <li class="sub2">
            <a href="${pageContext.request.contextPath}/admin/loanHistory.do">도서관련　　　　　<b>+</b></a>
            
            <ul>
            	<li class="submenu1">
		            <a href="${pageContext.request.contextPath}/admin/loanHistory.do">대출내역</a>
		        </li>
		        
		        <li class="submenu2">
		            <a href="${pageContext.request.contextPath}/admin/loanList.do">대출중도서</a>
		        </li>
		        
		        <li class="submenu3">
		            <a href="${pageContext.request.contextPath}/admin/overdueList.do">연체중도서</a>
		        </li>
		        
		        <li class="submenu4">
		            <a href="${pageContext.request.contextPath}/admin/hopeHistory.do">희망도서신청내역</a>
		        </li>
		        
		        <li class="submenu5">
		            <a href="${pageContext.request.contextPath}/admin/rankMember.do">회원대출순위</a>
		        </li>
		        
            </ul>
            
        </li>
        <li class="sub6">
            <a href="${pageContext.request.contextPath}/admin/seatList.do">열람실이용정보</a>
        </li>
        <li class="sub4">
            <a href="${pageContext.request.contextPath}/admin/calendarList.do">일정목록</a>
        </li>
        
        <li class="sub5">
        	<a href="${pageContext.request.contextPath}/admin/bannerList.do">배너목록</a>
        </li>
        <sec:authorize access="hasRole('ROLE_MASTER')">
        <li class="sub3">
            <a href="${pageContext.request.contextPath}/master/adminList.do">관리자목록</a>
        </li>
        </sec:authorize>
    </ul>
</div>