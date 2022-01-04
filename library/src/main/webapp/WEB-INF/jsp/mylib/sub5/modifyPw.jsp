<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 나의도서관 > 개인정보 > 비밀번호변경</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mylib/sub5/modify.css">
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
                    <h3>비밀번호변경</h3>
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
                            <a href="${pageContext.request.contextPath}/mylib/modfiyPwPage.do">비밀번호변경</a>
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

                    <form id="modify_form" method="POST" onsubmit="return false;">

                        <table>
                            <!-- ID -->
                            <tr>
                                <th class="first">
                                    <span style="color: red;">*</span>
                                    	현재 비밀번호
                                </th>
                                <td class="last">
                                    <input type="password" class="present_pw" autocomplete="off" name="presentPw"> <br>
                                    <span class="pre_pw_err">비밀번호를 입력해주세요.</span>
                                </td>
                            </tr>
                            
                            <!-- pwd -->
                            <tr>
                                <th class="first">
                                    <span style="color: red;">*</span>
                                   	 변경 비밀번호
                                </th>
                                <td class="last">
                                    <input class="pw_input" type="password" autocomplete="off" name="userPw"> <br>
                                    <span class="pw_err">비밀번호를 8~16자 입력해주세요.</span>
                                </td>
                            </tr>

                            <!-- pwd_ck -->
                            <tr>
                                <th class="first">
                                    <span style="color: red;">*</span>
                                 	   변경 비밀번호 확인
                                </th>
                                <td class="last">
                                    <input type="password" class="pwck_input" autocomplete="off"> <br>
                                    <span class="pwck_correct">비밀번호가 일치합니다.</span>
                                    <span class="pwck_err_1">비밀번호가 일치하지 않습니다.</span>
                                    <span class="pwck_err_2">비밀번호 확인을 입력해주세요.</span>
                                </td>
                            </tr>

                        </table>
						<br>
						<button id="modify_btn" class="btn">변경</button>
                    </form>
                </div>
                
                

            </div>
        </div>
    </div>
    
    <!-- footer -->
    <jsp:include page="../../layout/footer.jsp"></jsp:include>

    <!-- 주소록 api를 위한 script -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script>
      	$(".sub5").addClass("active");
      	$(".submenu4").addClass("active");

      	let pre_pwCheck  = false;
        let pwCheck = false;            // 비번
        let pwckCheck = false;            // 비번 확인
        let pwckcorCheck = false;        // 비번 확인 일치 확인
        
        $(function(){
        	
        	$("#modify_btn").on("click", function(){
        		
        		let presentPw = $(".present_pw").val(); 	// 현재 비밀번호 입력
        		let pw = $('.pw_input').val();                // 비밀번호 입력란
                let pwck = $('.pwck_input').val();            // 비밀번호 확인 입력란
        		
                
             	// 현재 비밀번호 유효성 검사 
                if (presentPw.length == 0) {
                    $('.pre_pw_err').css('display', 'block');
                    pre_pwCheck = false;
                } else {
                    $('.pre_pw_err').css('display', 'none');
                    pre_pwCheck = true;
                }
                
             	// 비밀번호 유효성 검사 
                if (pw == "" || pw.length < 8 || pw.length > 16) {
                    $('.pw_err').css('display', 'block');
                    pwCheck = false;
                } else {
                    $('.pw_err').css('display', 'none');
                    pwCheck = true;
                }

                // 비밀번호 확인 유효성 검사
                if (pwck == "") {
                    $('.pwck_err_2').css('display', 'block');
                    pwckCheck = false;
                    $('.pwck_err_1').css('display', 'none');
                    pwckcorCheck = false;

                } else {
                    $('.pwck_err_2').css('display', 'none');
                    pwckCheck = true;

                    if (pw == pwck) {
                        $('.pwck_correct').css('display', 'block');
                        $('.pwck_err_1').css('display', 'none');
                        pwckcorCheck = true;
                    } else {
                        $('.pwck_correct').css('display', 'none');
                        $('.pwck_err_1').css('display', 'block');
                        pwckcorCheck = false;
                    }
                }
                
                // 최종 유효성 검사 (모든 check 값들이 true일 경우)
                if (pre_pwCheck && pwCheck && pwckCheck && pwckcorCheck) {
                	
                	let data = {
							presentPw: presentPw,
							userPw: pw
					}
					
					$.ajax({
            			type: "post",
            			url: "${pageContext.request.contextPath}/mylib/modifyPw.do",
            			data: data,
            			success: function(result) {
            				
            				if (result == "success") {
            					alert("비밀번호 변경이 완료되었습니다.")
            					location.href="${pageContext.request.contextPath}/member/login.do";
            					
            				} else {
            					alert("현재 비밀번호가 올바르지 않습니다.");
            					location.reload();
            				}
            			}
            		});
                }

                return false;
                
               
        	})
        	
        	// 현재 비밀번호 입력 시 입력해달라는 문구 none;
	        $('.present_pw').on("propertychange change keyup paste input", function () {
	
	            if ($(this).val().length > 0) {
	                $('.pre_pw_err').css('display', 'none');
	            } else {
	                $('.pre_pw_err').css('display', 'block');
	            }
	
	        });
        	
        	// 비밀번호 확인 일치 유효성 검사
            $('.pwck_input').on("propertychange change keyup paste input", function () {

                let pw = $(".pw_input").val();
                let pwck = $(".pwck_input").val();
                $(".pwck_err_2").css("display", "none"); // 비밀번호 확인 입력 에러 none

                if (pw == pwck && pw != "") { // 비밀번호와 비밀번호 확인이 같고 비밀번호가 공백이 아닐시 true
                    $('.pwck_correct').css('display', 'block');
                    $('.pwck_err_1').css('display', 'none');
                    pwckcorCheck = true;
                } else {
                    $('.pwck_correct').css('display', 'none');
                    $('.pwck_err_1').css('display', 'block');
                    pwckcorCheck = false;
                }
            });

            // 비밀번호 입력 시 입력해달라는 문구 none;
            $('.pw_input').on("propertychange change keyup paste input", function () {

                let pw = $(".pw_input").val();
                let pwck = $(".pwck_input").val();

                if (pw.length > 7 && pw.length < 17) { // 비밀번호가 6~ 12일시 true
                    $('.pw_err').css('display', 'none');
                } else {
                    $('.pw_err').css('display', 'block');
                }

                if (pw.ck != "") { // 비밀번호 확인이 공백이 아니면 입력 에러 none
                    $('.pwck_err_2').css('display', 'none');
                }
                if (pw == pwck && pw != "") { // 비밀번호와 비밀번호 확인이 같고 비밀번호가 공백이 아닐시 true
                    $('.pwck_correct').css('display', 'block');
                    $('.pwck_err_1').css('display', 'none');
                    pwckcorCheck = true;
                } else {
                    $('.pwck_correct').css('display', 'none');
                    $('.pwck_err_1').css('display', 'block');
                    pwckcorCheck = false;
                }

            });
        })

      
    </script>

</body>

</html>