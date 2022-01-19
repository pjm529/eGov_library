package library.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		if (!model.containsKey("downloadFile")) {
			return;
		}

		File file = (File) model.get("downloadFile");

		if (file == null) {
			return;
		}

		String originFilename = String.valueOf(model.get("downloadFilename"));
		String filename = getFilename(request, originFilename);
		setResponse(response, filename, (int) file.length()); // 응답헤더설정

		try (OutputStream out = response.getOutputStream(); FileInputStream fis = new FileInputStream(file);) {

			FileCopyUtils.copy(fis, out); // 스프링에서 지원하는 FileCopyUtils
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}

	}

	private String getFilename(HttpServletRequest request, String originFilename) throws UnsupportedEncodingException {
		String filename = null;
		String userAgent = request.getHeader("User-Agent"); // 브라우저 확인을 위한 user-Agent 헤더 확인

		if (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1) { // 익스플로러일 경우

			filename = URLEncoder.encode(originFilename, "utf-8").replaceAll("\\+", "%20");

		} else if (userAgent.indexOf("Chrome") > -1) { // 크롬일 경우

			StringBuffer sb = new StringBuffer();
			for (char c : originFilename.toCharArray()) {
				if (c > '~') {
					sb.append(URLEncoder.encode(String.valueOf(c), "UTF-8"));
				} else {
					sb.append(c);
				}
			}

			filename = sb.toString();
		} else { // 그 외 브라우저의 경우
			filename = new String(originFilename.getBytes("utf-8"));
		}

		return filename;

	}

	private void setResponse(HttpServletResponse response, String filename, int contentLength) {
		response.setContentType(getContentType());
		response.setContentLength(contentLength);
		response.setHeader("Content-Disposition", String.format("attachment; filename=\"%s\";", filename));

		response.setHeader("Content-Transfer-Encoding", "binary");
	}

}
