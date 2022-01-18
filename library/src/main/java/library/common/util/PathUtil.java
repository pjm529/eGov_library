package library.common.util;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.nio.file.Paths;

import lombok.extern.log4j.Log4j;

@Log4j
public class PathUtil {

	public static String path(String contextPath) {

		String os = System.getProperty("os.name"); // 서버 운영체제 (Mac OS X, Windows 10, ...)
		log.info("Server OS - " + os);

		// class path 를 url 형태로 얻음
		// "file:/C:/Users/Taedi/IdeaProjects/%ed%85%8c~~~/webapps/myapp/WEB-INF/classes/"
		// URL encodedPath = this.getClass().getResource("/"); //for non static method
		// URL encodedPath = ImageUtil.class.getClass().getResource("/");
		URL encodedPath = Thread.currentThread().getContextClassLoader().getResource("/");

		log.info(encodedPath.toString());

		// url 형식 디코딩
		// "/C:/Users/Taedi/IdeaProjects/테스트~~~/webapps/myapp/WEB-INF/classes/"
		String decodedPath = null;
		try {
			decodedPath = URLDecoder.decode(encodedPath.getFile(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		// 운영체제가 윈도우일 경우 경로 최상단의 '/' 제거
		if (os.contains("Windows")) {
			if (decodedPath.startsWith("/")) {
				decodedPath = decodedPath.replaceFirst("/", "");
			}
		}

		// 프로젝트가 배포 된 경로
		String deployPath = Paths.get(decodedPath).getParent().getParent().getParent().toString();
		log.info("deploying path - " + deployPath);

		// 이미지 업로드 경로 지정(프로젝트 배포 경로에 따라 판단)
		String uploadPath;
		if (deployPath.contains("webapps")) {
			// 배포 경로가 외부 서버일 경우
			uploadPath = deployPath + contextPath + File.separator + "uploadImage";
		} else {
			// 개발 환경일 경우(wtpwebapps, target, ...)
			uploadPath = Paths.get(decodedPath).getParent().getParent().toString() + File.separator + "resources"
					+ File.separator + "upload";

		}

		// 저장 경로가 없을 경우 생성시도
		File folder = new File(uploadPath);
		if (!folder.exists()) {
			try {
				folder.mkdir();
				log.info("mkDir - " + uploadPath);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		log.info("uploadPath - " + uploadPath);
		return uploadPath;
	}

}
