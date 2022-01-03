<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 회원관련 > 회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/member/signupCheck.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
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
                            <a href="${pageContext.request.contextPath}/member/signUpCheck.do">회원가입</a>
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
                	<h2>라온 도서관 회원 이용약관</h2>
					<div class="box">
						<b>제1장 총칙</b>
						<br><br>
						<b>제1조 (목적)</b>
						<br>
						<span>본 약관은 『라온 도서관 시스템』을 구축에 따라  회원 정보를 통합 운영함에 있어 이용자와 도서관간의 이용조건 및 절차, 
						이용에 관한 권리와 의무 등 제반사항을 규정함을 목적으로 한다. </span>
						<br><br>
						<b>제2조 (용어)</b>
						<br>
						<span>
						① 본 약관에서 사용하는 용어의 정의는 다음과 같다.<br>
						1. 서비스 : 온라인사이트 이용 및 오프라인도서관 이용 모두를 의미<br>
						2. 사이트 : 도서관에서 운영하는 홈페이지<br>
						3. 아이디(ID) : 회원 식별과 서비스 이용을 위하여 이용자가 생성한 영문자 또는 기타 문자로 조합된 부호<br>
						4. 비밀번호(PASSWORD) : 회원의 정보 보호를 위해 이용자 자신이 설정한 문자와 숫자, 특수문자 등으로 조합된 부호<br>
						② 본 약관에서 사용하는 용어의 정의는 제1항에서 정하는 것을 제외하고는 관계법령 및 서비스 별 안내에서 정하는 바에 의한다.
						</span>
						<br><br>
						<b>제3조 (약관의 효력 및 변경)</b>
						<br>
						<span>
						① 본 약관은 서비스 화면에 게시하거나 기타의 방법으로 이용자에게 공시되며, 이를 동의한 이용자가 서비스에 가입함으로써 효력이 발생한다.<br>
						② 합리적인 사유가 발생할 경우 도서관은 관련 법령에 위배되지 않는 범위 안에서 개정할 수 있다. 개정된 약관은 사이트 등을 통해 공지함으로써 효력이 발생한다.<br>
						③ 회원은 정기적으로 사이트를 방문하여 약관의 변경사항을 확인하여야 하며 회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴(해지)를 요청할 수 있다. 변경된 약관에 대한 정보를 알지 못해 발생하는 회원의 피해는 도서관에서 책임지지 않는다.<br>
						④ 도서관은 필요한 경우 개별 서비스에 대하여 이용규정을 정할 수 있으며, 본 약관과 서로 상충되는 경우에는 서비스별 이용규정의 내용을 우선하여 적용한다.<br>
						⑤ 본 약관에 명시되지 않은 사항에 대해서는 관련 법령의 규정에 의한다.
						</span>
						<br><br><br>
						<b>제2장 서비스 이용계약</b>
						<br><br>
						<b>제4조 (이용계약의 성립)</b>
						<br>
						<span>
						① 이용계약은 이용자의 약관내용 및 개인정보 제공에 대한 동의와 이용자의 이용신청에 대한 도서관 관리자의 승낙으로 성립한다.<br>
						② 이용계약에 대한 동의는 이용 신청 당시 사이트의 ‘동의함’ 버튼을 누름으로써 의사표시를 한다.
						</span>
						<br><br>
						<b>제5조 (회원 자격) 회원은 다음 각 호의 어느 하나에 해당하는 경우 그 자격을 가진다.</b>
						<br>
						<span>
						1. 대구광역시(경산시, 칠곡군 포함)에 주민등록이 되어 있는 자<br>
						2. 대구광역시 소재 직장에 재직하는 자<br>
					  	3. 대구광역시(경산시, 칠곡군 포함)소재 학교에 재학하는 자<br>
					  	4. 대구광역시에 거주하는 재외동포 국내거소 신고자 및 외국인 등록자<br>
					  	5. 그밖에 관장이 필요하다고 인정하는 자
						</span>
						<br><br>
						<b>제6조 (회원 가입 및 탈퇴)</b>
						<br>
						<span>
						① 이용자는 도서관에서 제공하는 홈페이지에서 개인정보 수집 및 정보 제공을 동의한 후 회원가입을 신청할 수 있다.
						</span>
						<br><br>
						<p style="text-align: center;"><도서관 통합회원 개인정보 수집 정보, 목적 및 보유기간></p>
						<table style="width: 911px; text-align: center; border-top: 2px solid #464646;">
							<tr>
								<td style="border-right: 1px solid #e5e8eb; background-color: #F8F8F8;">항목</td>
								<td style="border-right: 1px solid #e5e8eb; background-color: #F8F8F8;">수집목적</td>
								<td style="background-color: #F8F8F8;">보유기간</td>
							</tr>
							<tr>
								<td style="border-top: 1px solid #e5e8eb; border-right: 1px solid #e5e8eb;">아이디, 비밀번호, 성명, 생년월일, 휴대폰번호, 이메일, 주소, 도서대출내역</td>
								<td style="border-top: 1px solid #e5e8eb; border-right: 1px solid #e5e8eb;">도서대출 및 반납 등 도서관 서비스</td>
								<td style="border-top: 1px solid #e5e8eb;">회원 탈퇴시 까지</td>
							</tr>
						</table>
						<br>
						<span>
						② 회원 가입과 동시에 라온도서관 회원으로 가입된다.<br>
						③ 도서관 관리자는 제6조 ①항에서 정한 사항을 정확히 기재하여 이용신청을 하였을 경우 특별한 사정이 없는 한 서비스 이용신청을 승낙하여야 한다. 단, 다음의 경우 회원 가입을 취소할 수 있다.<br>
						　1. 본인의 실명으로 신청하지 않았을 때<br>
						　2. 다른 사람의 명의를 사용하여 신청하였을 때<br>
						　3. 신청서의 내용을 허위로 기재하였을 때<br>
						　4. 사회의 안녕 질서 또는 미풍양속을 저해할 목적으로 신청하였을 때<br>
						　5. 다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 경우<br>
						　6. 서비스를 이용함에 법령과 본 약관이 금지하는 행위를 하는 경우<br>
						　7. 기타 도서관이 정한 신청 요건이 미비 되었을 때<br>
						<br>
						④ 회원탈퇴 시 해당 회원과 관련된 모든 개인정보는 보유기간이 만료되므로 삭제된다.
						</span>
						<br><br>
						<b>제7조 (회원 정보 관리)</b>
						<br>
						<span>
						① 회원은 홈페이지 회원정보관리 및 도서관에 직접 방문하여 정보를 열람하고 수정할 수 있다.<br>
						② 회원의 개인정보에 대한 관리책임은 회원에게 있다. 이를 소홀히 관리하여 발생하는 서비스 이용상의 손해 또는 제3자에 의한 부정 이용 등에 대한 책임은 모두 회원에게 있으며 도서관은 그에 대해 책임지지 않는다.<br>
						③ 도서관은 보안 및 아이디 정책, 서비스의 원활한 제공 등과 같은 이유로 회원 아이디 및 비밀번호 변경을 요구할 수 있다.
						</span>
						<br><br>
						<b>제8조 (회원 자격 상실 및 회원정보 삭제)</b>
						<br>
						<span>
						① 회원은 개인정보보호법 제21조 및 동법 시행령 제16조에 의거하여 다음의 경우 회원 자격을 상실하며, 개인정보도 삭제된다.<br>
						　1. 본인이 탈퇴를 원하는 경우<br>
						　2. 회원의 법령 또는 약관의 위반을 포함하여 부정행위 확인 등의 정보보호 업무를 위해 필요한 경우<br>
						② 다음의 경우 탈퇴 신청은 제한되며, 개인정보 또한 삭제되지 않는다. 단, 제한사유가 소멸되면 즉시 탈퇴할 수 있다.<br>
						　1. 도서관으로 반납할 자료가 있거나 대출정지 중인 경우<br>
						　2. 대출 자료를 분실 혹은 훼손하고 변상하지 않은 경우<br>
						　3. 기타 회원탈퇴 제한이 필요하다고 도서관장이 인정하는 경우
						</span>
						<br><br>
						<b>제9조 (개인정보의 보호 및 사용)</b>
						<br>
						<span>
						① 도서관은 회원정보를『개인정보보호법』에 의해 보호한다.<br>
						② 회원의 개인정보는 오직 본인만이 열람/수정/삭제 하는 것을 원칙으로 하되, 비밀번호 등이 타인에게 노출되지 않도록 철저히 관리해야한다.<br>
						③ 도서관은 서비스 제공과 관련해서 수집된 회원의 개인정보를 본인의 동의 없이 제3자에게 제공되지 않는다. 다만, 개인정보보호법 제18조에 의거 제3자에게 제공할 수 있다.<br>
						　1. 수사기관이나 기타 다른 정부기관으로부터 정보제공을 요청 받은 경우<br>
						　2. 회원의 법령 또는 약관의 위반을 포함하여 부정행위 확인 등의 정보보호 업무를 위해 필요한 경우<br>
						　3. 기타 법률에 의해 요구되는 경우
						</span>
						<br><br><br>
						<b>제3장 서비스 제공 및 이용</b>
						<br><br>
						<b>제10조 (서비스의 제공)</b>
						<br>
						<span>
						① 도서관 관리자는 회원의 이용신청을 승낙한 때부터 서비스를 개시한다. 단, 일부 서비스의 경우에는 지정된 일자부터 서비스를 개시할 수 있다.<br>
						② 업무상 또는 기술상의 장애로 인하여 서비스를 개시하지 못하는 경우에는 사이트에 공지하거나 회원에게 이를 통지한다.<br>
						③ 도서관은 긴급한 시스템 점검, 교체, 설비의 장애, 서비스 이용의 폭주, 국가비상사태, 정전 등 부득이한 사유가 발생한 경우 사전 예고없이 일시적으로 서비스의 전부 또는 일부를 중단할 수 있다.<br>
						④ 도서관은 서비스 개편 등 서비스 운영 상 필요한 경우 회원에게 사전 예고 후 서비스의 전부 또는 일부의 제공을 중단 할 수 있다.
						</span>
						<br><br>
						<b>제11조 (서비스의 변경)</b>
						<br>
						<span>
						① 도서관은 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 서비스를 변경할 수 있다.<br>
						② 도서관은 정책 및 운영의 필요에 따라 사전공지를 통해 무료로 제공되는 서비스의 일부 또는 전부를 수정, 중단, 변경할 수 있으며, 이용회원에게는 별도의 보상을 하지 않는다.
						</span>
						<br><br>
						<b>제12조 (정보의 제공)</b>
						<span>
						회원에게 서비스 이용 중 필요가 있다고 인정되는 다양한 정보에 대해서는 전자우편 및 휴대폰 문자메시지 등의 방법으로 제공할 수 있다.
						</span>
						<br><br><br>
						<b>제4장 계약 당사자의 의무</b>
						<br><br>
						<b>제13조 (도서관의 의무)</b>
						<br>
						<span>
						① 도서관은 회원이 희망한 서비스 제공 개시일에 특별한 사정이 없는 한 서비스를 이용할 수 있도록 하여야 한다.<br>
						② 도서관은 계속적이고 안정적인 서비스의 제공을 위하여 설비에 장애가 생기거나 멸실된 때에는 부득이한 사유가 없는 한 지체 없이 이를 수리 또는 복구해야 한다.<br>
						③ 도서관은 회원이 안전하게 서비스를 이용할 수 있도록 개인정보보호를 위한 보안시스템을 구축하며 개인정보 보호정책을 공시하고 준수하여야 한다.<br>
						④ 도서관은 회원으로부터 제기되는 의견이나 불만이 정당하다고 객관적으로 인정될 경우에는 적절한 절차를 거쳐 즉시 처리하여야 한다. 다만, 즉시 처리가 곤란한 경우는 회원에게 그 사유와 처리일정을 통보하여야 한다.
						</span>
						<br><br>
						<b>제14조 (회원의 의무)</b>
						<br>
						<span>
						① 회원은 회원가입 신청 또는 회원정보 변경 시 모든 사항을 사실에 근거하여 본인의 정확한 정보로 작성하여야 하며, 허위 또는 타인의 정보를 등록할 경우 이와 관련된 모든 권리를 주장할 수 없다.<br>
						② 회원은 관계 법령, 본 약관의 규정, 이용 안내 및 도서관이 공지한 주의사항, 도서관이 통지하는 사항 등을 준수하여야 한다.<br>
						③ 회원은 본인의 회원ID와 비밀번호를 제3자에게 이용하게 해서는 안 되며, 이용계약사항이 변경된 경우에 해당 절차를 거쳐 이를 도서관에 즉시 알려야 한다.<br>
						④ 회원은 도서관의 명시적 동의가 없는 한 서비스의 이용권한, 기타 이용계약상의 지위를 타인에게 양도, 증여할 수 없으며 이를 담보로 제공할 수 없다.<br>
						⑤ 회원은 도서관 서비스를 이용하여 얻은 정보를 도서관의 사전승낙 없이 복사, 복제, 변경, 번역, 출판·방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없다.<br>
						⑥ 회원은 도서관 및 제 3자의 지적 재산권을 포함한 제반 권리를 침해하거나 다음 각 호의 행위를 하여서는 안 됩니다.<br>
						　1. 다른 회원의 ID를 부정 사용하는 행위<br>
						　2. 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위<br>
						　3. 선량한 풍속, 기타 사회질서를 해하는 행위<br>
						　4. 타인의 명예를 훼손하거나 모욕하는 행위<br>
						　5. 타인의 지적재산권 등의 권리를 침해하는 행위<br>
						　6. 해킹행위 또는 컴퓨터바이러스의 유포행위<br>
						　7. 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위<br>
						　8. 서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위
						</span>
						<br><br><br>
						<b>제5장 손해배상 및 기타</b>
						<br><br>
						<b>제15조 양도금지</b>
						<br>
						<span>
						회원은 서비스의 이용권한, 기타 이용계약상의 지위를 타인에게 양도, 증여할 수 없다.
						</span>
						<br><br>
						<b>제16조 (손해배상)</b>
						<br>
						<span>
						도서관은 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 이에 대하여 책임을 지지 않는다. 다만, 중대한 과실에 의한 경우에는 그러하지 아니한다.
						</span>
						<br><br>
						<b>제17조 (면책조항)</b>
						<br>
						<span>
						① 도서관은 천재지변, 전쟁, 기간통신사업자의 서비스 중지 및 기타 이에 준하는 불가항력으로 인하여 서 비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제된다.<br>
						② 도서관은 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이 면제된다.
						③ 도서관은 회원의 컴퓨터 오류 등 회원의 귀책사유로 인한 서비스 이용 장애에 대해서는 책임을 지지 않는다.<br>
						④ 도서관은 회원이 서비스를 이용하여 기대하는 이익이나 서비스를 통해 얻은 자료로 인한 손해는 책임을 지지 않는다.<br>
						⑤ 도서관은 회원이 서비스에 게재한 각종 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 대하여 책임을 지지 않으며, 회원 상호간 및 회원과 제 3자 상호 간에 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없고, 이로 인한 손해를 배상할 책임도 없다.<br>
						⑥ 도서관은 회원의 게시물을 등록 전에 사전심사 하거나 상시적으로 게시물의 내용을 확인 또는 검토하여야 할 의무가 없으며, 그 결과에 대한 책임을 지지 않는다.
						</span>
						<br><br><br>
						<b><부 칙></b>
						<br>
						<span>
						본 약관은 2021년 12월 01일부터 적용한다
						</span><br><br>
					</div>
					<div style="float: right;">
						<input id="agree_check" type="checkbox"> 회원 이용약관에 동의합니다.
					</div>
					<br>
					<div style="display: flex; justify-content: center; align-items: center;">
						<form id="" method="POST" onsubmit="return false;">
	                        <div class="join_button_wrap">
	                            <input type="button" class="agree_button" value="동의합니다">
	                            <input type="button" class="not_agree_button" value="동의하지 않습니다">
	                        </div>
	                    </form>
					</div>
                </div>
            </div>
        </div>
    </div>

    <!-- footer -->

    <script>

        $(".sub2").addClass("active");
        
        $(function(){
        	$(".agree_button").on("click", function(){
        		
        		let check = document.getElementById('agree_check').checked;
        		
        		if(check) {
        			$("form").attr("action", "${pageContext.request.contextPath}/member/signUp.do");
        			$("form").attr("onsubmit", "return true;");
        			$("form").submit();
        		} else {
        			alert("회원 이용약관에 동의해주세요");
        		}
        	});
        	
			$(".not_agree_button").on("click", function(){
        		window.location.href="${pageContext.request.contextPath}";
        	});
        	
        });

    </script>

</body>

</html>