package com.main.branch.util;

import org.jsoup.Jsoup;

public class Parser {
	public static String html2text(String html) {
		if(html == null)return "";
		else return Jsoup.parse(html).text();
	}
	public static String longStringToShort(String contents) {
		if(contents == null) {
			contents = "";
		}else {
			if(contents.length() > 40) {
				contents = contents.substring(0, 40);
				contents += "...";
			}	
		}
		return contents;
	}
}
