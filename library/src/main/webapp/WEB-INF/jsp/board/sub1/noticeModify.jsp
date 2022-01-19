<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
	<title>라온도서관 > 열린공간 > 공지사항</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/sub1/notice_write_page.css">
</head>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
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
                    <h3>공지사항</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li style="background-image: none;">
                            <a href="${pageContext.request.contextPath}">
                                <img src="${pageContext.request.contextPath}/images/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/board/noticeList.do">열린공간</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/board/noticeList.do">공지사항</a>
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

                            <fmt:formatDate var="noticeRegDate" value="${noticeContent.noticeRegDate}"
                                pattern="yyyy-MM-dd HH:ss" />

                            <div class="table-wrap">
                                <form action="${pageContext.request.contextPath}/board/noticeModify.do" method="post" onsubmit="return false" role="form">
                                    <input type="hidden" name="writerId" value="writerId">
                                    <input type="hidden" name="noticeNo" id="noticeNo"
                                        value="${noticeContent.noticeNo}">

                                    <input type="hidden" name="amount" value="${cri.amount}">
                                    <input type="hidden" name="page" value="${cri.page}">
                                    <input type="hidden" name="type" value="${cri.type}">
                                    <input type="hidden" name="keyword" value="${cri.keyword}">

                                    <table class="bbs-edit">
                                        <tbody>
                                            <tr>
                                                <th class="first">제목</th>
                                                <td colspan="3">
                                                    <input type="text" style="width: 80%; height: 27px;"
                                                        value="<c:out value='${noticeContent.noticeTitle}'/>" name="noticeTitle"
                                                         id="noticeTitle" autocomplete="off" maxlength="50">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="first">작성자</th>
                                                <td>관리자</td>
                                                <th class="first">작성일</th>
                                                <td>${noticeRegDate}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="padding: 8px 0px;">
                                                    <textarea id="popContent" name="noticeContent">
                                                    ${noticeContent.noticeContent}</textarea>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td colspan="4">
                                                    <div class="uploadDiv">
                                                        <input type="file" name="uploadNoticeFile" id="uploadNoticeFile"
                                                            multiple>
                                                        <input type="hidden" name="uuid" id="uuid">
                                                    </div>

                                                    <div class="uploadResult">
                                                        <ul>
                                                        	<c:forEach var="attach" items="${attachList}">
															<li data-path="${attach.uploadPath}" 
																data-uuid="${attach.uuid}" data-filename="${attach.fileName}" 
																data-type="${attach.fileType}">
                        										<div style='margin-top: 5px;'>
                        											<img src='${pageContext.request.contextPath}/images/board/sub1/file_icon.png' 
                        												width='20px' height='20px' style='vertical-align: middle;'>
                      												<span><c:out value="${attach.fileName}"/></span>
                        											<button type='button'class="${attach.uuid}_${attach.fileName}">x
                        											</button><br>
                       											</div>
                      										 </li>
                      										 </c:forEach>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>

                                        </tbody>

                                    </table>

                                    <!-- 글쓰기 btn -->
                                    <div class="write">
                                        <button class="write_btn" type="submit">수정완료</button>
                                        <!-- <button class="list_btn" onclick="location.href='/noticeList'">목록으로</button> -->
                                    </div>

                                </form>

                                <div class="list_wrap">
                                    <form action="${pageContext.request.contextPath}/board/noticeList.do" method="get">
                                        <input type="hidden" name="amount" value="${cri.amount}">
                                        <input type="hidden" name="page" value="${cri.page}">
                                        <input type="hidden" name="type" value="${cri.type}">
                                        <input type="hidden" name="keyword" value="${cri.keyword}">
                                        <button class="list_btn">목록으로</button>
                                    </form>
                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>
    
    <!-- footer -->
    <jsp:include page="../../layout/footer.jsp"></jsp:include>
    
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
<script>
    $(function () {

    	CKEDITOR.replace('popContent', {
            filebrowserImageUploadUrl: "${pageContext.request.contextPath}/imageUpload.do?boardName=notice",
            height: 500
        });

        $(".sub1").addClass("active");


        $(".write_btn").on("click", function () {
        	
        	var noticeTitle = $("#noticeTitle").val();

            if (noticeTitle == "") {

                $("#noticeTitle").focus();

                return false;
            }

            if (confirm('수정하시겠습니까?')) {
                $("form").attr("onsubmit", "result true");
                $("form").submit();
            }
        });
        
        /* 파일 업로드 */
        /* input 태그에 업로드할 파일 정보 담아서 form submit */
        var formObj = $("form[role='form']");

        $("button[type='submit']").on("click", function (e) {

            e.preventDefault();

            var str = "";

            $(".uploadResult ul li").each(function (i, obj) {

                var jobj = $(obj);

                str += "<input type='hidden' name='noticeAttachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
                str += "<input type='hidden' name='noticeAttachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
                str += "<input type='hidden' name='noticeAttachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
                str += "<input type='hidden' name='noticeAttachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";

            });

            formObj.append(str).submit();

        });


        /* 용량, 파일 형식 지정 */
        var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
        var maxSize = 5242880; //5MB

        function checkExtension(fileName, fileSize) {

            if (fileSize >= maxSize) {
                alert("파일 사이즈 초과");
                return false;
            }

            if (regex.test(fileName)) {
                alert("해당 종류의 파일은 업로드할 수 없습니다.");
                return false;
            }
            return true;
        }


        /* 선택한 파일을 지정된 폴더에 저장 */
        $("input[type='file']").change(function (e) {

            var formData = new FormData();
            var inputFile = $("input[name='uploadNoticeFile']");
            var files = inputFile[0].files;

            for (var i = 0; i < files.length; i++) {

                if (!checkExtension(files[i].name, files[i].size)) {
                    return false;
                }
                formData.append("uploadNoticeFile", files[i]);
            }

            $.ajax({
                url: '${pageContext.request.contextPath}/board/uploadNoticeFileAjaxAction.do',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                dataType: 'json',
                success: function (result) {
                	console.log(result);
                    showUploadResult(result.noticeAttachForAjaxVOList); //업로드 결과 처리 함수 

                }
            }); //$.ajax

        });

        /* 첨부 파일 선택했을 때 */
        function showUploadResult(uploadResultArr) {

            /* 아무것도 선택 안했으면 리스트에 아무것도 안담김 -> 그냥 리턴 */
            if (!uploadResultArr || uploadResultArr.length == 0) {
                return;
            }

            var uploadUL = $(".uploadResult ul");

            var str = "";
            $(uploadResultArr).each(function (i, obj) {

                var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
                var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
                var uuidName = obj.uuid + "_" + obj.fileName;

                $("input[name='uuid']").attr('value', uuidName);

                str += "<li "
                str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "' >";
                str += "<div style='margin-top: 5px;'>";
                str += "<img src='${pageContext.request.contextPath}/images/board/sub1/file_icon.png' width='20px' height='20px' style='vertical-align: middle;'>";
                str += "<span> " + obj.fileName + " </span>";
                str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file'  class=" + obj.uuid + "_" + obj.fileName + ">x</button><br>";
                str += "</div>";
                str += "</li>";

            });

            uploadUL.append(str);
        }


        /* x버튼 눌렀을 때 첨부 파일 목록에서 사라짐 */
        $(".uploadResult").on("click", "button", function (e) {

            var uuid = $(this).attr("class");

            var targetFile = $(this).data("file");
            var type = $(this).data("type");

            var targetLi = $(this).closest("li");

            $.ajax({
                url: '${pageContext.request.contextPath}/board/deleteNoticeFile.do',
                data: { fileName: targetFile, type: type, uuid: uuid },
                dataType: 'text',
                type: 'POST',
                success: function (result) {
                    targetLi.remove();
                    $("#uploadNoticeFile").val("");
                }
            }); //$.ajax
        });
    });

</script>
</body>
</html>
