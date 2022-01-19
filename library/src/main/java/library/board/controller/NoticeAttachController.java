package library.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import library.board.domain.NoticeAttachForAjaxVO;
import library.common.DownloadView;
import library.common.util.PathUtil;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board")
public class NoticeAttachController {

	// 첨부할 파일 선택 시
	@PostMapping(value = "/uploadNoticeFileAjaxAction.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ModelAndView uploadNoticeFileAjaxPost(MultipartFile[] uploadNoticeFile, HttpServletRequest request) {

		ModelAndView mav = new ModelAndView("jsonView");

		// 경로
		String contextPath = request.getContextPath();
		String UPLOAD_PATH = PathUtil.path(contextPath) + File.separator + "notice"; // 업로드 경로

		List<NoticeAttachForAjaxVO> list = new ArrayList<>();
		String uploadFolder = UPLOAD_PATH;

		File uploadPath = new File(uploadFolder);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		for (MultipartFile multipartFile : uploadNoticeFile) {

			NoticeAttachForAjaxVO attachForAjaxVO = new NoticeAttachForAjaxVO();
			String uploadFileName = multipartFile.getOriginalFilename();

			// 파일명에 띄어쓰기 있을 시 _로 변경
			uploadFileName = uploadFileName.replace(" ", "_");

			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			attachForAjaxVO.setFileName(uploadFileName);

			// uuid 생성
			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				// 파일을 폴더에 저장
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				attachForAjaxVO.setUuid(uuid.toString());
				attachForAjaxVO.setUploadPath(uploadFolder);

				list.add(attachForAjaxVO);

			} catch (Exception e) {
				e.printStackTrace();
			}

			mav.setViewName("jsonView");
			mav.addObject(list);

		}
		return mav;
	}

	// 첨부할 파일 선택 취소 시 폴더에 저장된 파일 삭제
	@PostMapping("/deleteNoticeFile.do")
	@ResponseBody
	public ResponseEntity<String> deleteNoticeFile(String fileName, @RequestParam("uuid") String uuid,
			HttpServletRequest request) {

		// 경로
		String contextPath = request.getContextPath();
		String UPLOAD_PATH = PathUtil.path(contextPath) + File.separator + "notice"; // 업로드 경로
		String filePath = UPLOAD_PATH + File.separator;

		log.info("deleteFile: " + fileName);

		// 첨부파일 삭제
		File attachFile = new File(filePath + uuid);
		attachFile.delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	// 첨부 파일 다운로드
	@GetMapping("/downloadNoticeFile.do")
	public View downloadNoticeFile(String path, Model model, String fileName) {

		File file = new File(path);

		model.addAttribute("downloadFile", file);
		model.addAttribute("downloadFilename", fileName);

		return new DownloadView();
	}
}
