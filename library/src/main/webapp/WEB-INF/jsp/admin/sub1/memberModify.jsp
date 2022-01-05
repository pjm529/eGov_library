<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 관리자 > 회원관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/sub1/memberModify.css">
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
                    <h3>회원관리</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="" style="background-image: none;">
                            <a href="${pageContext.request.contextPath}">
                                <img src="${pageContext.request.contextPath}/images/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/memberList.do">관리자</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/memberList.do">회원관리</a>
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
                                   	 아이디
                                </th>
                                <td class="last">
                                    <input class="id_input" autocomplete="off" name="userId" value="${member.userId}"
                                        readonly> <br>
                                </td>
                            </tr>

                            <!-- name -->
                            <tr>
                                <th class="first">
                                    <span style="color: red;">*</span>
                                	    이름
                                </th>
                                <td class="last">
                                    <input class="name_input" autocomplete="off" name="userName"
                                        value="${member.userName}" maxlength="10"> <br>
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
                                        max="9999-12-31" value="${member.userBirth }">
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
                                    <input class="phone_input" autocomplete="off" maxlength="11" name="userTel"
                                        value="${member.userTel }"> <br>
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
                                    <input class="mail_input" style="width: 50%;" autocomplete="off" name="userEmail"
                                        value="${member.userEmail }" readonly>
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
                                                readonly="readonly" autocomplete="off" name="userZip"
                                                value="${member.userZip }">
                                            <button class="zip_btn" onclick="execution_daum_address()">우편번호 찾기</button>
                                        </p>
                                        <p>
                                            <input class="address_input_2" style="width: 80%; margin-bottom: 5px;"
                                                readonly="readonly" autocomplete="off" name="userAddress"
                                                value="${member.userAddress }">
                                            <input class="address_input_3" style="width: 80%; margin-bottom: 3px;"
                                                autocomplete="off" name="userAddressDetail"
                                                value="${member.userAddressDetail }" maxlength="30"> <br>
                                            <span class="address_err">주소를 입력해주세요.</span>
                                        </p>
                                    </div>
                                </td>
                            </tr>
                            
                            <!-- able_loan -->
                            <tr>
                                <th class="first">
                                <span style="color: red;">*</span>
                                	    대출 가능 도서 수
                                </th>
                                <td class="last">
                                
									<input class="able_loan_input" autocomplete="off" name="userAbleLoan"
                                    value="${member.userAbleLoan }"> <br>
                                    <span class="able_loan_err">대출가능 도서 수를 입력해주세요.</span>
                                </td>
                            </tr>

                            <!-- book_count -->
                            <tr>
                                <th class="first">
                                    <span style="color: red;">*</span>
                             	       대출 중 도서 수
                                </th>
                                <td class="last">

                                    <input class="book_count_input" autocomplete="off" name="userBookCount"
                                        value="${member.userBookCount }" readonly> <br>

                                </td>
                            </tr>

                            <!-- overdue_date -->
                            <tr>
                                <th class="first">
                                    <span style="color: red;">*</span>
                                	    대출불가
                                </th>
                                <td class="last">
                                    <input class="overdue_input" autocomplete="off" name="userOverdueDate"
                                        value="${member.userOverdueDate }"> <br>
                                    <span class="overdue_err">대출불가 일 수를 입력해주세요.</span>
                                </td>
                            </tr>

                        </table>

                        <input type="hidden" name="amount" value="${cri.amount }">
                        <input type="hidden" name="page" value="${cri.page }">
                        <input type="hidden" name="type" value="${cri.type }">
                        <input type="hidden" name="keyword" value="${cri.keyword }">
                        <br>
                        <button id="modify_btn" class="btn">수정</button>
                    </form>

                    <div class="member_list_wrap">
                        <form action="${pageContext.request.contextPath}/admin/memberList.do" method="get">
                            <input type="hidden" name="amount" value="${cri.amount }">
                            <input type="hidden" name="page" value="${cri.page }">
                            <input type="hidden" name="type" value="${cri.type }">
                            <input type="hidden" name="keyword" value="${cri.keyword }">
                            <button class="btn">목록</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <!-- footer -->
    <jsp:include page="../../layout/footer.jsp"></jsp:include>

    <!-- 주소록 api를 위한 script -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script>
        let code = ""; // 이메일 전송 인증번호 저장을 위한 변수

        // 유효성 검사 통과 유무 변수
        let nameCheck = false;            // 이름
        let birthCheck = false;            // 이름
        let phoneCheck = false;            // 전화번호
        let addressCheck = false;         // 주소
        let overdueCheck = false;       // 대출 불가 일 수
		let ableCheck = false;			// 대출 가능 도서 수

        // 회원가입 전송
        $(document).ready(function () {

            $(".sub1").addClass("active");

            $("#modify_btn").click(function () {
                /* 입력값 변수 */
                let name = $('.name_input').val();            // 이름 입력란
                let birth = $('.birth_input').val();            // 생년월일 입력란
                let phone = $('.phone_input').val();            // 전화번호 입력란
                let addr = $('.address_input_3').val();        // 주소 입력란
                let overdue = $('.overdue_input').val();        // 대출 불가 일 입력란
				let able_loan = $('.able_loan_input').val();  // 대출 가능 도서수 입력란
				

                // 최종 유효성 검사
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

                // 주소 유효성 검사
                if (addr == "") {
                    $('.address_err').css('display', 'block');
                    addressCheck = false;
                } else {
                    $('.address_err').css('display', 'none');
                    addressCheck = true;
                }

                // 대출불가 유효성 검사
                if (overdue == "") {
                    $('.overdue_err').css('display', 'block');
                    overdueCheck = false;
                } else {
                    $('.overdue_err').css('display', 'none');
                    overdueCheck = true;
                }
                
				// 대출 가능 도서 수 유효성 검사
				if (able_loan == "") {
                    $('.able_loan_err').css('display', 'block');
                    ableCheck = false;
                } else {
                    $('.able_loan_err').css('display', 'none');
                    ableCheck = true;
                }
				
                // 최종 유효성 검사 (모든 check 값들이 true일 경우)
                if (nameCheck && birthCheck && phoneCheck && addressCheck && overdueCheck && ableCheck) {
                    if (confirm("회원 정보를 수정하시겠습니까?")) {
                        alert("수정이 완료되었습니다.");
                        $("#modify_form").attr("onsubmit", "return true;");
                        $("#modify_form").attr("action", "${pageContext.request.contextPath}/admin/memberModify.do");
                        $("#modify_form").submit();
                    } else {
                        alert("취소 되었습니다.");
                    }

                }

                return false;

            });
        }); 


        // 이름 입력 시 입력해달라는 문구 none;
        $('.name_input').on("propertychange change keyup paste input", function () {

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


        // 대출 일수 형식에 맞게 입력 시 입력해달라는 문구 none;
        $('.overdue_input').on("propertychange change keyup paste input", function () {
            $(this).val($(this).val().replace(/[^0-9]/gi, ""));

            if ($(this).val().length != 0) {
                $('.overdue_err').css('display', 'none');
            } else {
                $('.overdue_err').css('display', 'block');
            }

        });
        
     	// 대출 가능 도서 수 형식에 맞게 입력 시 입력해달라는 문구 none;
        $('.able_loan_input').on("propertychange change keyup paste input", function () {
            $(this).val($(this).val().replace(/[^0-9]/gi, ""));

            if ($(this).val().length != 0) {
                $('.able_loan_err').css('display', 'none');
            } else {
                $('.able_loan_err').css('display', 'block');
            }

        });

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