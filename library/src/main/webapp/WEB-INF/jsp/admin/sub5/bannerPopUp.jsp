<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 관리자 > 관리자권한</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/sub4/calPopUp.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" 
 integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
 crossorigin="anonymous"></script>
</head>
<body>
	    <!-- 테이블 -->
	    <div class="table-wrap">
	        <form id="join_form" method="POST" onsubmit="return false;">
	            <table>
	                <tr>
	                    <th class="first">
	                        <span style="color: red;">*</span>
	                     	   이미지 경로
	                    </th>
	                    <td class="last">
	                        <input class="path_input" autocomplete="off" name="path"> <br>
	                    </td>
	                </tr>
	
	            </table>
	
	            <div class="join_button_wrap">
	                <input type="button" class="join_button" value="등록">
	            </div>
	        </form>
	        <br>
	    </div>

    <script>
        $(function () {
            $(".join_button").on("click", function () {
				if(confirm("배너를 등록하시겠습니까?")) {
					alert("배너가 등록되었습니다.");
					$("form").attr("onsubmit", "return true;");
					$("form").attr("action", "${pageContext.request.contextPath}/admin/bannerAdd.do");
					$("form").submit();
				}
            });

        });

    </script>

</body>
</html>