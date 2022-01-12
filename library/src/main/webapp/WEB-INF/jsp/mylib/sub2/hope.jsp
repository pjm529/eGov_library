<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 나의도서관 > 희망도서신청 > 희망도서신청</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mylib/sub2/hope.css">
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
                    <h3>희망도서신청</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="" style="background-image: none;">
                            <a href="${pageContext.request.contextPath}">
                                <img src="${pageContext.request.contextPath}/images/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/mylib/laonHistory.do">나의도서관</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/mylib/hope.do">희망도서신청</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/mylib/hope.do">희망도서신청</a>
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

                    <form id="join_form" method="POST" onsubmit="return false;">

                        <table>
                            <!-- 제목 -->
                            <tr>
                                <th class="first">
                             	       제목
                                    <span style="color: red;">(*)</span>
                                </th>
                                <td class="last">
                                    <input class="title_input" autocomplete="off" name="bookTitle" maxlength="30"> <br>
                                </td>
                            </tr>
                            
                            <!-- 저자 -->
                            <tr>
                                <th class="first">
                             	       저자
                                    <span style="color: red;">(*)</span>
                                </th>
                                <td class="last">
                                    <input class="author_input" autocomplete="off" name="bookAuthor" maxlength="30"> <br>
                                </td>
                            </tr>
                            
                            <!-- 출판사 -->
                            <tr>
                                <th class="first">
                         	           출판사
                                    <span style="color: red;">(*)</span>
                                </th>
                                <td class="last">
                                    <input class="publisher_input" autocomplete="off" name="bookPublisher" maxlength="20"> <br>
                                </td>
                            </tr>
                            
                            <!-- 연도 -->
                            <tr>
                                <th class="first">
                          	          연도
                                    <span style="color: red;">(*)</span>
                                </th>
                                <td class="last">
                                    <input class="pubDate_input" autocomplete="off" name="bookPubDate" maxlength="20"> <br>
                                </td>
                            </tr>
                            
                            <!-- ISBN -->
                            <tr>
                                <th class="first">
                                    ISBN
                                </th>
                                <td class="last">
                                    <input class="isbn_input" autocomplete="off" name="bookIsbn" maxlength="13"> <br>
                                </td>
                            </tr>
                            
                            <!-- 비고 -->
                            <tr>
                                <th class="first">
                           	         비고
                                </th>
                                <td class="last">
                                    <input class="note_input" autocomplete="off" name="note" maxlength="50"> <br>
                                </td>
                            </tr>
                            
                            <!-- 가격 -->
                            <tr>
                                <th class="first">
                             	       가격
                                    <span style="color: red;">(*)</span>
                                </th>
                                <td class="last">
                                    <input class="price_input" autocomplete="off" name="bookPrice" maxlength="10"> <br>
                                </td>
                            </tr>

                        </table>

                        <div class="join_button_wrap">
                            <input type="button" class="join_button" value="신청하기">
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
			$(".sub2").addClass("active");
	   		$(".submenu6").addClass("active");
	   		
	   		// 가격 숫자만 허용
	        $('.price_input').on("propertychange change keyup paste input", function () {
	            $(this).val($(this).val().replace(/[^0-9]/gi, ""));
	        });
	   		
	   		$(".join_button").on("click", function(){
	   			
	   			let title = $(".title_input").val();
		   		let author = $(".author_input").val();
		   		let publihser = $(".publisher_input").val();
		   		let pubDate = $(".pubDate_input").val();
		   		let price = $(".price_input").val();
		   		
	   			if(title == 0) {
		   			alert("제목을 입력하세요.");
		   			$(".title_input").focus();
		   		} else {
		   			if(author == "") {
		   				alert("저자를 입력하세요.");
		   				$(".author_input").focus();
		   			} else {
		   				if(publihser == "") {
		   					alert("출판사를 입력하세요.");
		   					$(".publisher_input").focus();
		   				} else {
		   					if(pubDate == "") {
		   						alert("연도를 입력하세요.");
		   						$(".pubDate_input").focus();
		   					} else {
		   						if(price == "") {
		   							alert("가격을 입력하세요");
		   							$(".price_input").focus();
		   						} else {
		   							if(confirm("해당도서를 신청하시겠습니까?")) {
		   								$("#join_form").attr("onsubmit", "return true;");
		   			                    $("#join_form").attr("action", "${pageContext.request.contextPath}/mylib/hopeBook.do");
		   			                    $("#join_form").submit();
		   							} else {
		   								alert("취소되었습니다.");
		   							}
		   						}
		   					}
		   				}
		   			}
		   		}
	   		});
	   		
		});
		
    </script>

</body>

</html>