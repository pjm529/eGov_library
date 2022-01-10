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

    <div class="container">

        <div class="section">
            <div class="doc">
                <!-- 본문 -->
                <div class="content">
                    <div class="doc">
                        <div class="wrapper-bbs">

                            <!--검색-->

                            <!-- 테이블 -->
                            <div class="table-wrap">
                                <form id="join_form" method="POST" onsubmit="return false;">
                                    <table>
                                        <tr>
                                            <th class="first">
                                                <span style="color: red;">*</span>
                                               	 일정내용
                                            </th>
                                            <td class="last">
                                                <input class="id_input" autocomplete="off" name="title"> <br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="first">
                                                <span style="color: red;">*</span>
                                              	  일정일자
                                            </th>
                                            <td class="last">
                                                <input type="date" class="cal_input" style="width: 169px;"
                                                    name="start" max="9999-12-31">
                                                <br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="first">
                                                <span style="color: red;">*</span>
                                               	 일정색상
                                            </th>
                                            <td class="last">
                                                <input type='color' id='textColor' name="textColor" value='#000'>
                                            </td>
                                        </tr>

                                    </table>

                                    <div class="join_button_wrap">
                                        <input type="button" class="join_button" value="등록">
                                    </div>
                                </form>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function () {
            $(".join_button").on("click", function () {
				if(confirm("일정을 등록하시겠습니까?")) {
					alert("일정이 등록되었습니다.");
					$("form").attr("onsubmit", "return true;");
					$("form").attr("action", "${pageContext.request.contextPath}/admin/calInsert.do");
					$("form").submit();
				}
            });

        });

    </script>

</body>
</html>