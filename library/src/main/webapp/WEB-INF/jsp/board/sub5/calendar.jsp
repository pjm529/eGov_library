<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>라온도서관 > 열린공간 > 도서관일정</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/sub5/calendar.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<body>
	
	<div class="header">
    <jsp:include page="../../layout/header.jsp"></jsp:include>
    </div>
	
	<div class="container">
		<div class="sub_title">
			<div class="doc-info">
				<!-- doc title -->
				<div class="doc-title">
					<h3>도서관일정</h3>
					<ul>
						<!-- 홈 btn img -->
						<li class="first" style="background-image: none;">
							<a href="${pageContext.request.contextPath}">
								<img src="${pageContext.request.contextPath}/images/common/navi_home_icon.gif">
							</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/board/noticeList.do">열린공간</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/board/calendar.do">도서관일정</a>
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
						<div class="wrapper-bbs">
							<!-- 테이블 -->
							<div id='calendar'>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../../layout/footer.jsp"></jsp:include>
	<script>
        $(function () {
            $(".sub5").addClass("active");
        });
    </script>

</body>
</html>
