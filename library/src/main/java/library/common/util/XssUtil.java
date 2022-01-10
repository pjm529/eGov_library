package library.common.util;

public class XssUtil {
	public static String XssReplace(String str) {

		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("\"", "&quot;");
		str = str.replaceAll("'", "&apos;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");

		return str;
	}
}
