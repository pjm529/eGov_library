<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 회원관련 > 아이디찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/searchId.css">
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
                    <h3>아이디찾기</h3>
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
                            <a href="${pageContext.request.contextPath}/member/searchId.do">아이디찾기</a>
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

                    <form id="search_id_form" method="POST" onsubmit="return false;">

                        <table>
                            

                            <!-- name -->
                            <tr>
                                <th class="first">
                                    <span style="color: red;">*</span>
                                    	이름
                                </th>
                                <td class="last">
                                    <input class="name_input" autocomplete="off" name="userName"> <br>
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

                        </table>

                        <div class="search_id_button_wrap">
                            <input type="button" class="search_id_button" value="아이디 찾기">
                        </div>
                    </form>

                </div>

            </div>
        </div>
    </div>
	<!-- footer -->
	<jsp:include page="../../layout/footer.jsp"></jsp:include>

    <script>
    
   		$(".sub3").addClass("active");

        // 유효성 검사 통과 유무 변수
        let nameCheck = false;            // 이름
        let birthCheck = false;            // 이름
        let phoneCheck = false;            // 전화번호

        // 회원가입 전송
        $(document).ready(function () {

            $(".search_id_button").click(function () {

                let name = $('.name_input').val();            // 이름 입력란
                let birth = $('.birth_input').val();            // 생년월일 입력란
                let phone = $('.phone_input').val();            // 전화번호 입력란


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

                // 최종 유효성 검사 (모든 check 값들이 true일 경우)
                if ( nameCheck && birthCheck && phoneCheck) {
                	
            		let data = {
            				userName: name,
            				userBirth: birth,
            				userTel: phone
            		};
            		
            		$.ajax({
            			type: "post",
            			url: "${pageContext.request.contextPath}/member/searchIdCheck.do",
            			data: data,
            			success: function(result) {
            				
            				if (result == "success") {
            					
            					$("#search_id_form").attr("onsubmit", "return true;");
                                $("#search_id_form").attr("action", "${pageContext.request.contextPath}/member/searchId.do");
                                $("#search_id_form").submit();
                                
            				} else {
            					alert("일치하는 회원이 존재하지 않습니다.");
            					window.location.href='${pageContext.request.contextPath}/member/searchId.do';
            				}
            				
            			}
            		});
                    
                }

                return false;

            });
        }); //아이디찾기 함수 종료


        // 이름 입력 시 입력해달라는 문구 none;
        $('.name_input').on("propertychange change keyup paste input", function () {
            let re = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=123456789]/gi;
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
        // 생일 입력 시 입력해달라는 문구 none;
        $('.birth_input').on("propertychange change keyup paste input", function () {
            $('.birth_err').css('display', 'none');
        });


    </script>

</body>
</html>