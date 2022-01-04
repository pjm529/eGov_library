<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 회원관련 > 회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/signUp.css"> 
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
                    <h3>회원가입</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="" style="background-image: none;">
                            <a href="${pageContext.request.contextPath}">
                                <img src="${pageContext.request.contextPath}/images/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/member/login.do">회원관련</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/member/signup.do">회원가입</a>
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
                            <!-- ID -->
                            <tr>
                                <th class="first">
                                    <span style="color: red;">*</span>
                                	    아이디
                                </th>
                                <td class="last">
                                    <input class="id_input" autocomplete="off" name="userId" maxlength="12"> <br>
                                    <span class="id_correct">사용 가능한 아이디입니다.</span>
                                    <span class="id_err_1">아이디가 이미 존재합니다.</span>
                                    <span class="id_err_2">아이디를 6~12자 입력해주세요.</span>
                                </td>
                            </tr>

                            <!-- pwd -->
                            <tr>
                                <th class="first">
                                    <span style="color: red;">*</span>
                               	     비밀번호
                                </th>
                                <td class="last">
                                    <input class="pw_input" type="password" autocomplete="off" name="userPw" maxlength="16"> <br>
                                    <span class="pw_err">비밀번호를 8~16자 입력해주세요.</span>
                                </td>
                            </tr>

                            <!-- pwd_ck -->
                            <tr>
                                <th class="first">
                                    <span style="color: red;">*</span>
                                  	  비밀번호 확인
                                </th>
                                <td class="last">
                                    <input type="password" class="pwck_input" autocomplete="off" maxlength="16"> <br>
                                    <span class="pwck_correct">비밀번호가 일치합니다.</span>
                                    <span class="pwck_err_1">비밀번호가 일치하지 않습니다.</span>
                                    <span class="pwck_err_2">비밀번호 확인을 입력해주세요.</span>
                                </td>
                            </tr>

                            <!-- name -->
                            <tr>
                                <th class="first">
                                    <span style="color: red;">*</span>
                                    	이름
                                </th>
                                <td class="last">
                                    <input class="name_input" autocomplete="off" name="userName" maxlength="10"> <br>
                                    <span class="name_err">이름을 2자 이상 입력해주세요.</span>
                                </td>
                            </tr>

                            <!-- BHD -->
                            <tr>
                                <th class="first">
                                    <span style="color: red;">*</span>
                                 	   생년월일
                                </th>
                                <td class="last">
                                    <input type="date" class="birth_input" style="width: 169px;" name="userBirth"
                                        max="9999-12-31">
                                    <br>
                                    <span class="birth_err">생년월일을 입력해주세요.</span>
                                </td>
                            </tr>

                            <!-- tel -->
                            <tr>
                                <th class="first">
                                    <span style="color: red;">*</span>
                                 	   전화번호
                                </th>
                                <td class="last">
                                    <input class="phone_input" autocomplete="off" maxlength="11" name="userTel"> <br>
                                    <span class="phone_err">전화번호를 10~11자 입력해주세요.</span>
                                </td>
                            </tr>


                            <!-- email -->
                            <tr>
                                <th class="first">
                                    <span style="color: red;">*</span>
                                    	이메일
                                </th>
                                <td class="last">
                                    <input class="mail_input" style="width: 50%;" autocomplete="off" name="userEmail">
                                    <br>
                                    <span class="email_correct">이메일이 전송 되었습니다. 이메일을 확인해주세요.</span>
                                    <span class="email_err_1">올바르지 못한 이메일 형식입니다.</span>
                                    <span class="email_err_2">이메일을 입력해주세요.</span>
                                    <span class="email_err_3">중복된 이메일이 존재합니다.</span>


                                    <br>
                                    <input class="mailck_input" autocomplete="off" disabled="disabled">
                                    <button class="email_btn">인증번호 전송</button><br>
                                    <span class="emailck_err">이메일을 인증해주세요.</span>
                                    <span class="emailck_correct">인증번호가 일치합니다.</span>
                                    <span class="emailck_err_2">인증번호가 일치하지 않습니다.</span>
                                </td>
                            </tr>

                            <!-- add -->
                            <tr>
                                <th class="first">
                                    <span style="color: red;">*</span>
                                	    주소
                                </th>
                                <td class="last">
                                    <div>
                                        <p>
                                            <input class="address_input_1" style="width: 80px;" title="우편번호"
                                                readonly="readonly" autocomplete="off" name="userZip">
                                            <button class="zip_btn" onclick="execution_daum_address()">우편번호 찾기</button>
                                        </p>
                                        <p>
                                            <input class="address_input_2" style="width: 80%; margin-bottom: 5px;"
                                                readonly="readonly" autocomplete="off" name="userAddress">
                                            <input class="address_input_3" style="width: 80%; margin-bottom: 3px;"
                                                autocomplete="off" name="userAddressDetail" maxlength="30"> <br>
                                            <span class="address_err">주소를 입력해주세요.</span>
                                        </p>
                                    </div>
                                </td>
                            </tr>

                        </table>

                        <div class="join_button_wrap">
                            <input type="button" class="join_button" value="가입하기">
                        </div>
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

        $(".sub2").addClass("active");
        let code = ""; // 이메일 전송 인증번호 저장을 위한 변수

        // 유효성 검사 통과 유무 변수
        let idCheck = false;            // 아이디
        let idckCheck = false;            // 아이디 중복 검사
        let pwCheck = false;            // 비번
        let pwckCheck = false;            // 비번 확인
        let pwckcorCheck = false;        // 비번 확인 일치 확인
        let nameCheck = false;            // 이름
        let birthCheck = false;            // 이름
        let phoneCheck = false;            // 전화번호
        let mailCheck = false;            // 이메일
        let mailnumCheck = false;        // 이메일 인증번호 확인
        let addressCheck = false         // 주소


        // 회원가입 전송
        $(document).ready(function () {

            $(".join_button").click(function () {

                /* 입력값 변수 */
                let id = $('.id_input').val();                 // id 입력란
                let pw = $('.pw_input').val();                // 비밀번호 입력란
                let pwck = $('.pwck_input').val();            // 비밀번호 확인 입력란
                let name = $('.name_input').val();            // 이름 입력란
                let birth = $('.birth_input').val();            // 생년월일 입력란
                let phone = $('.phone_input').val();            // 전화번호 입력란
                let mail = $('.mail_input').val();            // 이메일 입력란
                let mailck = $('.mailck_input').val();     // 이메일 인증번호 입력란
                let addr = $('.address_input_3').val();        // 주소 입력란


                // 최종 유효성 검사
                // 아이디 유효성 검사 
                if (id == "" || id.length < 6 || id.length > 12) {
                    $('.id_err_2').css('display', 'block');
                    idCheck = false;
                } else {
                    $('.id_err_2').css('display', 'none');
                    idCheck = true;
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

                // 이름 유효성 검사
                if (name == "" || name.length < 2) { // 이름이 공백이거나 2자 미만시 false
                    $('.name_err').css('display', 'block');
                    nameCheck = false;
                } else {
                    $('.name_err').css('display', 'none');
                    nameCheck = true;
                }

                // 생년월일 유효성 검사
                if (birth == "") {
                    $('.birth_err').css('display', 'block');
                    birthCheck = false;
                } else {
                    $('.birth_err').css('display', 'none');
                    birthCheck = true;
                }

                // 전화번호 유효성 검사
                if (phone.length != 10 && phone.length != 11) {
                    $('.phone_err').css('display', 'block');
                    phoneCheck = false;
                } else {
                    $('.phone_err').css('display', 'none');
                    phoneCheck = true;
                }

                // 이메일 유효성 검사
                if (mail == "") {
                    $('.email_err_2').css('display', 'block');
                    mailCheck = false;
                } else {
                    $('.email_err_2').css('display', 'none');
                    mailCheck = true;
                }

                // 이메일 인증번호 유효성 검사
                if (mailck == "") {
                    $('.emailck_err').css('display', 'block');
                    mailCheck = false;
                } else {
                    $('.emailck_err').css('display', 'none');
                    mailCheck = true;
                }

                // 주소 유효성 검사
                if (addr == "") {
                    $('.address_err').css('display', 'block');
                    addressCheck = false;
                } else {
                    $('.address_err').css('display', 'none');
                    addressCheck = true;
                }

                // 최종 유효성 검사 (모든 check 값들이 true일 경우)
                if (idCheck && idckCheck && pwCheck && pwckCheck && pwckcorCheck && nameCheck
                    && birthCheck && phoneCheck && mailCheck && mailnumCheck && addressCheck) {
                    if (confirm("해당정보로 회원가입을 진행하시겠습니까?")) {
                        alert("회원가입이 완료되었습니다.")
                        $("#join_form").attr("onsubmit", "return true;");
                        $("#join_form").attr("action", "${pageContext.request.contextPath}/member/signUpSuccess.do");
                        $("#join_form").submit();
                    } else {
                        alert("취소되었습니다.")
                    }

                }

                return false;

            });
        }); //회원가입 전송 함수 종료



        // 아이디 중복 검사
        $(".id_input").on("propertychange change keyup paste input", function () {

            let userId = $(".id_input").val();  // .id_input에 입력되는 값

            let data = {	// '컨트롤에 넘길 데이터 이름' : '데이터 (.id_input 값)'
                userId: userId
            };

            if (userId.length > 5 && userId.length < 13) { // 아이디가 6 ~ 12글자일 때 중복 아이디 검사

                $(".id_err_2").css("display", "none");  // 충족시 6~12자 에러 안뜸
                idCheck = true;

                $.ajax({

                    type: "post",
                    url: "${pageContext.request.contextPath}/member/memberIdChk.do",
                    data: data,
                    success: function (result) {

                        if (result != "fail") {

                            $(".id_correct").css("display", "inline-block");
                            $(".id_err_1").css("display", "none");
                            idckCheck = true; // 아이디 중복 검사 통과

                        } else {

                            $(".id_err_1").css("display", "inline-block");
                            $(".id_correct").css("display", "none");
                            idckCheck = false; // 아이디 중복 검사 불통과

                        }
                    }

                }); // ajax 종료
            } else {

                $(".id_err_2").css("display", "block");
                $(".id_correct").css("display", "none");
                $(".id_err_1").css("display", "none");
                idckCheck = false; // 아이디 중복 검사 불통과
                idCheck = false;

            }

        }); // 아이디 중복 검사 함수 종료



        // 인증 이메일 전송
        $(".email_btn").click(function () {

            let userEmail = $(".mail_input").val(); // 입력한 이메일
            let checkBox = $(".mailck_input"); //인증번호 입력란

            // 이메일 형식 유효성 검사
            if (mailFormCheck(userEmail)) {
            	
            	// 유효성 통과 시 유효성 불통과 에러 미출력
            	$(".email_err_1").css("display", "none");
                let data = {
                		userEmail: userEmail
                }
                
                // 이메일 중복 검사
                $.ajax({

                    type: "post",
                    url: "${pageContext.request.contextPath}/member/mailCheck.do",
                    data: data,
                    success: function (result) {

                    	// 이메일이 중복이 아닐 시 에러 코드 none, 인증 번호 입력란 사용, code에 인증번호 삽입
                        if (result != "fail") {
                        	
                        	$(".email_btn").attr("disabled", "disabled");
                        	
                        	$('.email_err_3').css('display', 'none');
                    		$(".email_correct").css("display", "block");
                    		
                    		checkBox.attr("disabled", false);
    	                    checkBox.focus();
    	                    code = result;
    	                    
                        } else {
							// 중복 이메일 있을 시 중복 이메일 에러 출력
                        	$('.email_err_3').css('display', 'block');
                    		$(".email_correct").css("display", "none");
                        }
                    }

                }); // ajax 종료
                
            } else {
            	// 이메일 형식 유효성 검사 불통과시 에러 출력
                $(".email_correct").css("display", "none");
                $('.email_err_3').css('display', 'none');
                $(".email_err_1").css("display", "block");
            }
            
        }); // 인증 이메일 전송 함수 종료


        // 인증번호 비교
        $(".mailck_input").on("propertychange change keyup paste input", function () {

            let inputCode = $(".mailck_input").val(); // 인증번호 입력 코드
            $('.emailck_err').css('display', 'none');

            if (inputCode == code) {
                $(".emailck_correct").css("display", "block");
                $(".emailck_err_2").css("display", "none");
                $(".mail_input").attr("readonly", "readonly");
                $(".mailck_input").attr("readonly", "readonly");
                mailnumCheck = true;

            } else {
                $(".emailck_correct").css("display", "none");
                $(".emailck_err_2").css("display", "block");
                mailnumCheck = false;
            }
        }); // 인증번호 비교 함수 종료

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
        
        
        // id 입력 시 특수문자 입력 불가
        $('.id_input').on("propertychange change keyup paste input", function () {

            let re = /[ \{\}\[\]\/?.,;:|\)*~`!^\-+┼<>@\#$%&\'\"\\\(\=]/gi;
            let temp = $(this).val();
            
            if (re.test(temp)) { //특수문자가 포함되면 삭제하여 값으로 다시셋팅
                $(this).val(temp.replace(re, ""));
            }
        })

        // 이름 입력 시 입력해달라는 문구 none;
        $('.name_input').on("propertychange change keypress paste input", function () {
			
            let re = /[a-z0-9]|[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=123456789]/gi;
            let temp = $(this).val();

            if (re.test(temp)) { //특수문자가 포함되면 삭제하여 값으로 다시셋팅
                $(this).val(temp.replace(re, ""));
            }

            if ($(this).val().length > 1) {
                $('.name_err').css('display', 'none');
            } else {
                $('.name_err').css('display', 'block');
            }

        });

        // 전화번호 형식에 맞게 입력 시 입력해달라는 문구 none;
        $('.phone_input').on("propertychange change keyup paste input", function () {
            $(this).val($(this).val().replace(/[^0-9]/gi, ""));

            if ($(this).val().length == 10 || $(this).val().length == 11) {
                $('.phone_err').css('display', 'none');
            } else {
                $('.phone_err').css('display', 'block');
            }

        });

        // 메일 입력 시 입력해달라는 문구 none;
        $('.mail_input').on("propertychange change keyup paste input", function () {
            let re = /[ \{\}\[\]\/?,;:|\)*~`!^\+┼<>\#$%&\'\"\\\(\=]/gi;
            let temp = $(this).val();
            $('.email_err_3').css('display', 'none');
            
            if (re.test(temp)) { //특수문자가 포함되면 삭제하여 값으로 다시셋팅
                $(this).val(temp.replace(re, ""));
            }

            if ($(this).val() == "") {
                $('.email_err_2').css('display', 'block');
            } else {
                $('.email_err_2').css('display', 'none');
            }

        });

        // 주소 입력 시 입력해달라는 문구 none;
        $('.address_input_3').on("propertychange change keyup paste input", function () {
        	let re = /[\{\}\[\]\/?.;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
             let temp = $(this).val();
             
             if (re.test(temp)) { //특수문자가 포함되면 삭제하여 값으로 다시셋팅
                 $(this).val(temp.replace(re, ""));
             }
             
            if ($(this).val() == "") {
                $('.address_err').css('display', 'block');
            } else {
                $('.address_err').css('display', 'none');
            }

        });

        // 인증번호 입력 시 입력해달라는 문구 none;
        $('.mailck_input').on("propertychange change keyup paste input", function () {
            $('.emailck_err').css('display', 'none');
        });

        // 생일 입력 시 입력해달라는 문구 none;
        $('.birth_input').on("propertychange change keyup paste input", function () {
            $('.birth_err').css('display', 'none');
        });


        // 이메일 형식 유효성 검사
        function mailFormCheck(email) {
            let form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
            return form.test(email);
        }

        // 다음 주소API 연동
        function execution_daum_address() {

            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }

                        // 주소 변수 문자열과 참고항목 문자열 합치기
                        addr += extraAddr;

                    } else {
                        adder += ' ';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    $(".address_input_1").val(data.zonecode);
                    //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
                    $(".address_input_2").val(addr);
                    //$("[name=memberAddr2]").val(addr);            // 대체가능

                    // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
                    $(".address_input_3").attr("readonly", false);
                    $(".address_input_3").focus();
                }
            }).open();
        }
    </script>

</body>

</html>