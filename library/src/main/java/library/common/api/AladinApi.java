package library.common.api;

import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

import library.search.domain.BookVO;


@Service
public class AladinApi {

	public List<BookVO> search(String query, String search_select, int page, int amount) throws ParseException {

		String ttbkey = "ttbpok0030002"; // 애플리케이션 클라이언트 아이디값"

		String text = null;
 
		try {
			text = URLEncoder.encode(query, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}

		String apiURL = "https://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=" + ttbkey
				+ "&Query=" + text 
				+ "&QueryType=" + search_select
        		+ "&Sort=accuracy"  
        		+ "&MaxResults=" + amount 
				+ "&start=" + page
				+ "&SearchTarget=Book&output=js&Version=20070901";

		Map<String, String> requestHeaders = new HashMap<>();
		String responseBody = get(apiURL, requestHeaders);

		String json = responseBody;
		json = json.replaceFirst(".$", "");
		json = json.replaceAll("coversum", "cover500");
		
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject) parser.parse(json);
		JSONArray item = (JSONArray) obj.get("item");
		
		List<BookVO> list = null;

		list = new ArrayList<BookVO>();

		for (int i = 0; i < item.size(); i++) {

			BookVO book = new BookVO();
			JSONObject tmp = (JSONObject) item.get(i);
			String title = (String) tmp.get("title");
			String author = (String) tmp.get("author");
			String isbn = (String) tmp.get("isbn13");
			String cover = (String) tmp.get("cover");
			String pubDate = (String) tmp.get("pubDate");
			String publisher = (String) tmp.get("publisher");
			book.setBookTitle(title);
			book.setBookAuthor(author);
			book.setBookIsbn(isbn);
			book.setBookCover(cover);
			book.setBookPubDate(pubDate);
			book.setBookPublisher(publisher);
			book.setTotal(((Long) obj.get("totalResults")).intValue());

			if (book != null)
				list.add(book);
		}

		return list;
	}

	public BookVO search_detail(String query) throws ParseException {

		String ttbkey = "ttbpok0030002"; // 애플리케이션 클라이언트 아이디값"

		String text = null;

		try {
			text = URLEncoder.encode(query, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}

		String apiURL = "https://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=" + ttbkey + "&Query=" + text
				+ "&QueryType=Title"
				+ "&Sort=accuracy&MaxResults=10&start=1&SearchTarget=Book&output=js&Version=20070901";

		Map<String, String> requestHeaders = new HashMap<>();
		String responseBody = get(apiURL, requestHeaders);

		String json = responseBody;
		json = json.replaceFirst(".$", "");
		json = json.replaceAll("coversum", "cover500");

		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject) parser.parse(json);
		JSONArray item = (JSONArray) obj.get("item");

		BookVO book = new BookVO();

		if (item.size() != 0) {

			JSONObject tmp = (JSONObject) item.get(0);
			String title = (String) tmp.get("title");
			String author = (String) tmp.get("author");
			String isbn = (String) tmp.get("isbn13");
			String cover = (String) tmp.get("cover");
			String pubDate = (String) tmp.get("pubDate");
			String publisher = (String) tmp.get("publisher");
			String description = (String) tmp.get("description");
			
			description = description.replace("\\", "");
			
			book.setBookTitle(title);
			book.setBookAuthor(author);
			book.setBookIsbn(isbn);
			book.setBookCover(cover);
			book.setBookPubDate(pubDate);
			book.setBookPublisher(publisher);
			book.setPriceStandard(((Long) tmp.get("priceStandard")).intValue());
			book.setDescription(description);
			

		}

		return book;
	}

	public String get(String apiUrl, Map<String, String> requestHeaders) {

		HttpURLConnection con = connect(apiUrl);

		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상흐름
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	public HttpURLConnection connect(String apiUrl) {

		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}

	}

	public String readBody(InputStream body) {

		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}

	}

}
