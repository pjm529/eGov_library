package library.board.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import library.board.domain.NoticeAttachForAjaxVO;
import library.common.util.PathUtil;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board")
public class NoticeAttachController {

	public String UPLOAD_PATH = PathUtil.path("/library") + File.separator + "notice"; // 업로드 경로

	// 첨부할 파일 선택 시
	@PostMapping(value = "/uploadNoticeFileAjaxAction.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ModelAndView uploadNoticeFileAjaxPost(MultipartFile[] uploadNoticeFile) {

		ModelAndView mav = new ModelAndView("jsonView");

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

	// 첨부할 파일 썸네일 출력
	@GetMapping("/displayFiles.do")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String file_name) {

		File file = new File(file_name);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 첨부할 파일 선택 취소 시 폴더에 저장된 파일 삭제
	@PostMapping("/deleteNoticeFile.do")
	@ResponseBody
	public ResponseEntity<String> deleteNoticeFile(String fileName, String type, @RequestParam("uuid") String uuid) {

		log.info("deleteFile: " + fileName);

		fileDelete(uuid, type);

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	// 폴더 내 파일 삭제 함수(이미지일 경우 썸네일까지 삭제)
	public void fileDelete(String uuid, String type) {

		String filePath = UPLOAD_PATH + File.separator;

		File deleteFileName = new File(filePath + uuid);

		if (type.equals("image")) {
			String thumb = "s_" + uuid;
			File deleteThumbFileName = new File(filePath + thumb);
			deleteFileName.delete();
			deleteThumbFileName.delete();
		} else {
			deleteFileName.delete();
		}

	}
}
