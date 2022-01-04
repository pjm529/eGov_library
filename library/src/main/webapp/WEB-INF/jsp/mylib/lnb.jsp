<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class="lnb">
    <h2>
        <b>나의도서관</b>
    </h2>
    <ul class="subMenu">
    
    	<li class="sub1">
    	 	<a href="${pageContext.request.contextPath}/mylib/loanHistory.do">도서관련　　　　　<b>+</b></a>
    	 	
    	 	<ul class="sub">
               <li class="submenu1">
                   <a href="${pageContext.request.contextPath}/mylib/loanHistory.do">대출내역조회</a>
               </li>
               
               <li class="submenu2">
                   <a href="${pageContext.request.contextPath}/mylib/loanList.do">대출중도서조회</a>
               </li>
           </ul>
           
    	</li>
        <li class="sub2">
            <a href="${pageContext.request.contextPath}/mylib/hope.do">희망도서신청　　　<b>+</b></a>
            
            <ul class="sub">
               <li class="submenu6">
                   <a href="${pageContext.request.contextPath}/mylib/hope.do">희망도서신청</a>
               </li>
               
               <li class="submenu7">
                   <a href="${pageContext.request.contextPath}/mylib/hopeHistory.do">희망도서신청내역</a>
               </li>
           </ul>
           
        </li>
        
        <li class="sub3">
            <a href="${pageContext.request.contextPath}/mylib/reservationRoomPage.do">좌석예약/조회 　 　<b>+</b></a>
            
            <ul class="sub">
               <li class="submenu8">
                   <a href="${pageContext.request.contextPath}/mylib/reservationRoomPage.do">열람실이용안내</a>
               </li>
               
               <li class="submenu9">
                   <a href="${pageContext.request.contextPath}/mylib/myReservationInfo.do">나의예약현황</a>
               </li>

               <li class="submenu10">
                   <a href="${pageContext.request.contextPath}/mylib/readingRoom.do">제1열람실</a>
               </li>
               
               <li class="submenu11">
                   <a href="${pageContext.request.contextPath}/mylib/readingRoom2.do">제2열람실</a>
               </li>
               
               <li class="submenu12">
                   <a href="${pageContext.request.contextPath}/mylib/notebookRoom.do">노트북실</a>
               </li>
           </ul>
        </li>
        
        <li class="sub5">
            <a href="${pageContext.request.contextPath}/mylib/myPage.do">개인정보　　　　　<b>+</b></a>
            
            <ul class="sub">
               <li class="submenu3">
                   <a href="${pageContext.request.contextPath}/mylib/myPage.do">마이페이지</a>
               </li>
               
               <li class="submenu4">
                   <a href="${pageContext.request.contextPath}/mylib/modifyPw.do">비밀번호변경</a>
               </li>

               <li class="submenu5">
                   <a href="${pageContext.request.contextPath}/mylib/secession.do">회원탈퇴</a>
               </li>
           </ul>
        </li>
    </ul>
</div>
