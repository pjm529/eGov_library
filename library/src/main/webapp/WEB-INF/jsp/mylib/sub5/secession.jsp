<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 나의도서관 > 개인정보 > 회원탈퇴</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mylib/sub5/secession.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" 
 integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
 crossorigin="anonymous"></script>
</head>


    <div class="header">
    	<jsp:include page="../../layout/header.jsp"></jsp:include>
    </div>

    <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>회원탈퇴</h3>
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
                            <a href="${pageContext.request.contextPath}/mylib/secession.do">회원탈퇴</a>
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

                    <div class="warn_txt">
                        <ul>
                            <li>
                                <span><b>!</b> 회원 탈퇴를 하여도 해당 아이디로 등록된 게시물, 신청현황 등은 삭제되지 않고 남아있습니다.</span>
                            </li>

                            <li>
                                <span><b>!</b> 탈퇴 후 작성 글에 대한 모든 권한을 잃게 되므로 게시물 삭제를 원하시면 반드시 탈퇴 전에 삭제하시기 바랍니다.</span>
                            </li>

                            <li>
                                <span><b>!</b> 탈퇴 후 자료대출, 홈페이지 이용(강좌 신청 등), 전자도서관 대출 등 모든 도서관 서비스를 이용하실 수 없습니다.</span>
                            </li>

                            <li>
                                <span><b>!</b> 탈퇴 시 미반납 도서가 있을 경우 탈퇴가 불가능 합니다.</span>
                            </li>

                            <li>
                                <span><b>!</b> 회원님의 정보를 안전하게 보호하기 위해 한 번 더 비밀번호를 입력해 주시기 바랍니다.</span>
                            </li>
                        </ul>

                    </div>

                    <br>

                    <form id="secession_form" method="POST" onsubmit="return false;">

                        <table>
                            <!-- ID -->
                            <tr>
                                <th class="first">
                                    <span style="color: red;">*</span>
                                  	  비밀번호
                                </th>
                                <td class="last">
                                    <input type="password" class="pw_input" autocomplete="off" name="userPw"> <br>
                                </td>
                            </tr>
                        </table>
                        <br>
                        <button id="btn" class="btn">탈퇴</button>
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
            $(".submenu5").addClass("active");
            
            $("#btn").on("click", function(){
            	let userPw = $(".pw_input").val();
            	
            	if(confirm("정말로 탈퇴하시겠습니까?")) {

					if(userPw == ""){
						
						alert("비밀번호를 입력해주세요.");
						
					} else {
						
						let data = {
								userPw: userPw
						}
						
						$.ajax({
	            			type: "post",
	            			url: "${pageContext.request.contextPath}/mylib/secession.do",
	            			data: data,
	            			success: function(result) {
	            				
	            				if (result == "success") {
	            					alert("회원 탈퇴가 정상적으로 완료되었습니다.")
	            					location.href="${pageContext.request.contextPath}";
	            					
	            				} else if (result == "book"){
	            					alert("미반납 도서가 있습니다.");
	            				} else {
	            					alert("비밀번호가 올바르지 않습니다.");
	            				}
	            			}
	            		});
					}
            	}
            });
        });


    </script>

</body>

</html>